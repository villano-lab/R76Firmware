#include "UniversalTriggerShared.h"
#include "Legacy/R76Firmware_lib.h"
#include "Legacy/Def.h"
#include "Legacy/RegisterFile.h"
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <termios.h>
#include <unistd.h>
#include <string.h>
#include <getopt.h>

//Variables
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
int gate_l = 10;
float range_l = 0;
float range_u = 8;
float range_s = 1;
int delay = 20;
int inhib = 1000;
int baseline = 200;
float top = 8.;
int int_time = 250; //this seems to be a good default based on oscilloscope readout.
int pre_int = 100;   //^same here
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
//int *spectra_qs; //need separate type for spectra_q when holding values vs success
uint32_t *spectra_q;
uint32_t *specread_q;
uint32_t *specvalid_q;
int disable_t[32];
int thresh_t[32];
uint32_t spectra_t[32];
int specdat[32*17*BUFFER_SIZE];
uint32_t specvalid_t[32];
uint32_t spec_dl[32*17*BUFFER_SIZE];
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
int preflag=0;
int intflag=0;
int baseflag=0;
int reset=0;
int force=0;
int wait=1;
const char* configfilename;
char* rtemp;
char* gtemp;
//Other Variables
int i;
char userinput[3];
time_t tic, toc;
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
//https://stackoverflow.com/a/700184
void printbits(unsigned char v) {
  int i; // for C89 compatability
  for(i = 24; i >= 0; i--) putchar('0' + ((v >> i) & 1));
}
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
	if(gatestring != NULL){
		if(verbose > 2){printf("Are we even supposed to be here? %d\n",gateflag);}
		if(verbose > 1){printf ("Splitting string \"%s\" into tokens:\n",gatestring);}
		gate_l = atoi(strtok (gatestring," ,.-:"));
		gate_u = atoi(strtok (NULL," ,.-:"));
	}else{
		if(verbose > 0){printf("Using default values for gates, lower %d and upper %d.\n",gate_l,gate_u);}
	}
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
void read_config(const char* filename){
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

/*int REG_thrsh_SET(uint32_t value, NI_HANDLE *handle){
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
/*	thresh_q[24] = set_by_polarity(REG_top_24_SET,polarity,value);
//	thresh_q[25] = set_by_polarity(REG_top_25_SET,polarity,value);
//	thresh_q[26] = set_by_polarity(REG_top_26_SET,polarity,value);
//	thresh_q[27] = set_by_polarity(REG_top_27_SET,polarity,value);
//	thresh_q[28] = set_by_polarity(REG_top_28_SET,polarity,value);
//	thresh_q[29] = set_by_polarity(REG_top_29_SET,polarity,value);
//	thresh_q[30] = set_by_polarity(REG_top_30_SET,polarity,value);
//	thresh_q[31] = set_by_polarity(REG_top_31_SET,polarity,value);
}*/

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
	disable_q[0 ] = __abstracted_reg_write(disable[0 ], SCI_REG_disable_det_0, &handle);
	disable_q[1 ] = __abstracted_reg_write(disable[1 ], SCI_REG_disable_det_1, &handle);
	disable_q[2 ] = __abstracted_reg_write(disable[2 ], SCI_REG_disable_det_2, &handle);
	disable_q[3 ] = __abstracted_reg_write(disable[3 ], SCI_REG_disable_det_3, &handle);
	disable_q[4 ] = __abstracted_reg_write(disable[4 ], SCI_REG_disable_det_4, &handle);
	disable_q[5 ] = __abstracted_reg_write(disable[5 ], SCI_REG_disable_det_5, &handle);
	disable_q[6 ] = __abstracted_reg_write(disable[6 ], SCI_REG_disable_det_6, &handle);
	disable_q[7 ] = __abstracted_reg_write(disable[7 ], SCI_REG_disable_det_7, &handle);
	disable_q[8 ] = __abstracted_reg_write(disable[8 ], SCI_REG_disable_det_8, &handle);
	disable_q[9 ] = __abstracted_reg_write(disable[9 ], SCI_REG_disable_det_9, &handle);
	disable_q[10] = __abstracted_reg_write(disable[10], SCI_REG_disable_det_10, &handle);
	disable_q[11] = __abstracted_reg_write(disable[11], SCI_REG_disable_det_11, &handle);
	disable_q[12] = __abstracted_reg_write(disable[12], SCI_REG_disable_det_12, &handle);
	disable_q[13] = __abstracted_reg_write(disable[13], SCI_REG_disable_det_13, &handle);
	disable_q[14] = __abstracted_reg_write(disable[14], SCI_REG_disable_det_14, &handle);
	disable_q[15] = __abstracted_reg_write(disable[15], SCI_REG_disable_det_15, &handle);
	disable_q[16] = __abstracted_reg_write(disable[16], SCI_REG_disable_det_16, &handle);
	disable_q[17] = __abstracted_reg_write(disable[17], SCI_REG_disable_det_17, &handle);
	disable_q[18] = __abstracted_reg_write(disable[18], SCI_REG_disable_det_18, &handle);
	disable_q[19] = __abstracted_reg_write(disable[19], SCI_REG_disable_det_19, &handle);
	disable_q[20] = __abstracted_reg_write(disable[20], SCI_REG_disable_det_20, &handle);
	disable_q[21] = __abstracted_reg_write(disable[21], SCI_REG_disable_det_21, &handle);
	disable_q[22] = __abstracted_reg_write(disable[22], SCI_REG_disable_det_22, &handle);
	disable_q[23] = __abstracted_reg_write(disable[23], SCI_REG_disable_det_23, &handle);
/*	disable_q[24] = REG_disable_det_24_SET(disable[24], &handle);
//	disable_q[25] = REG_disable_det_25_SET(disable[25], &handle);
//	disable_q[26] = REG_disable_det_26_SET(disable[26], &handle);
//	disable_q[27] = REG_disable_det_27_SET(disable[27], &handle);
//	disable_q[28] = REG_disable_det_28_SET(disable[28], &handle);
//	disable_q[29] = REG_disable_det_29_SET(disable[29], &handle);
//	disable_q[30] = REG_disable_det_30_SET(disable[30], &handle);
//	disable_q[31] = REG_disable_det_31_SET(disable[31], &handle);*/
    return disable_q;
}

int *set_thresholds(const char* side, int polarity, float energy, int *thresh_q){
	if(strcasecmp(side,"lower") == 0 || strcasecmp(side,"thrs") == 0 || strcasecmp(side,"thresh") == 0 || strcasecmp(side,"thrsh") == 0 || strcasecmp(side,"lo") == 0 || strcasecmp(side,"low") == 0){
		thresh_q[0 ] = set_by_polarity(SCI_REG_thrsh_0, polarity,energy_to_bin(0 ,energy));
		thresh_q[1 ] = set_by_polarity(SCI_REG_thrsh_1, polarity,energy_to_bin(1 ,energy));
		thresh_q[2 ] = set_by_polarity(SCI_REG_thrsh_2, polarity,energy_to_bin(2 ,energy));
		thresh_q[3 ] = set_by_polarity(SCI_REG_thrsh_3, polarity,energy_to_bin(3 ,energy));
		thresh_q[4 ] = set_by_polarity(SCI_REG_thrsh_4, polarity,energy_to_bin(4 ,energy));
		thresh_q[5 ] = set_by_polarity(SCI_REG_thrsh_5, polarity,energy_to_bin(5 ,energy));
		thresh_q[6 ] = set_by_polarity(SCI_REG_thrsh_6, polarity,energy_to_bin(6 ,energy));
		thresh_q[7 ] = set_by_polarity(SCI_REG_thrsh_7, polarity,energy_to_bin(7 ,energy));
		thresh_q[8 ] = set_by_polarity(SCI_REG_thrsh_8, polarity,energy_to_bin(8 ,energy));
		thresh_q[9 ] = set_by_polarity(SCI_REG_thrsh_9, polarity,energy_to_bin(9 ,energy));
		thresh_q[10] = set_by_polarity(SCI_REG_thrsh_10,polarity,energy_to_bin(10,energy));
		thresh_q[11] = set_by_polarity(SCI_REG_thrsh_11,polarity,energy_to_bin(11,energy));
		thresh_q[12] = set_by_polarity(SCI_REG_thrsh_12,polarity,energy_to_bin(12,energy));
		thresh_q[13] = set_by_polarity(SCI_REG_thrsh_13,polarity,energy_to_bin(13,energy));
		thresh_q[14] = set_by_polarity(SCI_REG_thrsh_14,polarity,energy_to_bin(14,energy));
		thresh_q[15] = set_by_polarity(SCI_REG_thrsh_15,polarity,energy_to_bin(15,energy));
		thresh_q[16] = set_by_polarity(SCI_REG_thrsh_16,polarity,energy_to_bin(16,energy));
		thresh_q[17] = set_by_polarity(SCI_REG_thrsh_17,polarity,energy_to_bin(17,energy));
		thresh_q[18] = set_by_polarity(SCI_REG_thrsh_18,polarity,energy_to_bin(18,energy));
		thresh_q[19] = set_by_polarity(SCI_REG_thrsh_19,polarity,energy_to_bin(19,energy));
		thresh_q[20] = set_by_polarity(SCI_REG_thrsh_20,polarity,energy_to_bin(20,energy));
		thresh_q[21] = set_by_polarity(SCI_REG_thrsh_21,polarity,energy_to_bin(21,energy));
		thresh_q[22] = set_by_polarity(SCI_REG_thrsh_22,polarity,energy_to_bin(22,energy));
		thresh_q[23] = set_by_polarity(SCI_REG_thrsh_23,polarity,energy_to_bin(23,energy));
		/*thresh_q[24] = set_by_polarity(REG_thrsh_24_SET,polarity,energy_to_bin(24,energy));
		thresh_q[25] = set_by_polarity(REG_thrsh_25_SET,polarity,energy_to_bin(25,energy));
		thresh_q[26] = set_by_polarity(REG_thrsh_26_SET,polarity,energy_to_bin(26,energy));
		thresh_q[27] = set_by_polarity(REG_thrsh_27_SET,polarity,energy_to_bin(27,energy));
		thresh_q[28] = set_by_polarity(REG_thrsh_28_SET,polarity,energy_to_bin(28,energy));
		thresh_q[29] = set_by_polarity(REG_thrsh_29_SET,polarity,energy_to_bin(29,energy));
		thresh_q[30] = set_by_polarity(REG_thrsh_30_SET,polarity,energy_to_bin(30,energy));
		thresh_q[31] = set_by_polarity(REG_thrsh_31_SET,polarity,energy_to_bin(31,energy));*/ //these do not exist yet.
	}else if(strcasecmp(side,"upper") == 0 || strcasecmp(side,"up") == 0 || strcasecmp(side,"hi") == 0 || strcasecmp(side,"higher") == 0 || strcasecmp(side,"high") == 0 || strcasecmp(side,"top") == 0){
		thresh_q[0 ] = set_by_polarity(SCI_REG_top_0, polarity,energy_to_bin(0 ,energy));
		thresh_q[1 ] = set_by_polarity(SCI_REG_top_1, polarity,energy_to_bin(1 ,energy));
		thresh_q[2 ] = set_by_polarity(SCI_REG_top_2, polarity,energy_to_bin(2 ,energy));
		thresh_q[3 ] = set_by_polarity(SCI_REG_top_3, polarity,energy_to_bin(3 ,energy));
		thresh_q[4 ] = set_by_polarity(SCI_REG_top_4, polarity,energy_to_bin(4 ,energy));
		thresh_q[5 ] = set_by_polarity(SCI_REG_top_5, polarity,energy_to_bin(5 ,energy));
		thresh_q[6 ] = set_by_polarity(SCI_REG_top_6, polarity,energy_to_bin(6 ,energy));
		thresh_q[7 ] = set_by_polarity(SCI_REG_top_7, polarity,energy_to_bin(7 ,energy));
		thresh_q[8 ] = set_by_polarity(SCI_REG_top_8, polarity,energy_to_bin(8 ,energy));
		thresh_q[9 ] = set_by_polarity(SCI_REG_top_9, polarity,energy_to_bin(9 ,energy));
		thresh_q[10] = set_by_polarity(SCI_REG_top_10,polarity,energy_to_bin(10,energy));
		thresh_q[11] = set_by_polarity(SCI_REG_top_11,polarity,energy_to_bin(11,energy));
		thresh_q[12] = set_by_polarity(SCI_REG_top_12,polarity,energy_to_bin(12,energy));
		thresh_q[13] = set_by_polarity(SCI_REG_top_13,polarity,energy_to_bin(13,energy));
		thresh_q[14] = set_by_polarity(SCI_REG_top_14,polarity,energy_to_bin(14,energy));
		thresh_q[15] = set_by_polarity(SCI_REG_top_15,polarity,energy_to_bin(15,energy));
		thresh_q[16] = set_by_polarity(SCI_REG_top_16,polarity,energy_to_bin(16,energy));
		thresh_q[17] = set_by_polarity(SCI_REG_top_17,polarity,energy_to_bin(17,energy));
		thresh_q[18] = set_by_polarity(SCI_REG_top_18,polarity,energy_to_bin(18,energy));
		thresh_q[19] = set_by_polarity(SCI_REG_top_19,polarity,energy_to_bin(19,energy));
		thresh_q[20] = set_by_polarity(SCI_REG_top_20,polarity,energy_to_bin(20,energy));
		thresh_q[21] = set_by_polarity(SCI_REG_top_21,polarity,energy_to_bin(21,energy));
		thresh_q[22] = set_by_polarity(SCI_REG_top_22,polarity,energy_to_bin(22,energy));
		thresh_q[23] = set_by_polarity(SCI_REG_top_23,polarity,energy_to_bin(23,energy));
	}else{
		printf("Invalid 'side' passed to set_thresholds. Please submit a bug report.\n");
		exit(-1);
	}
	return thresh_q;
}

uint32_t *spectra_START(uint32_t *spectra_q){
	spectra_q[0 ] = SPECTRUM_Spectrum_0_START (&handle);
	spectra_q[1 ] = SPECTRUM_Spectrum_1_START (&handle);
	spectra_q[2 ] = SPECTRUM_Spectrum_2_START (&handle);
	spectra_q[3 ] = SPECTRUM_Spectrum_3_START (&handle);
	spectra_q[4 ] = SPECTRUM_Spectrum_4_START (&handle);
	spectra_q[5 ] = SPECTRUM_Spectrum_5_START (&handle);
	spectra_q[6 ] = SPECTRUM_Spectrum_6_START (&handle);
	spectra_q[7 ] = SPECTRUM_Spectrum_7_START (&handle);
	spectra_q[8 ] = SPECTRUM_Spectrum_8_START (&handle);
	spectra_q[9 ] = SPECTRUM_Spectrum_9_START (&handle);
	spectra_q[10] = SPECTRUM_Spectrum_10_START(&handle);
	spectra_q[11] = SPECTRUM_Spectrum_11_START(&handle);
	spectra_q[12] = SPECTRUM_Spectrum_12_START(&handle);
	spectra_q[13] = SPECTRUM_Spectrum_13_START(&handle);
	spectra_q[14] = SPECTRUM_Spectrum_14_START(&handle);
	spectra_q[15] = SPECTRUM_Spectrum_15_START(&handle);
	spectra_q[16] = SPECTRUM_Spectrum_16_START(&handle);
	spectra_q[17] = SPECTRUM_Spectrum_17_START(&handle);
	spectra_q[18] = SPECTRUM_Spectrum_18_START(&handle);
	spectra_q[19] = SPECTRUM_Spectrum_19_START(&handle);
	spectra_q[20] = SPECTRUM_Spectrum_20_START(&handle);
	spectra_q[21] = SPECTRUM_Spectrum_21_START(&handle);
	spectra_q[22] = SPECTRUM_Spectrum_22_START(&handle);
	spectra_q[23] = SPECTRUM_Spectrum_23_START(&handle);
	return spectra_q;
}

uint32_t *spectra_STOP(uint32_t *spectra_q){
	spectra_q[0 ] = SPECTRUM_Spectrum_0_STOP (&handle);
	spectra_q[1 ] = SPECTRUM_Spectrum_1_STOP (&handle);
	spectra_q[2 ] = SPECTRUM_Spectrum_2_STOP (&handle);
	spectra_q[3 ] = SPECTRUM_Spectrum_3_STOP (&handle);
	spectra_q[4 ] = SPECTRUM_Spectrum_4_STOP (&handle);
	spectra_q[5 ] = SPECTRUM_Spectrum_5_STOP (&handle);
	spectra_q[6 ] = SPECTRUM_Spectrum_6_STOP (&handle);
	spectra_q[7 ] = SPECTRUM_Spectrum_7_STOP (&handle);
	spectra_q[8 ] = SPECTRUM_Spectrum_8_STOP (&handle);
	spectra_q[9 ] = SPECTRUM_Spectrum_9_STOP (&handle);
	spectra_q[10] = SPECTRUM_Spectrum_10_STOP(&handle);
	spectra_q[11] = SPECTRUM_Spectrum_11_STOP(&handle);
	spectra_q[12] = SPECTRUM_Spectrum_12_STOP(&handle);
	spectra_q[13] = SPECTRUM_Spectrum_13_STOP(&handle);
	spectra_q[14] = SPECTRUM_Spectrum_14_STOP(&handle);
	spectra_q[15] = SPECTRUM_Spectrum_15_STOP(&handle);
	spectra_q[16] = SPECTRUM_Spectrum_16_STOP(&handle);
	spectra_q[17] = SPECTRUM_Spectrum_17_STOP(&handle);
	spectra_q[18] = SPECTRUM_Spectrum_18_STOP(&handle);
	spectra_q[19] = SPECTRUM_Spectrum_19_STOP(&handle);
	spectra_q[20] = SPECTRUM_Spectrum_20_STOP(&handle);
	spectra_q[21] = SPECTRUM_Spectrum_21_STOP(&handle);
	spectra_q[22] = SPECTRUM_Spectrum_22_STOP(&handle);
	spectra_q[23] = SPECTRUM_Spectrum_23_STOP(&handle);
	return spectra_q;
}

uint32_t *spectra_FLUSH(uint32_t *spectra_q){
	spectra_q[0 ] = SPECTRUM_Spectrum_0_FLUSH (&handle);
	spectra_q[1 ] = SPECTRUM_Spectrum_1_FLUSH (&handle);
	spectra_q[2 ] = SPECTRUM_Spectrum_2_FLUSH (&handle);
	spectra_q[3 ] = SPECTRUM_Spectrum_3_FLUSH (&handle);
	spectra_q[4 ] = SPECTRUM_Spectrum_4_FLUSH (&handle);
	spectra_q[5 ] = SPECTRUM_Spectrum_5_FLUSH (&handle);
	spectra_q[6 ] = SPECTRUM_Spectrum_6_FLUSH (&handle);
	spectra_q[7 ] = SPECTRUM_Spectrum_7_FLUSH (&handle);
	spectra_q[8 ] = SPECTRUM_Spectrum_8_FLUSH (&handle);
	spectra_q[9 ] = SPECTRUM_Spectrum_9_FLUSH (&handle);
	spectra_q[10] = SPECTRUM_Spectrum_10_FLUSH(&handle);
	spectra_q[11] = SPECTRUM_Spectrum_11_FLUSH(&handle);
	spectra_q[12] = SPECTRUM_Spectrum_12_FLUSH(&handle);
	spectra_q[13] = SPECTRUM_Spectrum_13_FLUSH(&handle);
	spectra_q[14] = SPECTRUM_Spectrum_14_FLUSH(&handle);
	spectra_q[15] = SPECTRUM_Spectrum_15_FLUSH(&handle);
	spectra_q[16] = SPECTRUM_Spectrum_16_FLUSH(&handle);
	spectra_q[17] = SPECTRUM_Spectrum_17_FLUSH(&handle);
	spectra_q[18] = SPECTRUM_Spectrum_18_FLUSH(&handle);
	spectra_q[19] = SPECTRUM_Spectrum_19_FLUSH(&handle);
	spectra_q[20] = SPECTRUM_Spectrum_20_FLUSH(&handle);
	spectra_q[21] = SPECTRUM_Spectrum_21_FLUSH(&handle);
	spectra_q[22] = SPECTRUM_Spectrum_22_FLUSH(&handle);
	spectra_q[23] = SPECTRUM_Spectrum_23_FLUSH(&handle);
	return spectra_q;
}

uint32_t *spectra_RESET(uint32_t *spectra_q){
	spectra_q[0 ] = SPECTRUM_Spectrum_0_RESET (&handle);
	spectra_q[1 ] = SPECTRUM_Spectrum_1_RESET (&handle);
	spectra_q[2 ] = SPECTRUM_Spectrum_2_RESET (&handle);
	spectra_q[3 ] = SPECTRUM_Spectrum_3_RESET (&handle);
	spectra_q[4 ] = SPECTRUM_Spectrum_4_RESET (&handle);
	spectra_q[5 ] = SPECTRUM_Spectrum_5_RESET (&handle);
	spectra_q[6 ] = SPECTRUM_Spectrum_6_RESET (&handle);
	spectra_q[7 ] = SPECTRUM_Spectrum_7_RESET (&handle);
	spectra_q[8 ] = SPECTRUM_Spectrum_8_RESET (&handle);
	spectra_q[9 ] = SPECTRUM_Spectrum_9_RESET (&handle);
	spectra_q[10] = SPECTRUM_Spectrum_10_RESET(&handle);
	spectra_q[11] = SPECTRUM_Spectrum_11_RESET(&handle);
	spectra_q[12] = SPECTRUM_Spectrum_12_RESET(&handle);
	spectra_q[13] = SPECTRUM_Spectrum_13_RESET(&handle);
	spectra_q[14] = SPECTRUM_Spectrum_14_RESET(&handle);
	spectra_q[15] = SPECTRUM_Spectrum_15_RESET(&handle);
	spectra_q[16] = SPECTRUM_Spectrum_16_RESET(&handle);
	spectra_q[17] = SPECTRUM_Spectrum_17_RESET(&handle);
	spectra_q[18] = SPECTRUM_Spectrum_18_RESET(&handle);
	spectra_q[19] = SPECTRUM_Spectrum_19_RESET(&handle);
	spectra_q[20] = SPECTRUM_Spectrum_20_RESET(&handle);
	spectra_q[21] = SPECTRUM_Spectrum_21_RESET(&handle);
	spectra_q[22] = SPECTRUM_Spectrum_22_RESET(&handle);
	spectra_q[23] = SPECTRUM_Spectrum_23_RESET(&handle);
	return spectra_q;
}

uint32_t *spectra_SET(uint32_t rebin, uint32_t limit_mode, uint32_t limit_value, uint32_t *spectra_q){
	spectra_q[0 ] = SPECTRUM_Spectrum_0_SET_PARAMETERS (rebin,limit_mode,limit_value,&handle);
	spectra_q[1 ] = SPECTRUM_Spectrum_1_SET_PARAMETERS (rebin,limit_mode,limit_value,&handle);
	spectra_q[2 ] = SPECTRUM_Spectrum_2_SET_PARAMETERS (rebin,limit_mode,limit_value,&handle);
	spectra_q[3 ] = SPECTRUM_Spectrum_3_SET_PARAMETERS (rebin,limit_mode,limit_value,&handle);
	spectra_q[4 ] = SPECTRUM_Spectrum_4_SET_PARAMETERS (rebin,limit_mode,limit_value,&handle);
	spectra_q[5 ] = SPECTRUM_Spectrum_5_SET_PARAMETERS (rebin,limit_mode,limit_value,&handle);
	spectra_q[6 ] = SPECTRUM_Spectrum_6_SET_PARAMETERS (rebin,limit_mode,limit_value,&handle);
	spectra_q[7 ] = SPECTRUM_Spectrum_7_SET_PARAMETERS (rebin,limit_mode,limit_value,&handle);
	spectra_q[8 ] = SPECTRUM_Spectrum_8_SET_PARAMETERS (rebin,limit_mode,limit_value,&handle);
	spectra_q[9 ] = SPECTRUM_Spectrum_9_SET_PARAMETERS (rebin,limit_mode,limit_value,&handle);
	spectra_q[10] = SPECTRUM_Spectrum_10_SET_PARAMETERS(rebin,limit_mode,limit_value,&handle);
	spectra_q[11] = SPECTRUM_Spectrum_11_SET_PARAMETERS(rebin,limit_mode,limit_value,&handle);
	spectra_q[12] = SPECTRUM_Spectrum_12_SET_PARAMETERS(rebin,limit_mode,limit_value,&handle);
	spectra_q[13] = SPECTRUM_Spectrum_13_SET_PARAMETERS(rebin,limit_mode,limit_value,&handle);
	spectra_q[14] = SPECTRUM_Spectrum_14_SET_PARAMETERS(rebin,limit_mode,limit_value,&handle);
	spectra_q[15] = SPECTRUM_Spectrum_15_SET_PARAMETERS(rebin,limit_mode,limit_value,&handle);
	spectra_q[16] = SPECTRUM_Spectrum_16_SET_PARAMETERS(rebin,limit_mode,limit_value,&handle);
	spectra_q[17] = SPECTRUM_Spectrum_17_SET_PARAMETERS(rebin,limit_mode,limit_value,&handle);
	spectra_q[18] = SPECTRUM_Spectrum_18_SET_PARAMETERS(rebin,limit_mode,limit_value,&handle);
	spectra_q[19] = SPECTRUM_Spectrum_19_SET_PARAMETERS(rebin,limit_mode,limit_value,&handle);
	spectra_q[20] = SPECTRUM_Spectrum_20_SET_PARAMETERS(rebin,limit_mode,limit_value,&handle);
	spectra_q[21] = SPECTRUM_Spectrum_21_SET_PARAMETERS(rebin,limit_mode,limit_value,&handle);
	spectra_q[22] = SPECTRUM_Spectrum_22_SET_PARAMETERS(rebin,limit_mode,limit_value,&handle);
	spectra_q[23] = SPECTRUM_Spectrum_23_SET_PARAMETERS(rebin,limit_mode,limit_value,&handle);
	return spectra_q;
}

uint32_t *spectra_STATUS(uint32_t *spectra_q){
	SPECTRUM_Spectrum_0_STATUS (&spectra_q[0 ],&handle);
	SPECTRUM_Spectrum_1_STATUS (&spectra_q[1 ],&handle);
	SPECTRUM_Spectrum_2_STATUS (&spectra_q[2 ],&handle);
	SPECTRUM_Spectrum_3_STATUS (&spectra_q[3 ],&handle);
	SPECTRUM_Spectrum_4_STATUS (&spectra_q[4 ],&handle);
	SPECTRUM_Spectrum_5_STATUS (&spectra_q[5 ],&handle);
	SPECTRUM_Spectrum_6_STATUS (&spectra_q[6 ],&handle);
	SPECTRUM_Spectrum_7_STATUS (&spectra_q[7 ],&handle);
	SPECTRUM_Spectrum_8_STATUS (&spectra_q[8 ],&handle);
	SPECTRUM_Spectrum_9_STATUS (&spectra_q[9 ],&handle);
	SPECTRUM_Spectrum_10_STATUS(&spectra_q[10],&handle);
	SPECTRUM_Spectrum_11_STATUS(&spectra_q[11],&handle);
	SPECTRUM_Spectrum_12_STATUS(&spectra_q[12],&handle);
	SPECTRUM_Spectrum_13_STATUS(&spectra_q[13],&handle);
	SPECTRUM_Spectrum_14_STATUS(&spectra_q[14],&handle);
	SPECTRUM_Spectrum_15_STATUS(&spectra_q[15],&handle);
	SPECTRUM_Spectrum_16_STATUS(&spectra_q[16],&handle);
	SPECTRUM_Spectrum_17_STATUS(&spectra_q[17],&handle);
	SPECTRUM_Spectrum_18_STATUS(&spectra_q[18],&handle);
	SPECTRUM_Spectrum_19_STATUS(&spectra_q[19],&handle);
	SPECTRUM_Spectrum_20_STATUS(&spectra_q[20],&handle);
	SPECTRUM_Spectrum_21_STATUS(&spectra_q[21],&handle);
	SPECTRUM_Spectrum_22_STATUS(&spectra_q[22],&handle);
	SPECTRUM_Spectrum_23_STATUS(&spectra_q[23],&handle);
	return spectra_q;
}

uint32_t *spectra_DOWNLOAD(uint32_t *specdat, uint32_t timeout, uint32_t *specread_q, uint32_t *specvalid_q){
	SPECTRUM_Spectrum_0_DOWNLOAD (&specdat[0 *17*BUFFER_SIZE],BUFFER_SIZE, timeout, &handle, &specread_q[0 ], &specvalid_q[0 ]);
	SPECTRUM_Spectrum_1_DOWNLOAD (&specdat[1 *17*BUFFER_SIZE],BUFFER_SIZE, timeout, &handle, &specread_q[1 ], &specvalid_q[1 ]);
	SPECTRUM_Spectrum_2_DOWNLOAD (&specdat[2 *17*BUFFER_SIZE],BUFFER_SIZE, timeout, &handle, &specread_q[2 ], &specvalid_q[2 ]);
	SPECTRUM_Spectrum_3_DOWNLOAD (&specdat[3 *17*BUFFER_SIZE],BUFFER_SIZE, timeout, &handle, &specread_q[3 ], &specvalid_q[3 ]);
	SPECTRUM_Spectrum_4_DOWNLOAD (&specdat[4 *17*BUFFER_SIZE],BUFFER_SIZE, timeout, &handle, &specread_q[4 ], &specvalid_q[4 ]);
	SPECTRUM_Spectrum_5_DOWNLOAD (&specdat[5 *17*BUFFER_SIZE],BUFFER_SIZE, timeout, &handle, &specread_q[5 ], &specvalid_q[5 ]);
	SPECTRUM_Spectrum_6_DOWNLOAD (&specdat[6 *17*BUFFER_SIZE],BUFFER_SIZE, timeout, &handle, &specread_q[6 ], &specvalid_q[6 ]);
	SPECTRUM_Spectrum_7_DOWNLOAD (&specdat[7 *17*BUFFER_SIZE],BUFFER_SIZE, timeout, &handle, &specread_q[7 ], &specvalid_q[7 ]);
	SPECTRUM_Spectrum_8_DOWNLOAD (&specdat[8 *17*BUFFER_SIZE],BUFFER_SIZE, timeout, &handle, &specread_q[8 ], &specvalid_q[8 ]);
	SPECTRUM_Spectrum_9_DOWNLOAD (&specdat[9 *17*BUFFER_SIZE],BUFFER_SIZE, timeout, &handle, &specread_q[9 ], &specvalid_q[9 ]);
	SPECTRUM_Spectrum_10_DOWNLOAD(&specdat[10*17*BUFFER_SIZE],BUFFER_SIZE, timeout, &handle, &specread_q[10], &specvalid_q[10]);
	SPECTRUM_Spectrum_11_DOWNLOAD(&specdat[11*17*BUFFER_SIZE],BUFFER_SIZE, timeout, &handle, &specread_q[11], &specvalid_q[11]);
	SPECTRUM_Spectrum_12_DOWNLOAD(&specdat[12*17*BUFFER_SIZE],BUFFER_SIZE, timeout, &handle, &specread_q[12], &specvalid_q[12]);
	SPECTRUM_Spectrum_13_DOWNLOAD(&specdat[13*17*BUFFER_SIZE],BUFFER_SIZE, timeout, &handle, &specread_q[13], &specvalid_q[13]);
	SPECTRUM_Spectrum_14_DOWNLOAD(&specdat[14*17*BUFFER_SIZE],BUFFER_SIZE, timeout, &handle, &specread_q[14], &specvalid_q[14]);
	SPECTRUM_Spectrum_15_DOWNLOAD(&specdat[15*17*BUFFER_SIZE],BUFFER_SIZE, timeout, &handle, &specread_q[15], &specvalid_q[15]);
	SPECTRUM_Spectrum_16_DOWNLOAD(&specdat[16*17*BUFFER_SIZE],BUFFER_SIZE, timeout, &handle, &specread_q[16], &specvalid_q[16]);
	SPECTRUM_Spectrum_17_DOWNLOAD(&specdat[17*17*BUFFER_SIZE],BUFFER_SIZE, timeout, &handle, &specread_q[17], &specvalid_q[17]);
	SPECTRUM_Spectrum_18_DOWNLOAD(&specdat[18*17*BUFFER_SIZE],BUFFER_SIZE, timeout, &handle, &specread_q[18], &specvalid_q[18]);
	SPECTRUM_Spectrum_19_DOWNLOAD(&specdat[19*17*BUFFER_SIZE],BUFFER_SIZE, timeout, &handle, &specread_q[19], &specvalid_q[19]);
	SPECTRUM_Spectrum_20_DOWNLOAD(&specdat[20*17*BUFFER_SIZE],BUFFER_SIZE, timeout, &handle, &specread_q[20], &specvalid_q[20]);
	SPECTRUM_Spectrum_21_DOWNLOAD(&specdat[21*17*BUFFER_SIZE],BUFFER_SIZE, timeout, &handle, &specread_q[21], &specvalid_q[21]);
	SPECTRUM_Spectrum_22_DOWNLOAD(&specdat[22*17*BUFFER_SIZE],BUFFER_SIZE, timeout, &handle, &specread_q[22], &specvalid_q[22]);
	SPECTRUM_Spectrum_23_DOWNLOAD(&specdat[23*17*BUFFER_SIZE],BUFFER_SIZE, timeout, &handle, &specread_q[23], &specvalid_q[23]);
	return specdat;
}

int set_by_polarity(uint32_t address, int polarity, int value){
	if(polarity==0){
		uint32_t newval = baseline - value;
		return __abstracted_reg_write(newval,address,&handle);
	}else if(polarity==1){
		uint32_t newval = baseline + value;
		return __abstracted_reg_write(newval,address,&handle);
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
