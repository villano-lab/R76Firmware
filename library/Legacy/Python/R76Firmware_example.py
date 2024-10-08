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
        if (OSCILLOSCOPE_Analog_SET_DECIMATOR(Decimator, handle) != 0): 
            print("Set Decimator Error")
            exit
        if (OSCILLOSCOPE_Analog_SET_PRETRIGGER(Pre_Trigger, handle) != 0): 
            print("Set PreTrigger Error")
            exit
        if (OSCILLOSCOPE_Analog_SET_TRIGGER_LEVEL(Trigger_Level, handle) != 0):
            print("Set Trigger Level Error")
            exit
        if (OSCILLOSCOPE_Analog_SET_TRIGGER_MODE(Trigger_Mode, Trigger_Channel, Trigger_Edge, handle) != 0):
            print("Set Trigger Mode Error")
            exit
        if (OSCILLOSCOPE_Analog_START(handle) == True):
            while (Oscilloscope_Status != 1):
                [err, Oscilloscope_Status] = OSCILLOSCOPE_Analog_GET_STATUS(handle)
            [err, Event_Position] = OSCILLOSCOPE_Analog_GET_POSITION(handle)
            [err, Oscilloscope_Data, Oscilloscope_Read_Data, Oscilloscope_Valid_Data] = OSCILLOSCOPE_Analog_GET_DATA(Timeout_ms, handle)
            [Analog, Digital0, Digital1, Digital2, Digital3] = OSCILLOSCOPE_Analog_RECONSTRUCT_DATA(Oscilloscope_Data, Event_Position, Pre_Trigger)
            plt.cla()
            plt.plot(Analog)
            plt.pause(0.01)
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
        if (OSCILLOSCOPE_Energies_SET_DECIMATOR(Decimator, handle) != 0): 
            print("Set Decimator Error")
            exit
        if (OSCILLOSCOPE_Energies_SET_PRETRIGGER(Pre_Trigger, handle) != 0): 
            print("Set PreTrigger Error")
            exit
        if (OSCILLOSCOPE_Energies_SET_TRIGGER_LEVEL(Trigger_Level, handle) != 0):
            print("Set Trigger Level Error")
            exit
        if (OSCILLOSCOPE_Energies_SET_TRIGGER_MODE(Trigger_Mode, Trigger_Channel, Trigger_Edge, handle) != 0):
            print("Set Trigger Mode Error")
            exit
        if (OSCILLOSCOPE_Energies_START(handle) == True):
            while (Oscilloscope_Status != 1):
                [err, Oscilloscope_Status] = OSCILLOSCOPE_Energies_GET_STATUS(handle)
            [err, Event_Position] = OSCILLOSCOPE_Energies_GET_POSITION(handle)
            [err, Oscilloscope_Data, Oscilloscope_Read_Data, Oscilloscope_Valid_Data] = OSCILLOSCOPE_Energies_GET_DATA(Timeout_ms, handle)
            [Analog, Digital0, Digital1, Digital2, Digital3] = OSCILLOSCOPE_Energies_RECONSTRUCT_DATA(Oscilloscope_Data, Event_Position, Pre_Trigger)
            plt.cla()
            plt.plot(Analog)
            plt.pause(0.01)
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
        if (OSCILLOSCOPE_Analog_In_Unflipped_SET_DECIMATOR(Decimator, handle) != 0): 
            print("Set Decimator Error")
            exit
        if (OSCILLOSCOPE_Analog_In_Unflipped_SET_PRETRIGGER(Pre_Trigger, handle) != 0): 
            print("Set PreTrigger Error")
            exit
        if (OSCILLOSCOPE_Analog_In_Unflipped_SET_TRIGGER_LEVEL(Trigger_Level, handle) != 0):
            print("Set Trigger Level Error")
            exit
        if (OSCILLOSCOPE_Analog_In_Unflipped_SET_TRIGGER_MODE(Trigger_Mode, Trigger_Channel, Trigger_Edge, handle) != 0):
            print("Set Trigger Mode Error")
            exit
        if (OSCILLOSCOPE_Analog_In_Unflipped_START(handle) == True):
            while (Oscilloscope_Status != 1):
                [err, Oscilloscope_Status] = OSCILLOSCOPE_Analog_In_Unflipped_GET_STATUS(handle)
            [err, Event_Position] = OSCILLOSCOPE_Analog_In_Unflipped_GET_POSITION(handle)
            [err, Oscilloscope_Data, Oscilloscope_Read_Data, Oscilloscope_Valid_Data] = OSCILLOSCOPE_Analog_In_Unflipped_GET_DATA(Timeout_ms, handle)
            [Analog, Digital0, Digital1, Digital2, Digital3] = OSCILLOSCOPE_Analog_In_Unflipped_RECONSTRUCT_DATA(Oscilloscope_Data, Event_Position, Pre_Trigger)
            plt.cla()
            plt.plot(Analog)
            plt.pause(0.01)
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
        if (OSCILLOSCOPE_diag_SET_DECIMATOR(Decimator, handle) != 0): 
            print("Set Decimator Error")
            exit
        if (OSCILLOSCOPE_diag_SET_PRETRIGGER(Pre_Trigger, handle) != 0): 
            print("Set PreTrigger Error")
            exit
        if (OSCILLOSCOPE_diag_SET_TRIGGER_LEVEL(Trigger_Level, handle) != 0):
            print("Set Trigger Level Error")
            exit
        if (OSCILLOSCOPE_diag_SET_TRIGGER_MODE(Trigger_Mode, Trigger_Channel, Trigger_Edge, handle) != 0):
            print("Set Trigger Mode Error")
            exit
        if (OSCILLOSCOPE_diag_START(handle) == True):
            while (Oscilloscope_Status != 1):
                [err, Oscilloscope_Status] = OSCILLOSCOPE_diag_GET_STATUS(handle)
            [err, Event_Position] = OSCILLOSCOPE_diag_GET_POSITION(handle)
            [err, Oscilloscope_Data, Oscilloscope_Read_Data, Oscilloscope_Valid_Data] = OSCILLOSCOPE_diag_GET_DATA(Timeout_ms, handle)
            [Analog, Digital0, Digital1, Digital2, Digital3] = OSCILLOSCOPE_diag_RECONSTRUCT_DATA(Oscilloscope_Data, Event_Position, Pre_Trigger)
            plt.cla()
            plt.plot(Analog)
            plt.pause(0.01)
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
        if (OSCILLOSCOPE_baselines_SET_DECIMATOR(Decimator, handle) != 0): 
            print("Set Decimator Error")
            exit
        if (OSCILLOSCOPE_baselines_SET_PRETRIGGER(Pre_Trigger, handle) != 0): 
            print("Set PreTrigger Error")
            exit
        if (OSCILLOSCOPE_baselines_SET_TRIGGER_LEVEL(Trigger_Level, handle) != 0):
            print("Set Trigger Level Error")
            exit
        if (OSCILLOSCOPE_baselines_SET_TRIGGER_MODE(Trigger_Mode, Trigger_Channel, Trigger_Edge, handle) != 0):
            print("Set Trigger Mode Error")
            exit
        if (OSCILLOSCOPE_baselines_START(handle) == True):
            while (Oscilloscope_Status != 1):
                [err, Oscilloscope_Status] = OSCILLOSCOPE_baselines_GET_STATUS(handle)
            [err, Event_Position] = OSCILLOSCOPE_baselines_GET_POSITION(handle)
            [err, Oscilloscope_Data, Oscilloscope_Read_Data, Oscilloscope_Valid_Data] = OSCILLOSCOPE_baselines_GET_DATA(Timeout_ms, handle)
            [Analog, Digital0, Digital1, Digital2, Digital3] = OSCILLOSCOPE_baselines_RECONSTRUCT_DATA(Oscilloscope_Data, Event_Position, Pre_Trigger)
            plt.cla()
            plt.plot(Analog)
            plt.pause(0.01)
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
