/********************************************************************\
towerfe3.c - MIDAS readout of DCRC waveforms, talking to a triggerfe.exe
process.  MUST BE RUN IN CONJUNCTION WITH triggerfe.exe 
This version: December 20, 2013
This program responds to trigger requests sent by the triggerfe.exe program
through the ODB (via a hotlink), and regularly polls to see if any waveform
read requests have been registered in the ODB by triggerfe.exe.  Unlike the 
previous towerfe.c program which makes its own tower-level trigger decisions,
this program only requests trigger primitives through "rt" which commanded
by the trigger module triggerfe.exe, and only requests waveforms from the 
DCRCs that the triggerfe.exe program tells it to fetch.  If triggerfe.exe is
not running, it will simply keep looking in vain to see if any waveforms
have been requested (by polling the ODB key triggerlist), and do nothing
until then.
Creators: Scott Oser
Contact: Scott Oser
\********************************************************************/

//towerfe3 original imports
#include <vector>
#include <unistd.h>
#include <time.h>
#include <sys/time.h>
#include <algorithm>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <iostream>
#include <sstream>
#include "midas.h"
#include "KOsocket.h"
#include "utils1.h"
#include "towerfe3.h"
#include "struct_general.h"
#include "constants.h"
//new standard imports
#include <fcntl.h>
#include <termios.h>
#include <string.h>
#include <getopt.h>
//R76Firmware libraries
#include "/data/chocula/harrisk/R76Firmware/library/C/lib/src/UniversalTriggerShared.h"
#include "/data/chocula/harrisk/R76Firmware/library/C/lib/src/Legacy/R76Firmware_lib.h"
#include "/data/chocula/harrisk/R76Firmware/library/C/lib/src/Legacy/Def.h"
#include "/data/chocula/harrisk/R76Firmware/library/C/lib/src/Legacy/RegisterFile.h"

/* make frontend functions callable from the C framework */
#ifdef __cplusplus
extern "C" {
#endif

/*-- Globals -------------------------------------------------------*/

/* Structures to which we can hotlink the db_open_record */
  GENERAL hotlink_general_struct;
  BYTE rtrequest;

/* The frontend name (client name) as seen by other MIDAS clients   */
char *frontend_name = "towerfe3_NaI_";
/* The frontend file name, don't change it */
char *frontend_file_name = __FILE__;

/* frontend_loop is called periodically if this variable is TRUE    */
BOOL frontend_call_loop = FALSE;

/* a frontend status page is displayed with this frequency in ms */
INT display_period = 000;

// MAXSAMPLES is the maximum number of 4-byte words to be stuffed into the 
// data bank for each trigger.  It should be at least 1/4 of the total number
//  of bytes being read out for the trigger.  Calculate it from the maximum
// allowed waveform lengths for charge and phonon channels. 
//  int MAXSAMPLES = (2*16384 + 4*16384)/4+1;
const  int MAXSAMPLES = (2*1000000 + 4*1000000)/4+1;
char data_buffer2[7][4*MAXSAMPLES+1];

/* maximum event size produced by this frontend */
/* 6 is number of DCRCs read out by this front=end */
  INT max_event_size = 25600000;
  // The maximum number of triggers is determined by the buffer size
  // which we don't want to exceed, at risk of corrupting the ODB
  INT max_readouts_per_poll = max_event_size / (4*MAXSAMPLES);
  INT max_trigs_per_poll = 500;

/* maximum event size for fragmented events (EQ_FRAGMENTED) */
/* This is not really used */
  INT max_event_size_frag = 100000;

/* buffer size to hold events - must be >= 2*max_event_size */
  INT event_buffer_size = 52 * 1000000;
  void **info;
  char  strin[256];
  HNDLE hDB, hSet;

  // length of trigger list array from which the front-end reads 
  // the list of triggers to be processed 
  INT triglistlength = 6508;

// Set dummyreadout to true if DCRC not present and you just want to 
// fill banks with fake data
BOOL dummyreadout = FALSE;
 
// This file contains procedures to read DCRC settings from the ODB and write them to the DCRC

// Socket connection to device
KOsocket *gDataSocket[7];

extern INT frontend_index;

int dcrc_hotlink_pointer[MAX_DCRCs+1] = {0,1,2,3,4,5,6};

/*-- Function declarations -----------------------------------------*/

INT frontend_init();
INT frontend_exit();
INT begin_of_run(INT run_number, char *error);
INT end_of_run(INT run_number, char *error);
INT pause_run(INT run_number, char *error);
INT resume_run(INT run_number, char *error);
INT frontend_loop();

INT read_trigger_event(char *pevent, INT off);
INT read_scaler_event(char *pevent, INT off);

// INT synchronize_cards();
void get_waveform_settings (INT dcrc_index, INT b, void *c);
void update_waveform_settings (INT dcrc_index, INT b, void *c);
void execute_rt (INT,INT,void *);
void calc_buffer_capacity ();

void things_to_do_when_starting_frontend_or_run(int initflag);

/*-- Equipment list ------------------------------------------------*/

#undef USE_INT

EQUIPMENT equipment[] = {

   {"Tower%02d",               /* equipment name */
    {1, 0,                   /* event ID, trigger mask */
     "SYSTEM",               /* event buffer */
#ifdef USE_INT
     EQ_INTERRUPT,           /* equipment type */
#else
     EQ_PERIODIC|EQ_INTERRUPT ,              /* equipment type */
#endif
     LAM_SOURCE(0, 0xFFFFFF),        /* event source crate 0, all stations */
     "MIDAS",                /* format */
     TRUE,                   /* enabled */
     RO_RUNNING,           /* read only when running */
     200,                    /* poll for 200ms */
     0,                      /* stop run after this event limit */
     0,                      /* number of sub events */
     0,                      /* don't log history */
     "", "", "",},
    read_trigger_event,      /* readout routine */
    },

   {""}
};

#ifdef __cplusplus
}
#endif

/********************************************************************\
              Callback routines for system transitions

  These routines are called whenever a system transition like start/
  stop of a run occurs. The routines are called on the following
  occations:

  frontend_init:  When the frontend program is started. This routine
                  should initialize the hardware.

  frontend_exit:  When the frontend program is shut down. Can be used
                  to releas any locked resources like memory, commu-
                  nications ports etc.

  begin_of_run:   When a new run is started. Clear scalers, open
                  rungates, etc.

  end_of_run:     Called on a request to stop a run. Can send
                  end-of-run event and close run gates.

  pause_run:      When a run is paused. Should disable trigger events.

  resume_run:     When a run is resumed. Should enable trigger events.
\********************************************************************/

/*-- Frontend Init -------------------------------------------------*/
// Upon init, read ODB settings and write them to DCRC
INT frontend_init()
{
	printf("Initiating frontend... \n");
  // Trigger buffer written to ODB cannot presently contain more than
  // 500 triggers per tower.  This would allow 6 DCRCs x 25 Hz x 3.2s
  // in principle
  if (max_trigs_per_poll > 500) max_trigs_per_poll=500;

  printf ("Starting front end.  Capacity of ODB trigger buffer: %d triggers\n", max_trigs_per_poll); 

  // Determine which tower we will talk to. If none specified, default to 1
  whichtower = frontend_index;
  if (whichtower < 0) whichtower = 1;

  // Make sure the priminfo and triggerlist ODB entries for the tower
  // exist, creating them if they don't.  
  // Note that reading from the nth position of the array will ensure that
  // an array of least that length exists!
  char set_str[80];
  char junk = 0x1;
  sprintf (set_str,"/Equipment/Tower%02d/TriggerList/priminfo", whichtower);
  odbReadAny(set_str,triglistlength-1,TID_CHAR,&junk);
  sprintf (set_str,"/Equipment/Tower%02d/TriggerList/triggerlist", whichtower);
  odbReadAny(set_str,triglistlength-1,TID_CHAR,&junk);

  // Check for the existence of rtAck and rtRequest, creating them
  // if necessary.  
  // Bill Page addition: Set rtAck to 0 upon initialization, which is needed
  // to help triggerfe.exe to recover from hangs
  HNDLE hkey_rtAck, hkey_rtRequest;
  BYTE junkbyte = 0;
  BYTE rtflag = 0;

  sprintf (set_str,"/Equipment/Tower%02d/TriggerList/rtAck", whichtower);
  odbReadAny(set_str,0,TID_BYTE,&junkbyte);
  int status = db_find_key(hDB, 0, set_str, &hkey_rtAck);
 
  printf("\n\n\n\nsetting rtAck to zero\n\n");
  db_set_data(hDB,hkey_rtAck,&rtflag,sizeof(rtflag),1,TID_BYTE);

  sprintf (set_str,"/Equipment/Tower%02d/TriggerList/rtRequest", whichtower);
  odbReadAny(set_str,0,TID_BYTE,&junkbyte);



  // Set the period with which the front end runs to a small value
  sprintf (set_str,"/Equipment/Tower%02d/Common/Period", whichtower);
  int period = 20; // milliseconds
  odbWriteInt(set_str,0,period);


  struct timeval start,stop;
  gettimeofday(&start,NULL);

  // Call the standard list of things to do whenever we start the front-end
  // which will set up the hardware.  Pass argument of 1 to open sockets
  things_to_do_when_starting_frontend_or_run(1);
  gettimeofday(&stop,NULL);
  printf ("Elapsed during things_to_do...: %f\n",stop.tv_sec-start.tv_sec
	  + 0.000001*(stop.tv_usec-start.tv_usec));

  // Declare a hot link to rtRequest, which the triggerfe.exe program
  // will use to initiate requests for triggers from the towerfe processes.
  cm_get_experiment_database(&hDB, NULL);

  sprintf (set_str,"/Equipment/Tower%02d/TriggerList/rtRequest", whichtower);
  db_find_key(hDB, 0, set_str, &hkey_rtRequest);
  db_open_record(hDB, hkey_rtRequest, &rtrequest,
                 sizeof(rtrequest), MODE_READ, execute_rt, NULL);

  


  // define some hotlinks to control waveform lengths
  // If any setting in the General settings directory is updated
  // then read in the waveform length and # of prepulse samples again
  // and recalculate the maximum number of waveforms that will fit in
  // the buffer.  This is hotlinked to the entire General structure
  // just to reduce the number of hotlinks

  for (int dcrc=1; dcrc<=6;dcrc++) {
    HNDLE general_key;
    sprintf (set_str,"/Equipment/Tower%02d/Settings/DCRC%d/General", whichtower, dcrc);
    db_find_key(hDB, 0, set_str, &general_key);
    int stat = db_open_record(hDB, general_key, &hotlink_general_struct,
	 sizeof(hotlink_general_struct), MODE_READ, update_waveform_settings,
		   &dcrc_hotlink_pointer[dcrc]);
  }




 // Set rtAck to zero once again
 printf("setting rtAck to zero\n\n");
 rtflag = 0;
 db_set_data(hDB,hkey_rtAck,&rtflag,sizeof(rtflag),1,TID_BYTE);
 
  //Connect to the r5560
  int connect_success = connect_staticaddr(0);

  return SUCCESS;  
}


void things_to_do_when_starting_frontend_or_run (int initflag) {


  char set_str[80];
  // Check whether to run in dummyreadout mode, which doesn't talk to DCRCs 
  // (useful if debugging code but DCRC not present).  Defaults to false.

  sprintf(set_str,"/Equipment/Tower%02d/Settings/DummyReadoutMode",whichtower);
  dummyreadout = odbReadBool(set_str,0,FALSE);

 
  if (dummyreadout) {
    std::cout << "Dummy mode enabled---writing fake data\n";
  } else {
    std::cout << "Normal mode enabled---fetching data from DCRCs\n";
  }

  
// Determine whether each DCRC is enabled or not
  for (int i=1;i<=6;i++) {
    sprintf (set_str,"/Equipment/Tower%02d/Settings/DCRC%1d/Enabled", 
	               whichtower, i);
    dcrc_enabled[i] = odbReadBool(set_str,0,FALSE);
  }
  

  char dcrckp[200];
// Loop over DCRCs and start opening sockets
    for (int i=1; i<=6; i++) {

      // Look up IP port information from ODB
      char odbkp[200];
      sprintf (dcrckp,"/Equipment/Tower%02d/Settings/DCRC%1d", whichtower,i);
      sprintf (odbkp,"%s/DcrcIPAddress",dcrckp);
      char default_ip[16];
      sprintf (default_ip, "192.168.0.%d", i+1+(whichtower-1)*10);
      gDcrcIPAddress[i] = odbReadString(odbkp, 0, default_ip, 200);
      sprintf (odbkp,"%s/DcrcPort",dcrckp);
      gDcrcPort[i] = odbReadInt(odbkp,0,5001);

      // Initialize socket connection for each enabled DCRC
      if (dcrc_enabled[i] && !dummyreadout && initflag) {
	printf("Initializing Socket connection for Tower%02d, DCRC%d at %s, Port %d \n",
	       whichtower, i, gDcrcIPAddress[i].c_str(),gDcrcPort[i]);
	gDataSocket[i] = new KOsocket(gDcrcIPAddress[i].c_str(),gDcrcPort[i]);
	//increase the buffer size of the TCP connection.
	//added this Feb 2015 for reading longerwaveforms.
	//can now read trigger sizes >1.5MB at 5-7MB/s whereas previously
	//trigger sizes >110kB caused readout slowing to 0.3MB/s
	gDataSocket[i]->setReceiveBufferSize(3276800);	
	gDataSocket[i]->setSoTimeout(3000);
      }


// Update DCRC settings from values in ODB, but don't write to DCRC yet
      get_waveform_settings(i,0,0);

    } // End of loop over DCRCs

    calc_buffer_capacity();

    // Execute an "rt" command on each DCRC to clear its FIFO.  Discard output
    {
      const int rtoutmaxlen = 2000;
      char tempbuffer[rtoutmaxlen]; // temporary buffer to put rt output into
      int bufferSize = sizeof(tempbuffer);
      for (int i=1; i<=6; i++) {
	
	if (dcrc_enabled[i] && !dummyreadout) {
	  gDataSocket[i]->write("rt",3);  
	  gDataSocket[i]->read(tempbuffer, bufferSize); 
	}
      }
    }


}


void calc_buffer_capacity () {
  int max_charge_len = 0;
  int max_phonon_len = 0;
  for (int dcrc=1; dcrc<=6; dcrc++) {
    if (dcrc_enabled[dcrc] && charge_nbytes[dcrc] > max_charge_len) 
          max_charge_len=charge_nbytes[dcrc];
    if (dcrc_enabled[dcrc] && phonon_nbytes[dcrc] > max_phonon_len) 
          max_phonon_len=phonon_nbytes[dcrc];
  }
  if (max_charge_len == 0) max_charge_len = 16384;
  if (max_phonon_len == 0) max_phonon_len = 16384;
  max_readouts_per_poll = 
       (max_event_size / (2*max_charge_len+4*max_phonon_len))-1;
  printf ("Capacity of MIDAS event buffer: %d DCRC waveform reads for current waveform lengths\n",
	  max_readouts_per_poll);

  // Introduce a throttle to limit number of triggers
  char set_str[80];
  sprintf (set_str,"/Equipment/Tower%02d/Settings/MaxNumWaveformsToRead", whichtower);
  int limitfromodb = odbReadInt(set_str,0,10000);

  if (max_readouts_per_poll > limitfromodb) {
    max_readouts_per_poll=limitfromodb;
    printf ("WARNING: maximum number of readouts per poll is limited by user-controlled ODB setting to %d DCRC readouter per cycle, maximum\n", max_readouts_per_poll);
  }

}



/*-- Frontend Exit -------------------------------------------------*/

INT frontend_exit()
{
  printf("Exiting towerfe3.exe!\n");
   return SUCCESS;
}

/*-- Begin of Run --------------------------------------------------*/
// Upon run start, read ODB settings and write them to DCRC
INT begin_of_run(INT run_number, char *error)
{

  // Pass argument of zero to prevent it from trying to reopen sockets
  things_to_do_when_starting_frontend_or_run(0);

   return SUCCESS;
}

/*-- End of Run ----------------------------------------------------*/

INT end_of_run(INT run_number, char *error)
{
   return SUCCESS;
}

/*-- Pause Run -----------------------------------------------------*/

INT pause_run(INT run_number, char *error)
{
   return SUCCESS;
}

/*-- Resume Run ----------------------------------------------------*/

INT resume_run(INT run_number, char *error)
{
   return SUCCESS;
}

/*-- Frontend Loop -------------------------------------------------*/

INT frontend_loop()
{
   /* if frontend_call_loop is true, this routine gets called when
      the frontend is idle or once between every event */
   return SUCCESS;
}

/*------------------------------------------------------------------*/

/********************************************************************\

  Readout routines for different events

\********************************************************************/

/*-- Trigger event routines ----------------------------------------*/
// Not currently used for DCRC readout
extern "C" { INT poll_event(INT source, INT count, BOOL test)
/* Polling routine for events. Returns TRUE if event
   is available. If test equals TRUE, don't return. The test
   flag is used to time the polling */
{
   int i;

   for (i = 0; i < count; i++) {
//      cam_lam_read(LAM_SOURCE_CRATE(source), &lam);

//      if (lam & LAM_SOURCE_STATION(source))
         if (!test)
            return 1;
   }

   return 0;
}
}

/*-- Interrupt configuration ---------------------------------------*/
// This is not currently used by the DCRC readout
extern "C" { INT interrupt_configure(INT cmd, INT source, POINTER_T adr)
{
   switch (cmd) {
   case CMD_INTERRUPT_ENABLE:
      break;
   case CMD_INTERRUPT_DISABLE:
      break;
   case CMD_INTERRUPT_ATTACH:
      break;
   case CMD_INTERRUPT_DETACH:
      break;
   }
   return SUCCESS;
}
}

/*-- Event readout -------------------------------------------------*/
// This routine checks the triggerlist ODB key to see if any waveforms
// have been requested, and then
// reads out all 6 waveforms from the DCRC, shoving the data along with some
// header words into a MIDAS data bank called SCD0
INT read_trigger_event(char *pevent, INT off)
{
  printf("WE ARE IN READ TRIGGER EVENT!");
// An vector to hold the data.  In spite of the name, each element contains
// two DCRC samples, packed into one DWORD = one 4-byte word
  std::vector<DWORD> samples(MAXSAMPLES);



  // pdata_sam counts how many 4-byte words have been stuffed into the bank
  int pdata_sam = 0;


  /* init bank structure */
  bk_init32(pevent);


  int numTriggers = 0;
  int bytes[7] = {0,0,0,0,0,0,0};

  // Code to read from the trigger buffer and set up the list of
  // waveforms to request.  
  char keyname[100];
  sprintf (keyname,"/Equipment/Tower%02d/TriggerList/triggerlist", whichtower);
  unsigned char readbuffer[triglistlength];

  struct timeval start,stop;
  gettimeofday(&start,NULL);
  printf ("Start of waveform fetch at %lf\n", start.tv_sec+0.000001*start.tv_usec);
  HNDLE hkey;
  db_find_key(hDB,0,keyname, &hkey);
  int size = triglistlength;
  db_get_data(hDB,hkey,readbuffer,&size,TID_CHAR);
  gettimeofday(&stop,NULL);
  printf ("Elapsed during ODB read of triggerlist: %f\n",
	  stop.tv_sec-start.tv_sec+ 0.000001*(stop.tv_usec-start.tv_usec));

  // Unpack first two bytes: number of triggers for this tower
  numTriggers = readbuffer[0]*256 + readbuffer[1];
  if (numTriggers > 0) printf ("Hi, I got %d triggers on the readbuffer\n", numTriggers); 

  int trigstoread[7] = {0,0,0,0,0,0,0};

  // Short character arrays to hold addresses of waveforms
  // First index: which DCRC (1-6); 2nd: which trigger; 
  // 3rd: address string char
  // addr holds the trigger address, and caddr/phaddr the addresses
  // after subtracting the prepulse sample length
  char addr[7][500][8],caddr[7][500][8],phaddr[7][500][8],newaddr[9];
  double triggertime[7][500];
  int trigsource[7][500];
  int numbertofetch = 0;
  for (int i=1;i<=numTriggers;i++) {
    // check each DCRC for each trigger, to see if action is needed
    for (int dcrc=1;dcrc<=6;dcrc++) {
      // If number of waveforms will exceed MIDAS buffer size, skip it
      if (numbertofetch >= max_readouts_per_poll) {
	if (dcrc_enabled[dcrc]) 
		printf ("Event size limit: dropping readout of trigger# %d, DCRC%d, address %c%c%c%c%c%c%c%c, source=%d\n", 
		i,dcrc,
		addr[dcrc][trigstoread[dcrc]-1][0],
		addr[dcrc][trigstoread[dcrc]-1][1],
		addr[dcrc][trigstoread[dcrc]-1][2],
		addr[dcrc][trigstoread[dcrc]-1][3],
		addr[dcrc][trigstoread[dcrc]-1][4],
		addr[dcrc][trigstoread[dcrc]-1][5],
		addr[dcrc][trigstoread[dcrc]-1][6],
		addr[dcrc][trigstoread[dcrc]-1][7],
		trigsource[dcrc][trigstoread[dcrc]-1]); 
	continue;
      }
      // Check if this trigger is marked to be read by this DCRC
     if (dcrc_enabled[dcrc] && (readbuffer[(i-1)*13+8+8] & (0x1 << (dcrc-1)))) {
	for (int k=0; k<8; k++) addr[dcrc][trigstoread[dcrc]][k]=
				  readbuffer[(i-1)*13+8+k];
	// Convert the trigger word to an integer so we can do math with it
	std::stringstream ss1;
	ss1 << std::hex << addr[dcrc][trigstoread[dcrc]][0] 
	    << addr[dcrc][trigstoread[dcrc]][1] 
	    << addr[dcrc][trigstoread[dcrc]][2] 
	    << addr[dcrc][trigstoread[dcrc]][3] 
	    << std::hex << addr[dcrc][trigstoread[dcrc]][4] 
	    << addr[dcrc][trigstoread[dcrc]][5] 
	    << addr[dcrc][trigstoread[dcrc]][6] 
	    << addr[dcrc][trigstoread[dcrc]][7];
	long unsigned int triggerword, ctriggerword,phtriggerword;
	ss1 >> triggerword;

	// Calculate the time at which this trigger occurred
	double thistriggertime = 
	  ((triggerword & 0x3fffff) - (dcrctimestamp*65536.))/1.25e6 ;
	if (thistriggertime > 0) thistriggertime -= 3.3554432;
	thistriggertime += timeoflastrt;
	triggertime[dcrc][trigstoread[dcrc]] = thistriggertime; 
                      
	// Create new charge trigger address by subtracting prepulse amount;
	ctriggerword = ( triggerword & 0x3fffff) - chargeprepulse[dcrc];
	if ((triggerword & 0x3fffff) < chargeprepulse[dcrc]) 
	  ctriggerword=0x400000+(triggerword & 0x3fffff) - chargeprepulse[dcrc];
	ctriggerword += (triggerword & 0xff000000);
	sprintf (newaddr, "%08lx", ctriggerword);
	for (int k=0; k<8; k++) caddr[dcrc][trigstoread[dcrc]][k]=newaddr[k];
	// Create new phonon trigger address by subtracting prepulse amount;
	phtriggerword = ( triggerword & 0x3fffff) - phononprepulse[dcrc];
	if ((triggerword & 0x3fffff) < phononprepulse[dcrc]) 
	 phtriggerword=0x400000+(triggerword & 0x3fffff) - phononprepulse[dcrc];
	phtriggerword += (triggerword & 0xff000000);
	sprintf (newaddr, "%08lx", phtriggerword);
	for (int k=0; k<8; k++) phaddr[dcrc][trigstoread[dcrc]][k]=newaddr[k];

	/*printf ("Test addresses %c%c%c%c%c%c%c%c %c%c%c%c%c%c%c%c %c%c%c%c%c%c%c%c\n", addr[dcrc][trigstoread[dcrc]][0],addr[dcrc][trigstoread[dcrc]][1],
	    addr[dcrc][trigstoread[dcrc]][2],addr[dcrc][trigstoread[dcrc]][3],
	    addr[dcrc][trigstoread[dcrc]][4],addr[dcrc][trigstoread[dcrc]][5],
	    addr[dcrc][trigstoread[dcrc]][6],addr[dcrc][trigstoread[dcrc]][7],
	    caddr[dcrc][trigstoread[dcrc]][0],caddr[dcrc][trigstoread[dcrc]][1],
	    caddr[dcrc][trigstoread[dcrc]][2],caddr[dcrc][trigstoread[dcrc]][3],
	    caddr[dcrc][trigstoread[dcrc]][4],caddr[dcrc][trigstoread[dcrc]][5],
	    caddr[dcrc][trigstoread[dcrc]][6],caddr[dcrc][trigstoread[dcrc]][7],
	  phaddr[dcrc][trigstoread[dcrc]][0],phaddr[dcrc][trigstoread[dcrc]][1],
	  phaddr[dcrc][trigstoread[dcrc]][2],phaddr[dcrc][trigstoread[dcrc]][3],
	  phaddr[dcrc][trigstoread[dcrc]][4],phaddr[dcrc][trigstoread[dcrc]][5],
	  phaddr[dcrc][trigstoread[dcrc]][6],phaddr[dcrc][trigstoread[dcrc]][7]); */

// Unpack the trigger origin word
	trigsource[dcrc][trigstoread[dcrc]]=
	  (readbuffer[i*13+4] << 24) + (readbuffer[i*13+5] << 16)
	  +(readbuffer[i*13+6] << 8) + readbuffer[i*13+7];
	trigstoread[dcrc]++; // increment # of waveforms to get for this DCRC
	numbertofetch++; // total number of waveforms to be fetched
     }; // End of things to do if dcrc is flagged to be read on this trigger
    } // end of loop over DCRCs
  } // end of loop over potential triggers in global trigger buffer
  printf ("Total number of trigs to be read: %d\n",numbertofetch);

  // Calculate how many iterations are needed to read all triggers, and
  // how many total triggers are to be read (counting each trigger once
  // for every DCRC that is read out for that trigger)
  int longesttriglist = 0;
  int totalnumberoftrigsread = 0;
  int totalnumberactuallywritten = 0;
  for (int i=1;i<=6;i++) { 
    totalnumberoftrigsread += trigstoread[i];
    if (trigstoread[i]>longesttriglist) longesttriglist=trigstoread[i];
  }
  printf ("Number of iterations to read triggers: %d\n", longesttriglist);



  struct timeval start_wf_fetch, stop_wf_fetch;
  gettimeofday(&start_wf_fetch,NULL);


  // Waveform retrieval code follows
  if(longesttriglist > 0){
    uint32_t *pdata32;
    /* create structured ADC0 bank of double words (i.e. 4-byte words)  */
    bk_create(pevent, "SCD0", TID_DWORD, (void**)&pdata32);

    // Add a header, with number of words in event.
    // Use the top three bits to indicate different control words.
    // 110 -> 0xcXXXXXXX  : overall header
    // 010 -> 0x4XXXXXXX  : trigger header
    // 001 -> 0x2XXXXXXX  : tower/DCRC header of waveform to come
    // 000 -> 0x0XXXXXXX  : channel header
    // 100 -> 0x8XXXXXXX  : trailer

    // Write the bank header to the bank, containing the number of triggers
    *pdata32++ = 0xc0000000 + (DWORD) totalnumberoftrigsread; pdata_sam++;

    for (int whichtrigger=0; whichtrigger < longesttriglist; whichtrigger++){

      // Flags specifying if a DCRC should be read out for this trigger
      BOOL dcrcread[7];
      struct timeval now;
      gettimeofday(&now,NULL);

      for (int dcrc=1;dcrc<=6;dcrc++) {
	dcrcread[dcrc]=dcrc_enabled[dcrc];
	if (whichtrigger >= trigstoread[dcrc]) dcrcread[dcrc]=FALSE;
	double elapsed = now.tv_sec+0.000001*now.tv_usec - triggertime[dcrc][whichtrigger]; 
	if (dcrcread[dcrc] && (elapsed > 3.303) 
	    && ((trigsource[dcrc][whichtrigger] & 0x100000) == 0)) {
	  dcrcread[dcrc]=FALSE;
	  printf ("Timeout limit: dropping readout of stale trigger# %d, DCRC%d, address %c%c%c%c%c%c%c%c, source=%d\n", 
		  whichtrigger, dcrc, 
		  addr[dcrc][whichtrigger][0],
		  addr[dcrc][whichtrigger][1],
		  addr[dcrc][whichtrigger][2],
		  addr[dcrc][whichtrigger][3],
		  addr[dcrc][whichtrigger][4],
		  addr[dcrc][whichtrigger][5],
		  addr[dcrc][whichtrigger][6],
		  addr[dcrc][whichtrigger][7],
		  trigsource[dcrc][whichtrigger]); 
	  // Write empty header for dropped trigger, with waveform lengths of 0
	  DWORD triggerword1 = 0;
	  std::stringstream ss1;
	  ss1 << std::hex << addr[dcrc][whichtrigger][0] << addr[dcrc][whichtrigger][1] << addr[dcrc][whichtrigger][2] << addr[dcrc][whichtrigger][3]
	      << std::hex << addr[dcrc][whichtrigger][4] << addr[dcrc][whichtrigger][5] << addr[dcrc][whichtrigger][6] << addr[dcrc][whichtrigger][7];
	  ss1 >> triggerword1;
	  *pdata32++ = 0x40000000; pdata_sam++;                         ;
	  *pdata32++ = trigsource[dcrc][whichtrigger]; pdata_sam++;
	  *pdata32++ = triggerword1; pdata_sam++;
	  *pdata32++ = 0x20000000+8*whichtower+dcrc; pdata_sam++;
	  for (int i=0; i<6; i++) {
	    // use waveform length of zero for each channel
	    *pdata32++ = 0x00000000 + (i<<16); pdata_sam++;                         };
	} // end of thinsg to do if the trigger is dropped
      } // end of loop over DCRCs to see if it should be read this iteration

      // Short array to hold commands to be written to DCRC      
      char command[40];

      // All 6 waveforms will be read into data_buffer2[]
      int bytesread[7]={0,0,0,0,0,0,0};
      
      if (!dummyreadout) {
	// Request inner charge waveform
	//	printf("Request charge waveform %i\n",charge_nbytes[dcrc]);
	for (int dcrc=1;dcrc<=6;dcrc++) {
	  sprintf(command,"wr c %c%c%c%c\rwr d %c%c%c%c\rrdb 14 %x",
		  caddr[dcrc][whichtrigger][0],caddr[dcrc][whichtrigger][1],caddr[dcrc][whichtrigger][2],caddr[dcrc][whichtrigger][3],
		  caddr[dcrc][whichtrigger][4],caddr[dcrc][whichtrigger][5],caddr[dcrc][whichtrigger][6],caddr[dcrc][whichtrigger][7],charge_nbytes[dcrc]);
	  if (dcrcread[dcrc]) {
	    gDataSocket[dcrc]->write(command,strlen(command)+1);
	    //	       printf ("Sent to DCRC %d: %s\n", dcrc,command);
	  }
	}


	
	// Read requested waveform, and as soon as it is there request
	// the next
	for (int dcrc=1; dcrc<=6; dcrc++) {
	  sprintf(command,"wr e %c%c%c%c\rwr f %c%c%c%c\rrdb 14 %x",
		  caddr[dcrc][whichtrigger][0],caddr[dcrc][whichtrigger][1],caddr[dcrc][whichtrigger][2],caddr[dcrc][whichtrigger][3],
		  caddr[dcrc][whichtrigger][4],caddr[dcrc][whichtrigger][5],caddr[dcrc][whichtrigger][6],caddr[dcrc][whichtrigger][7],charge_nbytes[dcrc]);
	  
	  
	  if (!dcrcread[dcrc]) continue;
	  int avail = gDataSocket[dcrc]->available();
	  while(avail < charge_nbytes[dcrc]-2000){
	    //	  while(!avail){
	    avail = gDataSocket[dcrc]->available();
	  }
	  bytes[dcrc] = charge_nbytes[dcrc];
	  // Request outer charge waveform
	  gDataSocket[dcrc]->write(command,strlen(command)+1);
	  gDataSocket[dcrc]->readFully(data_buffer2[dcrc]+bytesread[dcrc], bytes[dcrc]); 
	  bytesread[dcrc] += bytes[dcrc];
	};
	
	
	// Read the second waveform and request the third
	for (int dcrc=1; dcrc<=6; dcrc++) {
	  if (!dcrcread[dcrc]) continue;
	  sprintf(command,"wr 4 %c%c%c%c\rwr 5 %c%c%c%c\rrdb 14 %x",
		  phaddr[dcrc][whichtrigger][0],phaddr[dcrc][whichtrigger][1],phaddr[dcrc][whichtrigger][2],phaddr[dcrc][whichtrigger][3],
		  phaddr[dcrc][whichtrigger][4],phaddr[dcrc][whichtrigger][5],phaddr[dcrc][whichtrigger][6],phaddr[dcrc][whichtrigger][7],phonon_nbytes[dcrc]);
	  int avail = gDataSocket[dcrc]->available();
	  while(avail < charge_nbytes[dcrc]-2000){
	    //	  while(!avail){
	    avail = gDataSocket[dcrc]->available();
	  }
	  bytes[dcrc] = charge_nbytes[dcrc];
	  gDataSocket[dcrc]->write(command,strlen(command)+1);
	  gDataSocket[dcrc]->readFully(data_buffer2[dcrc]+bytesread[dcrc], bytes[dcrc]); 
	  bytesread[dcrc] += bytes[dcrc];
	};
	
	// Read the third waveform and request the fourth
	for (int dcrc=1; dcrc<=6; dcrc++) {
	  if (!dcrcread[dcrc]) continue;
	  sprintf(command,"wr 6 %c%c%c%c\rwr 7 %c%c%c%c\rrdb 14 %x",
		  phaddr[dcrc][whichtrigger][0],phaddr[dcrc][whichtrigger][1],phaddr[dcrc][whichtrigger][2],phaddr[dcrc][whichtrigger][3],
		  phaddr[dcrc][whichtrigger][4],phaddr[dcrc][whichtrigger][5],phaddr[dcrc][whichtrigger][6],phaddr[dcrc][whichtrigger][7],phonon_nbytes[dcrc]);
	  int avail = gDataSocket[dcrc]->available();
	  while(avail < phonon_nbytes[dcrc]-2000){
	    //	  while(!avail){
	    avail = gDataSocket[dcrc]->available();
	  }
	  bytes[dcrc] = phonon_nbytes[dcrc];
	  gDataSocket[dcrc]->write(command,strlen(command)+1);
	  gDataSocket[dcrc]->readFully(data_buffer2[dcrc]+bytesread[dcrc], bytes[dcrc]); 
	  bytesread[dcrc] += bytes[dcrc];
	};

	// Read the fourth waveform and request the fifth
	for (int dcrc=1; dcrc<=6; dcrc++) {
	  if (!dcrcread[dcrc]) continue;
	  sprintf(command,"wr 8 %c%c%c%c\rwr 9 %c%c%c%c\rrdb 14 %x",
		  phaddr[dcrc][whichtrigger][0],phaddr[dcrc][whichtrigger][1],phaddr[dcrc][whichtrigger][2],phaddr[dcrc][whichtrigger][3],
		  phaddr[dcrc][whichtrigger][4],phaddr[dcrc][whichtrigger][5],phaddr[dcrc][whichtrigger][6],phaddr[dcrc][whichtrigger][7],phonon_nbytes[dcrc]);
	  int avail = gDataSocket[dcrc]->available();
	  while(avail < phonon_nbytes[dcrc]-2000){
	    //	  while(!avail){
	    avail = gDataSocket[dcrc]->available();
	  }
	  bytes[dcrc] = phonon_nbytes[dcrc];
	  gDataSocket[dcrc]->write(command,strlen(command)+1);
	  gDataSocket[dcrc]->readFully(data_buffer2[dcrc]+bytesread[dcrc], bytes[dcrc]); 
	  bytesread[dcrc] += bytes[dcrc];
	};


	// Read the fourth waveform and request the sixth
	for (int dcrc=1; dcrc<=6; dcrc++) {
	  if (!dcrcread[dcrc]) continue;
	  sprintf(command,"wr a %c%c%c%c\rwr b %c%c%c%c\rrdb 14 %x",
		  phaddr[dcrc][whichtrigger][0],phaddr[dcrc][whichtrigger][1],phaddr[dcrc][whichtrigger][2],phaddr[dcrc][whichtrigger][3],
		  phaddr[dcrc][whichtrigger][4],phaddr[dcrc][whichtrigger][5],phaddr[dcrc][whichtrigger][6],phaddr[dcrc][whichtrigger][7],phonon_nbytes[dcrc]);
	  int avail = gDataSocket[dcrc]->available();
	  while(avail < phonon_nbytes[dcrc]-2000){
	    //	  while(!avail){
	    avail = gDataSocket[dcrc]->available();
	  }
	  bytes[dcrc] = phonon_nbytes[dcrc];
	  gDataSocket[dcrc]->write(command,strlen(command)+1);
	  gDataSocket[dcrc]->readFully(data_buffer2[dcrc]+bytesread[dcrc], bytes[dcrc]); 
	  bytesread[dcrc] += bytes[dcrc];
	};



	// Read the sixth from the buffer
	for (int dcrc=1;dcrc<=6;dcrc++) {
	  if (!dcrcread[dcrc]) continue;
	  int avail = gDataSocket[dcrc]->available();
	  while(avail < phonon_nbytes[dcrc]-2000){
	    //	  while(!avail){
	    avail = gDataSocket[dcrc]->available();
	  }
	  // Number of bytes expected  = number of bytes per phonon waveform
	  bytes[dcrc] = phonon_nbytes[dcrc];
	  gDataSocket[dcrc]->readFully(data_buffer2[dcrc]+bytesread[dcrc], bytes[dcrc]); 
	  bytesread[dcrc] += bytes[dcrc];
	};
      } else { // Else you're doing dummy readout
	// Stuff fake sawtooth waveforms into array for dummy readout
	for (int dcrc=1;dcrc<=6;dcrc++) {
	  if (dcrcread[dcrc]) {
	    printf ("Gonna make fake data\n");
	    bytesread[dcrc] = 2*charge_nbytes[dcrc]+4*phonon_nbytes[dcrc];
	    for (int i=0;i<bytesread[dcrc];i++) {
	      if (i % 2 == 0) 
		{data_buffer2[dcrc][i]=1;}
	      else 
		{data_buffer2[dcrc][i] = i%256;}
	    };
	  };
	} // end loop over DCRCs writing dummy data

      }

      // END OF CODE THAT GETS REAL/FAKE DATA FROM DCRCs.  Now to stuff it
      // in banks.


      for (int dcrc=1;dcrc<=6;dcrc++) {
	if (!dcrcread[dcrc]) continue; // Skip to next DCRC if readout not enabled 
	totalnumberactuallywritten++;
      // The data string is composed of a set of 2-byte ADC samples.
      // We're going to pack them into 4-byte words
      WORD previous_sample = 0;
      WORD current_sample = 0;
      
      // nsamples holds how many 4-byte words we have read out.
      int nsamples =0;
      for(int i = 0; i < bytesread[dcrc]; i++){        
	// This is stupid; what is the proper way of converting from 
	// char (1 byte) into DWORD without the 0xff masking.
	WORD this_byte = data_buffer2[dcrc][i] & 0xff;
	if(i%2 == 0){
	  previous_sample = current_sample;
	  current_sample = ((this_byte) << 8);
	}else{
	  current_sample += ((this_byte));     
	}
	
	// finally, put together the two 2-byte samples into a 4-byte word.
	if(i%4 == 3){
	  DWORD this_word = previous_sample + (current_sample << 16);
	  //*pdata32++ = this_word;
	  samples[nsamples] = this_word;
	  nsamples++;
	}
	
      }

      // Final check; the number of samples should be satisfy
      // nsamples == (charge_nbytes[dcrc]*2 + phonon_nbytes[dcrc]*4)/4
      if(nsamples == (charge_nbytes[dcrc]*2 + phonon_nbytes[dcrc]*4)/4){

      
	
	// Shove the trigger word into the start of the bank before
	// you store the data samples there
	DWORD triggerword1 = 0;
	std::stringstream ss1;
	ss1 << std::hex << addr[dcrc][whichtrigger][0] << addr[dcrc][whichtrigger][1] << addr[dcrc][whichtrigger][2] << addr[dcrc][whichtrigger][3]
	<< std::hex << addr[dcrc][whichtrigger][4] << addr[dcrc][whichtrigger][5] << addr[dcrc][whichtrigger][6] << addr[dcrc][whichtrigger][7];
	ss1 >> triggerword1;

	/*	printf ("Trigger %c%c%c%c%c%c%c%c is %x\n",
		addr[dcrc][whichtrigger][0],addr[dcrc][whichtrigger][1],
		addr[dcrc][whichtrigger][2],addr[dcrc][whichtrigger][3],
		addr[dcrc][whichtrigger][4],addr[dcrc][whichtrigger][5],
		addr[dcrc][whichtrigger][6],addr[dcrc][whichtrigger][7],
		triggerword1); */

	


	// Add trigger header---one word saying it's a trigger header, then
	// three words giving the type and initiating card(s) of the trigger
	// (one 4-byte word) and then trigger words itself (two x 4-bytes each)
	// *******
	*pdata32++ = 0x40000000; pdata_sam++;                         ;
	*pdata32++ = trigsource[dcrc][whichtrigger]; pdata_sam++;
	*pdata32++ = triggerword1; pdata_sam++;
	
	std::cout << "Fetch iteration " << whichtrigger << 
 "---writing header for DCRC" << dcrc << ": "
		  << addr[dcrc][whichtrigger][0] << addr[dcrc][whichtrigger][1] << addr[dcrc][whichtrigger][2] << addr[dcrc][whichtrigger][3]
		  << std::hex << addr[dcrc][whichtrigger][4] << addr[dcrc][whichtrigger][5] << addr[dcrc][whichtrigger][6] << addr[dcrc][whichtrigger][7]
		  << " source=" << std::dec << trigsource[dcrc][whichtrigger] << std::endl;


	// Insert a header word here indicating which tower/DCRC we
	// are about to write data for.  Then will write the 6 waveforms from
	// that tower/DCRC.
	*pdata32++ = 0x20000000+8*whichtower+dcrc; pdata_sam++;

	// Now store the data samples.
	// Divide it into different channels, so that we can 
	// add channel headers.
	for(int i = 0; i < 6; i++){
	  int ch_nsamples;
	  int ch_offset = 0;
	  // The first two waveforms are charge waveforms
	  if(i < 2){
	    ch_nsamples = charge_nbytes[dcrc]/4;
	    ch_offset = (charge_nbytes[dcrc]*i)/4;
	  }else{
	    ch_nsamples = phonon_nbytes[dcrc]/4;
	    ch_offset = (charge_nbytes[dcrc]*2 + phonon_nbytes[dcrc]*(i-2))/4;
	  }
	  
	  // Stuff a channel header 4-byte word into the bank, which contains the number of 4-byte words
	  // for this waveform
	  *pdata32++ = 0x00000000 + (i<<16) + ch_nsamples; pdata_sam++;                         
	  // Write the waveform data for the channel into the bank
	  int min, max;
	  for(int j = 0; j < ch_nsamples; j++){
	    *pdata32++ = samples[ch_offset+j];
	    pdata_sam++;
            // KLUDGE TO CALC STUFF FOR CH2: Phonon A                         
            if (i == 2) {
              int pt = samples[ch_offset+j] & 0xffff;
	      //              printf ("KLUDGE PHONON A: %d %d\n",j,pt);
              if (j == 0) {
		min = pt;
                max = pt;
              };
              if (pt > max) max=pt;
              if (pt < min) min=pt;
            } // END OF Phonon A calc kludge                                  
          }
	  //          if (i ==2) printf ("KLUDGE: spread of Phonon A: %d\n", max-min);
	} // end of loop over all 6 charge/phonon channels
      } // end of if statement that executes if correct number of bytes is read
      else{
	std::cerr << "Error: nsamples != (charge_nbytes[dcrc]*2 + phonon_nbytes[dcrc]*4)/4" << std::endl;
      }       

      } // End of loop over DCRCs that shoves data into banks

    } // end of loop over number of triggers to be read out


    // Add trailer to word; stick in number of triggers again.
    *pdata32++ = 0x80000000 + (DWORD) totalnumberactuallywritten;
    pdata_sam++;
    printf ("End of writing: wrote %d, expected to write %d\n",
	    totalnumberactuallywritten,numbertofetch);

    //    int size2 = bk_close(pevent, pdata32);    
    bk_close(pevent, pdata32);    

    
    // Signal that all waveforms acquired by clearing the first two bytes of triggerlist 
    sprintf (keyname,"/Equipment/Tower%02d/TriggerList/triggerlist", whichtower);
    db_find_key(hDB,0,keyname, &hkey);
    readbuffer[0]=0;
    readbuffer[1]=0;
    db_set_data(hDB,hkey,readbuffer,sizeof(readbuffer),triglistlength,TID_CHAR);

  
  } // end of if statement that executes only if there were triggers to read out


  gettimeofday(&stop_wf_fetch,NULL);
  printf ("Elapsed during waveform fetching: %f\n",stop_wf_fetch.tv_sec-start_wf_fetch.tv_sec
	  + 0.000001*(stop_wf_fetch.tv_usec-start_wf_fetch.tv_usec));


  
  // close the bank
  return bk_size(pevent);
}

/*
INT synchronize_cards () {



  printf ("Synchronizing cards\n");

  if (dummyreadout) return 0;

  char command[40];

  // First pass: make sure 50MHz clock turned off, and write to CSR
    for (int i=1; i<=6; i++) {
      // First turn off 50Mhz clock for any DCRC that isn't free-running
      if (dcrc_enabled[i] && masterslave[i]>0) {
	sprintf(command,"wr 3c %x", 0xbfff & gRegister[i][0x3c]);
	gDataSocket[i]->write(command,strlen(command)+1);
      }
      if (dcrc_enabled[i] && masterslave[i]==2) {
	sprintf(command,"wr 15 %x", (0xffc0 & gRegister[i][0x15])+0x10);
	gDataSocket[i]->write(command,strlen(command)+1);
      }
      if (dcrc_enabled[i] && masterslave[i]==1) {
	sprintf(command,"wr 15 %x", (0xffc0 & gRegister[i][0x15])+0x01);
	gDataSocket[i]->write(command,strlen(command)+1);
      }
    }

    // Wait 3.2s to make sure all slave clocks have time to synch with master
	usleep(3200000);

	// Second pass: command master modules to start writing date---slaves 
	//should automatically follow
    for (int i=1; i<=6; i++) {
      if (dcrc_enabled[i] && masterslave[i]==1) {
	sprintf(command,"wr 15 %x", (0xffc0 & gRegister[i][0x15])+0x01);
	gDataSocket[i]->write(command,strlen(command)+1);
	sprintf(command,"wr 15 %x", (0xffc0 & gRegister[i][0x15])+0x21);
	gDataSocket[i]->write(command,strlen(command)+1);
      }
    }



  return SUCCESS;

  } */


// This routine will read the trigger primitives and put them in
// the ODB.  It is invoked by a hotlink to rtRequest
void execute_rt (int dummy1, int dummy2, void *dummy3) {


  struct timeval start_ex_rt_time,stop_ex_rt_time;
  gettimeofday(&start_ex_rt_time,NULL);
  timeoflastrt = start_ex_rt_time.tv_sec + 0.000001*start_ex_rt_time.tv_usec;
  printf("\n\nStarting execute_rt_timer at %lf\n", timeoflastrt);


  // Buffer to read the trigger list.  6 DCRCs numbered from 1-6.
  // Up to 2000 bytes each;
  const int rtoutmaxlen = 2000;
  char trigaddr_buffer[7][rtoutmaxlen];
  char tempbuffer[rtoutmaxlen]; // temporary buffer to put rt output into
  int bufferSize = sizeof(tempbuffer);

  int bytes[7] = {0,0,0,0,0,0,0};
  //  int dcrctimestamp = 0;
  if (!dummyreadout) {
    for (int dcrc=1;dcrc<=6;dcrc++) {
      if (dcrc_enabled[dcrc]) {


	// read the upper bytes of the write pointer on this DCRC
	// Strangely, often the first read returns old values, not the
	// current value, but reading a second time always seems to work
	int thisdcrc=dcrc;
	gDataSocket[thisdcrc]->write("rd 0\rrd 0",10);
	int avail = gDataSocket[thisdcrc]->available();
	while(!avail){
	  avail = gDataSocket[thisdcrc]->available();
	}
	// Each "rd 0" returns 6 bytes---who knows why?  Probably /r/n at end.  
	gDataSocket[thisdcrc]->readFully(tempbuffer,12); 
	std::stringstream ss;
	//	ss << std::hex << tempbuffer[2] << tempbuffer[3];
	ss << std::hex << tempbuffer[8] << tempbuffer[9];
	ss >> dcrctimestamp;
	
	// Get the trigger list by issuing the rt command
	struct timeval now;
	gettimeofday(&now,NULL);
	printf ("rt time for DCRC%d = %lf\n", dcrc, now.tv_sec+0.000001*now.tv_usec);
	gDataSocket[dcrc]->write("rt",3);  
	bytes[dcrc] = gDataSocket[dcrc]->read(tempbuffer, 10); 


        //[ANV] get sub buffer
        char *subbuf;
        int size = 10;
        subbuf = (char*) malloc(size*sizeof(char));
        memcpy( subbuf, tempbuffer, size );

	printf("ANV: read 10 bytes with result: %s",subbuf);

	//[ANV] get number of samples
	int nsamp = (int)strtol(subbuf, NULL, 16);

	if(nsamp>0){
	  bytes[dcrc] += gDataSocket[dcrc]->read(tempbuffer+10, nsamp*10); 

          //[ANV] get sub buffer
          free(subbuf);
          size = bufferSize-10;
          subbuf = (char*) malloc(size*sizeof(char));
          memcpy( subbuf, &tempbuffer[10], size );
	  printf("ANV: read %d bytes with result: %s",bufferSize-10,subbuf);
	}

	//bytes[dcrc] = gDataSocket[dcrc]->read(tempbuffer, bufferSize); 
	// copy the values returned by rt into the trigger buffer array
	for (int i=0;i<bytes[dcrc];i++) trigaddr_buffer[dcrc][i]=tempbuffer[i];

      } // end of things to do if this dcrc is enabled
    } // end of do loop over dcrcs
  } // end of things to do if we are not in dummy readout mode

  else { // if we are in dummy readout mode
    // For dummy readout assume 43 triggers with fake trigger address 0000000
    // in DCRC1 only
  bytes[1] = (43+1)*10;
  for (int i=0;i<bytes[1];i++) trigaddr_buffer[1][i]='0';
  // Set first 8 bytes to 0000002B (hex) = 43
  trigaddr_buffer[1][6]='2';
  trigaddr_buffer[1][7]='B';
  } // end of things to do for dummy readout

  printf ("Last rt cycle phase %d\n", dcrctimestamp);
  struct timeval start2, stop2;
  gettimeofday(&start2, NULL);
  
  int numTriggers = 0;
  char triglist[max_trigs_per_poll+1][8];
  DWORD trigorigin[max_trigs_per_poll+1];

  // Process the data returned by "rt" for each DCRC
  for (int dcrc=1;dcrc<=6;dcrc++) {
    printf ("Processing trigs from DCRC%d\n", dcrc);
    if (bytes[dcrc] ==0) continue; //skip this DCRC if no trigger words read

    int trigsfromdcrc;
    // Parse the first 8 bytes returned by "rt" to see how many triggers await.
    std::stringstream ss;
    ss << std::hex << trigaddr_buffer[dcrc][0] << trigaddr_buffer[dcrc][1]
       << trigaddr_buffer[dcrc][2] << trigaddr_buffer[dcrc][3]
       << trigaddr_buffer[dcrc][4] << trigaddr_buffer[dcrc][5]
       << trigaddr_buffer[dcrc][6] << trigaddr_buffer[dcrc][7];
    ss >> trigsfromdcrc;
    // Check for self-consistency in the number of bytes returned and
    // the number of triggers reported
    if ((trigsfromdcrc+1)*10 != bytes[dcrc]) {
      printf("Tower%02d, DCRC%d error: number of bytes returned by rt doesn't equal number of triggers reported.\n", whichtower,dcrc);
      continue;
    }

    // Add triggers to list to be processed, if not too long already
    printf ("DCRC%d gives %d triggers reported\n",dcrc,trigsfromdcrc);
    for (int i=1;i<=trigsfromdcrc;i++) {
      if (numTriggers >= max_trigs_per_poll) {
	printf("Tower%02d, DCRC%d, trigger ",whichtower, dcrc);
	int offset = 10*i;
	for (int j=0; j<8; j++) printf ("%c", trigaddr_buffer[dcrc][offset+j]);
	printf (" dropped because number of triggers retrieved from DCRCs exceeds capacity of ODB trigger list array (=%d)\n",max_trigs_per_poll);
	continue;
      }

	numTriggers++;
	int offset = 10*i;
	for (int j=0; j<8; j++) 
	    triglist[numTriggers][j]=trigaddr_buffer[dcrc][offset+j];
 	/// Encode a word that encodes the origin of the trigger.  Here is
	/// the intended byte assignment:
	/// bits 32-26: unused
	/// bits 25-21: trigger type (types to be defined, 0=default)
	/// bits 20-14: tower of 2nd (coincident) trigger source
	/// bits 13-11: DCRC# of 2nd (coincident) trigger source
	/// bits 10-04: tower of 1st (primary) trigger source
	/// bits 03-01: DCRC# of 1st (primary) trigger source
	trigorigin[numTriggers] = 8*whichtower+dcrc;
	printf ("#%d Adding trigger %c%c%c%c%c%c%c%c from source %08x to list\n", numTriggers,
		triglist[numTriggers][0],triglist[numTriggers][1],
		triglist[numTriggers][2],triglist[numTriggers][3],
		triglist[numTriggers][4],triglist[numTriggers][5],
		triglist[numTriggers][6],triglist[numTriggers][7],
		trigorigin[numTriggers]);
    } // end loop over trigger words received for this DCRC



  } // end of loop over DCRCs

  gettimeofday(&stop2, NULL);
  printf("Elapsed during polling cycle: %f\n",stop2.tv_sec-start2.tv_sec + 0.000001*(stop2.tv_usec-start2.tv_usec));

  time_t current_time = time(NULL);
  printf ("%s  towerfe3_%02d: polling cycle finds %d triggers\n", 
	  ctime(&current_time),frontend_index, numTriggers);



  // At this point we have now made a list of triggers to be passed
  // to the global trigger module through the ODB.

  // Buffer length is triglistlength = 8byte intro + 500 triggers * 13 bytes
  char globaltriggerbuffer[triglistlength];

  // First we write 8 bytes of header for this block on trigger primitives
  // Stuff the number of triggers to be processed into the first two bytes
  globaltriggerbuffer[0] = (numTriggers & 0xff00) >> 8;
  globaltriggerbuffer[1] = numTriggers & 0x00ff;
  // Store the UNIX time since 1970, in seconds, in the next 4 bytes
  globaltriggerbuffer[2] = (current_time & 0xff000000) >> 24;
  globaltriggerbuffer[3] = (current_time & 0x00ff0000) >> 16;
  globaltriggerbuffer[4] = (current_time & 0x0000ff00) >> 8;
  globaltriggerbuffer[5] = (current_time & 0x000000ff);
  // Bytes 6 and 7 reserved for upper bytes of DCRC write address
  // which we may implement as a secondary timestamp.  
  // It is not certain that the result from "rd 0" being stored here
  // is reliable---there are some indications for it not always
  // increasing monotonically
  globaltriggerbuffer[6] = (dcrctimestamp & 0xff00) >> 8;  
  globaltriggerbuffer[7] = (dcrctimestamp & 0x00ff);  

  // For each trigger write the trigger address, a one-byte flag listing
  // which DCRCs to read for that trigger, and also the trigger origin word,
  // which has four bytes.  So a total of 13 bytes per trigger = 8 + 1 + 4
  for (int i=1; i<=numTriggers; i++) {
    for (int j=0;j<8;j++) globaltriggerbuffer[i*13+j-5]=triglist[i][j];
    // Mark all DCRCs to be read, for now---set lowest 6 bits to 1
    // For selective readout instead use this: 
    //      globaltriggerbuffer[i*13+3]= 0x1 << ((trigorigin[i] & 0x7) - 1);
    // In general the global trigger module should overwrite this information
    // but we have to assume something for now until that code exists. 
    globaltriggerbuffer[i*13+3]=0x3f;
    // Add the four bytes of the trigger word
    globaltriggerbuffer[i*13+4]= (trigorigin[i] & 0xff000000) >> 24;
    globaltriggerbuffer[i*13+5]= (trigorigin[i] & 0x00ff0000) >> 16;
    globaltriggerbuffer[i*13+6]= (trigorigin[i] & 0x0000ff00) >> 8;
    globaltriggerbuffer[i*13+7]= trigorigin[i] & 0x000000ff;
  }


  // Find the ODB key pointing to the trigger list for this tower, through
  // which we'll pass the info to the global trigger module
  HNDLE hkey;
  char keyname[100];
  sprintf (keyname,"/Equipment/Tower%02d/TriggerList/priminfo", whichtower);

  // Write the trigger list into the buffer in the ODB, and time the operation
  struct timeval start,stop;
  gettimeofday(&start,NULL);
  db_find_key(hDB,0,keyname, &hkey);
  db_set_data(hDB,hkey,globaltriggerbuffer,sizeof(globaltriggerbuffer),triglistlength,TID_CHAR);
  gettimeofday(&stop,NULL);
  printf ("Elapsed during ODB write: %f\n",stop.tv_sec-start.tv_sec
	  + 0.000001*(stop.tv_usec-start.tv_usec));
  

// Reset the rtAck flag to signal that the trigger primitives have been sent
  sprintf (keyname,"/Equipment/Tower%02d/TriggerList/rtAck", whichtower);
  int status = db_find_key(hDB, 0, keyname, &hkey);
  BYTE rtflag = 0;
  if (status == SUCCESS) db_set_data(hDB,hkey,&rtflag,sizeof(rtflag),1,TID_BYTE);



  gettimeofday(&stop_ex_rt_time,NULL);
  printf ("\n\nWhole execute_rt time: %f\n\n",stop_ex_rt_time.tv_sec-start_ex_rt_time.tv_sec + 0.000001*(stop_ex_rt_time.tv_usec-start_ex_rt_time.tv_usec));



}




void get_waveform_settings (INT dcrc_index, INT b, void *c)
{

  char odbkp[150];
  char dcrckp[150];

 // Define the ODB path to this particular DCRC                                
  sprintf (dcrckp,"/Equipment/Tower%02d/Settings/DCRC%1d", whichtower,
	   dcrc_index);

  sprintf(odbkp,"%s/General/ChargeWaveFormLength",dcrckp);
  charge_nbytes[dcrc_index] = odbReadInt(odbkp,0,4096);
  if (charge_nbytes[dcrc_index] % 4 != 0) {
    cm_msg(MERROR, frontend_name, "ERROR: Requested value for Charge Waveform L\
ength of %i is not allowed. Defaulting to 4096.", charge_nbytes[dcrc_index]);
    charge_nbytes[dcrc_index] = 4096;
  };
  sprintf(odbkp,"%s/General/PhononWaveFormLength",dcrckp);
  phonon_nbytes[dcrc_index] = odbReadInt(odbkp,0,8192);
  if (phonon_nbytes[dcrc_index] % 4 != 0) {
    cm_msg(MERROR, frontend_name, "ERROR: Requested value for Phonon Waveform L\
ength of %i is not allowed. Defaulting to 8192.", phonon_nbytes[dcrc_index]);
    phonon_nbytes[dcrc_index] = 8192;
  };
  // This keeps things from being too long.                                     
  if (2*charge_nbytes[dcrc_index]+4*phonon_nbytes[dcrc_index] > 4*MAXSAMPLES) {
    cm_msg(MERROR, frontend_name, "ERROR: Fixed array MAXSAMPLES is not big eno\
ugh to hold these long waveforms.  Defaulting to 4096-byte charge waveforms and\
 8192-byte phonon waveforms.");
    phonon_nbytes[dcrc_index] = 8192;
    charge_nbytes[dcrc_index] = 4096;
  };


  // Read charge and phonon pulse presample length.  This amount is             
  // subtracted from the trigger address before requesting waveform             
  sprintf(odbkp,"%s/General/ChargePrepulseSamples",dcrckp);
  chargeprepulse[dcrc_index] = odbReadInt(odbkp,0,0);
  sprintf(odbkp,"%s/General/PhononPrepulseSamples",dcrckp);
  phononprepulse[dcrc_index] = odbReadInt(odbkp,0,0);

  printf ("DEBUG DCRC%d: charge prepulse = %d, phonon prepulse = %d\n", dcrc_index, chargeprepulse[dcrc_index], phononprepulse[dcrc_index]);


  //now update the readback
  char set_str[80];
  //ChargeWaveFormLneghth
  sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/General/ChargeWaveFormLength", whichtower, dcrc_index);
  odbWriteInt(set_str, 0, charge_nbytes[dcrc_index]);
  cm_msg(MINFO, frontend_name, "ChargeWaveFormLength=%d updated in towerfe3 reading code and ReadbackODB", charge_nbytes[dcrc_index]);
  //PhononWaveFormLength
  sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/General/PhononWaveFormLength", whichtower, dcrc_index);
  odbWriteInt(set_str, 0, phonon_nbytes[dcrc_index]);
  cm_msg(MINFO, frontend_name, "PhononWaveFormLength=%d updated in towerfe3 reading code and ReadbackODB", phonon_nbytes[dcrc_index]);

  //ChargePrepulseSamples
  sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/General/ChargePrepulseSamples", whichtower, dcrc_index);
  odbWriteInt(set_str, 0, chargeprepulse[dcrc_index]);
  cm_msg(MINFO, frontend_name, "ChargePrepulseSamples=%d updated in towerfe3 reading code and ReadbackODB", chargeprepulse[dcrc_index]);

  //PhononPrepulseSamples
  sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/General/PhononPrepulseSamples", whichtower, dcrc_index);
  odbWriteInt(set_str, 0, phononprepulse[dcrc_index]);
  cm_msg(MINFO, frontend_name, "PhononPrePulseSamples=%d updated in towerfe3 reading code and ReadbackODB", phononprepulse[dcrc_index]);


}


void update_waveform_settings (int dummy1, int dummy2, void *dummy3) {

  int dcrc = *((int *) dummy3);

  printf ("Hotlink invoked for waveform settings on DCRC%d!\n", dcrc);

  get_waveform_settings(dcrc,0,0);

  calc_buffer_capacity(); 

}
