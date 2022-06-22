#include "UniversalTriggerShared.h"
#include "R76Firmware_lib.h"
#include "Def.h"
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <termios.h>
#include <unistd.h>
#include <string.h>
#include <getopt.h>

//Variables/*
//=======================================================================================
//Structs
const struct option longopts[] =
{
	{"gate",	required_argument,	0,	'g'},
	{"delay",	required_argument,	0,	'd'},
	{"inhibit",	required_argument,	0,	'i'},
	{"help",	no_argument,		0,	'h'},
	{"log",		optional_argument,	0,	'l'},
	{"quiet",	no_argument,		0,	'q'},
	{"silent",	no_argument,		0,	's'},
	{"verbose",	optional_argument,	0,	'v'},
	{"version",	no_argument,		0,	'V'},
	{"det",		required_argument,	0,	'D'},
	{"thresh",	required_argument,	0,	't'},
	{"top",		required_argument,	0,	'T'},
	{"range",	required_argument,	0,	'r'},
	{"reset",	no_argument,		0,	'R'},
	{"force",	no_argument,		0,	'f'},
	{"skip",	required_argument,	0,	'S'},
	{0,		0,			0,	0},
};

//Defaults
int verbose = 0;
int thrs = 4192;	        //amount LESS THAN 8192 for threshold.
uint32_t value = 4294967295;
int gate_u = 100; 
int gate_l = 0;
int range_l = 0;
int range_u = 4080;
int range_s = 40;
int delay = 50;
int inhib = 1000;
int baseline = 200;
int top = 16384;
//things you probably won't change
int polarity = 1;	//zero for negative, one for positive
//Register-reading Variables
NI_HANDLE handle;
int thrs_q;
int thrs_q;
int top_q;
int delay_q;
int gate_uq;
int gate_lq;
int inhib_q;
int polarity_q;
char* selection;
int *disable_q; // array of disable instead of 24 initializations
int *disable;
int disable_t[32];
int ratereset_q;
int read_q;
int write_q;
int empty_q;
int full_q;
int fifo_q;
int skip_q;
int custom_q;
uint32_t read_data;
uint32_t valid_data;
uint32_t custom;
uint32_t status;
uint32_t skip = -1; //by default, don't skip pieces.
uint32_t fifo;
uint32_t empty;
uint32_t full;
//Command-line-reading Variables
int ind;
int iarg=0;
int gateflag=0;
int rangeflag=0;
int delayflag=0;
int inhibflag=0;
int threshflag=0;
int detflag=0;
int topflag=0;
int polflag=0;
int skipflag=0;
int reset=0;
int force=0;
char* rtemp;
char* gtemp;
//Other Variables
int i;
char userinput[3];
time_t tic, toc;
FILE *fp;
FILE *logfile;
//Rate Counter Variables
int rate_q;
uint32_t rateval[160]; //needs to be pre-allocated
uint32_t ratechan=1;
uint32_t ratetimeout=10; //timeout in ms
uint32_t rateread_data=0;
uint32_t ratevalid_data=0;

//Functions
//=======================================================================================

//Printing functions

void copyright(){
    printf("Copyright (c) 2022 Anthony Villano, Kitty Harris \n");
    printf("License: The Expat license  <https://spdx.org/licenses/MIT.html> \n");
    printf("This is free software: you are free to change and redistribute it. \n");
    printf("There is NO WARRANTY, to the extent permitted by law. \n");
}


//Parsing functions
int parse_detector_switch(char* selection){
    if(strcasecmp(selection,"muon") == 0 || strcasecmp(selection,"muons") == 0){
    	return 14680064; //21, 22, 23
    }else if(strcasecmp(selection,"PuBe") == 0 || strcasecmp(selection, "All") == 0 ){
        return 4294967295;
    }else if(strcasecmp(selection, "NaI") == 0 || strcasecmp(selection, "22na") == 0 || strcasecmp(selection, "na22") == 0 || strcasecmp(selection, "na-22") == 0){
        return 7168; //10, 11, 12
    }else if(strcasecmp(selection, "none") == 0){
        return 0;
    }else{ //If it's actually a number, use the number
        value = atoi(selection);
        if(value < 0 || value > 4294967295){
            printf("Detector argument invalid. Please supply an integer from 0 to 4294967295 or valid source ('PuBe', '22Na', 'Muon', 'All', 'None')");
            return -1;
        }else{
            return value;
        }
    };
}
int parse_gate(char* gatestring, int verbose){
	if(verbose > 2){printf("Are we even supposed to be here? %d\n",gateflag);}
	if(verbose > 1){printf ("Splitting string \"%s\" into tokens:\n",gatestring);}
	gate_l = atoi(strtok (gatestring," ,.-:"));
	gate_u = atoi(strtok (NULL," ,.-:"));
	if(verbose > 1){printf("%d, %d\n",gate_l,gate_u);}
}
int parse_range(char* rangestring, int verbose){
	if(verbose > 2){printf("Are we even supposed to be here? %d\n",rangeflag);}
	if(verbose > 1){printf ("Splitting string \"%s\" into tokens:\n",rangestring);}
	range_l = atoi(strtok (rangestring," ,.-:"));
	range_u = atoi(strtok (NULL," ,.-:"));
	range_s = atoi(strtok (NULL," ,.-:"));
	if(verbose > 1){printf("%d, %d, %d\n",range_l,range_u,range_s);}
}
void print_timestamp(int elapsed, int verbose){
	int hours = floor(elapsed / 3600);
	int minutes = floor((elapsed % 3600)/60);
	int seconds = floor((elapsed % 60));
	char* timestamp = malloc(100);
	snprintf(timestamp,100,"%02d-%02d-%02d",hours,minutes,seconds);
	if(verbose>1){printf("Timestamp: %s\n",timestamp);};
	if(verbose>-1){printf("Time elapsed: %02d:%02d:%02d \n",hours,minutes,seconds);};
	if(verbose>1){printf("Closing files...");};
}

//Converting functions
int *on_to_off(int *off, int on, int verbose){
    if(verbose > 1){
		printf("Bitwise detector numeric value supplied: %d\n",on);
	}
	on = on ^ 4294967295; //Bitwise flip since we're enabling but firmware is disabling.
	//We'll disable anything that's 1 after the flip and leave everything else on
    if(verbose > 1){
		printf("Bit-flipped detector value: %d\n",value);
	}
	if(verbose > 2){
		for(int i=0;i<24;i++){
			printf("%d",on>>i & 1);
		}
		printf("\n");
	}
    for(int i=0; i<24; i++){
		if(verbose > 1){printf("%d: %d, %d \n",i,on >> i, (on >> i) & 1);}
		off[i] = (on >> i) & 1;
		if(verbose > 2){printf("success!\n");}
	}
	// if(verbose > 2){printf("moving on...\n");}
    if(verbose>0){
		printf("Set to enable the following detectors: ");
		for(int i=0;i<32;i++){
			if(off[i] == 0){
				printf("%d, ",i);
			}
		}
		printf("\b\b.\n");
	};
	if(verbose>1){
		printf("Set to disable the following detectors: ");
		for(int i=0;i<32;i++){
			if(off[i] == 1){
				printf("%d, ",i);
			}
		}
		printf("\b\b.\n");
	}
    return off;
}

//Other functions

int connect_staticaddr(int verbose){
    R_Init();
	//If can't connect to the board, abort.
	if(R_ConnectDevice(BOARD_IP_ADDRESS, 8888, &handle) != 0) { 
		if(verbose>-1){printf("Unable to connect to the board!\n");};
		if(logfile != NULL){fprintf(logfile,"Unable to connect to the board at %s!\n",BOARD_IP_ADDRESS);};
		return (-1); 
	}else{
		if(verbose>0){printf("Connected.\n");};
		if(logfile != NULL){fprintf(logfile,"Connected to board at %s\n",BOARD_IP_ADDRESS);};
        return 0;
	};
}

int *disable_dets(int *disable_q, int disable[32]){
    disable_q[0 ] = REG_disable_det_0_SET (disable[0 ], &handle);
	disable_q[1 ] = REG_disable_det_1_SET (disable[1 ], &handle);
	disable_q[2 ] = REG_disable_det_2_SET (disable[2 ], &handle);
	disable_q[3 ] = REG_disable_det_3_SET (disable[3 ], &handle);
	disable_q[4 ] = REG_disable_det_4_SET (disable[4 ], &handle);
	disable_q[5 ] = REG_disable_det_5_SET (disable[5 ], &handle);
	disable_q[6 ] = REG_disable_det_6_SET (disable[6 ], &handle);
	disable_q[7 ] = REG_disable_det_7_SET (disable[7 ], &handle);
	disable_q[8 ] = REG_disable_det_8_SET (disable[8 ], &handle);
	disable_q[9 ] = REG_disable_det_9_SET (disable[9 ], &handle);
	disable_q[10] = REG_disable_det_10_SET(disable[10], &handle);
	disable_q[11] = REG_disable_det_11_SET(disable[11], &handle);
	disable_q[12] = REG_disable_det_12_SET(disable[12], &handle);
	disable_q[13] = REG_disable_det_13_SET(disable[13], &handle);
	disable_q[14] = REG_disable_det_14_SET(disable[14], &handle);
	disable_q[15] = REG_disable_det_15_SET(disable[15], &handle);
	disable_q[16] = REG_disable_det_16_SET(disable[16], &handle);
	disable_q[17] = REG_disable_det_17_SET(disable[17], &handle);
	disable_q[18] = REG_disable_det_18_SET(disable[18], &handle);
	disable_q[19] = REG_disable_det_19_SET(disable[19], &handle);
	disable_q[20] = REG_disable_det_20_SET(disable[20], &handle);
	disable_q[21] = REG_disable_det_21_SET(disable[21], &handle);
	disable_q[22] = REG_disable_det_22_SET(disable[22], &handle);
	disable_q[23] = REG_disable_det_23_SET(disable[23], &handle);
	disable_q[24] = REG_disable_det_24_SET(disable[24], &handle);
	disable_q[25] = REG_disable_det_25_SET(disable[25], &handle);
	disable_q[26] = REG_disable_det_26_SET(disable[26], &handle);
	disable_q[27] = REG_disable_det_27_SET(disable[27], &handle);
	disable_q[28] = REG_disable_det_28_SET(disable[28], &handle);
	disable_q[29] = REG_disable_det_29_SET(disable[29], &handle);
	disable_q[30] = REG_disable_det_30_SET(disable[30], &handle);
	disable_q[31] = REG_disable_det_31_SET(disable[31], &handle);
    return disable_q;
}

int set_by_polarity(int (*f)(uint32_t, NI_HANDLE*), int polarity, int value){
	if(polarity==0){
		return f(baseline - value,&handle);
	}else if(polarity==1){
		return f(baseline + value,&handle);
	}else{
		printf("Polarity is invalid! (Must be 1 or 0; was %d.)\n",polarity); 
		return -1;
	}
}

int kbhit(void){
	struct termios oldt, newt;
	int ch;
	int oldf;

	tcgetattr(STDIN_FILENO, &oldt);
	newt = oldt;
	newt.c_lflag &= ~(ICANON | ECHO);
	tcsetattr(STDIN_FILENO, TCSANOW, &newt);
	oldf = fcntl(STDIN_FILENO, F_GETFL, 0);
	fcntl(STDIN_FILENO, F_SETFL, oldf | O_NONBLOCK);

	ch = getchar();

	tcsetattr(STDIN_FILENO, TCSANOW, &oldt);
	fcntl(STDIN_FILENO, F_SETFL, oldf);

	if(ch != EOF)
	{
	ungetc(ch, stdin);
	return 1;
	}

	return 0;
}
