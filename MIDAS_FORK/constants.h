const int MAX_DCRCs = 6;
const int NUM_UPDATE_MODES = 2;

const int MAX_CHARGE_CHANNEL = 2;
const int MAX_PHONON_CHANNEL = 4;

const int General_register = 0x15;

const int PhononChargeTriggerEnable_register = 0x17;
const int PhononChargeTriggerBaselineLength_register = 0x18;
const int PhononChargeTriggerSampleLength_register = 0x19;
const int PhononTriggerThreshold_register[4] = {0x1a, 0x1b, 0x1c, 0x1d};
const int ChargeTriggerThreshold_register[2] = {0x1e, 0x1f};

const int LEDPulseWidth_register = 0x27;
const int LEDRepRate_register = 0x28;
const int LEDADCControl_register = 0x33;
const int LED1Current_register = 0x34;
const int LEDEnableConnectStepZap15VPowerHeat_register = 0x30;
const int LED2Current_register = 0x35;

const int TestSignal_register = 0x3c;
const int DDSControlReg_register = 0x3D;
const int DDSNumIncrements_register = 0x3E;
const int DDSFreqIncrement_register[2] = {0x3f, 0x40};
const int DDSIncrementInterval_register = 0x41;
const int DDSStartFreq_register[2] = {0x42, 0x43};
const int DDSDACScaling_register = 0x44;

const int VGAGain_register[4] = {0x38, 0x39, 0x3a, 0x3b};
const int ADCOffset_register[4] = {0x47, 0x4b, 0x51, 0x55};
const int LockpointAdjust_register[4] = {0x48, 0x4c, 0x52, 0x56};
const int SQUIDBias_register[4] = {0x49, 0x4d, 0x53, 0x57};
const int QETBias_register[4] = {0x4a, 0x4e, 0x54, 0x58};
const int PolPGAGainADCSignalTestSQUID_register[2] = {0x45, 0x4f};
const int DACControlPhononAB_register = 0x46;
const int DACControlPhononCD_register = 0x50;


const int AmpOffset_register[2] = {0x36, 0x37};
const int ChargeBias_register[2] = {0x59, 0x5A};
