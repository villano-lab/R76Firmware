#include "KOsocket.h"
#include "dcrc_driver.h"
#include <sys/time.h>
#include <string.h>
#include <stdio.h>
//A function that writes to a DCRC register given a DataSocket, register, and value to write              
int write_DCRC(KOsocket *gDataSocket, int register_number, int register_value);
