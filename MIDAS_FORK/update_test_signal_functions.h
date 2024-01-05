
void compare_overwrite_test_signal(int whichtower, int dcrc, int update_mode, TESTSIGNAL &old_test_signal, TESTSIGNAL &current_test_signal, GENERAL &current_general, GENERAL &old_general);

bool check_DDSNumIncrements_register(int dcrc, TESTSIGNAL &current_test_signal);

bool check_DDSFreqIncrement_register(int dcrc, TESTSIGNAL &current_test_signal);

bool check_DDSIncrementInterval_register(int dcrc, TESTSIGNAL &current_test_signal);

bool check_DDSStartFreq_register(int dcrc, TESTSIGNAL &current_test_signal);

bool check_DDSDACScaling_register(int dcrc, TESTSIGNAL &current_test_signal);

bool check_DDSControlReg_register(int dcrc, TESTSIGNAL &current_test_signal);

int compute_0x3c_register(int dcrc, TESTSIGNAL &current_test_signal, GENERAL &current_general);

