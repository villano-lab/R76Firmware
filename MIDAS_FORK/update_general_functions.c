#include "midas.h"
#include "utils1.h"

#include "constants.h"
#include "write_DCRC.h"
#include "convert_functions.h"

#include "struct_general.h"
#include "struct_led.h"
#include "struct_test_signal.h"
#include "update_general_functions.h"

#include "update_led_functions.h"
#include "update_test_signal_functions.h"

extern int masterslave[MAX_DCRCs+1];
extern int gDcrcPort[MAX_DCRCs+1];


extern char *frontend_name;
extern BOOL dcrc_enabled[MAX_DCRCs+1];
extern BOOL dummyreadout;
extern KOsocket *gDataSocket[MAX_DCRCs+1];


void compare_overwrite_general(int whichtower, int dcrc, int update_mode, GENERAL &old_general, GENERAL &current_general, LED &current_led, TESTSIGNAL &current_test_signal){
  printf("Within compare_overwrite_general--DCRC%d--update_mode:%d\n", dcrc, update_mode);
  printf("current_general[%d].usecalibrationregisters= %d\n", dcrc, current_general.usecalibrationregisters);
  printf("current_general[%d].chargewaveformlength= %d\n", dcrc, current_general.chargewaveformlength);
  printf("current_general[%d].phononwaveformlength= %d\n", dcrc, current_general.phononwaveformlength);
  printf("current_general[%d].masterslavefree= %d\n", dcrc, current_general.masterslavefree);
  printf("current_general[%d].lvdsbusdir= %d\n", dcrc, current_general.lvdsbusdir);
  printf("current_general[%d].byteswapenable= %d\n", dcrc, current_general.byteswapenable);
  printf("current_general[%d].chargeadcreset= %d\n", dcrc, current_general.chargeadcreset);
  printf("current_general[%d].vxofreqlockref= %d\n", dcrc, current_general.vxofreqlockref);
  printf("current_general[%d].enableadcwritestosdram= %d\n", dcrc, current_general.enableadcwritestosdram);
  printf("current_general[%d].enableadcavgby64= %d\n", dcrc, current_general.enableadcavgby64);
  printf("current_general[%d].enablewritingddsphasedata= %d\n", dcrc, current_general.enablewritingddsphasedata);
  printf("current_general[%d].triggersource= %d\n", dcrc, current_general.triggersource);
  printf("current_general[%d].fetheatenable= %d\n", dcrc, current_general.fetheatenable);
  printf("current_general[%d].qetbiasrangeselect= %d\n", dcrc, current_general.qetbiasrangeselect);
  printf("current_general[%d].chargeprepulsesamples= %d\n", dcrc, current_general.chargeprepulsesamples);
  printf("current_general[%d].phononprepulsesamples= %d\n", dcrc, current_general.phononprepulsesamples);
  printf("\n");

  if(update_mode){
    //first make sure the settings that are possibly invalid for this register are all valid.
    //if invalid, make this error clear to the user through comment flags
    //(which is accomplished within the function)
    int valid_check = check_vxofreqlockref(dcrc, current_general, old_general); 
    //if a setting is invalid, don't write the register value.  we will keep the previous settings.
    if(valid_check){
      if(dcrc_enabled[dcrc] && !dummyreadout){
	//compute the new register value with the valid new settings, just written to
	//the old_general struct
	int Register_0x15 = compute_0x15_register(dcrc, current_general);
      	int write_success = write_DCRC(gDataSocket[dcrc], General_register, Register_0x15);
	//now write the new settings to the readback (mirrored) odb
	//but only do so if the card was actually written to
	if(write_success >= 0){
	  //first overwrite the old struct
	  old_general.lvdsbusdir=current_general.lvdsbusdir;
	  old_general.byteswapenable=current_general.byteswapenable;
	  old_general.chargeadcreset=current_general.chargeadcreset;
	  old_general.vxofreqlockref=current_general.vxofreqlockref;
	  old_general.enableadcwritestosdram=current_general.enableadcwritestosdram;
	  old_general.enableadcavgby64=current_general.enableadcavgby64;
	  old_general.enablewritingddsphasedata=current_general.enablewritingddsphasedata;
	  old_general.triggersource=current_general.triggersource;
	  //now write the the readback odb
	  char set_str[80];
	  sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/General/LVDSBusDir", whichtower, dcrc);
	  odbWriteBool(set_str, 0, current_general.lvdsbusdir);
	  cm_msg(MINFO, frontend_name, "LVDSBusDir=%d written to Tower%02d DCRC%d and ReadbackODB", current_general.lvdsbusdir, whichtower, dcrc);
	  sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/General/ByteSwapEnable", whichtower, dcrc);
	  odbWriteBool(set_str, 0, current_general.byteswapenable);
	  cm_msg(MINFO, frontend_name, "ByteSwapEnable=%d written to Tower%02d DCRC%d and ReadbackODB", current_general.byteswapenable, whichtower, dcrc);
	  sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/General/ChargeADCReset", whichtower, dcrc);
	  odbWriteBool(set_str, 0, current_general.chargeadcreset);
	  cm_msg(MINFO, frontend_name, "ChargeADCReset=%d written to Tower%02d DCRC%d and ReadbackODB", current_general.chargeadcreset, whichtower, dcrc);
	  sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/General/VXOFreqLockRef", whichtower, dcrc);
	  odbWriteInt(set_str, 0, current_general.vxofreqlockref);
	  cm_msg(MINFO, frontend_name, "VXOFreqLockRef=%d written to Tower%02d DCRC%d and ReadbackODB", current_general.vxofreqlockref, whichtower, dcrc);
	  sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/General/EnableADCWritesToSDRam", whichtower, dcrc);
	  odbWriteBool(set_str, 0, current_general.enableadcwritestosdram);
	  cm_msg(MINFO, frontend_name, "EnableADCWritestoSDRam=%d written to Tower%02d DCRC%d and ReadbackODB", current_general.enableadcwritestosdram, whichtower, dcrc);
	  sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/General/EnableADCAvgBy64", whichtower, dcrc);
	  odbWriteBool(set_str, 0, current_general.enableadcavgby64);
	  cm_msg(MINFO, frontend_name, "EnableADCAvgBy64=%d written to Tower%02d DCRC%d and ReadbackODB", current_general.enableadcavgby64, whichtower, dcrc);
	  sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/General/EnableWritingDDSPhaseData", whichtower, dcrc);
	  odbWriteBool(set_str, 0, current_general.enablewritingddsphasedata);
	  cm_msg(MINFO, frontend_name, "EnableWritingDDSPhaseData=%d written to Tower%02d DCRC%d and ReadbackODB", current_general.enablewritingddsphasedata, whichtower, dcrc);
	  sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/General/TriggerSource", whichtower, dcrc);
	  odbWriteBool(set_str, 0, current_general.triggersource);
	  cm_msg(MINFO, frontend_name, "TriggerSource=%d written to Tower%02d DCRC%d and ReadbackODB", current_general.triggersource, whichtower, dcrc);
	  printf ("Register_0x15[%d] = %d written to dcrc\n", 0, Register_0x15);
	}
      }
    }
  }
  else{
    //first make sure the settings that are possibly invalid for this register are all valid.
    //if invalid, make this error clear to the user through comment flags
    //(which is accomplished within the function)
    bool valid_check = check_vxofreqlockref(dcrc, current_general, old_general); 
    //if a setting is invalid, don't write the register value.  we will keep the previous settings.
    if(valid_check){
      int changed_variable_flag = 0;
      if(old_general.lvdsbusdir != current_general.lvdsbusdir){
	printf("current_general[%d].lvdbusdir changed\n", dcrc);
	changed_variable_flag = 1;
	//old_general.lvdsbusdir = current_general.lvdsbusdir;
	//printf("old_general[%d].lvdsbusdir overwritten\n", dcrc);
      }
      if(old_general.byteswapenable != current_general.byteswapenable){
	printf("current_general[%d].byteswapenable changed\n", dcrc);
	changed_variable_flag = 1;
	//old_general.byteswapenable = current_general.byteswapenable;
	//printf("old_general[%d].byteswapenable overwritten\n", dcrc);
      }
      if(old_general.chargeadcreset != current_general.chargeadcreset){
	printf("current_general[%d].chargeadcreset changed\n", dcrc);
	changed_variable_flag = 1;
	//old_general.chargeadcreset = current_general.chargeadcreset;
	//printf("old_general[%d].chargeadcreset overwritten\n", dcrc);
      }
      if(old_general.vxofreqlockref != current_general.vxofreqlockref){
 	printf("current_general[%d].vxofreqlockref changed\n", dcrc);
	changed_variable_flag = 1;
	//old_general.vxofreqlockref = current_general.vxofreqlockref;
	//printf("old_general[%d].vxofreqlockref overwritten\n", dcrc);
      }
      if(old_general.enableadcwritestosdram != current_general.enableadcwritestosdram){
	printf("current_general[%d].enableadcwritestosdram changed\n", dcrc);
	changed_variable_flag = 1;
	//old_general.enableadcwritestosdram = current_general.enableadcwritestosdram;
	//printf("old_general[%d].enableadcwritestosdram overwritten\n", dcrc);
      }
      if(old_general.enableadcavgby64 != current_general.enableadcavgby64){
	printf("current_general[%d].enableadcavgby64 changed\n", dcrc);
	changed_variable_flag = 1;
	//old_general.enableadcavgby64 = current_general.enableadcavgby64;
	//printf("old_general[%d].enableadcavgby64 overwritten\n", dcrc);
      }
      if(old_general.enablewritingddsphasedata != current_general.enablewritingddsphasedata){
	printf("current_general[%d].enablewritingddsphasedata changed\n", dcrc);
	changed_variable_flag = 1;
	//old_general.enablewritingddsphasedata = current_general.enablewritingddsphasedata;
	//printf("old_general[%d].enablewritingddsphasedata overwritten\n", dcrc);
      }
      if(old_general.triggersource != current_general.triggersource){
	printf("current_general[%d].triggersource changed\n", dcrc);
	changed_variable_flag = 1;
	//old_general.triggersource = current_general.triggersource;
	//printf("old_general[%d].triggersource overwritten\n", dcrc);
      }
      if(changed_variable_flag && dcrc_enabled[dcrc] && !dummyreadout){
	int Register_0x15 = compute_0x15_register(dcrc, current_general);
	int write_success = write_DCRC(gDataSocket[dcrc], General_register, Register_0x15);
	//now write the new settings to the readback (mirrored) odb
	//but only do so if the card was actually written to
	//the program could be improved--only one variable
	//was updated so if we keep track of which one was
	//we would only need to overwrite that variable in the
	//readback odb and in the old local struct.
	if(write_success >= 0){
	  //first overwrite the old struct
	  old_general.lvdsbusdir=current_general.lvdsbusdir;
	  old_general.byteswapenable=current_general.byteswapenable;
	  old_general.chargeadcreset=current_general.chargeadcreset;
	  old_general.vxofreqlockref=current_general.vxofreqlockref;
	  old_general.enableadcwritestosdram=current_general.enableadcwritestosdram;
	  old_general.enableadcavgby64=current_general.enableadcavgby64;
	  old_general.enablewritingddsphasedata=current_general.enablewritingddsphasedata;
	  old_general.triggersource=current_general.triggersource;
	  printf("entire old_general[%d] struct overwritten\n", dcrc);
	  //now write to the readback ODB
	  char set_str[80];
	  sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/General/LVDSBusDir", whichtower, dcrc);
	  odbWriteBool(set_str, 0, current_general.lvdsbusdir);
	  cm_msg(MINFO, frontend_name, "LVDSBusDir=%d written to Tower%02d DCRC%d and ReadbackODB", current_general.lvdsbusdir, whichtower, dcrc);
	  sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/General/ByteSwapEnable", whichtower, dcrc);
	  odbWriteBool(set_str, 0, current_general.byteswapenable);
	  cm_msg(MINFO, frontend_name, "ByteSwapEnable=%d written to Tower%02d DCRC%d and ReadbackODB", current_general.byteswapenable, whichtower, dcrc);
	  sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/General/ChargeADCReset", whichtower, dcrc);
	  odbWriteBool(set_str, 0, current_general.chargeadcreset);
	  cm_msg(MINFO, frontend_name, "ChargeADCReset=%d written to Tower%02d DCRC%d and ReadbackODB", current_general.chargeadcreset, whichtower, dcrc);
	  sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/General/VXOFreqLockRef", whichtower, dcrc);
	  odbWriteInt(set_str, 0, current_general.vxofreqlockref);
	  cm_msg(MINFO, frontend_name, "VXOFreqLockRef=%d written to Tower%02d DCRC%d and ReadbackODB", current_general.vxofreqlockref, whichtower, dcrc);
	  sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/General/EnableADCWritesToSDRam", whichtower, dcrc);
	  odbWriteBool(set_str, 0, current_general.enableadcwritestosdram);
	  cm_msg(MINFO, frontend_name, "EnableADCWritestoSDRam=%d written to Tower%02d DCRC%d and ReadbackODB", current_general.enableadcwritestosdram, whichtower, dcrc);
	  sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/General/EnableADCAvgBy64", whichtower, dcrc);
	  odbWriteBool(set_str, 0, current_general.enableadcavgby64);
	  cm_msg(MINFO, frontend_name, "EnableADCAvgBy64=%d written to Tower%02d DCRC%d and ReadbackODB", current_general.enableadcavgby64, whichtower, dcrc);
	  sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/General/EnableWritingDDSPhaseData", whichtower, dcrc);
	  odbWriteBool(set_str, 0, current_general.enablewritingddsphasedata);
	  cm_msg(MINFO, frontend_name, "EnableWritingDDSPhaseData=%d written to Tower%02d DCRC%d and ReadbackODB", current_general.enablewritingddsphasedata, whichtower, dcrc);
	  sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/General/TriggerSource", whichtower, dcrc);
	  odbWriteBool(set_str, 0, current_general.triggersource);
	  cm_msg(MINFO, frontend_name, "TriggerSource=%d written to Tower%02d DCRC%d and ReadbackODB", current_general.triggersource, whichtower, dcrc);
	  printf ("Register_0x15 = %d written to dcrc\n", Register_0x15);
	}
      }
    }
  }

  //here we only write to the dcrc if we are not in update_mode = 1.  this is
  // because this register depends on variables in the led struct, which has
  // not yet been populated when update_mode = 1.  we don't want to write the
  // wrong value to the dcrc, even if it will be momentarily overwritten when
  // we establish the hotlink to the led portion of the ODB.  instead, when
  // update_mode = 1, we only write in the led hotlink

  //added in the or condition as part of the condition
  if(current_general.fetheatenable != old_general.fetheatenable){
    if(!update_mode) printf("current_general[%d].fetheatenable changed\n", dcrc);
    if(!update_mode && dcrc_enabled[dcrc] && !dummyreadout){
      int Register_0x30 = compute_0x30_register(current_led, current_general);
      int write_success = write_DCRC(gDataSocket[dcrc], LEDEnableConnectStepZap15VPowerHeat_register, Register_0x30);
      //now write the new settings to the readback (mirrored) odb
      //but only do so if the card was actually written to
      if(write_success >= 0){
	char set_str[80];
	//first update the old struct
	old_general.fetheatenable = current_general.fetheatenable;
	printf("old_general[%d].fetheatenable overwritten\n", dcrc);
	//now write to the readback
	sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/General/FETHeatEnable", whichtower, dcrc);
	odbWriteBool(set_str, 0, current_general.fetheatenable);
	cm_msg(MINFO, frontend_name, "FETHeatEnable=%d written to Tower%02d DCRC%d and ReadbackODB", current_general.fetheatenable, whichtower, dcrc);
	printf ("Register_0x30 = %d written to dcrc\n", Register_0x30);
      }
    }
  }

  //here we only write to the dcrc if we are not in update_mode = 1.  this is
  // because this register depends on variables in the test signal struct,
  // which has not yet been populated when update_mode = 1.  we don't want to
  // write the wrong value to the dcrc, even if it will be momentarily
  // overwritten when we establish the hotlink to the test signal portion of
  // the ODB.  instead, when update_mode = 1, we only write this register to
  // the dcrc once the test signal hotlink function is called.
  if(current_general.qetbiasrangeselect != old_general.qetbiasrangeselect){
    if(!update_mode) printf("current_general[%d].qetbiasrangeselect changed\n", dcrc);
    if(!update_mode && dcrc_enabled[dcrc] && !dummyreadout){
      int Register_0x3c = compute_0x3c_register(dcrc, current_test_signal, current_general);
      printf ("Register_0x3c = %d written to dcrc\n", Register_0x3c);
      int write_success = write_DCRC(gDataSocket[dcrc], TestSignal_register, Register_0x3c);
      //now write to the mirrored odb
      //now write the new settings to the readback (mirrored) odb
      //but only do so if the card was actually written to
      if(write_success >= 0){
	//first update the old struct
	old_general.qetbiasrangeselect = current_general.qetbiasrangeselect;
	printf("old_general[%d].qetbiasrangeselect overwritten\n", dcrc);
	//now write to the readback ODB
	char set_str[80];
	sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/General/QETBiasRangeSelect", whichtower, dcrc);
	odbWriteBool(set_str, 0, current_general.qetbiasrangeselect);
	cm_msg(MINFO, frontend_name, "QETBiasRangeSelect=%d written to Tower%02d DCRC%d and ReadbackODB", current_general.qetbiasrangeselect, whichtower, dcrc);
	printf ("Register_0x3c = %d written to dcrc\n", Register_0x3c);
      }
    }
  }
}

bool check_vxofreqlockref(int dcrc, GENERAL &current_general, GENERAL &old_general){
  unsigned int vxofreqlockref_unsigned = current_general.vxofreqlockref;
  bool valid_check = 1;
  if(masterslave[dcrc] ==2) {
    //need to update both the unsigned int and struct value because the unsigned
    //int is the variable that is checked against
    vxofreqlockref_unsigned = 2;
    current_general.vxofreqlockref = 2;
    cm_msg(MINFO, frontend_name, "INFO: Because DCRC%i set to slave mode, overriding  current_general.vxofreqlockref with value 0x2", dcrc);
  }
  if(vxofreqlockref_unsigned < 0 || vxofreqlockref_unsigned > 2){
    valid_check = 0;
    cm_msg(MERROR, frontend_name, "ERROR: Requested value for current_general[%d].vxofreqlockref of %i is outside of valid range (0-2). Keeping previous value for Register 0x15", dcrc, current_general.vxofreqlockref);
  }
  return valid_check;
}

int compute_0x15_register(int dcrc, GENERAL &current_general){
  int Register_0x15 = 0;
  if(current_general.lvdsbusdir) Register_0x15 += 0x1;
  if(current_general.byteswapenable) Register_0x15 += 0x4;
  if(current_general.chargeadcreset) Register_0x15 += 0x2000;
  Register_0x15 += (current_general.vxofreqlockref << 3);
  if(current_general.enableadcwritestosdram) Register_0x15 += (0x1 << 5);
  if(current_general.enableadcavgby64) Register_0x15 += (0x1 << 6);
  if(current_general.enablewritingddsphasedata) Register_0x15 += (0x1 << 11);
  if(current_general.triggersource) Register_0x15 += (0x1 <<12);
  return Register_0x15;
}
