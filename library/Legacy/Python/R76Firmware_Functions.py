


































































import R76Firmware_RegisterFile
from ctypes import *
import array
import numpy as np

import os
mydll = cdll.LoadLibrary(os.path.dirname(__file__) +'/R5560_SDKLib.dll')

def Init():
    return 0

def ConnectDevice(board):
    c_s = c_char_p(board.encode('ascii'))
    da= mydll.R5560_HandleAllocator()
    handle = c_void_p(da)
    err = mydll.R5560_ConnectTCP(c_s, 8888, handle)
    return err, handle

def CloseConnect(handle):
    err = mydll.NI_CloseConnection((handle))
    return err    
    
def ListDevices():
    str_devices=""
    dev_count =-1
    return str_devices, dev_count 

def __abstracted_reg_write(data, address, handle):
    err = mydll.NI_WriteReg(data, address, (handle))
    return err

def __abstracted_reg_read(address, handle):
    data = c_uint(0)
    err = mydll.NI_ReadReg(byref(data), address, (handle))
    return err, data.value

def __abstracted_mem_write(data, count, address, timeout_ms, handle):
    written_data = c_uint(0)
    err = mydll.NI_WriteData(data, count, address, (handle), byref(written_data))
    return err, written_data.value

def __abstracted_mem_read(count, address, timeout_ms, handle):
    data = (c_uint * (2* count))()
    read_data = c_uint(0)
    valid_data = c_uint(0)
    err = mydll.NI_ReadData(byref(data), count, address, (handle), byref(read_data))
    valid_data=read_data
    return err, data, read_data.value, valid_data.value

def __abstracted_fifo_write(data, count, address, address_status, timeout_ms, handle):
    return -1

def __abstracted_fifo_read(count, address, address_status, blocking, timeout_ms, handle):
    data = (c_uint * (2 * count))()
    read_data = c_uint(0)
    valid_data = c_uint(0)
    err = mydll.NI_ReadFifo(byref(data), count, address, address_status, (1 if blocking else 2), timeout_ms, (handle), byref(read_data))
    valid_data=read_data
    return err, data, read_data, valid_data     
    
def __abstracted_DMA_read(dma_channel, handle):
    count = 2*1024*1024;
    data = (c_ulonglong * (count))()
    read_data = c_uint(0)
    err = mydll.NI_DMA_Read(dma_channel, byref(data), count, byref(read_data), (handle))
    vd = (read_data.value / 8);
    return err, data, vd     
    
def __abstracted_DMA_CONFIG(dma_channel, blocking, timeout, buffer_length, handle):
    err = mydll.NI_DMA_SetOptions(dma_channel, blocking, timeout, buffer_length, (handle))
    return err
    
    
def gray_to_bin(num, nbit):
    temp = num ^ (num >> 8)
    temp ^= (temp >> 4)
    temp ^= (temp >> 2)
    temp ^= (temp >> 1)
    return temp    

def REG_forcetrig_GET(handle):
    [err, data] = __abstracted_reg_read(R76Firmware_RegisterFile.SCI_REG_forcetrig, handle)
    return err, data

def REG_forcetrig_SET(data, handle):
    err = __abstracted_reg_write(data, R76Firmware_RegisterFile.SCI_REG_forcetrig, handle)
    return err

def REG_full_GET(handle):
    [err, data] = __abstracted_reg_read(R76Firmware_RegisterFile.SCI_REG_full, handle)
    return err, data

def REG_full_SET(data, handle):
    err = __abstracted_reg_write(data, R76Firmware_RegisterFile.SCI_REG_full, handle)
    return err

def REG_trigger_code_GET(handle):
    [err, data] = __abstracted_reg_read(R76Firmware_RegisterFile.SCI_REG_trigger_code, handle)
    return err, data

def REG_trigger_code_SET(data, handle):
    err = __abstracted_reg_write(data, R76Firmware_RegisterFile.SCI_REG_trigger_code, handle)
    return err

def REG_reset_GET(handle):
    [err, data] = __abstracted_reg_read(R76Firmware_RegisterFile.SCI_REG_reset, handle)
    return err, data

def REG_reset_SET(data, handle):
    err = __abstracted_reg_write(data, R76Firmware_RegisterFile.SCI_REG_reset, handle)
    return err

def REG_received_GET(handle):
    [err, data] = __abstracted_reg_read(R76Firmware_RegisterFile.SCI_REG_received, handle)
    return err, data

def REG_received_SET(data, handle):
    err = __abstracted_reg_write(data, R76Firmware_RegisterFile.SCI_REG_received, handle)
    return err

def REG_timestamp_GET(handle):
    [err, data] = __abstracted_reg_read(R76Firmware_RegisterFile.SCI_REG_timestamp, handle)
    return err, data

def REG_timestamp_SET(data, handle):
    err = __abstracted_reg_write(data, R76Firmware_RegisterFile.SCI_REG_timestamp, handle)
    return err

def REG_sync0_between_sync2_GET(handle):
    [err, data] = __abstracted_reg_read(R76Firmware_RegisterFile.SCI_REG_sync0_between_sync2, handle)
    return err, data

def REG_sync0_between_sync2_SET(data, handle):
    err = __abstracted_reg_write(data, R76Firmware_RegisterFile.SCI_REG_sync0_between_sync2, handle)
    return err

def REG_dummy_GET(handle):
    [err, data] = __abstracted_reg_read(R76Firmware_RegisterFile.SCI_REG_dummy, handle)
    return err, data

def REG_dummy_SET(data, handle):
    err = __abstracted_reg_write(data, R76Firmware_RegisterFile.SCI_REG_dummy, handle)
    return err



def SPECTRUM_Spectrum_1_RESET(handle):
    err = __abstracted_reg_write(2, R76Firmware_RegisterFile.SCI_REG_Spectrum_1_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_1_START(handle):
    err = __abstracted_reg_write(4, R76Firmware_RegisterFile.SCI_REG_Spectrum_1_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_1_FLUSH(handle):
    err = __abstracted_reg_write(1, R76Firmware_RegisterFile.SCI_REG_Spectrum_1_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_1_STOP(handle):
    err = __abstracted_reg_write(0, R76Firmware_RegisterFile.SCI_REG_Spectrum_1_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_1_SET_PARAMETERS(Bin, AcquisitionMode, TargetValue, handle):
    rebin_value=0
    if (Bin == 8192):
        rebin_value= 1
    if (Bin == 4096):
        rebin_value= 2
    if (Bin == 2048):
        rebin_value= 3
    if (Bin == 1024):
        rebin_value= 4
    if (Bin == 512):
        rebin_value= 5
    if (Bin == 256):
        rebin_value= 6
    if (Bin == 128):
        rebin_value= 7
    err = __abstracted_reg_write(rebin_value, R76Firmware_RegisterFile.SCI_REG_Spectrum_1_CONFIG_REBIN, handle)
    acq_mode=0
    if (AcquisitionMode =="Event"):
        acq_mode=(1 << 30) + TargetValue
    if (AcquisitionMode =="Time"):
        acq_mode=(1 << 31) + TargetValue*1000
    err = __abstracted_reg_write(acq_mode, R76Firmware_RegisterFile.SCI_REG_Spectrum_1_CONFIG_LIMIT, handle)
    return err

def SPECTRUM_Spectrum_1_GET_STATUS(handle):
    [err, status] = __abstracted_reg_read(R76Firmware_RegisterFile.SCI_REG_Spectrum_1_STATUS, handle)
    return err, status

def SPECTRUM_Spectrum_1_GET_DATA(Bin, timeout_ms, handle):
    [err, data, read_data, valid_data] = __abstracted_mem_read(Bin, R76Firmware_RegisterFile.SCI_REG_Spectrum_1_FIFOADDRESS, timeout_ms, handle)
    return err, data, read_data, valid_data



def SPECTRUM_Spectrum_2_RESET(handle):
    err = __abstracted_reg_write(2, R76Firmware_RegisterFile.SCI_REG_Spectrum_2_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_2_START(handle):
    err = __abstracted_reg_write(4, R76Firmware_RegisterFile.SCI_REG_Spectrum_2_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_2_FLUSH(handle):
    err = __abstracted_reg_write(1, R76Firmware_RegisterFile.SCI_REG_Spectrum_2_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_2_STOP(handle):
    err = __abstracted_reg_write(0, R76Firmware_RegisterFile.SCI_REG_Spectrum_2_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_2_SET_PARAMETERS(Bin, AcquisitionMode, TargetValue, handle):
    rebin_value=0
    if (Bin == 8192):
        rebin_value= 1
    if (Bin == 4096):
        rebin_value= 2
    if (Bin == 2048):
        rebin_value= 3
    if (Bin == 1024):
        rebin_value= 4
    if (Bin == 512):
        rebin_value= 5
    if (Bin == 256):
        rebin_value= 6
    if (Bin == 128):
        rebin_value= 7
    err = __abstracted_reg_write(rebin_value, R76Firmware_RegisterFile.SCI_REG_Spectrum_2_CONFIG_REBIN, handle)
    acq_mode=0
    if (AcquisitionMode =="Event"):
        acq_mode=(1 << 30) + TargetValue
    if (AcquisitionMode =="Time"):
        acq_mode=(1 << 31) + TargetValue*1000
    err = __abstracted_reg_write(acq_mode, R76Firmware_RegisterFile.SCI_REG_Spectrum_2_CONFIG_LIMIT, handle)
    return err

def SPECTRUM_Spectrum_2_GET_STATUS(handle):
    [err, status] = __abstracted_reg_read(R76Firmware_RegisterFile.SCI_REG_Spectrum_2_STATUS, handle)
    return err, status

def SPECTRUM_Spectrum_2_GET_DATA(Bin, timeout_ms, handle):
    [err, data, read_data, valid_data] = __abstracted_mem_read(Bin, R76Firmware_RegisterFile.SCI_REG_Spectrum_2_FIFOADDRESS, timeout_ms, handle)
    return err, data, read_data, valid_data



def SPECTRUM_Spectrum_3_RESET(handle):
    err = __abstracted_reg_write(2, R76Firmware_RegisterFile.SCI_REG_Spectrum_3_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_3_START(handle):
    err = __abstracted_reg_write(4, R76Firmware_RegisterFile.SCI_REG_Spectrum_3_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_3_FLUSH(handle):
    err = __abstracted_reg_write(1, R76Firmware_RegisterFile.SCI_REG_Spectrum_3_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_3_STOP(handle):
    err = __abstracted_reg_write(0, R76Firmware_RegisterFile.SCI_REG_Spectrum_3_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_3_SET_PARAMETERS(Bin, AcquisitionMode, TargetValue, handle):
    rebin_value=0
    if (Bin == 8192):
        rebin_value= 1
    if (Bin == 4096):
        rebin_value= 2
    if (Bin == 2048):
        rebin_value= 3
    if (Bin == 1024):
        rebin_value= 4
    if (Bin == 512):
        rebin_value= 5
    if (Bin == 256):
        rebin_value= 6
    if (Bin == 128):
        rebin_value= 7
    err = __abstracted_reg_write(rebin_value, R76Firmware_RegisterFile.SCI_REG_Spectrum_3_CONFIG_REBIN, handle)
    acq_mode=0
    if (AcquisitionMode =="Event"):
        acq_mode=(1 << 30) + TargetValue
    if (AcquisitionMode =="Time"):
        acq_mode=(1 << 31) + TargetValue*1000
    err = __abstracted_reg_write(acq_mode, R76Firmware_RegisterFile.SCI_REG_Spectrum_3_CONFIG_LIMIT, handle)
    return err

def SPECTRUM_Spectrum_3_GET_STATUS(handle):
    [err, status] = __abstracted_reg_read(R76Firmware_RegisterFile.SCI_REG_Spectrum_3_STATUS, handle)
    return err, status

def SPECTRUM_Spectrum_3_GET_DATA(Bin, timeout_ms, handle):
    [err, data, read_data, valid_data] = __abstracted_mem_read(Bin, R76Firmware_RegisterFile.SCI_REG_Spectrum_3_FIFOADDRESS, timeout_ms, handle)
    return err, data, read_data, valid_data



def SPECTRUM_Spectrum_4_RESET(handle):
    err = __abstracted_reg_write(2, R76Firmware_RegisterFile.SCI_REG_Spectrum_4_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_4_START(handle):
    err = __abstracted_reg_write(4, R76Firmware_RegisterFile.SCI_REG_Spectrum_4_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_4_FLUSH(handle):
    err = __abstracted_reg_write(1, R76Firmware_RegisterFile.SCI_REG_Spectrum_4_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_4_STOP(handle):
    err = __abstracted_reg_write(0, R76Firmware_RegisterFile.SCI_REG_Spectrum_4_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_4_SET_PARAMETERS(Bin, AcquisitionMode, TargetValue, handle):
    rebin_value=0
    if (Bin == 8192):
        rebin_value= 1
    if (Bin == 4096):
        rebin_value= 2
    if (Bin == 2048):
        rebin_value= 3
    if (Bin == 1024):
        rebin_value= 4
    if (Bin == 512):
        rebin_value= 5
    if (Bin == 256):
        rebin_value= 6
    if (Bin == 128):
        rebin_value= 7
    err = __abstracted_reg_write(rebin_value, R76Firmware_RegisterFile.SCI_REG_Spectrum_4_CONFIG_REBIN, handle)
    acq_mode=0
    if (AcquisitionMode =="Event"):
        acq_mode=(1 << 30) + TargetValue
    if (AcquisitionMode =="Time"):
        acq_mode=(1 << 31) + TargetValue*1000
    err = __abstracted_reg_write(acq_mode, R76Firmware_RegisterFile.SCI_REG_Spectrum_4_CONFIG_LIMIT, handle)
    return err

def SPECTRUM_Spectrum_4_GET_STATUS(handle):
    [err, status] = __abstracted_reg_read(R76Firmware_RegisterFile.SCI_REG_Spectrum_4_STATUS, handle)
    return err, status

def SPECTRUM_Spectrum_4_GET_DATA(Bin, timeout_ms, handle):
    [err, data, read_data, valid_data] = __abstracted_mem_read(Bin, R76Firmware_RegisterFile.SCI_REG_Spectrum_4_FIFOADDRESS, timeout_ms, handle)
    return err, data, read_data, valid_data



def SPECTRUM_Spectrum_5_RESET(handle):
    err = __abstracted_reg_write(2, R76Firmware_RegisterFile.SCI_REG_Spectrum_5_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_5_START(handle):
    err = __abstracted_reg_write(4, R76Firmware_RegisterFile.SCI_REG_Spectrum_5_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_5_FLUSH(handle):
    err = __abstracted_reg_write(1, R76Firmware_RegisterFile.SCI_REG_Spectrum_5_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_5_STOP(handle):
    err = __abstracted_reg_write(0, R76Firmware_RegisterFile.SCI_REG_Spectrum_5_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_5_SET_PARAMETERS(Bin, AcquisitionMode, TargetValue, handle):
    rebin_value=0
    if (Bin == 8192):
        rebin_value= 1
    if (Bin == 4096):
        rebin_value= 2
    if (Bin == 2048):
        rebin_value= 3
    if (Bin == 1024):
        rebin_value= 4
    if (Bin == 512):
        rebin_value= 5
    if (Bin == 256):
        rebin_value= 6
    if (Bin == 128):
        rebin_value= 7
    err = __abstracted_reg_write(rebin_value, R76Firmware_RegisterFile.SCI_REG_Spectrum_5_CONFIG_REBIN, handle)
    acq_mode=0
    if (AcquisitionMode =="Event"):
        acq_mode=(1 << 30) + TargetValue
    if (AcquisitionMode =="Time"):
        acq_mode=(1 << 31) + TargetValue*1000
    err = __abstracted_reg_write(acq_mode, R76Firmware_RegisterFile.SCI_REG_Spectrum_5_CONFIG_LIMIT, handle)
    return err

def SPECTRUM_Spectrum_5_GET_STATUS(handle):
    [err, status] = __abstracted_reg_read(R76Firmware_RegisterFile.SCI_REG_Spectrum_5_STATUS, handle)
    return err, status

def SPECTRUM_Spectrum_5_GET_DATA(Bin, timeout_ms, handle):
    [err, data, read_data, valid_data] = __abstracted_mem_read(Bin, R76Firmware_RegisterFile.SCI_REG_Spectrum_5_FIFOADDRESS, timeout_ms, handle)
    return err, data, read_data, valid_data



def SPECTRUM_Spectrum_6_RESET(handle):
    err = __abstracted_reg_write(2, R76Firmware_RegisterFile.SCI_REG_Spectrum_6_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_6_START(handle):
    err = __abstracted_reg_write(4, R76Firmware_RegisterFile.SCI_REG_Spectrum_6_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_6_FLUSH(handle):
    err = __abstracted_reg_write(1, R76Firmware_RegisterFile.SCI_REG_Spectrum_6_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_6_STOP(handle):
    err = __abstracted_reg_write(0, R76Firmware_RegisterFile.SCI_REG_Spectrum_6_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_6_SET_PARAMETERS(Bin, AcquisitionMode, TargetValue, handle):
    rebin_value=0
    if (Bin == 8192):
        rebin_value= 1
    if (Bin == 4096):
        rebin_value= 2
    if (Bin == 2048):
        rebin_value= 3
    if (Bin == 1024):
        rebin_value= 4
    if (Bin == 512):
        rebin_value= 5
    if (Bin == 256):
        rebin_value= 6
    if (Bin == 128):
        rebin_value= 7
    err = __abstracted_reg_write(rebin_value, R76Firmware_RegisterFile.SCI_REG_Spectrum_6_CONFIG_REBIN, handle)
    acq_mode=0
    if (AcquisitionMode =="Event"):
        acq_mode=(1 << 30) + TargetValue
    if (AcquisitionMode =="Time"):
        acq_mode=(1 << 31) + TargetValue*1000
    err = __abstracted_reg_write(acq_mode, R76Firmware_RegisterFile.SCI_REG_Spectrum_6_CONFIG_LIMIT, handle)
    return err

def SPECTRUM_Spectrum_6_GET_STATUS(handle):
    [err, status] = __abstracted_reg_read(R76Firmware_RegisterFile.SCI_REG_Spectrum_6_STATUS, handle)
    return err, status

def SPECTRUM_Spectrum_6_GET_DATA(Bin, timeout_ms, handle):
    [err, data, read_data, valid_data] = __abstracted_mem_read(Bin, R76Firmware_RegisterFile.SCI_REG_Spectrum_6_FIFOADDRESS, timeout_ms, handle)
    return err, data, read_data, valid_data



def SPECTRUM_Spectrum_7_RESET(handle):
    err = __abstracted_reg_write(2, R76Firmware_RegisterFile.SCI_REG_Spectrum_7_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_7_START(handle):
    err = __abstracted_reg_write(4, R76Firmware_RegisterFile.SCI_REG_Spectrum_7_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_7_FLUSH(handle):
    err = __abstracted_reg_write(1, R76Firmware_RegisterFile.SCI_REG_Spectrum_7_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_7_STOP(handle):
    err = __abstracted_reg_write(0, R76Firmware_RegisterFile.SCI_REG_Spectrum_7_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_7_SET_PARAMETERS(Bin, AcquisitionMode, TargetValue, handle):
    rebin_value=0
    if (Bin == 8192):
        rebin_value= 1
    if (Bin == 4096):
        rebin_value= 2
    if (Bin == 2048):
        rebin_value= 3
    if (Bin == 1024):
        rebin_value= 4
    if (Bin == 512):
        rebin_value= 5
    if (Bin == 256):
        rebin_value= 6
    if (Bin == 128):
        rebin_value= 7
    err = __abstracted_reg_write(rebin_value, R76Firmware_RegisterFile.SCI_REG_Spectrum_7_CONFIG_REBIN, handle)
    acq_mode=0
    if (AcquisitionMode =="Event"):
        acq_mode=(1 << 30) + TargetValue
    if (AcquisitionMode =="Time"):
        acq_mode=(1 << 31) + TargetValue*1000
    err = __abstracted_reg_write(acq_mode, R76Firmware_RegisterFile.SCI_REG_Spectrum_7_CONFIG_LIMIT, handle)
    return err

def SPECTRUM_Spectrum_7_GET_STATUS(handle):
    [err, status] = __abstracted_reg_read(R76Firmware_RegisterFile.SCI_REG_Spectrum_7_STATUS, handle)
    return err, status

def SPECTRUM_Spectrum_7_GET_DATA(Bin, timeout_ms, handle):
    [err, data, read_data, valid_data] = __abstracted_mem_read(Bin, R76Firmware_RegisterFile.SCI_REG_Spectrum_7_FIFOADDRESS, timeout_ms, handle)
    return err, data, read_data, valid_data



def SPECTRUM_Spectrum_8_RESET(handle):
    err = __abstracted_reg_write(2, R76Firmware_RegisterFile.SCI_REG_Spectrum_8_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_8_START(handle):
    err = __abstracted_reg_write(4, R76Firmware_RegisterFile.SCI_REG_Spectrum_8_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_8_FLUSH(handle):
    err = __abstracted_reg_write(1, R76Firmware_RegisterFile.SCI_REG_Spectrum_8_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_8_STOP(handle):
    err = __abstracted_reg_write(0, R76Firmware_RegisterFile.SCI_REG_Spectrum_8_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_8_SET_PARAMETERS(Bin, AcquisitionMode, TargetValue, handle):
    rebin_value=0
    if (Bin == 8192):
        rebin_value= 1
    if (Bin == 4096):
        rebin_value= 2
    if (Bin == 2048):
        rebin_value= 3
    if (Bin == 1024):
        rebin_value= 4
    if (Bin == 512):
        rebin_value= 5
    if (Bin == 256):
        rebin_value= 6
    if (Bin == 128):
        rebin_value= 7
    err = __abstracted_reg_write(rebin_value, R76Firmware_RegisterFile.SCI_REG_Spectrum_8_CONFIG_REBIN, handle)
    acq_mode=0
    if (AcquisitionMode =="Event"):
        acq_mode=(1 << 30) + TargetValue
    if (AcquisitionMode =="Time"):
        acq_mode=(1 << 31) + TargetValue*1000
    err = __abstracted_reg_write(acq_mode, R76Firmware_RegisterFile.SCI_REG_Spectrum_8_CONFIG_LIMIT, handle)
    return err

def SPECTRUM_Spectrum_8_GET_STATUS(handle):
    [err, status] = __abstracted_reg_read(R76Firmware_RegisterFile.SCI_REG_Spectrum_8_STATUS, handle)
    return err, status

def SPECTRUM_Spectrum_8_GET_DATA(Bin, timeout_ms, handle):
    [err, data, read_data, valid_data] = __abstracted_mem_read(Bin, R76Firmware_RegisterFile.SCI_REG_Spectrum_8_FIFOADDRESS, timeout_ms, handle)
    return err, data, read_data, valid_data



def SPECTRUM_Spectrum_9_RESET(handle):
    err = __abstracted_reg_write(2, R76Firmware_RegisterFile.SCI_REG_Spectrum_9_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_9_START(handle):
    err = __abstracted_reg_write(4, R76Firmware_RegisterFile.SCI_REG_Spectrum_9_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_9_FLUSH(handle):
    err = __abstracted_reg_write(1, R76Firmware_RegisterFile.SCI_REG_Spectrum_9_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_9_STOP(handle):
    err = __abstracted_reg_write(0, R76Firmware_RegisterFile.SCI_REG_Spectrum_9_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_9_SET_PARAMETERS(Bin, AcquisitionMode, TargetValue, handle):
    rebin_value=0
    if (Bin == 8192):
        rebin_value= 1
    if (Bin == 4096):
        rebin_value= 2
    if (Bin == 2048):
        rebin_value= 3
    if (Bin == 1024):
        rebin_value= 4
    if (Bin == 512):
        rebin_value= 5
    if (Bin == 256):
        rebin_value= 6
    if (Bin == 128):
        rebin_value= 7
    err = __abstracted_reg_write(rebin_value, R76Firmware_RegisterFile.SCI_REG_Spectrum_9_CONFIG_REBIN, handle)
    acq_mode=0
    if (AcquisitionMode =="Event"):
        acq_mode=(1 << 30) + TargetValue
    if (AcquisitionMode =="Time"):
        acq_mode=(1 << 31) + TargetValue*1000
    err = __abstracted_reg_write(acq_mode, R76Firmware_RegisterFile.SCI_REG_Spectrum_9_CONFIG_LIMIT, handle)
    return err

def SPECTRUM_Spectrum_9_GET_STATUS(handle):
    [err, status] = __abstracted_reg_read(R76Firmware_RegisterFile.SCI_REG_Spectrum_9_STATUS, handle)
    return err, status

def SPECTRUM_Spectrum_9_GET_DATA(Bin, timeout_ms, handle):
    [err, data, read_data, valid_data] = __abstracted_mem_read(Bin, R76Firmware_RegisterFile.SCI_REG_Spectrum_9_FIFOADDRESS, timeout_ms, handle)
    return err, data, read_data, valid_data



def SPECTRUM_Spectrum_11_RESET(handle):
    err = __abstracted_reg_write(2, R76Firmware_RegisterFile.SCI_REG_Spectrum_11_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_11_START(handle):
    err = __abstracted_reg_write(4, R76Firmware_RegisterFile.SCI_REG_Spectrum_11_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_11_FLUSH(handle):
    err = __abstracted_reg_write(1, R76Firmware_RegisterFile.SCI_REG_Spectrum_11_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_11_STOP(handle):
    err = __abstracted_reg_write(0, R76Firmware_RegisterFile.SCI_REG_Spectrum_11_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_11_SET_PARAMETERS(Bin, AcquisitionMode, TargetValue, handle):
    rebin_value=0
    if (Bin == 8192):
        rebin_value= 1
    if (Bin == 4096):
        rebin_value= 2
    if (Bin == 2048):
        rebin_value= 3
    if (Bin == 1024):
        rebin_value= 4
    if (Bin == 512):
        rebin_value= 5
    if (Bin == 256):
        rebin_value= 6
    if (Bin == 128):
        rebin_value= 7
    err = __abstracted_reg_write(rebin_value, R76Firmware_RegisterFile.SCI_REG_Spectrum_11_CONFIG_REBIN, handle)
    acq_mode=0
    if (AcquisitionMode =="Event"):
        acq_mode=(1 << 30) + TargetValue
    if (AcquisitionMode =="Time"):
        acq_mode=(1 << 31) + TargetValue*1000
    err = __abstracted_reg_write(acq_mode, R76Firmware_RegisterFile.SCI_REG_Spectrum_11_CONFIG_LIMIT, handle)
    return err

def SPECTRUM_Spectrum_11_GET_STATUS(handle):
    [err, status] = __abstracted_reg_read(R76Firmware_RegisterFile.SCI_REG_Spectrum_11_STATUS, handle)
    return err, status

def SPECTRUM_Spectrum_11_GET_DATA(Bin, timeout_ms, handle):
    [err, data, read_data, valid_data] = __abstracted_mem_read(Bin, R76Firmware_RegisterFile.SCI_REG_Spectrum_11_FIFOADDRESS, timeout_ms, handle)
    return err, data, read_data, valid_data



def SPECTRUM_Spectrum_12_RESET(handle):
    err = __abstracted_reg_write(2, R76Firmware_RegisterFile.SCI_REG_Spectrum_12_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_12_START(handle):
    err = __abstracted_reg_write(4, R76Firmware_RegisterFile.SCI_REG_Spectrum_12_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_12_FLUSH(handle):
    err = __abstracted_reg_write(1, R76Firmware_RegisterFile.SCI_REG_Spectrum_12_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_12_STOP(handle):
    err = __abstracted_reg_write(0, R76Firmware_RegisterFile.SCI_REG_Spectrum_12_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_12_SET_PARAMETERS(Bin, AcquisitionMode, TargetValue, handle):
    rebin_value=0
    if (Bin == 8192):
        rebin_value= 1
    if (Bin == 4096):
        rebin_value= 2
    if (Bin == 2048):
        rebin_value= 3
    if (Bin == 1024):
        rebin_value= 4
    if (Bin == 512):
        rebin_value= 5
    if (Bin == 256):
        rebin_value= 6
    if (Bin == 128):
        rebin_value= 7
    err = __abstracted_reg_write(rebin_value, R76Firmware_RegisterFile.SCI_REG_Spectrum_12_CONFIG_REBIN, handle)
    acq_mode=0
    if (AcquisitionMode =="Event"):
        acq_mode=(1 << 30) + TargetValue
    if (AcquisitionMode =="Time"):
        acq_mode=(1 << 31) + TargetValue*1000
    err = __abstracted_reg_write(acq_mode, R76Firmware_RegisterFile.SCI_REG_Spectrum_12_CONFIG_LIMIT, handle)
    return err

def SPECTRUM_Spectrum_12_GET_STATUS(handle):
    [err, status] = __abstracted_reg_read(R76Firmware_RegisterFile.SCI_REG_Spectrum_12_STATUS, handle)
    return err, status

def SPECTRUM_Spectrum_12_GET_DATA(Bin, timeout_ms, handle):
    [err, data, read_data, valid_data] = __abstracted_mem_read(Bin, R76Firmware_RegisterFile.SCI_REG_Spectrum_12_FIFOADDRESS, timeout_ms, handle)
    return err, data, read_data, valid_data



def SPECTRUM_Spectrum_13_RESET(handle):
    err = __abstracted_reg_write(2, R76Firmware_RegisterFile.SCI_REG_Spectrum_13_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_13_START(handle):
    err = __abstracted_reg_write(4, R76Firmware_RegisterFile.SCI_REG_Spectrum_13_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_13_FLUSH(handle):
    err = __abstracted_reg_write(1, R76Firmware_RegisterFile.SCI_REG_Spectrum_13_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_13_STOP(handle):
    err = __abstracted_reg_write(0, R76Firmware_RegisterFile.SCI_REG_Spectrum_13_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_13_SET_PARAMETERS(Bin, AcquisitionMode, TargetValue, handle):
    rebin_value=0
    if (Bin == 8192):
        rebin_value= 1
    if (Bin == 4096):
        rebin_value= 2
    if (Bin == 2048):
        rebin_value= 3
    if (Bin == 1024):
        rebin_value= 4
    if (Bin == 512):
        rebin_value= 5
    if (Bin == 256):
        rebin_value= 6
    if (Bin == 128):
        rebin_value= 7
    err = __abstracted_reg_write(rebin_value, R76Firmware_RegisterFile.SCI_REG_Spectrum_13_CONFIG_REBIN, handle)
    acq_mode=0
    if (AcquisitionMode =="Event"):
        acq_mode=(1 << 30) + TargetValue
    if (AcquisitionMode =="Time"):
        acq_mode=(1 << 31) + TargetValue*1000
    err = __abstracted_reg_write(acq_mode, R76Firmware_RegisterFile.SCI_REG_Spectrum_13_CONFIG_LIMIT, handle)
    return err

def SPECTRUM_Spectrum_13_GET_STATUS(handle):
    [err, status] = __abstracted_reg_read(R76Firmware_RegisterFile.SCI_REG_Spectrum_13_STATUS, handle)
    return err, status

def SPECTRUM_Spectrum_13_GET_DATA(Bin, timeout_ms, handle):
    [err, data, read_data, valid_data] = __abstracted_mem_read(Bin, R76Firmware_RegisterFile.SCI_REG_Spectrum_13_FIFOADDRESS, timeout_ms, handle)
    return err, data, read_data, valid_data



def SPECTRUM_Spectrum_14_RESET(handle):
    err = __abstracted_reg_write(2, R76Firmware_RegisterFile.SCI_REG_Spectrum_14_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_14_START(handle):
    err = __abstracted_reg_write(4, R76Firmware_RegisterFile.SCI_REG_Spectrum_14_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_14_FLUSH(handle):
    err = __abstracted_reg_write(1, R76Firmware_RegisterFile.SCI_REG_Spectrum_14_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_14_STOP(handle):
    err = __abstracted_reg_write(0, R76Firmware_RegisterFile.SCI_REG_Spectrum_14_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_14_SET_PARAMETERS(Bin, AcquisitionMode, TargetValue, handle):
    rebin_value=0
    if (Bin == 8192):
        rebin_value= 1
    if (Bin == 4096):
        rebin_value= 2
    if (Bin == 2048):
        rebin_value= 3
    if (Bin == 1024):
        rebin_value= 4
    if (Bin == 512):
        rebin_value= 5
    if (Bin == 256):
        rebin_value= 6
    if (Bin == 128):
        rebin_value= 7
    err = __abstracted_reg_write(rebin_value, R76Firmware_RegisterFile.SCI_REG_Spectrum_14_CONFIG_REBIN, handle)
    acq_mode=0
    if (AcquisitionMode =="Event"):
        acq_mode=(1 << 30) + TargetValue
    if (AcquisitionMode =="Time"):
        acq_mode=(1 << 31) + TargetValue*1000
    err = __abstracted_reg_write(acq_mode, R76Firmware_RegisterFile.SCI_REG_Spectrum_14_CONFIG_LIMIT, handle)
    return err

def SPECTRUM_Spectrum_14_GET_STATUS(handle):
    [err, status] = __abstracted_reg_read(R76Firmware_RegisterFile.SCI_REG_Spectrum_14_STATUS, handle)
    return err, status

def SPECTRUM_Spectrum_14_GET_DATA(Bin, timeout_ms, handle):
    [err, data, read_data, valid_data] = __abstracted_mem_read(Bin, R76Firmware_RegisterFile.SCI_REG_Spectrum_14_FIFOADDRESS, timeout_ms, handle)
    return err, data, read_data, valid_data



def SPECTRUM_Spectrum_15_RESET(handle):
    err = __abstracted_reg_write(2, R76Firmware_RegisterFile.SCI_REG_Spectrum_15_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_15_START(handle):
    err = __abstracted_reg_write(4, R76Firmware_RegisterFile.SCI_REG_Spectrum_15_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_15_FLUSH(handle):
    err = __abstracted_reg_write(1, R76Firmware_RegisterFile.SCI_REG_Spectrum_15_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_15_STOP(handle):
    err = __abstracted_reg_write(0, R76Firmware_RegisterFile.SCI_REG_Spectrum_15_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_15_SET_PARAMETERS(Bin, AcquisitionMode, TargetValue, handle):
    rebin_value=0
    if (Bin == 8192):
        rebin_value= 1
    if (Bin == 4096):
        rebin_value= 2
    if (Bin == 2048):
        rebin_value= 3
    if (Bin == 1024):
        rebin_value= 4
    if (Bin == 512):
        rebin_value= 5
    if (Bin == 256):
        rebin_value= 6
    if (Bin == 128):
        rebin_value= 7
    err = __abstracted_reg_write(rebin_value, R76Firmware_RegisterFile.SCI_REG_Spectrum_15_CONFIG_REBIN, handle)
    acq_mode=0
    if (AcquisitionMode =="Event"):
        acq_mode=(1 << 30) + TargetValue
    if (AcquisitionMode =="Time"):
        acq_mode=(1 << 31) + TargetValue*1000
    err = __abstracted_reg_write(acq_mode, R76Firmware_RegisterFile.SCI_REG_Spectrum_15_CONFIG_LIMIT, handle)
    return err

def SPECTRUM_Spectrum_15_GET_STATUS(handle):
    [err, status] = __abstracted_reg_read(R76Firmware_RegisterFile.SCI_REG_Spectrum_15_STATUS, handle)
    return err, status

def SPECTRUM_Spectrum_15_GET_DATA(Bin, timeout_ms, handle):
    [err, data, read_data, valid_data] = __abstracted_mem_read(Bin, R76Firmware_RegisterFile.SCI_REG_Spectrum_15_FIFOADDRESS, timeout_ms, handle)
    return err, data, read_data, valid_data



def SPECTRUM_Spectrum_16_RESET(handle):
    err = __abstracted_reg_write(2, R76Firmware_RegisterFile.SCI_REG_Spectrum_16_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_16_START(handle):
    err = __abstracted_reg_write(4, R76Firmware_RegisterFile.SCI_REG_Spectrum_16_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_16_FLUSH(handle):
    err = __abstracted_reg_write(1, R76Firmware_RegisterFile.SCI_REG_Spectrum_16_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_16_STOP(handle):
    err = __abstracted_reg_write(0, R76Firmware_RegisterFile.SCI_REG_Spectrum_16_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_16_SET_PARAMETERS(Bin, AcquisitionMode, TargetValue, handle):
    rebin_value=0
    if (Bin == 8192):
        rebin_value= 1
    if (Bin == 4096):
        rebin_value= 2
    if (Bin == 2048):
        rebin_value= 3
    if (Bin == 1024):
        rebin_value= 4
    if (Bin == 512):
        rebin_value= 5
    if (Bin == 256):
        rebin_value= 6
    if (Bin == 128):
        rebin_value= 7
    err = __abstracted_reg_write(rebin_value, R76Firmware_RegisterFile.SCI_REG_Spectrum_16_CONFIG_REBIN, handle)
    acq_mode=0
    if (AcquisitionMode =="Event"):
        acq_mode=(1 << 30) + TargetValue
    if (AcquisitionMode =="Time"):
        acq_mode=(1 << 31) + TargetValue*1000
    err = __abstracted_reg_write(acq_mode, R76Firmware_RegisterFile.SCI_REG_Spectrum_16_CONFIG_LIMIT, handle)
    return err

def SPECTRUM_Spectrum_16_GET_STATUS(handle):
    [err, status] = __abstracted_reg_read(R76Firmware_RegisterFile.SCI_REG_Spectrum_16_STATUS, handle)
    return err, status

def SPECTRUM_Spectrum_16_GET_DATA(Bin, timeout_ms, handle):
    [err, data, read_data, valid_data] = __abstracted_mem_read(Bin, R76Firmware_RegisterFile.SCI_REG_Spectrum_16_FIFOADDRESS, timeout_ms, handle)
    return err, data, read_data, valid_data



def SPECTRUM_Spectrum_17_RESET(handle):
    err = __abstracted_reg_write(2, R76Firmware_RegisterFile.SCI_REG_Spectrum_17_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_17_START(handle):
    err = __abstracted_reg_write(4, R76Firmware_RegisterFile.SCI_REG_Spectrum_17_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_17_FLUSH(handle):
    err = __abstracted_reg_write(1, R76Firmware_RegisterFile.SCI_REG_Spectrum_17_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_17_STOP(handle):
    err = __abstracted_reg_write(0, R76Firmware_RegisterFile.SCI_REG_Spectrum_17_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_17_SET_PARAMETERS(Bin, AcquisitionMode, TargetValue, handle):
    rebin_value=0
    if (Bin == 8192):
        rebin_value= 1
    if (Bin == 4096):
        rebin_value= 2
    if (Bin == 2048):
        rebin_value= 3
    if (Bin == 1024):
        rebin_value= 4
    if (Bin == 512):
        rebin_value= 5
    if (Bin == 256):
        rebin_value= 6
    if (Bin == 128):
        rebin_value= 7
    err = __abstracted_reg_write(rebin_value, R76Firmware_RegisterFile.SCI_REG_Spectrum_17_CONFIG_REBIN, handle)
    acq_mode=0
    if (AcquisitionMode =="Event"):
        acq_mode=(1 << 30) + TargetValue
    if (AcquisitionMode =="Time"):
        acq_mode=(1 << 31) + TargetValue*1000
    err = __abstracted_reg_write(acq_mode, R76Firmware_RegisterFile.SCI_REG_Spectrum_17_CONFIG_LIMIT, handle)
    return err

def SPECTRUM_Spectrum_17_GET_STATUS(handle):
    [err, status] = __abstracted_reg_read(R76Firmware_RegisterFile.SCI_REG_Spectrum_17_STATUS, handle)
    return err, status

def SPECTRUM_Spectrum_17_GET_DATA(Bin, timeout_ms, handle):
    [err, data, read_data, valid_data] = __abstracted_mem_read(Bin, R76Firmware_RegisterFile.SCI_REG_Spectrum_17_FIFOADDRESS, timeout_ms, handle)
    return err, data, read_data, valid_data



def SPECTRUM_Spectrum_18_RESET(handle):
    err = __abstracted_reg_write(2, R76Firmware_RegisterFile.SCI_REG_Spectrum_18_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_18_START(handle):
    err = __abstracted_reg_write(4, R76Firmware_RegisterFile.SCI_REG_Spectrum_18_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_18_FLUSH(handle):
    err = __abstracted_reg_write(1, R76Firmware_RegisterFile.SCI_REG_Spectrum_18_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_18_STOP(handle):
    err = __abstracted_reg_write(0, R76Firmware_RegisterFile.SCI_REG_Spectrum_18_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_18_SET_PARAMETERS(Bin, AcquisitionMode, TargetValue, handle):
    rebin_value=0
    if (Bin == 8192):
        rebin_value= 1
    if (Bin == 4096):
        rebin_value= 2
    if (Bin == 2048):
        rebin_value= 3
    if (Bin == 1024):
        rebin_value= 4
    if (Bin == 512):
        rebin_value= 5
    if (Bin == 256):
        rebin_value= 6
    if (Bin == 128):
        rebin_value= 7
    err = __abstracted_reg_write(rebin_value, R76Firmware_RegisterFile.SCI_REG_Spectrum_18_CONFIG_REBIN, handle)
    acq_mode=0
    if (AcquisitionMode =="Event"):
        acq_mode=(1 << 30) + TargetValue
    if (AcquisitionMode =="Time"):
        acq_mode=(1 << 31) + TargetValue*1000
    err = __abstracted_reg_write(acq_mode, R76Firmware_RegisterFile.SCI_REG_Spectrum_18_CONFIG_LIMIT, handle)
    return err

def SPECTRUM_Spectrum_18_GET_STATUS(handle):
    [err, status] = __abstracted_reg_read(R76Firmware_RegisterFile.SCI_REG_Spectrum_18_STATUS, handle)
    return err, status

def SPECTRUM_Spectrum_18_GET_DATA(Bin, timeout_ms, handle):
    [err, data, read_data, valid_data] = __abstracted_mem_read(Bin, R76Firmware_RegisterFile.SCI_REG_Spectrum_18_FIFOADDRESS, timeout_ms, handle)
    return err, data, read_data, valid_data



def SPECTRUM_Spectrum_19_RESET(handle):
    err = __abstracted_reg_write(2, R76Firmware_RegisterFile.SCI_REG_Spectrum_19_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_19_START(handle):
    err = __abstracted_reg_write(4, R76Firmware_RegisterFile.SCI_REG_Spectrum_19_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_19_FLUSH(handle):
    err = __abstracted_reg_write(1, R76Firmware_RegisterFile.SCI_REG_Spectrum_19_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_19_STOP(handle):
    err = __abstracted_reg_write(0, R76Firmware_RegisterFile.SCI_REG_Spectrum_19_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_19_SET_PARAMETERS(Bin, AcquisitionMode, TargetValue, handle):
    rebin_value=0
    if (Bin == 8192):
        rebin_value= 1
    if (Bin == 4096):
        rebin_value= 2
    if (Bin == 2048):
        rebin_value= 3
    if (Bin == 1024):
        rebin_value= 4
    if (Bin == 512):
        rebin_value= 5
    if (Bin == 256):
        rebin_value= 6
    if (Bin == 128):
        rebin_value= 7
    err = __abstracted_reg_write(rebin_value, R76Firmware_RegisterFile.SCI_REG_Spectrum_19_CONFIG_REBIN, handle)
    acq_mode=0
    if (AcquisitionMode =="Event"):
        acq_mode=(1 << 30) + TargetValue
    if (AcquisitionMode =="Time"):
        acq_mode=(1 << 31) + TargetValue*1000
    err = __abstracted_reg_write(acq_mode, R76Firmware_RegisterFile.SCI_REG_Spectrum_19_CONFIG_LIMIT, handle)
    return err

def SPECTRUM_Spectrum_19_GET_STATUS(handle):
    [err, status] = __abstracted_reg_read(R76Firmware_RegisterFile.SCI_REG_Spectrum_19_STATUS, handle)
    return err, status

def SPECTRUM_Spectrum_19_GET_DATA(Bin, timeout_ms, handle):
    [err, data, read_data, valid_data] = __abstracted_mem_read(Bin, R76Firmware_RegisterFile.SCI_REG_Spectrum_19_FIFOADDRESS, timeout_ms, handle)
    return err, data, read_data, valid_data



def SPECTRUM_Spectrum_20_RESET(handle):
    err = __abstracted_reg_write(2, R76Firmware_RegisterFile.SCI_REG_Spectrum_20_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_20_START(handle):
    err = __abstracted_reg_write(4, R76Firmware_RegisterFile.SCI_REG_Spectrum_20_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_20_FLUSH(handle):
    err = __abstracted_reg_write(1, R76Firmware_RegisterFile.SCI_REG_Spectrum_20_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_20_STOP(handle):
    err = __abstracted_reg_write(0, R76Firmware_RegisterFile.SCI_REG_Spectrum_20_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_20_SET_PARAMETERS(Bin, AcquisitionMode, TargetValue, handle):
    rebin_value=0
    if (Bin == 8192):
        rebin_value= 1
    if (Bin == 4096):
        rebin_value= 2
    if (Bin == 2048):
        rebin_value= 3
    if (Bin == 1024):
        rebin_value= 4
    if (Bin == 512):
        rebin_value= 5
    if (Bin == 256):
        rebin_value= 6
    if (Bin == 128):
        rebin_value= 7
    err = __abstracted_reg_write(rebin_value, R76Firmware_RegisterFile.SCI_REG_Spectrum_20_CONFIG_REBIN, handle)
    acq_mode=0
    if (AcquisitionMode =="Event"):
        acq_mode=(1 << 30) + TargetValue
    if (AcquisitionMode =="Time"):
        acq_mode=(1 << 31) + TargetValue*1000
    err = __abstracted_reg_write(acq_mode, R76Firmware_RegisterFile.SCI_REG_Spectrum_20_CONFIG_LIMIT, handle)
    return err

def SPECTRUM_Spectrum_20_GET_STATUS(handle):
    [err, status] = __abstracted_reg_read(R76Firmware_RegisterFile.SCI_REG_Spectrum_20_STATUS, handle)
    return err, status

def SPECTRUM_Spectrum_20_GET_DATA(Bin, timeout_ms, handle):
    [err, data, read_data, valid_data] = __abstracted_mem_read(Bin, R76Firmware_RegisterFile.SCI_REG_Spectrum_20_FIFOADDRESS, timeout_ms, handle)
    return err, data, read_data, valid_data



def SPECTRUM_Spectrum_21_RESET(handle):
    err = __abstracted_reg_write(2, R76Firmware_RegisterFile.SCI_REG_Spectrum_21_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_21_START(handle):
    err = __abstracted_reg_write(4, R76Firmware_RegisterFile.SCI_REG_Spectrum_21_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_21_FLUSH(handle):
    err = __abstracted_reg_write(1, R76Firmware_RegisterFile.SCI_REG_Spectrum_21_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_21_STOP(handle):
    err = __abstracted_reg_write(0, R76Firmware_RegisterFile.SCI_REG_Spectrum_21_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_21_SET_PARAMETERS(Bin, AcquisitionMode, TargetValue, handle):
    rebin_value=0
    if (Bin == 8192):
        rebin_value= 1
    if (Bin == 4096):
        rebin_value= 2
    if (Bin == 2048):
        rebin_value= 3
    if (Bin == 1024):
        rebin_value= 4
    if (Bin == 512):
        rebin_value= 5
    if (Bin == 256):
        rebin_value= 6
    if (Bin == 128):
        rebin_value= 7
    err = __abstracted_reg_write(rebin_value, R76Firmware_RegisterFile.SCI_REG_Spectrum_21_CONFIG_REBIN, handle)
    acq_mode=0
    if (AcquisitionMode =="Event"):
        acq_mode=(1 << 30) + TargetValue
    if (AcquisitionMode =="Time"):
        acq_mode=(1 << 31) + TargetValue*1000
    err = __abstracted_reg_write(acq_mode, R76Firmware_RegisterFile.SCI_REG_Spectrum_21_CONFIG_LIMIT, handle)
    return err

def SPECTRUM_Spectrum_21_GET_STATUS(handle):
    [err, status] = __abstracted_reg_read(R76Firmware_RegisterFile.SCI_REG_Spectrum_21_STATUS, handle)
    return err, status

def SPECTRUM_Spectrum_21_GET_DATA(Bin, timeout_ms, handle):
    [err, data, read_data, valid_data] = __abstracted_mem_read(Bin, R76Firmware_RegisterFile.SCI_REG_Spectrum_21_FIFOADDRESS, timeout_ms, handle)
    return err, data, read_data, valid_data



def SPECTRUM_Spectrum_22_RESET(handle):
    err = __abstracted_reg_write(2, R76Firmware_RegisterFile.SCI_REG_Spectrum_22_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_22_START(handle):
    err = __abstracted_reg_write(4, R76Firmware_RegisterFile.SCI_REG_Spectrum_22_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_22_FLUSH(handle):
    err = __abstracted_reg_write(1, R76Firmware_RegisterFile.SCI_REG_Spectrum_22_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_22_STOP(handle):
    err = __abstracted_reg_write(0, R76Firmware_RegisterFile.SCI_REG_Spectrum_22_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_22_SET_PARAMETERS(Bin, AcquisitionMode, TargetValue, handle):
    rebin_value=0
    if (Bin == 8192):
        rebin_value= 1
    if (Bin == 4096):
        rebin_value= 2
    if (Bin == 2048):
        rebin_value= 3
    if (Bin == 1024):
        rebin_value= 4
    if (Bin == 512):
        rebin_value= 5
    if (Bin == 256):
        rebin_value= 6
    if (Bin == 128):
        rebin_value= 7
    err = __abstracted_reg_write(rebin_value, R76Firmware_RegisterFile.SCI_REG_Spectrum_22_CONFIG_REBIN, handle)
    acq_mode=0
    if (AcquisitionMode =="Event"):
        acq_mode=(1 << 30) + TargetValue
    if (AcquisitionMode =="Time"):
        acq_mode=(1 << 31) + TargetValue*1000
    err = __abstracted_reg_write(acq_mode, R76Firmware_RegisterFile.SCI_REG_Spectrum_22_CONFIG_LIMIT, handle)
    return err

def SPECTRUM_Spectrum_22_GET_STATUS(handle):
    [err, status] = __abstracted_reg_read(R76Firmware_RegisterFile.SCI_REG_Spectrum_22_STATUS, handle)
    return err, status

def SPECTRUM_Spectrum_22_GET_DATA(Bin, timeout_ms, handle):
    [err, data, read_data, valid_data] = __abstracted_mem_read(Bin, R76Firmware_RegisterFile.SCI_REG_Spectrum_22_FIFOADDRESS, timeout_ms, handle)
    return err, data, read_data, valid_data



def SPECTRUM_Spectrum_23_RESET(handle):
    err = __abstracted_reg_write(2, R76Firmware_RegisterFile.SCI_REG_Spectrum_23_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_23_START(handle):
    err = __abstracted_reg_write(4, R76Firmware_RegisterFile.SCI_REG_Spectrum_23_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_23_FLUSH(handle):
    err = __abstracted_reg_write(1, R76Firmware_RegisterFile.SCI_REG_Spectrum_23_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_23_STOP(handle):
    err = __abstracted_reg_write(0, R76Firmware_RegisterFile.SCI_REG_Spectrum_23_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_23_SET_PARAMETERS(Bin, AcquisitionMode, TargetValue, handle):
    rebin_value=0
    if (Bin == 8192):
        rebin_value= 1
    if (Bin == 4096):
        rebin_value= 2
    if (Bin == 2048):
        rebin_value= 3
    if (Bin == 1024):
        rebin_value= 4
    if (Bin == 512):
        rebin_value= 5
    if (Bin == 256):
        rebin_value= 6
    if (Bin == 128):
        rebin_value= 7
    err = __abstracted_reg_write(rebin_value, R76Firmware_RegisterFile.SCI_REG_Spectrum_23_CONFIG_REBIN, handle)
    acq_mode=0
    if (AcquisitionMode =="Event"):
        acq_mode=(1 << 30) + TargetValue
    if (AcquisitionMode =="Time"):
        acq_mode=(1 << 31) + TargetValue*1000
    err = __abstracted_reg_write(acq_mode, R76Firmware_RegisterFile.SCI_REG_Spectrum_23_CONFIG_LIMIT, handle)
    return err

def SPECTRUM_Spectrum_23_GET_STATUS(handle):
    [err, status] = __abstracted_reg_read(R76Firmware_RegisterFile.SCI_REG_Spectrum_23_STATUS, handle)
    return err, status

def SPECTRUM_Spectrum_23_GET_DATA(Bin, timeout_ms, handle):
    [err, data, read_data, valid_data] = __abstracted_mem_read(Bin, R76Firmware_RegisterFile.SCI_REG_Spectrum_23_FIFOADDRESS, timeout_ms, handle)
    return err, data, read_data, valid_data



def SPECTRUM_Spectrum_0_RESET(handle):
    err = __abstracted_reg_write(2, R76Firmware_RegisterFile.SCI_REG_Spectrum_0_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_0_START(handle):
    err = __abstracted_reg_write(4, R76Firmware_RegisterFile.SCI_REG_Spectrum_0_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_0_FLUSH(handle):
    err = __abstracted_reg_write(1, R76Firmware_RegisterFile.SCI_REG_Spectrum_0_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_0_STOP(handle):
    err = __abstracted_reg_write(0, R76Firmware_RegisterFile.SCI_REG_Spectrum_0_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_0_SET_PARAMETERS(Bin, AcquisitionMode, TargetValue, handle):
    rebin_value=0
    if (Bin == 8192):
        rebin_value= 1
    if (Bin == 4096):
        rebin_value= 2
    if (Bin == 2048):
        rebin_value= 3
    if (Bin == 1024):
        rebin_value= 4
    if (Bin == 512):
        rebin_value= 5
    if (Bin == 256):
        rebin_value= 6
    if (Bin == 128):
        rebin_value= 7
    err = __abstracted_reg_write(rebin_value, R76Firmware_RegisterFile.SCI_REG_Spectrum_0_CONFIG_REBIN, handle)
    acq_mode=0
    if (AcquisitionMode =="Event"):
        acq_mode=(1 << 30) + TargetValue
    if (AcquisitionMode =="Time"):
        acq_mode=(1 << 31) + TargetValue*1000
    err = __abstracted_reg_write(acq_mode, R76Firmware_RegisterFile.SCI_REG_Spectrum_0_CONFIG_LIMIT, handle)
    return err

def SPECTRUM_Spectrum_0_GET_STATUS(handle):
    [err, status] = __abstracted_reg_read(R76Firmware_RegisterFile.SCI_REG_Spectrum_0_STATUS, handle)
    return err, status

def SPECTRUM_Spectrum_0_GET_DATA(Bin, timeout_ms, handle):
    [err, data, read_data, valid_data] = __abstracted_mem_read(Bin, R76Firmware_RegisterFile.SCI_REG_Spectrum_0_FIFOADDRESS, timeout_ms, handle)
    return err, data, read_data, valid_data



def OSCILLOSCOPE_Syncs_START(handle):
    err = __abstracted_reg_write(0, R76Firmware_RegisterFile.SCI_REG_Syncs_CONFIG_ARM, handle)
    if (err != 0):
       return False
    err = __abstracted_reg_write(1, R76Firmware_RegisterFile.SCI_REG_Syncs_CONFIG_ARM, handle)
    if (err != 0):
       return False
    return True

def OSCILLOSCOPE_Syncs_SET_DECIMATOR(OscilloscopeDecimator, handle):
    err = __abstracted_reg_write(OscilloscopeDecimator, R76Firmware_RegisterFile.SCI_REG_Syncs_CONFIG_DECIMATOR, handle)
    return err

def OSCILLOSCOPE_Syncs_SET_PRETRIGGER(OscilloscopePreTrigger, handle):
    err = __abstracted_reg_write(OscilloscopePreTrigger, R76Firmware_RegisterFile.SCI_REG_Syncs_CONFIG_PRETRIGGER, handle)
    return err

def OSCILLOSCOPE_Syncs_SET_TRIGGER_LEVEL(OscilloscopeTriggerLevel, handle):
    err = __abstracted_reg_write(OscilloscopeTriggerLevel, R76Firmware_RegisterFile.SCI_REG_Syncs_CONFIG_TRIGGER_LEVEL, handle)
    return err

def OSCILLOSCOPE_Syncs_SET_TRIGGER_MODE(OscilloscopeTriggerMode, OscilloscopeTriggerChannel, OscilloscopeTriggerEdge, handle):
    AnalogTrigger = 0
    Digital0Trigger = 0
    Digital1Trigger = 0
    Digital2Trigger = 0
    Digital3Trigger = 0
    SoftwareTrigger = 0
    if (OscilloscopeTriggerMode == "Analog"):
        AnalogTrigger = 1
    if (OscilloscopeTriggerMode == "Digital0"):
        Digital0Trigger = 1
    if (OscilloscopeTriggerMode == "Digital1"):
        Digital1Trigger = 1
    if (OscilloscopeTriggerMode == "Digital2"):
        Digital2Trigger = 1
    if (OscilloscopeTriggerMode == "Digital3"):
        Digital3Trigger = 1
    if (OscilloscopeTriggerMode == "Free"):
        SoftwareTrigger = 1
    if (OscilloscopeTriggerEdge == "Rising"):
        Edge = 0
    else:
        Edge = 1
    triggermode = c_int(0)
    triggermode = (OscilloscopeTriggerChannel << 8)  + (SoftwareTrigger << 7 ) + (Edge << 3) + (SoftwareTrigger << 1) + AnalogTrigger +(Digital0Trigger << 2) + (Digital1Trigger << 2) + Digital1Trigger + (Digital2Trigger << 2) + (Digital2Trigger << 1) + (Digital3Trigger << 2) + (Digital3Trigger << 1) + Digital3Trigger
    err = __abstracted_reg_write(triggermode, R76Firmware_RegisterFile.SCI_REG_Syncs_CONFIG_TRIGGER_MODE, handle)
    return err

def OSCILLOSCOPE_Syncs_GET_STATUS(handle):
    [err, status] = __abstracted_reg_read(R76Firmware_RegisterFile.SCI_REG_Syncs_READ_STATUS, handle)
    return err, status

def OSCILLOSCOPE_Syncs_GET_POSITION(handle):
    [err, position] = __abstracted_reg_read(R76Firmware_RegisterFile.SCI_REG_Syncs_READ_POSITION, handle)
    return err, position

def OSCILLOSCOPE_Syncs_GET_DATA(timeout_ms, handle):
    [err, data, read_data, valid_data] = __abstracted_mem_read(3072, R76Firmware_RegisterFile.SCI_REG_Syncs_FIFOADDRESS, timeout_ms, handle)
    return err, data, read_data, valid_data

def OSCILLOSCOPE_Syncs_RECONSTRUCT_DATA(OscilloscopeData, OscilloscopePosition, OscilloscopePreTrigger):
    OscilloscopeChannels = 3
    OscilloscopeSamples = 1024
    Analog = list(range(OscilloscopeSamples*OscilloscopeChannels))
    Digital0 = list(range(OscilloscopeSamples*OscilloscopeChannels))
    Digital1 = list(range(OscilloscopeSamples*OscilloscopeChannels))
    Digital2 = list(range(OscilloscopeSamples*OscilloscopeChannels))
    Digital3 = list(range(OscilloscopeSamples*OscilloscopeChannels))
    for n in range(OscilloscopeChannels):
        current = OscilloscopePosition - OscilloscopePreTrigger
        if ((current) > 0):
            k = 0
            for i in range(current, OscilloscopeSamples-1):
                Analog[k+ OscilloscopeSamples * n] = OscilloscopeData[i+ OscilloscopeSamples * n] & 65535
                Digital0[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 16 & 1)
                Digital1[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 17 & 1)
                Digital2[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 18 & 1)
                Digital3[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 19 & 1)
                k = k + 1
            for i in range(0, current-1):
                Analog[k+ OscilloscopeSamples * n] = OscilloscopeData[i+ OscilloscopeSamples * n] & 65535
                Digital0[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 16 & 1)
                Digital1[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 17 & 1)
                Digital2[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 18 & 1)
                Digital3[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 19 & 1)
                k = k + 1
        else:
            k = 0
            for i in range(OscilloscopeSamples+current, OscilloscopeSamples-1):
                Analog[k+ OscilloscopeSamples * n] = OscilloscopeData[i+ OscilloscopeSamples * n] & 65535
                Digital0[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 16 & 1)
                Digital1[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 17 & 1)
                Digital2[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 18 & 1)
                Digital3[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 19 & 1)
                k = k + 1
            for i in range(0, OscilloscopeSamples+current-1):
                Analog[k+ OscilloscopeSamples * n] = OscilloscopeData[i+ OscilloscopeSamples * n] & 65535
                Digital0[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 16 & 1)
                Digital1[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 17 & 1)
                Digital2[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 18 & 1)
                Digital3[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 19 & 1)
                k = k + 1
    return Analog, Digital0, Digital1,Digital2, Digital3




def RATE_METER_RateMeter_GET_DATA(channels, timeout_ms, handle):
    [err, data, read_data, valid_data] = __abstracted_mem_read(channels, R76Firmware_RegisterFile.SCI_REG_RateMeter_FIFOADDRESS, timeout_ms, handle)
    return err, data, read_data, valid_data




def RATE_METER_RateMeter_GET_DATA_COUNTS(channels, timeout_ms, handle):
    [err, data, read_data, valid_data] = __abstracted_mem_read(channels, R76Firmware_RegisterFile.SCI_REG_RateMeter_FIFOADDRESS + 512, timeout_ms, handle)
    return err, data, read_data, valid_data




def RATE_METER_SyncIn_GET_DATA(channels, timeout_ms, handle):
    [err, data, read_data, valid_data] = __abstracted_mem_read(channels, R76Firmware_RegisterFile.SCI_REG_SyncIn_FIFOADDRESS, timeout_ms, handle)
    return err, data, read_data, valid_data




def RATE_METER_SyncIn_GET_DATA_COUNTS(channels, timeout_ms, handle):
    [err, data, read_data, valid_data] = __abstracted_mem_read(channels, R76Firmware_RegisterFile.SCI_REG_SyncIn_FIFOADDRESS + 512, timeout_ms, handle)
    return err, data, read_data, valid_data



def OSCILLOSCOPE_Analog_START(handle):
    err = __abstracted_reg_write(0, R76Firmware_RegisterFile.SCI_REG_Analog_CONFIG_ARM, handle)
    if (err != 0):
       return False
    err = __abstracted_reg_write(1, R76Firmware_RegisterFile.SCI_REG_Analog_CONFIG_ARM, handle)
    if (err != 0):
       return False
    return True

def OSCILLOSCOPE_Analog_SET_DECIMATOR(OscilloscopeDecimator, handle):
    err = __abstracted_reg_write(OscilloscopeDecimator, R76Firmware_RegisterFile.SCI_REG_Analog_CONFIG_DECIMATOR, handle)
    return err

def OSCILLOSCOPE_Analog_SET_PRETRIGGER(OscilloscopePreTrigger, handle):
    err = __abstracted_reg_write(OscilloscopePreTrigger, R76Firmware_RegisterFile.SCI_REG_Analog_CONFIG_PRETRIGGER, handle)
    return err

def OSCILLOSCOPE_Analog_SET_TRIGGER_LEVEL(OscilloscopeTriggerLevel, handle):
    err = __abstracted_reg_write(OscilloscopeTriggerLevel, R76Firmware_RegisterFile.SCI_REG_Analog_CONFIG_TRIGGER_LEVEL, handle)
    return err

def OSCILLOSCOPE_Analog_SET_TRIGGER_MODE(OscilloscopeTriggerMode, OscilloscopeTriggerChannel, OscilloscopeTriggerEdge, handle):
    AnalogTrigger = 0
    Digital0Trigger = 0
    Digital1Trigger = 0
    Digital2Trigger = 0
    Digital3Trigger = 0
    SoftwareTrigger = 0
    if (OscilloscopeTriggerMode == "Analog"):
        AnalogTrigger = 1
    if (OscilloscopeTriggerMode == "Digital0"):
        Digital0Trigger = 1
    if (OscilloscopeTriggerMode == "Digital1"):
        Digital1Trigger = 1
    if (OscilloscopeTriggerMode == "Digital2"):
        Digital2Trigger = 1
    if (OscilloscopeTriggerMode == "Digital3"):
        Digital3Trigger = 1
    if (OscilloscopeTriggerMode == "Free"):
        SoftwareTrigger = 1
    if (OscilloscopeTriggerEdge == "Rising"):
        Edge = 0
    else:
        Edge = 1
    triggermode = c_int(0)
    triggermode = (OscilloscopeTriggerChannel << 8)  + (SoftwareTrigger << 7 ) + (Edge << 3) + (SoftwareTrigger << 1) + AnalogTrigger +(Digital0Trigger << 2) + (Digital1Trigger << 2) + Digital1Trigger + (Digital2Trigger << 2) + (Digital2Trigger << 1) + (Digital3Trigger << 2) + (Digital3Trigger << 1) + Digital3Trigger
    err = __abstracted_reg_write(triggermode, R76Firmware_RegisterFile.SCI_REG_Analog_CONFIG_TRIGGER_MODE, handle)
    return err

def OSCILLOSCOPE_Analog_GET_STATUS(handle):
    [err, status] = __abstracted_reg_read(R76Firmware_RegisterFile.SCI_REG_Analog_READ_STATUS, handle)
    return err, status

def OSCILLOSCOPE_Analog_GET_POSITION(handle):
    [err, position] = __abstracted_reg_read(R76Firmware_RegisterFile.SCI_REG_Analog_READ_POSITION, handle)
    return err, position

def OSCILLOSCOPE_Analog_GET_DATA(timeout_ms, handle):
    [err, data, read_data, valid_data] = __abstracted_mem_read(24576, R76Firmware_RegisterFile.SCI_REG_Analog_FIFOADDRESS, timeout_ms, handle)
    return err, data, read_data, valid_data

def OSCILLOSCOPE_Analog_RECONSTRUCT_DATA(OscilloscopeData, OscilloscopePosition, OscilloscopePreTrigger):
    OscilloscopeChannels = 24
    OscilloscopeSamples = 1024
    Analog = list(range(OscilloscopeSamples*OscilloscopeChannels))
    Digital0 = list(range(OscilloscopeSamples*OscilloscopeChannels))
    Digital1 = list(range(OscilloscopeSamples*OscilloscopeChannels))
    Digital2 = list(range(OscilloscopeSamples*OscilloscopeChannels))
    Digital3 = list(range(OscilloscopeSamples*OscilloscopeChannels))
    for n in range(OscilloscopeChannels):
        current = OscilloscopePosition - OscilloscopePreTrigger
        if ((current) > 0):
            k = 0
            for i in range(current, OscilloscopeSamples-1):
                Analog[k+ OscilloscopeSamples * n] = OscilloscopeData[i+ OscilloscopeSamples * n] & 65535
                Digital0[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 16 & 1)
                Digital1[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 17 & 1)
                Digital2[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 18 & 1)
                Digital3[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 19 & 1)
                k = k + 1
            for i in range(0, current-1):
                Analog[k+ OscilloscopeSamples * n] = OscilloscopeData[i+ OscilloscopeSamples * n] & 65535
                Digital0[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 16 & 1)
                Digital1[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 17 & 1)
                Digital2[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 18 & 1)
                Digital3[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 19 & 1)
                k = k + 1
        else:
            k = 0
            for i in range(OscilloscopeSamples+current, OscilloscopeSamples-1):
                Analog[k+ OscilloscopeSamples * n] = OscilloscopeData[i+ OscilloscopeSamples * n] & 65535
                Digital0[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 16 & 1)
                Digital1[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 17 & 1)
                Digital2[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 18 & 1)
                Digital3[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 19 & 1)
                k = k + 1
            for i in range(0, OscilloscopeSamples+current-1):
                Analog[k+ OscilloscopeSamples * n] = OscilloscopeData[i+ OscilloscopeSamples * n] & 65535
                Digital0[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 16 & 1)
                Digital1[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 17 & 1)
                Digital2[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 18 & 1)
                Digital3[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 19 & 1)
                k = k + 1
    return Analog, Digital0, Digital1,Digital2, Digital3



def OSCILLOSCOPE_Energies_START(handle):
    err = __abstracted_reg_write(0, R76Firmware_RegisterFile.SCI_REG_Energies_CONFIG_ARM, handle)
    if (err != 0):
       return False
    err = __abstracted_reg_write(1, R76Firmware_RegisterFile.SCI_REG_Energies_CONFIG_ARM, handle)
    if (err != 0):
       return False
    return True

def OSCILLOSCOPE_Energies_SET_DECIMATOR(OscilloscopeDecimator, handle):
    err = __abstracted_reg_write(OscilloscopeDecimator, R76Firmware_RegisterFile.SCI_REG_Energies_CONFIG_DECIMATOR, handle)
    return err

def OSCILLOSCOPE_Energies_SET_PRETRIGGER(OscilloscopePreTrigger, handle):
    err = __abstracted_reg_write(OscilloscopePreTrigger, R76Firmware_RegisterFile.SCI_REG_Energies_CONFIG_PRETRIGGER, handle)
    return err

def OSCILLOSCOPE_Energies_SET_TRIGGER_LEVEL(OscilloscopeTriggerLevel, handle):
    err = __abstracted_reg_write(OscilloscopeTriggerLevel, R76Firmware_RegisterFile.SCI_REG_Energies_CONFIG_TRIGGER_LEVEL, handle)
    return err

def OSCILLOSCOPE_Energies_SET_TRIGGER_MODE(OscilloscopeTriggerMode, OscilloscopeTriggerChannel, OscilloscopeTriggerEdge, handle):
    AnalogTrigger = 0
    Digital0Trigger = 0
    Digital1Trigger = 0
    Digital2Trigger = 0
    Digital3Trigger = 0
    SoftwareTrigger = 0
    if (OscilloscopeTriggerMode == "Analog"):
        AnalogTrigger = 1
    if (OscilloscopeTriggerMode == "Digital0"):
        Digital0Trigger = 1
    if (OscilloscopeTriggerMode == "Digital1"):
        Digital1Trigger = 1
    if (OscilloscopeTriggerMode == "Digital2"):
        Digital2Trigger = 1
    if (OscilloscopeTriggerMode == "Digital3"):
        Digital3Trigger = 1
    if (OscilloscopeTriggerMode == "Free"):
        SoftwareTrigger = 1
    if (OscilloscopeTriggerEdge == "Rising"):
        Edge = 0
    else:
        Edge = 1
    triggermode = c_int(0)
    triggermode = (OscilloscopeTriggerChannel << 8)  + (SoftwareTrigger << 7 ) + (Edge << 3) + (SoftwareTrigger << 1) + AnalogTrigger +(Digital0Trigger << 2) + (Digital1Trigger << 2) + Digital1Trigger + (Digital2Trigger << 2) + (Digital2Trigger << 1) + (Digital3Trigger << 2) + (Digital3Trigger << 1) + Digital3Trigger
    err = __abstracted_reg_write(triggermode, R76Firmware_RegisterFile.SCI_REG_Energies_CONFIG_TRIGGER_MODE, handle)
    return err

def OSCILLOSCOPE_Energies_GET_STATUS(handle):
    [err, status] = __abstracted_reg_read(R76Firmware_RegisterFile.SCI_REG_Energies_READ_STATUS, handle)
    return err, status

def OSCILLOSCOPE_Energies_GET_POSITION(handle):
    [err, position] = __abstracted_reg_read(R76Firmware_RegisterFile.SCI_REG_Energies_READ_POSITION, handle)
    return err, position

def OSCILLOSCOPE_Energies_GET_DATA(timeout_ms, handle):
    [err, data, read_data, valid_data] = __abstracted_mem_read(24576, R76Firmware_RegisterFile.SCI_REG_Energies_FIFOADDRESS, timeout_ms, handle)
    return err, data, read_data, valid_data

def OSCILLOSCOPE_Energies_RECONSTRUCT_DATA(OscilloscopeData, OscilloscopePosition, OscilloscopePreTrigger):
    OscilloscopeChannels = 24
    OscilloscopeSamples = 1024
    Analog = list(range(OscilloscopeSamples*OscilloscopeChannels))
    Digital0 = list(range(OscilloscopeSamples*OscilloscopeChannels))
    Digital1 = list(range(OscilloscopeSamples*OscilloscopeChannels))
    Digital2 = list(range(OscilloscopeSamples*OscilloscopeChannels))
    Digital3 = list(range(OscilloscopeSamples*OscilloscopeChannels))
    for n in range(OscilloscopeChannels):
        current = OscilloscopePosition - OscilloscopePreTrigger
        if ((current) > 0):
            k = 0
            for i in range(current, OscilloscopeSamples-1):
                Analog[k+ OscilloscopeSamples * n] = OscilloscopeData[i+ OscilloscopeSamples * n] & 65535
                Digital0[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 16 & 1)
                Digital1[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 17 & 1)
                Digital2[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 18 & 1)
                Digital3[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 19 & 1)
                k = k + 1
            for i in range(0, current-1):
                Analog[k+ OscilloscopeSamples * n] = OscilloscopeData[i+ OscilloscopeSamples * n] & 65535
                Digital0[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 16 & 1)
                Digital1[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 17 & 1)
                Digital2[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 18 & 1)
                Digital3[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 19 & 1)
                k = k + 1
        else:
            k = 0
            for i in range(OscilloscopeSamples+current, OscilloscopeSamples-1):
                Analog[k+ OscilloscopeSamples * n] = OscilloscopeData[i+ OscilloscopeSamples * n] & 65535
                Digital0[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 16 & 1)
                Digital1[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 17 & 1)
                Digital2[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 18 & 1)
                Digital3[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 19 & 1)
                k = k + 1
            for i in range(0, OscilloscopeSamples+current-1):
                Analog[k+ OscilloscopeSamples * n] = OscilloscopeData[i+ OscilloscopeSamples * n] & 65535
                Digital0[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 16 & 1)
                Digital1[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 17 & 1)
                Digital2[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 18 & 1)
                Digital3[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 19 & 1)
                k = k + 1
    return Analog, Digital0, Digital1,Digital2, Digital3



def OSCILLOSCOPE_Analog_In_Unflipped_START(handle):
    err = __abstracted_reg_write(0, R76Firmware_RegisterFile.SCI_REG_Analog_In_Unflipped_CONFIG_ARM, handle)
    if (err != 0):
       return False
    err = __abstracted_reg_write(1, R76Firmware_RegisterFile.SCI_REG_Analog_In_Unflipped_CONFIG_ARM, handle)
    if (err != 0):
       return False
    return True

def OSCILLOSCOPE_Analog_In_Unflipped_SET_DECIMATOR(OscilloscopeDecimator, handle):
    err = __abstracted_reg_write(OscilloscopeDecimator, R76Firmware_RegisterFile.SCI_REG_Analog_In_Unflipped_CONFIG_DECIMATOR, handle)
    return err

def OSCILLOSCOPE_Analog_In_Unflipped_SET_PRETRIGGER(OscilloscopePreTrigger, handle):
    err = __abstracted_reg_write(OscilloscopePreTrigger, R76Firmware_RegisterFile.SCI_REG_Analog_In_Unflipped_CONFIG_PRETRIGGER, handle)
    return err

def OSCILLOSCOPE_Analog_In_Unflipped_SET_TRIGGER_LEVEL(OscilloscopeTriggerLevel, handle):
    err = __abstracted_reg_write(OscilloscopeTriggerLevel, R76Firmware_RegisterFile.SCI_REG_Analog_In_Unflipped_CONFIG_TRIGGER_LEVEL, handle)
    return err

def OSCILLOSCOPE_Analog_In_Unflipped_SET_TRIGGER_MODE(OscilloscopeTriggerMode, OscilloscopeTriggerChannel, OscilloscopeTriggerEdge, handle):
    AnalogTrigger = 0
    Digital0Trigger = 0
    Digital1Trigger = 0
    Digital2Trigger = 0
    Digital3Trigger = 0
    SoftwareTrigger = 0
    if (OscilloscopeTriggerMode == "Analog"):
        AnalogTrigger = 1
    if (OscilloscopeTriggerMode == "Digital0"):
        Digital0Trigger = 1
    if (OscilloscopeTriggerMode == "Digital1"):
        Digital1Trigger = 1
    if (OscilloscopeTriggerMode == "Digital2"):
        Digital2Trigger = 1
    if (OscilloscopeTriggerMode == "Digital3"):
        Digital3Trigger = 1
    if (OscilloscopeTriggerMode == "Free"):
        SoftwareTrigger = 1
    if (OscilloscopeTriggerEdge == "Rising"):
        Edge = 0
    else:
        Edge = 1
    triggermode = c_int(0)
    triggermode = (OscilloscopeTriggerChannel << 8)  + (SoftwareTrigger << 7 ) + (Edge << 3) + (SoftwareTrigger << 1) + AnalogTrigger +(Digital0Trigger << 2) + (Digital1Trigger << 2) + Digital1Trigger + (Digital2Trigger << 2) + (Digital2Trigger << 1) + (Digital3Trigger << 2) + (Digital3Trigger << 1) + Digital3Trigger
    err = __abstracted_reg_write(triggermode, R76Firmware_RegisterFile.SCI_REG_Analog_In_Unflipped_CONFIG_TRIGGER_MODE, handle)
    return err

def OSCILLOSCOPE_Analog_In_Unflipped_GET_STATUS(handle):
    [err, status] = __abstracted_reg_read(R76Firmware_RegisterFile.SCI_REG_Analog_In_Unflipped_READ_STATUS, handle)
    return err, status

def OSCILLOSCOPE_Analog_In_Unflipped_GET_POSITION(handle):
    [err, position] = __abstracted_reg_read(R76Firmware_RegisterFile.SCI_REG_Analog_In_Unflipped_READ_POSITION, handle)
    return err, position

def OSCILLOSCOPE_Analog_In_Unflipped_GET_DATA(timeout_ms, handle):
    [err, data, read_data, valid_data] = __abstracted_mem_read(32768, R76Firmware_RegisterFile.SCI_REG_Analog_In_Unflipped_FIFOADDRESS, timeout_ms, handle)
    return err, data, read_data, valid_data

def OSCILLOSCOPE_Analog_In_Unflipped_RECONSTRUCT_DATA(OscilloscopeData, OscilloscopePosition, OscilloscopePreTrigger):
    OscilloscopeChannels = 32
    OscilloscopeSamples = 1024
    Analog = list(range(OscilloscopeSamples*OscilloscopeChannels))
    Digital0 = list(range(OscilloscopeSamples*OscilloscopeChannels))
    Digital1 = list(range(OscilloscopeSamples*OscilloscopeChannels))
    Digital2 = list(range(OscilloscopeSamples*OscilloscopeChannels))
    Digital3 = list(range(OscilloscopeSamples*OscilloscopeChannels))
    for n in range(OscilloscopeChannels):
        current = OscilloscopePosition - OscilloscopePreTrigger
        if ((current) > 0):
            k = 0
            for i in range(current, OscilloscopeSamples-1):
                Analog[k+ OscilloscopeSamples * n] = OscilloscopeData[i+ OscilloscopeSamples * n] & 65535
                k = k + 1
            for i in range(0, current-1):
                Analog[k+ OscilloscopeSamples * n] = OscilloscopeData[i+ OscilloscopeSamples * n] & 65535
                k = k + 1
        else:
            k = 0
            for i in range(OscilloscopeSamples+current, OscilloscopeSamples-1):
                Analog[k+ OscilloscopeSamples * n] = OscilloscopeData[i+ OscilloscopeSamples * n] & 65535
                k = k + 1
            for i in range(0, OscilloscopeSamples+current-1):
                Analog[k+ OscilloscopeSamples * n] = OscilloscopeData[i+ OscilloscopeSamples * n] & 65535
                k = k + 1
    return Analog, Digital0, Digital1,Digital2, Digital3




def CPACK_All_Energies_RESET(handle):
    err = __abstracted_reg_write(2, R76Firmware_RegisterFile.SCI_REG_All_Energies_CONFIG, handle)
    err = __abstracted_reg_write(0, R76Firmware_RegisterFile.SCI_REG_All_Energies_CONFIG, handle)
    return err

def CPACK_All_Energies_FLUSH(handle):
    err = __abstracted_reg_write(4, R76Firmware_RegisterFile.SCI_REG_All_Energies_CONFIG, handle)
    err = __abstracted_reg_write(0, R76Firmware_RegisterFile.SCI_REG_All_Energies_CONFIG, handle)
    return err

def CPACK_All_Energies_START(handle):
    err = __abstracted_reg_write(2, R76Firmware_RegisterFile.SCI_REG_All_Energies_CONFIG, handle)
    if (err != 0):
       return False
    err = __abstracted_reg_write(0, R76Firmware_RegisterFile.SCI_REG_All_Energies_CONFIG, handle)
    if (err != 0):
       return False
    err = __abstracted_reg_write(1, R76Firmware_RegisterFile.SCI_REG_All_Energies_CONFIG, handle)
    if (err != 0):
       return False
    return True

def CPACK_All_Energies_GET_STATUS(handle):
    [err, status] = __abstracted_reg_read(R76Firmware_RegisterFile.SCI_REG_All_Energies_READ_STATUS, handle)
    status = status & 0xf
    return err, status

def CPACK_All_Energies_GET_AVAILABLE_DATA(handle):
    [err, status] = __abstracted_reg_read(R76Firmware_RegisterFile.SCI_REG_All_Energies_READ_VALID_WORDS, handle)
    return err, status

def CPACK_All_Energies_GET_DATA(n_packet, timeout_ms, handle):
    data_length = n_packet *( 3 + <<<NUMBER OF PACKET LINES AFTER THE HEADER HERE>>>)
    [err, data, read_data, valid_data] = __abstracted_fifo_read(data_length, R76Firmware_RegisterFile.SCI_REG_All_Energies_FIFOADDRESS, R76Firmware_RegisterFile.SCI_REG_All_Energies_READ_STATUS, True, timeout_ms, handle)
    return err, data, read_data, valid_data


def CPACK_All_Energies_RECONSTRUCT_DATA(FrameData):
    in_sync = 0
    tot_data = len(FrameData)
    n_ch = <<<NUMBER OF PACKET LINES AFTER THE HEADER HERE>>>
    n_packet = tot_data / (n_ch + 3)
    event_energy, Time_Code, Pack_Id, Energy = ([] for i in range(4))
    for i in range(len(FrameData)):
        mpe = FrameData[i]
        if (in_sync == 0):
            if (mpe != 0x<<<YOUR HEADER HERE>>>):
                continue
            in_sync = 1
            continue
        if (in_sync == 1):
            event_timecode = mpe 
            Time_Code.append(event_timecode)
            in_sync = 2
            continue
        if (in_sync == 2):
            Pack_Id.append(mpe)
            in_sync = 3
            ch_index = 0
            continue
        if (in_sync == 3):
            if (mpe == 0x<<<YOUR HEADER HERE>>>):
                in_sync = 1
            else:
                ev_energy = mpe
                event_energy.append(ev_energy)
                ch_index += 1
                if (ch_index == n_ch):
                    Energy.append(event_energy)
                    event_energy = []
                    in_sync = 0
    return Time_Code, Pack_Id, Energy



def SPECTRUM_Spectrum_10_RESET(handle):
    err = __abstracted_reg_write(2, R76Firmware_RegisterFile.SCI_REG_Spectrum_10_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_10_START(handle):
    err = __abstracted_reg_write(4, R76Firmware_RegisterFile.SCI_REG_Spectrum_10_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_10_FLUSH(handle):
    err = __abstracted_reg_write(1, R76Firmware_RegisterFile.SCI_REG_Spectrum_10_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_10_STOP(handle):
    err = __abstracted_reg_write(0, R76Firmware_RegisterFile.SCI_REG_Spectrum_10_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_10_SET_PARAMETERS(Bin, AcquisitionMode, TargetValue, handle):
    rebin_value=0
    if (Bin == 8192):
        rebin_value= 1
    if (Bin == 4096):
        rebin_value= 2
    if (Bin == 2048):
        rebin_value= 3
    if (Bin == 1024):
        rebin_value= 4
    if (Bin == 512):
        rebin_value= 5
    if (Bin == 256):
        rebin_value= 6
    if (Bin == 128):
        rebin_value= 7
    err = __abstracted_reg_write(rebin_value, R76Firmware_RegisterFile.SCI_REG_Spectrum_10_CONFIG_REBIN, handle)
    acq_mode=0
    if (AcquisitionMode =="Event"):
        acq_mode=(1 << 30) + TargetValue
    if (AcquisitionMode =="Time"):
        acq_mode=(1 << 31) + TargetValue*1000
    err = __abstracted_reg_write(acq_mode, R76Firmware_RegisterFile.SCI_REG_Spectrum_10_CONFIG_LIMIT, handle)
    return err

def SPECTRUM_Spectrum_10_GET_STATUS(handle):
    [err, status] = __abstracted_reg_read(R76Firmware_RegisterFile.SCI_REG_Spectrum_10_STATUS, handle)
    return err, status

def SPECTRUM_Spectrum_10_GET_DATA(Bin, timeout_ms, handle):
    [err, data, read_data, valid_data] = __abstracted_mem_read(Bin, R76Firmware_RegisterFile.SCI_REG_Spectrum_10_FIFOADDRESS, timeout_ms, handle)
    return err, data, read_data, valid_data



def OSCILLOSCOPE_diag_START(handle):
    err = __abstracted_reg_write(0, R76Firmware_RegisterFile.SCI_REG_diag_CONFIG_ARM, handle)
    if (err != 0):
       return False
    err = __abstracted_reg_write(1, R76Firmware_RegisterFile.SCI_REG_diag_CONFIG_ARM, handle)
    if (err != 0):
       return False
    return True

def OSCILLOSCOPE_diag_SET_DECIMATOR(OscilloscopeDecimator, handle):
    err = __abstracted_reg_write(OscilloscopeDecimator, R76Firmware_RegisterFile.SCI_REG_diag_CONFIG_DECIMATOR, handle)
    return err

def OSCILLOSCOPE_diag_SET_PRETRIGGER(OscilloscopePreTrigger, handle):
    err = __abstracted_reg_write(OscilloscopePreTrigger, R76Firmware_RegisterFile.SCI_REG_diag_CONFIG_PRETRIGGER, handle)
    return err

def OSCILLOSCOPE_diag_SET_TRIGGER_LEVEL(OscilloscopeTriggerLevel, handle):
    err = __abstracted_reg_write(OscilloscopeTriggerLevel, R76Firmware_RegisterFile.SCI_REG_diag_CONFIG_TRIGGER_LEVEL, handle)
    return err

def OSCILLOSCOPE_diag_SET_TRIGGER_MODE(OscilloscopeTriggerMode, OscilloscopeTriggerChannel, OscilloscopeTriggerEdge, handle):
    AnalogTrigger = 0
    Digital0Trigger = 0
    Digital1Trigger = 0
    Digital2Trigger = 0
    Digital3Trigger = 0
    SoftwareTrigger = 0
    if (OscilloscopeTriggerMode == "Analog"):
        AnalogTrigger = 1
    if (OscilloscopeTriggerMode == "Digital0"):
        Digital0Trigger = 1
    if (OscilloscopeTriggerMode == "Digital1"):
        Digital1Trigger = 1
    if (OscilloscopeTriggerMode == "Digital2"):
        Digital2Trigger = 1
    if (OscilloscopeTriggerMode == "Digital3"):
        Digital3Trigger = 1
    if (OscilloscopeTriggerMode == "Free"):
        SoftwareTrigger = 1
    if (OscilloscopeTriggerEdge == "Rising"):
        Edge = 0
    else:
        Edge = 1
    triggermode = c_int(0)
    triggermode = (OscilloscopeTriggerChannel << 8)  + (SoftwareTrigger << 7 ) + (Edge << 3) + (SoftwareTrigger << 1) + AnalogTrigger +(Digital0Trigger << 2) + (Digital1Trigger << 2) + Digital1Trigger + (Digital2Trigger << 2) + (Digital2Trigger << 1) + (Digital3Trigger << 2) + (Digital3Trigger << 1) + Digital3Trigger
    err = __abstracted_reg_write(triggermode, R76Firmware_RegisterFile.SCI_REG_diag_CONFIG_TRIGGER_MODE, handle)
    return err

def OSCILLOSCOPE_diag_GET_STATUS(handle):
    [err, status] = __abstracted_reg_read(R76Firmware_RegisterFile.SCI_REG_diag_READ_STATUS, handle)
    return err, status

def OSCILLOSCOPE_diag_GET_POSITION(handle):
    [err, position] = __abstracted_reg_read(R76Firmware_RegisterFile.SCI_REG_diag_READ_POSITION, handle)
    return err, position

def OSCILLOSCOPE_diag_GET_DATA(timeout_ms, handle):
    [err, data, read_data, valid_data] = __abstracted_mem_read(5120, R76Firmware_RegisterFile.SCI_REG_diag_FIFOADDRESS, timeout_ms, handle)
    return err, data, read_data, valid_data

def OSCILLOSCOPE_diag_RECONSTRUCT_DATA(OscilloscopeData, OscilloscopePosition, OscilloscopePreTrigger):
    OscilloscopeChannels = 5
    OscilloscopeSamples = 1024
    Analog = list(range(OscilloscopeSamples*OscilloscopeChannels))
    Digital0 = list(range(OscilloscopeSamples*OscilloscopeChannels))
    Digital1 = list(range(OscilloscopeSamples*OscilloscopeChannels))
    Digital2 = list(range(OscilloscopeSamples*OscilloscopeChannels))
    Digital3 = list(range(OscilloscopeSamples*OscilloscopeChannels))
    for n in range(OscilloscopeChannels):
        current = OscilloscopePosition - OscilloscopePreTrigger
        if ((current) > 0):
            k = 0
            for i in range(current, OscilloscopeSamples-1):
                Analog[k+ OscilloscopeSamples * n] = OscilloscopeData[i+ OscilloscopeSamples * n] & 65535
                Digital0[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 16 & 1)
                Digital1[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 17 & 1)
                Digital2[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 18 & 1)
                Digital3[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 19 & 1)
                k = k + 1
            for i in range(0, current-1):
                Analog[k+ OscilloscopeSamples * n] = OscilloscopeData[i+ OscilloscopeSamples * n] & 65535
                Digital0[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 16 & 1)
                Digital1[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 17 & 1)
                Digital2[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 18 & 1)
                Digital3[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 19 & 1)
                k = k + 1
        else:
            k = 0
            for i in range(OscilloscopeSamples+current, OscilloscopeSamples-1):
                Analog[k+ OscilloscopeSamples * n] = OscilloscopeData[i+ OscilloscopeSamples * n] & 65535
                Digital0[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 16 & 1)
                Digital1[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 17 & 1)
                Digital2[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 18 & 1)
                Digital3[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 19 & 1)
                k = k + 1
            for i in range(0, OscilloscopeSamples+current-1):
                Analog[k+ OscilloscopeSamples * n] = OscilloscopeData[i+ OscilloscopeSamples * n] & 65535
                Digital0[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 16 & 1)
                Digital1[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 17 & 1)
                Digital2[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 18 & 1)
                Digital3[k+ OscilloscopeSamples * n] = (OscilloscopeData[i+ OscilloscopeSamples * n] >> 19 & 1)
                k = k + 1
    return Analog, Digital0, Digital1,Digital2, Digital3

