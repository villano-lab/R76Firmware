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

const char* program_name = "scanwindow";

void print_usage(FILE* stream, int exit_code){ //This looks unaligned but lines up correctly in the terminal output
	fprintf (stream, "Usage:  %s options \n", program_name);
  	fprintf (stream, DET_TEXT);
	fprintf (stream, GATE_TEXT);
	fprintf (stream, DELAY_TEXT);
	fprintf (stream, INHIB_TEXT);
	fprintf (stream, THRESH_TEXT);
	fprintf (stream, RANGE_TEXT);
	fprintf (stream, SKIP_TEXT);
	fprintf (stream, VERBOSE_TEXT);
	fprintf (stream, SILENT_TEXT);
	fprintf (stream, LOG_TEXT);
	fprintf (stream, VERSION_TEXT);
	fprintf (stream, HELP_TEXT);
	
	exit (exit_code);
};

int main(int argc, char* argv[])
{
	//Read options
	while(iarg != -1){
		iarg = getopt_long(argc, argv, "+D:t:i:l::shv::Vg:d:r:S:", longopts, &ind);
		switch (iarg){
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
			printf("Scan Window\n");
			copyright();
			return 0;
			break;
		case 'l':
			if(optarg){logfile = fopen(optarg,"w");
			}else{logfile = fopen("log.txt","w");};
			break;
		case 'D':
			selection = optarg;
			value = parse_detector_switch(selection);
			if(value < 0 ){return -1;} //If there's an error, pass it through.
			break;
		case 't':
			if(verbose > 1){printf("Threshold supplied: %s\n",optarg);}
			thrs = atoi(optarg);
			if(verbose > 1){printf("Threshold successfully set to %d.\n",thrs);}
			break;
		case 'g':
			if(verbose > 2){printf("Hey I'm in case g\n");}
			gateflag = 1;
			gtemp = optarg;
			break;
		case 'r':
			rangeflag = 1;
			rtemp = optarg;
			break;
		case 'i':
			inhib = atoi(optarg);
			break;
		case 'd':
			delay = atoi(optarg);
			break;
		case 'S':
			skip = atoi(optarg);
			break;
		}
	}

	fp = fopen("out.csv","w");

	//Verbosity message
	if(verbose > 0){
		printf("Running in verbose mode. Verbosity: %d\n",verbose);
	};

	//Convert gtemp into the two gates and rtemp into min/max/step
	if(gateflag == 1){ //if gate was set,
		parse_gate(gtemp,verbose);
	}
	if(rangeflag == 1){ //if range was set,
		parse_range(rtemp,verbose);
	}
	if(verbose > 1){
		printf("range min: %d. range max: %d. step size: %d.\n",range_l,range_u,range_s);
	}

	//Detector on/off
	if(verbose > 1){
		printf("Detector string value supplied: %s\n",selection);
	}
	disable = on_to_off(disable_t,value,verbose);

	//Connect to the board. 
	int connect_q = connect_staticaddr(verbose);
	if(connect_q != 0){
		printf("Board connection error code: %d\n",connect_q);
		return connect_q;
	}

	//Now set all the values we determined above
	disable_q = disable_dets(disable_t, disable);
	for(int i=0; i<24; i++){
		if(disable_q[i] != 0){
			printf("Unable to set on/off state of detector #%d! Aborting.\n",i);
			return -1;
		}
	}

	//Final run setup
    int top = thrs + range_l; //top of the window in trigger window
	
	if(logfile != NULL){
		fprintf(logfile,"============ Settings ============\n");
		fprintf(logfile,"Starting threshold:			%d\n",thrs);
		fprintf(logfile,"Trigger Inhibition Time:		%d\n",inhib);
		fprintf(logfile,"Upper Gate:					%d\n",gate_u);
		fprintf(logfile,"Lower Gate: 					%d\n",gate_l);
		fprintf(logfile,"Polarity (Neg 0, Pos 1):		%d\n",polarity);
		fprintf(logfile,"Upper threshold scanning from %d to %d in steps of %d.\n",range_l,range_u,range_s);
		fprintf(logfile,"Detectors enabled:				\n");
		for(int i=0;i++;i<24){
			if(disable[i] == 0){fprintf(logfile,"%d, ",i);}
		}
		fprintf(logfile,"\b\b\n\n"); //clear trailing comma and space before inserting two newlines.
	};
	
	//Pass them along to the system
	if(verbose>0){printf("Configuring...\n");};
	thrs_q = set_by_polarity(REG_thrsh_SET,polarity,thrs);
	if(thrs_q != 0){
		printf("Error from REG_thrsh_SET. Aborting.\n");
		return thrs_q;
	}
	inhib_q = REG_inhib_SET(inhib,&handle);		//Set number of clock ticks to inhibit data by
	delay_q = REG_delay_SET(delay,&handle);			
	gate_uq = REG_gate_u_SET(gate_u,&handle);			
	gate_lq = REG_gate_l_SET(gate_l,&handle);	
	polarity_q = REG_polarity_SET(polarity,&handle);	//Set polarity to negative
	
	//Run phase - undo reset
	if(verbose>0){printf("Setting up rate counter... \n");};
	tic = time(NULL);
	
	fprintf(fp,"top, rate\n"); // add a header row
	if(verbose>0){printf("Collecting data! \n");};
	sleep(5); //let the board catch up to settings.
	//Collect data
	while(top < thrs + range_u){	
		//reset the threshold
		if(verbose>1){printf("Updated top threshold:\n");};
		if(verbose>1){printf("%d\n",top);};

		top_q = set_by_polarity(REG_top_SET,polarity,top);
		if(top_q != 0){
			printf("Error from REG_top_SET. Aborting.\n");
			return top_q;
		}

		//wait
		sleep(10);
		
		//get the rate
		if(verbose > 1){printf("Retreiving data...\n");};
		rate_q=RATE_METER_RateMeter_0_GET_DATA(rateval,ratechan,ratetimeout, &handle, &rateread_data, &ratevalid_data);
		if(verbose > 1){printf("Rateval: %f\n",rateval[0]/10.0);};

		//write the rate
		fprintf(fp,"%d, %f\n",top,rateval[0]/10.0);
		if(verbose>1){printf("top: %d ; rate: %f Hz\n",top,rateval[0]/10.0);};
		top += range_s;
	};
	if(verbose > 2){printf("top: %d, limit: %d. Time to stop!\n",top,thrs+range_u);}

	if(verbose>0){printf("Data collection complete.\n");};
	toc = time(NULL);
	int elapsed = (int)toc-(int)tic; 	//total time elapsed
	if(verbose>2){
		printf("%d to %d\n",(int)tic,(int)toc);
		printf("%d\n",elapsed);	//debug
	};
	print_timestamp(elapsed,verbose);
	if(logfile != NULL){fclose(logfile);};
	fclose(fp);
	return 0;
}
