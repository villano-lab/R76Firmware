
void compare_overwrite_trigger(int whichtower, int dcrc, int update_mode, TRIGGER &old_trigger, TRIGGER &current_trigger);

bool check_0x18_register(int dcrc, TRIGGER &current_trigger);

bool check_0x19_register(int dcrc, TRIGGER &current_trigger);

bool check_phonontriggerthreshold_register(int dcrc, int phonon_channel, TRIGGER &current_trigger);

bool check_chargetriggerthreshold_register(int dcrc, int charge_channel, TRIGGER &current_trigger);


int compute_0x17_register(TRIGGER &current_trigger);
