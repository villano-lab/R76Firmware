/********************************************************************\
dcrc_driver.c - automatic configuration of DCRCs
This version: January 13th, 2014
This frontend is meant to be constantly running on one of every tower's ports.
Its primary function is to automatically and immediately update settings that
are changed in the ODB by writing to the corresponding DCRC registers.  It uses
hotlinks (db_open_record) to accomplish this. We have 6 hotlinks per DCRC, one
for each major setting subtree (general, trigger, led, test signal, phonon,
charge).
When any variable within one of these subtrees is changed, a corresponding
function is called (named update_*changed variable subtree*). The changed variable is
determined, and its register is computed, and that value is written to the DCRC.
This front end serves a few other purposes aswell: checking that the odb structure
is correct and creating variables that are missing (upon initialization),
synchronizing the clocks of the dcrcs. 
Creators: Scott Oser (UBC) & Thomas Lindner (TRIUMF) & Bill Page (UBC)
Contact: Scott Oser
\********************************************************************/

#include "dcrc_driver.h"
#include <unistd.h>
#include <vector>
#include <stdio.h>
#include <time.h>
#include <math.h>
#include <sys/time.h>
#include <algorithm>
#include <stdlib.h>
#include "midas.h"
#include <stdint.h>
#include "KOsocket.h"
#include <iostream>
#include <sstream>
#include "utils1.h"
#include <regex.h>
//definitions of  the value of the registers
//and globals like MAX_DCRCs and MAX_PHONON_CHANNEL
#include "constants.h"

#include "convert_functions.h"

#include "struct_general.h"
#include "struct_trigger.h"
#include "struct_led.h"
#include "struct_test_signal.h"
#include "struct_phonon.h"
#include "struct_charge.h"

#include "update_general_functions.h"
#include "update_trigger_functions.h"
#include "update_led_functions.h"
#include "update_test_signal_functions.h"
#include "update_phonon_functions.h"
#include "update_charge_functions.h"


 
#ifdef __cplusplus
extern "C" {
#endif
/*-- Globals -------------------------------------------------------*/


/* The frontend name (client name) as seen by other MIDAS clients   */
char *frontend_name = "dcrc_driver";
/* The frontend file name, don't change it */
char *frontend_file_name = __FILE__;

/* frontend_loop is called periodically if this variable is TRUE    */
bool frontend_call_loop = false;

/* a frontend status page is displayed with this frequency in ms */
int display_period = 000;

/* maximum event size produced by this frontend */
/* 6 is number of DCRCs read out by this front=end */
  int max_event_size = 25600000;
 
/* maximum event size for fragmented events (EQ_FRAGMENTED) */
/* This is not really used */
  int max_event_size_frag = 100000;

/* buffer size to hold events - must be >= 2*max_event_size */
  int event_buffer_size = 52 * 1000000;

/* buffer size to hold events - must be >= 2*max_event_size */
  void **info;
  HNDLE hDB;

// length of trigger list array from which the front-end reads 
// the list of triggers to be processed 
  INT triglistlength = 6508;

// Set dummyreadout to true if DCRC not present and you just want to 
// fill banks with fake data
  BOOL dummyreadout = FALSE;


// Default values for DCRC calibration parameters 
  int defaultcalib[50] = {0x8000, 0x01ab, 0x8000, 0x01ab,0x8000, 0x1313, 0x8000, 0x17d8, 0x8000, 0x0338, 0x8000, 0x2faf, 0x8000, 0x1313, 0x8000, 0x17d8, 0x8000, 0x0338, 0x8000, 0x2faf,0x8000, 0x1313, 0x8000, 0x17d8, 0x8000, 0x0338, 0x8000, 0x2faf,0x8000, 0x1313, 0x8000, 0x17d8, 0x8000, 0x0338, 0x8000, 0x2faf,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0};

  //the masterslave[] array will be populated once the general settings are read in from the ODB.  master is 1, slave is 0.  this array will be used when the clocks of the dcrcs are synchronized 
int masterslave[MAX_DCRCs+1] = {0,0,0,0,0,0,0};
 
 //the gDcrcPort will be populated by functions in ODB in the init_dcrc_socket_connections() function.  this function will then use these values to establish a KOSocket connection and populate the gDataSocket[] array
int gDcrcPort[MAX_DCRCs+1] = {0,0,0,0,0,0,0};

  // Revision of DCRC
float dcrc_rev[MAX_DCRCs+1] = {3.1,3.1,3.1,3.1,3.1,3.1,3.1};


// Array to store calibration values for all 6 DCRCs in tower. 
  int calib[50][MAX_DCRCs+1];


// Socket connection to device
KOsocket *gDataSocket[MAX_DCRCs+1];

std::string gDcrcIPAddress[MAX_DCRCs+1];

extern INT frontend_index;

INT whichtower;

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

   {"dcrc_driver%02d",               /* equipment name */
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

//populated in check_towerdummy_dcrcenable() function.  a 1 indicates that the dcrc is enabled.
BOOL dcrc_enabled[MAX_DCRCs+1];

//instances of the structs that we will use to store ODB values within this front end.
GENERAL hotlink_general_struct;
GENERAL current_general[MAX_DCRCs+1];
GENERAL old_general[MAX_DCRCs+1];

TRIGGER hotlink_trigger_struct;
TRIGGER current_trigger[MAX_DCRCs+1];
TRIGGER old_trigger[MAX_DCRCs+1];

LED hotlink_led_struct;
LED current_led[MAX_DCRCs+1];
LED old_led[MAX_DCRCs+1];

TESTSIGNAL hotlink_test_signal_struct;
TESTSIGNAL current_test_signal[MAX_DCRCs+1];
TESTSIGNAL old_test_signal[MAX_DCRCs+1];

PHONON hotlink_phonon_struct;
PHONON current_phonon[MAX_DCRCs+1];
PHONON old_phonon[MAX_DCRCs+1];

CHARGE hotlink_charge_struct;
CHARGE current_charge[MAX_DCRCs+1];
CHARGE old_charge[MAX_DCRCs+1];

//a flag variable used in the frontend_init() function to update every setting upon initilization of this front end
int update_everything = 0;

void read_calibrations (KOsocket *gDataSocket, int dcrc_index){

  // Load with default values                               
  for (int i=0;i<50;i++) {
    calib[i][dcrc_index]=defaultcalib[i];
  }


  // The default calibs are for DCRCRev3.1 = RevC.1
  // We must alter a few settings for Rev3.0 = RevC, since it used 14-bit
  // charge bias DACs
  if (dcrc_rev[dcrc_index] == 3.) {
    calib[0][dcrc_index] = 0x2000; // 14-bit DAC for RevC
    calib[2][dcrc_index] = 0x2000; // 14-bit DAC for RevC
    calib[1][dcrc_index] = 0x06ad; // slope = 28e6 uV per 2^14 DAC counts
    calib[3][dcrc_index] = 0x06ad; // slope = 28e6 uV per 2^14 DAC counts
    printf ("Overwriting charge bias calibrations for DCRC %d on account of it being a RevC board\n", dcrc_index);
  }


  char dcrckp[150];
  // Define the ODB key path for this particular DCRC
  sprintf (dcrckp,"/Equipment/Tower%02d/Settings/DCRC%1d/General/UseCalibrationRegisters", whichtower, dcrc_index);
  bool use_calib_flags = odbReadBool(dcrckp,0,FALSE);

  // Check if calibrations enabled for this DCRC and if DCRC is active 
  // If so, request new calibrations from DCRC using "CALD" command
  // and parse the output      
  if (!dummyreadout && dcrc_enabled[dcrc_index] && use_calib_flags) {
    
    //[ANV] try to figure out the serial number of the DCRC
    //use read to so that if I request too many it will just wait for timeout
    //and not throw an excpetion like readFully
    int dcrc_serial=-1;
    char setcommand[5],setbuffer[1024];
    sprintf(setcommand,"set");
    gDataSocket->write(setcommand,4);
    gDataSocket->read(setbuffer,1024);
    printf("%s\n",setbuffer);

    //do some regex matching to parse out serial number 
    regex_t regex;
    int reti = regcomp(&regex,"8\\)  Board Serial  :([0-9]+) \\(d\\)",REG_EXTENDED);
    if(reti){
  cm_msg(MINFO, frontend_name, "INFO: WARNING! Tower%i,DCRC%i dcrc serial number regex not compiled!", whichtower,dcrc_index);
    }

    regmatch_t matchptr[2];
    reti = regexec(&regex,setbuffer,2,matchptr,0);

    if(!reti){
      //got a match
      char *subbuf;
      int size = (matchptr[1].rm_eo-matchptr[1].rm_so);
      subbuf = (char*) malloc(size*sizeof(char));
      memcpy( subbuf, &setbuffer[matchptr[1].rm_so], size );
      subbuf[size] = '\0';

      dcrc_serial = atoi(subbuf); 

  cm_msg(MINFO, frontend_name, "INFO: Tower%i,DCRC%i dcrc serial number: %i ", whichtower,dcrc_index,dcrc_serial);

    }
    else if(reti == REG_NOMATCH){
  cm_msg(MINFO, frontend_name, "INFO: WARNING! Tower%i,DCRC%i dcrc serial numbercould not be parsed from SET command", whichtower,dcrc_index);
    }
    else {
      char msgbuf[100];
      regerror(reti,&regex,msgbuf,sizeof(msgbuf));
  cm_msg(MINFO, frontend_name, "INFO: WARNING! Tower%i,DCRC%i dcrc serial numberreceived an unknown error from SET command: %s", whichtower,dcrc_index,msgbuf);
    } 

    // now check calibration registers
    // "cald" returns 252 bytes: 50x50 + 2 end-of-line/CR characters 
    int toberead = 252;
    char command[6],buffer[300];

    sprintf(command,"cald");

    //[ANV] IF RevC.1 -- has firmware to understand calibration
    //[ANV] ELSE IF RevC -- DOES NOT has firmware to understand calibration,read from file towerXdcrcY.cal if file exists
    if(dcrc_rev[dcrc_index]>3.0){
      gDataSocket->write(command,5);
      gDataSocket->readFully(buffer,toberead);
  cm_msg(MINFO, frontend_name, "INFO: Tower%i,DCRC%i calibration register read", whichtower,dcrc_index);
  cm_msg(MINFO, frontend_name, "INFO: buffer = %s",buffer);
    }
    else{
      //get path for MIDAS DAQ
      char *path = getenv("MIDAS_ONLINE");

      //try to get from file
      char filename[256]; 
      sprintf(filename,"%s/src/RevC/calibrations/dcrc%04d.cal",path,dcrc_serial);
      //sprintf(filename,"%s/src/RevC/calibrations/tower%02ddcrc%02d.cal",path,whichtower,dcrc_index);

      //check file
      FILE *f = fopen(filename,"r");

      if(f==NULL||dcrc_serial==-1){
      //if(f==NULL){
        //warn and use default
  cm_msg(MINFO, frontend_name, "INFO: WARNING! Tower%i,DCRC%i calibration file could not be read", whichtower,dcrc_index);
        //put something that's NOT ACDC at the end, and the calibration won't be used --default will be used instead
	buffer[toberead-7]=0;
	
      }
      else{
        //read
        fgets(buffer,toberead,(FILE*)f);
        printf("%s\n",buffer);
      }
      if(f)
        fclose(f);

    }



    // Check whether the last address returned by CALD contains "ACDC",
    // as a heavy-metal-themed marker to indicate that the board was actually 
    // calibrated.  Else the program will ignore the calibrations.
    bool board_calib_check = FALSE;
    if ((buffer[toberead-7] == 'A') && (buffer[toberead-6] == 'C')
	&& (buffer[toberead-5] == 'D') 
	&& (buffer[toberead-4] == 'C')) board_calib_check = TRUE;

    if (board_calib_check == FALSE) {
  cm_msg(MINFO, frontend_name, "INFO: DCRC seems not to be calibrated.  Ignoring calibration registers in favor of default calibrations for Tower%i,DCRC%i", whichtower,dcrc_index);
    } else { // Board is marked as calibrated, so check each register

  cm_msg(MINFO, frontend_name, "INFO: DCRC seems to be calibrated.  Using stored calibrations for Tower%i,DCRC%i", whichtower,dcrc_index);
      int calibaddrvalue;
      // Only the first 49 calibration registers contain calibrations
      // The 50th just contains a check value to determine if the
      // board is calibrated: set to ACDC to indicate it's calibrated
      for (int i=0; i<49; i++) {
	std::stringstream ss;
	int index=i*5;
	ss << std::hex << buffer[index] << buffer[index+1]
	   << buffer[index+2] << buffer[index+3];
	ss >> calibaddrvalue;
	// Ignore calibrations that are >20% from nominal
	if (fabs(calibaddrvalue - calib[i][dcrc_index]) <= 0.2*calib[i][dcrc_index]) {
	calib[i][dcrc_index] = calibaddrvalue;
      } else {
	printf ("Ignoring very far from nominal calibration! %d\n",i);
	cm_msg(MINFO, frontend_name, "INFO: calibration register %d is more than 20%% from nominal on DCRC%d, Tower%d---ignoring this value in favour of default calibration.", i, dcrc_index, whichtower);
      }
	printf ("DCRC%d calib register %2d: 0x%c%c%c%c = %d\n", dcrc_index,i,
		buffer[index],buffer[index+1],buffer[index+2],
		buffer[index+3],calib[i][dcrc_index]);
      }
    } // end of else statement to do if board is calibrated
  } // End of if statement for things to do if DCRC is active
}


//the hotlink_pointer holds values that are equal to the index element.
//there are NUM_UPDATE_MODES times the number of elements as there are dcrcs
//because we have this many update modes, which we choose by passing our
//function a larger value.  for example, to use update mode 1 on dcrc 2, for
//example, we would pass dcrc_hotlink_pointer[2*1], but for update mode 2
//on dcrc 2 we would pass dcrc_hotlink_pointer[2+(MAX_DCRCs+1)].  the hotlinked
//function then would unpack the data as follows:
//'update_mode' = 'value'/(MAX_DCRCs+1)
//'dcrc' = 'value'%(MAX_DCRCs+1)
int dcrc_hotlink_pointer[(MAX_DCRCs+1)*NUM_UPDATE_MODES] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13};


//**
//The hotlinked functions, one for each setting subtree.  they call separate functions living in
//separate files (update_***_functions.c). 
//**
void update_general(int hDB, int key, void *c){
  int hotlink_pointer_value= *((int *) c);
  int dcrc = hotlink_pointer_value % (MAX_DCRCs+1);
  int update_mode = hotlink_pointer_value / (MAX_DCRCs+1);

  char odbkp[150];
  char dcrckp[150];
  sprintf (dcrckp,"/Equipment/Tower%02d/Settings/DCRC%1d", whichtower,dcrc);

  sprintf (odbkp,"%s/General/UseCalibrationRegisters", dcrckp);
  current_general[dcrc].usecalibrationregisters = odbReadBool(odbkp,0,FALSE); 
  sprintf(odbkp,"%s/General/ChargeWaveFormLength",dcrckp);
  current_general[dcrc].chargewaveformlength = odbReadInt(odbkp,0,4096);  
  sprintf(odbkp,"%s/General/PhononWaveFormLength",dcrckp);
  current_general[dcrc].phononwaveformlength = odbReadInt(odbkp,0,8192);
  sprintf(odbkp,"%s/General/MasterSlaveFree",dcrckp);
  current_general[dcrc].masterslavefree = odbReadInt(odbkp,0,0);
  sprintf(odbkp,"%s/General/LVDSBusDir",dcrckp);
  current_general[dcrc].lvdsbusdir = odbReadBool(odbkp,0,FALSE);
  sprintf(odbkp,"%s/General/ByteSwapEnable",dcrckp);
  current_general[dcrc].byteswapenable = odbReadBool(odbkp,0,FALSE);
  sprintf(odbkp,"%s/General/ChargeADCReset",dcrckp);
  current_general[dcrc].chargeadcreset = odbReadBool(odbkp,0,FALSE);
  sprintf(odbkp,"%s/General/VXOFreqLockRef",dcrckp);
  current_general[dcrc].vxofreqlockref = odbReadInt(odbkp,0,0);
  sprintf(odbkp,"%s/General/EnableADCWritesToSDRam",dcrckp);
  current_general[dcrc].enableadcwritestosdram = odbReadBool(odbkp,0,TRUE);
  sprintf(odbkp,"%s/General/EnableADCAvgBy64",dcrckp);
  current_general[dcrc].enableadcavgby64 = odbReadBool(odbkp,0,FALSE);
  sprintf(odbkp,"%s/General/EnableWritingDDSPhaseData",dcrckp);
  current_general[dcrc].enablewritingddsphasedata = odbReadBool(odbkp,0,FALSE);
  sprintf(odbkp,"%s/General/TriggerSource",dcrckp);
  current_general[dcrc].triggersource = odbReadBool(odbkp,0,FALSE);
  sprintf(odbkp,"%s/General/FETHeatEnable",dcrckp);
  current_general[dcrc].fetheatenable = odbReadBool(odbkp,0,FALSE);
  sprintf(odbkp,"%s/General/QETBiasRangeSelect",dcrckp);
  current_general[dcrc].qetbiasrangeselect = odbReadBool(odbkp,0,FALSE);
  sprintf(odbkp,"%s/General/ChargePrepulseSamples",dcrckp);
  current_general[dcrc].chargeprepulsesamples = odbReadInt(odbkp,0,0);
  sprintf(odbkp,"%s/General/PhononPrepulseSamples",dcrckp);
  current_general[dcrc].phononprepulsesamples = odbReadInt(odbkp,0,0);

  compare_overwrite_general(whichtower, dcrc, update_mode, old_general[dcrc], current_general[dcrc], current_led[dcrc], current_test_signal[dcrc]);
}
 
void update_trigger(int hDB, int key, void *c){
  int hotlink_pointer_value= *((int *) c);
  int dcrc = hotlink_pointer_value % (MAX_DCRCs+1);
  int update_mode = hotlink_pointer_value / (MAX_DCRCs+1);

  char odbkp[150];
  char dcrckp[150];
  sprintf (dcrckp,"/Equipment/Tower%02d/Settings/DCRC%1d", whichtower,dcrc);

  sprintf(odbkp,"%s/Trigger/PhononTriggerEnable",dcrckp);
  for(int phonon_channel = 0; phonon_channel < MAX_PHONON_CHANNEL; phonon_channel++){
    current_trigger[dcrc].phonontriggerenable[phonon_channel] = odbReadBool(odbkp,phonon_channel,FALSE);
  }
  sprintf(odbkp,"%s/Trigger/ChargeTriggerEnable",dcrckp);
  current_trigger[dcrc].chargetriggerenable[0] = odbReadBool(odbkp,0,TRUE);
  current_trigger[dcrc].chargetriggerenable[1] = odbReadBool(odbkp,1,FALSE);
  sprintf(odbkp,"%s/Trigger/PhononTriggerBaselineLength",dcrckp);
  current_trigger[dcrc].phonontriggerbaselinelength = odbReadInt(odbkp,0,16);
  sprintf(odbkp,"%s/Trigger/ChargeTriggerBaselineLength",dcrckp);
  current_trigger[dcrc].chargetriggerbaselinelength = odbReadInt(odbkp,0,16);
  sprintf(odbkp,"%s/Trigger/PhononTriggerSampleLength",dcrckp);
  current_trigger[dcrc].phonontriggersamplelength = odbReadInt(odbkp,0,2);
  sprintf(odbkp,"%s/Trigger/ChargeTriggerSampleLength",dcrckp);
  current_trigger[dcrc].chargetriggersamplelength = odbReadInt(odbkp,0,2);
  sprintf(odbkp,"%s/Trigger/PhononTriggerThreshold",dcrckp); 
  for(int phonon_channel = 0; phonon_channel < MAX_PHONON_CHANNEL; phonon_channel++){ 
    current_trigger[dcrc].phonontriggerthreshold[phonon_channel] = odbReadInt(odbkp,phonon_channel,16);
  }
  sprintf(odbkp,"%s/Trigger/ChargeTriggerThreshold",dcrckp);
  for(int charge_channel = 0; charge_channel < MAX_CHARGE_CHANNEL; charge_channel++){ 
    current_trigger[dcrc].chargetriggerthreshold[charge_channel] = odbReadInt(odbkp,charge_channel,32);
  }

  compare_overwrite_trigger(whichtower, dcrc, update_mode, old_trigger[dcrc], current_trigger[dcrc]);
}

void update_led(int hDB, int key, void *c){
  int hotlink_pointer_value= *((int *) c);
  int dcrc = hotlink_pointer_value % (MAX_DCRCs+1);
  int update_mode = hotlink_pointer_value / (MAX_DCRCs+1);

  char odbkp[150];
  char dcrckp[150];
  sprintf (dcrckp,"/Equipment/Tower%02d/Settings/DCRC%1d", whichtower,dcrc);

  sprintf(odbkp,"%s/LED/LEDPulseWidth (us)",dcrckp);
  current_led[dcrc].ledpulsewidth__us_ = odbReadInt(odbkp,0,128);
  sprintf(odbkp,"%s/LED/LEDRepRate (us)",dcrckp);
  current_led[dcrc].ledreprate__us_ = odbReadInt(odbkp,0,65535);
  sprintf(odbkp,"%s/LED/LEDADCControl",dcrckp);
  current_led[dcrc].ledadccontrol = odbReadInt(odbkp,0,8192);
  sprintf(odbkp,"%s/LED/LED1Current (mA)",dcrckp);
  current_led[dcrc].led1current__ma_ = odbReadFloat(odbkp,0,0);
  sprintf(odbkp,"%s/LED/EnableLED1",dcrckp);
  current_led[dcrc].enableled1 = odbReadBool(odbkp,0,FALSE);
  sprintf(odbkp,"%s/LED/EnableLED2",dcrckp);
  current_led[dcrc].enableled2 = odbReadBool(odbkp,0,FALSE);
  sprintf(odbkp,"%s/LED/ConnectLEDVoltagesToPhononADCs",dcrckp);
  current_led[dcrc].connectledvoltagestophononadcs = odbReadBool(odbkp,0,FALSE);
  sprintf(odbkp,"%s/LED/SingleStepFreeRunToggle",dcrckp);
  current_led[dcrc].singlestepfreeruntoggle = odbReadBool(odbkp,0,FALSE);
  sprintf(odbkp,"%s/LED/EnableZapCharging",dcrckp);
  current_led[dcrc].enablezapcharging = odbReadBool(odbkp,0,FALSE);
  sprintf(odbkp,"%s/LED/Enable15VPower",dcrckp);
  current_led[dcrc].enable15vpower = odbReadBool(odbkp,0,TRUE);
  sprintf(odbkp,"%s/LED/LED2Current (mA)",dcrckp);
  current_led[dcrc].led2current__ma_ = odbReadFloat(odbkp,0,0);

  compare_overwrite_led(whichtower, dcrc, update_mode, old_led[dcrc], current_led[dcrc],current_general[dcrc], old_general[dcrc]); 
}

void update_test_signal(int hDB, int key, void *c){
  int hotlink_pointer_value= *((int *) c);
  int dcrc = hotlink_pointer_value % (MAX_DCRCs+1);
  int update_mode = hotlink_pointer_value / (MAX_DCRCs+1);

  char odbkp[150];
  char dcrckp[150];
  sprintf (dcrckp,"/Equipment/Tower%02d/Settings/DCRC%1d", whichtower,dcrc);

  for(int phonon_channel=0; phonon_channel<MAX_PHONON_CHANNEL; phonon_channel++) {
    sprintf(odbkp,"%s/TestSignal/ConnectTestToQET",dcrckp);
    current_test_signal[dcrc].connecttesttoqet[phonon_channel] = odbReadBool(odbkp,phonon_channel,FALSE);
  }
  sprintf(odbkp,"%s/TestSignal/DDSChipControlPin",dcrckp);
  current_test_signal[dcrc].ddschipcontrolpin = odbReadBool(odbkp,0,FALSE);
  sprintf(odbkp,"%s/TestSignal/DDSControlReg",dcrckp);
  current_test_signal[dcrc].ddscontrolreg = odbReadInt(odbkp,0,3543);
  sprintf(odbkp,"%s/TestSignal/DDSNumIncrements",dcrckp);
  current_test_signal[dcrc].ddsnumincrements = odbReadInt(odbkp,0,2);
  sprintf(odbkp,"%s/TestSignal/DDSFreqIncrement",dcrckp);
  current_test_signal[dcrc].ddsfreqincrement = odbReadUint32(odbkp,0,0);
  sprintf(odbkp,"%s/TestSignal/DDSIncrementInterval",dcrckp);
  current_test_signal[dcrc].ddsincrementinterval = odbReadInt(odbkp,0,2);
  sprintf(odbkp,"%s/TestSignal/DDSStartFreq",dcrckp);
  current_test_signal[dcrc].ddsstartfreq = odbReadUint32(odbkp,0,2228224);
  sprintf(odbkp,"%s/TestSignal/DDSDACScaling",dcrckp);
  current_test_signal[dcrc].ddsdacscaling = odbReadInt(odbkp,0,1000);

  compare_overwrite_test_signal(whichtower, dcrc, update_mode, old_test_signal[dcrc], current_test_signal[dcrc], current_general[dcrc], old_general[dcrc]);
}

void update_phonon(int hDB, int key, void *c){
  int hotlink_pointer_value= *((int *) c);
  int dcrc = hotlink_pointer_value % (MAX_DCRCs+1);
  int update_mode = hotlink_pointer_value / (MAX_DCRCs+1);

  char odbkp[150];
  char dcrckp[150];
  sprintf (dcrckp,"/Equipment/Tower%02d/Settings/DCRC%1d", whichtower,dcrc);
  
  for(int phonon_channel=0; phonon_channel<MAX_PHONON_CHANNEL; phonon_channel++) {
    sprintf(odbkp,"%s/Phonon/VGAGain (multiplicative factor)",dcrckp);
    current_phonon[dcrc].vgagain__multiplicative_factor_[phonon_channel] = odbReadFloat(odbkp,phonon_channel,4.);
    sprintf(odbkp,"%s/Phonon/ADCOffset (V)",dcrckp);
    current_phonon[dcrc].adcoffset__v_[phonon_channel] = odbReadFloat(odbkp,phonon_channel,0.);
    sprintf(odbkp,"%s/Phonon/LockpointAdjust (mV)",dcrckp);
    current_phonon[dcrc].lockpointadjust__mv_[phonon_channel] = odbReadFloat(odbkp,phonon_channel,0.);
    sprintf(odbkp,"%s/Phonon/SQUIDBias (uA)",dcrckp);
    current_phonon[dcrc].squidbias__ua_[phonon_channel] = odbReadFloat(odbkp,phonon_channel,0.);
    sprintf(odbkp,"%s/Phonon/QETBias (uA)",dcrckp);
    current_phonon[dcrc].qetbias__ua_[phonon_channel] = odbReadFloat(odbkp,phonon_channel,0.);
    sprintf(odbkp,"%s/Phonon/polarity",dcrckp);
    current_phonon[dcrc].polarity[phonon_channel] = odbReadInt(odbkp,phonon_channel,0);
    sprintf(odbkp,"%s/Phonon/PGAGain (1,2,4, or 8)",dcrckp);
    current_phonon[dcrc].pgagain__1_2_4__or_8_[phonon_channel] = odbReadInt(odbkp,phonon_channel,8);
    sprintf(odbkp,"%s/Phonon/ADCSignalSource",dcrckp);
    current_phonon[dcrc].adcsignalsource[phonon_channel] = odbReadBool(odbkp,phonon_channel,TRUE);
    sprintf(odbkp,"%s/Phonon/TestSignalConnect",dcrckp);
    current_phonon[dcrc].testsignalconnect[phonon_channel] = odbReadBool(odbkp,phonon_channel,FALSE);
    sprintf(odbkp,"%s/Phonon/SQUIDSource",dcrckp);
    current_phonon[dcrc].squidsource[phonon_channel] = odbReadBool(odbkp,phonon_channel,FALSE);

  }
  sprintf(odbkp,"%s/Phonon/DACControlPhononAB",dcrckp);
  current_phonon[dcrc].daccontrolphononab = odbReadInt(odbkp,0,0);
  sprintf(odbkp,"%s/Phonon/DACControlPhononCD",dcrckp);
  current_phonon[dcrc].daccontrolphononcd = odbReadInt(odbkp,0,0);

  compare_overwrite_phonon(whichtower, dcrc, update_mode, old_phonon[dcrc], current_phonon[dcrc]);
  


}

void update_charge(int hDB, int key, void *c){
  int hotlink_pointer_value= *((int *) c);
  int dcrc = hotlink_pointer_value % (MAX_DCRCs+1);
  int update_mode = hotlink_pointer_value / (MAX_DCRCs+1);
  char set_str[80];
  sprintf(set_str,"/Equipment/Tower%02d/Settings/DCRC%01d/Charge/Bias (V)",whichtower, dcrc);
  current_charge[dcrc].bias__v_[0] = odbReadFloat(set_str, 0, 0.);
  current_charge[dcrc].bias__v_[1] = odbReadFloat(set_str, 1, 0.);
  sprintf(set_str,"/Equipment/Tower%02d/Settings/DCRC%01d/Charge/AmpOffset (V)",whichtower, dcrc);
  current_charge[dcrc].ampoffset__v_[0] = odbReadFloat(set_str, 0, 0.);
  current_charge[dcrc].ampoffset__v_[1] = odbReadFloat(set_str, 1, 0.);
  compare_overwrite_charge(whichtower, dcrc, update_mode, old_charge[dcrc], current_charge[dcrc], calib);
}


/*-- Frontend Init -------------------------------------------------*/
// Upon init, read ODB settings and write them to DCRC
INT frontend_init()
{
  printf ("Starting front end\n"); 

  // Determine which tower we will talk to. If none specified, default to 1
  whichtower = frontend_index;
  if (whichtower < 0) whichtower = 1;

  //this function runs to odbRead* function for every ODB variable that should exist for a given DCRC.
  //we don't use any of the variables readout through these functions, but we use the functionality
  //of the odbRead* functions, which will create a variable in the ODB if it doesn't already exist
  //and also creates the variable with a some default value.
 for(int dcrc = 1; dcrc <= 6; dcrc++){
   //we pass in the third argument a 1 or a 2.  1 means check the
   //odb structure of the actual odb (\Equipment\Tower01\Settings)
   //while two means check the structure of the 'mirror' odb which
   //will only be written to be the dcrc_driver and will store
   //only the settings that we know have been written to the dcrc
   check_odb_structure(dcrc, whichtower, 1);
   check_odb_structure(dcrc, whichtower, 2);
 }
  


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

  //Check the ODB to see if 1) the tower we are configuring is set 
  //to dummy readout, and populate the dummyreadout variable 2)
  // loop through the dcrcs and check the dcrc enable variable in
  // the ODB and populate the dcrc_enabled[] variable
  check_towerdummy_dcrcenable();

  //loop over the dcrcs and check the ODB to find the I.P. address
  // and port address of the dcrc.  make a KOSocket connection to
  // each dcrc and populate the array gDataSocket[] in order that
  // we can write to the dcrc hardware
  init_dcrc_socket_connections(1);

  // Check what DCRC revision is used
  check_dcrc_rev();

// Read in calibration register values from DCRC.  If DCRC is not
// enabled then the read_calibration code will not attempt to talk
// to it, but will use the default calibration values.  
  for(int dcrc = 1; dcrc <= MAX_DCRCs; dcrc++){
    read_calibrations(gDataSocket[dcrc], dcrc);
  }

  //***
  //Declare hot links.  By calling the update functions with
  // update_everything = 1 we tell the hotlinked functions
  // to write every setting to the dcrc and also
  // update all the old structs with the current structs values
  //****
  char general_str[80];
   for(int dcrc = 1; dcrc <= 6; dcrc++){
    sprintf(general_str, "/Equipment/Tower%02d/Settings/DCRC%01d/General", whichtower, dcrc);
     HNDLE general_key;
     db_find_key(hDB, 0, general_str, &general_key);
     int general_size = sizeof(hotlink_general_struct);
     db_get_record(hDB, general_key, &hotlink_general_struct, &general_size, 0);
     update_everything = 1;
     update_general(hDB, general_key, &dcrc_hotlink_pointer[dcrc+(MAX_DCRCs+1)*update_everything]);
     update_everything = 0;
     db_open_record(hDB, general_key, &hotlink_general_struct, sizeof(hotlink_general_struct), MODE_READ, update_general, &dcrc_hotlink_pointer[dcrc+(MAX_DCRCs+1)*update_everything]);
   }

   char trigger_str[80];
   for(int dcrc = 1; dcrc <= 6; dcrc++){
    sprintf(trigger_str, "/Equipment/Tower%02d/Settings/DCRC%01d/Trigger", whichtower, dcrc);
     HNDLE trigger_key;
     db_find_key(hDB, 0, trigger_str, &trigger_key);
     int trigger_size = sizeof(hotlink_trigger_struct);
     db_get_record(hDB, trigger_key, &hotlink_trigger_struct, &trigger_size, 0);
     update_everything = 1;
     update_trigger(hDB, trigger_key, &dcrc_hotlink_pointer[dcrc+(MAX_DCRCs+1)*update_everything]);
     update_everything = 0;
     db_open_record(hDB, trigger_key, &hotlink_trigger_struct, sizeof(current_trigger[dcrc]), MODE_READ, update_trigger, &dcrc_hotlink_pointer[dcrc+(MAX_DCRCs+1)*update_everything]);
   }

   char led_str[80];
   for(int dcrc = 1; dcrc <= MAX_DCRCs; dcrc++){
    sprintf(led_str, "/Equipment/Tower%02d/Settings/DCRC%01d/LED", whichtower, dcrc);
     HNDLE led_key;
     db_find_key(hDB, 0, led_str, &led_key);
     int led_size = sizeof(hotlink_led_struct);
     db_get_record(hDB, led_key, &hotlink_led_struct, &led_size, 0);
     update_everything = 1;
     update_led(hDB, led_key, &dcrc_hotlink_pointer[dcrc+(MAX_DCRCs+1)*update_everything]);
     update_everything = 0;
     db_open_record(hDB, led_key, &hotlink_led_struct, sizeof(hotlink_led_struct), MODE_READ, update_led, &dcrc_hotlink_pointer[dcrc+(MAX_DCRCs+1)*update_everything]);
   }

   char test_signal_str[80];
   for(int dcrc = 1; dcrc <= 6; dcrc++){
    sprintf(test_signal_str, "/Equipment/Tower%02d/Settings/DCRC%01d/TestSignal", whichtower, dcrc);
     HNDLE test_signal_key;
     db_find_key(hDB, 0, test_signal_str, &test_signal_key);
     int test_signal_size = sizeof(hotlink_test_signal_struct);
     db_get_record(hDB, test_signal_key, &hotlink_test_signal_struct, &test_signal_size, 0);
     update_everything = 1;
     update_test_signal(hDB, test_signal_key, &dcrc_hotlink_pointer[dcrc+(MAX_DCRCs+1)*update_everything]);
     update_everything = 0;
     db_open_record(hDB, test_signal_key, &hotlink_test_signal_struct, sizeof(hotlink_test_signal_struct), MODE_READ, update_test_signal, &dcrc_hotlink_pointer[dcrc+(MAX_DCRCs+1)*update_everything]);
   }

   char phonon_str[80];
   for(int dcrc = 1; dcrc <= 6; dcrc++){
    sprintf(phonon_str, "/Equipment/Tower%02d/Settings/DCRC%01d/Phonon", whichtower, dcrc);
     HNDLE phonon_key;
     db_find_key(hDB, 0, phonon_str, &phonon_key);
     int phonon_size = sizeof(hotlink_phonon_struct);
     db_get_record(hDB, phonon_key, &hotlink_phonon_struct, &phonon_size, 0);
     update_everything = 1;
     update_phonon(hDB, phonon_key, &dcrc_hotlink_pointer[dcrc+(MAX_DCRCs+1)*update_everything]);
     update_everything = 0;
     db_open_record(hDB, phonon_key, &hotlink_phonon_struct, sizeof(hotlink_phonon_struct), MODE_READ, update_phonon, &dcrc_hotlink_pointer[dcrc+(MAX_DCRCs+1)*update_everything]);
   }

   char charge_str[80];
   for(int dcrc = 1; dcrc <= 6; dcrc++){
    sprintf(charge_str, "/Equipment/Tower%02d/Settings/DCRC%01d/Charge", whichtower, dcrc);
     HNDLE charge_key;
     db_find_key(hDB, 0, charge_str, &charge_key);
     int charge_size = sizeof(hotlink_charge_struct);
     db_get_record(hDB, charge_key, &hotlink_charge_struct, &charge_size, 0);
     update_everything = 1;
     update_charge(hDB, charge_key, &dcrc_hotlink_pointer[dcrc+(MAX_DCRCs+1)*update_everything]);
     update_everything = 0;
     db_open_record(hDB, charge_key, &hotlink_charge_struct, sizeof(hotlink_charge_struct), MODE_READ, update_charge, &dcrc_hotlink_pointer[dcrc+(MAX_DCRCs+1)*update_everything]);
   }
  
   //based on the masterslave[] array, determine which dcrc to use for the
   // time synchronization of all the cards, which will determine the timestamp
   // used when the dcrc fills the trigger bank with triggers in other frontends
  synchronize_cards();
  
  //wap: need to "activate" the test signal for revC.0
  //this means while bit 14 is set to 1, bit 13 needs
  //to be set from 0 to 1.
  char command[40];  
  for (int i=1; i<=6; i++) {
    if (dcrc_enabled[i] && dcrc_rev[i]==3.) {
      int Register_0x3c = compute_0x3c_register(i, current_test_signal[i], current_general[i]);
      printf("setting register 3c on dcrc%d to 0 \n", i);
      sprintf(command,"wr 3c %x", 0x0000);
      gDataSocket[i]->write(command,strlen(command)+1);
      //sleep for 3s. this seems to be .3s on other (queens) machines
      //but .3s should work too.
      usleep(3000000);
      printf("setting register 3c on dcrc%d to 0x4000 (bit 14=1) \n", i);
      sprintf(command,"wr 3c %x", 0x4000);
      gDataSocket[i]->write(command,strlen(command)+1);
      usleep(3000000);
      printf("setting register 3c on dcrc%d to 0x6000 (bit 13,14=1) \n", i);
      printf("this should 'activate' the TS \n", i);
      sprintf(command,"wr 3c %x", 0x6000);
      gDataSocket[i]->write(command,strlen(command)+1);
      usleep(3000000);
      printf("setting register 3c on dcrc%d to back to value using ODB\n", i);
      sprintf(command,"wr 3c %x", Register_0x3c);
      gDataSocket[i]->write(command,strlen(command)+1);
    }
  }

  return SUCCESS;  
}

//read in ODB variables to determine whether a tower is set to dummy mode and if dcrcs of that tower are enabled
void check_towerdummy_dcrcenable(){
  char set_str[80];
  // Check whether to run in dummyreadout mode, which doesn't talk to DCRCs
// (useful if debugging code but DCRC not present)
            
  sprintf(set_str,"/Equipment/Tower%02d/Settings/DummyReadoutMode",whichtower);
  dummyreadout = odbReadBool(set_str,0,FALSE);

  if (dummyreadout) {
    std::cout << "Dummy mode enabled---writing fake data\n";
  } else {
    std::cout << "Normal mode enabled---fetching data from DCRCs\n";
  }
  
// Determine whether each DCRC is enabled or not
  for (int i=1;i<=6;i++) {
    sprintf (set_str,"/Equipment/Tower%02d/Settings/DCRC%1d/Enabled", whichtower, i);
    dcrc_enabled[i] = odbReadBool(set_str,0,FALSE);
    if (dummyreadout) dcrc_enabled[i] = FALSE;
  }
}


void check_dcrc_rev() {
  // Determine DCRC revision type for each DCRC in the tower
  char set_str[80];
  
  for (int i=1;i<=6;i++) {
    sprintf (set_str,"/Equipment/Tower%02d/Settings/DCRC%1d/DCRCRev", whichtower, i);
    dcrc_rev[i] = odbReadFloat(set_str,0,3.1);
    printf ("DCRC %d is revision %f\n", i,dcrc_rev[i]);
  }
}


//initialize socket connections to DCRCs using the I.P. and prot address of the dcrc. 
void init_dcrc_socket_connections(int initflag){
  char dcrckp[200];
// Loop over DCRCs
    for (int i=1; i<=MAX_DCRCs; i++) {
      // Look up IP port information from ODB
      char odbkp[200];
      sprintf (dcrckp,"/Equipment/Tower%02d/Settings/DCRC%1d", whichtower,i);
      sprintf (odbkp,"%s/DcrcIPAddress",dcrckp);
      char default_ip[16];
      sprintf (default_ip, "192.168.0.%d", i+1+(whichtower-1)*10);
      
      gDcrcIPAddress[i] = odbReadString(odbkp, 0, default_ip, 200);
      //read in integer value of port to use for dcrc driver. possible ports are 5000, 5001, 5002
      //we plan to use 5000 for dcrc_driver and 5001 for the waveform fetching frontend
      sprintf (odbkp,"%s/dcrc_driver_port",dcrckp);
      gDcrcPort[i] = odbReadInt(odbkp,0,5000);
      // Initialize socket connection for each enabled DCRC
      // This must happen before calling read_calibrations
      if (dcrc_enabled[i] && !dummyreadout && initflag) {
	printf("Initializing Socket connection for Tower%02d, DCRC%d at %s, Port %d \n", whichtower, i, gDcrcIPAddress[i].c_str(),gDcrcPort[i]);
	gDataSocket[i] = new KOsocket(gDcrcIPAddress[i].c_str(),gDcrcPort[i]);
	gDataSocket[i]->setSoTimeout(3000);
      }
    }
}


/*
void things_to_do_when_starting_frontend_or_run (int initflag) {


  for (float x=-14; x<=14; x=x+0.5) {
    printf ("Conversion test: %f = %x\n", x, convert_float_to_dac(x,calib[0][i],calib[1][i],0.000001,0xffff));
      }
      exit(1);

}*/



/*-- Frontend Exit -------------------------------------------------*/

INT frontend_exit()
{
  printf("Exiting dcrc_driver.exe!\n");
   return SUCCESS;
}

/*-- Begin of Run --------------------------------------------------*/
// Upon run start, read ODB settings and write them to DCRC
INT begin_of_run(INT run_number, char *error)
{
  printf("starting run %04d\n",run_number); 

  struct timeval starttime, stoptime;
  gettimeofday(&starttime,NULL);



  check_towerdummy_dcrcenable();
  // Pass argument of zero to prevent it from trying to reopen sockets
  init_dcrc_socket_connections(0);

  gettimeofday(&stoptime,NULL);
  printf ("Elapsed during run start: %f\n",stoptime.tv_sec-starttime.tv_sec
          + 0.000001*(stoptime.tv_usec-starttime.tv_usec));

  synchronize_cards();



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

  //printf ("Hi there!!!\n");
 
  /* init bank structure */
  bk_init32(pevent);
 
  // close the bank
  return bk_size(pevent);
}

//this function runs to odbRead* function for every ODB variable that should exist for a given DCRC.
  //we don't use any of the variables readout through these functions, but we use the functionality
  //of the odbRead* functions, which will create a variable in the ODB if it doesn't already exist
  //and also creates the variable with a some default value.
void check_odb_structure(int dcrc, int whichtower, int which_subtree)
{
  char odbkp[150];
  char dcrckp[150];
  char comment[50];

  // Define the ODB path to this particular DCRC 
  if(which_subtree == 1){
    sprintf (dcrckp,"/Equipment/Tower%02d/Settings/DCRC%1d", whichtower,dcrc);
  }
  if(which_subtree == 2){
    sprintf (dcrckp,"/Equipment/Tower%02d/Readback/DCRC%1d", whichtower,dcrc);
  }

  sprintf (odbkp,"%s/General/UseCalibrationRegisters", dcrckp);
  odbReadBool(odbkp,0,FALSE);  
  sprintf(odbkp,"%s/General/ChargeWaveFormLength",dcrckp);
  odbReadInt(odbkp,0,4096);  
  sprintf(odbkp,"%s/General/PhononWaveFormLength",dcrckp);
  odbReadInt(odbkp,0,8192);
  sprintf(odbkp,"%s/General/MasterSlaveFree",dcrckp);
  odbReadInt(odbkp,0,0);
  sprintf(odbkp,"%s/General/MasterSlaveFree Comment",dcrckp);
  sprintf(comment,"MasterSlaveFree: Master=1,Slave=2,Free-running=0");
  odbReadString(odbkp,0,comment,50);
  HNDLE commentkey;
  int status = db_find_key(hDB, 0, odbkp, &commentkey);
  if (status == DB_SUCCESS) {
    status = db_reorder_key(hDB,commentkey,4);
  };


  sprintf(odbkp,"%s/General/LVDSBusDir",dcrckp);
  odbReadBool(odbkp,0,FALSE);
  sprintf(odbkp,"%s/General/ByteSwapEnable",dcrckp);
  odbReadBool(odbkp,0,FALSE);
  sprintf(odbkp,"%s/General/ChargeADCReset",dcrckp);
  odbReadBool(odbkp,0,FALSE);
  sprintf(odbkp,"%s/General/VXOFreqLockRef",dcrckp);
  odbReadInt(odbkp,0,0);
  sprintf(odbkp,"%s/General/EnableADCWritesToSDRam",dcrckp);
  odbReadBool(odbkp,0,TRUE);
  sprintf(odbkp,"%s/General/EnableADCAvgBy64",dcrckp);
  odbReadBool(odbkp,0,FALSE);
  sprintf(odbkp,"%s/General/EnableWritingDDSPhaseData",dcrckp);
  odbReadBool(odbkp,0,FALSE);
  sprintf(odbkp,"%s/General/TriggerSource",dcrckp);
  odbReadBool(odbkp,0,FALSE);
  sprintf(odbkp,"%s/General/TriggerSource Comment",dcrckp);
  sprintf(comment,"TriggerSource: N=Threshold Triggers,Y=Test Signal");
  odbReadString(odbkp,0,comment,50);
  status = db_find_key(hDB, 0, odbkp, &commentkey);
  if (status == DB_SUCCESS) {
    odbWriteString(odbkp,"TriggerSource: N=Threshold Triggers,Y=Test Signal",50);
    status = db_reorder_key(hDB,commentkey,13);
  };


  sprintf(odbkp,"%s/General/FETHeatEnable",dcrckp);
  odbReadBool(odbkp,0,FALSE);
  sprintf(odbkp,"%s/General/QETBiasRangeSelect",dcrckp);
  odbReadBool(odbkp,0,FALSE);
  sprintf(odbkp,"%s/General/ChargePrepulseSamples",dcrckp);
  odbReadInt(odbkp,0,0);
  sprintf(odbkp,"%s/General/PhononPrepulseSamples",dcrckp);
  odbReadInt(odbkp,0,0);
  sprintf(odbkp,"%s/Trigger/PhononTriggerEnable",dcrckp);
  for(int phonon_channel = 0; phonon_channel < MAX_PHONON_CHANNEL; phonon_channel++){
    odbReadBool(odbkp,phonon_channel,FALSE);
    }
  sprintf(odbkp,"%s/Trigger/ChargeTriggerEnable",dcrckp);
  odbReadBool(odbkp,0,TRUE);
  odbReadBool(odbkp,1,FALSE);
  sprintf(odbkp,"%s/Trigger/PhononTriggerBaselineLength",dcrckp);
  odbReadInt(odbkp,0,16);
  sprintf(odbkp,"%s/Trigger/ChargeTriggerBaselineLength",dcrckp);
  odbReadInt(odbkp,0,16);
  sprintf(odbkp,"%s/Trigger/PhononTriggerSampleLength",dcrckp);
  odbReadInt(odbkp,0,2);
  sprintf(odbkp,"%s/Trigger/ChargeTriggerSampleLength",dcrckp);
  odbReadInt(odbkp,0,2);
  sprintf(odbkp,"%s/Trigger/PhononTriggerThreshold",dcrckp); 
  for(int phonon_channel = 0; phonon_channel < MAX_PHONON_CHANNEL; phonon_channel++){ 
    odbReadInt(odbkp,phonon_channel,16);
  }
  sprintf(odbkp,"%s/Trigger/ChargeTriggerThreshold",dcrckp);
  for(int charge_channel = 0; charge_channel < MAX_CHARGE_CHANNEL; charge_channel++){ 
    odbReadInt(odbkp,charge_channel,32);
  }
  sprintf(odbkp,"%s/LED/LEDPulseWidth (us)",dcrckp);
  odbReadInt(odbkp,0,128);
  sprintf(odbkp,"%s/LED/LEDRepRate (us)",dcrckp);
  odbReadInt(odbkp,0,65535);
  sprintf(odbkp,"%s/LED/LEDADCControl",dcrckp);
  odbReadInt(odbkp,0,8192);
  sprintf(odbkp,"%s/LED/LED1Current (mA)",dcrckp);
  odbReadFloat(odbkp,0,0);
  sprintf(odbkp,"%s/LED/EnableLED1",dcrckp);
  odbReadBool(odbkp,0,FALSE);
  sprintf(odbkp,"%s/LED/EnableLED2",dcrckp);
  odbReadBool(odbkp,0,FALSE);
  sprintf(odbkp,"%s/LED/ConnectLEDVoltagesToPhononADCs",dcrckp);
  odbReadBool(odbkp,0,FALSE);
  sprintf(odbkp,"%s/LED/SingleStepFreeRunToggle",dcrckp);
  odbReadBool(odbkp,0,FALSE);
  sprintf(odbkp,"%s/LED/EnableZapCharging",dcrckp);
  odbReadBool(odbkp,0,FALSE);
  sprintf(odbkp,"%s/LED/Enable15VPower",dcrckp);
  odbReadBool(odbkp,0,TRUE);
  sprintf(odbkp,"%s/LED/LED2Current (mA)",dcrckp);
  odbReadFloat(odbkp,0,0);
  for(int phonon_channel=0; phonon_channel<MAX_PHONON_CHANNEL; phonon_channel++) {
    sprintf(odbkp,"%s/TestSignal/ConnectTestToQET",dcrckp);
    odbReadBool(odbkp,phonon_channel,FALSE);
  }
  sprintf(odbkp,"%s/TestSignal/DDSChipControlPin",dcrckp);
  odbReadBool(odbkp,0,FALSE);
  sprintf(odbkp,"%s/TestSignal/DDSControlReg",dcrckp);
  odbReadInt(odbkp,0,3543);
  sprintf(odbkp,"%s/TestSignal/DDSNumIncrements",dcrckp);
  odbReadInt(odbkp,0,2);
  sprintf(odbkp,"%s/TestSignal/DDSFreqIncrement",dcrckp);
  odbReadUint32(odbkp,0,0);
  sprintf(odbkp,"%s/TestSignal/DDSIncrementInterval",dcrckp);
  odbReadInt(odbkp,0,2);
  sprintf(odbkp,"%s/TestSignal/DDSStartFreq",dcrckp);
  odbReadUint32(odbkp,0,2228224);
  sprintf(odbkp,"%s/TestSignal/DDSDACScaling",dcrckp);
  odbReadInt(odbkp,0,1000);
  for(int phonon_channel=0; phonon_channel<MAX_PHONON_CHANNEL; phonon_channel++) {
    sprintf(odbkp,"%s/Phonon/VGAGain (multiplicative factor)",dcrckp);
    odbReadFloat(odbkp,phonon_channel,4.);
    sprintf(odbkp,"%s/Phonon/ADCOffset (V)",dcrckp);
    odbReadFloat(odbkp,phonon_channel,0.);
    sprintf(odbkp,"%s/Phonon/LockpointAdjust (mV)",dcrckp);
    odbReadFloat(odbkp,phonon_channel,0.);
    sprintf(odbkp,"%s/Phonon/SQUIDBias (uA)",dcrckp);
    odbReadFloat(odbkp,phonon_channel,0.);
    sprintf(odbkp,"%s/Phonon/QETBias (uA)",dcrckp);
    odbReadFloat(odbkp,phonon_channel,0.);
    sprintf(odbkp,"%s/Phonon/polarity",dcrckp);
    odbReadInt(odbkp,phonon_channel,0);
    sprintf(odbkp,"%s/Phonon/PGAGain (1,2,4, or 8)",dcrckp);
    odbReadInt(odbkp,phonon_channel,8);
    sprintf(odbkp,"%s/Phonon/ADCSignalSource",dcrckp);
    odbReadBool(odbkp,phonon_channel,TRUE);
    sprintf(odbkp,"%s/Phonon/TestSignalConnect",dcrckp);
    odbReadBool(odbkp,phonon_channel,FALSE);
    sprintf(odbkp,"%s/Phonon/SQUIDSource",dcrckp);
    odbReadBool(odbkp,phonon_channel,FALSE);




  } // end of loop over phonon channels

    sprintf(odbkp,"%s/Phonon/polarity Comment",dcrckp);
    sprintf(comment,"polarity: 0=feedback disable,1=non-invert, 2=inv.");
    odbReadString(odbkp,0,comment,50);
    status = db_find_key(hDB, 0, odbkp, &commentkey);
    if (status == DB_SUCCESS) {
      status = db_reorder_key(hDB,commentkey,6);
    };
    sprintf(odbkp,"%s/Phonon/ADCSignalSource Comment",dcrckp);
    sprintf(comment,"ADCSignalSource: N=feedback amp,Y=pre-amp");
    odbReadString(odbkp,0,comment,50);
    status = db_find_key(hDB, 0, odbkp, &commentkey);
    if (status == DB_SUCCESS) {
      status = db_reorder_key(hDB,commentkey,9);
      //      odbWriteString(odbkp,"ADCSignalSource: N=feedback amp,Y=pre-amp");
    };
    sprintf(odbkp,"%s/Phonon/SQUIDSource Comment",dcrckp);
    sprintf(comment,"SQUIDSource: connect to N=preamp,Y=Vzap");
    odbReadString(odbkp,0,comment,50);
    status = db_find_key(hDB, 0, odbkp, &commentkey);
    if (status == DB_SUCCESS) {
      odbWriteString(odbkp,"SQUIDSource: connect to N=preamp,Y=Vzap",50);
      status = db_reorder_key(hDB,commentkey,12);
    };








  sprintf(odbkp,"%s/Phonon/DACControlPhononAB",dcrckp);
  odbReadInt(odbkp,0,0);
  sprintf(odbkp,"%s/Phonon/DACControlPhononCD",dcrckp);
  odbReadInt(odbkp,0,0);
  for(int charge_channel = 0; charge_channel < MAX_CHARGE_CHANNEL; charge_channel++){
    sprintf(odbkp,"%s/Charge/Bias (V)",dcrckp);
    odbReadFloat(odbkp,charge_channel,0.);
  }
  for(int charge_channel = 0; charge_channel < MAX_CHARGE_CHANNEL; charge_channel++){
    sprintf(odbkp,"%s/Charge/AmpOffset (V)",dcrckp);
    odbReadFloat(odbkp,charge_channel,0);
  }
  
  sprintf (comment, "Note: Qinner=channel 0, Qouter=channel 1");
  sprintf(odbkp,"%s/Charge/ChargeChannelNumberingComment",dcrckp);
  odbReadString(odbkp, 0, comment, 50);
}



INT synchronize_cards () {
  

  char command[40];
  // First pass: make sure 50MHz clock turned off, and write to CSR
    for (int i=1; i<=6; i++) {
      masterslave[i] = current_general[i].masterslavefree;
      printf ("Master/slave status: %d %d\n", i, masterslave[i]);
      // First turn off 50Mhz clock for any DCRC that isn't free-running
      if (dcrc_enabled[i] && masterslave[i]>0) {
	int Register_0x3c = compute_0x3c_register(i, current_test_signal[i], current_general[i]);
	sprintf(command,"wr 3c %x", 0xbfff & Register_0x3c);
	gDataSocket[i]->write(command,strlen(command)+1);
	printf ("SYNC DEBUG: %s to DCRC%d\n", command, i);
      }
    }
    
    // Now write "wr 15 10" to all slaves
    for (int i=1; i<=6; i++) {
      if (dcrc_enabled[i] && masterslave[i]==2) {
	int Register_0x15 = compute_0x15_register(i, current_general[i]);
	sprintf(command,"wr 15 %x", (0xffc0 & Register_0x15)+0x10);
	gDataSocket[i]->write(command,strlen(command)+1);
	printf ("SYNC DEBUG: %s to DCRC%d\n", command, i);
      }
    }

    // Now write "wr 15 21" to the master: hopefully there's onyl one
    for (int i=1; i<=6; i++) {     
      if (dcrc_enabled[i] && masterslave[i]==1) {
	int Register_0x15 = compute_0x15_register(i, current_general[i]);
	sprintf(command,"wr 15 %x", (0xffc0 & Register_0x15)+0x01);
	gDataSocket[i]->write(command,strlen(command)+1);
	printf ("SYNC DEBUG: %s to DCRC%d\n", command, i);
      }
    }


    // Wait 3.2s to make sure all slave clocks have time to synch with master
    //	usleep(3200000);
    // Second pass: command master modules to start writing date---slaves 
    //should automatically follow
    for (int i=1; i<=6; i++) {
      if (dcrc_enabled[i] && masterslave[i]==1) {
	int Register_0x15 = compute_0x15_register(i, current_general[i]);
	//	sprintf(command,"wr 15 %x", (0xffc0 & Register_0x15)+0x01);
	//	gDataSocket[i]->write(command,strlen(command)+1);
	//printf ("SYNC DEBUG: %s to DCRC%d\n", command, i);
	sprintf(command,"wr 15 %x", (0xffc0 & Register_0x15)+0x21);
	gDataSocket[i]->write(command,strlen(command)+1);
	printf ("SYNC DEBUG: %s to DCRC%d\n", command, i);
      }
    }

    //wap: last thing: make sure 50MHz clock turned back on if it
    //was turned off
    for (int i=1; i<=6; i++) {
      if (dcrc_enabled[i] && masterslave[i]>0) {
	int Register_0x3c = compute_0x3c_register(i, current_test_signal[i], current_general[i]);
	sprintf(command,"wr 3c %x", Register_0x3c);
	gDataSocket[i]->write(command,strlen(command)+1);
      }
    }

    return SUCCESS;
}

/*  LocalWords:  str
 */
