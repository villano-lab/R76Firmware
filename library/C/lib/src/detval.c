// detval -- a utility function to give a decimal value for the "-D" / "--detector" argument

//dunno if I need all of these yet
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <unistd.h>
#include <iostream>
#include "UniversalTriggerShared.h" //for arguments bc i'm lazy.
#include "Legacy/R76Firmware_lib.h"

const char* program_name = "detval";

void print_usage(FILE* stream, int exit_code){
	fprintf(stream, "Usage: %s desired-detector desired-detector desired-detector...\n",program_name);
	fprintf(stream, "Provide all detectors you would like ENABLED as separate arguments, in plain (positive) integer format. ");
	fprintf(stream, "The program will print a number which you can then use with the '-D' argument of setregisters to set the desired detectors as enabled and all others as disabled. ");
	fprintf(stream, "Use 'setregisters -h' for more information.\n");
	fprintf(stream, HELP_TEXT);
	exit (exit_code);
}

int main(int argc, char* argv[]){
	while(iarg != -1){
		iarg = getopt_long(argc,argv,"h",longopts,&ind);
		switch(iarg){
		case 'h':
			print_usage(stdout,0);
			return 0;
			break;
		}

	}

	std::cout << argc << "arguments: " << argv << std::endl;
}
