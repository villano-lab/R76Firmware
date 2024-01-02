#include "midas.h"


/* make frontend functions callable from the C framework */
#ifdef __cplusplus
extern "C" {
#endif

/*-- Globals -------------------------------------------------------*/

/* The frontend name (client name) as seen by other MIDAS clients   */
  extern char *frontend_name;
/* The frontend file name, don't change it */
  extern char *frontend_file_name;

/* frontend_loop is called periodically if this variable is TRUE    */
  extern bool frontend_call_loop;

/* a frontend status page is displayed with this frequency in ms */
  extern int display_period;

  /* maximum event size produced by this frontend */
  /* 6 is number of DCRCs read out by this front=end */
  extern int max_event_size;
  // The maximum number of triggers is determined by the buffer size

  /* maximum event size for fragmented events (EQ_FRAGMENTED) */
  /* This is not really used */
  extern int max_event_size_frag;

  /* buffer size to hold events - must be >= 2*max_event_size */
  extern int event_buffer_size;

/* buffer size to hold events - must be >= 2*max_event_size */
  extern void **info;
  extern HNDLE hDB;

  // length of trigger list array from which the front-end reads 
  // the list of triggers to be processed 
  extern INT triglistlength;

extern INT frontend_index;

extern INT whichtower;



/*-- Function declarations -----------------------------------------*/

void update_permissions(int hDB, int key, void *c);

INT frontend_init();
INT frontend_exit();
INT begin_of_run(INT run_number, char *error);
INT end_of_run(INT run_number, char *error);
INT pause_run(INT run_number, char *error);
INT resume_run(INT run_number, char *error);
INT frontend_loop();

INT driver_event(char *pevent, INT off);

INT lock_unlock_key (const char*name,BOOL lock, BOOL recursive);

INT lock_unlock_all_settings (int dcrc, BOOL lock);
INT lock_unlock_phonon_settings (int dcrc, BOOL lock);

INT start_led_flash_mode (int dcrc);
INT exit_led_flash_mode (int dcrc);


  const BOOL LOCK = TRUE;
  const BOOL UNLOCK = FALSE;
  const BOOL RECURSIVE = TRUE;
  const BOOL NONRECURSIVE = FALSE;


/*-- Equipment list ------------------------------------------------*/

#undef USE_INT

 extern  EQUIPMENT equipment[];

#ifdef __cplusplus
}
#endif
