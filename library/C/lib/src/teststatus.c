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

#include  "Legacy/R76Firmware_lib.h"
#include  "UniversalTriggerShared.h"

const char* program_name = "teststatus";
int waittime=12; //default 2 minutes data
uint32_t gatewidth;
uint32_t counts;
int numtries = 10;

void print_usage(FILE* stream, int exit_code){ //This looks unaligned but lines up correctly in the terminal output
	fprintf (stream, "Usage:  %s options \n", program_name);
    fprintf (stream, WAIT_TEXT);
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
		iarg = getopt_long(argc, argv, "d:i:l::shv::Vg:w:", longopts, &ind);
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
			if(optarg){
				verbose = atoi(optarg);
			}else{verbose = 1;};
			break;
		case '?':
			print_usage(stdout,0);
			return 0;
			break;
		case 'V':
			printf("Get Spectrum\n");
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
        case 'w':
            waittime = atoi(optarg);
            break;
		}
	}

	//Verbosity message
	if(verbose > 0){
		printf("Running in verbose mode. Verbosity: %d\n",verbose);
	};

	//Connect to the board.
	int connect_q = connect_staticaddr(verbose);
	if(connect_q != 0){
		printf("Board connection error code: %d\n",connect_q);
		return connect_q;
	}

	int i=0;

	uint32_t temp = SPECTRUM_Spectrum_0_START(&handle);
    if(temp != 0){
		printf("Error! Failed to start spectrum 0.\n");
		return temp;
	}
	uint32_t temp2 = SPECTRUM_Spectrum_0_STATUS(&temp,&handle);
	if(temp2 != 0){
		printf("Error! Faield to retrieve status of spectrum 0.\n");
		return temp2;
	}
    printf("Spectrum status (started) %d\n",temp);

    int temp3 = SPECTRUM_Spectrum_0_STOP(&handle);
    if(temp3 != 0){
        printf("Error! Failed to stop spectrum 0.\n");
        return temp3;
    }
	uint32_t temp4 = SPECTRUM_Spectrum_0_STATUS(&temp,&handle);
	if(temp4 != 0){
		printf("Error! Failed to retrieve status of spectrum 0.\n");
		return temp4;
	}
    printf("Spectrum status (stopped): %d\n",temp);

	printf("Count initial value: %d\n",counts);

/*
	for(int i=0;i<numtries;i++){
		/*not working yet
		int temp = REG_gatewidth_GET(&gatewidth,&handle);
		if(temp != 0){
			printf("Error! Failed to retrieve gate width.\n");
		}
		printf("gate width: %d\n",gatewidth);//
		int temp = REG_count_GET(&counts,&handle);
		if(temp != 0){
			printf("Error! Failed to retrieve count.\n");
		}
		printf("count: %d\n",counts);
		sleep(1);
	}
*/
	return 0;
}
