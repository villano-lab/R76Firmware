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

void print_usage(FILE* stream, int exit_code){ //This looks unaligned but lines up correctly in the terminal output
	fprintf (stream, "Usage:  %s options \n", program_name);
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
		iarg = getopt_long(argc, argv, "d:i:l::shv::Vg:D:T:", longopts, &ind);
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
	
	//set up variables before reset.
	read_q = REG_read_SET(0,&handle);
	if(read_q != 0){
		printf("Error! Failed to set the `read` variable.\n");
		return read_q;
	}
	write_q = REG_write_SET(0,&handle);
	if(write_q != 0){
			printf("Error! Failed to set the `write` variable.\n");
			return write_q;
		}	
	int i=1;
	if(verbose>0){printf("Running until interrupt. Press any key to stop printing.\n");}
	if(verbose>0){printf("If you are not getting any triggers, please try running `setthresh.exe -R` and try again.\n");}
	
	//Reset everything real quick
	ratereset_q = REG_ratereset_SET(1,&handle);
	if(ratereset_q != 0){
		printf("Error! Failed to set the 'reset' variable.\n");
		return ratereset_q;
	}	
	ratereset_q = REG_ratereset_SET(0,&handle);
	if(ratereset_q != 0){
		printf("Error! Failed to set the 'reset' variable.\n");
		return ratereset_q;
	}
	while(kbhit() != 1){
		//check if there's data.
		empty_q = REG_empty_GET(&empty,&handle);
		if(empty_q != 0){
			printf("Error! Failed to get the `empty` variable.\n");
			return empty_q;
		} //if there is,
		if(empty != 1){
			//print a warning if we're not keeping up.
			full_q = REG_full_GET(&full,&handle);
			if(full_q != 0){
				printf("Error! Failed to get the `full` variable.\n");
				return full_q;
			}
			if(verbose > -1 && full == 1){printf("WARNING: The FIFO is full!\n");}
			//read out a piece
			read_q = REG_read_SET(1,&handle);
			if(read_q != 0){
				printf("Error! Failed to set the `read` variable.\n");
				return read_q;
			}
			read_q = REG_read_SET(0,&handle);
			if(read_q != 0){
				printf("Error! Failed to set the `read` variable.\n");
				return read_q;
			}
			fifo_q = REG_fifo_GET(&fifo,&handle);
			if(fifo_q != 0){
				printf("Error! Failed to get the `fifo` variable.\n");
				return fifo_q;
			}
			//print fifo variable
			if(verbose > 0){printf("%u (%d); ",fifo,i);}
			i++;
		}
		
	}
	while(empty == 0){
	}
	printf("\n"); //be nice to the terminal
	//stop reading & writing and reset.
	read_q = REG_read_SET(0,&handle);
		if(read_q != 0){
			printf("Error! Failed to set the `write` variable.\n");
			return read_q;}
	write_q = REG_write_SET(0,&handle);
	if(write_q != 0){
			printf("Error! Failed to set the `write` variable.\n");
			return write_q;
		}	
	ratereset_q = REG_ratereset_SET(1,&handle);
	if(ratereset_q != 0){
		printf("Error! Failed to set the 'reset' variable.\n");
		return ratereset_q;
	}	
	ratereset_q = REG_ratereset_SET(0,&handle);
	if(ratereset_q != 0){
		printf("Error! Failed to set the 'reset' variable.\n");
		return ratereset_q;
	}
	return 0;
}	
