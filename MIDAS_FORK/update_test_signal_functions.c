#include "midas.h"
#include "utils1.h"
#include <iostream>
#include <fstream>

using namespace std;

#include "constants.h"
#include "write_DCRC.h"
#include "convert_functions.h"

#include "struct_general.h"
#include "struct_test_signal.h"
#include "update_test_signal_functions.h"



extern char *frontend_name;
extern BOOL dcrc_enabled[MAX_DCRCs+1];
extern BOOL dummyreadout;
extern KOsocket *gDataSocket[MAX_DCRCs+1];
extern float dcrc_rev[MAX_DCRCs+1];




void compare_overwrite_test_signal(int whichtower, int dcrc, int update_mode, TESTSIGNAL &old_test_signal, TESTSIGNAL &current_test_signal, GENERAL &current_general, GENERAL &old_general){

 
  cout << "Within compare_overwrite_test_signal--DCRC" << dcrc << endl;
  cout << "test_signal[" << dcrc << "].connecttesttoqet[0]= " <<  current_test_signal.connecttesttoqet[0] << endl;
  cout << "test_signal[" << dcrc << "].connecttesttoqet[1]= " << current_test_signal.connecttesttoqet[1] << endl;
  cout << "test_signal[" << dcrc << "].connecttesttoqet[2]= " << current_test_signal.connecttesttoqet[2] << endl;
  cout << "test_signal[" << dcrc << "].connecttesttoqet[3]= " <<  current_test_signal.connecttesttoqet[3] << endl;
  cout << "test_signal[" << dcrc << "].ddschipcontrolpin= " << current_test_signal.ddschipcontrolpin << endl;
  cout << "test_signal[" << dcrc << "].ddscontrolreg= " <<  current_test_signal.ddscontrolreg << endl;
  cout << "test_signal[" << dcrc << "].ddsnumincrements= " <<  current_test_signal.ddsnumincrements << endl;
  cout << "test_signal[" << dcrc << "].ddsfreqincrement= " << current_test_signal.ddsfreqincrement << endl;
  cout << "test_signal[" << dcrc << "].ddsincrementinterval= " << current_test_signal.ddsincrementinterval << endl;
  cout << "test_signal[" << dcrc << "].ddsstartfreq= " << current_test_signal.ddsstartfreq << endl;
  cout << "test_signal[" << dcrc << "].ddsdacscaling= " << current_test_signal.ddsdacscaling << endl;
  printf("\n");

  if(update_mode){
    if(dcrc_enabled[dcrc] && !dummyreadout){
      int Register_0x3c = compute_0x3c_register(dcrc, current_test_signal, current_general);
      int write_success = write_DCRC(gDataSocket[dcrc], TestSignal_register, Register_0x3c);
      //now write the new settings to the readback (mirrored) odb
      //but only do so if the card was actually written to
      if(write_success >= 0){
	//only update the old test signal if the dcrc was written to
	for(int phonon_channel = 0; phonon_channel < MAX_PHONON_CHANNEL; phonon_channel++){
	  old_test_signal.connecttesttoqet[phonon_channel] = current_test_signal.connecttesttoqet[phonon_channel];
	}
	old_test_signal.ddschipcontrolpin = current_test_signal.ddschipcontrolpin;
	//need to update the old general struct too!!!
	old_general.qetbiasrangeselect = current_general.qetbiasrangeselect;
        printf("old_general[%d].qetbiasrangeselect overwritten\n", dcrc);
	//now update the readback
	char set_str[80];
	sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/TestSignal/ConnectTestToQET", whichtower, dcrc);
	for(int phonon_channel = 0; phonon_channel < MAX_PHONON_CHANNEL; phonon_channel++){
	  odbWriteBool(set_str, phonon_channel, current_test_signal.connecttesttoqet[phonon_channel]);
	  cm_msg(MINFO, frontend_name, "ConnectTestToQet[%d]=%d  written to Tower%02d DCRC%d and ReadbackODB", phonon_channel, current_test_signal.connecttesttoqet[phonon_channel], whichtower, dcrc);
	}
	sprintf(set_str, "/Equipment/Tower%02d/Readback/DCRC%1d/TestSignal/DDSChipControlPin", whichtower, dcrc);
	odbWriteBool(set_str, 0, current_test_signal.ddschipcontrolpin);
	cm_msg(MINFO, frontend_name, "DDSChipControlPin=%d  written to Tower%02d DCRC%d and ReadbackODB", current_test_signal.ddschipcontrolpin, whichtower, dcrc);
	sprintf(set_str, "/Equipment/Tower%02d/Readback/DCRC%1d/General/QETBiasRangeSelect", whichtower, dcrc);
	odbWriteBool(set_str, 0, current_general.qetbiasrangeselect);
	cm_msg(MINFO, frontend_name, "QETBiasRangeSelect=%d  written to Tower%02d DCRC%d and ReadbackODB", current_general.qetbiasrangeselect, whichtower, dcrc);
	printf("Register_0x3c = %d written to DCRC\n", Register_0x3c);
      }
    }
  }
  else{
    int changed_variable_flag = 0;
    for (int phonon_channel = 0; phonon_channel < MAX_PHONON_CHANNEL; phonon_channel++){
      if(current_test_signal.connecttesttoqet[phonon_channel] != old_test_signal.connecttesttoqet[phonon_channel]){
	printf("current_test_signal[%d].connecttesttoqet[%d] changed\n", dcrc, phonon_channel);
        changed_variable_flag = 1;
      }
    }
    if(current_test_signal.ddschipcontrolpin != old_test_signal.ddschipcontrolpin){
	printf("current_test_signal[%d].ddschipcontrolpin changed\n", dcrc);
	changed_variable_flag = 1;
    }
    if(changed_variable_flag && dcrc_enabled[dcrc] && !dummyreadout){
      int Register_0x3c = compute_0x3c_register(dcrc, current_test_signal, old_general);
      int write_success = write_DCRC(gDataSocket[dcrc], TestSignal_register, Register_0x3c);
     //now write the new value to the mirrored odb
      //now write the new settings to the readback (mirrored) odb
      //but only do so if the card was actually written to
      if(write_success >= 0){
	char set_str[80];
	sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/TestSignal/ConnectTestToQET", whichtower, dcrc);
	for(int phonon_channel = 0; phonon_channel < MAX_PHONON_CHANNEL; phonon_channel++){
	  //first update the old struct
	  old_test_signal.connecttesttoqet[phonon_channel] = current_test_signal.connecttesttoqet[phonon_channel];
	  printf("old_test_signal[%d].connecttesttoqet[%d] overwritten\n", dcrc, phonon_channel);
	  //now update the readback ODB
	  odbWriteBool(set_str, phonon_channel, current_test_signal.connecttesttoqet[phonon_channel]);
	  cm_msg(MINFO, frontend_name, "ConnectTestToQet[%d]=%d  written to Tower%02d DCRC%d and ReadbackODB", phonon_channel, current_test_signal.connecttesttoqet[phonon_channel], whichtower, dcrc);
	}
	//now update the old struct for this variable
	old_test_signal.ddschipcontrolpin = current_test_signal.ddschipcontrolpin;
	printf("old_test_signal[%d].ddschipcontrolpin overwritten\n", dcrc);
	//now update the readback
	sprintf(set_str, "/Equipment/Tower%02d/Readback/DCRC%1d/TestSignal/DDSChipControlPin", whichtower, dcrc);
	odbWriteBool(set_str, 0, current_test_signal.ddschipcontrolpin);
	cm_msg(MINFO, frontend_name, "DDSChipControlPin=%d  written to Tower%02d DCRC%d and ReadbackODB", current_test_signal.ddschipcontrolpin, whichtower, dcrc);
	//don't need to update the old struct
	//for this variable because it has not
	//been changed.  if it had been changed,
	//that change would call the function in
	//update_general_functions.c
	sprintf(set_str, "/Equipment/Tower%02d/Readback/DCRC%1d/General/QETBiasRangeSelect", whichtower, dcrc);
	odbWriteBool(set_str, 0, current_general.qetbiasrangeselect);
	cm_msg(MINFO, frontend_name, "QETBiasRangeSelect=%d  written to Tower%02d DCRC%d and ReadbackODB", current_general.qetbiasrangeselect, whichtower, dcrc); 
	printf("Register_0x3c = %d written to DCRC\n", Register_0x3c);
      }
    }
  }

  if(update_mode || current_test_signal.ddscontrolreg != old_test_signal.ddscontrolreg){
    if(!update_mode) printf("current_test_signal[%d].ddscontrolreg changed\n", dcrc);
    //check validity of new setting, namely that the ODB variable is positive
    bool valid_check = check_DDSControlReg_register(dcrc, current_test_signal);
    if(valid_check){
      if(dcrc_enabled[dcrc] && !dummyreadout){
	//the struct value should already by positive, otherwise it would have
	// failed the check but convert to unsigned as an extra safeguard
	unsigned int ddscontrolreg_unsigned =  current_test_signal.ddscontrolreg;
	int write_success = write_DCRC(gDataSocket[dcrc], DDSControlReg_register, ddscontrolreg_unsigned);
	//now write the new settings to the readback (mirrored) odb
	//but only do so if the card was actually written to
	if(write_success >= 0){
	  //first write to the old struct
	  old_test_signal.ddscontrolreg = current_test_signal.ddscontrolreg;
	  if(!update_mode) printf("old_test_signal[%d].ddscontrolreg overwritten\n", dcrc);
	  //now update Readback
	  char set_str[80];
	  sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/TestSignal/DDSControlReg", whichtower, dcrc);
	  odbWriteInt(set_str, 0, current_test_signal.ddscontrolreg);
	  cm_msg(MINFO, frontend_name, "DDSControlReg=%d written to Tower%02d DCRC%d and ReadbackODB", current_test_signal.ddscontrolreg,  whichtower, dcrc);
	}
      }
    }
  }

  printf("\n\ncurrent_test_signal.ddsnumincrements: %d, old_test_signal.ddsnumincrements %d\n", current_test_signal.ddsnumincrements, old_test_signal.ddsnumincrements);
  if(update_mode || current_test_signal.ddsnumincrements != old_test_signal.ddsnumincrements){
    if(!update_mode) printf("current_test_signal[%d].ddsnumincrements changed\n", dcrc);
    //check validity of new setting, nameley that the ODB variable is positive
    bool valid_check = check_DDSNumIncrements_register(dcrc, current_test_signal);
    if(valid_check){
      if(dcrc_enabled[dcrc] && !dummyreadout){
	//the struct value should already by positive, otherwise it would have
	// failed the check but convert to unsigned as an extra safeguard
	unsigned int ddsnumincrements_unsigned =  current_test_signal.ddsnumincrements;
	int write_success = write_DCRC(gDataSocket[dcrc], DDSNumIncrements_register, ddsnumincrements_unsigned);
	//now write the new settings to the readback (mirrored) odb
	//but only do so if the card was actually written to
	if(write_success >= 0){
	  //first update the old struct
	  old_test_signal.ddsnumincrements = current_test_signal.ddsnumincrements;
	  if(!update_mode) printf("old_test_signal[%d].ddsnumincrements overwritten\n", dcrc);
	  //now update readback
	  char set_str[80];
	  sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/TestSignal/DDSNumIncrements", whichtower, dcrc);
	  odbWriteInt(set_str, 0, current_test_signal.ddsnumincrements);
	  cm_msg(MINFO, frontend_name, "DDSNumIncrements=%d written to Tower%02d DCRC%d and ReadbackODB", current_test_signal.ddsnumincrements,  whichtower, dcrc);
	}
      }
    }
  }

  
  if(update_mode || current_test_signal.ddsfreqincrement != old_test_signal.ddsfreqincrement){
    if(!update_mode) printf("current_test_signal[%d].ddsfreqincrement changed\n", dcrc);
    //check the new setting, namely that it is positive
    bool valid_check = check_DDSFreqIncrement_register(dcrc, current_test_signal);
    if(valid_check){
      if(dcrc_enabled[dcrc] && !dummyreadout){
	//typecast the struct variables to unsigned int as an extra safeguard
	// to ensure they are postive
	int Register_0x3f = (unsigned int) (current_test_signal.ddsfreqincrement & 0xffff);
	int Register_0x40 = (unsigned int) ((current_test_signal.ddsfreqincrement & 0xffff0000) >> 16);
	int write_success1 = write_DCRC(gDataSocket[dcrc], DDSFreqIncrement_register[0], Register_0x3f);
	int write_success2 = write_DCRC(gDataSocket[dcrc], DDSFreqIncrement_register[1], Register_0x40);
	printf("Register_0x40 = %d written to DCRC\n", Register_0x40);
	printf("Register_0x3f = %d written to DCRC\n", Register_0x3f);
	//now write the new settings to the readback (mirrored) odb
	//but only do so if the card was actually written to
	if(write_success1 >= 0 && write_success2 >= 0){
	  //first write to the old struct
	  old_test_signal.ddsfreqincrement = current_test_signal.ddsfreqincrement;
	  if(!update_mode) printf("old_test_signal[%d].ddsfreqincrement overwritten\n", dcrc);
	  //now update readback
	  char set_str[80];
	  sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/TestSignal/DDSFreqIncrement", whichtower, dcrc);
	  odbWriteDword(set_str, 0, current_test_signal.ddsfreqincrement);
	  cm_msg(MINFO, frontend_name, "DDSFreqIncrement DWORD split into two unsigned ints, %d (Register 0x40) and %d (Register 0x3f)  written to Tower%02d DCRC%d and ReadbackODB", Register_0x40, Register_0x3f,  whichtower, dcrc);
	}
      }
    }
  }
  
  if(update_mode || current_test_signal.ddsincrementinterval != old_test_signal.ddsincrementinterval){
    if(!update_mode) printf("current_test_signal[%d].ddsincrementinterval changed\n", dcrc);
    //check validity of new setting, namely that the ODB variable is positive
    bool valid_check = check_DDSIncrementInterval_register(dcrc, current_test_signal);
    if(valid_check){
      if(dcrc_enabled[dcrc] && !dummyreadout){
	//the struct value should already by positive, otherwise it would have
	// failed the check but convert to unsigned as an extra safeguard
	unsigned int ddsincrementinterval_unsigned = current_test_signal.ddsincrementinterval;
	int write_success = write_DCRC(gDataSocket[dcrc], DDSIncrementInterval_register, ddsincrementinterval_unsigned);
	//now write the new settings to the readback (mirrored) odb
	//but only do so if the card was actually written to
	if(write_success >= 0){
	  //first update the old struct
	  old_test_signal.ddsincrementinterval = current_test_signal.ddsincrementinterval;
	  if(!update_mode) printf("old_test_signal[%d].ddsincrementinterval overwritten\n", dcrc);
	  //now update the readback
	  char set_str[80];
	  sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/TestSignal/DDSIncrementInterval", whichtower, dcrc);
	  odbWriteInt(set_str, 0, current_test_signal.ddsincrementinterval);
	  cm_msg(MINFO, frontend_name, "DDSIncrementInterval=%d written to Tower%02d DCRC%d and ReadbackODB", current_test_signal.ddsincrementinterval,  whichtower, dcrc);
	}
      }
    }
  }

  if(update_mode || current_test_signal.ddsstartfreq != old_test_signal.ddsstartfreq){
    if(!update_mode) printf("current_test_signal[%d].ddsstartfreq changed\n", dcrc);
    //check validity of new setting, namely that the ODB variable is positive
    bool valid_check = check_DDSStartFreq_register(dcrc, current_test_signal);
    if(valid_check){
      if(dcrc_enabled[dcrc] && !dummyreadout){
	//typecast the struct variables to unsigned int as an extra safeguard
	// to ensure they are postive
	// The DCRC test signal frequency is specified in units of 
	// 40MHz/2^24=2.384186.  So convert
	float freqconversion = 40000000./16777216.;
	// DCRC Rev C uses a 50MHz clock
	if (dcrc_rev[dcrc] == 3.) freqconversion = 50000000./16777216.;
	int digital_freq_setting = int(current_test_signal.ddsstartfreq/freqconversion);  
 	int Register_0x42 = (unsigned int) (digital_freq_setting & 0xfff);
	int Register_0x43 = (unsigned int) ((digital_freq_setting & 0xfff000) >> 12);
	int write_success1 = write_DCRC(gDataSocket[dcrc], DDSStartFreq_register[0], Register_0x42);
	int write_success2 = write_DCRC(gDataSocket[dcrc], DDSStartFreq_register[1], Register_0x43);
	//now write the new settings to the readback (mirrored) odb
	//but only do so if the card was actually written to
	if(write_success1 >= 0 && write_success2){
	  //first update the old struct
	  old_test_signal.ddsstartfreq = current_test_signal.ddsstartfreq;
	  if(!update_mode) printf("old_test_signal[%d].ddsstartfreq overwritten\n", dcrc);
	  //now update the readback
	  char set_str[80];
	  sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/TestSignal/DDSStartFreq", whichtower, dcrc);
	  odbWriteDword(set_str, 0, current_test_signal.ddsstartfreq);
	  cm_msg(MINFO, frontend_name, "DDSStartFreq DWORD split into two unsigned ints, %d (Register 0x43) and %d (Register 0x42)  written to Tower%02d DCRC%d and ReadbackODB", Register_0x43, Register_0x42,  whichtower, dcrc);
	  printf("Register_0x43 = %d written to DCRC\n", Register_0x43);
	  printf("Register_0x42 = %d written to DCRC\n", Register_0x42);
	}
      }
    }
  }
  
  if(update_mode || current_test_signal.ddsdacscaling != old_test_signal.ddsdacscaling){
    if(!update_mode) printf("current_test_signal[%d].ddsdacscaling changed\n", dcrc);
    //check the the setting change is valid, namely that it's less than
    // 4096 and not negative.
    bool valid_check = check_DDSDACScaling_register(dcrc, current_test_signal);
    if(valid_check){
      if(dcrc_enabled[dcrc] && !dummyreadout){
	//here we use an unsigned int in order to prevent negative value from
	// being written.  if an unsigned int is set to a negative it is a large
	// value (2^[65536]-[the negative value])
	unsigned int ddsdacscaling_unsigned = current_test_signal.ddsdacscaling;
	int write_success = write_DCRC(gDataSocket[dcrc], DDSDACScaling_register, ddsdacscaling_unsigned);		
	//now write the new settings to the readback (mirrored) odb
	//but only do so if the card was actually written to
	if(write_success >= 0){
	  //first update the old struct
	  old_test_signal.ddsdacscaling = current_test_signal.ddsdacscaling;
	  if(!update_mode) printf("old_test_signal[%d].ddsdacscaling overwritten\n", dcrc);
	  //now update the readback
	  char set_str[80];
	  sprintf (set_str,"/Equipment/Tower%02d/Readback/DCRC%1d/TestSignal/DDSDACScaling", whichtower, dcrc);
	  odbWriteInt(set_str, 0, current_test_signal.ddsdacscaling);
	  cm_msg(MINFO, frontend_name, "DDSDACScaling=%d written to Tower%02d DCRC%d and ReadbackODB", current_test_signal.ddsdacscaling,  whichtower, dcrc);
	}
      }
    }
  }
}
 
bool check_DDSControlReg_register(int dcrc, TESTSIGNAL &current_test_signal){
  bool valid_check = 1;
  if(current_test_signal.ddscontrolreg < 0){
    valid_check = 0;
    cm_msg(MERROR, frontend_name, "ERROR: Requested value for current_test_signal[%d].ddscontrolreg of %d is negative and not allowed. Keeping previous value for Register 0x3d", dcrc, current_test_signal.ddscontrolreg);
  }
  return valid_check;
}

bool check_DDSNumIncrements_register(int dcrc, TESTSIGNAL &current_test_signal){
  bool valid_check = 1;
  if(current_test_signal.ddsnumincrements < 0){
    valid_check = 0;
    cm_msg(MERROR, frontend_name, "ERROR: Requested value for current_test_signal[%d].ddsnumincrements of %d is negative and not allowed. Keeping previous value for Register 0x3e", dcrc, current_test_signal.ddsnumincrements);
  }
  return valid_check;
}

bool check_DDSFreqIncrement_register(int dcrc, TESTSIGNAL &current_test_signal){
  bool valid_check = 1;
  if(current_test_signal.ddsfreqincrement < 0){
    valid_check = 0;
    cm_msg(MERROR, frontend_name, "ERROR: Requested value for current_test_signal[%d].ddsfreqincrement of %d is negative and not allowed. Keeping previous value for Register 0xx3f, 0x40", dcrc, current_test_signal.ddsfreqincrement);
  }
  return valid_check;
}

bool check_DDSIncrementInterval_register(int dcrc, TESTSIGNAL &current_test_signal){
  bool valid_check = 1;
  if(current_test_signal.ddsincrementinterval < 0){
    valid_check = 0;
    cm_msg(MERROR, frontend_name, "ERROR: Requested value for current_test_signal[%d].ddsincrementinterval of %d is negative and not allowed. Keeping previous value for register 0x41.", dcrc, current_test_signal.ddsincrementinterval);
  }
  return valid_check;
}

bool check_DDSStartFreq_register(int dcrc, TESTSIGNAL &current_test_signal){
  bool valid_check = 1;
  //this is actually a very dumb check
  //ddsstartfreq is a DWORD so it cannot be
  //negative by definition.  Leave this function
  //in, though, because we may want to check the value
  //later and put some different restrictions onto it
  if(current_test_signal.ddsstartfreq < 0){
    valid_check = 0;
    cm_msg(MERROR, frontend_name, "ERROR: Requested value for current_test_signal[%d].ddsstartfreq of %d is negative and not allowed. Keeping previous value for Register 0x42 and 0x43", dcrc, current_test_signal.ddsstartfreq);
  }
  // Maximum possible setting is 40MHz
  if(current_test_signal.ddsstartfreq > 40000000){
    valid_check = 0;
    cm_msg(MERROR, frontend_name, "ERROR: Requested value for current_test_signal[%d].ddsstartfreq of %d is >40MHz and not allowed. Keeping previous value for Register 0x42 and 0x43", dcrc, current_test_signal.ddsstartfreq);
  }
  return valid_check;
}

 bool check_DDSDACScaling_register(int dcrc, TESTSIGNAL &current_test_signal){
   bool valid_check = 1;
   //here we use an unsigned int in order to prevent negative value from
   // being written.  if an unsigned int is set to a negative it is a large
   // value (2^[65536]-[the negative value])
   unsigned int ddsdacscaling_unsigned = current_test_signal.ddsdacscaling;
   if (ddsdacscaling_unsigned > 0x0fff){
     valid_check = 0;
     cm_msg(MERROR, frontend_name, "ERROR: Requested value for current_test_signal[%d].ddsdacscaling of %d is larger than maximum of 4095 or negative. Keeping previous value of Register 0x44.", dcrc, current_test_signal.ddsdacscaling);
   }
   return valid_check;
 }
    

int compute_0x3c_register(int dcrc, TESTSIGNAL &current_test_signal, GENERAL &current_general){
  int Register_0x3c = 0;
  for(int phonon_channel = 0; phonon_channel < MAX_PHONON_CHANNEL; phonon_channel++){
    if(current_test_signal.connecttesttoqet[phonon_channel]){
      Register_0x3c += (0x1 << (phonon_channel*4));
    }
  }
  if(current_test_signal.ddschipcontrolpin){
    //wap: modification 151203. while bit 14 is unused for rev3.1=revC.1,
    //it is labeled "50Mhz Osc. Enable" for rev C.0 and the test signal
    //doesn't seem to turn on without this on C.0 boards.
    //
    //For rev C.0 the on/off switch is bit 14 (not 13)
    //If rev C.0 is still being used heavily a separate ODB variable
    //should be created that controls bit 14 exclusively, since 
    //ddschipcontrolpin is really bit 13
    if(dcrc_rev[dcrc] == 3.){
      Register_0x3c += (0x1 << 14);
    }
    else{
      Register_0x3c += (0x1 << 13);
    }
  }
  if(current_general.qetbiasrangeselect){
    Register_0x3c += (0x1 << 15);
  }
  return Register_0x3c;
}
