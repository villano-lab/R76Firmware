/********************************************************************
 triggerfe2.c - SuperCDMS-SNOLAB trigger processor.
 This version: January 29, 2014
 It fetches trigger primitive information from the tower front-ends
 and puts it into memory, purging older data.  It then makes trigger
 decisions depending on the trigger mode, and writes trigger information
 to the ODB.  
 Creators: Scott Oser & Bill Page (UBC)
 \********************************************************************/




#include <vector>
#include <stdio.h>
#include <time.h>
#include <sys/time.h>
#include <stdlib.h>
#include "midas.h"
#include <stdint.h>
#include <iostream>
#include <sstream>
#include "utils1.h"

extern float ran1 (long *idum);

// some comment gates.  TIME_COMMENTS and PILEUP_COMMENTS are in the
// pileup function, FETCH_PRIM_COMMENTS are in fetch_primitives function,
// TRIG_COMMENTS are in the basic_trigger function
//#define TIME_COMMENTS
//#define FETCH_PRIM_COMMENTS
//#define  PILEUP_COMMENTS
//#define TRIG_COMMENTS


 /* make frontend functions callable from the C framework */
 #ifdef __cplusplus
 extern "C" {
 #endif

 /*-- Globals -------------------------------------------------------*/

 /* The frontend name (client name) as seen by other MIDAS clients   */
 char *frontend_name = "triggerfe2";
 /* The frontend file name, don't change it */
 char *frontend_file_name = __FILE__;

 /* frontend_loop is called periodically if this variable is TRUE    */
 BOOL frontend_call_loop = FALSE;

 /* a frontend status page is displayed with this frequency in ms */
 INT display_period = 000;


 /* maximum event size produced by this frontend */
   INT max_event_size = 2560000;

 /* maximum event size for fragmented events (EQ_FRAGMENTED) */
 /* This is not really used */
   INT max_event_size_frag = 100000;

 /* buffer size to hold events - must be >= 2*max_event_size */
   INT event_buffer_size = 52 * 100000;
   void **info;
   char  strin[256];
   HNDLE hDB, hSet;


// Maximum number of towerfe3.exe's allowed
 const  INT max_tower_number = 30;
// maximum number of trigger primitives kept in memory for each tower
 const INT CBSIZE = 6000;
//max number of DCRCs
 const INT MAX_DCRCs = 150;


//Two arrays that are used in order to check if a tower has crashed.
// The enable_tower is set by the user in frontend_init(), a 1 used for any 
// tower that should be working. 
   BOOL enable_tower[max_tower_number+1] = {0};
// The tower mask is initially zero.  It is populated with ones in the
// take_tower_attendance function if the tower is supposed to be enabled
// but not running, or is supposed to be disabled but is running
   BOOL towermask[max_tower_number+1] = {0};

   const INT SELECTIVE_READOUT = 0;
   const INT FULL_READOUT = 1;

// Hardwire the readout mode for now---should be set by the ODB ultimately
   //   INT trigmode = SELECTIVE_READOUT;
   INT trigmode = FULL_READOUT;

// While loops are implemented to wait for towerfe to read the triggers and
// read the waveforms from the DCRCs. tower attendance is taken after this 
// many seconds 
   const double WAVEFORM_WAIT_TIME = 3.5;
   const double RTREQUEST_WAIT_TIME = 3.5;

// The waveform of triggers that occur within the PILEUP_CUT of
// each other are not readout.  (12/19/13)->0.0001s is used because noise
// in the dcrc occurs at 0.00005-0.00015s.  This way we have some pileup
// rejection when testing on noise.  In real life this will be changed to
// something based on the waveform length, and controlled by the ODB
   double PILEUP_CUT= 0.0001; 

   // Structure to contain information for each trigger primitive returned
   typedef struct {
     bool chantrig[16];
     unsigned short int cycle;
     char address[8];
     double acq_time;
   } trigger_prim;


   // Structure to keep track of where we're reading and writing to from
   // a circular buffer of trigger primitives for each DCRC
   typedef struct {
     int next_entry;
     int start_last_poll;
   } buff_index;

 // For each DCRC declare a circular buffer that we'll stuff the trigger
 // primitives returned by "rt" into.
   trigger_prim trigprim[MAX_DCRCs+1][CBSIZE];
   buff_index circbuff[MAX_DCRCs+1];



   // Length of trigger primitive buffer from each tower
   // Up to 500 triggers per poll x 13 bytes per trigger + 8 header bytes
   const int headerbytes=8;
   const int trigprimbufsize = headerbytes + 13*500;
   // Length of trigger output buffer for each tower
   const int trigoutbufsize = headerbytes + 13*500;


// Some variables for taking BOR and EOR randoms [ANV]
bool DID_RANDOMS = false;
bool DOING_EOR = false;
int RAND_ACCUMULATED = 0;
// number of randoms (these have corresponding ODB keys in /Triggerfe2/Settings)
int NBOR = 0;
int NEOR = 0;
// frequency of randoms (these have corresponding ODB keys in /Triggerfe2/Settings)
float FBOR = 1; //Hz
float FEOR = 1; //Hz
//make a general set of variables that the mechanism uses to take randoms
//switching the NBOR,FBOR or NEOR,FEOR data into these vars
int NR = 0;
int FR = 1; //Hz


long int idum = -982334343;



/*-- Function declarations -----------------------------------------*/

int read_odb_trig_settings ();
INT frontend_init();
INT frontend_exit();
INT begin_of_run(INT run_number, char *error);
INT end_of_run(INT run_number, char *error);
INT pause_run(INT run_number, char *error);
INT resume_run(INT run_number, char *error);
INT frontend_loop();
void request_rts (void);

INT form_triggers(char *pevent, INT off);

INT fetch_primitives (INT whichtower);

INT basic_trigger (unsigned char trigout[max_tower_number][trigoutbufsize]);
INT generate_inrun_randoms (unsigned char trigout[max_tower_number][trigoutbufsize]);
INT generate_random_sequence (unsigned char trigout[max_tower_number][trigoutbufsize],float rate, int *nrand);
BOOL initialize_randoms_info (void);
BOOL defer_for_end_randoms(int transition, BOOL first);
BOOL init_tower_and_buffer_params(void);
INT write_triglist_to_odb (unsigned char trigout[max_tower_number][trigoutbufsize]); 


// Takes the triggers index and the triggers dcrc, the time of the
// trigger is encoded in the trigger address. the function compares
// against the previous and the following trigger and returns TRUE if the
// trigger occurs within a globally determined pileup cut
bool pileup(int triggers_dcrc, int triggers_index);

// looks at triggers across all dcrcs and discards all but the first
// within a window
// returns TRUE if there is an earlier trigger from another DCRC
// within the window
bool cull(int triggers_dcrc, int triggers_index);

// Populates the enable_tower[] array  with the ODB boolean variable 
// /Equipment/Tower#/Settings/EnabledForTrigger 
void set_tower_list();

// Checks the enable_tower[] array agains the first failed variable
// (/Programs/*program name*/First failed) and populates towermask with
// 1's for the malfunctioning towers.
void take_tower_attendance();

/*-- Equipment list ------------------------------------------------*/

#undef USE_INT

EQUIPMENT equipment[] = {

   {"Triggerfe2",               /* equipment name */
    {2, 0,                   /* event ID, trigger mask */
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
    form_triggers,      /* readout routine */
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
// Upon init, check which towers are running and reset the trigger primitive
// circular buffer
INT frontend_init()
{

  //set tower list, take tower attendance, initialize circular buffer, read trigger settings
  init_tower_and_buffer_params();

  //register a deferred transition for EOR randoms
  if (cm_register_deferred_transition(TR_STOP, defer_for_end_randoms) != CM_SUCCESS) {
      printf("triggerfe2(frontend_init):Cannot register deferred STOP transition\n");
  }
  else{
      printf("triggerfe2(frontend_init):Registered TR_STOP deferred transition\n");
  }
 

   return SUCCESS;
}

/*-- Frontend Exit -------------------------------------------------*/

INT frontend_exit()
{
  printf("Exiting triggerfe2.exe!\n");
   return SUCCESS;
}

/*-- Begin of Run --------------------------------------------------*/
// Upon run start, clear settings just as in frontend_init
INT begin_of_run(INT run_number, char *error)
{
  //set tower list, take tower attendance, initialize circular buffer, read trigger settings
  init_tower_and_buffer_params();

  //initialize the BOR and EOR rnadoms
  initialize_randoms_info();

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
// This is not currently used by the trigger front-end
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

//loop over all the towers and set the enable_tower[] array 
// from the ODB variable EnabledForTrigger variable
void set_tower_list(){

  char set_str[80];

  for(int tower = 1; tower < max_tower_number; tower++){
    sprintf(set_str, "/Equipment/Tower%02d/Settings/EnabledForTrigger", tower);
    enable_tower[tower] = odbReadBool(set_str, 0, FALSE);
    printf("tower %d enabled: %d\n", tower, enable_tower[tower]);
  }
}


//loop over all the tower and set the towermask array to 1 for malfunctioning 
// towers.  Currently it even checks towers that are not enabled.  Maybe
// this should be altered to check only enabled towers.
void take_tower_attendance(){
  HNDLE hkey;
  char set_str[80];

  int crashed_tower_count = 0;
  int enabled_tower_count = 0;

  DWORD first_failed;
  int size = sizeof(first_failed);  
  for(int tower = 1; tower < max_tower_number; tower++){
    
    sprintf (set_str,"/Programs/towerfe3_%02d/First failed", tower);
    int foundkey = db_find_key(hDB, 0, set_str, &hkey);   
    if (foundkey == SUCCESS) {
      db_get_data(hDB,hkey,&first_failed,&size,TID_DWORD);
    } else {
      // If the tower has never been run, return status as failed
      first_failed = 1;
    }


    if(enable_tower[tower] == 1){
      enabled_tower_count += 1;
    }

    if(first_failed != 0 && enable_tower[tower] == 1){
      towermask[tower] = 1;
      crashed_tower_count += 1;
      printf("Tower %d is supposed to be enabled for trigger but has crashed (first failed = %d,enable_tower[%d] = %d), towermask[%d] set to 1 \n", tower, first_failed, tower, enable_tower[tower], tower); 
    }
    else if(first_failed == 0 && enable_tower[tower] == 0){
      towermask[tower] = 1;
      crashed_tower_count += 1;
      printf("Tower %d is supposed to be diabled for trigger but is running (first failed = %d,enable_tower[%d] = %d), towermask[%d] set to 1 \n", tower, first_failed, tower, enable_tower[tower], tower);
    } 
    else{
      towermask[tower] = 0;
    }
  }
  printf("Done with tower attendance.  %d of %d enabled towers are malfunctioning.\n", crashed_tower_count, enabled_tower_count);

}

    

/*-- Event readout -------------------------------------------------*/
INT form_triggers(char *pevent, INT off)
{

  printf ("Here I am, in form_triggers\n");

  // Clear list of triggers to be read on each tower: # encoded in first 2 bytes
  unsigned char trigout[max_tower_number][trigoutbufsize];
  for (int tower=1;tower<max_tower_number; tower++) {
    trigout[tower][0] = 0;
    trigout[tower][1] = 0;
  }

  /***************BEGIN: Generate Trigger Primitives for Fetching*******************/
  //first clause of if statement generates randoms for BOR random strings if necessary
  //after they are completed we should go into the second clause only until the end-of-run randoms
  //sequence is initiated by "stopping" the run. 
  if(NR>0 && !DID_RANDOMS && FR>0 && RAND_ACCUMULATED<NR){

    // get those randoms
    int nrand=0;
    generate_random_sequence(trigout,FBOR,&nrand);

    //add randoms to the RAND_ACCUMULATED
    RAND_ACCUMULATED+=nrand;
    printf("Accumulated %d random events\n",RAND_ACCUMULATED);
    if(RAND_ACCUMULATED>=NR)
      printf("Finished accumulating randoms with %d random events\n",RAND_ACCUMULATED);

  }
  else if(!DOING_EOR){
    request_rts();


    // Load the trigger primitive information from the ODB
    // Only fetch primitives for the towers that are enabled and that we expect 
    // to be running 
    for (int tower=1;tower<=max_tower_number; tower++){
      if(towermask[tower] == 1 || enable_tower[tower] == 0) continue; 
      fetch_primitives(tower);
    }


//   Apply a trigger algorithm and create the list of waveforms we want 
//   to read.  This will go back into the ODB.
      printf ("Running basic_trigger algorithm now.\n");
      basic_trigger(trigout);

      printf ("Running generate_inrun_randoms algorithm now.\n");
      generate_inrun_randoms(trigout);
  } 
  /***************END: Generate Trigger Primitives for Fetching*******************/

//  for (int i=1; i<max_tower_number; i++) 
//    printf ("Trigs test: %d on tower%2d\n",trigout[i][1]+256*trigout[i][0],i);

  // Write the character buffers to the ODB
  write_triglist_to_odb(trigout);


  // Wait until the wavform have been fetched
  // First check which towers are alive.
  take_tower_attendance();
  printf ("Waiting for waveform fetching.\n");


  //here we poopulate the int state with the valua of 
  //Runinfo/Transition in progres in the ODB, which equals 0 if run
  //is ongoing but is set to 2 if the system is in the transition state
  // where you've told it to stop but it has not.
  HNDLE run_state_key;
  char run_state_str[80];
  int state;
  int size_state = sizeof(state);
  sprintf (run_state_str,"/Runinfo/Transition in progress");
  int found_state_key = db_find_key(hDB, 0, run_state_str, &run_state_key);


  HNDLE hkey;
  char keyname[80];
  int size = trigoutbufsize;
  for (int i=1; i<max_tower_number; i++) {
// Only wait for waveform fetching for towers that will actually fetch waveforms (enabled and running)
    if (towermask[i] == 1 || enable_tower[i] == 0) continue; 
    sprintf (keyname,"/Equipment/Tower%02d/TriggerList/triggerlist", i);
    unsigned char buff[trigoutbufsize];
    if (db_find_key(hDB,0,keyname, &hkey) == DB_SUCCESS) {
      int toberead=1;
      struct timeval start,stop;
      gettimeofday(&start, NULL);
      int timer_increment = 0;
      // To satisfy the while loop condition, there must be no values in the first
      //2 elements of the buff array (which is populated by the triggerlist in the ODB),
      // and the tower must be running.  Additionally, the state variable must not be 2.
      //if it is 2, this means the program is in some transition where you've told it to
      //stop but it has not. In this case, break out of the while loop (which is probably
      //preventing the run stop), in order to allow the run stop.
      while (toberead > 0 && towermask[i] == 0 && state != 2) {
	db_get_data(hDB,hkey,buff,&size,TID_CHAR);
	toberead = 256*buff[0]+buff[1];
	
	gettimeofday(&stop, NULL);
	float while_loop_time = stop.tv_sec-start.tv_sec + 0.000001*(stop.tv_usec-start.tv_usec);
	
	//issue a print statement every 1/2 second required to wait for a tower to fetch waveforms
	if(while_loop_time > 0.5*timer_increment){
	  printf("waiting for Tower%d waveform fetching for %fs\nwill wait for %fs before taking attendance\n", i, while_loop_time, WAVEFORM_WAIT_TIME);
	  timer_increment++;
	}
	//take attendance if it has been over a predetermined time (~5s).
	// if the tower has crashed, towermask will be set to 1 which will break out of the while loop.
	if (while_loop_time >WAVEFORM_WAIT_TIME){
	  printf("taking tower attendance from the waveform loop\n");
	  take_tower_attendance();
	  
	  if(found_state_key == SUCCESS){
	    db_get_data(hDB, run_state_key,&state,&size_state,TID_INT);
	  }
	  
	  printf("\n\n the value of state (transition in progress is %d\n\n", state);
	  
	}
      }
    }
    if (towermask[i] == 1){printf ("Did not clear hurdle tower%02d. crashed sometime during waveform fetching\n", i);
    }
    else{printf ("Cleared hurdle tower%02d\n", i);}
  }
  printf ("Done waiting for waveform fetching.\n");

  bk_init32(pevent);
  return bk_size(pevent);
}



INT write_triglist_to_odb  (unsigned char trigout[max_tower_number][trigoutbufsize]) { 

  // Code to read from the trigger buffer and set up the list of        
  // waveforms to request.    
  HNDLE hkey;
  char keyname[80];

  /*  // Start kludge to compare priminfo to trigout
  int thistower = 0;
  if (thistower == 1) {
    sprintf (keyname,"/Equipment/Tower%02d/TriggerList/priminfo", thistower);
    unsigned char buff[trigprimbufsize];
    int size = trigprimbufsize;
    db_find_key(hDB,0,keyname, &hkey);
    db_get_data(hDB,hkey,buff,&size,TID_CHAR);
    for (int i=0; i<50; i++){
      printf ("%d %c %d %d %d\n", i, buff[i],buff[i],trigout[1][i],buff[i]-trigout[1][i]);
    }
  }
  // End kludge to compare priminfo to trigout */


  for (int tower=1;tower<max_tower_number;tower++) {
    int numTriggers = trigout[tower][0]*256+trigout[tower][1];
    if (numTriggers == 0) continue;
    sprintf (keyname,"/Equipment/Tower%02d/TriggerList/triggerlist", tower);
    unsigned char buff[trigoutbufsize];
    
    for (int i=0; i<trigoutbufsize; i++) buff[i]=trigout[tower][i];

    // Find the tower's ODB key and write to it
    int status = db_find_key(hDB,0,keyname, &hkey);
    if (status == SUCCESS) db_set_data(hDB,hkey,buff,sizeof(buff),trigoutbufsize,TID_CHAR);
  }

  return 1;
}



INT fetch_primitives (int thistower) {

  // Code to read from the trigger buffer and set up the list of        
  // waveforms to request.    
  HNDLE hkey;
  char keyname[80];
  sprintf (keyname,"/Equipment/Tower%02d/TriggerList/priminfo", thistower);
  unsigned char buff[trigprimbufsize];

#ifdef FETCH_PRIM_COMMENTS
  printf ("Fetching primitives from Tower %d\n", thistower);
#endif

    // Store the current locations of the next entry for each DCRC's
    // circular buffer.  These will become the starting entry for the
    // poll, after we read in thte new data
    int list_of_next_entries[MAX_DCRCs];
    for (int i=0; i<MAX_DCRCs; i++) 
            list_of_next_entries[i]=circbuff[i].next_entry;


  if (db_find_key(hDB,0,keyname, &hkey) == DB_SUCCESS) {

    // Fetch the data from the trigger buffer for this tower, and unpack it
    int size = trigprimbufsize;
    db_get_data(hDB,hkey,buff,&size,TID_CHAR);

    // First unpack 8 bytes of header info:
    // Bytes 0-1: number of triggers in this bank
    // Bytes 2-5: time at which trigger primitives were read out
    // Bytes 6-7: value of "rd 0" when trigger primitives were read out
    int numTriggers = buff[0]*256+buff[1];
    int current_time = (buff[2] << 24) + (buff[3] << 16) 
                              + (buff[4] << 8) + (buff[5]);
    int rd0stamp = buff[6]*256+buff[7];

#ifdef FETCH_PRIM_COMMENTS
    printf ("Got %d triggers in buffer at time %d for tower %d\n", numTriggers, current_time,thistower); 
#endif


    // Loop through the triggers and unpack them, storing the trigger
    // primitives in the circular buffers of the relevant DCRCs
    for (int i=0;i<numTriggers;i++) {

      // Ideally I would be unpacking information that looks like this:
      // Each trigger will have 10 bytes of data stored with it
      // Byte 0: which DCRC in the array the trigger came from
      // Bytes 1-2: trigger bit information (16 channels)
      // Byte 3: Clock "rollover" value: one byte encoding 0-255
      // Bytes 4-9: ASCII bytes for trigger address
      // Note: This code is not currently compatible with what the front end
      // will put out;
      // So instead what I have coming from towerfe3.exe is this (13 bytes):
      // Bytes 0-7: trigger address, including trigger bits and address
      // Byte 8: which DCRCs to read--ignore this byte
      // Bytes 9-12: trigger origin word---lower 10 bits give which DCRC
      int buffindex = headerbytes+13*i;
      int thisdcrc = 
	buff[buffindex+12]+(buff[buffindex+11] & 0x02)*256;
      // Point index to the next free slot in this DCRC's circular buffer
      int index = circbuff[thisdcrc].next_entry % CBSIZE;

      //Now let's fill in the trigger primitive information
      // First check which channels triggered

      unsigned int triggeringchannels; 
      std::stringstream ss;
      ss << std::hex << buff[buffindex+0] << buff[buffindex+1];
      ss >> triggeringchannels;
#ifdef FETCH_PRIM_COMMENTS
      printf ("Trigger bit pattern %c%c =", buff[buffindex],buff[buffindex+1]);
#endif
      for (int k=0;k<16;k++) {
	trigprim[thisdcrc][index].chantrig[k] = FALSE;
	if (triggeringchannels & (0x1 << k)) 
	  trigprim[thisdcrc][index].chantrig[k] = TRUE;
      }
#ifdef FETCH_PRIM_COMMENTS
      for (int k=16;k>=0;k--) {
	if (trigprim[thisdcrc][index].chantrig[k] == TRUE) {
	  printf ("1");}
	else  {printf ("0");}
      }
      printf ("\n");
#endif


      // Now encode the DCRC rollover counter value.  Hardwired to zero for
      // now since it's not actually implemented in the current DCRC
      trigprim[thisdcrc][index].cycle = 0;
      // Now store the 6 ASCII bytes of trigger address
      for (int k=0;k<8;k++) {
	trigprim[thisdcrc][index].address[k]=buff[buffindex+k];
      }
      // Finally, store the time at which this primitive occurred
      trigprim[thisdcrc][index].acq_time = current_time;
#ifdef FETCH_PRIM_COMMENTS
      printf ("Address ");
      for (int k=0;k<8;k++) printf ("%c", trigprim[thisdcrc][index].address[k]);
      printf (" at time %f\n", trigprim[thisdcrc][index].acq_time);
#endif

      circbuff[thisdcrc].next_entry = 
	((circbuff[thisdcrc].next_entry + 1) % CBSIZE); 
#ifdef FETCH_PRIM_COMMENTS
      printf ("Unpacked trigger on DCRC%d and updated the next entry ptr to %d\n", thisdcrc,circbuff[thisdcrc].next_entry);
#endif

    } // end of loop over triggers in buffer---all are shoved into buffers
 

    // Now update the pointers in the circular buffers
    // Store location of start the first entry just read out
    for (int i=8*thistower; i<8*thistower+6; i++) 
         circbuff[i].start_last_poll=list_of_next_entries[i];
 
#ifdef FETCH_PRIM_COMMENTS
    printf ("Added %d entries to trigger primitive buffer on Tower%d\n",numTriggers, thistower);
#endif

    // Now scan back to look for stale (more than 3.2s old) info
    // This code doesn't exist yet
    

    // Simply return the number of triggers received and unpacked
    return numTriggers;
  } 
  else { // If no trigger information successfully received
   
    printf ("Didn't find %s, returning 0\n",keyname);
   
    return 0;

  }
}


// looks at triggers across all dcrcs and discards all but the first
// within a window
// returns TRUE if there is an earlier trigger from another DCRC
// within the window
bool cull(int triggers_dcrc, int triggers_index){
  
  int next_trigger_index = (triggers_index + 1) % CBSIZE;
  int previous_trigger_index = triggers_index-1;
  if (triggers_index == 0) previous_trigger_index = CBSIZE-1;
 
  //FIXME [ANV] a HACK to turn off triggering for DCRC1, since it's giving problems
  printf("TRIGGER FROM DCRC: %d\n",triggers_dcrc);
  if(triggers_dcrc==9)
    return TRUE;

  //prints the triggers dcrc, index, and time(its address)
#ifdef TIME_COMMENTS
    printf("\ntrigger address for dcrc %d and index %d at time %f: %c%c%c%c%c%c%c%c\n",triggers_dcrc, triggers_index, trigprim[triggers_dcrc][triggers_index].acq_time, trigprim[triggers_dcrc][triggers_index].address[0], trigprim[triggers_dcrc][triggers_index].address[1],trigprim[triggers_dcrc][triggers_index].address[2], trigprim[triggers_dcrc][triggers_index].address[3],trigprim[triggers_dcrc][triggers_index].address[4], trigprim[triggers_dcrc][triggers_index].address[5],trigprim[triggers_dcrc][triggers_index].address[6], trigprim[triggers_dcrc][triggers_index].address[7]);
#endif

    //unpacks the last 6 (of 8) hexadecimal characters in the address into an integer because these are the characters that encode the time
     unsigned int triggers_time;
     std::stringstream sstriggers_time;
     sstriggers_time << std::hex << trigprim[triggers_dcrc][triggers_index].address[2] << trigprim[triggers_dcrc][triggers_index].address[3] << trigprim[triggers_dcrc][triggers_index].address[4] << trigprim[triggers_dcrc][triggers_index].address[5] << trigprim[triggers_dcrc][triggers_index].address[6] << trigprim[triggers_dcrc][triggers_index].address[7];
     sstriggers_time >> triggers_time;

     //converts the integer obtainted in the previous step to a time in seconds
     //the conversion: 6 hex characters means 24 bits.  2 bits are used for some paddings. phonon channels cycle at 1.25*10^6Hz. therefore convert to seconds by 1/1.25*10^6 (=3.3554432/4194304)  
     double real_triggers_time = triggers_time*3.3554432/4194304;
#ifdef TIME_COMMENTS
     printf("triggers_time:%d \nreal_triggers_time:%f \n", triggers_time, real_triggers_time);
#endif
     unsigned int time_next;
     std::stringstream sstime_next;
     sstime_next << std::hex << trigprim[triggers_dcrc][next_trigger_index].address[2] << trigprim[triggers_dcrc][next_trigger_index].address[3] << trigprim[triggers_dcrc][next_trigger_index].address[4] << trigprim[triggers_dcrc][next_trigger_index].address[5] << trigprim[triggers_dcrc][next_trigger_index].address[6] << trigprim[triggers_dcrc][next_trigger_index].address[7];
     sstime_next >> time_next;
     double real_time_next = time_next*3.3554432/4194304;
#ifdef TIME_COMMENTS
     printf("time_next:%d\nreal_time_next:%f \n", time_next, real_time_next);
#endif

     unsigned int time_prev;
     std::stringstream sstime_prev;
     sstime_prev << std::hex << trigprim[triggers_dcrc][previous_trigger_index].address[2] << trigprim[triggers_dcrc][previous_trigger_index].address[3] << trigprim[triggers_dcrc][previous_trigger_index].address[4] << trigprim[triggers_dcrc][previous_trigger_index].address[5] << trigprim[triggers_dcrc][previous_trigger_index].address[6] << trigprim[triggers_dcrc][previous_trigger_index].address[7];
     sstime_prev >> time_prev;
     double real_time_prev = time_prev*3.3554432/4194304;
#ifdef TIME_COMMENTS
     printf("time_prev:%d\nreal_time_prev:%f \n", time_prev, real_time_prev);
#endif

     int time_difference_prev = triggers_time-time_prev;
     double real_time_difference_prev = (triggers_time-time_prev)*3.3554432/4194304;
#ifdef TIME_COMMENTS
     printf("time difference_prev(seconds): %f\n", real_time_difference_prev);
#endif

     int time_difference_next = time_next-triggers_time;
     double real_time_difference_next = (time_next-triggers_time)*3.3554432/4194304;
#ifdef TIME_COMMENTS
     printf("time difference_next(seconds): %f\n", real_time_difference_next);
#endif
     //****
     //*****
     //******
     double pileup_cut = PILEUP_CUT;//sets the cut to a global value (12/19/13->0.0001s is used because noise in the dcrc occurs at 0.00005-0.00015s, so we get some pileup rejection)
     //******
     //*****
     //****
    if(real_time_difference_next < pileup_cut){
            if(real_time_difference_prev < pileup_cut){
#ifdef PILEUP_COMMENTS
	      printf("PILEUP--both the previous and next event are within %f seconds of this one\nWill not read these waveforms\n\n", pileup_cut);
#endif
	    }
	    else{
#ifdef PILEUP_COMMENTS
	      printf("PILEUP--the next event is within %f seconds of this one\nWill not read these waveforms\n\n", pileup_cut);
#endif
	    }
       return TRUE;
     }
     if(real_time_difference_prev < pileup_cut){
#ifdef PILEUP_COMMENTS
       printf("PILEUP--the previous event is within %f seconds of this one\nWill not read these waveforms\n\n", pileup_cut);
#endif
       return TRUE;
     }

     return FALSE;     
}


// Pileup routine: takes the triggers index and the triggers dcrc, the
// time of the trigger is encoded in the trigger address. the function
// compares against the previous and the following trigger and returns
// TRUE if the trigger occurs within a globally determined pileup cut
bool pileup(int triggers_dcrc, int triggers_index){
  
  int next_trigger_index = (triggers_index + 1) % CBSIZE;
  int previous_trigger_index = triggers_index-1;
  if (triggers_index == 0) previous_trigger_index = CBSIZE-1;
 
  //FIXME [ANV] a HACK to turn off triggering for DCRC1, since it's giving problems
  printf("TRIGGER FROM DCRC: %d\n",triggers_dcrc);
  if(triggers_dcrc==9)
    return TRUE;

  //prints the triggers dcrc, index, and time(its address)
#ifdef TIME_COMMENTS
    printf("\ntrigger address for dcrc %d and index %d at time %f: %c%c%c%c%c%c%c%c\n",triggers_dcrc, triggers_index, trigprim[triggers_dcrc][triggers_index].acq_time, trigprim[triggers_dcrc][triggers_index].address[0], trigprim[triggers_dcrc][triggers_index].address[1],trigprim[triggers_dcrc][triggers_index].address[2], trigprim[triggers_dcrc][triggers_index].address[3],trigprim[triggers_dcrc][triggers_index].address[4], trigprim[triggers_dcrc][triggers_index].address[5],trigprim[triggers_dcrc][triggers_index].address[6], trigprim[triggers_dcrc][triggers_index].address[7]);
#endif

    //unpacks the last 6 (of 8) hexadecimal characters in the address into an integer because these are the characters that encode the time
     unsigned int triggers_time;
     std::stringstream sstriggers_time;
     sstriggers_time << std::hex << trigprim[triggers_dcrc][triggers_index].address[2] << trigprim[triggers_dcrc][triggers_index].address[3] << trigprim[triggers_dcrc][triggers_index].address[4] << trigprim[triggers_dcrc][triggers_index].address[5] << trigprim[triggers_dcrc][triggers_index].address[6] << trigprim[triggers_dcrc][triggers_index].address[7];
     sstriggers_time >> triggers_time;

     //converts the integer obtainted in the previous step to a time in seconds
     //the conversion: 6 hex characters means 24 bits.  2 bits are used for some paddings. phonon channels cycle at 1.25*10^6Hz. therefore convert to seconds by 1/1.25*10^6 (=3.3554432/4194304)  
     double real_triggers_time = triggers_time*3.3554432/4194304;
#ifdef TIME_COMMENTS
     printf("triggers_time:%d \nreal_triggers_time:%f \n", triggers_time, real_triggers_time);
#endif
     unsigned int time_next;
     std::stringstream sstime_next;
     sstime_next << std::hex << trigprim[triggers_dcrc][next_trigger_index].address[2] << trigprim[triggers_dcrc][next_trigger_index].address[3] << trigprim[triggers_dcrc][next_trigger_index].address[4] << trigprim[triggers_dcrc][next_trigger_index].address[5] << trigprim[triggers_dcrc][next_trigger_index].address[6] << trigprim[triggers_dcrc][next_trigger_index].address[7];
     sstime_next >> time_next;
     double real_time_next = time_next*3.3554432/4194304;
#ifdef TIME_COMMENTS
     printf("time_next:%d\nreal_time_next:%f \n", time_next, real_time_next);
#endif

     unsigned int time_prev;
     std::stringstream sstime_prev;
     sstime_prev << std::hex << trigprim[triggers_dcrc][previous_trigger_index].address[2] << trigprim[triggers_dcrc][previous_trigger_index].address[3] << trigprim[triggers_dcrc][previous_trigger_index].address[4] << trigprim[triggers_dcrc][previous_trigger_index].address[5] << trigprim[triggers_dcrc][previous_trigger_index].address[6] << trigprim[triggers_dcrc][previous_trigger_index].address[7];
     sstime_prev >> time_prev;
     double real_time_prev = time_prev*3.3554432/4194304;
#ifdef TIME_COMMENTS
     printf("time_prev:%d\nreal_time_prev:%f \n", time_prev, real_time_prev);
#endif

     int time_difference_prev = triggers_time-time_prev;
     double real_time_difference_prev = (triggers_time-time_prev)*3.3554432/4194304;
#ifdef TIME_COMMENTS
     printf("time difference_prev(seconds): %f\n", real_time_difference_prev);
#endif

     int time_difference_next = time_next-triggers_time;
     double real_time_difference_next = (time_next-triggers_time)*3.3554432/4194304;
#ifdef TIME_COMMENTS
     printf("time difference_next(seconds): %f\n", real_time_difference_next);
#endif
     //****
     //*****
     //******
     double pileup_cut = PILEUP_CUT;//sets the cut to a global value (12/19/13->0.0001s is used because noise in the dcrc occurs at 0.00005-0.00015s, so we get some pileup rejection)
     //******
     //*****
     //****
    if(real_time_difference_next < pileup_cut){
            if(real_time_difference_prev < pileup_cut){
#ifdef PILEUP_COMMENTS
	      printf("PILEUP--both the previous and next event are within %f seconds of this one\nWill not read these waveforms\n\n", pileup_cut);
#endif
	    }
	    else{
#ifdef PILEUP_COMMENTS
	      printf("PILEUP--the next event is within %f seconds of this one\nWill not read these waveforms\n\n", pileup_cut);
#endif
	    }
       return TRUE;
     }
     if(real_time_difference_prev < pileup_cut){
#ifdef PILEUP_COMMENTS
       printf("PILEUP--the previous event is within %f seconds of this one\nWill not read these waveforms\n\n", pileup_cut);
#endif
       return TRUE;
     }

     return FALSE;     
}


// Apply a simple trigger and write trigger banks as needed
INT basic_trigger (unsigned char trigout[max_tower_number][trigoutbufsize]) {

  // cycle through trigger primitives for each DCRC
  for (int dcrc=1;dcrc<MAX_DCRCs;dcrc++){
    int primstodo = circbuff[dcrc].next_entry - circbuff[dcrc].start_last_poll;
    if (primstodo<0) primstodo += CBSIZE;
   
#ifdef TRIG_COMMENTS
        printf ("Processing %d trigprims from DCRC%d\n", primstodo,dcrc);
#endif
    for (int i=0; i<primstodo; i++) {
      int index = ((circbuff[dcrc].start_last_poll + i) % CBSIZE);
      bool piledup = pileup(dcrc, index);
      bool needs_cull = cull(dcrc, index);
      // If trigger is not piled up
      // and not the same trigger from another DCRC
      // then do the following
      if (!piledup && !needs_cull) {
	//	printf ("basic_trigger dealing with DCRC %d, %d\n", dcrc,i);

       /// Encode a word that encodes the origin of the trigger.  Here is       
       /// the intended byte assignment:
       /// bits 32-26: unused
       /// bits 25-21: trigger type (types to be defined, 0=default)          
       /// bits 20-14: tower of 2nd (coincident) trigger source
       /// bits 13-11: DCRC# of 2nd (coincident) trigger source
       /// bits 10-04: tower of 1st (primary) trigger source
       /// bits 03-01: DCRC# of 1st (primary) trigger source
      DWORD trigorigin;
      trigorigin = dcrc;
      unsigned char dcrcstoread = 0;
      if (trigmode == SELECTIVE_READOUT) {
	dcrcstoread = 0x1 << ((dcrc % 8) - 1);
      } else if (trigmode == FULL_READOUT)
	{ dcrcstoread = 0x3f;};
      
      int starttower=1;
      int endtower=max_tower_number;

      if (trigmode == SELECTIVE_READOUT) {
	starttower = int (dcrc/8);
	endtower = starttower+1;
      };

      // Write the info to the output character buffer for affected towers
      for (int tower=starttower; tower<endtower; tower++) {
	if(towermask[tower] == 1 || enable_tower[tower] == 0) continue;


	int numtrigs = 256*trigout[tower][0] + trigout[tower][1];
	if (numtrigs >= (trigoutbufsize-headerbytes)/13) {
#ifdef TRIG_COMMENTS
	  printf ("Buffer overflow on tower%02d, dropping trigger read request\n",tower);
#endif
	  continue;
	}

	// Note: numtrigs has not been incremented yet
	int k = 8 + 13*numtrigs;
	trigout[tower][k+8] = dcrcstoread;
	trigout[tower][k+9]= (trigorigin & 0xff000000) >> 24;
	trigout[tower][k+10]= (trigorigin & 0x00ff0000) >> 16;
	trigout[tower][k+11]= (trigorigin & 0x0000ff00) >> 8;
	trigout[tower][k+12]= trigorigin & 0x000000ff;
	for (int j=0; j<8; j++) trigout[tower][k+j] = 
				  trigprim[dcrc][index].address[j];
	numtrigs++;
	// Update number of triggers
	trigout[tower][0] = (numtrigs & 0xff00) >> 8;
	trigout[tower][1] = (numtrigs & 0xff);
	// In principle write some timestamp to array entries 2-7
	// But these aren't being used currently, so set to zero
#ifdef TRIG_COMMENTS
	printf ("Tower %d has %d triggers\n", tower,numtrigs);
#endif
      }
      

      } else {
	// Stuff to do if trigger vetoed due to pileup lockout
      }

    } //end of loop over primitives to process for this DCRC

  } // end of loop over DCRCs

  return 0;

}

//initialize various globals related to BOR and EOR randoms
BOOL initialize_randoms_info(void)
{
   // Some variables for taking BOR and EOR randoms [ANV]
   DID_RANDOMS = false;
   RAND_ACCUMULATED = 0;
   // number of randoms (these have corresponding ODB keys in /Triggerfe2/Settings)
   NBOR = 0;
   NEOR = 0;
   // frequency of randoms (these have corresponding ODB keys in /Triggerfe2/Settings)
   FBOR = 1; //Hz
   FEOR = 1; //Hz
   //doing EOR randoms now?
   DOING_EOR = false;

   //check for the randoms variables in the ODB
   HNDLE hkey;
   char borvar[100],fborvar[100],eorvar[100],feorvar[100];
   sprintf (borvar,"/Equipment/Triggerfe2/Settings/N Beginning of Run Randoms");
   sprintf (fborvar,"/Equipment/Triggerfe2/Settings/Beginning of Run Freq (Hz)");
   sprintf (eorvar,"/Equipment/Triggerfe2/Settings/N End of Run Randoms");
   sprintf (feorvar,"/Equipment/Triggerfe2/Settings/End of Run Freq (Hz)");
   int borkey = db_find_key(hDB, 0, borvar, &hkey);   
   int fborkey = db_find_key(hDB, 0, fborvar, &hkey);   
   int eorkey = db_find_key(hDB, 0, eorvar, &hkey);   
   int feorkey = db_find_key(hDB, 0, feorvar, &hkey);   
   if (borkey == SUCCESS && fborkey == SUCCESS) {
     NBOR = odbReadInt(borvar, 0, 0);
     FBOR = odbReadFloat(fborvar, 0, 1.0);

     //put this information into the generic random sequence taking vars
     //the NR was initialized to zero, so if not set here, no BORs are taken
     NR = NBOR;
     FR = FBOR;
   } else {
     // If we don't have this variable just pretend like we
     // did the BOR randoms [ANV]
     DID_RANDOMS=true;
   }

   // just set the EOR parameters, worry about disabling though [ANV]
   if (eorkey == SUCCESS && feorkey == SUCCESS) {
     NEOR = odbReadInt(eorvar, 0, 0);
     FEOR = odbReadFloat(feorvar, 0, 1.0);
   }

   //printf("Randoms have been initialized as thus:\n");
   //printf("Begin of run number of randoms: %d\n",NBOR);
   //printf("Begin of run frequency of randoms: %4.2f\n",FBOR);
   //printf("End of run number of randoms: %d\n",NEOR);
   //printf("End of run frequency of randoms: %4.2f\n",FEOR);
   return TRUE;
}
//hold off run end until EOR collected
BOOL defer_for_end_randoms(int transition, BOOL first)
{
  //don't actually defer if we don't want EOR
  if(NEOR<=0 || FEOR<=0){
    printf("In deferred end-of-run randoms transition, but nothing to do\n");
    return TRUE;
  }

  //on the first time switch DOING_EOR to true and DID_RANDOMS to false
  if(first){
    printf("Starting end-of-run randoms\n");
    DOING_EOR = true;
    DID_RANDOMS = false;
    RAND_ACCUMULATED = 0;
    NR = NEOR;
    FR = FEOR;
  }

  //end only when we've accumulated the right number of randoms
  if(RAND_ACCUMULATED>=NR){
    return TRUE;
  }else {
    return FALSE;
  }

}
BOOL init_tower_and_buffer_params(void)
{
  // Determine which towers are enabled according to the ODB
  set_tower_list();
  // check which front-end processes are running
  take_tower_attendance();

  // Reset the circular buffer counters to zero for all DCRCs
  for (int i=1;i<MAX_DCRCs;i++) {
    circbuff[i].next_entry = 0;
    circbuff[i].start_last_poll = 0;
  }

  read_odb_trig_settings();


  printf ("Trigger mode = %d, ", trigmode);
  printf ("Pileup cut = %f\n", PILEUP_CUT);

  return TRUE;
}
// Generate a sequence of randoms in one poll
INT generate_random_sequence (unsigned char trigout[max_tower_number][trigoutbufsize],float rate, int *nrand)
{

  //figure out how many randoms we want for one polling period
  char set_str[80];

  sprintf(set_str, "/Equipment/Triggerfe2/Common/Period");
  float time_between_polls = odbReadInt(set_str, 0, 1000)*0.001;
  float desired_num_events = rate*time_between_polls;
  int num_rnd_to_generate = int(desired_num_events);
  float remainder = desired_num_events-num_rnd_to_generate;
  if (ran1(&idum) < remainder) num_rnd_to_generate++;

  //number of randoms generated for each tower
  //each tower seems to have independent random trig times 
  //are the triggers independent by tower too in this version? [ANV]
  int nrandgenerated=0;
				
  //FIXME: this code is nearly identical to the generate_inrun_randoms function, 
  //that suggests a sub-function is appropriate [ANV]
  // Generate random triggers
  for (int iter=0; iter<num_rnd_to_generate; iter++) {
    /// Encode a word that encodes the origin of the trigger.  Here is       
    /// the intended byte assignment:
    /// bits 32-26: unused
    /// bits 25-21: trigger type (types to be defined, 0=default)          
    /// bits 20-14: tower of 2nd (coincident) trigger source
    /// bits 13-11: DCRC# of 2nd (coincident) trigger source
    /// bits 10-04: tower of 1st (primary) trigger source
    /// bits 03-01: DCRC# of 1st (primary) trigger source
    DWORD trigorigin;
    // set trigger type to 1 (random), and all other bits to zero
    trigorigin = (0x1 << 20);
    // set all dcrcs to read out
    unsigned char dcrcstoread = 0x3f;
    
    int starttower=1;
    int endtower=max_tower_number;
    
    // Write the info to the output character buffer for affected towers
    for (int tower=starttower; tower<endtower; tower++) {
      if(towermask[tower] == 1 || enable_tower[tower] == 0) continue;
      
      int numtrigs = 256*trigout[tower][0] + trigout[tower][1];
      if (numtrigs >= (trigoutbufsize-headerbytes)/13) {
#ifdef TRIG_COMMENTS
	printf ("Buffer overflow on tower%02d, dropping random trigger request\n",tower);
#endif
	continue;
      }

	// Note: numtrigs has not been incremented yet
	int k = 8 + 13*numtrigs;
	trigout[tower][k+8] = dcrcstoread;
	trigout[tower][k+9]= (trigorigin & 0xff000000) >> 24;
	trigout[tower][k+10]= (trigorigin & 0x00ff0000) >> 16;
	trigout[tower][k+11]= (trigorigin & 0x0000ff00) >> 8;
	trigout[tower][k+12]= trigorigin & 0x000000ff;

	// Really should replace this by random trigger
	char address[8];
	//FIXME seems to hard-code a 22-bit address space is that
	//the circular buffer size?  At 4096 samples of 0.8 us and polling
	//time of 200ms that's a ~5kHz max rate not including pileup. 
	int rndaddress = int(ran1(&idum) * 4194304);
	//	sprintf (address, "1234abcd");
	sprintf (address, "%08x", rndaddress);
	printf ("Random trigger address: %s = %d\n", address,rndaddress);


	for (int j=0; j<8; j++) trigout[tower][k+j] = address[j];
	numtrigs++;
	// Update number of triggers
	trigout[tower][0] = (numtrigs & 0xff00) >> 8;
	trigout[tower][1] = (numtrigs & 0xff);
	// In principle write some timestamp to array entries 2-7
	// But these aren't being used currently, so set to zero
#ifdef TRIG_COMMENTS
	printf ("Tower %d has %d triggers\n", tower,numtrigs);
#endif
    }
    //increment number of randoms generated for each tower 
    nrandgenerated++;
  }
  
  //return the number of rands generated for each tower
  *nrand = nrandgenerated;
  return 0;
}
// Generate purely random triggers
INT generate_inrun_randoms (unsigned char trigout[max_tower_number][trigoutbufsize]) {


  char set_str[80];

  sprintf(set_str, "/Equipment/Triggerfe2/Common/Period");
  float time_between_polls = odbReadInt(set_str, 0, 1000)*0.001;
  sprintf(set_str, "/Equipment/Triggerfe2/Settings/RandomRate (Hz)");
  float rate_of_randoms = odbReadFloat(set_str, 0, 1.);
  float desired_num_events = rate_of_randoms*time_between_polls;
  int num_rnd_to_generate = int(desired_num_events);
  float remainder = desired_num_events-num_rnd_to_generate;
  if (ran1(&idum) < remainder) num_rnd_to_generate++;
				
  printf ("Generating %d random triggers\n",num_rnd_to_generate);
  

  //FIXME: this code is nearly identical to the generate_random_sequence function, 
  //that suggests a sub-function is appropriate [ANV]
  // Generate random triggers
  for (int iter=0; iter<num_rnd_to_generate; iter++) {
    /// Encode a word that encodes the origin of the trigger.  Here is       
    /// the intended byte assignment:
    /// bits 32-26: unused
    /// bits 25-21: trigger type (types to be defined, 0=default)          
    /// bits 20-14: tower of 2nd (coincident) trigger source
    /// bits 13-11: DCRC# of 2nd (coincident) trigger source
    /// bits 10-04: tower of 1st (primary) trigger source
    /// bits 03-01: DCRC# of 1st (primary) trigger source
    DWORD trigorigin;
    // set trigger type to 1 (random), and all other bits to zero
    trigorigin = (0x1 << 20);
    // set all dcrcs to read out
    unsigned char dcrcstoread = 0x3f;
    
    int starttower=1;
    int endtower=max_tower_number;
    
    // Write the info to the output character buffer for affected towers
    for (int tower=starttower; tower<endtower; tower++) {
      if(towermask[tower] == 1 || enable_tower[tower] == 0) continue;
      
      int numtrigs = 256*trigout[tower][0] + trigout[tower][1];
      if (numtrigs >= (trigoutbufsize-headerbytes)/13) {
#ifdef TRIG_COMMENTS
	printf ("Buffer overflow on tower%02d, dropping random trigger request\n",tower);
#endif
	continue;
      }

	// Note: numtrigs has not been incremented yet
	int k = 8 + 13*numtrigs;
	trigout[tower][k+8] = dcrcstoread;
	trigout[tower][k+9]= (trigorigin & 0xff000000) >> 24;
	trigout[tower][k+10]= (trigorigin & 0x00ff0000) >> 16;
	trigout[tower][k+11]= (trigorigin & 0x0000ff00) >> 8;
	trigout[tower][k+12]= trigorigin & 0x000000ff;

	// Really should replace this by random trigger
	char address[8];
	int rndaddress = int(ran1(&idum) * 4194304);
	//	sprintf (address, "1234abcd");
	sprintf (address, "%08x", rndaddress);
	printf ("Random trigger address: %s = %d\n", address,rndaddress);


	for (int j=0; j<8; j++) trigout[tower][k+j] = address[j];
	numtrigs++;
	// Update number of triggers
	trigout[tower][0] = (numtrigs & 0xff00) >> 8;
	trigout[tower][1] = (numtrigs & 0xff);
	// In principle write some timestamp to array entries 2-7
	// But these aren't being used currently, so set to zero
#ifdef TRIG_COMMENTS
	printf ("Tower %d has %d triggers\n", tower,numtrigs);
#endif
    }
  }
  return 0;
  
}





// Command all of the towers to read triggers
void request_rts (void) {

  HNDLE hkey;
  char keyname[80];

  // Set the ODB variables for each tower to make it trigger
  printf("taking tower attendance from the start of requst rts\n");
  take_tower_attendance();


  struct timeval start_rttimer,stop_rttimer;
  gettimeofday(&start_rttimer, NULL);
  printf ("\n\nStarting the rt_timer\n\n");


  for (int tower=1; tower<max_tower_number; tower++)  {
    if(towermask[tower] == 1 || enable_tower[tower] == 0) continue;

    BYTE rtflag = 1;
    // Set the rtAck byte to 1 for active towers.  The towerfe must clear it
    // back to zero to acknowledge that rt is over
    sprintf (keyname,"/Equipment/Tower%02d/TriggerList/rtAck", tower);
    int status = db_find_key(hDB, 0, keyname, &hkey);
    if (status == SUCCESS){
      printf ("Setting rtAck flag on Tower%02d\n", tower);
      db_set_data(hDB,hkey,&rtflag,sizeof(rtflag),1,TID_BYTE);
    }




    // Set the "request rt" flag that will signal towerfe to execute rt
    sprintf (keyname,"/Equipment/Tower%02d/TriggerList/rtRequest", tower);
    status = db_find_key(hDB, 0, keyname, &hkey);
    rtflag = 1;
    if (status == SUCCESS) {
      printf ("Setting rtRequest flag on Tower%02d\n", tower);
      db_set_data(hDB,hkey,&rtflag,sizeof(rtflag),1,TID_BYTE); 
    }
  }


  // Wait until the acknowledge rt flag is non-zero
  BYTE rtflag;
  int counter = 1;

  struct timeval start,stop;
  gettimeofday(&start, NULL);
 
  int timer_increment = 0;

  while (counter > 0) {
    counter = 0;
    for (int tower=1; tower<max_tower_number; tower++) {
      if(towermask[tower] == 1 || enable_tower[tower] == 0) continue;
      
      sprintf (keyname,"/Equipment/Tower%02d/TriggerList/rtAck", tower);
      int foundkey = db_find_key(hDB, 0, keyname, &hkey);
      int size = sizeof(rtflag);
      int status;
      if (foundkey == SUCCESS) {
	status = db_get_data(hDB,hkey,&rtflag,&size,TID_BYTE);
      } else {
	status = 0;
      }
      if (status == SUCCESS) counter += rtflag;
     
      gettimeofday(&stop, NULL);
      float while_loop_time = stop.tv_sec-start.tv_sec + 0.000001*(stop.tv_usec-start.tv_usec);

      //issue a print statement every 1/2 second required to wait for a tower to fetch waveforms
      if(while_loop_time > 0.5*timer_increment){
	  printf("waiting for Tower%d waveform fetching for %fs\nwill wait for %fs before taking attendance\n", tower, while_loop_time, WAVEFORM_WAIT_TIME);
	  timer_increment++;
      }
      //take attendance if it has been over a predetermined time (5s). if the tower has crashed, towermask will be set to 1 which will break out of the while loop.
      if(while_loop_time > RTREQUEST_WAIT_TIME){
	printf("taking tower attendance from the request rts loop\n");
	take_tower_attendance();
      } 
    }
  }

    gettimeofday(&stop_rttimer, NULL);
    float rt_time = stop_rttimer.tv_sec-start_rttimer.tv_sec + 0.000001*(stop_rttimer.tv_usec-start_rttimer.tv_usec);
    printf ("\n\nWhole rt_time: %f\n\n", rt_time);
  
  printf ("Acknowledgement received from rt ... continuing\n");



}


// Read triggerfe settings from the ODB
int read_odb_trig_settings (void) {

  // Read trigger mode
  trigmode = odbReadInt("/Equipment/Triggerfe2/Settings/TrigMode (0=selective, 1=full)",0,0);
  
 if (trigmode < 0 || trigmode > 1) {
   cm_msg(MERROR, frontend_name, "ERROR: trigger mode for triggerfe out of range, defaulting to 0 (selective readout mode)");
   trigmode = SELECTIVE_READOUT;
 }
 

  // Read pileup timeout in seconds
  PILEUP_CUT = odbReadDouble("/Equipment/Triggerfe2/Settings/PileupCut (s)",0,0);
  
 if (PILEUP_CUT < 0 || PILEUP_CUT > 1) {
   cm_msg(MERROR, frontend_name, "ERROR: requested pileup cut (%f) out of range, defaulting to 0.", PILEUP_CUT); 
   PILEUP_CUT = 0.;
 }
 

 return 1;

}

