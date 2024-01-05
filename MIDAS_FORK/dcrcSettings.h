// Set of variables and functions for getting/settings
// DCRC registers and settings.
// Original version: T. Lindner; Oct 21, 2012
// Last modified: S. Oser, Oct 24, 2012
#ifndef dcrcSettingsH
#define dcrcSettingsH

#include <string>
#include <sstream>
#include <math.h>

#include "utils.cxx"
#include "KOsocket.h"

extern INT whichtower;

static bool verbose = FALSE;

static BOOL dcrc_enabled[7];
static float dcrc_rev[7];
static int masterslave[7] = {0,0,0,0,0,0,0};
static std::string gDcrcIPAddress[7];
static int gDcrcPort[7] = {0,0,0,0,0,0,0};

// Default values for DCRC calibration parameters 
static int defaultcalib[50] = {0x8000, 0x01ab, 0x8000, 0x01ab,
       0x8000, 0x1313, 0x8000, 0x17d8, 0x8000, 0x0338, 0x8000, 0x2faf,
       0x8000, 0x1313, 0x8000, 0x17d8, 0x8000, 0x0338, 0x8000, 0x2faf,
       0x8000, 0x1313, 0x8000, 0x17d8, 0x8000, 0x0338, 0x8000, 0x2faf,
       0x8000, 0x1313, 0x8000, 0x17d8, 0x8000, 0x0338, 0x8000, 0x2faf,
			0x0,0x0,0x0,0x0,0x0,0x0,0x0,		
		       	0x0,0x0,0x0,0x0,0x0,0x0,0x0  };
// Array to store calibration values for all 6 DCRCs in tower
static int calib[50][7];

// Lengths of waveforms to be read out (values are defaults, changeable through ODB)
int phonon_nbytes[7]= {8192,8192,8192,8192,8192,8192,8192};
int charge_nbytes[7] = {4096,4096,4096,4096,4096,4096,4096};

unsigned int phononprepulse[7]= {0,0,0,0,0,0,0};
unsigned int chargeprepulse[7] = {0,0,0,0,0,0,0};


// An array to hold DCRC register values, which may be written to DCRC
static int gRegister[7][0x60];

// A function that sets the calibration values for the DCRC DACs 
static void read_calibrations (KOsocket *gDataSocket, int dcrc_index);

// convert a requested ODB setting to DAC counts
int convert_float_to_dac (float setting, int intercept, int slope, float unit, int max);

// Function to update the front-end parameters using ODB variables.
// Gets called during initialization;
// Also, function is hotlinked so that it gets called if ODB variables are changed.
static void update_settings(INT dcrc_index, INT b, void *c)
{
  
  printf("Update_settings on Tower%02d, DCRC %d\n", whichtower, dcrc_index);
  char odbkp[150];
  char dcrckp[150];


  // Define the ODB path to this particular DCRC 
  sprintf (dcrckp,"/Equipment/Tower%02d/Settings/DCRC%1d", whichtower,
	   dcrc_index);


  // Define some default values for trigger settings.
  // Hopefully these will be rewritten by ODB variables.  
  // If there's an invalid setting in the ODB the default is used instead.
  gRegister[dcrc_index][0x15]= 0x0320;
  gRegister[dcrc_index][0x17] = 0;
  gRegister[dcrc_index][0x18] = 0x0808;
  gRegister[dcrc_index][0x19] = 0x0202;
  gRegister[dcrc_index][0x1a] = 0x10;
  gRegister[dcrc_index][0x1b] = 0x10;
  gRegister[dcrc_index][0x1c] = 0x10;
  gRegister[dcrc_index][0x1d] = 0x10;
  gRegister[dcrc_index][0x1e] = 0x20;
  gRegister[dcrc_index][0x1f] = 0x20;
  gRegister[dcrc_index][0x30] = 0x0;
  gRegister[dcrc_index][0x3C] = 0x0;

  
  /* Move this stuff to towerfe.c
  sprintf (odbkp,"%s/DcrcIPAddress",dcrckp);
  char default_ip[16];
  sprintf (default_ip, "192.168.0.%d", dcrc_index+1+(whichtower-1)*10);
  gDcrcIPAddress[dcrc_index] = odbReadString(odbkp, 0, default_ip, 200);

  sprintf (odbkp,"%s/DcrcPort",dcrckp);
  gDcrcPort[dcrc_index] = odbReadInt(odbkp,0,5001);  */

  //  if(verbose) 
  //printf("Will connect to DCRC at address %s and port %i\n",gDcrcIPAddress[dcrc_index].c_str(),gDcrcPort[dcrc_index]);


  /* Move this code to check which DCRCs are enabled to towerfe.c
  sprintf (odbkp,"%s/Enabled",dcrckp);
  dcrc_enabled[dcrc_index] = odbReadBool(odbkp,0,FALSE); */


  // Set the lengths in bytes of the waveforms to be read out
  // Possibly the waveform lengths should be restricted to powers of 2, since analysis will assume that.
  // But let's not enforce that here---just make sure they're divisible by 4, else DCRC won't reply

  sprintf(odbkp,"%s/General/ChargeWaveFormLength",dcrckp);
  charge_nbytes[dcrc_index] = odbReadInt(odbkp,0,4096);
  if (charge_nbytes[dcrc_index] % 4 != 0) {
    cm_msg(MERROR, frontend_name, "ERROR: Requested value for Charge Waveform Length of %i is not allowed. Defaulting to 4096.", charge_nbytes[dcrc_index]);
    charge_nbytes[dcrc_index] = 4096;
  };
  sprintf(odbkp,"%s/General/PhononWaveFormLength",dcrckp);
  phonon_nbytes[dcrc_index] = odbReadInt(odbkp,0,8192);
  if (phonon_nbytes[dcrc_index] % 4 != 0) {
    cm_msg(MERROR, frontend_name, "ERROR: Requested value for Phonon Waveform Length of %i is not allowed. Defaulting to 8192.", phonon_nbytes[dcrc_index]);
    phonon_nbytes[dcrc_index] = 8192;
  };
  // This keeps things from being too long.
  if (2*charge_nbytes[dcrc_index]+4*phonon_nbytes[dcrc_index] > 4*MAXSAMPLES) {
    cm_msg(MERROR, frontend_name, "ERROR: Fixed array MAXSAMPLES is not big enough to hold these long waveforms.  Defaulting to 4096-byte charge waveforms and 8192-byte phonon waveforms.");
    phonon_nbytes[dcrc_index] = 8192;
    charge_nbytes[dcrc_index] = 4096;
  };
  

  // Read charge and phonon pulse presample length.  This amount is
  // subtracted from the trigger address before requesting waveform
  sprintf(odbkp,"%s/General/ChargePrepulseSamples",dcrckp);
  chargeprepulse[dcrc_index] = odbReadInt(odbkp,0,0);
  sprintf(odbkp,"%s/General/PhononPrepulseSamples",dcrckp);
  phononprepulse[dcrc_index] = odbReadInt(odbkp,0,0);


  // Check whether DCRC will be a master (1), slave (2), or "free agent" (0)
  // This is used for synchronization signals.
  sprintf(odbkp,"%s/General/MasterSlaveFree",dcrckp);
  masterslave[dcrc_index] = odbReadInt(odbkp,0,0);
  if (masterslave[dcrc_index] < 0 || masterslave[dcrc_index] > 2) {
    cm_msg(MERROR, frontend_name, "ERROR: MasterSlaveFree set to invalid value.  Use 1=master, 2=slave, 0=free-running.  Defaulting to 0.");
    masterslave[dcrc_index] =0;
  }
  

  // Figure out the settings for register 0x15
  gRegister[dcrc_index][0x15] = 0;
  sprintf(odbkp,"%s/General/LVDSBusDir",dcrckp);
  if(odbReadBool(odbkp,0,FALSE)) gRegister[dcrc_index][0x15] += 0x1;

  sprintf(odbkp,"%s/General/ByteSwapEnable",dcrckp);
  if(odbReadBool(odbkp,0,FALSE)) gRegister[dcrc_index][0x15] += 0x4;

  sprintf(odbkp,"%s/General/ChargeADCReset",dcrckp);
  if(odbReadBool(odbkp,0,FALSE)) gRegister[dcrc_index][0x15] += 0x2000;


  sprintf(odbkp,"%s/General/VXOFreqLockRef",dcrckp);
  unsigned int VXOFreqLock = odbReadInt(odbkp,0,0);
  if(masterslave[dcrc_index] ==2) {
    VXOFreqLock = 2;
    cm_msg(MINFO, frontend_name, "INFO: Because Tower%i,DCRC%i set to slave mode, overriding VXO Frequency Lock Reference value with value 0x2", whichtower,dcrc_index);
  }
   if(VXOFreqLock >= 0 && VXOFreqLock <= 2){
    gRegister[dcrc_index][0x15] += (VXOFreqLock << 3);    
  }else{
    cm_msg(MERROR, frontend_name, "ERROR: Requested value for VXO Frequency Lock Reference of %i is not allowed. Defaulting to 00.", VXOFreqLock);
  }
  sprintf(odbkp,"%s/General/EnableADCWritesToSDRam",dcrckp);
  if(odbReadBool(odbkp,0,TRUE)) 
    gRegister[dcrc_index][0x15] += (0x1 << 5);
  sprintf(odbkp,"%s/General/EnableADCAvgBy64",dcrckp);
  if(odbReadBool(odbkp,0,FALSE)) 
    gRegister[dcrc_index][0x15] += (0x1 << 6);
  sprintf(odbkp,"%s/General/EnableWritingDDSPhaseData",dcrckp);
  if(odbReadBool(odbkp,0,FALSE)) 
    gRegister[dcrc_index][0x15] += (0x1 << 11);
  sprintf(odbkp,"%s/General/TriggerSource",dcrckp);
  if(odbReadBool(odbkp,0,FALSE)) 
    gRegister[dcrc_index][0x15] += (0x1 << 12);
  printf("Register0x15 = %d\n", gRegister[dcrc_index][0x15]); 


  // Figure out the settings for register 0x17
  gRegister[dcrc_index][0x17] = 0;
  sprintf(odbkp,"%s/Trigger/PhononTriggerEnable",dcrckp);
  if(odbReadBool(odbkp,0,FALSE))
    gRegister[dcrc_index][0x17] += 0x1;
  if(odbReadBool(odbkp,1,FALSE))
    gRegister[dcrc_index][0x17] += 0x2;
  if(odbReadBool(odbkp,2,FALSE))
    gRegister[dcrc_index][0x17] += 0x4;
  if(odbReadBool(odbkp,3,FALSE))
    gRegister[dcrc_index][0x17] += 0x8;

  sprintf(odbkp,"%s/Trigger/ChargeTriggerEnable",dcrckp);
  if(odbReadBool(odbkp,0,TRUE))
    gRegister[dcrc_index][0x17] += 0x10;
  if(odbReadBool(odbkp,1,FALSE))
    gRegister[dcrc_index][0x17] += 0x20;
  printf("Register0x17 = %d\n", gRegister[dcrc_index][0x17]); 

  // Figure out the settings for register 0x18.  If either ODB setting out of range, use register's default value
  sprintf(odbkp,"%s/Trigger/PhononTriggerBaselineLength",dcrckp);
  unsigned int PhononTriggerBaselineLength = odbReadInt(odbkp,0,16);
  sprintf(odbkp,"%s/Trigger/ChargeTriggerBaselineLength",dcrckp);
  unsigned int ChargeTriggerBaselineLength = odbReadInt(odbkp,0,16);
  if(PhononTriggerBaselineLength <= 0x7f && ChargeTriggerBaselineLength <= 0x7f){
    gRegister[dcrc_index][0x18] = PhononTriggerBaselineLength;
    gRegister[dcrc_index][0x18] += (ChargeTriggerBaselineLength << 8);    
  }else{
    if(PhononTriggerBaselineLength > 0x7f)
      cm_msg(MERROR, frontend_name, "ERROR: Requested value for PhononTriggerBaselineLength of %i is not allowed. Ignoring.", 
	     PhononTriggerBaselineLength);
    if(ChargeTriggerBaselineLength > 0x7f)
      cm_msg(MERROR, frontend_name, "ERROR: Requested value for ChargeTriggerBaselineLength of %i is not allowed. Ignoring.", 
	     ChargeTriggerBaselineLength);
  }
  printf("Register0x18 = %d\n", gRegister[dcrc_index][0x18]); 

  // Figure out the settings for register 0x19.  If either ODB setting out of range, use register's default value

  sprintf(odbkp,"%s/Trigger/PhononTriggerSampleLength",dcrckp);
  unsigned int PhononTriggerSampleLength = odbReadInt(odbkp,0,2);
  sprintf(odbkp,"%s/Trigger/ChargeTriggerSampleLength",dcrckp);
  unsigned int ChargeTriggerSampleLength = odbReadInt(odbkp,0,2);
  if(PhononTriggerSampleLength <= 0x1f && ChargeTriggerSampleLength <= 0x1f){
    gRegister[dcrc_index][0x19] = PhononTriggerSampleLength;
    gRegister[dcrc_index][0x19] += (ChargeTriggerSampleLength << 8);    
  }else{
    if(PhononTriggerSampleLength > 0x1f)
      cm_msg(MERROR, frontend_name, "ERROR: Requested value for PhononTriggerSampleLength of %i is not allowed. Ignoring.", 
	     PhononTriggerSampleLength);
    if(ChargeTriggerSampleLength > 0x1f)
      cm_msg(MERROR, frontend_name, "ERROR: Requested value for ChargeTriggerSampleLength of %i is not allowed. Ignoring.", 
	     ChargeTriggerSampleLength);
  }
  printf("Register0x19 = %d\n", gRegister[dcrc_index][0x19]); 

  // Set the thresholds for phonon and charge channels.
  for (int i = 0; i < 4; i++){
    sprintf(odbkp,"%s/Trigger/PhononTriggerThreshold",dcrckp);
    int PhononTriggerThreshold = odbReadInt(odbkp,i,16);
    if (PhononTriggerThreshold > 16383){
      cm_msg(MERROR, frontend_name, "ERROR: Requested value for PhononTriggerThreshold of %i is above maximum. Setting to +16383.", 
	     PhononTriggerThreshold); 
      PhononTriggerThreshold=16383;
    }
    if (PhononTriggerThreshold < -16384){
      cm_msg(MERROR, frontend_name, "ERROR: Requested value for PhononTriggerThreshold of %i is below minimum. Setting to -16384.", 
	     PhononTriggerThreshold); 
      PhononTriggerThreshold=-16384;
    }
    gRegister[dcrc_index][0x1a + i] = PhononTriggerThreshold;
   int check = 0x1a + i;
    printf("Register[%d] = %d\n", check, gRegister[dcrc_index][0x1a + i]); 
  }  
  for(int i = 0; i < 2; i++){
    sprintf(odbkp,"%s/Trigger/ChargeTriggerThreshold",dcrckp);
    unsigned int ChargeTriggerThreshold = odbReadInt(odbkp,i,32);
    if(ChargeTriggerThreshold > 0x7fff){
      cm_msg(MERROR, frontend_name, "ERROR: Requested value for ChargeTriggerThreshold of %i is not allowed. Setting to 0x7fff.", 
	     ChargeTriggerThreshold); 
      ChargeTriggerThreshold = 0x7fff;
    }
    gRegister[dcrc_index][0x1e + i] = ChargeTriggerThreshold;
    int check = 0x1e + i;
    printf("Register[%d] = %d\n", check, gRegister[dcrc_index][0x1e + i]); 

  }  


  // Set value for 0x27, controlling LED flasher pulse width;
  sprintf(odbkp,"%s/LED/LEDPulseWidth (us)",dcrckp);
  unsigned int LEDPulseWidth = odbReadInt(odbkp,0,128);
    if (LEDPulseWidth > 10230){
      cm_msg(MERROR, frontend_name, "ERROR: Requested value for LEDPulseWidth of %i is not allowed. Setting to 10230us.", 
	     LEDPulseWidth); 
      LEDPulseWidth = 10230;
    }
    unsigned int LEDPulseWidthDAC = int(LEDPulseWidth/10.);
    if (LEDPulseWidthDAC > 1023) LEDPulseWidthDAC = 1023;
    gRegister[dcrc_index][0x27] = LEDPulseWidthDAC;
    printf("Register[0x27] = %d\n", gRegister[dcrc_index][0x27]); 

  // Set value for 0x28, controlling LED flasher repetition rate
  sprintf(odbkp,"%s/LED/LEDRepRate (us)",dcrckp);
  unsigned int LEDRepRate = odbReadInt(odbkp,0,65535);
  if (LEDRepRate > 0xffff*20){
      cm_msg(MERROR, frontend_name, "ERROR: Requested value for LEDRepRate of %i is not allowed. Setting to %d us.", 
	     LEDRepRate, 0xffff*20); 
      LEDRepRate = 0xffff*20;
    }
    unsigned int LEDRepRateDAC = int(LEDRepRate/20.);
    if (LEDRepRateDAC > 0xffff) LEDRepRateDAC = 0xffff;
  gRegister[dcrc_index][0x28] = LEDRepRateDAC;
    printf("Register[0x28] = %d\n", gRegister[dcrc_index][0x28]); 
 
  // Set value for 0x33, controlling LED DAC
  sprintf(odbkp,"%s/LED/LEDADCControl",dcrckp);
  unsigned int LEDDAC = odbReadInt(odbkp,0,8192);
    gRegister[dcrc_index][0x33] = LEDDAC;
    printf("Register[0x33] = %d\n", gRegister[dcrc_index][0x33]); 

  // Set value for 0x34, controlling LED1 current
  sprintf(odbkp,"%s/LED/LED1Current (mA)",dcrckp);
  float LED1Current = odbReadFloat(odbkp,0,0);
    if (LED1Current > 10 || LED1Current < -10){
      cm_msg(MERROR, frontend_name, "ERROR: Requested value for LED1Current of %i is out of range (+/-10mA). Setting to 0.", 
	     LED1Current); 
      LED1Current = 0.;
    }
    unsigned int LED1CurrentDAC = int ((LED1Current+10)*0xfff/20. + 0.5);
    if (LED1CurrentDAC > 0xfff) LED1CurrentDAC = 0xfff;
    gRegister[dcrc_index][0x34] = LED1CurrentDAC;
  printf("Register[0x34] = %d\n", LED1CurrentDAC); 


  // Set value for 0x35, controlling LED2 current
  sprintf(odbkp,"%s/LED/LED2Current (mA)",dcrckp);
  float LED2Current = odbReadFloat(odbkp,0,0);
    if (LED2Current > 10 || LED2Current < -10){
      cm_msg(MERROR, frontend_name, "ERROR: Requested value for LED2Current of %i is out of range (+/-10mA). Setting to 0.", 
	     LED2Current); 
      LED2Current = 0.;
    }
    unsigned int LED2CurrentDAC = int ((LED2Current+10)*0xfff/20. + 0.5);
    if (LED2CurrentDAC > 0xfff) LED2CurrentDAC = 0xfff;
    gRegister[dcrc_index][0x35] = LED2CurrentDAC;
  printf("Register[0x35] = %d\n", LED2CurrentDAC); 



  // Set value for 0x30, controlling LED pulser settings and FET heater
  gRegister[dcrc_index][0x30] = 0x0; 
  sprintf(odbkp,"%s/LED/EnableLED1",dcrckp);
  if(odbReadBool(odbkp,0,FALSE))
    gRegister[dcrc_index][0x30] += 0x1;  
  sprintf(odbkp,"%s/LED/EnableLED2",dcrckp);
  if(odbReadBool(odbkp,0,FALSE))
    gRegister[dcrc_index][0x30] += 0x2;
  sprintf(odbkp,"%s/LED/ConnectLEDVoltagesToPhononADCs",dcrckp);
  if(odbReadBool(odbkp,0,FALSE))
    gRegister[dcrc_index][0x30] += 0x4;
  sprintf(odbkp,"%s/LED/SingleStepFreeRunToggle",dcrckp);
  if(odbReadBool(odbkp,0,FALSE))
    gRegister[dcrc_index][0x30] += 0x10;
  sprintf(odbkp,"%s/LED/EnableZapCharging",dcrckp);
  if(odbReadBool(odbkp,0,FALSE))
    gRegister[dcrc_index][0x30] += 0x200; 

  // EnableChargeAmps not included in Rev C.1 of DCRC
  //  sprintf(odbkp,"%s/LED/EnableChargeAmps",dcrckp);
  //if(odbReadBool(odbkp,0,FALSE))
  // gRegister[dcrc_index][0x30] += 0x400;

  sprintf(odbkp,"%s/LED/Enable15VPower",dcrckp);
  if(odbReadBool(odbkp,0,TRUE))
    gRegister[dcrc_index][0x30] += 0x800;
  sprintf(odbkp,"%s/General/FETHeatEnable",dcrckp);
  if(odbReadBool(odbkp,0,FALSE))
    gRegister[dcrc_index][0x30] += (0x1 << 8);
  printf("Register[0x30] = %d\n", gRegister[dcrc_index][0x30]); 

  // Set value for 0x3C, controlling QET bias range and test signals
  gRegister[dcrc_index][0x3c] = 0x0;
  sprintf(odbkp,"%s/General/QETBiasRangeSelect",dcrckp);
  if(odbReadBool(odbkp,0,FALSE)) 
    gRegister[dcrc_index][0x3c] += (0x1 << 15);
  for (int i=0; i<4; i++) {
    sprintf(odbkp,"%s/TestSignal/ConnectTestToQET",dcrckp);
    if(odbReadBool(odbkp,i,FALSE)) 
    gRegister[dcrc_index][0x3c] += (0x1 << (i*4));
}
   sprintf(odbkp,"%s/TestSignal/DDSChipControlPin",dcrckp);
   if(odbReadBool(odbkp,0,FALSE)) 
    gRegister[dcrc_index][0x3c] += (0x1 << 13);
   printf("gRegister[%d][0x3c] set to %d\n", dcrc_index, gRegister[dcrc_index][0x3c]);
 printf("Register[0x3c] = %d\n", gRegister[dcrc_index][0x3c]); 
   // Enable50MHzOsc bit no longer used in DCRC Rev C.1
   //  sprintf(odbkp,"%s/TestSignal/Enable50MHzOsc",dcrckp);
   // if(odbReadBool(odbkp,0,FALSE)) 
   //  gRegister[dcrc_index][0x3c] += (0x1 << 14);
  

  // Set value for 0x3D, controlling DDS control register
  sprintf(odbkp,"%s/TestSignal/DDSControlReg",dcrckp);
  unsigned int DDSControl = odbReadInt(odbkp,0,3543);
    gRegister[dcrc_index][0x3D] = DDSControl;
 printf("gRegister[%d][0x3d] set to %d\n", dcrc_index, gRegister[dcrc_index][0x3d]);
 printf("Register[0x3d] = %d\n", gRegister[dcrc_index][0x3d]); 

  // Set value for 0x3E, controlling DDS number of increments
   sprintf(odbkp,"%s/TestSignal/DDSNumIncrements",dcrckp);
   unsigned int DDSInc = odbReadInt(odbkp,0,2);
   gRegister[dcrc_index][0x3E] = DDSInc;
 printf("Register[0x3e] = %d\n", gRegister[dcrc_index][0x3e]); 

  // Set value for 0x3f & 0x40, controlling DDS frequency increment
   sprintf(odbkp,"%s/TestSignal/DDSFreqIncrement",dcrckp);
   DWORD DDSFreqInt = odbReadUint32(odbkp,0,0);
    gRegister[dcrc_index][0x3f] = (unsigned int) (DDSFreqInt & 0xffff);
    gRegister[dcrc_index][0x40] = (unsigned int) ((DDSFreqInt & 0xffff0000) >> 16);
 printf("Register[0x3f] = %d\n", gRegister[dcrc_index][0x3f]); 
 printf("Register[0x40] = %d\n", gRegister[dcrc_index][0x40]); 

  // Set value for 0x41, controlling DDS increment interval
   sprintf(odbkp,"%s/TestSignal/DDSIncrementInterval",dcrckp);
   unsigned int DDSIncInterval = odbReadInt(odbkp,0,2);
   gRegister[dcrc_index][0x41] = DDSIncInterval;
 printf("Register[0x41] = %d\n", gRegister[dcrc_index][0x41]); 

  // Set value for 0x42 & 0x43, controlling DDS frequency starting value
   sprintf(odbkp,"%s/TestSignal/DDSStartFreq",dcrckp);
   DWORD DDSStartFreq = odbReadUint32(odbkp,0,2228224);
   float freqconversion = 40000000./16777216.;
   // DCRC Rev C uses a 50MHz clock and not 40MHz
   if (dcrc_rev[dcrc_index] == 3.) freqconversion = 50000000./16777216.;
   int digital_freq_setting = int(DDSStartFreq/freqconversion);
    gRegister[dcrc_index][0x42] = (unsigned int) (digital_freq_setting & 0xfff);
    gRegister[dcrc_index][0x43] = (unsigned int) ((digital_freq_setting & 0xfff000) >> 12);
 printf("Register[0x42] = %d\n", gRegister[dcrc_index][0x42]); 
 printf("Register[0x43] = %d\n", gRegister[dcrc_index][0x43]); 


  // Set value for 0x44, controlling DDS test signal DAC scaling
   sprintf(odbkp,"%s/TestSignal/DDSDACScaling",dcrckp);
   unsigned int DACScaling = odbReadInt(odbkp,0,1000);
    if (DACScaling > 0x0fff){
      cm_msg(MERROR, frontend_name, "ERROR: Requested value for DACScaling of %i is not allowed. Setting to 0x0fff.", 
	     DACScaling); 
      DACScaling = 0x0fff;
    }
    gRegister[dcrc_index][0x44] = DACScaling;
    printf("Register[0x44] = %d\n", gRegister[dcrc_index][0x44]); 

    // Assign phonon channel settings
    gRegister[dcrc_index][0x45] = 0x0;
    gRegister[dcrc_index][0x4f] = 0x0;
    for (int phononchannel=0; phononchannel<4; phononchannel++) {
      // These calculations are based on the AD600 amplifier data sheet
      // which indicates that -0.7V = gain of 0.884, and +0.7V = gain of 113
      // The DAC gives -0.7V at 0x0 and +0.7V at 0xfff
      sprintf(odbkp,"%s/Phonon/VGAGain (multiplicative factor)",dcrckp);
      float VGAGain = odbReadFloat(odbkp,phononchannel,4.);
      if (VGAGain > 113 || VGAGain < 0.884){
	cm_msg(MERROR, frontend_name, "ERROR: Requested value for VGAGain[%d] of %f is out of range. Setting to 1.0", 
	       phononchannel,VGAGain); 
	VGAGain = 1.0;
      }
      float gain_dB = 20*log10(VGAGain);
      float VGA_voltage = (gain_dB - 20)/30.1;
      unsigned int VGAGainDAC = int((VGA_voltage + 0.7)*(0xfff)/1.4 + 0.5);
      if (VGAGainDAC > 0xfff) VGAGainDAC = 0xfff;
      gRegister[dcrc_index][0x38 + phononchannel] = VGAGainDAC;
      printf ("VGA Gain %d: %f = %d\n", phononchannel, VGAGain, VGAGainDAC);


      sprintf(odbkp,"%s/Phonon/ADCOffset (V)",dcrckp);
      float adcoffset = odbReadFloat(odbkp,phononchannel,0.);
	if (adcoffset > 4.){
	  cm_msg(MERROR, frontend_name, "ERROR: Requested value for phonon ADC offset[%d] of %f exceeds maximum of +4V, so setting to +4V", phononchannel,adcoffset); 
	  adcoffset = 4.;
	}
	if (adcoffset < -4.){
	  cm_msg(MERROR, frontend_name, "ERROR: Requested value for phonon ADC offset[%d] of %f exceeds minimum of -4V, so setting to -4V", phononchannel,adcoffset); 
	  adcoffset = -4.;
	}
	unsigned int ADCOffsetDAC = convert_float_to_dac(adcoffset,
	   calib[10+8*phononchannel][dcrc_index],calib[11+8*phononchannel][dcrc_index],1.e-8,0xffff); 
      int whichreg = 0x47 + 4*phononchannel;
      if (phononchannel > 1) whichreg += 2;
      gRegister[dcrc_index][whichreg] = ADCOffsetDAC;
      printf ("Phonon ADCOffset[%d] set to %f = %d\n", phononchannel, adcoffset, ADCOffsetDAC);

      sprintf(odbkp,"%s/Phonon/LockpointAdjust (mV)",dcrckp);
      float lockpt = odbReadFloat(odbkp,phononchannel,0.);
	if (lockpt > 27.){
	  cm_msg(MERROR, frontend_name, "ERROR: Requested value for lockpoint[%d] of %f exceeds maximum of +27mV, so setting to +27mV", phononchannel,lockpt); 
	  lockpt = 27.;
	}
	if (lockpt < -27.){
	  cm_msg(MERROR, frontend_name, "ERROR: Requested value for lockpoint[%d] of %f exceeds minimum of -27mV, so setting to -27mV", phononchannel,lockpt); 
	  lockpt = -27.;
	}
	unsigned int LockpointAdjust = convert_float_to_dac(lockpt,
	   calib[8+8*phononchannel][dcrc_index],calib[9+8*phononchannel][dcrc_index],1.e-6,0xffff); 
      whichreg = 0x48 + 4*phononchannel;
      if (phononchannel > 1) whichreg += 2;
      gRegister[dcrc_index][whichreg] = LockpointAdjust;
      printf ("Phonon Lockpoint[%d] set to %f = %d\n", phononchannel, lockpt, LockpointAdjust);



      sprintf(odbkp,"%s/Phonon/SQUIDBias (uA)",dcrckp);
      float squidbias = odbReadFloat(odbkp,phononchannel,0.);
	if (squidbias > 200.){
	  cm_msg(MERROR, frontend_name, "ERROR: Requested value for SQUID bias[%d] of %f exceeds maximum of +200uA, so setting to +200uA", phononchannel,squidbias); 
	  squidbias = 200.;
	}
	if (squidbias < -200.){
	  cm_msg(MERROR, frontend_name, "ERROR: Requested value for SQUID bias[%d] of %f exceeds minimum of -200uA, so setting to -200uA", phononchannel,squidbias); 
	  squidbias = -200.;
	}
      unsigned int SQUIDBiasDAC = convert_float_to_dac(squidbias,
	   calib[6+8*phononchannel][dcrc_index],calib[7+8*phononchannel][dcrc_index],1.e-6,0xffff); 
      whichreg = 0x49 + 4*phononchannel;
      if (phononchannel > 1) whichreg += 2;
      gRegister[dcrc_index][whichreg] = SQUIDBiasDAC;
      printf ("SQUID bias[%d] set to %f = %d\n", phononchannel, squidbias, SQUIDBiasDAC);



      sprintf(odbkp,"%s/Phonon/QETBias (uA)",dcrckp);
      float qetbias = odbReadFloat(odbkp,phononchannel,0.);
	if (qetbias > 1600){
	  cm_msg(MERROR, frontend_name, "ERROR: Requested value for QET bias[%d] of %f exceeds maximum of +1600uA, so setting to +1600uA", phononchannel,qetbias); 
	  qetbias = 1600;
	}
	if (qetbias < -1600){
	  cm_msg(MERROR, frontend_name, "ERROR: Requested value for QET bias[%d] of %f exceeds minimum of -1600uA, so setting to -1600uA", phononchannel,qetbias); 
	  qetbias = -1600;
	}
      unsigned int QETBiasDAC = convert_float_to_dac(qetbias,
	   calib[4+8*phononchannel][dcrc_index],calib[5+8*phononchannel][dcrc_index],1.e-5,0xffff); 
      whichreg = 0x4A + 4*phononchannel;
      if (phononchannel > 1) whichreg += 2;
      gRegister[dcrc_index][whichreg] = QETBiasDAC;
      printf ("QET bias[%d] set to %f = %d\n", phononchannel, qetbias, QETBiasDAC);



      // Pack the register for configuration bits
      if (phononchannel < 2) { whichreg=0x45; } else {whichreg = 0x4f;}
      int bitshift = 8*(phononchannel % 2);

      sprintf(odbkp,"%s/Phonon/polarity",dcrckp);
      unsigned int polarity = odbReadInt(odbkp,phononchannel,0);
      if (polarity > 3){
	cm_msg(MERROR, frontend_name, "ERROR: Requested value for phonon polarity[%d] of %i is not allowed. Setting to 0x00.", 
	       phononchannel,polarity); 
	polarity = 0;
      }
	gRegister[dcrc_index][whichreg] += (polarity << (bitshift+0));

      sprintf(odbkp,"%s/Phonon/PGAGain (1,2,4, or 8)",dcrckp);
      unsigned int PGAGain = odbReadInt(odbkp,phononchannel,8);
      if ((PGAGain != 1) && (PGAGain != 2) && (PGAGain != 4) && (PGAGain != 8)){
	cm_msg(MERROR, frontend_name, "ERROR: Requested value for phonon PGAGain[%d] of %i is not allowed. Allowed values are 1,2,4,8.  Setting to 8.", 
	       phononchannel,PGAGain); 
	PGAGain = 8;
      }
      int PGAGain_digvalue = 3;
      if (PGAGain == 4) PGAGain_digvalue = 2; 
      if (PGAGain == 2) PGAGain_digvalue = 1; 
      if (PGAGain == 1) PGAGain_digvalue = 0; 

      gRegister[dcrc_index][whichreg] += (PGAGain_digvalue << (bitshift+4));

      sprintf(odbkp,"%s/Phonon/ADCSignalSource",dcrckp);
      if(odbReadBool(odbkp,phononchannel,TRUE)) 
	gRegister[dcrc_index][whichreg] += (0x1 << (bitshift+2)); 
      sprintf(odbkp,"%s/Phonon/TestSignalConnect",dcrckp);
      if(odbReadBool(odbkp,phononchannel,FALSE)) 
	gRegister[dcrc_index][whichreg] += (0x1 << (bitshift+3));
      sprintf(odbkp,"%s/Phonon/SQUIDSource",dcrckp);
      if(odbReadBool(odbkp,phononchannel,FALSE)) 
	gRegister[dcrc_index][whichreg] += (0x1 << (bitshift+7));
      
      printf("Register[%d] = %d\n", whichreg, gRegister[dcrc_index][whichreg]); 
      printf("Register[%d] = %d\n", whichreg, gRegister[dcrc_index][whichreg]); 

    } // end of loop over phonon channels

    // Define registers for Phonon DAC control bits
      sprintf(odbkp,"%s/Phonon/DACControlPhononAB",dcrckp);
      unsigned int DACControlPhononAB = odbReadInt(odbkp,0,0);
      gRegister[dcrc_index][0x46] = DACControlPhononAB;
      sprintf(odbkp,"%s/Phonon/DACControlPhononCD",dcrckp);
      unsigned int DACControlPhononCD = odbReadInt(odbkp,0,0);
      gRegister[dcrc_index][0x50] = DACControlPhononCD;



      // Retrieve charge channel settings
      for (int i=0;i<2;i++) {
	sprintf(odbkp,"%s/Charge/Bias (V)",dcrckp);
	float qbias = odbReadFloat(odbkp,i,0.);
	if (qbias > 14.){
	  cm_msg(MERROR, frontend_name, "ERROR: Requested value for charge bias[%d] of %f exceeds maximum of +14V, so setting to +14V", i,qbias); 
	  qbias = 14.;
	}
	if (qbias < -14.){
	  cm_msg(MERROR, frontend_name, "ERROR: Requested value for charge bias[%d] of %f exceeds minimum of -14V, so setting to -14V", i,qbias); 
	  qbias = -14.;
	}
	unsigned int BiasDAC = convert_float_to_dac(qbias,
	   calib[2*i][dcrc_index],calib[2*i+1][dcrc_index],0.000001,0xffff); 

	// RevC swaps the charge bias between Qinner and Qouter!
	if (dcrc_rev[dcrc_index] == 3.) {
	  gRegister[dcrc_index][0x5A - i] = BiasDAC;
	} else {
	  gRegister[dcrc_index][0x59 + i] = BiasDAC;
	}
      printf ("Set charge bias[%d] to %f = %d\n", i, qbias, BiasDAC);


      // Charge Amp Offset is not in the calibration register list yet,
      // so hardwire the conversion into the code for now!
	sprintf(odbkp,"%s/Charge/AmpOffset (V)",dcrckp);
	float AmpOffset = odbReadFloat(odbkp,i,0);
	if (AmpOffset > 2.){
	  cm_msg(MERROR, frontend_name, "ERROR: Requested value for charge amp offset[%d] of %f exceeds maximum of +2V, so setting to +2V", i,AmpOffset); 
	  AmpOffset = 2.;
	}
	if (AmpOffset < -2.){
	  cm_msg(MERROR, frontend_name, "ERROR: Requested value for charge amp offset[%d] of %f exceeds minimum of -2V, so setting to -2V", i,AmpOffset); 
	  AmpOffset = -2.;
	}
	int AmpOffsetDAC = int(0xfff*0.5 + AmpOffset*0xfff/4. + 0.5);
	if (AmpOffsetDAC > 0xfff) AmpOffsetDAC = 0xfff;
	if (AmpOffsetDAC < 0) AmpOffsetDAC = 0;
	gRegister[dcrc_index][0x36 + i] = AmpOffsetDAC;
	printf ("Set charge amp offset[%d] to %f = %d\n", i, AmpOffset,AmpOffsetDAC);
      }



  if(verbose){
    printf("Register values:\n");
    for (int i=0x15 ;i<0x16; i++) printf ("Register 0x%02x = 0x%04x\n",i,gRegister[dcrc_index][i]);
    for (int i=0x17 ;i<0x20; i++) printf ("Register 0x%02x = 0x%04x\n",i,gRegister[dcrc_index][i]);
    for (int i=0x27 ;i<0x29; i++) printf ("Register 0x%02x = 0x%04x\n",i,gRegister[dcrc_index][i]);
    for (int i=0x30 ;i<0x31; i++) printf ("Register 0x%02x = 0x%04x\n",i,gRegister[dcrc_index][i]);
    for (int i=0x33 ;i<0x5b; i++) printf ("Register 0x%02x = 0x%04x\n",i,gRegister[dcrc_index][i]);
  }
} // end of function update_settings


// Function sets the DCRC registers to values from database.  
// This function is called once for initialization and then again at 
// the start of each run.
static void update_dcrc_register(KOsocket *gDataSocket, int dcrc_index)
{
  // Initialize DCRC to enable triggers and readout
  char command[100];


  printf ("Writing register values for Tower%02d, DCRC%d\n", whichtower, dcrc_index);

  // Write to a series of registers on the DCRC
    for (int i=0x15 ;i<0x16; i++) {
    sprintf(command,"wr %02x %04x",i,gRegister[dcrc_index][i]);
    gDataSocket->write(command,11);
  }

    for (int i=0x17 ;i<0x20; i++) {
    sprintf(command,"wr %02x %04x",i,gRegister[dcrc_index][i]);
    gDataSocket->write(command,11);
  }

    for (int i=0x27 ;i<0x29; i++) {
    sprintf(command,"wr %02x %04x",i,gRegister[dcrc_index][i]);
    gDataSocket->write(command,11);
  }

    for (int i=0x30 ;i<0x31; i++) {
    sprintf(command,"wr %02x %04x",i,gRegister[dcrc_index][i]);
    gDataSocket->write(command,11);
  }

    for (int i=0x33 ;i<0x5b; i++) {
    sprintf(command,"wr %02x %04x",i,gRegister[dcrc_index][i]);
    gDataSocket->write(command,11);
  }



}



static void read_calibrations (KOsocket *gDataSocket, int dcrc_index)
{

  // Load with default values 
  for (int i=0;i<50;i++) {
    calib[i][dcrc_index]=defaultcalib[i];
  }



  // The default calibs are for DCRCRev3.1 = RevC.1                              // We must alter a few settings for Rev3.0 = RevC, since it used 14-bit        // charge bias DACs                                                           
  if (dcrc_rev[dcrc_index] == 3.) {
    calib[0][dcrc_index] = 0x2000; // 14-bit DAC for RevC                  
    calib[2][dcrc_index] = 0x2000; // 14-bit DAC for RevC
    calib[1][dcrc_index] = 0x06ad; // slope = 28e6 uV per 2^14 DAC counts 
    calib[3][dcrc_index] = 0x06ad; // slope = 28e6 uV per 2^14 DAC counts
    printf ("Overwriting charge bias calibrations for DCRC %d on account of it being a RevC board\n", dcrc_index);
  }




  char dcrckp[150];

  // Define the ODB path to this particular DCRC 
  sprintf (dcrckp,"/Equipment/Tower%02d/Settings/DCRC%1d/General/UseCalibrationRegisters", whichtower, dcrc_index);


  bool use_calib_flags = odbReadBool(dcrckp,0,FALSE);

  // For now, disable the use of calibration flags, since the default
  // values in the DCRC firmware are bogus and we don't want to risk
  // nonsensical settings
  use_calib_flags = FALSE;
  cm_msg(MINFO, frontend_name, "INFO: Ignoring calibration registers in favor of default calibrations for Tower%i,DCRC%i", whichtower,dcrc_index);


  // Check if calibrations enabled for this DCRC and if DCRC is active
  // If so, request new calibrations from DCRC using "CALD" command
  // and parse the output
  if (!dummyreadout && dcrc_enabled[dcrc_index] && use_calib_flags) {
    char command[6],buffer[300];
    sprintf(command,"cald");
    gDataSocket->write(command,5);
    // "cald" returns 252 bytes: 50x50 + 2 end-of-line/CR characters
    int toberead = 252;
    gDataSocket->readFully(buffer,toberead);

    for (int i=0; i<50; i++) {
      std::stringstream ss;
      int index=i*5;
      ss << std::hex << buffer[index] << buffer[index+1] 
	           << buffer[index+2] << buffer[index+3];
      ss >> calib[i][dcrc_index];
      printf ("DCRC%d calib register %2d: 0x%c%c%c%c = %d\n", dcrc_index,i,
	      buffer[index],buffer[index+1],buffer[index+2],
	      buffer[index+3],calib[i][dcrc_index]);
    }
  } // End of if statement for things to do if DCRC is active

}


#endif

int convert_float_to_dac (float setting, int intercept, int slope, float unit, int max)
{
  int result = int(intercept + setting/(slope*unit)+.5);
  if (result < 0) result=0;
  if (result > max) result=max;

  return(result);
}


// end file
