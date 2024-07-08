set C_TypeInfoList {{ 
"data_mover" : [[], { "return": [[], "void"]} , [{"ExternC" : 0}], [ {"a": [[],{ "pointer": "0"}] }, {"stream0": [[],"1"] }, {"buffer_status": [[],{ "pointer":  {"scalar": "int"}}] }, {"buffer_ack": [[], {"scalar": "int"}] }, {"buffer_seq": [[], {"array": ["2", [2]]}] }, {"bufsize": [[], {"array": ["3", [2]]}] }, {"debug_buffer_status": [[],{ "pointer":  {"scalar": "int"}}] }, {"debug_bufsel_0": [[],{ "pointer":  {"scalar": "int"}}] }, {"debug_buf0_p": [[],{ "pointer":  {"scalar": "int"}}] }, {"debug_inbuffer_pointer": [[],{ "pointer":  {"scalar": "int"}}] }, {"debug_dst_var": [[],{ "pointer": "4"}] }, {"run": [[], {"scalar": "bool"}] }, {"fifo_resetn": [[],{ "pointer":  {"scalar": "bool"}}] }, {"DDROFFSET": [[],"5"] }, {"stat_counter": [[], {"array": ["2", [4]]}] }, {"interrupt_r": [[],{ "pointer":  {"scalar": "bool"}}] }],[],""], 
"0": [ "ram_word", {"typedef": [[[],"5"],""]}], 
"3": [ "uint32_t", {"typedef": [[[], {"scalar": "unsigned int"}],""]}], 
"4": [ "bus_word", {"typedef": [[[],"6"],""]}], 
"1": [ "stream<ap_uint<64> >", {"hls_type": {"stream": [[[[],"6"]],"7"]}}], 
"6": [ "ap_uint<64>", {"hls_type": {"ap_uint": [[[[], {"scalar": { "int": 64}}]],""]}}], 
"5": [ "ap_uint<32>", {"hls_type": {"ap_uint": [[[[], {"scalar": { "int": 32}}]],""]}}], 
"2": [ "uint64_t", {"typedef": [[[], {"scalar": "long long unsigned int"}],""]}],
"7": ["hls", ""]
}}
set moduleName data_mover
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_none
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set C_modelName {data_mover}
set C_modelType { void 0 }
set C_modelArgList {
	{ a_V int 32 regular {axi_master 1}  }
	{ stream0_V_V int 64 regular {axi_s 0 volatile  { stream0_V_V Data } }  }
	{ buffer_status int 32 regular {axi_slave 1}  }
	{ buffer_ack int 32 regular {axi_slave 0}  }
	{ buffer_seq int 64 regular {axi_slave 1}  }
	{ bufsize int 32 regular {axi_slave 1}  }
	{ debug_buffer_status int 32 regular {pointer 1}  }
	{ debug_bufsel_0 int 32 regular {pointer 1}  }
	{ debug_buf0_p int 32 regular {pointer 1}  }
	{ debug_inbuffer_pointer int 32 regular {pointer 1}  }
	{ debug_dst_var_V int 64 regular {pointer 1}  }
	{ run uint 1 regular {axi_slave 0}  }
	{ fifo_resetn int 1 regular {pointer 1}  }
	{ DDROFFSET_V int 32 regular {axi_slave 0}  }
	{ stat_counter int 64 regular {axi_slave 1}  }
	{ interrupt_r int 1 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "a_V", "interface" : "axi_master", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "a.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 31,"step" : 1}]}]}]} , 
 	{ "Name" : "stream0_V_V", "interface" : "axis", "bitwidth" : 64, "direction" : "READONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "stream0.V.V","cData": "uint64","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "buffer_status", "interface" : "axi_slave", "bundle":"axil","type":"ap_vld","bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "buffer_status","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "offset" : {"out":16}, "offset_end" : {"out":23}} , 
 	{ "Name" : "buffer_ack", "interface" : "axi_slave", "bundle":"axil","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "buffer_ack","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}], "offset" : {"in":24}, "offset_end" : {"in":31}} , 
 	{ "Name" : "buffer_seq", "interface" : "axi_slave", "bundle":"axil","type":"ap_memory","bitwidth" : 64, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "buffer_seq","cData": "long long unsigned int","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 1,"step" : 1}]}]}], "offset" : {"out":32}, "offset_end" : {"out":47}} , 
 	{ "Name" : "bufsize", "interface" : "axi_slave", "bundle":"axil","type":"ap_memory","bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "bufsize","cData": "unsigned int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 1,"step" : 1}]}]}], "offset" : {"out":48}, "offset_end" : {"out":55}} , 
 	{ "Name" : "debug_buffer_status", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "debug_buffer_status","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "debug_bufsel_0", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "debug_bufsel_0","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "debug_buf0_p", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "debug_buf0_p","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "debug_inbuffer_pointer", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "debug_inbuffer_pointer","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "debug_dst_var_V", "interface" : "wire", "bitwidth" : 64, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "debug_dst_var.V","cData": "uint64","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "run", "interface" : "axi_slave", "bundle":"axil","type":"ap_none","bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "run","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}], "offset" : {"in":56}, "offset_end" : {"in":63}} , 
 	{ "Name" : "fifo_resetn", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "fifo_resetn","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "DDROFFSET_V", "interface" : "axi_slave", "bundle":"axil","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "DDROFFSET.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}], "offset" : {"in":64}, "offset_end" : {"in":71}} , 
 	{ "Name" : "stat_counter", "interface" : "axi_slave", "bundle":"axil","type":"ap_memory","bitwidth" : 64, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "stat_counter","cData": "long long unsigned int","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 3,"step" : 1}]}]}], "offset" : {"out":96}, "offset_end" : {"out":127}} , 
 	{ "Name" : "interrupt_r", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "interrupt_r","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} ]}
# RTL Port declarations: 
set portNum 80
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ m_axi_a_V_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_a_V_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_a_V_AWADDR sc_out sc_lv 32 signal 0 } 
	{ m_axi_a_V_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_a_V_AWLEN sc_out sc_lv 8 signal 0 } 
	{ m_axi_a_V_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_a_V_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_a_V_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_a_V_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_a_V_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_a_V_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_a_V_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_a_V_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_a_V_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_a_V_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_a_V_WDATA sc_out sc_lv 32 signal 0 } 
	{ m_axi_a_V_WSTRB sc_out sc_lv 4 signal 0 } 
	{ m_axi_a_V_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_a_V_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_a_V_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_a_V_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_a_V_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_a_V_ARADDR sc_out sc_lv 32 signal 0 } 
	{ m_axi_a_V_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_a_V_ARLEN sc_out sc_lv 8 signal 0 } 
	{ m_axi_a_V_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_a_V_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_a_V_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_a_V_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_a_V_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_a_V_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_a_V_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_a_V_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_a_V_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_a_V_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_a_V_RDATA sc_in sc_lv 32 signal 0 } 
	{ m_axi_a_V_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_a_V_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_a_V_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_a_V_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_a_V_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_a_V_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_a_V_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_a_V_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_a_V_BUSER sc_in sc_lv 1 signal 0 } 
	{ stream0_V_V_TDATA sc_in sc_lv 64 signal 1 } 
	{ stream0_V_V_TVALID sc_in sc_logic 1 invld 1 } 
	{ stream0_V_V_TREADY sc_out sc_logic 1 inacc 1 } 
	{ debug_buffer_status sc_out sc_lv 32 signal 6 } 
	{ debug_buffer_status_ap_vld sc_out sc_logic 1 outvld 6 } 
	{ debug_bufsel_0 sc_out sc_lv 32 signal 7 } 
	{ debug_bufsel_0_ap_vld sc_out sc_logic 1 outvld 7 } 
	{ debug_buf0_p sc_out sc_lv 32 signal 8 } 
	{ debug_buf0_p_ap_vld sc_out sc_logic 1 outvld 8 } 
	{ debug_inbuffer_pointer sc_out sc_lv 32 signal 9 } 
	{ debug_inbuffer_pointer_ap_vld sc_out sc_logic 1 outvld 9 } 
	{ debug_dst_var_V sc_out sc_lv 64 signal 10 } 
	{ debug_dst_var_V_ap_vld sc_out sc_logic 1 outvld 10 } 
	{ fifo_resetn sc_out sc_logic 1 signal 12 } 
	{ interrupt_r sc_out sc_logic 1 signal 15 } 
	{ interrupt_r_ap_vld sc_out sc_logic 1 outvld 15 } 
	{ s_axi_axil_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_axil_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_axil_AWADDR sc_in sc_lv 7 signal -1 } 
	{ s_axi_axil_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_axil_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_axil_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_axil_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_axil_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_axil_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_axil_ARADDR sc_in sc_lv 7 signal -1 } 
	{ s_axi_axil_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_axil_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_axil_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_axil_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_axil_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_axil_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_axil_BRESP sc_out sc_lv 2 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_axil_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "axil", "role": "AWADDR" },"address":[{"name":"buffer_ack","role":"data","value":"24"},{"name":"run","role":"data","value":"56"},{"name":"DDROFFSET_V","role":"data","value":"64"}] },
	{ "name": "s_axi_axil_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "axil", "role": "AWVALID" } },
	{ "name": "s_axi_axil_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "axil", "role": "AWREADY" } },
	{ "name": "s_axi_axil_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "axil", "role": "WVALID" } },
	{ "name": "s_axi_axil_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "axil", "role": "WREADY" } },
	{ "name": "s_axi_axil_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "axil", "role": "WDATA" } },
	{ "name": "s_axi_axil_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "axil", "role": "WSTRB" } },
	{ "name": "s_axi_axil_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "axil", "role": "ARADDR" },"address":[{"name":"buffer_status","role":"data","value":"16"}, {"name":"buffer_status","role":"valid","value":"20","valid_bit":"0"},{"name":"buffer_seq","role":"data","value":"32"},{"name":"bufsize","role":"data","value":"48"},{"name":"stat_counter","role":"data","value":"96"}] },
	{ "name": "s_axi_axil_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "axil", "role": "ARVALID" } },
	{ "name": "s_axi_axil_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "axil", "role": "ARREADY" } },
	{ "name": "s_axi_axil_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "axil", "role": "RVALID" } },
	{ "name": "s_axi_axil_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "axil", "role": "RREADY" } },
	{ "name": "s_axi_axil_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "axil", "role": "RDATA" } },
	{ "name": "s_axi_axil_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "axil", "role": "RRESP" } },
	{ "name": "s_axi_axil_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "axil", "role": "BVALID" } },
	{ "name": "s_axi_axil_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "axil", "role": "BREADY" } },
	{ "name": "s_axi_axil_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "axil", "role": "BRESP" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "m_axi_a_V_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a_V", "role": "AWVALID" }} , 
 	{ "name": "m_axi_a_V_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a_V", "role": "AWREADY" }} , 
 	{ "name": "m_axi_a_V_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "a_V", "role": "AWADDR" }} , 
 	{ "name": "m_axi_a_V_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "a_V", "role": "AWID" }} , 
 	{ "name": "m_axi_a_V_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "a_V", "role": "AWLEN" }} , 
 	{ "name": "m_axi_a_V_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "a_V", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_a_V_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "a_V", "role": "AWBURST" }} , 
 	{ "name": "m_axi_a_V_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "a_V", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_a_V_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "a_V", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_a_V_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "a_V", "role": "AWPROT" }} , 
 	{ "name": "m_axi_a_V_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "a_V", "role": "AWQOS" }} , 
 	{ "name": "m_axi_a_V_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "a_V", "role": "AWREGION" }} , 
 	{ "name": "m_axi_a_V_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "a_V", "role": "AWUSER" }} , 
 	{ "name": "m_axi_a_V_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a_V", "role": "WVALID" }} , 
 	{ "name": "m_axi_a_V_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a_V", "role": "WREADY" }} , 
 	{ "name": "m_axi_a_V_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "a_V", "role": "WDATA" }} , 
 	{ "name": "m_axi_a_V_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "a_V", "role": "WSTRB" }} , 
 	{ "name": "m_axi_a_V_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a_V", "role": "WLAST" }} , 
 	{ "name": "m_axi_a_V_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "a_V", "role": "WID" }} , 
 	{ "name": "m_axi_a_V_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "a_V", "role": "WUSER" }} , 
 	{ "name": "m_axi_a_V_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a_V", "role": "ARVALID" }} , 
 	{ "name": "m_axi_a_V_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a_V", "role": "ARREADY" }} , 
 	{ "name": "m_axi_a_V_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "a_V", "role": "ARADDR" }} , 
 	{ "name": "m_axi_a_V_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "a_V", "role": "ARID" }} , 
 	{ "name": "m_axi_a_V_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "a_V", "role": "ARLEN" }} , 
 	{ "name": "m_axi_a_V_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "a_V", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_a_V_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "a_V", "role": "ARBURST" }} , 
 	{ "name": "m_axi_a_V_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "a_V", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_a_V_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "a_V", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_a_V_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "a_V", "role": "ARPROT" }} , 
 	{ "name": "m_axi_a_V_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "a_V", "role": "ARQOS" }} , 
 	{ "name": "m_axi_a_V_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "a_V", "role": "ARREGION" }} , 
 	{ "name": "m_axi_a_V_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "a_V", "role": "ARUSER" }} , 
 	{ "name": "m_axi_a_V_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a_V", "role": "RVALID" }} , 
 	{ "name": "m_axi_a_V_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a_V", "role": "RREADY" }} , 
 	{ "name": "m_axi_a_V_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "a_V", "role": "RDATA" }} , 
 	{ "name": "m_axi_a_V_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a_V", "role": "RLAST" }} , 
 	{ "name": "m_axi_a_V_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "a_V", "role": "RID" }} , 
 	{ "name": "m_axi_a_V_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "a_V", "role": "RUSER" }} , 
 	{ "name": "m_axi_a_V_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "a_V", "role": "RRESP" }} , 
 	{ "name": "m_axi_a_V_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a_V", "role": "BVALID" }} , 
 	{ "name": "m_axi_a_V_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a_V", "role": "BREADY" }} , 
 	{ "name": "m_axi_a_V_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "a_V", "role": "BRESP" }} , 
 	{ "name": "m_axi_a_V_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "a_V", "role": "BID" }} , 
 	{ "name": "m_axi_a_V_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "a_V", "role": "BUSER" }} , 
 	{ "name": "stream0_V_V_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "stream0_V_V", "role": "TDATA" }} , 
 	{ "name": "stream0_V_V_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "stream0_V_V", "role": "TVALID" }} , 
 	{ "name": "stream0_V_V_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "stream0_V_V", "role": "TREADY" }} , 
 	{ "name": "debug_buffer_status", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "debug_buffer_status", "role": "default" }} , 
 	{ "name": "debug_buffer_status_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "debug_buffer_status", "role": "ap_vld" }} , 
 	{ "name": "debug_bufsel_0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "debug_bufsel_0", "role": "default" }} , 
 	{ "name": "debug_bufsel_0_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "debug_bufsel_0", "role": "ap_vld" }} , 
 	{ "name": "debug_buf0_p", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "debug_buf0_p", "role": "default" }} , 
 	{ "name": "debug_buf0_p_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "debug_buf0_p", "role": "ap_vld" }} , 
 	{ "name": "debug_inbuffer_pointer", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "debug_inbuffer_pointer", "role": "default" }} , 
 	{ "name": "debug_inbuffer_pointer_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "debug_inbuffer_pointer", "role": "ap_vld" }} , 
 	{ "name": "debug_dst_var_V", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "debug_dst_var_V", "role": "default" }} , 
 	{ "name": "debug_dst_var_V_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "debug_dst_var_V", "role": "ap_vld" }} , 
 	{ "name": "fifo_resetn", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifo_resetn", "role": "default" }} , 
 	{ "name": "interrupt_r", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "interrupt_r", "role": "default" }} , 
 	{ "name": "interrupt_r_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "interrupt_r", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3"],
		"CDFG" : "data_mover",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0",
		"FunctionPipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"VariableLatency" : "1",
		"Port" : [
			{"Name" : "a_V", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "a_V_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "a_V_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "a_V_blk_n_B", "Type" : "RtlSignal"}]},
			{"Name" : "stream0_V_V", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "stream0_V_V_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "buffer_status", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "buffer_ack", "Type" : "None", "Direction" : "I"},
			{"Name" : "buffer_seq", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "bufsize", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "debug_buffer_status", "Type" : "OVld", "Direction" : "O"},
			{"Name" : "debug_bufsel_0", "Type" : "OVld", "Direction" : "O"},
			{"Name" : "debug_buf0_p", "Type" : "OVld", "Direction" : "O"},
			{"Name" : "debug_inbuffer_pointer", "Type" : "OVld", "Direction" : "O"},
			{"Name" : "debug_dst_var_V", "Type" : "OVld", "Direction" : "O"},
			{"Name" : "run", "Type" : "None", "Direction" : "I"},
			{"Name" : "fifo_resetn", "Type" : "None", "Direction" : "O"},
			{"Name" : "DDROFFSET_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "stat_counter", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "interrupt_r", "Type" : "OVld", "Direction" : "O"},
			{"Name" : "bufstatus_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "bufstatus_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "inbuffer_pointer", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "out_counter", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lost_counter", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "buftimeout", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "bufsel", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "swap_timeout", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "buf_p", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "inbuffer_V", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "bsc", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "bsq_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "bsq_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "obuffer_ack", "Type" : "OVld", "Direction" : "IO"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.inbuffer_V_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.data_mover_axil_s_axi_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.data_mover_a_V_m_axi_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	data_mover {
		a_V {Type O LastRead 4 FirstWrite 5}
		stream0_V_V {Type I LastRead 0 FirstWrite -1}
		buffer_status {Type O LastRead -1 FirstWrite 1}
		buffer_ack {Type I LastRead 0 FirstWrite -1}
		buffer_seq {Type O LastRead -1 FirstWrite 0}
		bufsize {Type O LastRead -1 FirstWrite 0}
		debug_buffer_status {Type O LastRead -1 FirstWrite 10}
		debug_bufsel_0 {Type O LastRead -1 FirstWrite 10}
		debug_buf0_p {Type O LastRead -1 FirstWrite 10}
		debug_inbuffer_pointer {Type O LastRead -1 FirstWrite 0}
		debug_dst_var_V {Type O LastRead -1 FirstWrite 0}
		run {Type I LastRead 0 FirstWrite -1}
		fifo_resetn {Type O LastRead -1 FirstWrite 13}
		DDROFFSET_V {Type I LastRead 0 FirstWrite -1}
		stat_counter {Type O LastRead -1 FirstWrite 10}
		interrupt_r {Type O LastRead -1 FirstWrite 1}
		bufstatus_0 {Type IO LastRead -1 FirstWrite -1}
		bufstatus_1 {Type IO LastRead -1 FirstWrite -1}
		inbuffer_pointer {Type IO LastRead -1 FirstWrite -1}
		out_counter {Type IO LastRead -1 FirstWrite -1}
		lost_counter {Type IO LastRead -1 FirstWrite -1}
		buftimeout {Type IO LastRead -1 FirstWrite -1}
		bufsel {Type IO LastRead -1 FirstWrite -1}
		swap_timeout {Type IO LastRead -1 FirstWrite -1}
		buf_p {Type IO LastRead -1 FirstWrite -1}
		inbuffer_V {Type IO LastRead -1 FirstWrite -1}
		bsc {Type IO LastRead -1 FirstWrite -1}
		bsq_0 {Type IO LastRead -1 FirstWrite -1}
		bsq_1 {Type IO LastRead -1 FirstWrite -1}
		obuffer_ack {Type IO LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "4110"}
	, {"Name" : "Interval", "Min" : "3", "Max" : "4111"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	a_V { m_axi {  { m_axi_a_V_AWVALID VALID 1 1 }  { m_axi_a_V_AWREADY READY 0 1 }  { m_axi_a_V_AWADDR ADDR 1 32 }  { m_axi_a_V_AWID ID 1 1 }  { m_axi_a_V_AWLEN LEN 1 8 }  { m_axi_a_V_AWSIZE SIZE 1 3 }  { m_axi_a_V_AWBURST BURST 1 2 }  { m_axi_a_V_AWLOCK LOCK 1 2 }  { m_axi_a_V_AWCACHE CACHE 1 4 }  { m_axi_a_V_AWPROT PROT 1 3 }  { m_axi_a_V_AWQOS QOS 1 4 }  { m_axi_a_V_AWREGION REGION 1 4 }  { m_axi_a_V_AWUSER USER 1 1 }  { m_axi_a_V_WVALID VALID 1 1 }  { m_axi_a_V_WREADY READY 0 1 }  { m_axi_a_V_WDATA DATA 1 32 }  { m_axi_a_V_WSTRB STRB 1 4 }  { m_axi_a_V_WLAST LAST 1 1 }  { m_axi_a_V_WID ID 1 1 }  { m_axi_a_V_WUSER USER 1 1 }  { m_axi_a_V_ARVALID VALID 1 1 }  { m_axi_a_V_ARREADY READY 0 1 }  { m_axi_a_V_ARADDR ADDR 1 32 }  { m_axi_a_V_ARID ID 1 1 }  { m_axi_a_V_ARLEN LEN 1 8 }  { m_axi_a_V_ARSIZE SIZE 1 3 }  { m_axi_a_V_ARBURST BURST 1 2 }  { m_axi_a_V_ARLOCK LOCK 1 2 }  { m_axi_a_V_ARCACHE CACHE 1 4 }  { m_axi_a_V_ARPROT PROT 1 3 }  { m_axi_a_V_ARQOS QOS 1 4 }  { m_axi_a_V_ARREGION REGION 1 4 }  { m_axi_a_V_ARUSER USER 1 1 }  { m_axi_a_V_RVALID VALID 0 1 }  { m_axi_a_V_RREADY READY 1 1 }  { m_axi_a_V_RDATA DATA 0 32 }  { m_axi_a_V_RLAST LAST 0 1 }  { m_axi_a_V_RID ID 0 1 }  { m_axi_a_V_RUSER USER 0 1 }  { m_axi_a_V_RRESP RESP 0 2 }  { m_axi_a_V_BVALID VALID 0 1 }  { m_axi_a_V_BREADY READY 1 1 }  { m_axi_a_V_BRESP RESP 0 2 }  { m_axi_a_V_BID ID 0 1 }  { m_axi_a_V_BUSER USER 0 1 } } }
	stream0_V_V { axis {  { stream0_V_V_TDATA in_data 0 64 }  { stream0_V_V_TVALID in_vld 0 1 }  { stream0_V_V_TREADY in_acc 1 1 } } }
	debug_buffer_status { ap_ovld {  { debug_buffer_status out_data 1 32 }  { debug_buffer_status_ap_vld out_vld 1 1 } } }
	debug_bufsel_0 { ap_ovld {  { debug_bufsel_0 out_data 1 32 }  { debug_bufsel_0_ap_vld out_vld 1 1 } } }
	debug_buf0_p { ap_ovld {  { debug_buf0_p out_data 1 32 }  { debug_buf0_p_ap_vld out_vld 1 1 } } }
	debug_inbuffer_pointer { ap_ovld {  { debug_inbuffer_pointer out_data 1 32 }  { debug_inbuffer_pointer_ap_vld out_vld 1 1 } } }
	debug_dst_var_V { ap_ovld {  { debug_dst_var_V out_data 1 64 }  { debug_dst_var_V_ap_vld out_vld 1 1 } } }
	fifo_resetn { ap_none {  { fifo_resetn out_data 1 1 } } }
	interrupt_r { ap_ovld {  { interrupt_r out_data 1 1 }  { interrupt_r_ap_vld out_vld 1 1 } } }
}

set busDeadlockParameterList { 
	{ a_V { NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 } } \
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
	{ a_V 1 }
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
	{ a_V 1 }
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
