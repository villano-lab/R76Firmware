from asdf_Functions import *
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


    Spectrum_acq_mode = "Free" #"Free", "Events", "Time"
    Spectrum_target_value = 0
    Spectrum_bin = 1024
    Timeout_ms = 1000
    Spectrum=[]
    for i in range(Spectrum_bin):
        Spectrum.append(0)

    plt.ion()
    if (SPECTRUM_Spectrum_0_SET_PARAMETERS(Spectrum_bin, Spectrum_acq_mode, Spectrum_target_value, handle) != 0): 
        print("Set Parameters Error")    
    if (SPECTRUM_Spectrum_0_RESET(handle) != 0): 
        print("Reset Error")
    if (SPECTRUM_Spectrum_0_FLUSH(handle) != 0): 
        print("Flush Error")
    if (SPECTRUM_Spectrum_0_START(handle) == 0):
        while 1:
            [err, Spectrum_Status] = SPECTRUM_Spectrum_0_GET_STATUS(handle)
            [err, Spectrum_Data, Spectrum_Read_Data, Spectrum_Valid_Data] = SPECTRUM_Spectrum_0_GET_DATA(Spectrum_bin, Timeout_ms, handle)
            for i in range(Spectrum_bin):
                Spectrum[i] = Spectrum_Data[i] 
            plt.plot(Spectrum)
            plt.draw()
            plt.pause(0.0001)
            plt.clf()        

    else:
        print("Start Error")

*/
