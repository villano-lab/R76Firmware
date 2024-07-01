#include "write_DCRC.h"
#include "dcrc_driver.h"


int write_DCRC(KOsocket *gDataSocket, int register_number, int register_value){
  char command[100];
  
  sprintf(command, "wr %02x %04x\rrd %02x", register_number, register_value,
	  register_number); 
  gDataSocket->write(command, strlen(command)+1);
  
  // Read back the value that was returned
  char tempbuffer[10];
  
  struct timeval starttime, stoptime;
  gettimeofday(&starttime, NULL); 
  
  int avail = gDataSocket->available();
  while(!avail){
    avail = gDataSocket->available();
    gettimeofday(&stoptime, NULL);
    if (stoptime.tv_sec-starttime.tv_sec > 4) {
      cm_msg(MERROR, frontend_name, "Error in dcrc_driver.exe on Tower%02d: no reply within 5 seconds", whichtower);
      return -1;
    }; 
  }
  gDataSocket->readFully(tempbuffer,6);
  
  return 1;

}
