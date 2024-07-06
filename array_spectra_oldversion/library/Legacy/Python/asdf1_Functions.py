




import asdf1_RegisterFile
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

def REG_pol_GET(handle):
    [err, data] = __abstracted_reg_read(asdf1_RegisterFile.SCI_REG_pol, handle)
    return err, data

def REG_pol_SET(data, handle):
    err = __abstracted_reg_write(data, asdf1_RegisterFile.SCI_REG_pol, handle)
    return err

def REG_hithrs_GET(handle):
    [err, data] = __abstracted_reg_read(asdf1_RegisterFile.SCI_REG_hithrs, handle)
    return err, data

def REG_hithrs_SET(data, handle):
    err = __abstracted_reg_write(data, asdf1_RegisterFile.SCI_REG_hithrs, handle)
    return err

def REG_lothrsh_GET(handle):
    [err, data] = __abstracted_reg_read(asdf1_RegisterFile.SCI_REG_lothrsh, handle)
    return err, data

def REG_lothrsh_SET(data, handle):
    err = __abstracted_reg_write(data, asdf1_RegisterFile.SCI_REG_lothrsh, handle)
    return err

def REG_inhib_GET(handle):
    [err, data] = __abstracted_reg_read(asdf1_RegisterFile.SCI_REG_inhib, handle)
    return err, data

def REG_inhib_SET(data, handle):
    err = __abstracted_reg_write(data, asdf1_RegisterFile.SCI_REG_inhib, handle)
    return err

def REG_gatel_GET(handle):
    [err, data] = __abstracted_reg_read(asdf1_RegisterFile.SCI_REG_gatel, handle)
    return err, data

def REG_gatel_SET(data, handle):
    err = __abstracted_reg_write(data, asdf1_RegisterFile.SCI_REG_gatel, handle)
    return err

def REG_gateu_GET(handle):
    [err, data] = __abstracted_reg_read(asdf1_RegisterFile.SCI_REG_gateu, handle)
    return err, data

def REG_gateu_SET(data, handle):
    err = __abstracted_reg_write(data, asdf1_RegisterFile.SCI_REG_gateu, handle)
    return err

def REG_delay_GET(handle):
    [err, data] = __abstracted_reg_read(asdf1_RegisterFile.SCI_REG_delay, handle)
    return err, data

def REG_delay_SET(data, handle):
    err = __abstracted_reg_write(data, asdf1_RegisterFile.SCI_REG_delay, handle)
    return err

def REG_xdelay_GET(handle):
    [err, data] = __abstracted_reg_read(asdf1_RegisterFile.SCI_REG_xdelay, handle)
    return err, data

def REG_xdelay_SET(data, handle):
    err = __abstracted_reg_write(data, asdf1_RegisterFile.SCI_REG_xdelay, handle)
    return err

def REG_inttime_GET(handle):
    [err, data] = __abstracted_reg_read(asdf1_RegisterFile.SCI_REG_inttime, handle)
    return err, data

def REG_inttime_SET(data, handle):
    err = __abstracted_reg_write(data, asdf1_RegisterFile.SCI_REG_inttime, handle)
    return err

def REG_preint_GET(handle):
    [err, data] = __abstracted_reg_read(asdf1_RegisterFile.SCI_REG_preint, handle)
    return err, data

def REG_preint_SET(data, handle):
    err = __abstracted_reg_write(data, asdf1_RegisterFile.SCI_REG_preint, handle)
    return err

def REG_pileup_GET(handle):
    [err, data] = __abstracted_reg_read(asdf1_RegisterFile.SCI_REG_pileup, handle)
    return err, data

def REG_pileup_SET(data, handle):
    err = __abstracted_reg_write(data, asdf1_RegisterFile.SCI_REG_pileup, handle)
    return err

def REG_gain_GET(handle):
    [err, data] = __abstracted_reg_read(asdf1_RegisterFile.SCI_REG_gain, handle)
    return err, data

def REG_gain_SET(data, handle):
    err = __abstracted_reg_write(data, asdf1_RegisterFile.SCI_REG_gain, handle)
    return err

def REG_ofs_GET(handle):
    [err, data] = __abstracted_reg_read(asdf1_RegisterFile.SCI_REG_ofs, handle)
    return err, data

def REG_ofs_SET(data, handle):
    err = __abstracted_reg_write(data, asdf1_RegisterFile.SCI_REG_ofs, handle)
    return err

def REG_bl_GET(handle):
    [err, data] = __abstracted_reg_read(asdf1_RegisterFile.SCI_REG_bl, handle)
    return err, data

def REG_bl_SET(data, handle):
    err = __abstracted_reg_write(data, asdf1_RegisterFile.SCI_REG_bl, handle)
    return err

def REG_CH_GET(handle):
    [err, data] = __abstracted_reg_read(asdf1_RegisterFile.SCI_REG_CH, handle)
    return err, data

def REG_CH_SET(data, handle):
    err = __abstracted_reg_write(data, asdf1_RegisterFile.SCI_REG_CH, handle)
    return err



def SPECTRUM_Spectrum_0_RESET(handle):
    err = __abstracted_reg_write(2, asdf1_RegisterFile.SCI_REG_Spectrum_0_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_0_START(handle):
    err = __abstracted_reg_write(4, asdf1_RegisterFile.SCI_REG_Spectrum_0_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_0_FLUSH(handle):
    err = __abstracted_reg_write(1, asdf1_RegisterFile.SCI_REG_Spectrum_0_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_0_STOP(handle):
    err = __abstracted_reg_write(0, asdf1_RegisterFile.SCI_REG_Spectrum_0_CONFIG, handle)
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
    err = __abstracted_reg_write(rebin_value, asdf1_RegisterFile.SCI_REG_Spectrum_0_CONFIG_REBIN, handle)
    acq_mode=0
    if (AcquisitionMode =="Event"):
        acq_mode=(1 << 30) + TargetValue
    if (AcquisitionMode =="Time"):
        acq_mode=(1 << 31) + TargetValue*1000
    err = __abstracted_reg_write(acq_mode, asdf1_RegisterFile.SCI_REG_Spectrum_0_CONFIG_LIMIT, handle)
    return err

def SPECTRUM_Spectrum_0_GET_STATUS(handle):
    [err, status] = __abstracted_reg_read(asdf1_RegisterFile.SCI_REG_Spectrum_0_STATUS, handle)
    return err, status

def SPECTRUM_Spectrum_0_GET_DATA(Bin, timeout_ms, handle):
    [err, data, read_data, valid_data] = __abstracted_mem_read(Bin, asdf1_RegisterFile.SCI_REG_Spectrum_0_FIFOADDRESS, timeout_ms, handle)
    return err, data, read_data, valid_data



def SPECTRUM_Spectrum_1_RESET(handle):
    err = __abstracted_reg_write(2, asdf1_RegisterFile.SCI_REG_Spectrum_1_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_1_START(handle):
    err = __abstracted_reg_write(4, asdf1_RegisterFile.SCI_REG_Spectrum_1_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_1_FLUSH(handle):
    err = __abstracted_reg_write(1, asdf1_RegisterFile.SCI_REG_Spectrum_1_CONFIG, handle)
    return err

def SPECTRUM_Spectrum_1_STOP(handle):
    err = __abstracted_reg_write(0, asdf1_RegisterFile.SCI_REG_Spectrum_1_CONFIG, handle)
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
    err = __abstracted_reg_write(rebin_value, asdf1_RegisterFile.SCI_REG_Spectrum_1_CONFIG_REBIN, handle)
    acq_mode=0
    if (AcquisitionMode =="Event"):
        acq_mode=(1 << 30) + TargetValue
    if (AcquisitionMode =="Time"):
        acq_mode=(1 << 31) + TargetValue*1000
    err = __abstracted_reg_write(acq_mode, asdf1_RegisterFile.SCI_REG_Spectrum_1_CONFIG_LIMIT, handle)
    return err

def SPECTRUM_Spectrum_1_GET_STATUS(handle):
    [err, status] = __abstracted_reg_read(asdf1_RegisterFile.SCI_REG_Spectrum_1_STATUS, handle)
    return err, status

def SPECTRUM_Spectrum_1_GET_DATA(Bin, timeout_ms, handle):
    [err, data, read_data, valid_data] = __abstracted_mem_read(Bin, asdf1_RegisterFile.SCI_REG_Spectrum_1_FIFOADDRESS, timeout_ms, handle)
    return err, data, read_data, valid_data

