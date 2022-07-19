// A program that takes all newly-detected peaks and prints them to a csv file.
// Runs with a fixed window width and moves the window up based on a provided range.
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

#include  "R76Firmware_lib.h"
#include  "UniversalTriggerShared.h"

const char* program_name = "scanwindow";

void print_usage(FILE* stream, int exit_code){ //This looks unaligned but lines up correctly in the terminal output
	fprintf (stream, "Usage:  %s options \n", program_name);
  	fprintf (stream, DET_TEXT);
	fprintf (stream, DELAY_TEXT);
	fprintf (stream, INHIB_TEXT);
	fprintf (stream, TOP_TEXT);
	fprintf (stream, RANGE_TEXT);
	fprintf (stream, WAIT_TEXT);
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
		iarg = getopt_long(argc, argv, "+l::c::shv::Vg:r:w:p:", longopts, &ind);
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
            break;
        case 'r':
            rangeflag = 1;
            rtemp = optarg;
            break;
        case 'w':
            wait = atoi(optarg);
            break;
        case 'p':
            polflag = 1;
            if(optarg){polarity = atoi(optarg);
            }else{polarity = 1;}
            break;
        }
    }

    if(verbose >0){
		printf("Running in verbose mode. Verbosity: %d\n",verbose);
	};

    if(optind!=argc){ //if there are args to pass through, tell the user,
        char* command = malloc(100);
		//then construct, run, and free the command.
		snprintf(command,100,"./setregisters %s -v%d ",argv[optind],verbose);
        i = 1;
        int done = 0;
        if(verbose > 2){printf("command progress: %s\n",command);}
        while(!done){
            if(optind+i == argc || argv[optind+i] == NULL){
                if(verbose > 2){printf("Done constructing command.");}
                done = 1;
            }else{
                strcat(command,argv[optind+i]);
                strcat(command," ");
                if(verbose > 2){printf("command progress: %s\n",command);}
                i++;
            }
        }
        if(verbose > 0){printf("Running setregisters utility.\n");}
        if(configfilename){
            snprintf(command,100,"%s -c%s",command,configfilename);
        }
        if(polflag){
            snprintf(command,100,"%s -p%d",command,polarity);
        }
        if(verbose > 0){
            printf("%s\n",command);
        }
		system(command);
		free(command);
	}

    fp = fopen("out.csv","w");

    //pre-connection setup
    if(verbose >0){
		printf("Running in verbose mode. Verbosity: %d\n",verbose);
	};
	if(rangeflag == 1){ //if range was set,
		parse_range(rtemp,verbose);
	}
    thrs = range_l;
    top = thrs + range_s;
    //Connect to the board.
	int connect_q = connect_staticaddr(verbose);
	if(connect_q != 0){
		printf("Board connection error code: %d\n",connect_q);
		return connect_q;
	}

    //Pass them along to the system
	if(verbose>0){printf("Configuring...\n");};
    if(polflag == 1){
        polarity_q = REG_polarity_SET(polarity,&handle);
        if(polarity_q != 0){
            printf("Error from REG_polarity_SET. Aboring.\n");
            return polarity_q;
        }
    }
	tic = time(NULL);
    fprintf(fp,"lower, upper, rate\n"); // add a header row
    int i;
	if(verbose>0){printf("Collecting data! \n");};
    while(thrs < range_u){
        //update the threshold
        if(verbose>1){
            printf("Updated threshold:\n");
            printf("%d, %d\n",thrs,top);
        }
        thrs_q = set_by_polarity(REG_thrsh_SET,polarity,thrs);
		if(thrs_q != 0){
			printf("Error from REG_thrs_SET. Aborting.\n");
			return thrs_q;
		}
        top_q = set_by_polarity(REG_top_SET,polarity,top);
        if(top_q != 0){
            printf("Error from REG_top_SET. Aborting.\n");
            return top_q;
        }

        float cumulative = 0;
        sleep(10);
        for(i = 0; i<wait; i++){
			//wait
			sleep(10);
			
			//get the rate
			if(verbose > 2){printf("Retreiving data...\n");};
			rate_q=RATE_METER_RateMeter_0_GET_DATA(rateval,ratechan,ratetimeout, &handle, &rateread_data, &ratevalid_data);
			if(verbose > 2){printf("Rateval: %f\n",rateval[0]/10.0);};
			cumulative += rateval[0]/10.0;
		}
		if(verbose > 1){printf("Average rate: %f\n",cumulative/wait);}

        //write the rate
        fprintf(fp,"%d, %d, %f\n",thrs,top,cumulative/wait);
		if(verbose>1){printf("lower: %d ; upper: %d, rate: %f Hz\n",thrs,top,cumulative/wait);};
		thrs += range_s;
        top  += range_s;
    }

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