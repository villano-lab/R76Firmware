/********************************************************************\
towerfe.c - MIDAS readout of DCRC waveforms, as demo'd at Nov 2012 DAQ workshop at TRIUMF
This version: June 13, 2013
This version allows for longer waveform lengths, and uses ODB variables
that can be set in physical units (eg. mV, uA).  The internal workings of
how trigger information is processed is changed, although this is probably
invisible to the user.
Creators: Scott Oser (UBC) & Thomas Lindner (TRIUMF)
Contact: Scott Oser
\********************************************************************/


   
#include <vector>
#include <stdio.h>
#include <unistd.h>
#include <time.h>
#include <sys/time.h>
#include <algorithm>
#include <stdlib.h>
#include "midas.h"
#include <stdint.h>
#include "KOsocket.h"
#include <iostream>
#include <sstream>

/* make frontend functions callable from the C framework */
#ifdef __cplusplus
extern "C" {
#endif

/*-- Globals -------------------------------------------------------*/

/* The frontend name (client name) as seen by other MIDAS clients   */
char *frontend_name = "towerfe";
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
//const  int MAXSAMPLES = (2*1048576 + 4*1048576)/4+1;
const  int MAXSAMPLES = (2*1000000 + 4*100000)/4+1;
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
#include "dcrcSettings.h"

// Socket connection to device
KOsocket *gDataSocket[7];

extern INT frontend_index;

INT whichtower;


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

INT synchronize_cards();


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
     EQ_PERIODIC ,              /* equipment type */
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



  // Trigger buffer written to ODB cannot presently contain more than
  // 500 triggers per tower.  This would allow 6 DCRCs x 25 Hz x 3.2s
  // in principle
  if (max_trigs_per_poll > 500) max_trigs_per_poll=500;



  printf ("Starting front end.  Capacity of ODB trigger buffer: %d triggers\n", max_trigs_per_poll); 

  // Determine which tower we will talk to. If none specified, default to 1
  whichtower = frontend_index;
  if (whichtower < 0) whichtower = 1;

  // Make sure the triggerlist for the tower exists, creating it if it doesn't.
  // Note that reading from the nth position of the array will ensure that
  // an array of least that length exists!
  char set_str[80];
  sprintf (set_str,"/Equipment/Tower%02d/TriggerList/triggerlist", whichtower);
  char junk = 0x1;
  odbReadAny(set_str,triglistlength-1,TID_CHAR,&junk);

  // Set the period with which the front end runs to a small value
  sprintf (set_str,"/Equipment/Tower%02d/Common/Period", whichtower);
  int period = 20; // milliseconds
  odbWriteInt(set_str,0,period);

  // Call the standard list of things to do whenever we start the front-end
  // which will set up the hardware.  Pass argument of 1 to open sockets
  things_to_do_when_starting_frontend_or_run(1);

  return SUCCESS;  
}


void things_to_do_when_starting_frontend_or_run (int initflag) {


  char set_str[80];
  // Check whether to run in dummyreadout mode, which doesn't talk to DCRCs      // (useful if debugging code but DCRC not present)                            
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
    if (dummyreadout) dcrc_enabled[i] = FALSE;
  }
  



  // Determine DCRC revision type for each DCRC in the tower                   
  for (int i=1;i<=6;i++) {
    sprintf (set_str,"/Equipment/Tower%02d/Settings/DCRC%1d/DCRCRev", whichtower, i);
    dcrc_rev[i] = odbReadFloat(set_str,0,3.1);
    printf ("DCRC %d is revision %f\n", i,dcrc_rev[i]);
  }


  char dcrckp[200];
// Loop over DCRCs
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
      // This must happen before calling read_calibrations
      if (dcrc_enabled[i] && !dummyreadout && initflag) {
	printf("Initializing Socket connection for Tower%02d, DCRC%d at %s, Port %d \n",
	       whichtower, i, gDcrcIPAddress[i].c_str(),gDcrcPort[i]);
	gDataSocket[i] = new KOsocket(gDcrcIPAddress[i].c_str(),gDcrcPort[i]);
	gDataSocket[i]->setSoTimeout(3000);
      }

// Read in calibration register values from DCRC.  If DCRC is not enabled
// then the read_calibration code will not attempt to talk to it, but
// will use the default calibration values.  
      read_calibrations(gDataSocket[i],i);

      /*      for (float x=-14; x<=14; x=x+0.5) {
	printf ("Conversion test: %f = %x\n", x, 
		convert_float_to_dac(x,calib[0][i],calib[1][i],0.000001,0xffff));

      }
      exit(1); */



  struct timeval start,stop;
  gettimeofday(&start,NULL);

// Update DCRC settings from values in ODB, but don't write to DCRC yet
      update_settings(i,0,0);

// Initialize DCRC to enable triggers and readout (writes all registers to DCRC)
// Do this only for active hardware
      if (dcrc_enabled[i] && !dummyreadout) 
	       update_dcrc_register(gDataSocket[i],i);

    gettimeofday(&stop,NULL);
    // KLUDGE MARCH
    printf ("Elapsed during update settings cycle: %f\n",stop.tv_sec-start.tv_sec + 0.000001*(stop.tv_usec-start.tv_usec));



    } // End of loop over DCRCs



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


    synchronize_cards();

}



/*-- Frontend Exit -------------------------------------------------*/

INT frontend_exit()
{
  printf("Exiting towerfe.exe!\n");
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

/*-- Resuem Run ----------------------------------------------------*/

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
// This routine reads the list of triggers using the rt command, and then
// reads out all 6 waveforms from the DCRC, shoving the data along with some
// header words into a MIDAS data bank called SCD0
INT read_trigger_event(char *pevent, INT off)
{
// An vector to hold the data.  In spite of the name, each element contains
// two samples, packed into one DWORD = one 4-byte word
  std::vector<DWORD> samples(MAXSAMPLES);



  // pdata_sam counts how many 4-byte words have been stuffed into the bank
  int pdata_sam = 0;


  /* init bank structure */
  bk_init32(pevent);



  
  int dcrc=1;
  // Read trigger list with rt command
  char trigaddr_buffer[7][2000];
  char tempbuffer[2000];
  int bufferSize = sizeof(tempbuffer);


  int bytes[7] = {0,0,0,0,0,0,0};
  int dcrctimestamp = 0;
  struct timeval start,stop;
  gettimeofday(&start,NULL);
  if (!dummyreadout) {
    for (dcrc=1;dcrc<=6;dcrc++) {
      if (dcrc_enabled[dcrc]) {

	int thisdcrc=dcrc;
	// read phase of write pointer on DCRC
	gDataSocket[thisdcrc]->write("rd 0",5);
	int avail = gDataSocket[thisdcrc]->available();
	  while(!avail){
	    avail = gDataSocket[thisdcrc]->available();
	  }

	  //	printf ("DCRC %d %f  ",dcrc,start.tv_sec + 0.000001*(start.tv_usec));

	// "rd 0" returns 6 bytes---who knows why?  Probably /r/n at end.  
	  gDataSocket[thisdcrc]->readFully(tempbuffer,6); 
	  //	  printf ("Wed Test %c%c\n", 
	  //	  		tempbuffer[2],tempbuffer[3]); 
	  std::stringstream ss;
	  ss << std::hex << tempbuffer[2] << tempbuffer[3];
	  ss >> dcrctimestamp;
	  //	  printf ("%d\n", dcrctimestamp);
	  // Get the trigger list
	gDataSocket[dcrc]->write("rt",3);  
	bytes[dcrc] = 
	  gDataSocket[dcrc]->read(tempbuffer, bufferSize); 
	for (int i=0;i<bytes[dcrc];i++) trigaddr_buffer[dcrc][i]=tempbuffer[i];
	gettimeofday(&stop,NULL);

      }
    };
    //	printf ("Elapsed during rt cycle: %f\n",stop.tv_sec-start.tv_sec
    //	  + 0.000001*(stop.tv_usec-start.tv_usec));

  } 
else {
    // For dummy readout assume 43 triggers with fake trigger address 0000000
    // in DCRC1 only
  bytes[1] = (43+1)*10;
  for (int i=0;i<bytes[1];i++) trigaddr_buffer[1][i]='0';
  // Set first 8 bytes to 0000002B (hex) = 43
  trigaddr_buffer[1][6]='2';
  trigaddr_buffer[1][7]='B';
 }

  
  int numTriggers = 0;
  char triglist[max_trigs_per_poll+1][8];
  DWORD trigorigin[max_trigs_per_poll+1];

  for (dcrc=1;dcrc<=6;dcrc++) {
	printf ("Processing trigs from DCRC%d\n", dcrc);
    if (bytes[dcrc] ==0) continue; //skip if no trigger words read

    int trigsfromdcrc;
    // Parse the first 8 bytes returned by "rt" to see how many triggers await.
    std::stringstream ss;
    ss << std::hex << trigaddr_buffer[dcrc][0] << trigaddr_buffer[dcrc][1]
       << trigaddr_buffer[dcrc][2] << trigaddr_buffer[dcrc][3]
       << trigaddr_buffer[dcrc][4] << trigaddr_buffer[dcrc][5]
       << trigaddr_buffer[dcrc][6] << trigaddr_buffer[dcrc][7];
    ss >> trigsfromdcrc;
    if ((trigsfromdcrc+1)*10 != bytes[dcrc]) {
      printf("Tower%02d, DCRC%d error: number of bytes returned by rt doesn't equal number of triggers reported.\n", whichtower,dcrc);
      continue;}
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
      }



  }; // end of loop over DCRCs

  time_t current_time = time(NULL);
  printf ("%s  towerfe%02d: polling cycle finds %d triggers\n", 
	  ctime(&current_time),frontend_index, numTriggers);



  // END OF THE TRIGGER PART OF CODE, READOUT ITSELF FOLLOWS
  // If we actually have triggers to read out then read them and put them in a bank


  // The following code will write the list of triggers to be read out
  // to the "global" trigger buffer for this tower.  Eventually this buffer
  // will be filled by the global trigger processor module, which doesn't
  // exist yet.  For now we'll let the tower front-end fill this buffer, 
  // then we'll read out from it

    // Buffer length is triglistlength = 8byte intro + 500 triggers * 13 bytes
  char globaltriggerbuffer[triglistlength];


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
  // which DCRCs to read for that trigger, and also the trigger origin word.
  for (int i=1; i<=numTriggers; i++) {
    for (int j=0;j<8;j++) globaltriggerbuffer[i*13+j-5]=triglist[i][j];
    // This line is for selective readout: reads from that card only
    //   globaltriggerbuffer[i*13+3]= 0x1 << ((trigorigin[i] & 0x7) - 1);
    // Mark all DCRCs to be read, for now---set lowest 6 bits to 1
    globaltriggerbuffer[i*13+3]=0x3f;
    globaltriggerbuffer[i*13+4]= (trigorigin[i] & 0xff000000) >> 24;
    globaltriggerbuffer[i*13+5]= (trigorigin[i] & 0x00ff0000) >> 16;
    globaltriggerbuffer[i*13+6]= (trigorigin[i] & 0x0000ff00) >> 8;
    globaltriggerbuffer[i*13+7]= trigorigin[i] & 0x000000ff;
  }


  // Find the key pointing to the trigger list for this tower
  HNDLE hkey;
  char keyname[100];
  sprintf (keyname,"/Equipment/Tower%02d/TriggerList/triggerlist", whichtower);

  // Write the trigger list into the buffer in the ODB, and time the operation
  //  struct timeval start,stop;
  gettimeofday(&start,NULL);
  db_find_key(hDB,0,keyname, &hkey);
  db_set_data(hDB,hkey,globaltriggerbuffer,sizeof(globaltriggerbuffer),triglistlength,TID_CHAR);
  gettimeofday(&stop,NULL);
    printf ("Elapsed during ODB write: %f\n",stop.tv_sec-start.tv_sec
  	  + 0.000001*(stop.tv_usec-start.tv_usec));
  


  // Code to read from the trigger buffer and set up the list of
  // waveforms to request.  
  sprintf (keyname,"/Equipment/Tower%02d/TriggerList/triggerlist", whichtower);
  unsigned char readbuffer[triglistlength];

  gettimeofday(&start,NULL);
  db_find_key(hDB,0,keyname, &hkey);
  int size = triglistlength;
  db_get_data(hDB,hkey,readbuffer,&size,TID_CHAR);
  gettimeofday(&stop,NULL);
  printf ("Elapsed during ODB read: %f\n",stop.tv_sec-start.tv_sec
	  + 0.000001*(stop.tv_usec-start.tv_usec));
  //  printf ("Current time: %d\n", (int) current_time);
  //  for (int i=0; i<100; i++) {
  //  printf ("Buffer entry %d: %u\n", i, (unsigned int) readbuffer[i]);
  //  printf ("Buffer entry          %d: %c\n", i, readbuffer[i]);
  //}
  
  numTriggers = readbuffer[0]*256 + readbuffer[1];
  int trigstoread[7] = {0,0,0,0,0,0,0};
  // First index: which DCRC; 2nd: which trigger; 3rd: address string char
  // addr holds the trigger address, and caddr/phaddr the addresses
  // after subtracting the prepulse sample length
  char addr[7][500][8],caddr[7][500][8],phaddr[7][500][8],newaddr[9];
  int trigsource[7][500];
  int numbertofetch = 0;
  for (int i=1;i<=numTriggers;i++) {
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
      if (dcrc_enabled[dcrc] && (readbuffer[(i-1)*13+8+8] & (0x1 << (dcrc-1)))) {
	trigsource[dcrc][trigstoread[dcrc]] = 0;
	for (int k=0; k<8; k++) addr[dcrc][trigstoread[dcrc]][k]=
				  readbuffer[(i-1)*13+8+k];

	std::stringstream ss1;
	ss1 << std::hex << addr[dcrc][trigstoread[dcrc]][0] << addr[dcrc][trigstoread[dcrc]][1] << addr[dcrc][trigstoread[dcrc]][2] << addr[dcrc][trigstoread[dcrc]][3]
	    << std::hex << addr[dcrc][trigstoread[dcrc]][4] << addr[dcrc][trigstoread[dcrc]][5] << addr[dcrc][trigstoread[dcrc]][6] << addr[dcrc][trigstoread[dcrc]][7];
	long unsigned int triggerword, ctriggerword,phtriggerword;
	ss1 >> triggerword;
	// Create new charge trigger address by subtracting prepulse amount;
	ctriggerword = ( triggerword & 0x3fffff) - chargeprepulse[dcrc];
	if ((triggerword & 0x3fffff) < chargeprepulse[dcrc]) 
	  ctriggerword=0x400000+(triggerword & 0x3fffff) - chargeprepulse[dcrc];
	ctriggerword += (triggerword & 0xff000000);
	sprintf (newaddr, "%08x", ctriggerword);
	for (int k=0; k<8; k++) caddr[dcrc][trigstoread[dcrc]][k]=newaddr[k];
	// Create new phonon trigger address by subtracting prepulse amount;
	phtriggerword = ( triggerword & 0x3fffff) - phononprepulse[dcrc];
	if ((triggerword & 0x3fffff) < phononprepulse[dcrc]) 
	 phtriggerword=0x400000+(triggerword & 0x3fffff) - phononprepulse[dcrc];
	phtriggerword += (triggerword & 0xff000000);
	sprintf (newaddr, "%08x", phtriggerword);
	for (int k=0; k<8; k++) phaddr[dcrc][trigstoread[dcrc]][k]=newaddr[k];


	/*	printf ("Test addresses %c%c%c%c%c%c%c%c %c%c%c%c%c%c%c%c %c%c%c%c%c%c%c%c\n", 
	    addr[dcrc][trigstoread[dcrc]][0],addr[dcrc][trigstoread[dcrc]][1],
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


	trigsource[dcrc][trigstoread[dcrc]]=
	  (readbuffer[i*13+4] << 24) + (readbuffer[i*13+5] << 16)
	  +(readbuffer[i*13+6] << 8) + readbuffer[i*13+7];
	trigstoread[dcrc]++;
	numbertofetch++;
	/*	printf ("Trigger %d dcrc %d address %c%c%c%c%c%c%c%c source %d\n", 
		i,dcrc,
		addr[dcrc][trigstoread[dcrc]-1][0],
		addr[dcrc][trigstoread[dcrc]-1][1],
		addr[dcrc][trigstoread[dcrc]-1][2],
		addr[dcrc][trigstoread[dcrc]-1][3],
		addr[dcrc][trigstoread[dcrc]-1][4],
		addr[dcrc][trigstoread[dcrc]-1][5],
		addr[dcrc][trigstoread[dcrc]-1][6],
		addr[dcrc][trigstoread[dcrc]-1][7],
		trigsource[dcrc][trigstoread[dcrc]-1]
		); */
      }; // End of things to do if dcrc flagged to be read on this trigger
    } // end of loop over DCRCs
  } // end of loop over potential triggers in global trigger buffer
  printf ("Total number of trigs to be read: %d\n",numbertofetch);

  int longesttriglist = 0;
  int totalnumberoftrigsread = 0;
  for (int i=1;i<=6;i++) { 
    //printf ("Trigs to process on DCRC %d: %d\n", i, trigstoread[i]);
    totalnumberoftrigsread += trigstoread[i];
    if (trigstoread[i]>longesttriglist) longesttriglist=trigstoread[i];
  }

  printf ("Number of iterations to read triggers: %d\n", longesttriglist);
  // end of test code of writing then reading global trigger list to ODB


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
      gettimeofday(&start,NULL);

      // write the address of the next trigger to be read to addr[]
      //      for (int j=0; j<8; j++) addr[j]=triglist[whichtrigger][j];
      // Flags specifying if a DCRC should be read out for this trigger
      BOOL dcrcread[7];
      // For now hardcode to read out all enabled DCRCs in the tower for
      // each trigger.  Eventually will base this on which trigger it is.
      for (int i=1;i<=6;i++) {
	dcrcread[i]=dcrc_enabled[i];
	if (whichtrigger >= trigstoread[i]) dcrcread[i]=FALSE;
      }
      //      printf ("On iter %d, reading DCRC1=%d and DCRC3=%d\n", whichtrigger, dcrcread[1],dcrcread[3]);

      // Short array to hold commands to be written to DCRC      
      char command[40];

      // All 6 waveforms will be read into data_buffer2[]
      int bytesread[7]={0,0,0,0,0,0,0};

      //      char data_buffer2[7][4*MAXSAMPLES+1];

      if (!dummyreadout) {
	// Request inner charge waveform
	for (dcrc=1;dcrc<=6;dcrc++) {
	  //		printf("Request inner charge waveform %i\n",charge_nbytes[dcrc]);
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
	for (dcrc=1; dcrc<=6; dcrc++) {
	  //		printf("Request outer charge waveform %i\n",charge_nbytes[dcrc]);
	  sprintf(command,"wr e %c%c%c%c\rwr f %c%c%c%c\rrdb 14 %x",
		  caddr[dcrc][whichtrigger][0],caddr[dcrc][whichtrigger][1],caddr[dcrc][whichtrigger][2],caddr[dcrc][whichtrigger][3],
		  caddr[dcrc][whichtrigger][4],caddr[dcrc][whichtrigger][5],caddr[dcrc][whichtrigger][6],caddr[dcrc][whichtrigger][7],charge_nbytes[dcrc]);
	  

	  if (!dcrcread[dcrc]) continue;
	  int avail = gDataSocket[dcrc]->available();
	  while(avail < charge_nbytes[dcrc]-2000){
	    //	  while(!avail){
	    avail = gDataSocket[dcrc]->available();
	    //	    printf ("Availablo on dcrc %d: %d\n", dcrc,avail);
	  }
	  bytes[dcrc] = charge_nbytes[dcrc];
	  // Request outer charge waveform
	  gDataSocket[dcrc]->write(command,strlen(command)+1);
	  gDataSocket[dcrc]->readFully(data_buffer2[dcrc]+bytesread[dcrc], bytes[dcrc]); 
	  bytesread[dcrc] += bytes[dcrc];
	};


	// Read the second waveform and request the third
	for (dcrc=1; dcrc<=6; dcrc++) {
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
	for (dcrc=1; dcrc<=6; dcrc++) {
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
	for (dcrc=1; dcrc<=6; dcrc++) {
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


	// Read the fifth waveform and request the sixth
	for (dcrc=1; dcrc<=6; dcrc++) {
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
	for (dcrc=1;dcrc<=6;dcrc++) {
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
	for (dcrc=1;dcrc<=6;dcrc++) {
	  if (dcrcread[dcrc]) {
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


      for (dcrc=1;dcrc<=6;dcrc++) {
	if (!dcrcread[dcrc]) continue; // Skip to next DCRC if readout not enabled 

	/*	if (whichtrigger % 10 == 0 || whichtrigger==longesttriglist) 
	  printf ("#%d: Shoving Tower%02d, DCRC%d, trigger %c%c%c%c%c%c%c%c into bank.\n", whichtrigger,
	  whichtower, dcrc, addr[dcrc][whichtrigger][0],addr[dcrc][whichtrigger][1],addr[dcrc][whichtrigger][2],addr[dcrc][whichtrigger][3],addr[dcrc][whichtrigger][4],addr[dcrc][whichtrigger][5],addr[dcrc][whichtrigger][6],addr[dcrc][whichtrigger][7]); */

      // The data string is composed of a set of 2-byte ADC samples.
      // We're going to pack them into 4-byte words
      WORD previous_sample = 0;
      WORD current_sample = 0;
      //      for(int i = 0; i < MAXSAMPLES; i++){
      //	samples[i] = 0;
      // }
      
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
      //      std::cout << "Nsamples " << nsamples << " " << 
      //	(charge_nbytes[dcrc]*2 + phonon_nbytes[dcrc]*4)/4 << " " << std::endl; 

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
	
	std::cout << "Iter " << whichtrigger << 
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
	  *pdata32++ = 0x00000000 + (i<<16) + ch_nsamples; pdata_sam++;                         ;
	  // Write the waveform data for the channel into the bank
	  int min,max; // KLUDGE LINE: delete this line
	  for(int j = 0; j < ch_nsamples; j++){
	    *pdata32++ = samples[ch_offset+j];
	    pdata_sam++;
	    // KLUDGE TO CALC STUFF FOR CH2: Phonon A
	    if (i == 2) {
	      int pt = samples[ch_offset+j] & 0xffff;
	      printf ("KLUDGE PHONON A: %d %d\n",j,pt);
	      if (j == 0) {
		min = pt;
		max = pt;
	      };
	      if (pt > max) max=pt;
	      if (pt < min) min=pt;
	    } // END OF Phonon A calc kludge
	  }
	  if (i ==2) printf ("KLUDGE: spread of Phonon A: %d\n", max-min);
	} // end of loop over all 6 charge/phonon channels
      } // end of if statement that executes if correct number of bytes is read
      else{
	std::cerr << "Error: nsamples != (charge_nbytes[dcrc]*2 + phonon_nbytes[dcrc]*4)/4" << std::endl;
      }       

      } // End of loop over DCRCs that shoves data into banks

    gettimeofday(&stop,NULL);
    //	printf ("Elapsed during waveform fetch cycle: %f\n",stop.tv_sec-start.tv_sec
    //	  + 0.000001*(stop.tv_usec-start.tv_usec));


    } // end of loop over number of triggers to be read out


    // Add trailer to word; stick in number of triggers again.
    *pdata32++ = 0x80000000 + (DWORD) totalnumberoftrigsread;
    pdata_sam++;
    printf ("End of writing: wrote %d, expected to write %d\n",
	    totalnumberoftrigsread,numbertofetch);

    //    int size2 = bk_close(pevent, pdata32);    
    bk_close(pevent, pdata32);    
  
  } // end of if statement that executes only if there were triggers to read out
  
  // close the bank
  return bk_size(pevent);
}



INT synchronize_cards () {


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

}
