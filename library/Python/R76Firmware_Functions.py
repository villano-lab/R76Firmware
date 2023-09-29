
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

def REG_manual_base_GET(handle):
    [err, data] = __abstracted_reg_read(R76Firmware_RegisterFile.SCI_REG_manual_base, handle)
    return err, data

def REG_manual_base_SET(data, handle):
    err = __abstracted_reg_write(data, R76Firmware_RegisterFile.SCI_REG_manual_base, handle)
    return err

def REG_int_time_GET(handle):
    [err, data] = __abstracted_reg_read(R76Firmware_RegisterFile.SCI_REG_int_time, handle)
    return err, data

def REG_int_time_SET(data, handle):
    err = __abstracted_reg_write(data, R76Firmware_RegisterFile.SCI_REG_int_time, handle)
    return err

def REG_pre_int_GET(handle):
    [err, data] = __abstracted_reg_read(R76Firmware_RegisterFile.SCI_REG_pre_int, handle)
    return err, data

def REG_pre_int_SET(data, handle):
    err = __abstracted_reg_write(data, R76Firmware_RegisterFile.SCI_REG_pre_int, handle)
    return err

def REG_stopwrite_GET(handle):
    [err, data] = __abstracted_reg_read(R76Firmware_RegisterFile.SCI_REG_stopwrite, handle)
    return err, data

def REG_stopwrite_SET(data, handle):
    err = __abstracted_reg_write(data, R76Firmware_RegisterFile.SCI_REG_stopwrite, handle)
    return err

def REG_write_GET(handle):
    [err, data] = __abstracted_reg_read(R76Firmware_RegisterFile.SCI_REG_write, handle)
    return err, data

def REG_write_SET(data, handle):
    err = __abstracted_reg_write(data, R76Firmware_RegisterFile.SCI_REG_write, handle)
    return err

def REG_read_GET(handle):
    [err, data] = __abstracted_reg_read(R76Firmware_RegisterFile.SCI_REG_read, handle)
    return err, data

def REG_read_SET(data, handle):
    err = __abstracted_reg_write(data, R76Firmware_RegisterFile.SCI_REG_read, handle)
    return err

def REG_reset_GET(handle):
    [err, data] = __abstracted_reg_read(R76Firmware_RegisterFile.SCI_REG_reset, handle)
    return err, data

def REG_reset_SET(data, handle):
    err = __abstracted_reg_write(data, R76Firmware_RegisterFile.SCI_REG_reset, handle)
    return err

def REG_skip_GET(handle):
    [err, data] = __abstracted_reg_read(R76Firmware_RegisterFile.SCI_REG_skip, handle)
    return err, data

def REG_skip_SET(data, handle):
    err = __abstracted_reg_write(data, R76Firmware_RegisterFile.SCI_REG_skip, handle)
    return err

def REG_gate_u_GET(handle):
    [err, data] = __abstracted_reg_read(R76Firmware_RegisterFile.SCI_REG_gate_u, handle)
    return err, data

def REG_gate_u_SET(data, handle):
    err = __abstracted_reg_write(data, R76Firmware_RegisterFile.SCI_REG_gate_u, handle)
    return err

def REG_gate_l_GET(handle):
    [err, data] = __abstracted_reg_read(R76Firmware_RegisterFile.SCI_REG_gate_l, handle)
    return err, data

def REG_gate_l_SET(data, handle):
    err = __abstracted_reg_write(data, R76Firmware_RegisterFile.SCI_REG_gate_l, handle)
    return err

def REG_polarity_GET(handle):
    [err, data] = __abstracted_reg_read(R76Firmware_RegisterFile.SCI_REG_polarity, handle)
    return err, data

def REG_polarity_SET(data, handle):
    err = __abstracted_reg_write(data, R76Firmware_RegisterFile.SCI_REG_polarity, handle)
    return err

def REG_Inhib_GET(handle):
    [err, data] = __abstracted_reg_read(R76Firmware_RegisterFile.SCI_REG_Inhib, handle)
    return err, data

def REG_Inhib_SET(data, handle):
    err = __abstracted_reg_write(data, R76Firmware_RegisterFile.SCI_REG_Inhib, handle)
    return err

def REG_delay_GET(handle):
    [err, data] = __abstracted_reg_read(R76Firmware_RegisterFile.SCI_REG_delay, handle)
    return err, data

def REG_delay_SET(data, handle):
    err = __abstracted_reg_write(data, R76Firmware_RegisterFile.SCI_REG_delay, handle)
    return err

def REG_timestamp_GET(handle):
    [err, data] = __abstracted_reg_read(R76Firmware_RegisterFile.SCI_REG_timestamp, handle)
    return err, data

def REG_timestamp_SET(data, handle):
    err = __abstracted_reg_write(data, R76Firmware_RegisterFile.SCI_REG_timestamp, handle)
    return err

def REG_trigger_code_GET(handle):
    [err, data] = __abstracted_reg_read(R76Firmware_RegisterFile.SCI_REG_trigger_code, handle)
    return err, data

def REG_trigger_code_SET(data, handle):
    err = __abstracted_reg_write(data, R76Firmware_RegisterFile.SCI_REG_trigger_code, handle)
    return err

