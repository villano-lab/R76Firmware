// A simple program that takes all newly-detected peaks and prints them to a csv file.
// Trying to move to ROOT but it's causing segfaults before getting into the main func 
// or even before variable declaration?

#include "Def.h"
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <stdint.h>
#include <termios.h>
#include <unistd.h>
#include <fcntl.h>
#include <time.h>
#include <math.h>
#include <string.h>
#include <sys/time.h>
#include <getopt.h>

/*//ROOT
#include "TTree.h"
#include "TFile.h"
#include "Rtypes.h"*/

#include  "R76Firmware_lib.h"
#include  "UniversalTriggerShared.h"

const char* program_name = "setregisters";

void print_usage(FILE* stream, int exit_code){ //This looks unaligned but lines up correctly in the terminal output
	fprintf (stream, "Usage:  %s [options] \n", program_name);
  	fprintf (stream, DET_TEXT);
	fprintf (stream, GATE_TEXT);
	fprintf (stream, DELAY_TEXT);
	fprintf (stream, INHIB_TEXT);
	fprintf (stream, THRESH_TEXT);
	fprintf (stream, TOP_TEXT);
	fprintf (stream, SKIP_TEXT);
	fprintf (stream, POLARITY_TEXT);
	fprintf (stream, PRE_INT_TEXT);
	fprintf (stream, INT_TIME_TEXT);
	fprintf (stream, CONFIG_TEXT);
	fprintf (stream, VERBOSE_TEXT);
	fprintf (stream, SILENT_TEXT);
	fprintf (stream, LOG_TEXT);
	fprintf (stream, VERSION_TEXT);
	fprintf (stream, HELP_TEXT);
	fprintf (stream, RESET_TEXT);
	fprintf (stream, FORCE_TEXT);
	
	exit (exit_code);
};

int main(int argc, char* argv[])
{
	//Read options
	int index;
	int iarg=0;
	int polarity=1;
	while(iarg != -1){
		iarg = getopt_long(argc, argv, "l::c::D:i:t:shv::Vg:d:T:RfS:p::P:I:", longopts, &index);
		switch (iarg){
		case 'f':
			force = 1;
			break;
		case 'R':
			reset = 1;
			break;
		case 'h':
			print_usage(stdout,0);
			return 0;
			break;
		case 'q':
			verbose = -1;
			break;
		case 's':
			verbose = -1;
			break;
		case 'v':
			if(optarg){verbose = atoi(optarg);
			}else{verbose = 1;};
			break;
		case '?':
			print_usage(stdout,0);
			return 0;
			break;
		case 'V':
			printf("Set Registers\n");
			copyright();
			return 0;
			break;
		case 'l':
			if(optarg){logfile = fopen(optarg,"w");
			}else{logfile = fopen("log.txt","w");};
			break;
		case 'c':
			if(optarg){
				configfilename = optarg;
			}else{
				configfilename = "example.config";
			}
			read_config(configfilename);
			break;
		case 'D':
			selection = optarg;
			value = parse_detector_switch(selection);
			if(value < 0 ){return value;} //If there's an error, pass it through.
			detflag = 1;
			break;
		case 'g':
			if(verbose > 2){printf("Hey I'm in case g\n");}
			gateflag = 1;
			gtemp = optarg;
			break;
		case 'i':
			inhibflag = 1;
			inhib = atoi(optarg);
			break;
		case 'd':
			delayflag = 1;
			delay = atoi(optarg);
			break;
		case 't':
			threshflag = 1;
			if(verbose > 1){printf("Threshold supplied: %s\n",optarg);}
			thrs = atoi(optarg);
			if(verbose > 1){printf("Threshold successfully set to %d.\n",thrs);}
			break;
		case 'T':
			topflag = 1;
			top = atoi(optarg);
			break;
		case 'S':
			skipflag = 1;
			skip = atoi(optarg);
			break;
		case 'p':
			polflag = 1;
			if(optarg){polarity = atoi(optarg);
			}else{polarity = 1;};
			break;
		case 'P':
			pre_int = atoi(optarg);
			break;
		case 'I':
			int_time = atoi(optarg);
			break;
		}
	}

	//Verbosity message
	if(verbose > 0){
		printf("Running in verbose mode. Verbosity: %d\n",verbose);
	};

	if(reset == 1){
		if(force == 0){
			printf("Reset all un-provided variables to their default values? (y/n): ");
			inputstart: scanf("%3s",userinput);
			if(strcasecmp(userinput, "y") == 0 || strcasecmp(userinput, "yes") == 0|| strcasecmp(userinput, "1") == 0){
				inhibflag = 1;
				delayflag = 1;
				threshflag = 1;
				topflag = 1;
				detflag = 1;
				gateflag = 1;
				skipflag = 1;
				//polflag = 1;
			}else if(strcasecmp(userinput, "n") == 0 || strcasecmp(userinput, "no") == 0 || userinput == "0"){
				if(verbose>-1){printf("Proceeding with provided values only.");}
			}else{
				if(verbose > 2){printf("You supplied: %s. ",userinput);}
				printf("Please enter 'y' or 'n': ");
				goto inputstart;
			}
			//user input. abort or proceed.
		}else if(force == 1){
			inhibflag = 1;
			delayflag = 1;
			threshflag = 1;
			topflag = 1;
			detflag = 1;
			gateflag = 1;
			skipflag = 1;
			//polflag = 1;
		}else{
			printf("Somehow, the force variable was set to an invalid value (%d). Aborting. Please submit a bug report.\n",force);
			return -1;
		}
	}

	if(verbose > 0 && polflag == 0 && (threshflag == 1 || topflag == 1)){
		printf("No polarity supplied. Thresholds will be set assuming negative polarity is being flipped to positive.\n");
	}

	//Detector on/off
	if(detflag == 1){
		if(verbose > 1){
			printf("Detector string value supplied: %s\n",selection);
		}
		disable = on_to_off(disable_t,value,verbose);
	}

	//Connect to the board. 
	int connect_q = connect_staticaddr(verbose);
	if(connect_q != 0){
		printf("Board connection error code: %d\n",connect_q);
		return connect_q;
	}

	//Now set all the values we determined above
	if(detflag == 1){
		disable_q = disable_dets(disable_t, disable);
		for(int i=0; i<24; i++){
			if(disable_q[i] != 0){
				printf("Unable to set on/off state of detector #%d! Aborting.\n",i);
				return -1;
			}
		}
	}else if(verbose > 1){
		printf("Detector flag is off (%d). Skipping.\n",detflag);
	}

	//Some printing statements
	if(threshflag == 1){
		if(verbose>-1){printf("Setting threshold to: %d.\n",thrs);}
	}else if(verbose > 1){
		printf("Lower threshold flag is off. Skipping.\n");
	}
	
	if(skipflag == 1){
		if(verbose>-1){printf("Setting to skip every %d triggers.\n",skip);}
	}else if(verbose > 1){
		printf("'Skip' flag is off. Skipping.\n");
	}

	if(gateflag == 1){
		gateflagl == 1;
		gateflagu == 1;
	}
	if(logfile != NULL){
		fprintf(logfile,"============ Settings ============\n");
		if(threshflag 	== 1){		fprintf(logfile,"Lower threshold:				%d\n",thrs);}
		if(topflag	 	== 1){		fprintf(logfile,"Upper threshold:				%d\n",top);}
		if(inhibflag	== 1){		fprintf(logfile,"Trigger Inhibition Time:		%d\n",inhib);}
		if(gateflagu	== 1){		fprintf(logfile,"Upper Gate:					%d\n",gate_u);}
		if(gateflagl 	== 1){		fprintf(logfile,"Lower Gate: 					%d\n",gate_l);}
		if(delayflag	== 1){		fprintf(logfile,"Delay:							%d\n",delay);}
		if(polflag		== 1){		fprintf(logfile,"Polarity (Neg 0, Pos 1):		%d\n",polarity);}
		if(skipflag     == 1){		fprintf(logfile,"Skip value:					%d\n",skip);}
		if(detflag		== 1){
									fprintf(logfile,"Detectors enabled:				\n");
			for(int i=0;i++;i<24){
				if(disable[i] == 0){fprintf(logfile,"%d, ",i);}
			}
									fprintf(logfile,"\b\b\n\n"); //clear trailing comma and space before inserting two newlines.
		};
	}
	
	//Pass them along to the system
	if(verbose>0){printf("Configuring...\n");};

	if(threshflag == 1){	
		thrs_q = set_by_polarity(REG_thrsh_SET,polarity,thrs);
		if(thrs_q != 0){
			printf("Error from REG_thrsh_SET. Aborting.\n");
			return thrs_q;
		}
	}
	//set top
	if(topflag == 1){
		top_q = set_by_polarity(REG_top_SET,polarity,top);
		if(top_q != 0){
			printf("Error from REG_top_SET. Aborting.\n");
			return top_q;
		}else if(verbose > 0){
			printf("Successfully set upper threshold to %d.\n",top);
		}
	}else if(verbose > 1){
		printf("Top threshold flag is off. Skipping.\n");
	}

	//set skip
	if(skipflag == 1){
		skip_q = REG_skip_SET(skip,&handle);
		if(skip_q != 0){
			printf("Error from REG_skip_SET. Aborting.\n");
			return skip_q;
		}else if(verbose > 0){
			printf("Successfully set skip to %d.\n",skip);
		}
	}

	//set inhib
	if(inhibflag == 1){	
		inhib_q = REG_inhib_SET(inhib,&handle);	
		if(inhib_q != 0){
			printf("Error from REG_inhib_SET. Aborting.\n");
			return inhib_q;
		}else if(verbose > 0){
			printf("Successfully set inhib to %d.\n",inhib);
		}
	}else if(verbose > 1){
		printf("Inhibit flag is off. Skipping.\n");
	}

	//set polarity
	if(polflag == 1){
		polarity_q = REG_polarity_SET(polarity,&handle); 
		if(polarity_q != 0){
			printf("Error from REG_polarity_SET. Aborting.\n");
			return polarity_q;
		}else if(verbose > 0){
			printf("Successfully set polarity to %d.\n",polarity);
		}
	}else if(verbose > 1){
		printf("Polarity flag is off. Skipping.\n");
	}

	//set gates
	if(gateflagl == 1){
		gate_lq 				= REG_gate_l_SET(gate_l,&handle);
		if(gate_lq != 0){
			printf("Error from REG_gate_l_SET. Aborting.\n");
			return gate_lq;
		}
	}else if(verbose>1){printf("Gate flag is off. Skipping lower gate.\n");}
	if(gateflagu == 1){
		gate_uq					= REG_gate_u_SET(gate_u,&handle);
		if(gate_uq != 0){
			printf("Error from REG_gate_u_SET. Aborting.\n");
			return gate_uq;
		}else if(verbose > 0){
			printf("Successfully set lower gate to %d and upper gate to %d.\n",gate_l,gate_u);
		}
	}else if(verbose > 1){		printf("Gate flag is off. Skipping upper gate.\n");	}

	//set delay
	if(delayflag == 1){
		delay_q 	= REG_delay_SET(delay,&handle); 
		if(delay_q != 0){
			printf("Error from REG_delay_SET. Aborting.\n");
			return delay_q;
		}else if(verbose > 0){
			printf("Successfully set delay to %d.\n",delay);
		}
	}else if(verbose > 1){
		printf("Delay flag is off. Skipping.\n");
	}
	
	return 0;
}
