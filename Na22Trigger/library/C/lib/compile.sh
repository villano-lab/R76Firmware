#!/bin/bash
gcc -o ratefinder.exe src/ratefinder.c -L. ./gcc/Na22Trigger0.so ../../../../r5560_sdk/linux/libr5560.so.1.0.0
