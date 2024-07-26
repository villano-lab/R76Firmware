//Program for scanning over multiple thresholds and recording the rate to a file.
#include "Legacy/Def.h"
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

#include  "Legacy/R76Firmware_lib.h"
#include  "UniversalTriggerShared.h"

const char* program_name = "rate";
FILE *fp;
int lower = thrs;
float rate;

void print_usage(FILE* stream, int exit_code){
	fprintf (stream, "Usage:  %s options \n", program_name);
	fprintf (stream, THRESH_TEXT);
	fprintf (stream, "                                           thresh ignored except in `upper` mode.\n");
	fprintf (stream, TOP_TEXT);
	fprintf (stream, "                                           top ignored except in `lower` mode.\n");
	fprintf (stream, BASELINE_TEXT);
	fprintf (stream, "					     WARNING this only sets the mode that the rate program expects; it does not change the value in the system!");
	fprintf (stream, RANGE_TEXT);
	fprintf (stream, WAIT_TEXT);
	fprintf (stream, VERBOSE_TEXT);
	fprintf (stream, SILENT_TEXT);
	fprintf (stream, LOG_TEXT);
	fprintf (stream, VERSION_TEXT);
	fprintf (stream, HELP_TEXT);
	fprintf (stream, MODE_TEXT);

	exit (exit_code);
};

//a function for collecting data over a given number of 10-second cycles
//for when the rate is too low to run "normally"
float collect_over_time(int wait){
	float cumulative = 0;
	for(i = 0; i<wait; i++){
		//firmware does all the work here. thanks firmware!
		sleep(10);

		//get the rate
		rate_q=RATE_METER_RateMeter_GET_DATA(rateval,ratechan,ratetimeout, &handle, &rateread_data, &ratevalid_data);
		cumulative += rateval[0]/10.0;
	}
	return cumulative/wait;
}

int main(int argc, char* argv[])
{
	//Read options
	while(iarg != -1){
		iarg = getopt_long(argc, argv, "+l::shv::VT:t:r:w:m:b:", longopts, &ind);
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
			printf("Rate\n");
			copyright();
			return 0;
			break;
		case 'l':
			if(optarg){
				logfile = fopen(optarg,"w");
			}else{
				logfile = fopen("log.txt","w");
			};
			break;
		case 'r':
			rangeflag = 1;
			rtemp = optarg;
			break;
		case 'T':
			top = atof(optarg);
			break;
		case 't':
			lower = atof(optarg);
		case 'w':
			wait = atoi(optarg);
			break;
		case 'm':
			mode = optarg[0]; //v if the value doesn't make sense, give up
			if(mode != 'l' && mode != 'u' && mode != 'w' && mode != 's'){
				print_usage(stdout,6);
			}
			break;
		case 'b':
			baseline = atoi(optarg);
			break;
		}
	}

	fp = fopen("out.csv","w");

	//Verbosity message
	if(verbose > 0){
		printf("Running in verbose mode. Verbosity: %d\n",verbose);
		printf("Run mode: %c\n",mode);
	};

	//Convert rtemp into min/max/step
	if(rangeflag == 1) parse_range(rtemp,verbose);
	if(verbose > 1) printf("range min: %f. range max: %f. step size: %f.\n",range_l,range_u,range_s);

	//Connect to the board.
	int connect_q = connect_staticaddr(verbose);
	if(connect_q != 0){
		printf("Board connection error code: %d\n",connect_q);
		return connect_q;
	}

	//logfile setup
	if(logfile != NULL){
		fprintf(logfile,"============ Settings ============\n");
		fprintf(logfile,"Rate mode: %c.\n",mode);
		fprintf(logfile,"Range: %f to %f in steps of %f.\n",range_l,range_u,range_s);
		fprintf(logfile,"Baseline mode: %d.\n",baseline);
	}

	//set up initial thresholds
	if(mode == 'l' || mode == 'w') thrs = range_l;
	else if(mode == 'u') top = range_l;
	if(mode == 'w') top = range_l + range_s; //not alternative, bc of 1st case
	//else if(mode == 'w')
	if(mode != 's'){//don't set thresholds in single rate mode.
		if(verbose) printf("Configuring...\n");
		thresh_q = set_thresholds("high",top,thresh_t,baseline);
		multicheck(thresh_q,24,"setting upper thresholds");
		if(verbose > 1) printf("Updated top threshold to initial value: %f\n",top);
		thresh_q = set_thresholds("low",thrs,thresh_t,baseline);
		multicheck(thresh_q,24,"setting lower thresholds");
		if(verbose > 1) printf("Updated lower threshold to initial value: %f\n",thrs);
		fprintf(fp,"lower (MeV), top (MeV), rate (Hz)\n");
	}

	//let the board catch up to settings
	if(verbose) printf("Collecting data!\n");
	sleep(10);

	//THE ACTUAL DATA COLLECTION --------------------------------------------------
	//single rate mode
	if(mode == 's'){ //single rate mode
		rate_q = RATE_METER_RateMeter_GET_DATA(rateval,ratechan,ratetimeout,&handle,&rateread_data,&ratevalid_data);
		printf("%f\n",rateval[0]/10.0);
	}else if(mode == 'l'){
		while(thrs <= range_u){
			if(verbose>1) printf("Retrieving data...\n");
			rate = collect_over_time(wait);
			fprintf(fp,"%f, %f, %f\n",thrs,top,rate);
			if(verbose>1) printf("thresh: %f ; rate: %f Hz\n",thrs,rate);

			//set up for next iteration
			thrs += range_s;
			thresh_q = set_thresholds("low",thrs,thresh_t,baseline);
			if(verbose>1) printf("Updated lower threshold: %f\n",thrs);
		}
		if(verbose > 2) printf("thresh: %f, limit: %f. Time to stop!\n",thrs,range_u);
	}else if(mode == 'u'){
		while(thrs <= range_u){
			if(verbose>1) printf("Retrieving data...\n");
			rate = collect_over_time(wait);
			fprintf(fp,"%f, %f, %f\n",thrs,top,rate);
			if(verbose>1) printf("top %f ; rate: %f Hz\n",top,rate);

			//set up for next iteration
			top += range_s;
			thresh_q = set_thresholds("top",top,thresh_t,baseline);
			if(verbose>1) printf("Updated top threshold: %f\n",top);
		}
		if(verbose > 2) printf("top: %f, limit: %f. Time to stop!\n",top,range_u);
	}else if(mode == 'w'){
		while(thrs < range_u){ //not <= because upper also moves.
			if(verbose>1) printf("Retrieving data...\n");
			//getting structure down before I allow waiting time to be set.
			rate = collect_over_time(wait);
			fprintf(fp,"%f, %f, %f\n",thrs,top,rate);
			if(verbose>1) printf("lower: %f ; upper: %f ; rate: %f Hz\n",thrs,top,rate);
			//set up for next iteration
			//left off at line 189
			thrs += range_s;
			top += range_s;
			thresh_q = set_thresholds("low",thrs,thresh_t,baseline);
			multicheck(thresh_q,24,"setting lower thresholds");
			thresh_q = set_thresholds("upper",thrs,thresh_t,baseline);
			multicheck(thresh_q,24,"setting lower thresholds");
		}
	}//else{ //error handling

	//CLEANUP ---------------------------------------------------------------------
	if(verbose) printf("Data collection coplete.\n");
	if(logfile) fclose(logfile);
	return 0;
}
