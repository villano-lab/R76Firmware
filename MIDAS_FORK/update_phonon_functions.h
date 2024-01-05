
void compare_overwrite_phonon(int whichtower, int dcrc, int update_mode, PHONON &old_phonon, PHONON &current_phonon);


bool check_VGAGain_register(int dcrc, int phonon_channel, PHONON &current_phonon);


bool check_ADCOffset_register(int dcrc, int phonon_channel, PHONON &current_phonon);

bool check_LockpointAdjust_register(int dcrc, int phonon_channel, PHONON &current_phonon);


bool check_SQUIDBias_register(int dcrc, int phonon_channel, PHONON &current_phonon);

bool check_QETBias_register(int dcrc, int phonon_channel, PHONON &current_phonon);

bool check_phonon_polarity_pgagain_two_channels(int dcrc, int start_channel, PHONON &current_phonon);

bool check_phonon_polarity(int dcrc, int phonon_channel, PHONON &current_phonon);

bool check_phonon_pgagain(int dcrc, int phonon_channel, PHONON &current_phonon);

bool check_DACControlPhonon_register(int dcrc, PHONON &current_phonon, int cd);

int compute_0x45_0x4f_register(PHONON &current_phonon, int register_to_update, int dcrc);
