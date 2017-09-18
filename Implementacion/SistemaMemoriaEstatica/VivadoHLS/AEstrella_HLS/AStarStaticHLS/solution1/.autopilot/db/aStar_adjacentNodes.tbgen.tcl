set moduleName aStar_adjacentNodes
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set C_modelName {aStar_adjacentNodes}
set C_modelType { void 0 }
set C_modelArgList { 
	{ x int 32 regular  }
	{ y int 32 regular  }
	{ adjacentPosition_2 int 32 regular {array 8 { 0 0 } 0 1 } {global 1}  }
	{ adjacentPosition_0 int 32 regular {array 8 { 0 0 } 0 1 } {global 1}  }
	{ adjacentPosition_1 int 32 regular {array 8 { 0 0 } 0 1 } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "x", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "y", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "adjacentPosition_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "adjacentPosition_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "adjacentPosition_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 32
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ x sc_in sc_lv 32 signal 0 } 
	{ y sc_in sc_lv 32 signal 1 } 
	{ adjacentPosition_2_address0 sc_out sc_lv 3 signal 2 } 
	{ adjacentPosition_2_ce0 sc_out sc_logic 1 signal 2 } 
	{ adjacentPosition_2_we0 sc_out sc_logic 1 signal 2 } 
	{ adjacentPosition_2_d0 sc_out sc_lv 32 signal 2 } 
	{ adjacentPosition_2_address1 sc_out sc_lv 3 signal 2 } 
	{ adjacentPosition_2_ce1 sc_out sc_logic 1 signal 2 } 
	{ adjacentPosition_2_we1 sc_out sc_logic 1 signal 2 } 
	{ adjacentPosition_2_d1 sc_out sc_lv 32 signal 2 } 
	{ adjacentPosition_0_address0 sc_out sc_lv 3 signal 3 } 
	{ adjacentPosition_0_ce0 sc_out sc_logic 1 signal 3 } 
	{ adjacentPosition_0_we0 sc_out sc_logic 1 signal 3 } 
	{ adjacentPosition_0_d0 sc_out sc_lv 32 signal 3 } 
	{ adjacentPosition_0_address1 sc_out sc_lv 3 signal 3 } 
	{ adjacentPosition_0_ce1 sc_out sc_logic 1 signal 3 } 
	{ adjacentPosition_0_we1 sc_out sc_logic 1 signal 3 } 
	{ adjacentPosition_0_d1 sc_out sc_lv 32 signal 3 } 
	{ adjacentPosition_1_address0 sc_out sc_lv 3 signal 4 } 
	{ adjacentPosition_1_ce0 sc_out sc_logic 1 signal 4 } 
	{ adjacentPosition_1_we0 sc_out sc_logic 1 signal 4 } 
	{ adjacentPosition_1_d0 sc_out sc_lv 32 signal 4 } 
	{ adjacentPosition_1_address1 sc_out sc_lv 3 signal 4 } 
	{ adjacentPosition_1_ce1 sc_out sc_logic 1 signal 4 } 
	{ adjacentPosition_1_we1 sc_out sc_logic 1 signal 4 } 
	{ adjacentPosition_1_d1 sc_out sc_lv 32 signal 4 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "x", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "x", "role": "default" }} , 
 	{ "name": "y", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "y", "role": "default" }} , 
 	{ "name": "adjacentPosition_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "adjacentPosition_2", "role": "address0" }} , 
 	{ "name": "adjacentPosition_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "adjacentPosition_2", "role": "ce0" }} , 
 	{ "name": "adjacentPosition_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "adjacentPosition_2", "role": "we0" }} , 
 	{ "name": "adjacentPosition_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "adjacentPosition_2", "role": "d0" }} , 
 	{ "name": "adjacentPosition_2_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "adjacentPosition_2", "role": "address1" }} , 
 	{ "name": "adjacentPosition_2_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "adjacentPosition_2", "role": "ce1" }} , 
 	{ "name": "adjacentPosition_2_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "adjacentPosition_2", "role": "we1" }} , 
 	{ "name": "adjacentPosition_2_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "adjacentPosition_2", "role": "d1" }} , 
 	{ "name": "adjacentPosition_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "adjacentPosition_0", "role": "address0" }} , 
 	{ "name": "adjacentPosition_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "adjacentPosition_0", "role": "ce0" }} , 
 	{ "name": "adjacentPosition_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "adjacentPosition_0", "role": "we0" }} , 
 	{ "name": "adjacentPosition_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "adjacentPosition_0", "role": "d0" }} , 
 	{ "name": "adjacentPosition_0_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "adjacentPosition_0", "role": "address1" }} , 
 	{ "name": "adjacentPosition_0_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "adjacentPosition_0", "role": "ce1" }} , 
 	{ "name": "adjacentPosition_0_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "adjacentPosition_0", "role": "we1" }} , 
 	{ "name": "adjacentPosition_0_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "adjacentPosition_0", "role": "d1" }} , 
 	{ "name": "adjacentPosition_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "adjacentPosition_1", "role": "address0" }} , 
 	{ "name": "adjacentPosition_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "adjacentPosition_1", "role": "ce0" }} , 
 	{ "name": "adjacentPosition_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "adjacentPosition_1", "role": "we0" }} , 
 	{ "name": "adjacentPosition_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "adjacentPosition_1", "role": "d0" }} , 
 	{ "name": "adjacentPosition_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "adjacentPosition_1", "role": "address1" }} , 
 	{ "name": "adjacentPosition_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "adjacentPosition_1", "role": "ce1" }} , 
 	{ "name": "adjacentPosition_1_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "adjacentPosition_1", "role": "we1" }} , 
 	{ "name": "adjacentPosition_1_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "adjacentPosition_1", "role": "d1" }}  ]}
set Spec2ImplPortList { 
	x { ap_none {  { x in_data 0 32 } } }
	y { ap_none {  { y in_data 0 32 } } }
	adjacentPosition_2 { ap_memory {  { adjacentPosition_2_address0 mem_address 1 3 }  { adjacentPosition_2_ce0 mem_ce 1 1 }  { adjacentPosition_2_we0 mem_we 1 1 }  { adjacentPosition_2_d0 mem_din 1 32 }  { adjacentPosition_2_address1 mem_address 1 3 }  { adjacentPosition_2_ce1 mem_ce 1 1 }  { adjacentPosition_2_we1 mem_we 1 1 }  { adjacentPosition_2_d1 mem_din 1 32 } } }
	adjacentPosition_0 { ap_memory {  { adjacentPosition_0_address0 mem_address 1 3 }  { adjacentPosition_0_ce0 mem_ce 1 1 }  { adjacentPosition_0_we0 mem_we 1 1 }  { adjacentPosition_0_d0 mem_din 1 32 }  { adjacentPosition_0_address1 mem_address 1 3 }  { adjacentPosition_0_ce1 mem_ce 1 1 }  { adjacentPosition_0_we1 mem_we 1 1 }  { adjacentPosition_0_d1 mem_din 1 32 } } }
	adjacentPosition_1 { ap_memory {  { adjacentPosition_1_address0 mem_address 1 3 }  { adjacentPosition_1_ce0 mem_ce 1 1 }  { adjacentPosition_1_we0 mem_we 1 1 }  { adjacentPosition_1_d0 mem_din 1 32 }  { adjacentPosition_1_address1 mem_address 1 3 }  { adjacentPosition_1_ce1 mem_ce 1 1 }  { adjacentPosition_1_we1 mem_we 1 1 }  { adjacentPosition_1_d1 mem_din 1 32 } } }
}
