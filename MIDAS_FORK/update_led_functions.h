
bool check_LEDPulseWidth_register(int dcrc, LED &current_led);

bool check_LEDRepRate_register(int dcrc, LED &current_led);

bool check_LEDCurrent_register(int dcrc, int led_num, LED &current_led);

void compare_overwrite_led(int whichtower, int dcrc, int update_mode, LED &old_led, LED &current_led, GENERAL &current_general, GENERAL &old_general);

int compute_0x30_register(LED &current_led, GENERAL &current_general);
