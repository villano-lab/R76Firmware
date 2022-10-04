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

const char* program_name = "fifotest";
int waittime=12; //default 2 minutes data

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
	clock_t begin, end;
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
			if(optarg){verbose = atoi(optarg);
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
	
	fp = fopen("out.csv","w");

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
	
	//Reset everything real quick
	reset_q = REG_reset_SET(1,&handle);
	if(reset_q != 0){
		printf("Error! Failed to set the 'reset' variable.\n");
		return reset_q;
	}	
	reset_q = REG_reset_SET(0,&handle);
	if(reset_q != 0){
		printf("Error! Failed to set the 'reset' variable.\n");
		return reset_q;
	}
	tic = time(NULL);
	
	// Spectrum section
	spectra_STOP(spectra_t);
	for(i=0;i<24;i++){
		if(spectra_t[i] != 0){
			printf("Error! Failed to stop spectrum %d.\n",i);
			return spectra_t[i];
		}
	}

	spectra_RESET(spectra_t);
	for(i=0;i<24;i++){
		if(spectra_t[i] != 0){
			printf("Error! Failed to reset spectrum %d.\n",i);
			return spectra_t[i];
		}
	}

	spectra_FLUSH(spectra_t);
	for(i=0;i<24;i++){
		if(spectra_t[i] != 0){
			printf("Error! Failed to flush spectrum %d.\n",i);
			return spectra_t[i];
		}
	}

	if(verbose > 0){printf("Setup complete; starting acquisition.\n");}

	spectra_START(spectra_t);
	for(i=0;i<24;i++){
		if(spectra_t[i] != 0){
			printf("Error! Failed to start spectrum %d.\n",i);
			return spectra_t[i];
		}
	}
    
	spectra_STATUS(spectra_t);
	for(i=0;i<24;i++){
		if(verbose>0){printf("Status spectrum #%d: %d\n",i,spectra_t[i]);}
	}

    if(verbose > 0){printf("Gathering data for %d seconds.\n",waittime*10);}
    for(i=0;i < waittime;i++){
        if(verbose > 0){printf("%f %% \r",(double)i/waittime);}
        sleep(10); //wait a little while so we can get some data before exiting.
    }

	spectra_STOP(spectra_t);
	for(i=0;i<24;i++){
		if(spectra_t[i] != 0){
			printf("Error! Failed to stop spectrum %d.\n",i);
			return spectra_t[i];
		}
	}

	if(verbose>0){printf("Done taking spectrum data!\n");}
	spectra_STATUS(spectra_t);
	for(i=0;i<24;i++){
		if(verbose>0){printf("Status spectrum #%d: %d\n",i,spectra_t[i]);}
	}

	spectra_DOWNLOAD(spec_dl,1000,spectra_t,specvalid_t);
	for(i=0;i<32;i++){
		fprintf(fp, "Donwloaded data (Spectrum #%d): \n",i);
			for(int j=0;j<BUFFER_SIZE+17;j++){
				fprintf(fp, "%d, ",spec_dl[i+j]);
			}
		fprintf(fp,"\n\n\n");
	}

	return 0;
}	
