
void compare_overwrite_general(int whichtower, int dcrc, int update_mode, GENERAL &old_general, GENERAL &current_general, LED &current_led, TESTSIGNAL &current_test_signal);


bool check_vxofreqlockref(int dcrc, GENERAL &current_general, GENERAL &old_general);


int compute_0x15_register(int dcrc, GENERAL &current_general);


