#include "convert_functions.h"

int convert_float_to_dac (float setting, int intercept, int slope, float unit, int max)
{
  int result = int(intercept + setting/(slope*unit)+.5);
  if (result < 0) result=0;
  if (result > max) result=max;

  return(result);
}
