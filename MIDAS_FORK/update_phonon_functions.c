#include "midas.h"
#include "utils1.h"
#include "constants.h"
#include "write_DCRC.h"
#include "convert_functions.h"

#include "struct_phonon.h"
#include "update_phonon_functions.h"

#include <math.h>

extern char *frontend_name;
extern int calib[50][MAX_DCRCs+1];
extern BOOL dcrc_enabled[MAX_DCRCs+1];
extern float dcrc_rev[MAX_DCRCs+1];
extern BOOL dummyreadout;
extern KOsocket *gDataSocket[MAX_DCRCs+1];


void compare_overwrite_phonon(int whichtower, int dcrc, int update_mode, PHONON &old_phonon, PHONON &current_phonon){

  printf("Within compare_overwrite_phonon--DCRC%d--update_mode:%d\n", dcrc, update_mode);
  printf("current_phonon[%d].vgagain__multiplicative_factor_[0], [1], [2], [3]: %f, %f, %f, %f \n", dcrc,  current_phonon.vgagain__multiplicative_factor_[0],  current_phonon.vgagain__multiplicative_factor_[1],  current_phonon.vgagain__multiplicative_factor_[2],  current_phonon.vgagain__multiplicative_factor_[3]);
  printf("current_phonon[%d].adcoffset__v_[0], [1], [2], [3]: %f, %f, %f, %f \n", dcrc,  current_phonon.adcoffset__v_[0],  current_phonon.adcoffset__v_[1],  current_phonon.adcoffset__v_[2],  current_phonon.adcoffset__v_[3]);
  printf("current_phonon[%d].lockpointadjust__mv_[0], [1], [2], [3]: %f, %f, %f, %f \n", dcrc,  current_phonon.lockpointadjust__mv_[0],  current_phonon.lockpointadjust__mv_[1],  current_phonon.lockpointadjust__mv_[2],  current_phonon.lockpointadjust__mv_[3]);
  printf("current_phonon[%d].squidbias__ua_[0], [1], [2], [3]: %f, %f, %f, %f \n", dcrc,  current_phonon.squidbias__ua_[0],  current_phonon.squidbias__ua_[1],  current_phonon.squidbias__ua_[2],  current_phonon.squidbias__ua_[3]);
  printf("current_phonon[%d].qetbias__ua_[0], [1], [2], [3]: %f, %f, %f, %f \n", dcrc,  current_phonon.qetbias__ua_[0],  current_phonon.qetbias__ua_[1],  current_phonon.qetbias__ua_[2],  current_phonon.qetbias__ua_[3]);
  printf("current_phonon[%d].polarity[0], [1], [2], [3]: %d, %d, %d, %d \n", dcrc,  current_phonon.polarity[0],  current_phonon.polarity[1],  current_phonon.polarity[2],  current_phonon.polarity[3]);
  printf("current_phonon[%d].pgagain__1_2_4__or_8_[0], [1], [2], [3]: %d, %d, %d, %d \n", dcrc,  current_phonon.pgagain__1_2_4__or_8_[0],  current_phonon.pgagain__1_2_4__or_8_[1],  current_phonon.pgagain__1_2_4__or_8_[2],  current_phonon.pgagain__1_2_4__or_8_[3]);
  printf("current_phonon[%d].adcsignalsource[0], [1], [2], [3]: %d, %d, %d, %d \n", dcrc,  current_phonon.adcsignalsource[0],  current_phonon.adcsignalsource[1],  current_phonon.adcsignalsource[2],  current_phonon.adcsignalsource[3]);
  printf("current_phonon[%d].testsignalconnect[0], [1], [2], [3]: %d, %d, %d, %d \n", dcrc,  current_phonon.testsignalconnect[0],  current_phonon.testsignalconnect[1],  current_phonon.testsignalconnect[2],  current_phonon.testsignalconnect[3]);
  printf("current_phonon[%d].squidsource[0], [1], [2], [3]: %d, %d, %d, %d \n", dcrc,  current_phonon.squidsource[0],  current_phonon.squidsource[1],  current_phonon.squidsource[2],  current_phonon.squidsource[3]);
  printf("current_phonon[%d].daccontrolphononab: %d\n", dcrc, current_phonon.daccontrolphononab);
  printf("current_phonon[%d].daccontrolphononcd: %d\n", dcrc, current_phonon.daccontrolphononcd);
  printf("\n");

  
  for (int phonon_channel = 0; phonon_channel < MAX_PHONON_CHANNEL; phonon_channel++){
    if(update_mode || current_phonon.vgagain__multiplicative_factor_[phonon_channel] != old_phonon.vgagain__multiplicative_factor_[phonon_channel]){
      if(!update_mode) printf("current_phonon[%d].vgagain__multiplicative_factor_[%d] changed\n", dcrc, phonon_channel);
      // perform a validity check on the settings based on the AD600 amplifier data sheet
      // which indicates that -0.7V = gain of 0.884, and +0.7V = gain of 113
      // The DAC gives -0.7V at 0x0 and +0.7V at 0xfff
      bool valid_check = check_VGAGain_register(dcrc, phonon_channel, current_phonon);
      if(valid_check){
	if(dcrc_enabled[dcrc] && !dummyreadout){
	  float gain_dB = 20*log10(current_phonon.vgagain__multiplicative_factor_[phonon_channel]);
	  float VGA_voltage = (gain_dB - 20)/30.1;
	  unsigned int VGAGainDAC = int((VGA_voltage + 0.7)*(0xfff)/1.4 + 0.5);
	  if (VGAGainDAC > 0xfff) VGAGainDAC = 0xfff;
     	  int write_success = write_DCRC(gDataSocket[dcrc], VGAGain_register[phonon_channel], VGAGainDAC);
	  //write updated setting to the readback odb
	  //now write the new settings to the readback (mirrored) odb
	  //but only do so if the card was actually written to
	  if(write_success >= 0){
	    //first update the old struct
	    old_phonon.vgagain__multiplicative_factor_[phonon_channel] = current_phonon.vgagain__multiplicative_factor_[phonon_channel];
	    if(!update_mode) printf("old_phonon[%d].vgagain__multiplicative_factor_[%d] overwritten\n", dcrc, phonon_channel);
	    //now update the readback
	    char set_str[80];
	    sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/Phonon/VGAGain (multiplicative factor)", whichtower, dcrc);
	    odbWriteFloat(set_str, phonon_channel, current_phonon.vgagain__multiplicative_factor_[phonon_channel]);
	    cm_msg(MINFO, frontend_name, "Channel %d VGAGain (multiplicative factor)=%f (%dDAC) written to Tower%02d DCRC%d and ReadbackODB", phonon_channel, current_phonon.vgagain__multiplicative_factor_[phonon_channel], VGAGainDAC, whichtower, dcrc);
	  }
	}
      }//end of if whether the setting change was valid
    }//end of if  whether anything was changed
  }//end of loop over phonon channels
  

  
  for (int phonon_channel = 0; phonon_channel < MAX_PHONON_CHANNEL; phonon_channel++){
    if(update_mode || current_phonon.lockpointadjust__mv_[phonon_channel] != old_phonon.lockpointadjust__mv_[phonon_channel]){
      if(!update_mode) printf("current_phonon[%d].lockpointadjust__mv_[%d] changed\n", dcrc, phonon_channel);
      bool valid_check = check_LockpointAdjust_register(dcrc, phonon_channel, current_phonon);
      if(valid_check){
	if(dcrc_enabled[dcrc] && !dummyreadout){
	  unsigned int LockpointAdjust = convert_float_to_dac(current_phonon.lockpointadjust__mv_[phonon_channel], calib[8+8*phonon_channel][dcrc],calib[9+8*phonon_channel][dcrc],1.e-6,0xffff);
	  int write_success = write_DCRC(gDataSocket[dcrc], LockpointAdjust_register[phonon_channel], LockpointAdjust);
	  //write updated setting to the readback odb
	  //now write the new settings to the readback (mirrored) odb
	  //but only do so if the card was actually written to
	  if(write_success >= 0){
	    //first update the struct
	    old_phonon.lockpointadjust__mv_[phonon_channel] = current_phonon.lockpointadjust__mv_[phonon_channel];
	    if(!update_mode) printf("old_phonon[%d].lockpointadjust__mv_[%d] overwritten\n", dcrc, phonon_channel);
	    //now update the readback
	    char set_str[80];
	    sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/Phonon/LockpointAdjust (mV)", whichtower, dcrc);
	    odbWriteFloat(set_str, phonon_channel, current_phonon.lockpointadjust__mv_[phonon_channel]);
	    cm_msg(MINFO, frontend_name, "Channel %d LockpointAdjust (mV)=%f (%dDAC) written to Tower%02d DCRC%d and ReadbackODB", phonon_channel, current_phonon.lockpointadjust__mv_[phonon_channel], LockpointAdjust, whichtower, dcrc);
	  }
	}
      }
    }
  }
  
  for (int phonon_channel = 0; phonon_channel < MAX_PHONON_CHANNEL; phonon_channel++){
    if(update_mode || current_phonon.squidbias__ua_[phonon_channel] != old_phonon.squidbias__ua_[phonon_channel]){
      if(!update_mode) printf("current_phonon[%d].squidbias__ua_[%d] changed\n", dcrc, phonon_channel);
      bool valid_check = check_SQUIDBias_register(dcrc, phonon_channel, current_phonon);
      if(valid_check){
	if(dcrc_enabled[dcrc] && !dummyreadout){
	  unsigned int SQUIDBiasDAC = convert_float_to_dac(current_phonon.squidbias__ua_[phonon_channel], calib[6+8*phonon_channel][dcrc],calib[7+8*phonon_channel][dcrc],1.e-6,0xffff);
	  int write_success = write_DCRC(gDataSocket[dcrc], SQUIDBias_register[phonon_channel], SQUIDBiasDAC);
	  //write updated setting to the readback odb
	  //now write the new settings to the readback (mirrored) odb
	  //but only do so if the card was actually written to
	  if(write_success >= 0){
	    //first update the struct
	    old_phonon.squidbias__ua_[phonon_channel] = current_phonon.squidbias__ua_[phonon_channel];
	    if(!update_mode) printf("old_phonon[%d].squidbias__ua_[%d] overwritten\n", dcrc, phonon_channel);
	    //now update the readback
	    char set_str[80];
	    sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/Phonon/SQUIDBias (uA)", whichtower, dcrc);
	    odbWriteFloat(set_str, phonon_channel, current_phonon.squidbias__ua_[phonon_channel]);
	    cm_msg(MINFO, frontend_name, "Channel %d SQUIDBias(uA)=%f (%dDAC) written to Tower%02d DCRC%d and ReadbackODB", phonon_channel, current_phonon.squidbias__ua_[phonon_channel], SQUIDBiasDAC, whichtower, dcrc);
	  }
	}
      }
    }
  }

  for (int phonon_channel = 0; phonon_channel < MAX_PHONON_CHANNEL; phonon_channel++){
    if(update_mode || current_phonon.qetbias__ua_[phonon_channel] != old_phonon.qetbias__ua_[phonon_channel]){
      if(!update_mode) printf("current_phonon[%d].qetbias__ua_[%d] changed\n", dcrc, phonon_channel);
      bool valid_check =  check_QETBias_register(dcrc, phonon_channel, current_phonon);
      if(valid_check){
	if(dcrc_enabled[dcrc] && !dummyreadout){
	  unsigned int QETBiasDAC = convert_float_to_dac(current_phonon.qetbias__ua_[phonon_channel], calib[4+8*phonon_channel][dcrc],calib[5+8*phonon_channel][dcrc],1.e-5,0xffff);
	  int write_success = write_DCRC(gDataSocket[dcrc], QETBias_register[phonon_channel], QETBiasDAC);
	  //write updated setting to the readback odb
	  //now write the new settings to the readback (mirrored) odb
	  //but only do so if the card was actually written to
	  if(write_success >= 0){
	    //first update the struct
	    old_phonon.qetbias__ua_[phonon_channel] = current_phonon.qetbias__ua_[phonon_channel];
	    if(!update_mode) printf("old_phonon[%d].qetbias__ua_[%d] overwritten\n", dcrc, phonon_channel);
	    //now update the readback
	    char set_str[80];
	    sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/Phonon/QETBias (uA)", whichtower, dcrc);
	    odbWriteFloat(set_str, phonon_channel, current_phonon.qetbias__ua_[phonon_channel]);
	    cm_msg(MINFO, frontend_name, "Channel %d QETBias(uA)=%f (%dDAC) written to Tower%02d DCRC%d and ReadbackODB", phonon_channel, current_phonon.qetbias__ua_[phonon_channel], QETBiasDAC, whichtower, dcrc);
	  }
	}
      }
    }
  }


  int Register_0x45_0x4f[2] = {0, 0};
  if(update_mode){
    //make these arrays of booleans that are the size of the number of
    //phonon channels.  writing to the register requires that all the settings
    //of that register are valid.  the first two polarity and first two pgagain
    //registers go to a single register.  therefore the bool arrays will be used to
    //check the validitiy of these two settings.
    bool valid_polarity_check[MAX_PHONON_CHANNEL];
    bool valid_pga_check[MAX_PHONON_CHANNEL];
    for(int phonon_channel = 0; phonon_channel < MAX_PHONON_CHANNEL; phonon_channel++){
	valid_polarity_check[phonon_channel] = check_phonon_polarity(dcrc, phonon_channel, current_phonon);
	valid_pga_check[phonon_channel] = check_phonon_pgagain(dcrc, phonon_channel, current_phonon);
    }
    //Register 0x45 takes settings from the first two phonon values, so make sure
    //all these settings are valid (by checkign our boolean array before writing
    // register 0x45)
    if(valid_polarity_check[0] && valid_polarity_check[1] && valid_pga_check[0] && valid_pga_check[1]){
      Register_0x45_0x4f[0] = compute_0x45_0x4f_register(current_phonon, 0x45, dcrc);
      if(dcrc_enabled[dcrc] && !dummyreadout){
	int write_success = write_DCRC(gDataSocket[dcrc], PolPGAGainADCSignalTestSQUID_register[0], Register_0x45_0x4f[0]);	
	//now write the new settings to the odb
	//we need to write to the 0 and 1 channels
	//in the readbackODB so these are the phonon channels
	//we loop over
      	//but only do so if the card was actually written to
	if(write_success >= 0){
	  //first update the struct
	  //only overwrite the polarity and pga old struct values if the settings are valid
	  //this is important because we will need to compare against old_phonon during
	  //runtime when, hopefully, the settings will be made valid if invalid here
	  for(int phonon_channel = 0; phonon_channel < 2; phonon_channel++){
	    old_phonon.polarity[phonon_channel] =  current_phonon.polarity[phonon_channel];
	    old_phonon.pgagain__1_2_4__or_8_[phonon_channel] = current_phonon.pgagain__1_2_4__or_8_[phonon_channel];
	    old_phonon.adcsignalsource[phonon_channel] =  current_phonon.adcsignalsource[phonon_channel];
	    old_phonon.testsignalconnect[phonon_channel] =  current_phonon.testsignalconnect[phonon_channel];
	    old_phonon.squidsource[phonon_channel] =  current_phonon.squidsource[phonon_channel];
	  }
	  //now update the readback
	  char set_str[80];
	  for (int phonon_channel = 0; phonon_channel < 2; phonon_channel++){
	    sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/Phonon/polarity", whichtower, dcrc);
	    odbWriteInt(set_str, phonon_channel, current_phonon.polarity[phonon_channel]);
	    cm_msg(MINFO, frontend_name, "Channel %d polarity=%d written to Tower%02d DCRC%d and ReadbackODB", phonon_channel, current_phonon.polarity[phonon_channel], whichtower, dcrc);
	    sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/Phonon/PGAGain (1,2,4, or 8)", whichtower, dcrc);
	    odbWriteInt(set_str, phonon_channel, current_phonon.pgagain__1_2_4__or_8_[phonon_channel]);
	    cm_msg(MINFO, frontend_name, "Channel %d PGAGain (1,2,4, or 8)=%d written to Tower%02d DCRC%d and ReadbackODB", phonon_channel, current_phonon.pgagain__1_2_4__or_8_[phonon_channel], whichtower, dcrc);
	    sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/Phonon/ADCSignalSource", whichtower, dcrc);
	    odbWriteBool(set_str, phonon_channel, current_phonon.adcsignalsource[phonon_channel]);
	    cm_msg(MINFO, frontend_name, "Channel %d ADCSignalSource=%d written to Tower%02d DCRC%d and ReadbackODB", phonon_channel, current_phonon.adcsignalsource[phonon_channel], whichtower, dcrc);
	    sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/Phonon/TestSignalConnect", whichtower, dcrc);
	    odbWriteBool(set_str, phonon_channel, current_phonon.testsignalconnect[phonon_channel]);
	    cm_msg(MINFO, frontend_name, "Channel %d TestSignalConnect=%d written to Tower%02d DCRC%d and ReadbackODB", phonon_channel, current_phonon.testsignalconnect[phonon_channel], whichtower, dcrc);
	    sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/Phonon/SQUIDSource", whichtower, dcrc);
	    odbWriteBool(set_str, phonon_channel, current_phonon.squidsource[phonon_channel]);
	    cm_msg(MINFO, frontend_name, "Channel %d SQUIDSource=%d written to Tower%02d DCRC%d and ReadbackODB", phonon_channel, current_phonon.squidsource[phonon_channel], whichtower, dcrc);
	  printf ("Register_0x45_0x4f[%d] = %d written to dcrc\n", 0, Register_0x45_0x4f[0]);
	  }
	}
      }
    }
    //Register 0x4f takes settings from the second two phonon values, so make sure
    //all these settings are valid (by checkign our boolean array before writing
    // register 0x4f)
    if(valid_polarity_check[2] && valid_polarity_check[3] && valid_pga_check[2] && valid_pga_check[3]){
      Register_0x45_0x4f[1] = compute_0x45_0x4f_register(current_phonon, 0x4f,dcrc);     
      if(dcrc_enabled[dcrc] && !dummyreadout){
	  int write_success = write_DCRC(gDataSocket[dcrc], PolPGAGainADCSignalTestSQUID_register[1], Register_0x45_0x4f[1]);
	  //now write the new settings to the odb
	  //we need to write to the 2 and 3 channels
	  //in the readback ODB so these are the phonon channels
	  //we loop over
	  //but only do so if the card was actually written to
	  if(write_success >= 0){
	    //first update the struct
	    //only overwrite the polarity and pga old struct values if the settings are valid
	    //this is important because we will need to compare against old_phonon during
	    //runtime when, hopefully, the settings will be made valid if invalid here
	    for(int phonon_channel = 2; phonon_channel < 4; phonon_channel++){
	      old_phonon.polarity[phonon_channel] =  current_phonon.polarity[phonon_channel];
	      old_phonon.pgagain__1_2_4__or_8_[phonon_channel] = current_phonon.pgagain__1_2_4__or_8_[phonon_channel];
	      old_phonon.adcsignalsource[phonon_channel] =  current_phonon.adcsignalsource[phonon_channel];
	      old_phonon.testsignalconnect[phonon_channel] =  current_phonon.testsignalconnect[phonon_channel];
	      old_phonon.squidsource[phonon_channel] =  current_phonon.squidsource[phonon_channel];
	    }
	    //now update the readback
	    char set_str[80];
	    for (int phonon_channel = 2; phonon_channel < 4; phonon_channel++){
	      sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/Phonon/polarity", whichtower, dcrc);
	      odbWriteInt(set_str, phonon_channel, current_phonon.polarity[phonon_channel]);
	      cm_msg(MINFO, frontend_name, "Channel %d polarity=%d written to Tower%02d DCRC%d and ReadbackODB", phonon_channel, current_phonon.polarity[phonon_channel], whichtower, dcrc);
	      sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/Phonon/PGAGain (1,2,4, or 8)", whichtower, dcrc);
	      odbWriteInt(set_str, phonon_channel, current_phonon.pgagain__1_2_4__or_8_[phonon_channel]);
	      cm_msg(MINFO, frontend_name, "Channel %d PGAGain (1,2,4, or 8)=%d written to Tower%02d DCRC%d and ReadbackODB", phonon_channel, current_phonon.pgagain__1_2_4__or_8_[phonon_channel], whichtower, dcrc);
	      sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/Phonon/ADCSignalSource", whichtower, dcrc);
	      odbWriteBool(set_str, phonon_channel, current_phonon.adcsignalsource[phonon_channel]);
	      cm_msg(MINFO, frontend_name, "Channel %d ADCSignalSource=%d written to Tower%02d DCRC%d and ReadbackODB", phonon_channel, current_phonon.adcsignalsource[phonon_channel], whichtower, dcrc);
	      sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/Phonon/TestSignalConnect", whichtower, dcrc);
	      odbWriteBool(set_str, phonon_channel, current_phonon.testsignalconnect[phonon_channel]);
	      cm_msg(MINFO, frontend_name, "Channel %d TestSignalConnect=%d written to Tower%02d DCRC%d and ReadbackODB", phonon_channel, current_phonon.testsignalconnect[phonon_channel], whichtower, dcrc);
	      sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/Phonon/SQUIDSource", whichtower, dcrc);
	      odbWriteBool(set_str, phonon_channel, current_phonon.squidsource[phonon_channel]);
	      cm_msg(MINFO, frontend_name, "Channel %d SQUIDSource=%d written to Tower%02d DCRC%d and ReadbackODB", phonon_channel, current_phonon.squidsource[phonon_channel], whichtower, dcrc);

	      printf ("Register_0x45_0x4f[%d] = %d written to dcrc\n", 1, Register_0x45_0x4f[1]);
	    }
	  }	  
      }
    }
  }
  else { 
    //these arrays serve the same purpose of the ones above,
    //however they might just be extra machinery.  they
    //hold a ralue of 1 in the elements that correspond to the
    //phonon channel for the settings that are valid
    bool valid_polarity_check[MAX_PHONON_CHANNEL];
    bool valid_pga_check[MAX_PHONON_CHANNEL];
    for(int start_channel = 0; start_channel < 3; start_channel = start_channel + 2){
      int changed_variable_flag = 0;
      for (int phonon_channel = 0; phonon_channel < 2; phonon_channel++){
	if(current_phonon.polarity[start_channel+phonon_channel] != old_phonon.polarity[start_channel+phonon_channel]){
	  printf("current_phonon[%d].polarity[%d] changed\n", dcrc, start_channel+phonon_channel);
	  //here we check the individual changed setting, so we know whether
	  //to overwrite it
	  valid_polarity_check[start_channel+phonon_channel] = check_phonon_polarity(dcrc, start_channel+phonon_channel, current_phonon);
	  if(valid_polarity_check[start_channel+phonon_channel]){
	    changed_variable_flag = 1;
	  }
	}
	if(current_phonon.pgagain__1_2_4__or_8_[start_channel+phonon_channel] != old_phonon.pgagain__1_2_4__or_8_[start_channel+phonon_channel]){
	  printf("current_phonon[%d].pgagain__1_2_4__or_8_[%d] changed\n", dcrc, start_channel+phonon_channel);
	  //here we check the individual changed setting, so we know whether to
	  //overwrite it
	  valid_pga_check[start_channel+phonon_channel] = check_phonon_pgagain(dcrc, start_channel+phonon_channel, current_phonon);
	  if(valid_pga_check[start_channel+phonon_channel]){
	    changed_variable_flag = 1;
	  }
	}
	if(current_phonon.adcsignalsource[start_channel+phonon_channel] != old_phonon.adcsignalsource[start_channel+phonon_channel]){
	  printf("current_phonon[%d].adcsignalsource[%d] changed\n", dcrc, start_channel+phonon_channel);
	  changed_variable_flag = 1;
	}
	if(current_phonon.testsignalconnect[start_channel+phonon_channel] != old_phonon.testsignalconnect[start_channel+phonon_channel]){
	  printf("current_phonon[%d].testsignalconnect[%d] changed\n", dcrc, start_channel+phonon_channel);
	  changed_variable_flag = 1;
	}
	if(current_phonon.squidsource[start_channel+phonon_channel] != old_phonon.squidsource[start_channel+phonon_channel]){
	  printf("current_phonon[%d].squidsource[%d] changed\n", dcrc, start_channel+phonon_channel);
	  changed_variable_flag = 1;
	}
      }//end of phonon_channel loop from 0 to 1
      if(changed_variable_flag && dcrc_enabled[dcrc] && !dummyreadout){
	//here we check whether all the phonon and pgagain settings are valid
	//that will go into the register for this changed setting. if all settings
	//are valid, this function will return a 1 in the
	//start_channel element, which will be either 0 or 2. we are still in the
	// start_channel loop and therefore when start_channel =0 , we check these
	// for phonon channel 0 and 1. for start_channel=2, we check these settings
	//for phonon_channel 2 and 3. if these settings are invalid
	//none of the settings are written to the register, we will simply keep the existing
	//register value.
	bool valid_polarity_pgagain_check = check_phonon_polarity_pgagain_two_channels(dcrc, start_channel, current_phonon);
	if(valid_polarity_pgagain_check){
	  int reg_index;
	  int Register_0x45_0x4f;
	  if(start_channel == 0){
	    reg_index = 0;
	    Register_0x45_0x4f = compute_0x45_0x4f_register(current_phonon, 0x45,dcrc);
	  }
	  else {
	    reg_index = 1;
	    Register_0x45_0x4f = compute_0x45_0x4f_register(current_phonon, 0x4f,dcrc);
	  }
	  int write_success = write_DCRC(gDataSocket[dcrc], PolPGAGainADCSignalTestSQUID_register[reg_index], Register_0x45_0x4f);
	  //now write the new settings to the odb
	  //but only do so if the card was actually written to
	  if(write_success >= 0){
	    char set_str[80];
	    for (int phonon_channel = 0; phonon_channel < 2; phonon_channel++){
	      //first update all the structs
	      old_phonon.polarity[start_channel+phonon_channel] =  current_phonon.polarity[start_channel+phonon_channel];
	      printf("old_phonon[%d].polarity[%d] overwritten\n", dcrc, start_channel+phonon_channel);
	      old_phonon.pgagain__1_2_4__or_8_[start_channel+phonon_channel] =  current_phonon.pgagain__1_2_4__or_8_[start_channel+phonon_channel];
	      printf("old_phonon[%d].pgagain__1_2_4__or_8_[%d] overwritten\n", dcrc, start_channel+phonon_channel);
	      old_phonon.adcsignalsource[start_channel+phonon_channel] =  current_phonon.adcsignalsource[start_channel+phonon_channel];
	      printf("old_phonon[%d].adcsignalsource[%d] overwritten\n", dcrc, start_channel+phonon_channel); 
	      old_phonon.testsignalconnect[start_channel+phonon_channel] =  current_phonon.testsignalconnect[start_channel+phonon_channel];
	      printf("old_phonon[%d].testsignalconnect[%d] overwritten\n", dcrc, start_channel+phonon_channel);
	      old_phonon.squidsource[start_channel+phonon_channel] =  current_phonon.squidsource[start_channel+phonon_channel];
	      printf("old_phonon[%d].squidsource[%d] overwritten\n", dcrc, start_channel+phonon_channel);
	      //now update the readback
	      sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/Phonon/polarity", whichtower, dcrc);
	      odbWriteInt(set_str, start_channel+phonon_channel, current_phonon.polarity[start_channel+phonon_channel]);
	      cm_msg(MINFO, frontend_name, "Channel %d polarity=%d written to Tower%02d DCRC%d and ReadbackODB", start_channel+phonon_channel, current_phonon.polarity[start_channel+phonon_channel], whichtower, dcrc);
	      sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/Phonon/PGAGain (1,2,4, or 8)", whichtower, dcrc);
	      odbWriteInt(set_str, start_channel+phonon_channel, current_phonon.pgagain__1_2_4__or_8_[start_channel+phonon_channel]);
	      cm_msg(MINFO, frontend_name, "Channel %d PGAGain (1,2,4, or 8)=%d written to Tower%02d DCRC%d and ReadbackODB", start_channel+phonon_channel, current_phonon.pgagain__1_2_4__or_8_[start_channel+phonon_channel], whichtower, dcrc);
	      sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/Phonon/ADCSignalSource", whichtower, dcrc);
	      odbWriteBool(set_str, start_channel+phonon_channel, current_phonon.adcsignalsource[start_channel+phonon_channel]);
	      cm_msg(MINFO, frontend_name, "Channel %d ADCSignalSource=%d written to Tower%02d DCRC%d and ReadbackODB", start_channel+phonon_channel, current_phonon.adcsignalsource[start_channel+phonon_channel], whichtower, dcrc);
	      sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/Phonon/TestSignalConnect", whichtower, dcrc);
	      odbWriteBool(set_str, start_channel+phonon_channel, current_phonon.testsignalconnect[start_channel+phonon_channel]);
	      cm_msg(MINFO, frontend_name, "Channel %d TestSignalConnect=%d written to Tower%02d DCRC%d and ReadbackODB", start_channel+phonon_channel, current_phonon.testsignalconnect[start_channel+phonon_channel], whichtower, dcrc);
	      sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/Phonon/SQUIDSource", whichtower, dcrc);
	      odbWriteBool(set_str, start_channel+phonon_channel, current_phonon.squidsource[start_channel+phonon_channel]);
	      cm_msg(MINFO, frontend_name, "Channel %d SQUIDSource=%d written to Tower%02d DCRC%d and ReadbackODB", start_channel+phonon_channel, current_phonon.squidsource[start_channel+phonon_channel], whichtower, dcrc);

	      printf ("Register_0x45_0x4f[%d] = %d written to dcrc\n", reg_index, Register_0x45_0x4f);
	    } // end of for loop over phonon channel
	  } //end of if statement for writing
      	}
      }
    }
  }


  // a flag to see if the DAC control registers are touched.  If so we'll need to re-set the ADC offsets
  bool dac_control_updated = FALSE;

  if(update_mode || current_phonon.daccontrolphononab !=  old_phonon.daccontrolphononab){
    if(!update_mode) printf("current_phonon[%d].daccontrolphononab changed\n", dcrc);
    //check to make sure the setting is valid
    bool valid_check = check_DACControlPhonon_register(dcrc, current_phonon, 0);
    if(valid_check){
      if(dcrc_enabled[dcrc] && !dummyreadout){
	//the struct value should already by positive, otherwise it would have                            
	// failed the check but convert to unsigned as an extra safeguard                                 
	unsigned int daccontrolphononab_unsigned =  current_phonon.daccontrolphononab;
	dac_control_updated = TRUE;
	int write_success = write_DCRC(gDataSocket[dcrc], DACControlPhononAB_register, daccontrolphononab_unsigned);
	//write updated setting to the readback odb
	//but only do so if the card was actually written to
	if(write_success >= 0){
	  //update the struct first
	  old_phonon.daccontrolphononab = current_phonon.daccontrolphononab;
	  if(!update_mode) printf("old_phonon[%d].daccontrolphononab overwritten\n", dcrc);
	  //now update the readback
	  char set_str[80];
	  sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/Phonon/DACControlPhononAB", whichtower, dcrc);
	  odbWriteInt(set_str, 0, current_phonon.daccontrolphononab);
	  cm_msg(MINFO, frontend_name, "DACControlPhononAB =%d written to Tower%02d DCRC%d and ReadbackODB", current_phonon.daccontrolphononab, whichtower, dcrc);
	}
      }
    }
  }

  if(update_mode || current_phonon.daccontrolphononcd !=  old_phonon.daccontrolphononcd){
    if(!update_mode) printf("current_phonon[%d].daccontrolphononcd changed\n", dcrc);
    //check to make sure the setting is valid 
    bool valid_check = check_DACControlPhonon_register(dcrc, current_phonon, 1);
    if(valid_check){
      if(dcrc_enabled[dcrc] && !dummyreadout){
	//the struct value should already by positive, otherwise it would have
	// failed the check but convert to unsigned as an extra safeguard 
	unsigned int daccontrolphononcd_unsigned =  current_phonon.daccontrolphononcd;
	dac_control_updated = TRUE;
	int write_success = write_DCRC(gDataSocket[dcrc], DACControlPhononCD_register, daccontrolphononcd_unsigned);
	//write updated setting to the readback odb
	//but only do so if the card was actually written to
	if(write_success >= 0){
	  //first update the struct
	  old_phonon.daccontrolphononcd = current_phonon.daccontrolphononcd;
	  if(!update_mode) printf("old_phonon[%d].daccontrolphononcd overwritten\n", dcrc);
	  //now update the readback
	  char set_str[80];
	  sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/Phonon/DACControlPhononCD", whichtower, dcrc);
	  odbWriteInt(set_str, 0, current_phonon.daccontrolphononcd);
	  cm_msg(MINFO, frontend_name, "DACControlPhononCD =%d written to Tower%02d DCRC%d and ReadbackODB", current_phonon.daccontrolphononcd, whichtower, dcrc);
	}
      }
    }
  }




  for (int phonon_channel = 0; phonon_channel < MAX_PHONON_CHANNEL; phonon_channel++){
    // Need to rewrite the ADC offsets anytime the DAC Control register is touched
    if(dac_control_updated || update_mode || current_phonon.adcoffset__v_[phonon_channel] != old_phonon.adcoffset__v_[phonon_channel]){
      if(!update_mode) printf("current_phonon[%d].adcoffset__v_[%d] changed\n", dcrc, phonon_channel);
      bool valid_check = check_ADCOffset_register(dcrc, phonon_channel, current_phonon);
      if(valid_check){
	if(dcrc_enabled[dcrc] && !dummyreadout){
	  unsigned int ADCOffsetDAC = convert_float_to_dac(current_phonon.adcoffset__v_[phonon_channel], calib[10+8*phonon_channel][dcrc],calib[11+8*phonon_channel][dcrc],1.e-8,0xffff);	
	  int write_success = write_DCRC(gDataSocket[dcrc], ADCOffset_register[phonon_channel], ADCOffsetDAC);
	  //write updated setting to the readback odb
	  //now write the new settings to the readback (mirrored) odb
	  //but only do so if the card was actually written to
	  if(write_success >= 0){
	    //first update the struct
	    old_phonon.adcoffset__v_[phonon_channel] = current_phonon.adcoffset__v_[phonon_channel];
	    if(!update_mode) printf("old_phonon[%d].adcoffset__v_[%d] overwritten\n", dcrc, phonon_channel);
	    //now update the readback
	    char set_str[80];
	    sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/Phonon/ADCOffset (V)", whichtower, dcrc);
	    odbWriteFloat(set_str, phonon_channel, current_phonon.adcoffset__v_[phonon_channel]);
	    cm_msg(MINFO, frontend_name, "Channel %d ADCOffset(V)=%f (%dDAC) written to Tower%02d DCRC%d and ReadbackODB", phonon_channel, current_phonon.adcoffset__v_[phonon_channel], ADCOffsetDAC, whichtower, dcrc);
	  }
	}
      }
    }
  }




}//end of the compare_overwrite_phonon function


bool check_DACControlPhonon_register(int dcrc, PHONON &current_phonon, int cd){
  bool valid_check = 1;
  if(!cd){
    if(current_phonon.daccontrolphononab < 0){
      valid_check = 0;
      cm_msg(MERROR, frontend_name, "ERROR: Requested value for current_phonon[%d].daccontrolphononab of %d\
 is negative and not allowed. Keeping previous value for Register 0x46", dcrc, current_phonon.daccontrolphononab);
    }
  }
  else {
    if(current_phonon.daccontrolphononcd < 0){
      valid_check = 0;
      cm_msg(MERROR, frontend_name, "ERROR: Requested value for current_phonon[%d].daccontrolphononcd of %d\
 is negative and not allowed. Keeping previous value for Register 0x50", dcrc, current_phonon.daccontrolphononcd);
    }
  }
  return valid_check;
}

bool check_VGAGain_register(int dcrc, int phonon_channel, PHONON &current_phonon){
  bool valid_check = 1;
  // These calculations are based on the AD600 amplifier data sheet
  // which indicates that -0.7V = gain of 0.884, and +0.7V = gain of 113
  // The DAC gives -0.7V at 0x0 and +0.7V at 0xfff
  if(current_phonon.vgagain__multiplicative_factor_[phonon_channel] > 113 || current_phonon.vgagain__multiplicative_factor_[phonon_channel] < 0.884){
    valid_check = 0;
    cm_msg(MERROR, frontend_name, "ERROR: Requested value for current_phonon[%d].vgagain__multiplicative_factor_[%d] of %f is out of range of 0.884 to 113. Keeping previous value for this Register (0x38, 0x39, 0x3a, or 0x3b).",dcrc, phonon_channel,current_phonon.vgagain__multiplicative_factor_[phonon_channel]);
  }
  return valid_check;
}

bool check_ADCOffset_register(int dcrc, int phonon_channel, PHONON &current_phonon){
  bool valid_check = 1;
  if (current_phonon.adcoffset__v_[phonon_channel] > 4.){
    valid_check = 0;
    cm_msg(MERROR, frontend_name, "ERROR: Requested value for current_phonon[%d].adcoffset__v_[%d] of %f exceeds maximum of +4V. Keeping previous value for this Register (0x47, 0x4b, 0x51, 0x55)", dcrc, phonon_channel, current_phonon.adcoffset__v_[phonon_channel]);
  }
  if (current_phonon.adcoffset__v_[phonon_channel] < -4.){
    valid_check = 0;
    cm_msg(MERROR, frontend_name, "ERROR: Requested value for current_phonon[%d].adcoffset__v_[%d] of %f exceeds minimum of -4V. Keeping previous value for this Register (0x47, 0x4b, 0x51, or 0x55)", dcrc, phonon_channel, current_phonon.adcoffset__v_[phonon_channel]);
  }
  return valid_check;
}

bool check_LockpointAdjust_register(int dcrc, int phonon_channel, PHONON &current_phonon){
  int valid_check = 1;
  if (current_phonon.lockpointadjust__mv_[phonon_channel] > 27.){
    valid_check = 0;
    cm_msg(MERROR, frontend_name, "ERROR: Requested value for  current_phonon[%d].lockpointadjust__mv_[%d] of %f exceeds maximum of +27mV.  Keeping previous value for this Register (0x48, 0x4c, 0x52, 0x56)", dcrc, phonon_channel, current_phonon.lockpointadjust__mv_[phonon_channel]);
  }
  if (current_phonon.lockpointadjust__mv_[phonon_channel] < -27.){
    valid_check = 0;
    cm_msg(MERROR, frontend_name, "ERROR: Requested value for  current_phonon[%d].lockpointadjust__mv_[%d] of %f exceeds minimum of -27mV.  Keeping previous value for this Register (0x48, 0x4c, 0x52, 0x56)", dcrc, phonon_channel, current_phonon.lockpointadjust__mv_[phonon_channel]);
  }
  return valid_check;
}

bool check_SQUIDBias_register(int dcrc, int phonon_channel, PHONON &current_phonon){
  bool valid_check = 1;
  if (current_phonon.squidbias__ua_[phonon_channel] > 200.){
    valid_check = 0;
    cm_msg(MERROR, frontend_name, "ERROR: Requested value for current_phonon[%d].squidbias__ua_[%d] of %f exceeds maximum of +200uA. Keeping previous value for this register (ox49, 0x4d, 0x53, or 0x57)", dcrc, phonon_channel, current_phonon.squidbias__ua_[phonon_channel]);
  }
  if (current_phonon.squidbias__ua_[phonon_channel] < -200.){
    valid_check = 0;
    cm_msg(MERROR, frontend_name, "ERROR: Requested value for current_phonon[%d].squidbias__ua_[%d] of %f exceeds minimum of -200uA. Keeping previous value for this register (0x49, 0x4d, 0x53, or 0x57)", dcrc, phonon_channel, current_phonon.squidbias__ua_[phonon_channel]);
  }
  return valid_check;    
}

 bool check_QETBias_register(int dcrc, int phonon_channel, PHONON &current_phonon){
   bool valid_check = 1;
   if (current_phonon.qetbias__ua_[phonon_channel] > 1600){
     valid_check = 0;
     cm_msg(MERROR, frontend_name, "ERROR: Requested value for current_phonon[%d].qetbias__ua_[%d] of %f exceeds maximum of +1600uA. Keeping previous value for this Regiser (0x4a, 0x4e, 0x54, 0x58)", dcrc, phonon_channel,current_phonon.qetbias__ua_[phonon_channel]);
   }
   if (current_phonon.qetbias__ua_[phonon_channel] < -1600){
     valid_check = 0;
     cm_msg(MERROR, frontend_name, "ERROR: Requested value for current_phonon[%d].qetbias__ua_[%d] of %f exceeds minimum of -1600uA. Keeping previous value for this Register (0x4a, 0x4e, 0x54, 0x58)", dcrc, phonon_channel,current_phonon.qetbias__ua_[phonon_channel]);
   }
   return valid_check;
 }

bool check_phonon_polarity(int dcrc, int phonon_channel, PHONON &current_phonon){
  bool valid_check = 1;
  unsigned int polarity_unsigned = current_phonon.polarity[phonon_channel];
  if(polarity_unsigned > 3){
    valid_check = 0;
    cm_msg(MERROR, frontend_name, "ERROR: Requested value for current_phonon[%d].polarity[%d] of %d is greater than maximum of 3 or negative.  Keeping previous value for this Register (0x45 or 0x4f)",dcrc, phonon_channel,current_phonon.polarity[phonon_channel]);
  }
  return valid_check;
}   

bool check_phonon_pgagain(int dcrc, int phonon_channel, PHONON &current_phonon){
  bool valid_check = 1;
  unsigned int pgagain_unsigned = current_phonon.pgagain__1_2_4__or_8_[phonon_channel];
  if (dcrc_rev[dcrc] == 3) { // For Rev C boards, 1-7 are all valid settings
    if (pgagain_unsigned <1 || pgagain_unsigned>7) {
	valid_check = 0;
	cm_msg(MERROR, frontend_name, "ERROR: Requested value for current_phonon[%d].pgagain__1_2_4__or_8_[%d] of %i is not allowed for RevC board. Allowed values are 1-7.  Keeping previous value for this Register (0x45 or 0x4f).", dcrc, phonon_channel, current_phonon.pgagain__1_2_4__or_8_[phonon_channel]);
          }
  } else { // For Rev C.1, only valid settings are 1,2,4, and 8
	if((pgagain_unsigned != 1) && (pgagain_unsigned != 2) && (pgagain_unsigned != 4) && (pgagain_unsigned != 8)){
	  valid_check = 0;
	  cm_msg(MERROR, frontend_name, "ERROR: Requested value for current_phonon[%d].pgagain__1_2_4__or_8_[%d] of %i is not allowed for RevC.1 board. Allowed values are 1,2,4,8.  Keeping previous value for this Register (0x45 or 0x4f).", dcrc, phonon_channel, current_phonon.pgagain__1_2_4__or_8_[phonon_channel]);
 	       }
      }
  return valid_check;
  }


bool check_phonon_polarity_pgagain_two_channels(int dcrc, int start_channel, PHONON &current_phonon){
  bool valid_check = 1;
  unsigned int polarity_unsigned_1 = current_phonon.polarity[start_channel];
  unsigned int polarity_unsigned_2 = current_phonon.polarity[start_channel+1];
  unsigned int pgagain_unsigned_1 = current_phonon.pgagain__1_2_4__or_8_[start_channel];
  unsigned int pgagain_unsigned_2 = current_phonon.pgagain__1_2_4__or_8_[start_channel+1];
  if(polarity_unsigned_1 > 3){
    valid_check = 0;
    cm_msg(MERROR, frontend_name, "ERROR: Requested value for current_phonon[%d].polarity[%d] of %d is greater than maximum of 3 or negative.  Keeping previous value for this Register (0x45 or 0x4f)",dcrc, start_channel,current_phonon.polarity[start_channel]);
  }
  if(polarity_unsigned_2 > 3){
    valid_check = 0;
    cm_msg(MERROR, frontend_name, "ERROR: Requested value for current_phonon[%d].polarity[%d] of %d is greater than maximum of 3 or negative.  Keeping previous value for this Register (0x45 or 0x4f)",dcrc, start_channel+1,current_phonon.polarity[start_channel+1]);
  }
  if (dcrc_rev[dcrc] == 3) { // For Rev C boards, 1-7 are all valid settings
    if (pgagain_unsigned_1 <1 || pgagain_unsigned_1>7) {
      valid_check = 0;
      cm_msg(MERROR, frontend_name, "ERROR: Requested value for current_phonon[%d].pgagain__1_2_4__or_8_[%d] of %i is not allowed for RevC board. Allowed values are 1-7.  Keeping previous value for this Register (0x45 or 0x4f).", dcrc, start_channel, current_phonon.pgagain__1_2_4__or_8_[start_channel]);
    }
    if (pgagain_unsigned_2 <1 || pgagain_unsigned_2>7) {
      valid_check = 0;
      cm_msg(MERROR, frontend_name, "ERROR: Requested value for current_phonon[%d].pgagain__1_2_4__or_8_[%d] of %i is not allowed for RevC board. Allowed values are 1-7.  Keeping previous value for this Register (0x45 or 0x4f).", dcrc, start_channel+1, current_phonon.pgagain__1_2_4__or_8_[start_channel+1]);
    }
  }
  else { // For Rev C.1, only valid settings are 1,2,4, and 8
    if((pgagain_unsigned_1 != 1) && (pgagain_unsigned_1 != 2) && (pgagain_unsigned_1 != 4) && (pgagain_unsigned_1 != 8)){
      valid_check = 0;
      printf("within ...Two_channels\n\n");
      cm_msg(MERROR, frontend_name, "ERROR: Requested value for current_phonon[%d].pgagain__1_2_4__or_8_[%d] of %i is not allowed for RevC.1 board. Allowed values are 1,2,4,8.  Keeping previous value for this Register (0x45 or 0x4f).", dcrc, start_channel, current_phonon.pgagain__1_2_4__or_8_[start_channel]);
    }
    if((pgagain_unsigned_2 != 1) && (pgagain_unsigned_2 != 2) && (pgagain_unsigned_2 != 4) && (pgagain_unsigned_2 != 8)){
      valid_check = 0;
      cm_msg(MERROR, frontend_name, "ERROR: Requested value for current_phonon[%d].pgagain__1_2_4__or_8_[%d] of %i is not allowed for RevC.1 board. Allowed values are 1,2,4,8.  Keeping previous value for this Register (0x45 or 0x4f).", dcrc, start_channel+1, current_phonon.pgagain__1_2_4__or_8_[start_channel+1]);
    }
  }
  return valid_check;
}


int compute_0x45_0x4f_register(PHONON &current_phonon, int register_to_update, int dcrc){
   int Register_0x45_0x4f = 0;
   int phonon_channel;
   if(register_to_update == 0x45) phonon_channel = 0;
   if(register_to_update == 0x4f) phonon_channel = 2;
   Register_0x45_0x4f += current_phonon.polarity[phonon_channel];
   Register_0x45_0x4f += (current_phonon.polarity[phonon_channel+1] << 8);
   int PGAGain_digvalue1,PGAGain_digvalue2;
   if (dcrc_rev[dcrc] == 3.0) { // For RevC, use value as is
     PGAGain_digvalue1 = current_phonon.pgagain__1_2_4__or_8_[phonon_channel];
   } else { // For RevC.1, calculate bit values for PGA gain
     PGAGain_digvalue1 = 3;
     if (current_phonon.pgagain__1_2_4__or_8_[phonon_channel] == 4) PGAGain_digvalue1 = 2;
     if (current_phonon.pgagain__1_2_4__or_8_[phonon_channel] == 2) PGAGain_digvalue1 = 1;
     if (current_phonon.pgagain__1_2_4__or_8_[phonon_channel] == 1) PGAGain_digvalue1 = 0;
   }
   Register_0x45_0x4f += (PGAGain_digvalue1 << 4);
   if (dcrc_rev[dcrc] == 3.0) { // For RevC, use value as is
     PGAGain_digvalue2 = current_phonon.pgagain__1_2_4__or_8_[phonon_channel+1];
   } else {  // For RevC.1, calculate bit values for PGA Gain
     PGAGain_digvalue2 = 3;
     if (current_phonon.pgagain__1_2_4__or_8_[phonon_channel+1] == 4) PGAGain_digvalue2 = 2;
     if (current_phonon.pgagain__1_2_4__or_8_[phonon_channel+1] == 2) PGAGain_digvalue2 = 1;
     if (current_phonon.pgagain__1_2_4__or_8_[phonon_channel+1] == 1) PGAGain_digvalue2 = 0;
   }



   Register_0x45_0x4f += (PGAGain_digvalue2 << (8+4));	
   if(current_phonon.adcsignalsource[phonon_channel])
     Register_0x45_0x4f += (0x1 << 2);
   if(current_phonon.adcsignalsource[phonon_channel+1])
     Register_0x45_0x4f += (0x1 << (8+2));
   if(current_phonon.testsignalconnect[phonon_channel])
     Register_0x45_0x4f += (0x1 << 3);
   if(current_phonon.testsignalconnect[phonon_channel+1])
     Register_0x45_0x4f += (0x1 << (8+3));
   if(current_phonon.squidsource[phonon_channel])
     Register_0x45_0x4f += (0x1 << 7);
   if(current_phonon.squidsource[phonon_channel+1])
     Register_0x45_0x4f += (0x1 << (8+7));
   return Register_0x45_0x4f;
 }

