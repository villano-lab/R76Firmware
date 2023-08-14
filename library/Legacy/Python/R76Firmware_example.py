from R76Firmware_Functions import *
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
    if (SPECTRUM_Spectrum_1_SET_PARAMETERS(Spectrum_bin, Spectrum_acq_mode, Spectrum_target_value, handle) != 0): 
        print("Set Parameters Error")    
    if (SPECTRUM_Spectrum_1_RESET(handle) != 0): 
        print("Reset Error")
    if (SPECTRUM_Spectrum_1_FLUSH(handle) != 0): 
        print("Flush Error")
    if (SPECTRUM_Spectrum_1_START(handle) == 0):
        while 1:
            [err, Spectrum_Status] = SPECTRUM_Spectrum_1_GET_STATUS(handle)
            [err, Spectrum_Data, Spectrum_Read_Data, Spectrum_Valid_Data] = SPECTRUM_Spectrum_1_GET_DATA(Spectrum_bin, Timeout_ms, handle)
            for i in range(Spectrum_bin):
                Spectrum[i] = Spectrum_Data[i] 
            plt.plot(Spectrum)
            plt.draw()
            plt.pause(0.0001)
            plt.clf()        

    else:
        print("Start Error")

*/
    Spectrum_acq_mode = "Free" #"Free", "Events", "Time"
    Spectrum_target_value = 0
    Spectrum_bin = 1024
    Timeout_ms = 1000
    Spectrum=[]
    for i in range(Spectrum_bin):
        Spectrum.append(0)

    plt.ion()
    if (SPECTRUM_Spectrum_2_SET_PARAMETERS(Spectrum_bin, Spectrum_acq_mode, Spectrum_target_value, handle) != 0): 
        print("Set Parameters Error")    
    if (SPECTRUM_Spectrum_2_RESET(handle) != 0): 
        print("Reset Error")
    if (SPECTRUM_Spectrum_2_FLUSH(handle) != 0): 
        print("Flush Error")
    if (SPECTRUM_Spectrum_2_START(handle) == 0):
        while 1:
            [err, Spectrum_Status] = SPECTRUM_Spectrum_2_GET_STATUS(handle)
            [err, Spectrum_Data, Spectrum_Read_Data, Spectrum_Valid_Data] = SPECTRUM_Spectrum_2_GET_DATA(Spectrum_bin, Timeout_ms, handle)
            for i in range(Spectrum_bin):
                Spectrum[i] = Spectrum_Data[i] 
            plt.plot(Spectrum)
            plt.draw()
            plt.pause(0.0001)
            plt.clf()        

    else:
        print("Start Error")

*/
    Spectrum_acq_mode = "Free" #"Free", "Events", "Time"
    Spectrum_target_value = 0
    Spectrum_bin = 1024
    Timeout_ms = 1000
    Spectrum=[]
    for i in range(Spectrum_bin):
        Spectrum.append(0)

    plt.ion()
    if (SPECTRUM_Spectrum_3_SET_PARAMETERS(Spectrum_bin, Spectrum_acq_mode, Spectrum_target_value, handle) != 0): 
        print("Set Parameters Error")    
    if (SPECTRUM_Spectrum_3_RESET(handle) != 0): 
        print("Reset Error")
    if (SPECTRUM_Spectrum_3_FLUSH(handle) != 0): 
        print("Flush Error")
    if (SPECTRUM_Spectrum_3_START(handle) == 0):
        while 1:
            [err, Spectrum_Status] = SPECTRUM_Spectrum_3_GET_STATUS(handle)
            [err, Spectrum_Data, Spectrum_Read_Data, Spectrum_Valid_Data] = SPECTRUM_Spectrum_3_GET_DATA(Spectrum_bin, Timeout_ms, handle)
            for i in range(Spectrum_bin):
                Spectrum[i] = Spectrum_Data[i] 
            plt.plot(Spectrum)
            plt.draw()
            plt.pause(0.0001)
            plt.clf()        

    else:
        print("Start Error")

*/
    Spectrum_acq_mode = "Free" #"Free", "Events", "Time"
    Spectrum_target_value = 0
    Spectrum_bin = 1024
    Timeout_ms = 1000
    Spectrum=[]
    for i in range(Spectrum_bin):
        Spectrum.append(0)

    plt.ion()
    if (SPECTRUM_Spectrum_4_SET_PARAMETERS(Spectrum_bin, Spectrum_acq_mode, Spectrum_target_value, handle) != 0): 
        print("Set Parameters Error")    
    if (SPECTRUM_Spectrum_4_RESET(handle) != 0): 
        print("Reset Error")
    if (SPECTRUM_Spectrum_4_FLUSH(handle) != 0): 
        print("Flush Error")
    if (SPECTRUM_Spectrum_4_START(handle) == 0):
        while 1:
            [err, Spectrum_Status] = SPECTRUM_Spectrum_4_GET_STATUS(handle)
            [err, Spectrum_Data, Spectrum_Read_Data, Spectrum_Valid_Data] = SPECTRUM_Spectrum_4_GET_DATA(Spectrum_bin, Timeout_ms, handle)
            for i in range(Spectrum_bin):
                Spectrum[i] = Spectrum_Data[i] 
            plt.plot(Spectrum)
            plt.draw()
            plt.pause(0.0001)
            plt.clf()        

    else:
        print("Start Error")

*/
    Spectrum_acq_mode = "Free" #"Free", "Events", "Time"
    Spectrum_target_value = 0
    Spectrum_bin = 1024
    Timeout_ms = 1000
    Spectrum=[]
    for i in range(Spectrum_bin):
        Spectrum.append(0)

    plt.ion()
    if (SPECTRUM_Spectrum_5_SET_PARAMETERS(Spectrum_bin, Spectrum_acq_mode, Spectrum_target_value, handle) != 0): 
        print("Set Parameters Error")    
    if (SPECTRUM_Spectrum_5_RESET(handle) != 0): 
        print("Reset Error")
    if (SPECTRUM_Spectrum_5_FLUSH(handle) != 0): 
        print("Flush Error")
    if (SPECTRUM_Spectrum_5_START(handle) == 0):
        while 1:
            [err, Spectrum_Status] = SPECTRUM_Spectrum_5_GET_STATUS(handle)
            [err, Spectrum_Data, Spectrum_Read_Data, Spectrum_Valid_Data] = SPECTRUM_Spectrum_5_GET_DATA(Spectrum_bin, Timeout_ms, handle)
            for i in range(Spectrum_bin):
                Spectrum[i] = Spectrum_Data[i] 
            plt.plot(Spectrum)
            plt.draw()
            plt.pause(0.0001)
            plt.clf()        

    else:
        print("Start Error")

*/
    Spectrum_acq_mode = "Free" #"Free", "Events", "Time"
    Spectrum_target_value = 0
    Spectrum_bin = 1024
    Timeout_ms = 1000
    Spectrum=[]
    for i in range(Spectrum_bin):
        Spectrum.append(0)

    plt.ion()
    if (SPECTRUM_Spectrum_6_SET_PARAMETERS(Spectrum_bin, Spectrum_acq_mode, Spectrum_target_value, handle) != 0): 
        print("Set Parameters Error")    
    if (SPECTRUM_Spectrum_6_RESET(handle) != 0): 
        print("Reset Error")
    if (SPECTRUM_Spectrum_6_FLUSH(handle) != 0): 
        print("Flush Error")
    if (SPECTRUM_Spectrum_6_START(handle) == 0):
        while 1:
            [err, Spectrum_Status] = SPECTRUM_Spectrum_6_GET_STATUS(handle)
            [err, Spectrum_Data, Spectrum_Read_Data, Spectrum_Valid_Data] = SPECTRUM_Spectrum_6_GET_DATA(Spectrum_bin, Timeout_ms, handle)
            for i in range(Spectrum_bin):
                Spectrum[i] = Spectrum_Data[i] 
            plt.plot(Spectrum)
            plt.draw()
            plt.pause(0.0001)
            plt.clf()        

    else:
        print("Start Error")

*/
    Spectrum_acq_mode = "Free" #"Free", "Events", "Time"
    Spectrum_target_value = 0
    Spectrum_bin = 1024
    Timeout_ms = 1000
    Spectrum=[]
    for i in range(Spectrum_bin):
        Spectrum.append(0)

    plt.ion()
    if (SPECTRUM_Spectrum_7_SET_PARAMETERS(Spectrum_bin, Spectrum_acq_mode, Spectrum_target_value, handle) != 0): 
        print("Set Parameters Error")    
    if (SPECTRUM_Spectrum_7_RESET(handle) != 0): 
        print("Reset Error")
    if (SPECTRUM_Spectrum_7_FLUSH(handle) != 0): 
        print("Flush Error")
    if (SPECTRUM_Spectrum_7_START(handle) == 0):
        while 1:
            [err, Spectrum_Status] = SPECTRUM_Spectrum_7_GET_STATUS(handle)
            [err, Spectrum_Data, Spectrum_Read_Data, Spectrum_Valid_Data] = SPECTRUM_Spectrum_7_GET_DATA(Spectrum_bin, Timeout_ms, handle)
            for i in range(Spectrum_bin):
                Spectrum[i] = Spectrum_Data[i] 
            plt.plot(Spectrum)
            plt.draw()
            plt.pause(0.0001)
            plt.clf()        

    else:
        print("Start Error")

*/
    Spectrum_acq_mode = "Free" #"Free", "Events", "Time"
    Spectrum_target_value = 0
    Spectrum_bin = 1024
    Timeout_ms = 1000
    Spectrum=[]
    for i in range(Spectrum_bin):
        Spectrum.append(0)

    plt.ion()
    if (SPECTRUM_Spectrum_8_SET_PARAMETERS(Spectrum_bin, Spectrum_acq_mode, Spectrum_target_value, handle) != 0): 
        print("Set Parameters Error")    
    if (SPECTRUM_Spectrum_8_RESET(handle) != 0): 
        print("Reset Error")
    if (SPECTRUM_Spectrum_8_FLUSH(handle) != 0): 
        print("Flush Error")
    if (SPECTRUM_Spectrum_8_START(handle) == 0):
        while 1:
            [err, Spectrum_Status] = SPECTRUM_Spectrum_8_GET_STATUS(handle)
            [err, Spectrum_Data, Spectrum_Read_Data, Spectrum_Valid_Data] = SPECTRUM_Spectrum_8_GET_DATA(Spectrum_bin, Timeout_ms, handle)
            for i in range(Spectrum_bin):
                Spectrum[i] = Spectrum_Data[i] 
            plt.plot(Spectrum)
            plt.draw()
            plt.pause(0.0001)
            plt.clf()        

    else:
        print("Start Error")

*/
    Spectrum_acq_mode = "Free" #"Free", "Events", "Time"
    Spectrum_target_value = 0
    Spectrum_bin = 1024
    Timeout_ms = 1000
    Spectrum=[]
    for i in range(Spectrum_bin):
        Spectrum.append(0)

    plt.ion()
    if (SPECTRUM_Spectrum_9_SET_PARAMETERS(Spectrum_bin, Spectrum_acq_mode, Spectrum_target_value, handle) != 0): 
        print("Set Parameters Error")    
    if (SPECTRUM_Spectrum_9_RESET(handle) != 0): 
        print("Reset Error")
    if (SPECTRUM_Spectrum_9_FLUSH(handle) != 0): 
        print("Flush Error")
    if (SPECTRUM_Spectrum_9_START(handle) == 0):
        while 1:
            [err, Spectrum_Status] = SPECTRUM_Spectrum_9_GET_STATUS(handle)
            [err, Spectrum_Data, Spectrum_Read_Data, Spectrum_Valid_Data] = SPECTRUM_Spectrum_9_GET_DATA(Spectrum_bin, Timeout_ms, handle)
            for i in range(Spectrum_bin):
                Spectrum[i] = Spectrum_Data[i] 
            plt.plot(Spectrum)
            plt.draw()
            plt.pause(0.0001)
            plt.clf()        

    else:
        print("Start Error")

*/
    Spectrum_acq_mode = "Free" #"Free", "Events", "Time"
    Spectrum_target_value = 0
    Spectrum_bin = 1024
    Timeout_ms = 1000
    Spectrum=[]
    for i in range(Spectrum_bin):
        Spectrum.append(0)

    plt.ion()
    if (SPECTRUM_Spectrum_10_SET_PARAMETERS(Spectrum_bin, Spectrum_acq_mode, Spectrum_target_value, handle) != 0): 
        print("Set Parameters Error")    
    if (SPECTRUM_Spectrum_10_RESET(handle) != 0): 
        print("Reset Error")
    if (SPECTRUM_Spectrum_10_FLUSH(handle) != 0): 
        print("Flush Error")
    if (SPECTRUM_Spectrum_10_START(handle) == 0):
        while 1:
            [err, Spectrum_Status] = SPECTRUM_Spectrum_10_GET_STATUS(handle)
            [err, Spectrum_Data, Spectrum_Read_Data, Spectrum_Valid_Data] = SPECTRUM_Spectrum_10_GET_DATA(Spectrum_bin, Timeout_ms, handle)
            for i in range(Spectrum_bin):
                Spectrum[i] = Spectrum_Data[i] 
            plt.plot(Spectrum)
            plt.draw()
            plt.pause(0.0001)
            plt.clf()        

    else:
        print("Start Error")

*/
    Spectrum_acq_mode = "Free" #"Free", "Events", "Time"
    Spectrum_target_value = 0
    Spectrum_bin = 1024
    Timeout_ms = 1000
    Spectrum=[]
    for i in range(Spectrum_bin):
        Spectrum.append(0)

    plt.ion()
    if (SPECTRUM_Spectrum_11_SET_PARAMETERS(Spectrum_bin, Spectrum_acq_mode, Spectrum_target_value, handle) != 0): 
        print("Set Parameters Error")    
    if (SPECTRUM_Spectrum_11_RESET(handle) != 0): 
        print("Reset Error")
    if (SPECTRUM_Spectrum_11_FLUSH(handle) != 0): 
        print("Flush Error")
    if (SPECTRUM_Spectrum_11_START(handle) == 0):
        while 1:
            [err, Spectrum_Status] = SPECTRUM_Spectrum_11_GET_STATUS(handle)
            [err, Spectrum_Data, Spectrum_Read_Data, Spectrum_Valid_Data] = SPECTRUM_Spectrum_11_GET_DATA(Spectrum_bin, Timeout_ms, handle)
            for i in range(Spectrum_bin):
                Spectrum[i] = Spectrum_Data[i] 
            plt.plot(Spectrum)
            plt.draw()
            plt.pause(0.0001)
            plt.clf()        

    else:
        print("Start Error")

*/
    Spectrum_acq_mode = "Free" #"Free", "Events", "Time"
    Spectrum_target_value = 0
    Spectrum_bin = 1024
    Timeout_ms = 1000
    Spectrum=[]
    for i in range(Spectrum_bin):
        Spectrum.append(0)

    plt.ion()
    if (SPECTRUM_Spectrum_12_SET_PARAMETERS(Spectrum_bin, Spectrum_acq_mode, Spectrum_target_value, handle) != 0): 
        print("Set Parameters Error")    
    if (SPECTRUM_Spectrum_12_RESET(handle) != 0): 
        print("Reset Error")
    if (SPECTRUM_Spectrum_12_FLUSH(handle) != 0): 
        print("Flush Error")
    if (SPECTRUM_Spectrum_12_START(handle) == 0):
        while 1:
            [err, Spectrum_Status] = SPECTRUM_Spectrum_12_GET_STATUS(handle)
            [err, Spectrum_Data, Spectrum_Read_Data, Spectrum_Valid_Data] = SPECTRUM_Spectrum_12_GET_DATA(Spectrum_bin, Timeout_ms, handle)
            for i in range(Spectrum_bin):
                Spectrum[i] = Spectrum_Data[i] 
            plt.plot(Spectrum)
            plt.draw()
            plt.pause(0.0001)
            plt.clf()        

    else:
        print("Start Error")

*/
    Spectrum_acq_mode = "Free" #"Free", "Events", "Time"
    Spectrum_target_value = 0
    Spectrum_bin = 1024
    Timeout_ms = 1000
    Spectrum=[]
    for i in range(Spectrum_bin):
        Spectrum.append(0)

    plt.ion()
    if (SPECTRUM_Spectrum_13_SET_PARAMETERS(Spectrum_bin, Spectrum_acq_mode, Spectrum_target_value, handle) != 0): 
        print("Set Parameters Error")    
    if (SPECTRUM_Spectrum_13_RESET(handle) != 0): 
        print("Reset Error")
    if (SPECTRUM_Spectrum_13_FLUSH(handle) != 0): 
        print("Flush Error")
    if (SPECTRUM_Spectrum_13_START(handle) == 0):
        while 1:
            [err, Spectrum_Status] = SPECTRUM_Spectrum_13_GET_STATUS(handle)
            [err, Spectrum_Data, Spectrum_Read_Data, Spectrum_Valid_Data] = SPECTRUM_Spectrum_13_GET_DATA(Spectrum_bin, Timeout_ms, handle)
            for i in range(Spectrum_bin):
                Spectrum[i] = Spectrum_Data[i] 
            plt.plot(Spectrum)
            plt.draw()
            plt.pause(0.0001)
            plt.clf()        

    else:
        print("Start Error")

*/
    Spectrum_acq_mode = "Free" #"Free", "Events", "Time"
    Spectrum_target_value = 0
    Spectrum_bin = 1024
    Timeout_ms = 1000
    Spectrum=[]
    for i in range(Spectrum_bin):
        Spectrum.append(0)

    plt.ion()
    if (SPECTRUM_Spectrum_14_SET_PARAMETERS(Spectrum_bin, Spectrum_acq_mode, Spectrum_target_value, handle) != 0): 
        print("Set Parameters Error")    
    if (SPECTRUM_Spectrum_14_RESET(handle) != 0): 
        print("Reset Error")
    if (SPECTRUM_Spectrum_14_FLUSH(handle) != 0): 
        print("Flush Error")
    if (SPECTRUM_Spectrum_14_START(handle) == 0):
        while 1:
            [err, Spectrum_Status] = SPECTRUM_Spectrum_14_GET_STATUS(handle)
            [err, Spectrum_Data, Spectrum_Read_Data, Spectrum_Valid_Data] = SPECTRUM_Spectrum_14_GET_DATA(Spectrum_bin, Timeout_ms, handle)
            for i in range(Spectrum_bin):
                Spectrum[i] = Spectrum_Data[i] 
            plt.plot(Spectrum)
            plt.draw()
            plt.pause(0.0001)
            plt.clf()        

    else:
        print("Start Error")

*/
    Spectrum_acq_mode = "Free" #"Free", "Events", "Time"
    Spectrum_target_value = 0
    Spectrum_bin = 1024
    Timeout_ms = 1000
    Spectrum=[]
    for i in range(Spectrum_bin):
        Spectrum.append(0)

    plt.ion()
    if (SPECTRUM_Spectrum_15_SET_PARAMETERS(Spectrum_bin, Spectrum_acq_mode, Spectrum_target_value, handle) != 0): 
        print("Set Parameters Error")    
    if (SPECTRUM_Spectrum_15_RESET(handle) != 0): 
        print("Reset Error")
    if (SPECTRUM_Spectrum_15_FLUSH(handle) != 0): 
        print("Flush Error")
    if (SPECTRUM_Spectrum_15_START(handle) == 0):
        while 1:
            [err, Spectrum_Status] = SPECTRUM_Spectrum_15_GET_STATUS(handle)
            [err, Spectrum_Data, Spectrum_Read_Data, Spectrum_Valid_Data] = SPECTRUM_Spectrum_15_GET_DATA(Spectrum_bin, Timeout_ms, handle)
            for i in range(Spectrum_bin):
                Spectrum[i] = Spectrum_Data[i] 
            plt.plot(Spectrum)
            plt.draw()
            plt.pause(0.0001)
            plt.clf()        

    else:
        print("Start Error")

*/
    Spectrum_acq_mode = "Free" #"Free", "Events", "Time"
    Spectrum_target_value = 0
    Spectrum_bin = 1024
    Timeout_ms = 1000
    Spectrum=[]
    for i in range(Spectrum_bin):
        Spectrum.append(0)

    plt.ion()
    if (SPECTRUM_Spectrum_16_SET_PARAMETERS(Spectrum_bin, Spectrum_acq_mode, Spectrum_target_value, handle) != 0): 
        print("Set Parameters Error")    
    if (SPECTRUM_Spectrum_16_RESET(handle) != 0): 
        print("Reset Error")
    if (SPECTRUM_Spectrum_16_FLUSH(handle) != 0): 
        print("Flush Error")
    if (SPECTRUM_Spectrum_16_START(handle) == 0):
        while 1:
            [err, Spectrum_Status] = SPECTRUM_Spectrum_16_GET_STATUS(handle)
            [err, Spectrum_Data, Spectrum_Read_Data, Spectrum_Valid_Data] = SPECTRUM_Spectrum_16_GET_DATA(Spectrum_bin, Timeout_ms, handle)
            for i in range(Spectrum_bin):
                Spectrum[i] = Spectrum_Data[i] 
            plt.plot(Spectrum)
            plt.draw()
            plt.pause(0.0001)
            plt.clf()        

    else:
        print("Start Error")

*/
    Spectrum_acq_mode = "Free" #"Free", "Events", "Time"
    Spectrum_target_value = 0
    Spectrum_bin = 1024
    Timeout_ms = 1000
    Spectrum=[]
    for i in range(Spectrum_bin):
        Spectrum.append(0)

    plt.ion()
    if (SPECTRUM_Spectrum_17_SET_PARAMETERS(Spectrum_bin, Spectrum_acq_mode, Spectrum_target_value, handle) != 0): 
        print("Set Parameters Error")    
    if (SPECTRUM_Spectrum_17_RESET(handle) != 0): 
        print("Reset Error")
    if (SPECTRUM_Spectrum_17_FLUSH(handle) != 0): 
        print("Flush Error")
    if (SPECTRUM_Spectrum_17_START(handle) == 0):
        while 1:
            [err, Spectrum_Status] = SPECTRUM_Spectrum_17_GET_STATUS(handle)
            [err, Spectrum_Data, Spectrum_Read_Data, Spectrum_Valid_Data] = SPECTRUM_Spectrum_17_GET_DATA(Spectrum_bin, Timeout_ms, handle)
            for i in range(Spectrum_bin):
                Spectrum[i] = Spectrum_Data[i] 
            plt.plot(Spectrum)
            plt.draw()
            plt.pause(0.0001)
            plt.clf()        

    else:
        print("Start Error")

*/
    Spectrum_acq_mode = "Free" #"Free", "Events", "Time"
    Spectrum_target_value = 0
    Spectrum_bin = 1024
    Timeout_ms = 1000
    Spectrum=[]
    for i in range(Spectrum_bin):
        Spectrum.append(0)

    plt.ion()
    if (SPECTRUM_Spectrum_18_SET_PARAMETERS(Spectrum_bin, Spectrum_acq_mode, Spectrum_target_value, handle) != 0): 
        print("Set Parameters Error")    
    if (SPECTRUM_Spectrum_18_RESET(handle) != 0): 
        print("Reset Error")
    if (SPECTRUM_Spectrum_18_FLUSH(handle) != 0): 
        print("Flush Error")
    if (SPECTRUM_Spectrum_18_START(handle) == 0):
        while 1:
            [err, Spectrum_Status] = SPECTRUM_Spectrum_18_GET_STATUS(handle)
            [err, Spectrum_Data, Spectrum_Read_Data, Spectrum_Valid_Data] = SPECTRUM_Spectrum_18_GET_DATA(Spectrum_bin, Timeout_ms, handle)
            for i in range(Spectrum_bin):
                Spectrum[i] = Spectrum_Data[i] 
            plt.plot(Spectrum)
            plt.draw()
            plt.pause(0.0001)
            plt.clf()        

    else:
        print("Start Error")

*/
    Spectrum_acq_mode = "Free" #"Free", "Events", "Time"
    Spectrum_target_value = 0
    Spectrum_bin = 1024
    Timeout_ms = 1000
    Spectrum=[]
    for i in range(Spectrum_bin):
        Spectrum.append(0)

    plt.ion()
    if (SPECTRUM_Spectrum_19_SET_PARAMETERS(Spectrum_bin, Spectrum_acq_mode, Spectrum_target_value, handle) != 0): 
        print("Set Parameters Error")    
    if (SPECTRUM_Spectrum_19_RESET(handle) != 0): 
        print("Reset Error")
    if (SPECTRUM_Spectrum_19_FLUSH(handle) != 0): 
        print("Flush Error")
    if (SPECTRUM_Spectrum_19_START(handle) == 0):
        while 1:
            [err, Spectrum_Status] = SPECTRUM_Spectrum_19_GET_STATUS(handle)
            [err, Spectrum_Data, Spectrum_Read_Data, Spectrum_Valid_Data] = SPECTRUM_Spectrum_19_GET_DATA(Spectrum_bin, Timeout_ms, handle)
            for i in range(Spectrum_bin):
                Spectrum[i] = Spectrum_Data[i] 
            plt.plot(Spectrum)
            plt.draw()
            plt.pause(0.0001)
            plt.clf()        

    else:
        print("Start Error")

*/
    Spectrum_acq_mode = "Free" #"Free", "Events", "Time"
    Spectrum_target_value = 0
    Spectrum_bin = 1024
    Timeout_ms = 1000
    Spectrum=[]
    for i in range(Spectrum_bin):
        Spectrum.append(0)

    plt.ion()
    if (SPECTRUM_Spectrum_20_SET_PARAMETERS(Spectrum_bin, Spectrum_acq_mode, Spectrum_target_value, handle) != 0): 
        print("Set Parameters Error")    
    if (SPECTRUM_Spectrum_20_RESET(handle) != 0): 
        print("Reset Error")
    if (SPECTRUM_Spectrum_20_FLUSH(handle) != 0): 
        print("Flush Error")
    if (SPECTRUM_Spectrum_20_START(handle) == 0):
        while 1:
            [err, Spectrum_Status] = SPECTRUM_Spectrum_20_GET_STATUS(handle)
            [err, Spectrum_Data, Spectrum_Read_Data, Spectrum_Valid_Data] = SPECTRUM_Spectrum_20_GET_DATA(Spectrum_bin, Timeout_ms, handle)
            for i in range(Spectrum_bin):
                Spectrum[i] = Spectrum_Data[i] 
            plt.plot(Spectrum)
            plt.draw()
            plt.pause(0.0001)
            plt.clf()        

    else:
        print("Start Error")

*/
    Spectrum_acq_mode = "Free" #"Free", "Events", "Time"
    Spectrum_target_value = 0
    Spectrum_bin = 1024
    Timeout_ms = 1000
    Spectrum=[]
    for i in range(Spectrum_bin):
        Spectrum.append(0)

    plt.ion()
    if (SPECTRUM_Spectrum_21_SET_PARAMETERS(Spectrum_bin, Spectrum_acq_mode, Spectrum_target_value, handle) != 0): 
        print("Set Parameters Error")    
    if (SPECTRUM_Spectrum_21_RESET(handle) != 0): 
        print("Reset Error")
    if (SPECTRUM_Spectrum_21_FLUSH(handle) != 0): 
        print("Flush Error")
    if (SPECTRUM_Spectrum_21_START(handle) == 0):
        while 1:
            [err, Spectrum_Status] = SPECTRUM_Spectrum_21_GET_STATUS(handle)
            [err, Spectrum_Data, Spectrum_Read_Data, Spectrum_Valid_Data] = SPECTRUM_Spectrum_21_GET_DATA(Spectrum_bin, Timeout_ms, handle)
            for i in range(Spectrum_bin):
                Spectrum[i] = Spectrum_Data[i] 
            plt.plot(Spectrum)
            plt.draw()
            plt.pause(0.0001)
            plt.clf()        

    else:
        print("Start Error")

*/
    Spectrum_acq_mode = "Free" #"Free", "Events", "Time"
    Spectrum_target_value = 0
    Spectrum_bin = 1024
    Timeout_ms = 1000
    Spectrum=[]
    for i in range(Spectrum_bin):
        Spectrum.append(0)

    plt.ion()
    if (SPECTRUM_Spectrum_22_SET_PARAMETERS(Spectrum_bin, Spectrum_acq_mode, Spectrum_target_value, handle) != 0): 
        print("Set Parameters Error")    
    if (SPECTRUM_Spectrum_22_RESET(handle) != 0): 
        print("Reset Error")
    if (SPECTRUM_Spectrum_22_FLUSH(handle) != 0): 
        print("Flush Error")
    if (SPECTRUM_Spectrum_22_START(handle) == 0):
        while 1:
            [err, Spectrum_Status] = SPECTRUM_Spectrum_22_GET_STATUS(handle)
            [err, Spectrum_Data, Spectrum_Read_Data, Spectrum_Valid_Data] = SPECTRUM_Spectrum_22_GET_DATA(Spectrum_bin, Timeout_ms, handle)
            for i in range(Spectrum_bin):
                Spectrum[i] = Spectrum_Data[i] 
            plt.plot(Spectrum)
            plt.draw()
            plt.pause(0.0001)
            plt.clf()        

    else:
        print("Start Error")

*/
    Spectrum_acq_mode = "Free" #"Free", "Events", "Time"
    Spectrum_target_value = 0
    Spectrum_bin = 1024
    Timeout_ms = 1000
    Spectrum=[]
    for i in range(Spectrum_bin):
        Spectrum.append(0)

    plt.ion()
    if (SPECTRUM_Spectrum_23_SET_PARAMETERS(Spectrum_bin, Spectrum_acq_mode, Spectrum_target_value, handle) != 0): 
        print("Set Parameters Error")    
    if (SPECTRUM_Spectrum_23_RESET(handle) != 0): 
        print("Reset Error")
    if (SPECTRUM_Spectrum_23_FLUSH(handle) != 0): 
        print("Flush Error")
    if (SPECTRUM_Spectrum_23_START(handle) == 0):
        while 1:
            [err, Spectrum_Status] = SPECTRUM_Spectrum_23_GET_STATUS(handle)
            [err, Spectrum_Data, Spectrum_Read_Data, Spectrum_Valid_Data] = SPECTRUM_Spectrum_23_GET_DATA(Spectrum_bin, Timeout_ms, handle)
            for i in range(Spectrum_bin):
                Spectrum[i] = Spectrum_Data[i] 
            plt.plot(Spectrum)
            plt.draw()
            plt.pause(0.0001)
            plt.clf()        

    else:
        print("Start Error")

*/
    plt.ion()
    Oscilloscope_Status = 0
    Timeout_ms = 1000
    Decimator = 0
    Pre_Trigger = 100
    Trigger_Level = 1000
    Trigger_Channel = 0
    Trigger_Mode = "Free" #"Free", "Analog", "Digital0", "Digital1", "Digital2", "Digital3"
    Trigger_Edge = "Rising" #"Rising", "Falling"
    
    while(1):
        if (OSCILLOSCOPE_Oscilloscope_0_SET_DECIMATOR(Decimator, handle) != 0): 
            print("Set Decimator Error")
            exit
        if (OSCILLOSCOPE_Oscilloscope_0_SET_PRETRIGGER(Pre_Trigger, handle) != 0): 
            print("Set PreTrigger Error")
            exit
        if (OSCILLOSCOPE_Oscilloscope_0_SET_TRIGGER_LEVEL(Trigger_Level, handle) != 0):
            print("Set Trigger Level Error")
            exit
        if (OSCILLOSCOPE_Oscilloscope_0_SET_TRIGGER_MODE(Trigger_Mode, Trigger_Channel, Trigger_Edge, handle) != 0):
            print("Set Trigger Mode Error")
            exit
        if (OSCILLOSCOPE_Oscilloscope_0_START(handle) == True):
            while (Oscilloscope_Status != 1):
                [err, Oscilloscope_Status] = OSCILLOSCOPE_Oscilloscope_0_GET_STATUS(handle)
            [err, Event_Position] = OSCILLOSCOPE_Oscilloscope_0_GET_POSITION(handle)
            [err, Oscilloscope_Data, Oscilloscope_Read_Data, Oscilloscope_Valid_Data] = OSCILLOSCOPE_Oscilloscope_0_GET_DATA(Timeout_ms, handle)
            [Analog, Digital0, Digital1, Digital2, Digital3] = OSCILLOSCOPE_Oscilloscope_0_RECONSTRUCT_DATA(Oscilloscope_Data, Event_Position, Pre_Trigger)
            plt.cla()
            plt.plot(Analog)
            plt.pause(0.01)
        else:
            print("Start Error")
*/
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
    plt.ion()
    plt.show()
    N_Packet = 100
    Timeout_ms = 1000
    N_Total_Events = 10000
    ReadDataNumber = 0
    if (CPACK_All_Energies_RESET(handle) != 0):
        print("Reset Error!")
    if (CPACK_All_Energies_START(handle) == True):
        [err, Frame_Status] = CPACK_All_Energies_GET_STATUS(handle)
        if (Frame_Status >0):
            while(ReadDataNumber < N_Total_Events):
                [err, Frame_Data, Frame_Read_Data, Frame_Valid_Data] = CPACK_All_Energies_GET_DATA(N_Packet, Timeout_ms, handle)
                [Time_Code, Pack_Id, Energy] = CPACK_All_Energies_RECONSTRUCT_DATA(Frame_Data)                 
                ReadDataNumber += N_Packet
                print("Event Id: ", Pack_Id[0])
                plt.cla()
                plt.plot(Energy[0])
                plt.pause(0.01)
                print("Total Acquired Events: ", ReadDataNumber)
        else:
            print("Status Error")
    else:
        print("Start Error")

*/
