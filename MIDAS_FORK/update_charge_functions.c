#include "struct_charge.h"
#include "update_charge_functions.h"


#include "midas.h"
#include "utils1.h"
#include "constants.h"
#include "write_DCRC.h"
#include "convert_functions.h"


extern char *frontend_name;
extern int calib[50][MAX_DCRCs+1];
extern BOOL dcrc_enabled[MAX_DCRCs+1];
extern BOOL dummyreadout;
extern KOsocket *gDataSocket[MAX_DCRCs+1];

extern float dcrc_rev[MAX_DCRCs+1];

void compare_overwrite_charge(int whichtower, int dcrc, int update_mode, CHARGE &old_charge, CHARGE &current_charge, int calib[][7]){
  printf("Within compare_overwrite_charge--DCRC%d--update_mode:%d\n", dcrc, update_mode);
  printf("charge[%d]bias[0]= %f\ncharge[%d]bias[1] = %f\ncharge[%d]AmpOffset[0] = %f\ncharge[%d]_AmpOffset[1] = %f\n\n",dcrc, current_charge.bias__v_[0], dcrc, current_charge.bias__v_[1], dcrc, current_charge.ampoffset__v_[0], dcrc, current_charge.ampoffset__v_[1]);

  for(int charge_channel = 0; charge_channel < MAX_CHARGE_CHANNEL; charge_channel++){
    if (update_mode || current_charge.bias__v_[charge_channel] != old_charge.bias__v_[charge_channel]){
      if(!update_mode) printf("current_charge[%d].bias__v_[%d] changed\n", dcrc, charge_channel);
      bool valid_check = check_charge_bias(dcrc, charge_channel, current_charge);
      if(valid_check){
	if(dcrc_enabled[dcrc] && !dummyreadout){
	  int max_bias_dac = 0xffff;
	  int biasregister = ChargeBias_register[charge_channel];

	  // RevC board has different maximum DAC value than RevC.1, and also swaps inner and outer charge DAC registers
	  if (dcrc_rev[dcrc] == 3) {
	    max_bias_dac = 0x3fff;
	    biasregister = ChargeBias_register[1-charge_channel];
	  }

	  unsigned int BiasDAC = convert_float_to_dac(current_charge.bias__v_[charge_channel], calib[2*charge_channel][dcrc], calib[2*charge_channel+1][dcrc], 0.000001, max_bias_dac);
	  
	  int write_success = write_DCRC(gDataSocket[dcrc],biasregister, BiasDAC);
	  //now write this value to the mirrored odb
	  //now write the new settings to the readback (mirrored) odb
	  //but only do so if the card was actually written to
	  if(write_success >= 0){
	    //first write to the old struct
	    old_charge.bias__v_[charge_channel] = current_charge.bias__v_[charge_channel];
	    if(!update_mode) printf("old_charge[%d].bias__v_[%d] overwritten\n", dcrc, charge_channel);
	    //second write to the readback odb
	    char set_str[80];
	    sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/Charge/Bias (V)", whichtower, dcrc);
	    odbWriteFloat(set_str, charge_channel ,current_charge.bias__v_[charge_channel]);
	    cm_msg(MINFO, frontend_name, "Channel %d Charge Bias=%fV (%dDAC) written to Tower%02d DCRC%d and ReadbackODB", charge_channel, current_charge.bias__v_[charge_channel], BiasDAC, whichtower, dcrc);
	  } // end of things to do if write success
	} // end of things to do if DCRC enabled and not dummy readout
      } // end of things to do if valid setting was requested
    } // end of things to do if setting requires updating (it changed or is forced to update)
  }//end of charge channel loop

  for(int charge_channel = 0; charge_channel < MAX_CHARGE_CHANNEL; charge_channel++){
    if (update_mode || current_charge.ampoffset__v_[charge_channel] != old_charge.ampoffset__v_[charge_channel]){
      if(!update_mode) printf("current_charge[%d].ampoffset__v_[%d] changed, update mode = %d\n", dcrc, charge_channel, update_mode);
      //check validity of the setting
      bool valid_check = check_charge_ampoffset(dcrc, charge_channel, current_charge);
      if(valid_check){
	if(dcrc_enabled[dcrc] && !dummyreadout){
	  int AmpOffsetDAC = int(0xfff*0.5 + current_charge.ampoffset__v_[charge_channel]*0xfff/4. + 0.5);
	  if (AmpOffsetDAC > 0xfff) AmpOffsetDAC = 0xfff;
	  if (AmpOffsetDAC < 0) AmpOffsetDAC = 0;
	  int write_success = write_DCRC(gDataSocket[dcrc], AmpOffset_register[charge_channel], AmpOffsetDAC);
	  //write updated setting to the readback odb
	  //now write the new settings to the readback (mirrored) odb
	  //but only do so if the card was actually written to
	  if(write_success >= 0){
	    //first write to the old struct
	    old_charge.ampoffset__v_[charge_channel] = current_charge.ampoffset__v_[charge_channel];
	    if(!update_mode) printf("old_charge[%d].ampoffset__v_[%d] overwritten\n", dcrc, charge_channel);
	    //next write to the readback odb
	    char set_str[80];
	    sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/Charge/AmpOffset (V)", whichtower, dcrc);
	    odbWriteFloat(set_str, charge_channel, current_charge.ampoffset__v_[charge_channel]);
	    cm_msg(MINFO, frontend_name, "Channel %d AmpOffset=%fV (%dDAC) written to Tower%02d DCRC%d and ReadbackODB", charge_channel, current_charge.ampoffset__v_[charge_channel], AmpOffsetDAC, whichtower, dcrc);
	  } // end of things to do if write success
	} // end of things to do if DCRC is enabled and tower is not in dummy mode
      } // end of things to do if valid setting requested
    } // end of things to do if new setting differs from old setting or if set for forced update
  }//end of charge channel loop
}//end of compare_overwrite_charge function


bool check_charge_bias(int dcrc, int charge_channel, CHARGE &current_charge){
  bool valid_check = 1;
  if(current_charge.bias__v_[charge_channel] > 14.){
    valid_check = 0;
    cm_msg(MERROR, frontend_name, "ERROR: Requested value for DCRC%d current.charge.bias__v_[%d] of %f exceeds maximum of +14V.  Keeping previous value of this register (0x59, or 0x5a)", dcrc, charge_channel,current_charge.bias__v_[charge_channel]);
  }
  if(current_charge.bias__v_[charge_channel] < -14.){
    valid_check = 0;
    cm_msg(MERROR, frontend_name, "ERROR: Requested value for DCRC%d current.charge.bias__v_[%d] of %f exceeds minimum of -14V. Keeping previous value of this register (0x59, or 0x5a)", dcrc, charge_channel,current_charge.bias__v_[charge_channel]);
  }
  return valid_check;
}


bool check_charge_ampoffset(int dcrc, int charge_channel, CHARGE &current_charge){
  bool valid_check = 1;
  if(current_charge.ampoffset__v_[charge_channel] > 2.){
    valid_check = 0;
    cm_msg(MERROR, frontend_name, "ERROR: Requested value for DCRC%d current_charge.ampoffset__v_[%d] of %f exceeds maximum of +2V.  Keeping previous value of this register (0x36, or 0x37)", dcrc, charge_channel, current_charge.ampoffset__v_[charge_channel]);
  }
  if(current_charge.ampoffset__v_[charge_channel] < -2.){
    valid_check = 0;
    cm_msg(MERROR, frontend_name, "ERROR: Requested value for DCRC%d current_charge.ampoffset__v_[%d] of %f exceeds minimum of -2V.  Keeping previous value of this register(0x36, or 0x37)", dcrc, charge_channel, current_charge.ampoffset__v_[charge_channel]);
  }
  return valid_check;
}

