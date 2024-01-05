#include "midas.h"
#include "utils1.h"

#include "constants.h"
#include "write_DCRC.h"
#include "convert_functions.h"

#include "struct_general.h"
#include "struct_led.h"
#include "update_led_functions.h"


extern char *frontend_name;
extern BOOL dcrc_enabled[MAX_DCRCs+1];
extern BOOL dummyreadout;
extern KOsocket *gDataSocket[MAX_DCRCs+1];

void compare_overwrite_led(int whichtower, int dcrc, int update_mode, LED &old_led, LED &current_led, GENERAL &current_general, GENERAL &old_general){
  printf("Within compare_overwrite_led--DCRC%d--update_mode:%d\n", dcrc, update_mode);
  printf("current_led[%d].ledpulsewidth__us_= %d\n", dcrc, current_led.ledpulsewidth__us_);
  printf("current_led[%d].ledreprate__us_= %d\n", dcrc, current_led.ledreprate__us_);
  printf("current_led[%d].ledadccontrol= %d\n", dcrc, current_led.ledadccontrol);
  printf("current_led[%d].led1current__ma_= %f\n", dcrc, current_led.led1current__ma_);
  printf("current_led[%d].enableled1= %d\n", dcrc, current_led.enableled1);
  printf("current_led[%d].enableled2= %d\n", dcrc, current_led.enableled2);
  printf("current_led[%d].connectledvoltagestophononadcs= %d\n", dcrc, current_led.connectledvoltagestophononadcs);
  printf("current_led[%d].singlestepfreeruntoggle= %d\n", dcrc, current_led.singlestepfreeruntoggle);
  printf("current_led[%d].enablezapcharging= %d\n", dcrc, current_led.enablezapcharging);
  printf("current_led[%d].enable15vpower= %d\n", dcrc, current_led.enable15vpower);
  printf("current_led[%d].led2current__ma_= %f\n\n", dcrc, current_led.led2current__ma_);

  if(update_mode ||  current_led.ledpulsewidth__us_ !=  old_led.ledpulsewidth__us_){
    if(!update_mode) printf("current_led[%d].ledpulsewidth__us_ changed\n", dcrc);
    //check to make sure the settings is valid
    bool valid_check = check_LEDPulseWidth_register(dcrc, current_led);
    //update old_led and compute/write the DCRC register value                     
    // only if the settings are valid otherwise don't write any new value 
    if(valid_check){
      if(dcrc_enabled[dcrc] && !dummyreadout){
	unsigned int ledpulsewidth_unsigned = current_led.ledpulsewidth__us_;
	unsigned int LEDPulseWidthDAC = int(ledpulsewidth_unsigned/10.);
	int write_success = write_DCRC(gDataSocket[dcrc], LEDPulseWidth_register, LEDPulseWidthDAC);
	//write updated setting to the readback odb
	//now write the new settings to the readback (mirrored) odb
	//but only do so if the card was actually written to
	if(write_success >= 0){
	  //first write to the old struct
	  old_led.ledpulsewidth__us_ = current_led.ledpulsewidth__us_;
	  if(!update_mode) printf("old_led[%d].ledpulsewidth__us_ overwritten\n", dcrc);
	  //second write to the readback
	  char set_str[80];
	  sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/LED/LEDPulseWidth (us)", whichtower, dcrc);
	  odbWriteInt(set_str, 0, current_led.ledpulsewidth__us_);
	  cm_msg(MINFO, frontend_name, "LEDPulseWidth =%dus (%dDAC) written to Tower%02d DCRC%d and ReadbackODB", current_led.ledpulsewidth__us_, LEDPulseWidthDAC, whichtower, dcrc);
	}
      }
    }
  }

  if(update_mode ||  current_led.ledreprate__us_ !=  old_led.ledreprate__us_){
    if(!update_mode) printf("current_led[%d].ledreprate__us_ changed\n", dcrc);
    //check to make sure the settings is valid
    bool valid_check = check_LEDRepRate_register(dcrc, current_led);
    //update old_led and compute/write the DCRC register value                     
    // only if the settings are valid otherwise don't write any new value 
    if(valid_check){
      if(dcrc_enabled[dcrc] && !dummyreadout){
	unsigned int ledreprate_unsigned =  current_led.ledreprate__us_;
	unsigned int LEDRepRateDAC = int(ledreprate_unsigned/20.);
	if (LEDRepRateDAC > 0xffff) LEDRepRateDAC = 0xffff;
	int write_success = write_DCRC(gDataSocket[dcrc], LEDRepRate_register, LEDRepRateDAC);
	//now write the new settings to the readback (mirrored) odb
	//but only do so if the card was actually written to
	if(write_success >= 0){
	  //first write to the old struct
	  old_led.ledreprate__us_ = current_led.ledreprate__us_;
	  if(!update_mode) printf("old_led[%d].ledreprate__us_ overwritten\n", dcrc);
	  //next write to the readback
	  char set_str[80];
	  sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/LED/LEDRepRate (us)", whichtower, dcrc);
	  odbWriteInt(set_str, 0, current_led.ledreprate__us_);
	  cm_msg(MINFO, frontend_name, "LEDRepRate =%dus (%dDAC) written to Tower%02d DCRC%d and ReadbackODB", current_led.ledreprate__us_, LEDRepRateDAC, whichtower, dcrc);
	}
      }
    }
  }

  if(update_mode ||  current_led.ledadccontrol !=  old_led.ledadccontrol){
    if(!update_mode) printf("current_led[%d].ledadccontrol changed\n", dcrc);
    unsigned int ledadccontrol_unsigned = current_led.ledadccontrol;
    if(dcrc_enabled[dcrc] && !dummyreadout){
      int write_success = write_DCRC(gDataSocket[dcrc], LEDADCControl_register, ledadccontrol_unsigned);
      //now write the new settings to the readback (mirrored) odb
      //but only do so if the card was actually written to
      if(write_success >= 0){
	//first write to the old struct
	old_led.ledadccontrol = current_led.ledadccontrol;
	if(!update_mode) printf("old_led[%d].ledadccontrol overwritten\n", dcrc);
	//next write to the readback
	char set_str[80];
	sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/LED/LEDADCControl", whichtower, dcrc);
	odbWriteInt(set_str, 0, current_led.ledadccontrol);
	cm_msg(MINFO, frontend_name, "LEDADCControl=%d (%dDAC--simply unsigned) written to Tower%02d DCRC%d and ReadbackODB", current_led.ledadccontrol, ledadccontrol_unsigned, whichtower, dcrc);
      }
    }
  }
 
  if(update_mode ||  current_led.led1current__ma_ !=  old_led.led1current__ma_){
    if(!update_mode) printf("current_led[%d].led1current__ma_ changed\n", dcrc);
    int led_num = 1;
    bool valid_check = check_LEDCurrent_register(dcrc, led_num, current_led);
    if(valid_check){
      if(dcrc_enabled[dcrc] && !dummyreadout){
	unsigned int LED1CurrentDAC = int ((current_led.led1current__ma_+10)*0xfff/20. + 0.5);
	if (LED1CurrentDAC > 0xfff) LED1CurrentDAC = 0xfff;
	int write_success = write_DCRC(gDataSocket[dcrc], LED1Current_register, LED1CurrentDAC);
	//now write the new settings to the readback (mirrored) odb
	//but only do so if the card was actually written to
	if(write_success >= 0){
	  //first write to the old struct
	  old_led.led1current__ma_ = current_led.led1current__ma_;
	  if(!update_mode) printf("old_led[%d].led1current__ma_ overwritten\n", dcrc);
	  //next write to the readback
	  char set_str[80];
	  sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/LED/LED1Current (mA)", whichtower, dcrc);
	  odbWriteFloat(set_str, 0, current_led.led1current__ma_);
	  cm_msg(MINFO, frontend_name, "LED1Current=%fmA (%dDAC) written to Tower%02d DCRC%d and ReadbackODB", current_led.led1current__ma_, LED1CurrentDAC, whichtower, dcrc);
	}
      }
    }
  }
  
  if(update_mode){
    if(dcrc_enabled[dcrc] && !dummyreadout){
      int Register_0x30 = compute_0x30_register(current_led, current_general);
      int write_success = write_DCRC(gDataSocket[dcrc], LEDEnableConnectStepZap15VPowerHeat_register, Register_0x30);
      //now write the new settings to the readback (mirrored) odb
      //but only do so if the card was actually written to
      if(write_success >= 0){
	//first write to the old struct
	old_led.enableled1 =  current_led.enableled1;
	old_led.enableled2 = current_led.enableled2;
	old_led.connectledvoltagestophononadcs = current_led.connectledvoltagestophononadcs;
	old_led.singlestepfreeruntoggle = current_led.singlestepfreeruntoggle;
	old_led.enablezapcharging = current_led.enablezapcharging;
	old_led.enable15vpower = current_led.enable15vpower;
	old_general.fetheatenable = current_general.fetheatenable;
	//next write to the readback
	char set_str[80];
	sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/LED/EnableLED1", whichtower, dcrc);
	odbWriteBool(set_str, 0, current_led.enableled1);
	cm_msg(MINFO, frontend_name, "EnableLED1=%d written to Tower%02d DCRC%d (Register 0x30) and ReadbackODB", current_led.enableled1, whichtower, dcrc);
	sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/LED/EnableLED2", whichtower, dcrc);
	odbWriteBool(set_str, 0, current_led.enableled2);
	cm_msg(MINFO, frontend_name, "EnableLED2=%d written to Tower%02d DCRC%d (Register 0x30) and ReadbackODB", current_led.enableled2, whichtower, dcrc);
	sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/LED/ConnectLEDVoltagesToPhononADCs", whichtower, dcrc);
	odbWriteBool(set_str, 0, current_led.connectledvoltagestophononadcs);
	cm_msg(MINFO, frontend_name, "ConnectLEDVoltagesToPhononADCs=%d written to Tower%02d DCRC%d (Register 0x30) and ReadbackODB", current_led.connectledvoltagestophononadcs, whichtower, dcrc);
	sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/LED/SingleStepFreeRunToggle", whichtower, dcrc);
	odbWriteBool(set_str, 0, current_led.singlestepfreeruntoggle);
	cm_msg(MINFO, frontend_name, "SingleStepFreeRunToggle=%d written to Tower%02d DCRC%d (Register 0x30) and ReadbackODB", current_led.singlestepfreeruntoggle, whichtower, dcrc);
	sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/LED/EnableZapCharging", whichtower, dcrc);
	odbWriteBool(set_str, 0, current_led.enablezapcharging);
	cm_msg(MINFO, frontend_name, "EnableZapCharging=%d written to Tower%02d DCRC%d (Register 0x30) and ReadbackODB", current_led.enablezapcharging, whichtower, dcrc);
	sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/LED/Enable15VPower", whichtower, dcrc);
	odbWriteBool(set_str, 0, current_led.enable15vpower);
	cm_msg(MINFO, frontend_name, "Enable15VPower=%d written to Tower%02d DCRC%d (Register 0x30) and ReadbackODB", current_led.enable15vpower, whichtower, dcrc);
	sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/General/FETHeatEnable", whichtower, dcrc);
	odbWriteBool(set_str, 0, current_general.fetheatenable);
	cm_msg(MINFO, frontend_name, "FETHeatEnable=%d written to Tower%02d DCRC%d (Register 0x30) and ReadbackODB", current_general.fetheatenable, whichtower, dcrc);
	printf("Register_0x30 = %d written to DCRC\n", Register_0x30);
      }
    }
  }
  else{
    int changed_variable_flag = 0;
    if(current_led.enableled1 != old_led.enableled1){
      printf("current_led[%d].enableledd1 changed\n", dcrc);
      changed_variable_flag = 1;
    }
    if(current_led.enableled2 != old_led.enableled2){
      printf("current_led[%d].enableled2 changed\n", dcrc);
      changed_variable_flag = 1;
    }
    if(current_led.connectledvoltagestophononadcs != old_led.connectledvoltagestophononadcs){
      printf("current_led[%d].connectledvoltagestophononadcs changed\n", dcrc);
      changed_variable_flag = 1;
    }
    if(current_led.singlestepfreeruntoggle != old_led.singlestepfreeruntoggle){
      printf("current_led[%d].singlestepfreeruntoggle changed\n", dcrc);
      changed_variable_flag = 1;
    }
    if(current_led.enablezapcharging != old_led.enablezapcharging){
      printf("current_led[%d].enablezapcharging changed\n", dcrc);
      changed_variable_flag = 1;
    }
    if(current_led.enable15vpower != old_led.enable15vpower){
      printf("current_led[%d].enable15vpower changed\n", dcrc);
      changed_variable_flag = 1;
    }
    if(changed_variable_flag && dcrc_enabled[dcrc] && !dummyreadout){
      int Register_0x30 = compute_0x30_register(current_led, current_general);
      int write_success = write_DCRC(gDataSocket[dcrc], LEDEnableConnectStepZap15VPowerHeat_register, Register_0x30);
      //now write the new settings to the readback (mirrored) odb
      //but only do so if the card was actually written to
      if(write_success >= 0){
	//first write to the old struct
	old_led.enableled1 = current_led.enableled1;  
	printf("old_led[%d].enableled1 overwritten\n", dcrc);
	old_led.enableled2 = current_led.enableled2;  
	printf("old_led[%d].enableled2 overwritten\n", dcrc);
	old_led.connectledvoltagestophononadcs = current_led.connectledvoltagestophononadcs;  
	printf("old_led[%d].connectledvoltagestophononadcs overwritten\n", dcrc);
	old_led.singlestepfreeruntoggle = current_led.singlestepfreeruntoggle;  
	printf("old_led[%d].singlestepfreeruntoggle overwritten\n", dcrc);
	old_led.enablezapcharging = current_led.enablezapcharging;  
	printf("old_led[%d].enablezapcharging overwritten\n", dcrc);
	old_led.enable15vpower = current_led.enable15vpower;  
	printf("old_led[%d].enable15vpower overwritten\n", dcrc);
	//next write to the readback 
	char set_str[80];
	sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/LED/EnableLED1", whichtower, dcrc);
	odbWriteBool(set_str, 0, current_led.enableled1);
	cm_msg(MINFO, frontend_name, "EnableLED1=%d written to Tower%02d DCRC%d (Register 0x30) and ReadbackODB", current_led.enableled1, whichtower, dcrc);
	sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/LED/EnableLED2", whichtower, dcrc);
	odbWriteBool(set_str, 0, current_led.enableled2);
	cm_msg(MINFO, frontend_name, "EnableLED2=%d written to Tower%02d DCRC%d (Register 0x30) and ReadbackODB", current_led.enableled2, whichtower, dcrc);
	sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/LED/ConnectLEDVoltagesToPhononADCs", whichtower, dcrc);
	odbWriteBool(set_str, 0, current_led.connectledvoltagestophononadcs);
	cm_msg(MINFO, frontend_name, "ConnectLEDVoltagesToPhononADCs=%d written to Tower%02d DCRC%d (Register 0x30) and ReadbackODB", current_led.connectledvoltagestophononadcs, whichtower, dcrc);
	sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/LED/SingleStepFreeRunToggle", whichtower, dcrc);
	odbWriteBool(set_str, 0, current_led.singlestepfreeruntoggle);
	cm_msg(MINFO, frontend_name, "SingleStepFreeRunToggle=%d written to Tower%02d DCRC%d (Register 0x30) and ReadbackODB", current_led.singlestepfreeruntoggle, whichtower, dcrc);
	sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/LED/EnableZapCharging", whichtower, dcrc);
	odbWriteBool(set_str, 0, current_led.enablezapcharging);
	cm_msg(MINFO, frontend_name, "EnableZapCharging=%d written to Tower%02d DCRC%d (Register 0x30) and ReadbackODB", current_led.enablezapcharging, whichtower, dcrc);
	sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/LED/Enable15VPower", whichtower, dcrc);
	odbWriteBool(set_str, 0, current_led.enable15vpower);
	cm_msg(MINFO, frontend_name, "Enable15VPower=%d written to Tower%02d DCRC%d (Register 0x30) and ReadbackODB", current_led.enable15vpower, whichtower, dcrc);
	sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/General/FETHeatEnable", whichtower, dcrc);
	odbWriteBool(set_str, 0, current_general.fetheatenable);
	cm_msg(MINFO, frontend_name, "FETHeatEnable=%d written to Tower%02d DCRC%d (Register 0x30) and ReadbackODB", current_general.fetheatenable, whichtower, dcrc);
	printf("Register_0x30 = %d written to DCRC\n", Register_0x30);
      }
    }
  }
  
  if(update_mode ||  current_led.led2current__ma_ !=  old_led.led2current__ma_){
    if(!update_mode) printf("current_led[%d].led2current__ma_ changed\n", dcrc);
    int led_num = 2;
    bool valid_check = check_LEDCurrent_register(dcrc, led_num, current_led);
    if(valid_check){
      if(dcrc_enabled[dcrc] && !dummyreadout){
	unsigned int LED2CurrentDAC = int ((current_led.led2current__ma_+10)*0xfff/20. + 0.5);
	if (LED2CurrentDAC > 0xfff) LED2CurrentDAC = 0xfff;
	int write_success = write_DCRC(gDataSocket[dcrc], LED2Current_register, LED2CurrentDAC);
	//now write the new settings to the readback (mirrored) odb
	//but only do so if the card was actually written to
	if(write_success >= 0){
	  //first write to the struct
	  old_led.led2current__ma_ = current_led.led2current__ma_;
	  if(!update_mode) printf("old_led[%d].led2current__ma_ overwritten\n", dcrc);
	  //next write to the readback
	  char set_str[80];
	  sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/LED/LED2Current (mA)", whichtower, dcrc);
	  odbWriteFloat(set_str, 0, current_led.led2current__ma_);
	  cm_msg(MINFO, frontend_name, "LED2Current=%fmA (%dDAC) written to Tower%02d DCRC%d and ReadbackODB", current_led.led2current__ma_, LED2CurrentDAC, whichtower, dcrc);
	}
      }
    }
  }
}
  
  
bool check_LEDPulseWidth_register(int dcrc, LED &current_led){
  bool valid_check = 1;
  //need unsigned values because these values should not be negative.
  //if the values in the struct are negative, the unsigned variables
  // will be very large and out of the valid range 
  unsigned int ledpulsewidth_unsigned = current_led.ledpulsewidth__us_;
  if(ledpulsewidth_unsigned > 10230){
    valid_check = 0;
    cm_msg(MERROR, frontend_name, "ERROR: Requested value for current_led[%d].ledpulsewidth__us_ %i is above maximum of 10230us or negative. Keeping previous values for Register 0x27.", dcrc, current_led.ledpulsewidth__us_);
    }
  return valid_check;
}

 bool check_LEDRepRate_register(int dcrc, LED &current_led){
   bool valid_check = 1;
   //need unsigned values because these values should not be negative.
   //if the values in the struct are negative, the unsigned variables
   // will be very large and out of the valid range
    unsigned int ledreprate_unsigned =  current_led.ledreprate__us_;
    if(ledreprate_unsigned > 0xffff*20){
      valid_check = 0;
      cm_msg(MERROR, frontend_name, "ERROR: Requested value for current_led[%d].ledreprate__us_ %i is above maximum of 1310700 (decimal). Keeping previous value for Register 0x28", dcrc, current_led.ledreprate__us_);
    }
    return valid_check;
 }

 bool check_LEDCurrent_register(int dcrc, int led_num, LED &current_led){
   bool valid_check = 1;
   if(led_num == 1){
     if(current_led.led1current__ma_ > 10){
       valid_check = 0;
       cm_msg(MERROR, frontend_name, "ERROR: Requested value for current_led[%d].led1current__ma_ %f is above maximum value of 10. Keeping previous value for this LEDCurrent register", dcrc, current_led.led1current__ma_);
     }
     if(current_led.led1current__ma_ < -10 ){
       valid_check = 0;
       cm_msg(MERROR, frontend_name, "ERROR: Requested value for current_led[%d].led1current__ma_ %f is below minimum value of -10. Keeping previous value for this LEDCurrent register", dcrc, current_led.led1current__ma_);
     }
   }
   else if(led_num == 2){
     if(current_led.led2current__ma_ > 10){
       valid_check = 0;
       cm_msg(MERROR, frontend_name, "ERROR: Requested value for current_led[%d].led2current__ma_ %f is above maximum value of 10. Keeping previous value for this LEDCurrent register", dcrc, current_led.led2current__ma_);
     }
     if(current_led.led2current__ma_ < -10 ){
       valid_check = 0;
       cm_msg(MERROR, frontend_name, "ERROR: Requested value for current_led[%d].led2current__ma_ %f is below minimum value of -10. Keeping previous value for this LEDCurrent register", dcrc, current_led.led2current__ma_);
     }
   }
   return valid_check;
 }


int compute_0x30_register(LED &current_led, GENERAL &current_general){
  int Register_0x30 = 0;
  if(current_led.enableled1){
    Register_0x30 += 0x1;
  }
  if(current_led.enableled2){
    Register_0x30 += 0x2;
  }
  if(current_led.connectledvoltagestophononadcs){
    Register_0x30 += 0x4;
  }
  if(current_led.singlestepfreeruntoggle){
    Register_0x30 += 0x10;
  }
  if(current_led.enablezapcharging){
    Register_0x30 += 0x200;
  }
  if(current_led.enable15vpower){
    Register_0x30 += 0x800;
  }
  if(current_general.fetheatenable){
    Register_0x30 += 0x100;
  }
  return Register_0x30;
}


