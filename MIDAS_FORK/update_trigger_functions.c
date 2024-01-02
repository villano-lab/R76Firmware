#include "midas.h" 
#include "utils1.h"
#include "constants.h"
#include "write_DCRC.h"
#include "convert_functions.h"

#include "struct_trigger.h"
#include "update_trigger_functions.h"


extern char *frontend_name;
extern BOOL dcrc_enabled[MAX_DCRCs+1];
extern BOOL dummyreadout;
extern KOsocket *gDataSocket[MAX_DCRCs+1];

void compare_overwrite_trigger(int whichtower, int dcrc, int update_mode, TRIGGER &old_trigger, TRIGGER &current_trigger){

  printf("Within compare_overwrite_trigger--DCRC%d--update_mode:%d\n", dcrc, update_mode);
  for(int phonon_channel = 0; phonon_channel < MAX_PHONON_CHANNEL; phonon_channel++){
    printf("trigger[%d].phonontriggerenable[%d]= %d\n", dcrc, phonon_channel,  current_trigger.phonontriggerenable[phonon_channel]);
  }
  for(int charge_channel = 0; charge_channel < MAX_CHARGE_CHANNEL; charge_channel++){
    printf("trigger[%d].chargetriggerenable[%d]= %d\n", dcrc, charge_channel,  current_trigger.chargetriggerenable[charge_channel]);
  }
  printf("trigger[%d].phonontriggerbaselinelength= %d\n", dcrc, current_trigger.phonontriggerbaselinelength);
  printf("trigger[%d].chargetriggerbaselinelength= %d\n", dcrc, current_trigger.chargetriggerbaselinelength);
  printf("trigger[%d].phonontriggersamplelength= %d\n", dcrc, current_trigger.phonontriggersamplelength);
  printf("trigger[%d].chargetriggersamplelength= %d\n", dcrc, current_trigger.chargetriggersamplelength);
  for(int phonon_channel = 0; phonon_channel < MAX_PHONON_CHANNEL; phonon_channel++){
    printf("trigger[%d].phonontriggerthreshold[%d]= %d\n", dcrc, phonon_channel,  current_trigger.phonontriggerthreshold[phonon_channel]);
  }
  for(int charge_channel = 0; charge_channel < MAX_CHARGE_CHANNEL; charge_channel++){
    printf("trigger[%d].chargetriggerthreshold[%d]= %d\n", dcrc, charge_channel,  current_trigger.chargetriggerthreshold[charge_channel]);
  }
  printf("\n");

  if(update_mode){
    if(dcrc_enabled[dcrc] && !dummyreadout){
      int Register_0x17 = compute_0x17_register(current_trigger);
      int write_success = write_DCRC(gDataSocket[dcrc], PhononChargeTriggerEnable_register, Register_0x17);
      //now write the new value to the mirrored odb
      //now write the new settings to the readback (mirrored) odb
      //but only do so if the card was actually written to
      if(write_success >= 0){
	//first update the old struct
	for(int phonon_channel = 0; phonon_channel < MAX_PHONON_CHANNEL; phonon_channel++){
	  old_trigger.phonontriggerenable[phonon_channel] = current_trigger.phonontriggerenable[phonon_channel];
	}
	for(int charge_channel = 0; charge_channel < MAX_CHARGE_CHANNEL; charge_channel++){
	  old_trigger.chargetriggerenable[charge_channel] = current_trigger.chargetriggerenable[charge_channel];
	}
	//now update the readback ODB
	char set_str[80];
	sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/Trigger/PhononTriggerEnable", whichtower, dcrc);
	for(int phonon_channel = 0; phonon_channel < MAX_PHONON_CHANNEL; phonon_channel++){
	  odbWriteBool(set_str, phonon_channel, current_trigger.phonontriggerenable[phonon_channel]);
	  cm_msg(MINFO, frontend_name, "PhononTriggerEnable[%d]=%d written to Tower%02d DCRC%d (Register 0x17) and ReadbackODB", phonon_channel, current_trigger.phonontriggerenable[phonon_channel], whichtower, dcrc);
	}
	sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/Trigger/ChargeTriggerEnable", whichtower, dcrc);
	for(int charge_channel = 0; charge_channel < MAX_CHARGE_CHANNEL; charge_channel++){
	  odbWriteBool(set_str, charge_channel, current_trigger.chargetriggerenable[charge_channel]);
	  cm_msg(MINFO, frontend_name, "ChargeTriggerEnable[%d]=%d written to Tower%02d DCRC%d (Register 0x17) and ReadbackODB", charge_channel, current_trigger.chargetriggerenable[charge_channel], whichtower, dcrc);
	}
	printf("Register_0x17 = %d written to DCRC\n", Register_0x17);
      }
    }
  }
  else{
    int changed_variable_flag = 0;
    for(int phonon_channel = 0; phonon_channel < MAX_PHONON_CHANNEL; phonon_channel++){
      if(current_trigger.phonontriggerenable[phonon_channel] != old_trigger.phonontriggerenable[phonon_channel]){
	printf("current_trigger[%d].phonontriggerenable[%d] changed\n", dcrc, phonon_channel);
	changed_variable_flag = 1;
      }
    }
    for(int charge_channel = 0; charge_channel < MAX_CHARGE_CHANNEL; charge_channel++){
      if(current_trigger.chargetriggerenable[charge_channel] != old_trigger.chargetriggerenable[charge_channel]){
	printf("current_trigger[%d].chargetriggerenable[%d] changed\n", dcrc, charge_channel);
	changed_variable_flag = 1;
      }
    }
    if(changed_variable_flag && dcrc_enabled[dcrc] && !dummyreadout){
      int Register_0x17 = compute_0x17_register(current_trigger);
      int write_success = write_DCRC(gDataSocket[dcrc], PhononChargeTriggerEnable_register, Register_0x17);
      //now write the new value to the mirrored odb
      //now write the new settings to the readback (mirrored) odb
      //but only do so if the card was actually written to
      if(write_success >= 0){
	char set_str[80];
	sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/Trigger/PhononTriggerEnable", whichtower, dcrc);
	for(int phonon_channel = 0; phonon_channel < MAX_PHONON_CHANNEL; phonon_channel++){
	  //first update the old struct
	  old_trigger.phonontriggerenable[phonon_channel] = current_trigger.phonontriggerenable[phonon_channel];
	  printf("old_trigger[%d].phonontriggerenable[%d] overwritten\n", dcrc, phonon_channel);
	  //now update the readback ODB
	  odbWriteBool(set_str, phonon_channel, current_trigger.phonontriggerenable[phonon_channel]);
	  cm_msg(MINFO, frontend_name, "PhononTriggerEnable[%d]=%d written to Tower%02d DCRC%d (Register 0x17) and ReadbackODB", phonon_channel, current_trigger.phonontriggerenable[phonon_channel], whichtower, dcrc);
	}
	sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/Trigger/ChargeTriggerEnable", whichtower, dcrc);
	for(int charge_channel = 0; charge_channel < MAX_CHARGE_CHANNEL; charge_channel++){
	  //first update the old struct
	  old_trigger.chargetriggerenable[charge_channel] = current_trigger.chargetriggerenable[charge_channel];
	  printf("old_trigger[%d].chargetriggerenable[%d] overwritten\n", dcrc, charge_channel);
	  //now update the readback ODB
	  odbWriteBool(set_str, charge_channel, current_trigger.chargetriggerenable[charge_channel]);
	  cm_msg(MINFO, frontend_name, "ChargeTriggerEnable[%d]=%d written to Tower%02d DCRC%d (Register 0x17) and ReadbackODB", charge_channel, current_trigger.chargetriggerenable[charge_channel], whichtower, dcrc);
	}
	printf("Register_0x17 = %d written to DCRC\n", Register_0x17);
      }
    }
  }
  
  if(update_mode || current_trigger.phonontriggerbaselinelength != old_trigger.phonontriggerbaselinelength || current_trigger.chargetriggerbaselinelength != old_trigger.chargetriggerbaselinelength){
    if(!update_mode) printf("current_trigger[%d].phonontriggerbaselinelength or current_trigger[%d].chargetriggerbaselinelength changed\n", dcrc, dcrc);
    //check to make sure the settings are valid
    bool valid_check = check_0x18_register(dcrc, current_trigger);
    //update old_trigger and compute/write the DCRC register value
    // only if the settings are valid otherwise don't write any new value
    if(valid_check){
      int Register_0x18 = 0;
      //need unsigned values because these values should not be negative.
      //if the values in the struct are negative, the unsigned variables
      // will be very large and out of the valid range
      unsigned int phonontriggerbaselinelength_unsigned = current_trigger.phonontriggerbaselinelength;
      unsigned int chargetriggerbaselinelength_unsigned = current_trigger.chargetriggerbaselinelength;
      if(dcrc_enabled[dcrc] && !dummyreadout){
	Register_0x18 = phonontriggerbaselinelength_unsigned;
	Register_0x18 += (chargetriggerbaselinelength_unsigned << 8);
	int write_success = write_DCRC(gDataSocket[dcrc], PhononChargeTriggerBaselineLength_register, Register_0x18);
	//write updated setting to the readback odb
	//now write the new settings to the readback (mirrored) odb
	//but only do so if the card was actually written to
	if(write_success >= 0){
	  //first update the old struct
	  old_trigger.phonontriggerbaselinelength = current_trigger.phonontriggerbaselinelength;
	  old_trigger.chargetriggerbaselinelength = current_trigger.chargetriggerbaselinelength;
	  if(!update_mode) printf("old_trigger.phonontriggerbaselinelength and old_trigger.chargtriggerbaselinelength overwritten\n");
	  //now update the readback ODB
	  char set_str[80];
	  sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/Trigger/PhononTriggerBaselineLength", whichtower, dcrc);
	  odbWriteInt(set_str, 0, current_trigger.phonontriggerbaselinelength);
	  cm_msg(MINFO, frontend_name, "PhononTriggerBaselineLength=%d written to Tower%02d DCRC%d (Register 0x18) and ReadbackODB", current_trigger.phonontriggerbaselinelength, whichtower, dcrc);
	  sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/Trigger/ChargeTriggerBaselineLength", whichtower, dcrc);
	  odbWriteInt(set_str, 0, current_trigger.chargetriggerbaselinelength);
	  cm_msg(MINFO, frontend_name, "ChargeTriggerBaselineLength=%d written to Tower%02d DCRC%d (Register 0x18) and ReadbackODB", current_trigger.chargetriggerbaselinelength, whichtower, dcrc);
	  printf("Register_0x18 = %d written to DCRC\n", Register_0x18);
	}
      }
    }
  }

  if(update_mode || current_trigger.phonontriggersamplelength != old_trigger.phonontriggersamplelength || current_trigger.chargetriggersamplelength != old_trigger.chargetriggersamplelength){
    if(!update_mode) printf("current_trigger[%d].phonontriggersamplelength or current_trigger[%d].chargetriggersamplelength changed\n", dcrc, dcrc);
    //check to make sure the settings are valid
    bool valid_check = check_0x19_register(dcrc, current_trigger);
    //update old_trigger and compute/write the DCRC register value
    // only if the settings are valid otherwise don't write any new value
    if(valid_check){
      int Register_0x19 = 0;
      //need unsigned values because these values should not be negative.
      //if the values in the struct are negative, the unsigned variables
      // will be very large and out of the valid range
      unsigned int phonontriggersamplelength_unsigned = current_trigger.phonontriggersamplelength;
      unsigned int chargetriggersamplelength_unsigned = current_trigger.chargetriggersamplelength; 
      if(dcrc_enabled[dcrc] && !dummyreadout){
	Register_0x19 = phonontriggersamplelength_unsigned;
	Register_0x19 += (chargetriggersamplelength_unsigned << 8);
	int write_success = write_DCRC(gDataSocket[dcrc], PhononChargeTriggerSampleLength_register, Register_0x19);
	//write updated setting to the readback odb
	//now write the new settings to the readback (mirrored) odb
	//but only do so if the card was actually written to
	if(write_success >= 0){
	  //first overwrite the old struct
	  //if invalid values are requested, a valid old_trigger can still be checked against
	  //in subsequent changes because old_trigger will not have been overwritten
	  old_trigger.phonontriggersamplelength = current_trigger.phonontriggersamplelength;
	  old_trigger.chargetriggersamplelength = current_trigger.chargetriggersamplelength;
	  if(!update_mode) printf("old_trigger.phonontriggersamplelength and old_trigger.chargtriggersamplelength overwritten\n");
	  //now update the readback ODB
	  char set_str[80];
	  sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/Trigger/PhononTriggerSampleLength", whichtower, dcrc);
	  odbWriteInt(set_str, 0, current_trigger.phonontriggersamplelength);
	  cm_msg(MINFO, frontend_name, "PhononTriggerSampleLength=%d written to Tower%02d DCRC%d (Register 0x19) and ReadbackODB", current_trigger.phonontriggersamplelength, whichtower, dcrc);
	  sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/Trigger/ChargeTriggerSampleLength", whichtower, dcrc);
	  odbWriteInt(set_str, 0, current_trigger.chargetriggersamplelength);
	  cm_msg(MINFO, frontend_name, "ChargeTriggerSampleLength=%d written to Tower%02d DCRC%d (Register 0x19) and ReadbackODB", current_trigger.chargetriggersamplelength, whichtower, dcrc);
	  printf("Register_0x19 = %d written to DCRC\n", Register_0x19);
	}
      }
    }
  }
  //define this string for updating the readback part
  //of the ODB, which will be done if any setting is
  //written to the DCRC.
  char set_str[80];
  sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/Trigger/PhononTriggerThreshold", whichtower, dcrc);  
  for(int phonon_channel = 0; phonon_channel < MAX_PHONON_CHANNEL; phonon_channel++)
    {
      if(update_mode || current_trigger.phonontriggerthreshold[phonon_channel] != old_trigger.phonontriggerthreshold[phonon_channel]){
	if(!update_mode) printf("current_trigger[%d].phonontriggerthreshold[%d] changed\n", dcrc, phonon_channel);
	//first check if the changed variable is valid
	bool valid_check = check_phonontriggerthreshold_register(dcrc, phonon_channel, current_trigger);
	if(valid_check){
	  if(dcrc_enabled[dcrc] && !dummyreadout){
	    int write_success = write_DCRC(gDataSocket[dcrc], PhononTriggerThreshold_register[phonon_channel], current_trigger.phonontriggerthreshold[phonon_channel]);
	    //write updated setting to the readback odb
	    //now write the new settings to the readback (mirrored) odb
	    //but only do so if the card was actually written to
	    if(write_success >= 0){
	      //first write to the old struct
	      old_trigger.phonontriggerthreshold[phonon_channel] = current_trigger.phonontriggerthreshold[phonon_channel];
	      if(!update_mode) printf("old_trigger[%d].phonontriggerthreshold[%d] overwritten\n", dcrc, phonon_channel);
	      //now overwrite the old ODB
	      odbWriteInt(set_str, phonon_channel, current_trigger.phonontriggerthreshold[phonon_channel]);
	      cm_msg(MINFO, frontend_name, "PhononTriggerTreshold[%d]=%d written to Tower%02d DCRC%d and ReadbackODB", phonon_channel, current_trigger.phonontriggerthreshold[phonon_channel], whichtower, dcrc);
	    }
	  }
	}
      }
    }
  //update set_str to the ChargeTriggerThreshold variable
  //because now we will be checking to see if any of those
  //variables were written to the dcrc
  sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/Trigger/ChargeTriggerThreshold", whichtower, dcrc);  
  for(int charge_channel = 0; charge_channel < MAX_CHARGE_CHANNEL; charge_channel++)
    {
      if(update_mode || current_trigger.chargetriggerthreshold[charge_channel] != old_trigger.chargetriggerthreshold[charge_channel]){
	if(!update_mode) printf("current_trigger[%d].chargetriggerthreshold[%d] changd\n", dcrc, charge_channel);
	bool valid_check = check_chargetriggerthreshold_register(dcrc, charge_channel, current_trigger);
	if(valid_check){
	  if(dcrc_enabled[dcrc] && !dummyreadout){
	    int write_success = write_DCRC(gDataSocket[dcrc], ChargeTriggerThreshold_register[charge_channel], current_trigger.chargetriggerthreshold[charge_channel]);
	    //write updated setting to the readback odb
	    //now write the new settings to the readback (mirrored) odb
	    //but only do so if the card was actually written to
	    if(write_success >= 0){
	      //first overwrite the old struct
	      old_trigger.chargetriggerthreshold[charge_channel] =  current_trigger.chargetriggerthreshold[charge_channel];
	      if(!update_mode) printf("old_trigger[%d].chargetriggerthreshold[%d] overwritten\n", dcrc, charge_channel);
	      //now overwrite the old ODB
	      odbWriteInt(set_str, charge_channel, current_trigger.chargetriggerthreshold[charge_channel]);
	      cm_msg(MINFO, frontend_name, "ChargeTriggerTreshold[%d]=%d written to Tower%02d DCRC%d and ReadbackODB", charge_channel, current_trigger.chargetriggerthreshold[charge_channel], whichtower, dcrc);
	    }
	  }
	}
      }
    }
}


bool check_0x18_register(int dcrc, TRIGGER &current_trigger){
  bool valid_check = 1;
  //need unsigned values because these values should not be negative.
  //if the values in the struct are negative, the unsigned variables
  // will be very large and out of the valid range
  unsigned int phonontriggerbaselinelength_unsigned = current_trigger.phonontriggerbaselinelength;
  unsigned int chargetriggerbaselinelength_unsigned = current_trigger.chargetriggerbaselinelength;
  if(phonontriggerbaselinelength_unsigned > 0x7f){
    valid_check = 0;
    cm_msg(MERROR, frontend_name, "ERROR: Requested value for current_trigger.phonontriggerbaselinelength of %d is above maximum of 127 or negative. Keeping previous values for Register 0x18",current_trigger.phonontriggerbaselinelength);
  }
  if(chargetriggerbaselinelength_unsigned > 0x7f){
    valid_check = 0;
    cm_msg(MERROR, frontend_name, "ERROR: Requested value for current_trigger.chargetriggerbaselinelength of %d is above maximum of 127 or negative. Keeping previous values for Register 0x18",current_trigger.chargetriggerbaselinelength);
  }
  return valid_check;
}

bool check_0x19_register(int dcrc, TRIGGER &current_trigger){
  bool valid_check = 1;
  //need unsigned values because these values should not be negative.
  //if the values in the struct are negative, the unsigned variables
  // will be very large and out of the valid range
  unsigned int phonontriggersamplelength_unsigned = current_trigger.phonontriggersamplelength;
  unsigned int chargetriggersamplelength_unsigned = current_trigger.chargetriggersamplelength;
  if(phonontriggersamplelength_unsigned > 0x1f){
    valid_check = 0;
    cm_msg(MERROR, frontend_name, "ERROR: Requested value for current_trigger.phonontriggersamplelength of %d is above maximum of 31 or is negative. Keeping previous values for Register 0x19",current_trigger.phonontriggersamplelength);
  }
  if(chargetriggersamplelength_unsigned > 0x1f){
    valid_check = 0;
    cm_msg(MERROR, frontend_name, "ERROR: Requested value for current_trigger.chargetriggersamplelength of %d is above maximum of 31 or is negative. Keeping previous values for Register 0x19",current_trigger.chargetriggersamplelength);
  }
  return valid_check;
}

bool check_phonontriggerthreshold_register(int dcrc, int phonon_channel, TRIGGER &current_trigger){
  bool valid_check = 1;
  if(current_trigger.phonontriggerthreshold[phonon_channel] > 16383){
    valid_check = 0;
    cm_msg(MERROR, frontend_name, "ERROR: Requested value for current_trigger[%d].phonontriggerthreshold[%d] of %d is above maximum of 16383. Keeping previous value for this register",dcrc, phonon_channel, current_trigger.phonontriggerthreshold[phonon_channel]);
  }
  if(current_trigger.phonontriggerthreshold[phonon_channel] < -16383){
    valid_check = 0;
    cm_msg(MERROR, frontend_name, "ERROR: Requested value for current_trigger[%d].phonontriggerthreshold[%d] of %d is below minimum of -16383. Keeping previous value for this Register.\n",dcrc, phonon_channel, current_trigger.phonontriggerthreshold[phonon_channel]);
  }
  return valid_check;
}

bool check_chargetriggerthreshold_register(int dcrc, int charge_channel, TRIGGER &current_trigger){
  bool valid_check = 1;
  unsigned int chargetriggerthreshold_unsigned = current_trigger.chargetriggerthreshold[charge_channel];  
  if(chargetriggerthreshold_unsigned > 0x7fff){
    valid_check = 0;
    cm_msg(MERROR, frontend_name, "ERROR: Requested value for current_trigger[%d].chargetriggerthreshold[%d] of %d is above maximum of 32767 or negative. Keeping previous value for this Register.", dcrc, charge_channel, current_trigger.chargetriggerthreshold[charge_channel]);
  }
  return valid_check;
}
    


//here we compute the 0x17 register, which depend on the charge and
//phonon trigger enable variables.  y, n ODB values obviously are
//accepted.  additionally, and number below 1 is interpreted as n and
//any number >= 1 is interpreted as y.
int compute_0x17_register(TRIGGER &current_trigger){
  int Register_0x17 = 0;
  for(int phonon_channel = 0; phonon_channel < MAX_PHONON_CHANNEL; phonon_channel++){
    if(current_trigger.phonontriggerenable[phonon_channel])
      Register_0x17 += 0x1 << phonon_channel;
  }
  for(int charge_channel = 0; charge_channel < MAX_CHARGE_CHANNEL; charge_channel++){
    if(current_trigger.chargetriggerenable[charge_channel])
      Register_0x17 += 0x1 << (charge_channel+4);
  }
  return Register_0x17;
}


  
