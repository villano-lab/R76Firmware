void compare_overwrite_charge(int whichtower, int dcrc, int update_mode, CHARGE &old_charge, CHARGE &current_charge, int calib[][7]);

bool check_charge_ampoffset(int dcrc_index, int charge_channel, CHARGE &current_charge);

bool check_charge_bias(int dcrc_index, int charge_channel, CHARGE &current_charge);
