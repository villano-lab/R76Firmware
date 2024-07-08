#!/usr/bin/python3

import os.path
import sys

if len(sys.argv) != 3:
  print ('This program requires exactly one argument\n')
  exit(0);
  
input_file_name = str(sys.argv[1])
  

if (not os.path.isfile(input_file_name) ) :
  print ('File: ' + input_file_name + ' does not exists!\n')
  exit(0);    
    
file = open(input_file_name, "rb")
filew = open(sys.argv[2], "wb")


while True:
  byte1 = file.read(1)
  if not byte1:
    break
  byte2 = file.read(1)
  byte3 = file.read(1)
  byte4 = file.read(1)
  filew.write(byte4)
  filew.write(byte3)
  filew.write(byte2)
  filew.write(byte1)
    