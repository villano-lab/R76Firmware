








import killspectra_RegisterFile
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



def SPECTRUM_CH1_spectrum_RESET(handle):
    err = __abstracted_reg_write(2, killspectra_RegisterFile.SCI_REG_CH1_spectrum_CONFIG, handle)
    return err

def SPECTRUM_CH1_spectrum_START(handle):
    err = __abstracted_reg_write(4, killspectra_RegisterFile.SCI_REG_CH1_spectrum_CONFIG, handle)
    return err

def SPECTRUM_CH1_spectrum_FLUSH(handle):
    err = __abstracted_reg_write(1, killspectra_RegisterFile.SCI_REG_CH1_spectrum_CONFIG, handle)
    return err

def SPECTRUM_CH1_spectrum_STOP(handle):
    err = __abstracted_reg_write(0, killspectra_RegisterFile.SCI_REG_CH1_spectrum_CONFIG, handle)
    return err

def SPECTRUM_CH1_spectrum_SET_PARAMETERS(Bin, AcquisitionMode, TargetValue, handle):
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
    err = __abstracted_reg_write(rebin_value, killspectra_RegisterFile.SCI_REG_CH1_spectrum_CONFIG_REBIN, handle)
    acq_mode=0
    if (AcquisitionMode =="Event"):
        acq_mode=(1 << 30) + TargetValue
    if (AcquisitionMode =="Time"):
        acq_mode=(1 << 31) + TargetValue*1000
    err = __abstracted_reg_write(acq_mode, killspectra_RegisterFile.SCI_REG_CH1_spectrum_CONFIG_LIMIT, handle)
    return err

def SPECTRUM_CH1_spectrum_GET_STATUS(handle):
    [err, status] = __abstracted_reg_read(killspectra_RegisterFile.SCI_REG_CH1_spectrum_STATUS, handle)
    return err, status

def SPECTRUM_CH1_spectrum_GET_DATA(Bin, timeout_ms, handle):
    [err, data, read_data, valid_data] = __abstracted_mem_read(Bin, killspectra_RegisterFile.SCI_REG_CH1_spectrum_FIFOADDRESS, timeout_ms, handle)
    return err, data, read_data, valid_data



def SPECTRUM_CH2_spectrum_RESET(handle):
    err = __abstracted_reg_write(2, killspectra_RegisterFile.SCI_REG_CH2_spectrum_CONFIG, handle)
    return err

def SPECTRUM_CH2_spectrum_START(handle):
    err = __abstracted_reg_write(4, killspectra_RegisterFile.SCI_REG_CH2_spectrum_CONFIG, handle)
    return err

def SPECTRUM_CH2_spectrum_FLUSH(handle):
    err = __abstracted_reg_write(1, killspectra_RegisterFile.SCI_REG_CH2_spectrum_CONFIG, handle)
    return err

def SPECTRUM_CH2_spectrum_STOP(handle):
    err = __abstracted_reg_write(0, killspectra_RegisterFile.SCI_REG_CH2_spectrum_CONFIG, handle)
    return err

def SPECTRUM_CH2_spectrum_SET_PARAMETERS(Bin, AcquisitionMode, TargetValue, handle):
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
    err = __abstracted_reg_write(rebin_value, killspectra_RegisterFile.SCI_REG_CH2_spectrum_CONFIG_REBIN, handle)
    acq_mode=0
    if (AcquisitionMode =="Event"):
        acq_mode=(1 << 30) + TargetValue
    if (AcquisitionMode =="Time"):
        acq_mode=(1 << 31) + TargetValue*1000
    err = __abstracted_reg_write(acq_mode, killspectra_RegisterFile.SCI_REG_CH2_spectrum_CONFIG_LIMIT, handle)
    return err

def SPECTRUM_CH2_spectrum_GET_STATUS(handle):
    [err, status] = __abstracted_reg_read(killspectra_RegisterFile.SCI_REG_CH2_spectrum_STATUS, handle)
    return err, status

def SPECTRUM_CH2_spectrum_GET_DATA(Bin, timeout_ms, handle):
    [err, data, read_data, valid_data] = __abstracted_mem_read(Bin, killspectra_RegisterFile.SCI_REG_CH2_spectrum_FIFOADDRESS, timeout_ms, handle)
    return err, data, read_data, valid_data



def SPECTRUM_CH3_spectrum_RESET(handle):
    err = __abstracted_reg_write(2, killspectra_RegisterFile.SCI_REG_CH3_spectrum_CONFIG, handle)
    return err

def SPECTRUM_CH3_spectrum_START(handle):
    err = __abstracted_reg_write(4, killspectra_RegisterFile.SCI_REG_CH3_spectrum_CONFIG, handle)
    return err

def SPECTRUM_CH3_spectrum_FLUSH(handle):
    err = __abstracted_reg_write(1, killspectra_RegisterFile.SCI_REG_CH3_spectrum_CONFIG, handle)
    return err

def SPECTRUM_CH3_spectrum_STOP(handle):
    err = __abstracted_reg_write(0, killspectra_RegisterFile.SCI_REG_CH3_spectrum_CONFIG, handle)
    return err

def SPECTRUM_CH3_spectrum_SET_PARAMETERS(Bin, AcquisitionMode, TargetValue, handle):
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
    err = __abstracted_reg_write(rebin_value, killspectra_RegisterFile.SCI_REG_CH3_spectrum_CONFIG_REBIN, handle)
    acq_mode=0
    if (AcquisitionMode =="Event"):
        acq_mode=(1 << 30) + TargetValue
    if (AcquisitionMode =="Time"):
        acq_mode=(1 << 31) + TargetValue*1000
    err = __abstracted_reg_write(acq_mode, killspectra_RegisterFile.SCI_REG_CH3_spectrum_CONFIG_LIMIT, handle)
    return err

def SPECTRUM_CH3_spectrum_GET_STATUS(handle):
    [err, status] = __abstracted_reg_read(killspectra_RegisterFile.SCI_REG_CH3_spectrum_STATUS, handle)
    return err, status

def SPECTRUM_CH3_spectrum_GET_DATA(Bin, timeout_ms, handle):
    [err, data, read_data, valid_data] = __abstracted_mem_read(Bin, killspectra_RegisterFile.SCI_REG_CH3_spectrum_FIFOADDRESS, timeout_ms, handle)
    return err, data, read_data, valid_data



def SPECTRUM_CH4_spectrum_RESET(handle):
    err = __abstracted_reg_write(2, killspectra_RegisterFile.SCI_REG_CH4_spectrum_CONFIG, handle)
    return err

def SPECTRUM_CH4_spectrum_START(handle):
    err = __abstracted_reg_write(4, killspectra_RegisterFile.SCI_REG_CH4_spectrum_CONFIG, handle)
    return err

def SPECTRUM_CH4_spectrum_FLUSH(handle):
    err = __abstracted_reg_write(1, killspectra_RegisterFile.SCI_REG_CH4_spectrum_CONFIG, handle)
    return err

def SPECTRUM_CH4_spectrum_STOP(handle):
    err = __abstracted_reg_write(0, killspectra_RegisterFile.SCI_REG_CH4_spectrum_CONFIG, handle)
    return err

def SPECTRUM_CH4_spectrum_SET_PARAMETERS(Bin, AcquisitionMode, TargetValue, handle):
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
    err = __abstracted_reg_write(rebin_value, killspectra_RegisterFile.SCI_REG_CH4_spectrum_CONFIG_REBIN, handle)
    acq_mode=0
    if (AcquisitionMode =="Event"):
        acq_mode=(1 << 30) + TargetValue
    if (AcquisitionMode =="Time"):
        acq_mode=(1 << 31) + TargetValue*1000
    err = __abstracted_reg_write(acq_mode, killspectra_RegisterFile.SCI_REG_CH4_spectrum_CONFIG_LIMIT, handle)
    return err

def SPECTRUM_CH4_spectrum_GET_STATUS(handle):
    [err, status] = __abstracted_reg_read(killspectra_RegisterFile.SCI_REG_CH4_spectrum_STATUS, handle)
    return err, status

def SPECTRUM_CH4_spectrum_GET_DATA(Bin, timeout_ms, handle):
    [err, data, read_data, valid_data] = __abstracted_mem_read(Bin, killspectra_RegisterFile.SCI_REG_CH4_spectrum_FIFOADDRESS, timeout_ms, handle)
    return err, data, read_data, valid_data

