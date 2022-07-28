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
	{"polarity",optional_argument,	0,	'p'},
	{"pre-int",	required_argument,	0,	'P'},
	{"int-time",required_argument,	0,	'I'},
	{"config",	optional_argument,	0,	'c'},
	{"wait",	required_argument,	0,	'w'},
	{0,		0,			0,	0},
};

//Defaults
int verbose = 0;
float thrs = 1.;	        //distance from baseline for threshold.
uint32_t value = 4294967295;
int gate_u = 100; 
int gate_l = 0;
float range_l = 0;
float range_u = 8;
float range_s = 1;
int delay = 50;
int inhib = 1000;
int baseline = 200;
float top = 8.;
int int_time = 250; //should change this default once we find a good value - these are good for SCIDK
int pre_int = 30;   //^same here
//things you probably won't change
int polarity = 1;	//zero for negative, one for positive
//Register-reading Variables
NI_HANDLE handle;
int delay_q;
int gate_uq;
int gate_lq;
int inhib_q;
int polarity_q;
char* selection;
int *disable_q; // array of disable instead of 24 initializations
int *disable;
int *thresh_q;
int disable_t[32];
int thresh_t[32];
uint32_t spec_dl[1040];
uint32_t size = 1024;
int reset_q;
int read_q;
int write_q;
int empty_q;
int full_q;
int fifo_q;
int skip_q;
int custom_q;
int int_time_q;
int baseline_q;
int pre_int_q;
int stopwrite_q;
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
int gateflagu=0;
int gateflagl=0;
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
int wait=1;
char* rtemp;
char* gtemp;
char* configfilename;
//Other Variables
int i;
char userinput[3];
time_t tic, toc;
FILE *fp;
FILE *logfile;
FILE *configfile;
//Rate Counter Variables
int rate_q;
int unreduced_q;
uint32_t unreduced[160];
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
void subhelp(FILE* stream){
	fprintf (stream, "\n===============================================================\n");
	fprintf (stream, "setregisters: utility for setting register values\n");
	fprintf (stream, "----------\n");
	system("./setregisters -h");
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
	range_l = atof(strtok (rangestring," ,-:"));
	range_u = atof(strtok (NULL," ,-:"));
	range_s = atof(strtok (NULL," ,-:"));
	if(verbose > 1){printf("%f, %f, %f\n",range_l,range_u,range_s);}
}
void print_timestamp(int elapsed, int verbose){
	int hours = floor(elapsed / 3600);
	int minutes = floor((elapsed % 3600)/60);
	int seconds = floor(elapsed % 60);
	if(verbose>-1){printf("Time elapsed: %02d:%02d:%02d \n",hours,minutes,seconds);};
	if(verbose>1){printf("Closing files...");};
}
void read_config(char* filename){
	configfile = fopen(filename,"r");
	char line[256]; //declare the line variable
	int linenumber = 0;
	while(fgets(line, 256, configfile) != NULL){
		linenumber++;
		char arg[128],val[128];
		//printf("Checking if comment... ");
		if(line[0] == '#' || line[0] == '\n' || strcmp(line,"\n") == 0 || strcmp(line,"\r\n") == 0){continue;} //skip comments and blanks
		//printf("Not comment.\n");
		if(sscanf(line, "%s %s", arg, val) != 2){
			fprintf(stderr, "Syntax error, line %d: %s", linenumber, line);
			continue;
		}
		if(strcasecmp(arg,"delay") == 0 || strcasecmp(arg,"del") == 0){
			delay = atoi(val);
			delayflag = 1;
		}else if(strcasecmp(arg,"detectors") == 0 || strcasecmp(arg,"det") == 0 || strcasecmp(arg,"dets") == 0){
			value = parse_detector_switch(val);
			if(value < 0){exit(value);}
			detflag = 1;
		}else if(strcasecmp(arg,"gate_lower") == 0 || strcasecmp(arg,"gate_l") == 0 || strcasecmp(arg,"gl") == 0 || strcasecmp(arg,"g_l") == 0 || strcasecmp(arg,"gate_low") == 0){
			gate_l = atoi(val);
			gateflagl = 1;
		}else if(strcasecmp(arg,"gate_upper") == 0 || strcasecmp(arg,"gate_u") == 0 || strcasecmp(arg,"gu") == 0 || strcasecmp(arg,"g_u") == 0 || strcasecmp(arg,"gate_up") == 0 || strcasecmp(arg,"gate_hi") == 0 || strcasecmp(arg,"gate_high") == 0){
			gate_u = atoi(val);
			gateflagu = 1;
		}else if(strcasecmp(arg,"inhib") == 0 || strcasecmp(arg,"inhibit") == 0 || strcasecmp(arg,"inhibition") == 0){
			inhib = atoi(val);
			inhibflag = 1;
		}else if(strcasecmp(arg,"log") == 0 || strcasecmp(arg,"logging") == 0 || strcasecmp(arg,"logfile") == 0){
			logfile = fopen(val,"w");
		}else if(strcasecmp(arg,"range_lower") == 0){
			range_l = atoi(val);
		}else if(strcasecmp(arg,"range_upper") == 0){
			range_u = atoi(val);
		}else if(strcasecmp(arg,"range_stepsize") == 0){
			range_s = atoi(val);
		}else if(strcasecmp(arg,"thresh_lower") == 0 || strcasecmp(arg,"thresh") == 0){
			thrs = atof(val);
			threshflag = 1;
		}else if(strcasecmp(arg,"thresh_upper") == 0 || strcasecmp(arg,"thresh_top") == 0 || strcasecmp(arg,"top") == 0){
			top = atof(val);
			topflag = 1;
		}
	}
	fclose(configfile);
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
int energy_to_bin(int detnum, float energy){ //take an energy (MeV) and convert it to a bin number
	// convert to keV, since that's how our calibrations were done
	float bin;
	energy = energy * 1000;
	if(detnum == 0){
		bin = energy;
		if(verbose > 3){printf("Bin value: %f\n",bin);}
		return bin;
	}else if(detnum == 1){
		bin = 1.44*energy + 288.21;
		if(verbose > 3){printf("Bin value: %f\n",bin);}
		return bin;
	}else if(detnum == 2){
		bin = 1.29*energy + 258.69;
		if(verbose > 3){printf("Bin value: %f\n",bin);}
		return bin;
	}else if(detnum == 3){
		bin = 1.28*energy + 318.06;
		if(verbose > 3){printf("Bin value: %f\n",bin);}
		return bin;
	}else if(detnum == 4){
		bin = 1.29*energy + 233.09;
		if(verbose > 3){printf("Bin value: %f\n",bin);}
		return bin;
	}else if(detnum == 5){
		bin = 1.28*energy + 197.68;
		if(verbose > 3){printf("Bin value: %f\n",bin);}
		return bin;
	}else if(detnum == 6){
		bin = 1.36*energy + 321.82;
		if(verbose > 3){printf("Bin value: %f\n",bin);}
		return bin;
	}else if(detnum == 7){
		bin = 1.15*energy + 261.98;
		if(verbose > 3){printf("Bin value: %f\n",bin);}
		return bin;
	}else if(detnum == 8){
		bin = 1.17*energy + 284.21;
		if(verbose > 3){printf("Bin value: %f\n",bin);}
		return bin;
	}else if(detnum == 9){
		bin = 1.42*energy + 389.04;
		if(verbose > 3){printf("Bin value: %f\n",bin);}
		return bin;
	}else if(detnum == 10){
		bin = 1.29*energy + 329.41;
		if(verbose > 3){printf("Bin value: %f\n",bin);}
		return bin;
	}else if(detnum == 11){
		bin = 1.32*energy + 282.30;
		if(verbose > 3){printf("Bin value: %f\n",bin);}
		return bin;
	}else if(detnum == 12){
		bin = 1.26*energy + 319.53;
		if(verbose > 3){printf("Bin value: %f\n",bin);}
		return bin;
	}else if(detnum == 13){
		bin = 1.22*energy + 389.48;
		if(verbose > 3){printf("Bin value: %f\n",bin);}
		return bin;
	}else if(detnum == 14){
		bin = 1.36*energy + 203.09;
		if(verbose > 3){printf("Bin value: %f\n",bin);}
		return bin;
	}else if(detnum == 15){
		bin = 1.12*energy + 421.60;
		if(verbose > 3){printf("Bin value: %f\n",bin);}
		return bin;
	}else if(detnum == 16){
		bin = 1.34*energy + 272.15;
		if(verbose > 3){printf("Bin value: %f\n",bin);}
		return bin;
	}else if(detnum == 17){
		bin = 1.23*energy + 308.12;
		if(verbose > 3){printf("Bin value: %f\n",bin);}
		return bin;
	}else if(detnum == 18){
		bin = 1.28*energy + 267.85;
		if(verbose > 3){printf("Bin value: %f\n",bin);}
		return bin;
	}else if(detnum == 19){
		bin = 1.22*energy + 293.62;
		if(verbose > 3){printf("Bin value: %f\n",bin);}
		return bin;
	}else if(detnum == 20){
		bin = 1.44*energy + 299.07;
		if(verbose > 3){printf("Bin value: %f\n",bin);}
		return bin;
	}else if(detnum == 21){
		bin = 1.18*energy + 286.40;
		if(verbose > 3){printf("Bin value: %f\n",bin);}
		return bin;
	}else if(detnum == 22){
		bin = 1.06*energy + 243.29;
		if(verbose > 3){printf("Bin value: %f\n",bin);}
		return bin;
	}else if(detnum == 23){
		bin = 1.36*energy + 334.94;
		if(verbose > 3){printf("Bin value: %f\n",bin);}
		return bin;
	}else if(detnum == 24){
		bin = energy;
		if(verbose > 3){printf("Bin value: %f\n",bin);}
		return bin;
	}else if(detnum == 25){
		bin = energy;
		if(verbose > 3){printf("Bin value: %f\n",bin);}
		return bin;
	}else if(detnum == 26){
		bin = energy;
		if(verbose > 3){printf("Bin value: %f\n",bin);}
		return bin;
	}else if(detnum == 27){
		bin = energy;
		if(verbose > 3){printf("Bin value: %f\n",bin);}
		return bin;
	}else if(detnum == 28){
		bin = energy;
		if(verbose > 3){printf("Bin value: %f\n",bin);}
		return bin;
	}else if(detnum == 29){
		bin = energy;
		if(verbose > 3){printf("Bin value: %f\n",bin);}
		return bin;
	}else if(detnum == 30){
		bin = energy;
		if(verbose > 3){printf("Bin value: %f\n",bin);}
		return bin;
	}else if(detnum == 31){
		bin = energy;
		if(verbose > 3){printf("Bin value: %f\n",bin);}
		return bin;
	}else{
		printf("Invalid detector number %d supplied to energy_to_bin function. Must supply a number 0-31.\n",detnum);
		exit(-1);
	}
}

//Compatibility functions

int REG_thrsh_SET(uint32_t value, NI_HANDLE *handle){
	thresh_q[0 ] = set_by_polarity(REG_thrsh_0_SET, polarity,value);
	thresh_q[1 ] = set_by_polarity(REG_thrsh_1_SET, polarity,value);
	thresh_q[2 ] = set_by_polarity(REG_thrsh_2_SET, polarity,value);
	thresh_q[3 ] = set_by_polarity(REG_thrsh_3_SET, polarity,value);
	thresh_q[4 ] = set_by_polarity(REG_thrsh_4_SET, polarity,value);
	thresh_q[5 ] = set_by_polarity(REG_thrsh_5_SET, polarity,value);
	thresh_q[6 ] = set_by_polarity(REG_thrsh_6_SET, polarity,value);
	thresh_q[7 ] = set_by_polarity(REG_thrsh_7_SET, polarity,value);
	thresh_q[8 ] = set_by_polarity(REG_thrsh_8_SET, polarity,value);
	thresh_q[9 ] = set_by_polarity(REG_thrsh_9_SET, polarity,value);
	thresh_q[10] = set_by_polarity(REG_thrsh_10_SET,polarity,value);
	thresh_q[11] = set_by_polarity(REG_thrsh_11_SET,polarity,value);
	thresh_q[12] = set_by_polarity(REG_thrsh_12_SET,polarity,value);
	thresh_q[13] = set_by_polarity(REG_thrsh_13_SET,polarity,value);
	thresh_q[14] = set_by_polarity(REG_thrsh_14_SET,polarity,value);
	thresh_q[15] = set_by_polarity(REG_thrsh_15_SET,polarity,value);
	thresh_q[16] = set_by_polarity(REG_thrsh_16_SET,polarity,value);
	thresh_q[17] = set_by_polarity(REG_thrsh_17_SET,polarity,value);
	thresh_q[18] = set_by_polarity(REG_thrsh_18_SET,polarity,value);
	thresh_q[19] = set_by_polarity(REG_thrsh_19_SET,polarity,value);
	thresh_q[20] = set_by_polarity(REG_thrsh_20_SET,polarity,value);
	thresh_q[21] = set_by_polarity(REG_thrsh_21_SET,polarity,value);
	thresh_q[22] = set_by_polarity(REG_thrsh_22_SET,polarity,value);
	thresh_q[23] = set_by_polarity(REG_thrsh_23_SET,polarity,value);
	for(int i=0; i<24; i++){
		if(thresh_q[i] != 0){
			printf("Unable to set on/off state of detector #%d! Aborting.\n",i);
			return thresh_q[i];
		}
	}
	return 0;
}

int REG_top_SET(uint32_t value, NI_HANDLE *handle){
	thresh_q[0 ] = set_by_polarity(REG_top_0_SET, polarity,value);
	thresh_q[1 ] = set_by_polarity(REG_top_1_SET, polarity,value);
	thresh_q[2 ] = set_by_polarity(REG_top_2_SET, polarity,value);
	thresh_q[3 ] = set_by_polarity(REG_top_3_SET, polarity,value);
	thresh_q[4 ] = set_by_polarity(REG_top_4_SET, polarity,value);
	thresh_q[5 ] = set_by_polarity(REG_top_5_SET, polarity,value);
	thresh_q[6 ] = set_by_polarity(REG_top_6_SET, polarity,value);
	thresh_q[7 ] = set_by_polarity(REG_top_7_SET, polarity,value);
	thresh_q[8 ] = set_by_polarity(REG_top_8_SET, polarity,value);
	thresh_q[9 ] = set_by_polarity(REG_top_9_SET, polarity,value);
	thresh_q[10] = set_by_polarity(REG_top_10_SET,polarity,value);
	thresh_q[11] = set_by_polarity(REG_top_11_SET,polarity,value);
	thresh_q[12] = set_by_polarity(REG_top_12_SET,polarity,value);
	thresh_q[13] = set_by_polarity(REG_top_13_SET,polarity,value);
	thresh_q[14] = set_by_polarity(REG_top_14_SET,polarity,value);
	thresh_q[15] = set_by_polarity(REG_top_15_SET,polarity,value);
	thresh_q[16] = set_by_polarity(REG_top_16_SET,polarity,value);
	thresh_q[17] = set_by_polarity(REG_top_17_SET,polarity,value);
	thresh_q[18] = set_by_polarity(REG_top_18_SET,polarity,value);
	thresh_q[19] = set_by_polarity(REG_top_19_SET,polarity,value);
	thresh_q[20] = set_by_polarity(REG_top_20_SET,polarity,value);
	thresh_q[21] = set_by_polarity(REG_top_21_SET,polarity,value);
	thresh_q[22] = set_by_polarity(REG_top_22_SET,polarity,value);
	thresh_q[23] = set_by_polarity(REG_top_23_SET,polarity,value);
	thresh_q[24] = set_by_polarity(REG_top_24_SET,polarity,value);
	thresh_q[25] = set_by_polarity(REG_top_25_SET,polarity,value);
	thresh_q[26] = set_by_polarity(REG_top_26_SET,polarity,value);
	thresh_q[27] = set_by_polarity(REG_top_27_SET,polarity,value);
	thresh_q[28] = set_by_polarity(REG_top_28_SET,polarity,value);
	thresh_q[29] = set_by_polarity(REG_top_29_SET,polarity,value);
	thresh_q[30] = set_by_polarity(REG_top_30_SET,polarity,value);
	thresh_q[31] = set_by_polarity(REG_top_31_SET,polarity,value);
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
		if(verbose>-1){printf("Connected.\n");};
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

int *set_thresholds(char* side, int polarity, float energy, int *thresh_q){
	if(strcasecmp(side,"lower") == 0 || strcasecmp(side,"thrs") == 0 || strcasecmp(side,"thresh") == 0 || strcasecmp(side,"thrsh") == 0 || strcasecmp(side,"lo") == 0 || strcasecmp(side,"low") == 0){
		thresh_q[0 ] = set_by_polarity(REG_thrsh_0_SET, polarity,energy_to_bin(0 ,energy));
		thresh_q[1 ] = set_by_polarity(REG_thrsh_1_SET, polarity,energy_to_bin(1 ,energy));
		thresh_q[2 ] = set_by_polarity(REG_thrsh_2_SET, polarity,energy_to_bin(2 ,energy));
		thresh_q[3 ] = set_by_polarity(REG_thrsh_3_SET, polarity,energy_to_bin(3 ,energy));
		thresh_q[4 ] = set_by_polarity(REG_thrsh_4_SET, polarity,energy_to_bin(4 ,energy));
		thresh_q[5 ] = set_by_polarity(REG_thrsh_5_SET, polarity,energy_to_bin(5 ,energy));
		thresh_q[6 ] = set_by_polarity(REG_thrsh_6_SET, polarity,energy_to_bin(6 ,energy));
		thresh_q[7 ] = set_by_polarity(REG_thrsh_7_SET, polarity,energy_to_bin(7 ,energy));
		thresh_q[8 ] = set_by_polarity(REG_thrsh_8_SET, polarity,energy_to_bin(8 ,energy));
		thresh_q[9 ] = set_by_polarity(REG_thrsh_9_SET, polarity,energy_to_bin(9 ,energy));
		thresh_q[10] = set_by_polarity(REG_thrsh_10_SET,polarity,energy_to_bin(10,energy));
		thresh_q[11] = set_by_polarity(REG_thrsh_11_SET,polarity,energy_to_bin(11,energy));
		thresh_q[12] = set_by_polarity(REG_thrsh_12_SET,polarity,energy_to_bin(12,energy));
		thresh_q[13] = set_by_polarity(REG_thrsh_13_SET,polarity,energy_to_bin(13,energy));
		thresh_q[14] = set_by_polarity(REG_thrsh_14_SET,polarity,energy_to_bin(14,energy));
		thresh_q[15] = set_by_polarity(REG_thrsh_15_SET,polarity,energy_to_bin(15,energy));
		thresh_q[16] = set_by_polarity(REG_thrsh_16_SET,polarity,energy_to_bin(16,energy));
		thresh_q[17] = set_by_polarity(REG_thrsh_17_SET,polarity,energy_to_bin(17,energy));
		thresh_q[18] = set_by_polarity(REG_thrsh_18_SET,polarity,energy_to_bin(18,energy));
		thresh_q[19] = set_by_polarity(REG_thrsh_19_SET,polarity,energy_to_bin(19,energy));
		thresh_q[20] = set_by_polarity(REG_thrsh_20_SET,polarity,energy_to_bin(20,energy));
		thresh_q[21] = set_by_polarity(REG_thrsh_21_SET,polarity,energy_to_bin(21,energy));
		thresh_q[22] = set_by_polarity(REG_thrsh_22_SET,polarity,energy_to_bin(22,energy));
		thresh_q[23] = set_by_polarity(REG_thrsh_23_SET,polarity,energy_to_bin(23,energy));
		/*thresh_q[24] = set_by_polarity(REG_thrsh_24_SET,polarity,energy_to_bin(24,energy));
		thresh_q[25] = set_by_polarity(REG_thrsh_25_SET,polarity,energy_to_bin(25,energy));
		thresh_q[26] = set_by_polarity(REG_thrsh_26_SET,polarity,energy_to_bin(26,energy));
		thresh_q[27] = set_by_polarity(REG_thrsh_27_SET,polarity,energy_to_bin(27,energy));
		thresh_q[28] = set_by_polarity(REG_thrsh_28_SET,polarity,energy_to_bin(28,energy));
		thresh_q[29] = set_by_polarity(REG_thrsh_29_SET,polarity,energy_to_bin(29,energy));
		thresh_q[30] = set_by_polarity(REG_thrsh_30_SET,polarity,energy_to_bin(30,energy));
		thresh_q[31] = set_by_polarity(REG_thrsh_31_SET,polarity,energy_to_bin(31,energy));*/ //these do not exist yet.
	}else if(strcasecmp(side,"upper") == 0 || strcasecmp(side,"up") == 0 || strcasecmp(side,"hi") == 0 || strcasecmp(side,"higher") == 0 || strcasecmp(side,"high") == 0 || strcasecmp(side,"top") == 0){
		thresh_q[0 ] = set_by_polarity(REG_top_0_SET, polarity,energy_to_bin(0 ,energy));
		thresh_q[1 ] = set_by_polarity(REG_top_1_SET, polarity,energy_to_bin(1 ,energy));
		thresh_q[2 ] = set_by_polarity(REG_top_2_SET, polarity,energy_to_bin(2 ,energy));
		thresh_q[3 ] = set_by_polarity(REG_top_3_SET, polarity,energy_to_bin(3 ,energy));
		thresh_q[4 ] = set_by_polarity(REG_top_4_SET, polarity,energy_to_bin(4 ,energy));
		thresh_q[5 ] = set_by_polarity(REG_top_5_SET, polarity,energy_to_bin(5 ,energy));
		thresh_q[6 ] = set_by_polarity(REG_top_6_SET, polarity,energy_to_bin(6 ,energy));
		thresh_q[7 ] = set_by_polarity(REG_top_7_SET, polarity,energy_to_bin(7 ,energy));
		thresh_q[8 ] = set_by_polarity(REG_top_8_SET, polarity,energy_to_bin(8 ,energy));
		thresh_q[9 ] = set_by_polarity(REG_top_9_SET, polarity,energy_to_bin(9 ,energy));
		thresh_q[10] = set_by_polarity(REG_top_10_SET,polarity,energy_to_bin(10,energy));
		thresh_q[11] = set_by_polarity(REG_top_11_SET,polarity,energy_to_bin(11,energy));
		thresh_q[12] = set_by_polarity(REG_top_12_SET,polarity,energy_to_bin(12,energy));
		thresh_q[13] = set_by_polarity(REG_top_13_SET,polarity,energy_to_bin(13,energy));
		thresh_q[14] = set_by_polarity(REG_top_14_SET,polarity,energy_to_bin(14,energy));
		thresh_q[15] = set_by_polarity(REG_top_15_SET,polarity,energy_to_bin(15,energy));
		thresh_q[16] = set_by_polarity(REG_top_16_SET,polarity,energy_to_bin(16,energy));
		thresh_q[17] = set_by_polarity(REG_top_17_SET,polarity,energy_to_bin(17,energy));
		thresh_q[18] = set_by_polarity(REG_top_18_SET,polarity,energy_to_bin(18,energy));
		thresh_q[19] = set_by_polarity(REG_top_19_SET,polarity,energy_to_bin(19,energy));
		thresh_q[20] = set_by_polarity(REG_top_20_SET,polarity,energy_to_bin(20,energy));
		thresh_q[21] = set_by_polarity(REG_top_21_SET,polarity,energy_to_bin(21,energy));
		thresh_q[22] = set_by_polarity(REG_top_22_SET,polarity,energy_to_bin(22,energy));
		thresh_q[23] = set_by_polarity(REG_top_23_SET,polarity,energy_to_bin(23,energy));
		thresh_q[24] = set_by_polarity(REG_top_24_SET,polarity,energy_to_bin(24,energy));
		thresh_q[25] = set_by_polarity(REG_top_25_SET,polarity,energy_to_bin(25,energy));
		thresh_q[26] = set_by_polarity(REG_top_26_SET,polarity,energy_to_bin(26,energy));
		thresh_q[27] = set_by_polarity(REG_top_27_SET,polarity,energy_to_bin(27,energy));
		thresh_q[28] = set_by_polarity(REG_top_28_SET,polarity,energy_to_bin(28,energy));
		thresh_q[29] = set_by_polarity(REG_top_29_SET,polarity,energy_to_bin(29,energy));
		thresh_q[30] = set_by_polarity(REG_top_30_SET,polarity,energy_to_bin(30,energy));
		thresh_q[31] = set_by_polarity(REG_top_31_SET,polarity,energy_to_bin(31,energy));
	}else{
		printf("Invalid 'side' passed to set_thresholds. Please submit a bug report.\n");
		exit(-1);
	}
	return thresh_q;
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
