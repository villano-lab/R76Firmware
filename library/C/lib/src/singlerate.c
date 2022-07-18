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

const char* program_name = "scanrate";

void print_usage(FILE* stream, int exit_code){ //This looks unaligned but lines up correctly in the terminal output
	fprintf (stream, "Usage:  %s [options] -- [options to pass to setregisters] \n", program_name);
  	fprintf (stream, CONFIG_TEXT);
	fprintf (stream, VERBOSE_TEXT);
	fprintf (stream, SILENT_TEXT);
	fprintf (stream, LOG_TEXT);
	fprintf (stream, VERSION_TEXT);
	fprintf (stream, HELP_TEXT);
	subhelp(stream);

	exit (exit_code);

	exit (exit_code);
};

int main(int argc, char* argv[])
{
	//Read options
	while(iarg != -1){
		iarg = getopt_long(argc, argv, "l::c::shv::V+", longopts, &ind);
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
			printf("Scan Rate\n");
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
		case 'c':
			if(optarg){
				configfilename = optarg;
			}else{
				configfilename = "example.config";
			}
			read_config(configfilename);
			char* command = malloc(100);
			snprintf(command,100,"./setregisters -c %s -v%d",configfilename,verbose);
			system(command);
			free(command);
			break;
		}
	}

	if(optind!=argc){ //if there are args to pass through, tell the user,
		if(verbose > 0){printf("Running setregisters utility.\n");}
		//then construct, run, and free the command.
		char* command = malloc(100);
		snprintf(command,100,"./setregisters %s -v%d",argv[optind],verbose);
		if(configfilename){
            snprintf(command,100,"%s -c%s",command,configfilename);
        }
		system(command);
		free(command);
	}

	//Verbosity message
	if(verbose > 0){
		printf("Running in verbose mode. Verbosity: %d\n",verbose);
	};

	//Convert gtemp into the two gates and rtemp into min/max/step
	if(gateflag == 1){ //if gate was set,
		parse_gate(gtemp,verbose);
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

	if(verbose>0){printf("Setting up rate counter... \n");};
	tic = time(NULL);
    	
	sleep(10);

	if(verbose>0){printf("Collecting data for 10 seconds! \n");};
	//Collect data
	//wait
	sleep(10);
		
	//get the rate
	if(verbose > 1){printf("Retreiving data...\n");};
	rate_q=RATE_METER_RateMeter_0_GET_DATA(rateval,ratechan,ratetimeout, &handle, &rateread_data, &ratevalid_data);
	if(verbose > 1){printf("Rateval: %f\n",rateval[0]/10.0);};

	//print the rate
	printf("%f\n",rateval[0]/10.0);

	if(verbose>0){printf("Data collection complete.\n");};
	toc = time(NULL);
	int elapsed = (int)toc-(int)tic; 	//total time elapsed
	if(verbose>2){
		printf("%d to %d\n",(int)tic,(int)toc);
		printf("%d\n",elapsed);	//debug
	};
	print_timestamp(elapsed,verbose);
	if(logfile != NULL){fclose(logfile);};
	return 0;
}
