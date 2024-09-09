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
	//{"polarity",	optional_argument,	0,	'p'},
	{"pre-int",	required_argument,	0,	'P'},
	{"int-time",	required_argument,	0,	'I'},
	{"config",	optional_argument,	0,	'c'},
	{"wait",	required_argument,	0,	'w'},
	{"mode",	required_argument,	0,	'm'},
	{0,		0,			0,	0},
};

//Calibrated values -- update these after calibrating!
float baseline_calib[32] = {0,288.21,258.69,318.06,233.09,197.68,321.82,261.98,284.21,389.04,329.41,282.3,319.53,389.48,203.09,421.6,272.15,308.12,267.85,293.62,299.07,286.4,243.29,334.94,0,0,0,0,0,0,0,0};
float scale_calib[32] = {1,1.44,1.29,1.28,1.29,1.28,1.36,1.15,1.17,1.42,1.29,1.32,1.26,1.22,1.36,1.12,1.34,1.23,1.28,1.22,1.44,1.18,1.06,1.36,1,1,1,1,1,1,1,1};

//Defaults
char mode = 's';
int verbose = 0;
float thrs = 1.;	        //distance from baseline for threshold.
uint32_t value = 16777214;	//default: disable detector 0,24-31 (never present) and enable the rest.
int gate_u = 100;
int gate_l = 10;
float range_l = 0;
float range_u = 8;
float range_s = 1;
int delay = 5;
int inhib = 1000;
int baseline = 200;
int base_auto = 9;//default behavior: measure over 2^9 clock ticks to get the baseline
float top = 8.;
int int_time = 250; //this seems to be a good default based on oscilloscope readout.
int pre_int = 100;   //^same here
//things you probably won't change
//int polarity = 1;	//zero for negative, one for positive
//Register-reading Variables
NI_HANDLE handle;
int delay_q;
int gate_uq;
int gate_lq;
int inhib_q;
//int polarity_q;
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
    printf(VERSION_NUMBER);
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
	return gate_l,gate_u;
}
int parse_range(char* rangestring, int verbose){
	if(verbose > 2){printf("Are we even supposed to be here? %d\n",rangeflag);}
	if(verbose > 1){printf ("Splitting string \"%s\" into tokens:\n",rangestring);}
	range_l = atof(strtok (rangestring," ,-:"));
	range_u = atof(strtok (NULL," ,-:"));
	range_s = atof(strtok (NULL," ,-:"));
	if(verbose > 1){printf("%f, %f, %f\n",range_l,range_u,range_s);}
	return range_l,range_u,range_s;
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
int *on_to_off(int *off, uint32_t on, int verbose){
	if(verbose > 1) printf("Bitwise detector numeric value supplied: %d\n",on);
	on = on ^ 4294967295; //Bitwise flip since we're enabling but firmware is disabling.
	//We'll disable anything that's 1 after the flip and leave everything else on
	if(verbose > 1)	std::cout << "Bit-flipped detector value: " << on << std::endl;
	if(verbose > 2){
		for(int i=0;i<32;i++){
			printf("%d",on>>i & 1);
		}
		printf("\n");
	}
    for(int i=0; i<32; i++){
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
uint32_t energy_to_bin(int detnum, float energy, int baseline){ //take an energy (MeV) and convert it to a bin number
	// convert to keV, since that's how our calibrations were done
	float tempbase;
	if(baseline == 0) tempbase = 0;
	else tempbase = baseline_calib[detnum];
	uint32_t bin;
	energy = energy * 1000;
	bin = uint32_t(scale_calib[detnum]*energy + tempbase);
	#define DEBUG
	#ifdef DEBUG
	std::cout << detnum << ": " << scale_calib[detnum]*energy + tempbase << ", ";
	#endif
	return bin;
}

//Other functions

int connect_staticaddr(int verbose){
    R_Init();
	//If can't connect to the board, abort.
	if(R_ConnectDevice((char*)BOARD_IP_ADDRESS, 8888, &handle) != 0) {
		printf("Unable to connect to the board!\n");
		if(logfile != NULL){fprintf(logfile,"Unable to connect to the board at %s!\n",BOARD_IP_ADDRESS);};
		return (-1);
	}else{
		if(verbose>-1){printf("Connected.\n");};
		if(logfile != NULL){fprintf(logfile,"Connected to board at %s\n",BOARD_IP_ADDRESS);};
        return 0;
	};
}

int *disable_dets(int *disable_q, int disable[32]){
	disable_q[0 ] = __abstracted_reg_write(disable[0 ], SCI_REG_disable_det_CH0, &handle);
	disable_q[1 ] = __abstracted_reg_write(disable[1 ], SCI_REG_disable_det_CH1, &handle);
	disable_q[2 ] = __abstracted_reg_write(disable[2 ], SCI_REG_disable_det_CH2, &handle);
	disable_q[3 ] = __abstracted_reg_write(disable[3 ], SCI_REG_disable_det_CH3, &handle);
	disable_q[4 ] = __abstracted_reg_write(disable[4 ], SCI_REG_disable_det_CH4, &handle);
	disable_q[5 ] = __abstracted_reg_write(disable[5 ], SCI_REG_disable_det_CH5, &handle);
	disable_q[6 ] = __abstracted_reg_write(disable[6 ], SCI_REG_disable_det_CH6, &handle);
	disable_q[7 ] = __abstracted_reg_write(disable[7 ], SCI_REG_disable_det_CH7, &handle);
	disable_q[8 ] = __abstracted_reg_write(disable[8 ], SCI_REG_disable_det_CH8, &handle);
	disable_q[9 ] = __abstracted_reg_write(disable[9 ], SCI_REG_disable_det_CH9, &handle);
	disable_q[10] = __abstracted_reg_write(disable[10], SCI_REG_disable_det_CH10, &handle);
	disable_q[11] = __abstracted_reg_write(disable[11], SCI_REG_disable_det_CH11, &handle);
	disable_q[12] = __abstracted_reg_write(disable[12], SCI_REG_disable_det_CH12, &handle);
	disable_q[13] = __abstracted_reg_write(disable[13], SCI_REG_disable_det_CH13, &handle);
	disable_q[14] = __abstracted_reg_write(disable[14], SCI_REG_disable_det_CH14, &handle);
	disable_q[15] = __abstracted_reg_write(disable[15], SCI_REG_disable_det_CH15, &handle);
	disable_q[16] = __abstracted_reg_write(disable[16], SCI_REG_disable_det_CH16, &handle);
	disable_q[17] = __abstracted_reg_write(disable[17], SCI_REG_disable_det_CH17, &handle);
	disable_q[18] = __abstracted_reg_write(disable[18], SCI_REG_disable_det_CH18, &handle);
	disable_q[19] = __abstracted_reg_write(disable[19], SCI_REG_disable_det_CH19, &handle);
	disable_q[20] = __abstracted_reg_write(disable[20], SCI_REG_disable_det_CH20, &handle);
	disable_q[21] = __abstracted_reg_write(disable[21], SCI_REG_disable_det_CH21, &handle);
	disable_q[22] = __abstracted_reg_write(disable[22], SCI_REG_disable_det_CH22, &handle);
	disable_q[23] = __abstracted_reg_write(disable[23], SCI_REG_disable_det_CH23, &handle);
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

uint32_t *set_thresholds(const char* side, float energy, int *thresh_q, int baseline){
	int startpoint; uint32_t threshs[32];
	uint32_t* thresholds = threshs;
	if(strcasecmp(side,"lower") == 0 || strcasecmp(side,"thrs") == 0 || strcasecmp(side,"thresh") == 0 || strcasecmp(side,"thrsh") == 0 || strcasecmp(side,"lo") == 0 || strcasecmp(side,"low") == 0){
		startpoint = SCI_REG_thrsh_CH0; //thanks to registerfile these are always in order with spacing 1
	}else if(strcasecmp(side,"upper") == 0 || strcasecmp(side,"up") == 0 || strcasecmp(side,"hi") == 0 || strcasecmp(side,"higher") == 0 || strcasecmp(side,"high") == 0 || strcasecmp(side,"top") == 0){
		startpoint = SCI_REG_top_CH0;
	}else{
		printf("Invalid 'side' passed to set_thresholds. Please submit a bug report.\n");
		exit(-1);
	}
	for(int i=0;i<24;i++){
		int tempenergy = energy_to_bin(i,energy,baseline);
		thresh_q[i] = __abstracted_reg_write(tempenergy,startpoint+i,&handle);
		thresholds[i] = tempenergy;
	}
	return thresholds;
}

/*uint32_t *spectra_START(uint32_t *spectra_q){
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
*/
/*int set_by_polarity(uint32_t address, int value){
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
}*/

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

int multicheck(int* errors,int len,std::string name){
	for(int i=0;i++;i<len){
		if(errors[i] != 0){
			std::cout << "Error code " << errors[i] << " from " << name << ". Aborting.\n";
			exit(errors[i]);
		}
	}
	return 0;
}
