from Na22Trigger0_Functions import *
from ctypes import *
import matplotlib.pyplot as plt
import time

board = "192.168.15.116"

if (1==1):

    Init()
    [err, handle] = ConnectDevice(board)
    if (err == 0):
        print("Successful connection to board ", board)
    else:
        print("Connection Error")


