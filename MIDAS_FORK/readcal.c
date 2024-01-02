
#include "stdlib.h"
#include <stdio.h>

int main(){

  FILE *f;
  char buf[200+50+2];

  char *path = getenv("MIDAS_ONLINE");
  char filename[256]; 
  sprintf(filename,"%s/src/RevC/calibrations/tower01dcrc02.cal",path);

  printf("%s\n",filename);
  f = fopen(filename,"r");
  fgets(buf,200+50+2,(FILE*)f);
  printf("%s\n",buf);
  fclose(f);

  return 0;
}
