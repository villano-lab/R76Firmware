#include "midas.h"
#include "KOsocket.h"


/* make frontend functions callable from the C framework */
#ifdef __cplusplus
extern "C" {
#endif

/*-- Globals -------------------------------------------------------*/

  extern int QET_HLvalues[24];

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

// Set dummyreadout to true if DCRC not present and you just want to 
// fill banks with fake data
  extern BOOL dummyreadout;

  extern BOOL dcrc_enabled[7];

  extern int defaultcalib[50];

  //array to store calibration values for all 6 DCRCs in tower
  extern int calib[50][7];

  extern int masterslave[7];
  extern int gDcrcPort[7];

// Socket connection to device
extern KOsocket *gDataSocket[7];

extern INT frontend_index;

extern INT whichtower;

  extern std::string gDcrcIPAddress[7];


/*-- Function declarations -----------------------------------------*/

void update_general(int hDB, int key, void *c);
void update_trigger(int hDB, int key, void *c);
void update_led(int hDB, int key, void *c);
void update_test_signal(int hDB, int key, void *c);
void update_phonon(int hDB, int key, void *c);
void update_charge(int hDB, int key, void *c);

void read_calibrations (KOsocket *gDataSocket, int dcrc_index);

void check_dcrc_rev();

INT frontend_init();
INT frontend_exit();
INT begin_of_run(INT run_number, char *error);
INT end_of_run(INT run_number, char *error);
INT pause_run(INT run_number, char *error);
INT resume_run(INT run_number, char *error);
INT frontend_loop();

INT driver_event(char *pevent, INT off);

void check_odb_structure(int dcrc, int whichtower, int which_subtree);
INT synchronize_cards();
void check_towerdummy_dcrcenable();
void init_dcrc_socket_connections(int initflag);


/*-- Equipment list ------------------------------------------------*/

#undef USE_INT

 extern  EQUIPMENT equipment[];

#ifdef __cplusplus
}
#endif
