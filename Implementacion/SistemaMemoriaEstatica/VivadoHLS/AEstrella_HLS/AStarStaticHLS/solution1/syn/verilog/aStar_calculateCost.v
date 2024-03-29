// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2015.4
// Copyright (C) 2015 Xilinx Inc. All rights reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module aStar_calculateCost (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        i,
        position,
        node_father_address0,
        node_father_ce0,
        node_father_q0,
        node_cost_address0,
        node_cost_ce0,
        node_cost_we0,
        node_cost_d0,
        node_cost_q0
);

parameter    ap_const_logic_1 = 1'b1;
parameter    ap_const_logic_0 = 1'b0;
parameter    ap_ST_st1_fsm_0 = 5'b1;
parameter    ap_ST_st2_fsm_1 = 5'b10;
parameter    ap_ST_st3_fsm_2 = 5'b100;
parameter    ap_ST_st4_fsm_3 = 5'b1000;
parameter    ap_ST_st5_fsm_4 = 5'b10000;
parameter    ap_const_lv32_0 = 32'b00000000000000000000000000000000;
parameter    ap_const_lv1_1 = 1'b1;
parameter    ap_const_lv32_1 = 32'b1;
parameter    ap_const_lv32_2 = 32'b10;
parameter    ap_const_lv1_0 = 1'b0;
parameter    ap_const_lv32_3 = 32'b11;
parameter    ap_const_lv32_4 = 32'b100;
parameter    ap_const_lv2_1 = 2'b1;
parameter    ap_const_lv32_A = 32'b1010;
parameter    ap_const_lv32_E = 32'b1110;
parameter    ap_true = 1'b1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [3:0] i;
input  [31:0] position;
output  [11:0] node_father_address0;
output   node_father_ce0;
input  [31:0] node_father_q0;
output  [11:0] node_cost_address0;
output   node_cost_ce0;
output   node_cost_we0;
output  [31:0] node_cost_d0;
input  [31:0] node_cost_q0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg node_father_ce0;
reg[11:0] node_cost_address0;
reg node_cost_ce0;
reg node_cost_we0;
reg[31:0] node_cost_d0;
(* fsm_encoding = "none" *) reg   [4:0] ap_CS_fsm = 5'b1;
reg    ap_sig_cseq_ST_st1_fsm_0;
reg    ap_sig_bdd_23;
wire  signed [63:0] tmp_s_fu_78_p1;
reg  signed [63:0] tmp_s_reg_122;
reg    ap_sig_cseq_ST_st2_fsm_1;
reg    ap_sig_bdd_58;
wire   [0:0] icmp_fu_98_p2;
reg   [0:0] icmp_reg_138;
reg    ap_sig_cseq_ST_st3_fsm_2;
reg    ap_sig_bdd_67;
reg   [31:0] node_cost_load_reg_142;
reg   [11:0] node_cost_addr_2_reg_147;
wire   [31:0] tmp_7_fu_117_p2;
reg   [31:0] tmp_7_reg_152;
reg    ap_sig_cseq_ST_st4_fsm_3;
reg    ap_sig_bdd_83;
wire  signed [63:0] tmp_2_fu_83_p1;
wire   [11:0] node_cost_addr_1_gep_fu_62_p3;
wire   [31:0] tmp_3_fu_104_p2;
reg    ap_sig_cseq_ST_st5_fsm_4;
reg    ap_sig_bdd_97;
wire   [1:0] tmp_fu_88_p4;
wire   [31:0] tmp1_fu_111_p2;
reg   [4:0] ap_NS_fsm;




always @ (posedge ap_clk) begin : ap_ret_ap_CS_fsm
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_st1_fsm_0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st3_fsm_2)) begin
        icmp_reg_138 <= icmp_fu_98_p2;
        node_cost_load_reg_142 <= node_cost_q0;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st3_fsm_2) & ~(icmp_fu_98_p2 == ap_const_lv1_0))) begin
        node_cost_addr_2_reg_147 <= tmp_s_reg_122;
    end
end

always @ (posedge ap_clk) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st4_fsm_3)) begin
        tmp_7_reg_152 <= tmp_7_fu_117_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0) & ~(ap_start == ap_const_logic_0))) begin
        tmp_s_reg_122 <= tmp_s_fu_78_p1;
    end
end

always @ (ap_start or ap_sig_cseq_ST_st1_fsm_0 or ap_sig_cseq_ST_st5_fsm_4) begin
    if (((~(ap_const_logic_1 == ap_start) & (ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0)) | (ap_const_logic_1 == ap_sig_cseq_ST_st5_fsm_4))) begin
        ap_done = ap_const_logic_1;
    end else begin
        ap_done = ap_const_logic_0;
    end
end

always @ (ap_start or ap_sig_cseq_ST_st1_fsm_0) begin
    if ((~(ap_const_logic_1 == ap_start) & (ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0))) begin
        ap_idle = ap_const_logic_1;
    end else begin
        ap_idle = ap_const_logic_0;
    end
end

always @ (ap_sig_cseq_ST_st5_fsm_4) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st5_fsm_4)) begin
        ap_ready = ap_const_logic_1;
    end else begin
        ap_ready = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_23) begin
    if (ap_sig_bdd_23) begin
        ap_sig_cseq_ST_st1_fsm_0 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st1_fsm_0 = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_58) begin
    if (ap_sig_bdd_58) begin
        ap_sig_cseq_ST_st2_fsm_1 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st2_fsm_1 = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_67) begin
    if (ap_sig_bdd_67) begin
        ap_sig_cseq_ST_st3_fsm_2 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st3_fsm_2 = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_83) begin
    if (ap_sig_bdd_83) begin
        ap_sig_cseq_ST_st4_fsm_3 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st4_fsm_3 = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_97) begin
    if (ap_sig_bdd_97) begin
        ap_sig_cseq_ST_st5_fsm_4 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st5_fsm_4 = ap_const_logic_0;
    end
end

always @ (tmp_s_reg_122 or ap_sig_cseq_ST_st2_fsm_1 or icmp_fu_98_p2 or ap_sig_cseq_ST_st3_fsm_2 or node_cost_addr_2_reg_147 or tmp_2_fu_83_p1 or node_cost_addr_1_gep_fu_62_p3 or ap_sig_cseq_ST_st5_fsm_4) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st5_fsm_4)) begin
        node_cost_address0 = node_cost_addr_2_reg_147;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st3_fsm_2) & (icmp_fu_98_p2 == ap_const_lv1_0))) begin
        node_cost_address0 = node_cost_addr_1_gep_fu_62_p3;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st3_fsm_2) & ~(icmp_fu_98_p2 == ap_const_lv1_0))) begin
        node_cost_address0 = tmp_s_reg_122;
    end else if ((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1)) begin
        node_cost_address0 = tmp_2_fu_83_p1;
    end else begin
        node_cost_address0 = 'bx;
    end
end

always @ (ap_sig_cseq_ST_st2_fsm_1 or icmp_fu_98_p2 or ap_sig_cseq_ST_st3_fsm_2 or ap_sig_cseq_ST_st5_fsm_4) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) | ((ap_const_logic_1 == ap_sig_cseq_ST_st3_fsm_2) & ~(icmp_fu_98_p2 == ap_const_lv1_0)) | ((ap_const_logic_1 == ap_sig_cseq_ST_st3_fsm_2) & (icmp_fu_98_p2 == ap_const_lv1_0)) | (ap_const_logic_1 == ap_sig_cseq_ST_st5_fsm_4))) begin
        node_cost_ce0 = ap_const_logic_1;
    end else begin
        node_cost_ce0 = ap_const_logic_0;
    end
end

always @ (icmp_fu_98_p2 or ap_sig_cseq_ST_st3_fsm_2 or tmp_7_reg_152 or tmp_3_fu_104_p2 or ap_sig_cseq_ST_st5_fsm_4) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st5_fsm_4)) begin
        node_cost_d0 = tmp_7_reg_152;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st3_fsm_2) & (icmp_fu_98_p2 == ap_const_lv1_0))) begin
        node_cost_d0 = tmp_3_fu_104_p2;
    end else begin
        node_cost_d0 = 'bx;
    end
end

always @ (icmp_fu_98_p2 or icmp_reg_138 or ap_sig_cseq_ST_st3_fsm_2 or ap_sig_cseq_ST_st5_fsm_4) begin
    if ((((ap_const_logic_1 == ap_sig_cseq_ST_st3_fsm_2) & (icmp_fu_98_p2 == ap_const_lv1_0)) | ((ap_const_logic_1 == ap_sig_cseq_ST_st5_fsm_4) & ~(icmp_reg_138 == ap_const_lv1_0)))) begin
        node_cost_we0 = ap_const_logic_1;
    end else begin
        node_cost_we0 = ap_const_logic_0;
    end
end

always @ (ap_start or ap_sig_cseq_ST_st1_fsm_0) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0) & ~(ap_start == ap_const_logic_0))) begin
        node_father_ce0 = ap_const_logic_1;
    end else begin
        node_father_ce0 = ap_const_logic_0;
    end
end
always @ (ap_start or ap_CS_fsm or icmp_fu_98_p2) begin
    case (ap_CS_fsm)
        ap_ST_st1_fsm_0 : 
        begin
            if (~(ap_start == ap_const_logic_0)) begin
                ap_NS_fsm = ap_ST_st2_fsm_1;
            end else begin
                ap_NS_fsm = ap_ST_st1_fsm_0;
            end
        end
        ap_ST_st2_fsm_1 : 
        begin
            ap_NS_fsm = ap_ST_st3_fsm_2;
        end
        ap_ST_st3_fsm_2 : 
        begin
            if ((icmp_fu_98_p2 == ap_const_lv1_0)) begin
                ap_NS_fsm = ap_ST_st5_fsm_4;
            end else begin
                ap_NS_fsm = ap_ST_st4_fsm_3;
            end
        end
        ap_ST_st4_fsm_3 : 
        begin
            ap_NS_fsm = ap_ST_st5_fsm_4;
        end
        ap_ST_st5_fsm_4 : 
        begin
            ap_NS_fsm = ap_ST_st1_fsm_0;
        end
        default : 
        begin
            ap_NS_fsm = 'bx;
        end
    endcase
end



always @ (ap_CS_fsm) begin
    ap_sig_bdd_23 = (ap_CS_fsm[ap_const_lv32_0] == ap_const_lv1_1);
end


always @ (ap_CS_fsm) begin
    ap_sig_bdd_58 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_1]);
end


always @ (ap_CS_fsm) begin
    ap_sig_bdd_67 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_2]);
end


always @ (ap_CS_fsm) begin
    ap_sig_bdd_83 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_3]);
end


always @ (ap_CS_fsm) begin
    ap_sig_bdd_97 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_4]);
end

assign icmp_fu_98_p2 = (tmp_fu_88_p4 == ap_const_lv2_1? 1'b1: 1'b0);

assign node_cost_addr_1_gep_fu_62_p3 = tmp_s_reg_122;

assign node_father_address0 = tmp_s_fu_78_p1;

assign tmp1_fu_111_p2 = (node_cost_q0 + ap_const_lv32_E);

assign tmp_2_fu_83_p1 = $signed(node_father_q0);

assign tmp_3_fu_104_p2 = (node_cost_q0 + ap_const_lv32_A);

assign tmp_7_fu_117_p2 = (tmp1_fu_111_p2 + node_cost_load_reg_142);

assign tmp_fu_88_p4 = {{i[ap_const_lv32_3 : ap_const_lv32_2]}};

assign tmp_s_fu_78_p1 = $signed(position);


endmodule //aStar_calculateCost

