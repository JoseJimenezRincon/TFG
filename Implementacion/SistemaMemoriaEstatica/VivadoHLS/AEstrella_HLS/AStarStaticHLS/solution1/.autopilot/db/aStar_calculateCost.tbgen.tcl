set moduleName aStar_calculateCost
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set C_modelName {aStar_calculateCost}
set C_modelType { void 0 }
set C_modelArgList { 
	{ i int 4 regular  }
	{ position int 32 regular  }
	{ node_father int 32 regular {array 2304 { 1 3 } 1 1 } {global 0}  }
	{ node_cost int 32 regular {array 2304 { 2 3 } 1 1 } {global 2}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "i", "interface" : "wire", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "position", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "node_father", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "node_cost", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 16
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ i sc_in sc_lv 4 signal 0 } 
	{ position sc_in sc_lv 32 signal 1 } 
	{ node_father_address0 sc_out sc_lv 12 signal 2 } 
	{ node_father_ce0 sc_out sc_logic 1 signal 2 } 
	{ node_father_q0 sc_in sc_lv 32 signal 2 } 
	{ node_cost_address0 sc_out sc_lv 12 signal 3 } 
	{ node_cost_ce0 sc_out sc_logic 1 signal 3 } 
	{ node_cost_we0 sc_out sc_logic 1 signal 3 } 
	{ node_cost_d0 sc_out sc_lv 32 signal 3 } 
	{ node_cost_q0 sc_in sc_lv 32 signal 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "i", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "i", "role": "default" }} , 
 	{ "name": "position", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "position", "role": "default" }} , 
 	{ "name": "node_father_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "node_father", "role": "address0" }} , 
 	{ "name": "node_father_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "node_father", "role": "ce0" }} , 
 	{ "name": "node_father_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "node_father", "role": "q0" }} , 
 	{ "name": "node_cost_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "node_cost", "role": "address0" }} , 
 	{ "name": "node_cost_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "node_cost", "role": "ce0" }} , 
 	{ "name": "node_cost_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "node_cost", "role": "we0" }} , 
 	{ "name": "node_cost_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "node_cost", "role": "d0" }} , 
 	{ "name": "node_cost_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "node_cost", "role": "q0" }}  ]}
set Spec2ImplPortList { 
	i { ap_none {  { i in_data 0 4 } } }
	position { ap_none {  { position in_data 0 32 } } }
	node_father { ap_memory {  { node_father_address0 mem_address 1 12 }  { node_father_ce0 mem_ce 1 1 }  { node_father_q0 mem_dout 0 32 } } }
	node_cost { ap_memory {  { node_cost_address0 mem_address 1 12 }  { node_cost_ce0 mem_ce 1 1 }  { node_cost_we0 mem_we 1 1 }  { node_cost_d0 mem_din 1 32 }  { node_cost_q0 mem_dout 0 32 } } }
}
