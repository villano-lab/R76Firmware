/********************************************************************\
lock_manager.c - served automated ODB lock/unlock functionality
This version: June 15, 2015
Creators: Scott Oser (UBC) 
Contact: Scott Oser
\********************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include "midas.h"
#include <stdint.h>
#include <iostream>
#include <sstream>
#include "utils1.h"
#include "constants.h"
#include "lock_manager.h"


 
#ifdef __cplusplus
extern "C" {
#endif
/*-- Globals -------------------------------------------------------*/


/* The frontend name (client name) as seen by other MIDAS clients   */
char *frontend_name = "lock_mgr";
/* The frontend file name, don't change it */
char *frontend_file_name = __FILE__;

/* frontend_loop is called periodically if this variable is TRUE    */
bool frontend_call_loop = false;

/* a frontend status page is displayed with this frequency in ms */
int display_period = 000;

/* maximum event size produced by this frontend */
  int max_event_size = 1000;
 
/* maximum event size for fragmented events (EQ_FRAGMENTED) */
/* This is not really used */
  int max_event_size_frag = 100000;

/* buffer size to hold events - must be >= 2*max_event_size */
  int event_buffer_size = 20000;

/* buffer size to hold events - must be >= 2*max_event_size */
  void **info;
  HNDLE hDB;


extern INT frontend_index;

INT whichtower;

INT hotlink_int;

int dcrc_hotlink_pointer[(MAX_DCRCs+1)*NUM_UPDATE_MODES] = {0,1,2,3,4,5,6,7,8,9\
,10,11,12,13};



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


/*-- Equipment list ------------------------------------------------*/

#undef USE_INT

EQUIPMENT equipment[] = {

   {"lock_mgr%02d",               /* equipment name */
    {3, 0,                   /* event ID, trigger mask */
     "SYSTEM",               /* event buffer */
#ifdef USE_INT
     EQ_INTERRUPT,           /* equipment type */
#else
     EQ_PERIODIC|EQ_INTERRUPT,              /* equipment type */
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
    driver_event,      /* readout routine */
    },

   {""}
};
#ifdef __cplusplus
}
#endif



/*-- Frontend Init -------------------------------------------------*/
// Upon init, read ODB settings and write them to DCRC
INT frontend_init()
{
  printf ("Starting front end\n"); 

  // Determine which tower we will talk to. If none specified, default to 1
  whichtower = frontend_index;
  if (whichtower < 0) whichtower = 1;

  


  // Make sure the triggerlist for the tower exists, creating it if it doesn't.
  // Note that reading from the nth position of the array will ensure that
  // an array of least that length exists!
  //***
  //Declare hot links.  By calling the update functions with
  // update_everything = 1 we tell the hotlinked functions
  // to write every setting to the dcrc and also
  // update all the old structs with the current structs values
  //****

  char set_str[80];
  for (int dcrc=1; dcrc<=6; dcrc++) {
    sprintf (set_str,"/Equipment/Tower%02d/Settings/DCRC%01d/LockStatus", whichtower, dcrc);
    odbReadInt(set_str,0,0);
  }


  char general_str[80];
   for(int dcrc = 1; dcrc <= 6; dcrc++){
    sprintf(general_str, "/Equipment/Tower%02d/Settings/DCRC%01d/LockStatus", whichtower, dcrc);
     HNDLE general_key;
     db_find_key(hDB, 0, general_str, &general_key);
     int general_size = sizeof(hotlink_int);
     db_get_record(hDB, general_key, &hotlink_int, &general_size, 0);
     db_open_record(hDB, general_key, &hotlink_int, sizeof(hotlink_int), 
		    MODE_READ, update_permissions,	
		    &dcrc_hotlink_pointer[dcrc]);
   }

  
  

  return SUCCESS;  
}


/*-- Frontend Exit -------------------------------------------------*/

INT frontend_exit()
{
  printf("Exiting lock_manager.exe!\n");
   return SUCCESS;
}

/*-- Begin of Run --------------------------------------------------*/
// Upon run start, read ODB settings and write them to DCRC
INT begin_of_run(INT run_number, char *error)
{


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

INT driver_event(char *pevent, INT off)
{

  //    printf ("Hi there!!!\n");
 
  /* init bank structure */
  bk_init32(pevent);
 
  // close the bank
  return bk_size(pevent);
}


void update_permissions(int hDB, int key, void *c){

  int hotlink_pointer_value= *((int *) c);
  int dcrc = hotlink_pointer_value % (MAX_DCRCs+1);
  printf ("update_permissions called for DCRC%d\n", dcrc);

  char set_str[80];
  sprintf (set_str,"/Equipment/Tower%02d/Settings/DCRC%01d/LockStatus", whichtower, dcrc);
  int newmode = odbReadInt(set_str,0,0);


  switch (newmode) {
  case 0:
    lock_unlock_all_settings (dcrc, UNLOCK);
    break;
  case 1:
    lock_unlock_all_settings (dcrc, LOCK);
    break;
  case 10:
    start_led_flash_mode (dcrc);
    break;
  case 11:
    exit_led_flash_mode (dcrc);
    break;
  default:
    // code
    break;

  }

}



INT lock_unlock_key (const char*name,BOOL lock, BOOL recursive) {

  HNDLE hdir = 0;
  HNDLE hkey;

  WORD mode = MODE_READ;
  if (!lock) {
    mode = MODE_READ | MODE_WRITE | MODE_DELETE;
  }
  
  int status = db_find_key (hDB, hdir, (char*)name, &hkey);
  if (status == SUCCESS) {
    db_set_mode(hDB, hkey, mode, recursive);
    return (SUCCESS);
  } else {
    return -1; 
  }

}


INT lock_unlock_phonon_settings (int dcrc, BOOL lock) {

  char set_str[80];
  sprintf (set_str,"/Equipment/Tower%02d/Settings/DCRC%01d/Phonon", whichtower, dcrc);
  return(lock_unlock_key(set_str, lock, RECURSIVE));
}

INT lock_unlock_all_settings (int dcrc, BOOL lock) {

  char set_str[80];
  sprintf (set_str,"/Equipment/Tower%02d/Settings/DCRC%01d/", whichtower, dcrc);
  lock_unlock_key(set_str, lock, RECURSIVE);
  sprintf (set_str,"/Equipment/Tower%02d/Settings/DCRC%01d/LockStatus", whichtower, dcrc);
  return(lock_unlock_key(set_str, UNLOCK, NONRECURSIVE));
}


/// Set the charge biases to zero, lock them, then unlock all LED settings
INT start_led_flash_mode (int dcrc) {

  char set_str[80];
  // First unlock and zero the charge bias settings, then lock them
  sprintf (set_str,"/Equipment/Tower%02d/Settings/DCRC%01d/Charge/Bias (V)", whichtower, dcrc); 
  lock_unlock_key(set_str, UNLOCK, NONRECURSIVE);
  for (int chan=0; chan<2; chan++) {
    odbWriteFloat(set_str,chan,0.);
  } 
  lock_unlock_key(set_str, LOCK, NONRECURSIVE);

  // Now unlock the LED settings
  sprintf (set_str,"/Equipment/Tower%02d/Settings/DCRC%01d/LED", whichtower, dcrc); 
  lock_unlock_key(set_str, UNLOCK, RECURSIVE);


  return(1);

}


/// Make sure LEDs as disabled, lock them, then unlock charge bias settings
INT exit_led_flash_mode (int dcrc) {

  char set_str[80];
  // Disable LEDs and lock them
  for (int chan=1; chan<=2; chan++) {
    sprintf (set_str,"/Equipment/Tower%02d/Settings/DCRC%01d/LED/EnableLED%01d",
	     whichtower, dcrc, chan); 
    odbWriteBool(set_str, 0, FALSE);
    lock_unlock_key(set_str, LOCK, NONRECURSIVE);
  }
  // Now unlock the charge bias settings
  sprintf (set_str,"/Equipment/Tower%02d/Settings/DCRC%01d/Charge/Bias (V)", whichtower, dcrc); 
  lock_unlock_key(set_str, UNLOCK, NONRECURSIVE);

  return(1);

}
