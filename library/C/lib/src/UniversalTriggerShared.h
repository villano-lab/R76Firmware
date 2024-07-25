#include <stdio.h>
#include "Legacy/R76Firmware_lib.h"
#include "Legacy/Def.h"
#include "Legacy/RegisterFile.h"
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <termios.h>
#include <unistd.h>
#include <string.h>
#include <getopt.h>
#include <math.h>
#include <iostream>

//Text defines
#define BOARD_IP_ADDRESS ("134.84.150.114")
#define DET_TEXT      (" -D,	--det	    <# or source name>	    Choose which detectors to trigger on (default: all).\n				            Number values are bitwise from 0 to all 1s in 32 bit (4294967295).\n")
#define GATE_TEXT     (" -g,	--gate	    '<lower #> <upper #>'   Set the gate times for the upper and lower triggers in clock ticks (integer. defaults: 10-100)\n					    The two entries are delimited by spaces, commas, or dashes. Both must be provided.\n")
#define DELAY_TEXT    (" -d,	--delay	    <delay length>          Set the value of the delay time in clock ticks (integer. default: 50)\n")
#define INHIB_TEXT    (" -i,	--inhibit   <inhibit>	            Set the value of the inhibit time in clock ticks (integer. default: 1000)\n")
#define THRESH_TEXT   (" -t,    --thresh    <threshold>	            Set the value of the (lower) threshold in MeV (default: 1). \n")
#define RANGE_TEXT    (" -r,	--range	    '<lower #> <upper #> <step size>'	Set the range and step size for upper thresholds to be scanned, in MeV (default: min 0, max 8, step size 1).\n")
#define SKIP_TEXT     (" -S,    --skip      <#>                     [DEPRECATED] Skip every # trigger to reduce the rate.\n")
#define BASELINE_TEXT (" -b,    --baseline  <baseline>              Set the time (positive integer) to measure the baseline; measurement takes place over 2^n clock ticks. Supplying 0 forces manual mode, which uses previously calculated values. (default: 9)\n                                            WARNING! This will have unintended consequences for calibration, thresholds, and pulse integration. USE FOR DEV ONLY!\n")
#define VERBOSE_TEXT  (" -v,	--verbose   <level>                 Print verbose messages at the specified level (1 if unspecified).\n")
#define SILENT_TEXT   (" -s,-q,	--silent,--quiet,                   Print nothing. (Negative verbosity) \n")
#define LOG_TEXT      (" -l,	--log	    <file>                  Log terminal output. (default: log.txt) \n")
#define VERSION_TEXT  (" -V, 	--version                           Print version and exit.\n")
#define HELP_TEXT     (" -h,-?,	--help                              Print this help function.\n")
#define TOP_TEXT      (" -T,    --top       <value>                 Set the upper threshold to the given value in MeV (default: 8).\n")
#define RESET_TEXT    (" -R,    --reset                             Reset all unsupplied values to their defaults.\n")
#define FORCE_TEXT    (" -f,    --force                             Skip all requests for user input.\n")
//#define POLARITY_TEXT (" -p,    --polarity  <1 or 0>                Flip polarity to positive (1 or no arg) or leave as-is (0). (default: 1)\n")
#define PRE_INT_TEXT  (" -P,    --pre-int   <#>                     Set the pre-integration time in clock cycles. (integer. default: 30)\n")
#define INT_TIME_TEXT (" -I,    --int-time  <#>                     Set the integration time in clock cycles. (integer. default: 250)\n")
#define CONFIG_TEXT   (" -c,    --config    <file>                  Take parameters from a config file. See example.config for formatting. (default: example.config)\n")
#define WAIT_TEXT     (" -w,    --wait      <#>                     Set the number of 10-second cycles to wait through for data collection. (integer. if not supplied, uses one cycle.)\n")
//Assigning buffer sizes
#define BUFFER_SIZE (1024)

//Defaults
extern int verbose;
extern float thrs;
extern uint32_t value;
extern int gate_u;
extern int gate_l;
extern float range_u;
extern float range_l;
extern float range_s;
//extern int polarity;
extern int inhib;
extern int delay;
extern int baseline;
extern int manual_baseline;
extern float top;
extern int int_time;
extern int pre_int;
//Register-reading Variables
extern NI_HANDLE handle;
extern int *thresh_q;
extern int delay_q;
extern int gate_uq;
extern int gate_lq;
extern int inhib_q;
//extern int polarity_q;
extern char* selection;
extern int *disable_q;  // point to array of disable instead of 24 iintializations
extern int *disable;
extern uint32_t *specread_q;
extern uint32_t *specvalid;
extern uint32_t spectra_t[32];
extern uint32_t specvalid_t[32];
extern int disable_t[32];
extern int thresh_t[32];
extern int specdat[32*17*BUFFER_SIZE];
extern uint32_t spec_dl[32*17*BUFFER_SIZE];
extern uint32_t size;
extern int reset_q;
extern int read_q;
extern int write_q;
extern int empty_q;
extern int full_q;
extern int fifo_q;
extern int skip_q;
extern int custom_q;
extern int int_time_q;
extern int baseline_q;
extern int pre_int_q;
extern int stopwrite_q;
extern uint32_t read_data;
extern uint32_t valid_data;
extern uint32_t custom;
extern uint32_t status;
extern uint32_t fifo;
extern uint32_t empty;
extern uint32_t full;
extern uint32_t skip;
//Command-line-reading Variables
extern int ind;
extern int iarg;
extern const struct option longopts[];
extern char* gtemp;
extern char* rtemp;
extern int gateflag;
extern int gateflagl;
extern int gateflagu;
extern int rangeflag;
extern int detflag;
extern int gateflag;
extern int delayflag;
extern int inhibflag;
extern int delayflag;
extern int threshflag;
extern int topflag;
extern int polflag;
extern int skipflag;
extern int preflag;
extern int intflag;
extern int baseflag;
extern int reset;
extern int force;
extern int wait;
extern const char* configfilename;
//Other Variables
extern int i;
extern char userinput[3];
extern time_t tic, toc;
extern FILE *logfile;
extern FILE *fp;
//Rate Counter Variables
extern int rate_q;
extern int unreduced_q;
extern uint32_t unreduced[160];
extern uint32_t rateval[160]; //needs to be pre-allocated
extern uint32_t ratechan;
extern uint32_t ratetimeout; //timeout in ms
extern uint32_t rateread_data;
extern uint32_t ratevalid_data;

//Functions
//===========================================================================
//printing functions
void printbits(unsigned char v);                                        //print bits of an int https://stackoverflow.com/a/700184
void print_usage(FILE* stream, int exit_code);                          //print usage of the program
void copyright();                                                       //print copyright information
void subhelp(FILE* stream);
//parsing functions
int parse_detector_switch(char* selection);                             //parse a string representing detector on/off
int parse_gate(char* gatestring, int verbose);                          //parse a string representing multiple gate values
int parse_range(char* gatestring, int verbose);                         //parse a string representing a range of values with step size
void print_timestamp(int elapsed, int verbose);                         //parse a time elapsed value and print it in readable format
void read_config(const char* filename);                                 //parse a config file for values
//converting functions
int *on_to_off(int *off, uint32_t on, int verbose);                     //convert a 'detectors on' bit vector to a 'detectors off' bit vector
int energy_to_bin(int detnum, float energy,int baseline);               //convert an energy value to a bin value
//compatibility functions
int REG_top_SET(uint32_t value, NI_HANDLE* handle);                     //set all top thresholds to a bin number
int REG_thrsh_SET(uint32_t value, NI_HANDLE* handle);                   //set all lower thesholds to a bin number
//multichannel functions
int *disable_dets(int *disable_q, int disable[24]);                     //disable detectors based on input array
int *set_thresholds(const char* side, float energy, int *thresh_q, int baseline);     //run the REG_?_0_SET functions for either upper or lower thresholds, all at once, for a single energy value.
uint32_t *spectra_PARAMS(int *spectra_q,int32_t Rebin, int32_t LimitMode, int32_t LimitValue); //set up spectrum parameters
uint32_t *spectra_START(uint32_t *spectra_q);
uint32_t *spectra_STOP(uint32_t *spectra_q);
uint32_t *spectra_FLUSH(uint32_t *spectra_q);
uint32_t *spectra_RESET(uint32_t *spectra_q);
uint32_t *spectra_SET(uint32_t rebin, uint32_t limit_mode, uint32_t limit_value, uint32_t *spectra_q);
uint32_t *spectra_STATUS(uint32_t *spectra_q);
uint32_t *spectra_DOWNLOAD(uint32_t *specdat, uint32_t timeout, uint32_t *specread_q, uint32_t *specvalid_q);
//utility functions
int connect_staticaddr(int verbose);                                    //connect to the board, with print functions.
//int set_by_polarity(uint32_t address, int polarity, int value);  //run a REG_?_SET function to set a value above or below the baseline, depending on the polarity.
int kbhit(void);                                                        //allow keyboard interrupt
