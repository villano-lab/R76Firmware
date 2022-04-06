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

#include  "ANSK_Custom5_lib.h"

#define BOARD_IP_ADDRESS "134.84.150.42"

int verbose = 0;
//Registers
NI_HANDLE handle;
int thrs_q;
int inib_q;
int polarity_q;
int inttime_q;
int pre_q;
int pileup_q;
int gain_q;
int ofs_q;
int baseline_q;
int read_q;
int energy_q;
uint32_t energy;
int empty_q;
uint32_t empty;
time_t tic, toc;
const char* program_name = "integrate";
FILE *fp;
FILE *logfile;
/*std::string outputfile="out.root";
std::string BOARD_IP_ADDRESS = "134.84.150.42";
char *board_ip_char = const_cast<char*>(BOARD_IP_ADDRESS.c_str());*/

const struct option longopts[] =
{
	{"help",	no_argument,		0,	'h'},
	{"log",	optional_argument,	0,	'l'},
	{"quiet",	no_argument,		0,	'q'},
	{"silent",	no_argument,		0,	's'},
	{"verbose",	optional_argument,	0,	'v'},
	{"version",	no_argument,		0,	'V'},
	{0,		0,			0,	0},
};

void print_usage(FILE* stream, int exit_code){
	fprintf (stream, "Usage:  %s options [ inputfile(s) ]\n", program_name);
  	fprintf (stream,
	" -v,			--verbose	<level>	Print verbose messages at the specified level (level 1 if unspecified).\n"
	" -s,-q,		--silent,--quiet,		Print nothing.\n"
	" -l,			--log		<file>		Log terminal output.\n"
	" -V, 			--version			Print version and exit.\n"
	" -h,-?,		--help				Print this help function.\n"
);
  exit (exit_code);
};

int kbhit(void)
        {
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

int main(int argc, char* argv[])
{
	//Read options
	int index;
	int iarg=0;
	while(iarg != -1){
		iarg = getopt_long(argc, argv, "+l:n:o:shd:v::V", longopts, &index);

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
			printf("Integrate!\n");
			printf("Copyright (c) 2022 Anthony Villano, Kitty Harris \n");
			printf("License: The Expat license  <https://spdx.org/licenses/MIT.html> \n");
			printf("This is free software: you are free to change and redistribute it. \n");
			printf("There is NO WARRANTY, to the extent permitted by law. \n");
			return 0;
			break;
		case 'l':
			if(optarg){logfile = fopen(optarg,"w");
			}else{logfile = fopen("log.txt","w");};
			break;
		}
	}

	//Connect to the board. 
	if(verbose > 0){
		printf("Running in verbose mode. Verbosity:%d\n",verbose);
	};
	R_Init();
	//If can't connect to the board, abort.
	if(R_ConnectDevice(BOARD_IP_ADDRESS, 8888, &handle) != 0) { 
		printf("Unable to connect to the board!\n"); 
		if(logfile != NULL){fprintf(logfile,"Unable to connect to the board at %s!\n",BOARD_IP_ADDRESS);};
		return (-1); 
	}else{
		if(verbose>0){printf("Connected.\n");};
		if(logfile != NULL){fprintf(logfile,"Connected to board at %s\n",BOARD_IP_ADDRESS);};
	};

	//Configure settings
	int thrs = 250;	//amount LESS THAN 8192 for threshold.
	int inttime = 100;	//length of integration window
	int pre = 20;		//time before trigger to include in integration
	int pileup = 200;	//length of time inside integral to look for pileups.
	int inib = 50;		//inhibition time on trigger block
	int gain = 100;	//firmware-side gain
	//things you probably won't change
	int polarity = 0;	//zero for negative, one for positive
	int offset = 0;	//offset to add to integral results(?)
	//things that are set based on external factors
	double extgain = 5;	//gain set from the browser interface
	
	if(logfile != NULL){
		fprintf(logfile,"============ Settings ============\n");
		fprintf(logfile,"Threshold:			%d\n",thrs);
		fprintf(logfile,"Integration Time:		%d\n",inttime);
		fprintf(logfile,"Pre-integration Window:	%d\n",pre);
		fprintf(logfile,"Pileup Length:		%d\n",pileup);
		fprintf(logfile,"Trigger Inhibition Time:	%d\n",inib);
		fprintf(logfile,"Gain:				%d\n",gain);
		fprintf(logfile,"Polarity (Neg 0, Pos 1):	%d\n",polarity);
		fprintf(logfile,"Offset:			%d\n",offset);
		fprintf(logfile,"External gain (filename only):%g\n\n",extgain); //need a better name for "external gain"
	};
	
	//Pass them along to the system
	if(verbose>0){printf("Configuring...\n");};
	read_q = REG_read_SET(0,&handle);
	if(polarity==0){
		thrs_q = REG_thrs_SET(8192-thrs,&handle);	//Set cutoff for GT check
	}else if(polarity==1){
		thrs_q = REG_thrs_SET(8192-thrs,&handle);	//addition isn't working?
	}else{printf("Polarity is invalid! (Must be 1 or 0.) Aborting...\n"); return -1;}
	inttime_q = REG_inttime_SET(inttime,&handle);		//Set number of samples to integrate over
	inib_q = REG_inib_SET(inib,&handle);			//Set number of samples to delay data by
	polarity_q = REG_polarity_SET(polarity,&handle);	//Set polarity to negative
        pre_q = REG_pre_SET(pre,&handle);			//Set time between trigger and start of area to integrate
        pileup_q = REG_pileup_SET(pileup,&handle);		//Set pile-up rejection time
        gain_q = REG_gain_SET(gain,&handle);			//Set gain
        ofs_q = REG_ofs_SET(offset,&handle);			//Set offset to supply for integrator block.
	
	//Automatically generate a filename.
	if(verbose>0){printf("Generating filename: ");};
	char* filepath = "../../../data/";
	char* filename = malloc(100); // Make space for 100 characters
	snprintf(filename,100,"_t%d_i%d-%d-%d_h%d_g%d-%g",thrs,inttime,pre,pileup,inib,gain,extgain);
	if(polarity == 1){strcat(filename,"_pos");};
	if(offset != 0){
		char* temp = malloc(10);
		snprintf(temp, 10, "_o%d",offset);
		strcat(filename,temp);
		free(temp);
	};
	strcat(filename,".csv");
	char* fullpath = malloc(100);
	strcat(fullpath,filepath);
	strcat(fullpath,filename);
	if(verbose>0){printf("%s\n",fullpath);};
	
	
	//char filename = "_t" + (str)(abs(thrs - 8192)) + "_i" + (str)inttime + "-" + (str)pre + "-" + (str)pileup + "_h" + (str)inib + "_g" + (str)gain + "-.csv"
	//Open file to write to.
	if(verbose>1){printf("Opening file to write to...\n");};
	fp = fopen(fullpath,"w");
	
	/*//Open ROOT file
	TFile *f = TFile::Open(outputfile.c_str(),"recreate");
	TTree *t = new TTree("peaks","peaks");
	t->Branch("peakval",&dpeakval,"peakval/D");*/

	//Run phase - undo reset
	printf("Running until keyboard interrupt. Press any key to end acquisition.\n");
	tic = time(NULL);
	
	//Collect data
	while(!kbhit()){
		empty_q = REG_empty_GET(&empty,&handle); //check if the FIFO is empty.
		if(empty){if(false){printf("Fifo was empty this time.\n");};
		}else{
			read_q = REG_read_SET(1,&handle); 	// flip read on and off to retrieve data
			read_q = REG_read_SET(0,&handle);
			energy_q = REG_energy_GET(&energy, &handle);
		// t->Fill();
			fprintf(fp, "%d\n", energy);		//Save the value
			if(verbose>2){printf("Pulse: %d\n",energy);};
		};
	};
	//*/
	/*t->Write("",TObject::kOverwrite);
	f->Close();*/
	toc = time(NULL);
	fclose(fp);
	int elapsed = (int)toc-(int)tic; 	//total time elapsed
	if(verbose>1){
		printf("%d to %d\n",(int)tic,(int)toc);
		printf("%d\n",elapsed);	//debug
	};
	int hours = floor(elapsed / 3600);
	int minutes = floor((elapsed % 3600)/60);
	int seconds = floor((elapsed % 60));
	char* timestamp = malloc(100);
	snprintf(timestamp,100,"%02d-%02d-%02d",hours,minutes,seconds);
	if(verbose>1){printf("Timestamp: %s\n",timestamp);};
	if(verbose>-1){printf("Time elapsed: %02d:%02d:%02d \n",hours,minutes,seconds);};
	char* newfilename = malloc(100);
	snprintf(newfilename,100,"%s%s%s",filepath,timestamp,filename);
	rename(fullpath,newfilename);
	free(filename);
	free(fullpath);
	free(newfilename);
	if(logfile != NULL){fclose(logfile);};
	return 0;
}
