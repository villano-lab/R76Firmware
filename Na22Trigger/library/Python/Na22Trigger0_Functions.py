



import Na22Trigger0_RegisterFile
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

def REG_thrs_GET(handle):
    [err, data] = __abstracted_reg_read(Na22Trigger0_RegisterFile.SCI_REG_thrs, handle)
    return err, data

def REG_thrs_SET(data, handle):
    err = __abstracted_reg_write(data, Na22Trigger0_RegisterFile.SCI_REG_thrs, handle)
    return err

def REG_polarity_GET(handle):
    [err, data] = __abstracted_reg_read(Na22Trigger0_RegisterFile.SCI_REG_polarity, handle)
    return err, data

def REG_polarity_SET(data, handle):
    err = __abstracted_reg_write(data, Na22Trigger0_RegisterFile.SCI_REG_polarity, handle)
    return err

def REG_inhib_GET(handle):
    [err, data] = __abstracted_reg_read(Na22Trigger0_RegisterFile.SCI_REG_inhib, handle)
    return err, data

def REG_inhib_SET(data, handle):
    err = __abstracted_reg_write(data, Na22Trigger0_RegisterFile.SCI_REG_inhib, handle)
    return err

def REG_ratereset_GET(handle):
    [err, data] = __abstracted_reg_read(Na22Trigger0_RegisterFile.SCI_REG_ratereset, handle)
    return err, data

def REG_ratereset_SET(data, handle):
    err = __abstracted_reg_write(data, Na22Trigger0_RegisterFile.SCI_REG_ratereset, handle)
    return err




def RATE_METER_RateMeter_0_GET_DATA(channels, timeout_ms, handle):
    [err, data, read_data, valid_data] = __abstracted_mem_read(channels, Na22Trigger0_RegisterFile.SCI_REG_RateMeter_0_FIFOADDRESS, timeout_ms, handle)
    return err, data, read_data, valid_data




def RATE_METER_RateMeter_0_GET_DATA_COUNTS(channels, timeout_ms, handle):
    [err, data, read_data, valid_data] = __abstracted_mem_read(channels, Na22Trigger0_RegisterFile.SCI_REG_RateMeter_0_FIFOADDRESS + 512, timeout_ms, handle)
    return err, data, read_data, valid_data

