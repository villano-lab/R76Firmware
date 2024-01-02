INT whichtower;

static BOOL dcrc_enabled[7];
static std::string gDcrcIPAddress[7];
static int gDcrcPort[7] = {0,0,0,0,0,0,0};

// Lengths of waveforms to be read out (values are defaults, changeable through ODB)
int phonon_nbytes[7]= {8192,8192,8192,8192,8192,8192,8192};
int charge_nbytes[7] = {4096,4096,4096,4096,4096,4096,4096};

unsigned int phononprepulse[7]= {0,0,0,0,0,0,0};
unsigned int chargeprepulse[7] = {0,0,0,0,0,0,0};

// Glboal variables to store the time and circular waveform buffer phase of the last rt command
double timeoflastrt = 0;
int dcrctimestamp;

// end of file
