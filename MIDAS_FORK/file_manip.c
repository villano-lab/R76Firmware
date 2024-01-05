/********************************************************************\
file_manip.c - force the stop-run transition to wait for certain file 
               manipulations to finish
This version: Oct 2, 2015
Creators: Amy Roberts (USD) 
Contact: Amy Roberts, Anthony Villano
\********************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include "midas.h"
#include <stdint.h>
#include <iostream>
#include <sstream>
#include "utils1.h"
#include "constants.h"

#ifdef __cplusplus
extern "C" {
#endif
/*-- Globals -------------------------------------------------------*/
/* The frontend name (client name) as seen by other MIDAS clients   */
char *frontend_name = "file_manip";
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

/* and here are MY globals                                  */
  HNDLE hDB, hKey;
  BOOL write_data, has_copied;
  INT size;

/*-- Function declarations -----------------------------------------*/
INT frontend_init();
INT frontend_exit();
INT begin_of_run(INT run_number, char *error);
INT end_of_run(INT run_number, char *error);
INT pause_run(INT run_number, char *error);
INT resume_run(INT run_number, char *error);
INT frontend_loop();
BOOL wait_until_copied(int transition, BOOL first);
INT read_trigger_event(char *pevent, INT off);


/*-- Equipment list ------------------------------------------------*/

#undef USE_INT

EQUIPMENT equipment[] = {

   {"file_manip",               /* equipment name */
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


#ifdef __cplusplus
}
#endif

// function calls used in this code
// INT db_get_value(HNDLE hDB, HNDLE hKeyRoot, const char *key_name, void *data, 
//                  INT * buf_size, DWORD type, BOOL create)
//
// INT db_set_value(HNDLE hDB, HNDLE hKeyRoot, const char *key_name, const void *data,
//                  INT data_size, INT num_values, DWORD type)
//
// INT db_open_record(HNDLE hDB, HNDLE hKey, void *ptr, INT rec_size,
//                    WORD access_mode, void (*dispatcher) (INT, INT, void *), void *info)                    

/*-- Frontend Init -------------------------------------------------*/
// Upon init, read ODB settings and write them to DCRC
INT frontend_init()
{
  int status;

  size = sizeof(int);
  printf ("Starting file_manip front end\n"); 

  // register for deferred transition
  cm_register_deferred_transition(TR_STOP, wait_until_copied);
   
  /* get handle to online database */
  cm_get_experiment_database(&hDB, &hKey);
  
  /* now open '/Logger/Write data' with automatic updates */
  db_find_key(hDB, 0, "/Logger/Write data", &hKey);
  db_open_record(hDB, hKey, &write_data, size, MODE_READ, NULL, NULL);

  return SUCCESS;  
}


/*-- Frontend Exit -------------------------------------------------*/
INT frontend_exit()
{
   printf("Exiting file_manip.exe!\n");

   return SUCCESS;
}

/*-- Begin of Run --------------------------------------------------*/
// Upon run start, read ODB settings and write them to DCRC
INT begin_of_run(INT run_number, char *error)
{
   // set the ODB key '/Has copied' to False
   has_copied = FALSE;
   db_set_value(hDB, 0, "/Logger/Has copied", &has_copied, size, 1, TID_BOOL); 

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
/* if frontend_call_loop is true, this routine gets called when     */
/* the frontend is idle or once between every event                 */
// frontend_call_loop is set to false
INT frontend_loop()
{
   return SUCCESS;
}

/*------------------------------------------------------------------*/
// callback for tr_stop
BOOL wait_until_copied(int transition, BOOL first)
{
   // if we're not writing data to disk, don't wait for 
   // any file copying to finish!
   if (!write_data) {
      return TRUE;
   }

   int status;
   status = db_get_value(hDB, 0, "/Logger/Has copied", &has_copied, &size, TID_BOOL, TRUE);
   //printf("This is the defered tranisition function\n");
   //printf("value of has_copied is %d\n", has_copied);

   if (has_copied) {
      return TRUE;
   } else {
      return FALSE;
   }
}

INT read_trigger_event(char *pevent, INT off)
{
   return SUCCESS;
}


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
