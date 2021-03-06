// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Fri Dec 29 19:02:49 2017
// Host        : PC39 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_system_cache_0_0_stub.v
// Design      : design_1_system_cache_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "system_cache,Vivado 2017.4" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(ACLK, ARESETN, S0_AXI_AWID, S0_AXI_AWADDR, 
  S0_AXI_AWLEN, S0_AXI_AWSIZE, S0_AXI_AWBURST, S0_AXI_AWLOCK, S0_AXI_AWCACHE, S0_AXI_AWPROT, 
  S0_AXI_AWQOS, S0_AXI_AWVALID, S0_AXI_AWREADY, S0_AXI_WDATA, S0_AXI_WSTRB, S0_AXI_WLAST, 
  S0_AXI_WVALID, S0_AXI_WREADY, S0_AXI_BRESP, S0_AXI_BID, S0_AXI_BVALID, S0_AXI_BREADY, 
  S0_AXI_ARID, S0_AXI_ARADDR, S0_AXI_ARLEN, S0_AXI_ARSIZE, S0_AXI_ARBURST, S0_AXI_ARLOCK, 
  S0_AXI_ARCACHE, S0_AXI_ARPROT, S0_AXI_ARQOS, S0_AXI_ARVALID, S0_AXI_ARREADY, S0_AXI_RID, 
  S0_AXI_RDATA, S0_AXI_RRESP, S0_AXI_RLAST, S0_AXI_RVALID, S0_AXI_RREADY, S1_AXI_AWID, 
  S1_AXI_AWADDR, S1_AXI_AWLEN, S1_AXI_AWSIZE, S1_AXI_AWBURST, S1_AXI_AWLOCK, S1_AXI_AWCACHE, 
  S1_AXI_AWPROT, S1_AXI_AWQOS, S1_AXI_AWVALID, S1_AXI_AWREADY, S1_AXI_WDATA, S1_AXI_WSTRB, 
  S1_AXI_WLAST, S1_AXI_WVALID, S1_AXI_WREADY, S1_AXI_BRESP, S1_AXI_BID, S1_AXI_BVALID, 
  S1_AXI_BREADY, S1_AXI_ARID, S1_AXI_ARADDR, S1_AXI_ARLEN, S1_AXI_ARSIZE, S1_AXI_ARBURST, 
  S1_AXI_ARLOCK, S1_AXI_ARCACHE, S1_AXI_ARPROT, S1_AXI_ARQOS, S1_AXI_ARVALID, S1_AXI_ARREADY, 
  S1_AXI_RID, S1_AXI_RDATA, S1_AXI_RRESP, S1_AXI_RLAST, S1_AXI_RVALID, S1_AXI_RREADY, 
  M0_AXI_AWID, M0_AXI_AWADDR, M0_AXI_AWLEN, M0_AXI_AWSIZE, M0_AXI_AWBURST, M0_AXI_AWLOCK, 
  M0_AXI_AWCACHE, M0_AXI_AWPROT, M0_AXI_AWQOS, M0_AXI_AWVALID, M0_AXI_AWREADY, M0_AXI_WDATA, 
  M0_AXI_WSTRB, M0_AXI_WLAST, M0_AXI_WVALID, M0_AXI_WREADY, M0_AXI_BRESP, M0_AXI_BID, 
  M0_AXI_BVALID, M0_AXI_BREADY, M0_AXI_ARID, M0_AXI_ARADDR, M0_AXI_ARLEN, M0_AXI_ARSIZE, 
  M0_AXI_ARBURST, M0_AXI_ARLOCK, M0_AXI_ARCACHE, M0_AXI_ARPROT, M0_AXI_ARQOS, M0_AXI_ARVALID, 
  M0_AXI_ARREADY, M0_AXI_RID, M0_AXI_RDATA, M0_AXI_RRESP, M0_AXI_RLAST, M0_AXI_RVALID, 
  M0_AXI_RREADY)
/* synthesis syn_black_box black_box_pad_pin="ACLK,ARESETN,S0_AXI_AWID[0:0],S0_AXI_AWADDR[31:0],S0_AXI_AWLEN[7:0],S0_AXI_AWSIZE[2:0],S0_AXI_AWBURST[1:0],S0_AXI_AWLOCK,S0_AXI_AWCACHE[3:0],S0_AXI_AWPROT[2:0],S0_AXI_AWQOS[3:0],S0_AXI_AWVALID,S0_AXI_AWREADY,S0_AXI_WDATA[31:0],S0_AXI_WSTRB[3:0],S0_AXI_WLAST,S0_AXI_WVALID,S0_AXI_WREADY,S0_AXI_BRESP[1:0],S0_AXI_BID[0:0],S0_AXI_BVALID,S0_AXI_BREADY,S0_AXI_ARID[0:0],S0_AXI_ARADDR[31:0],S0_AXI_ARLEN[7:0],S0_AXI_ARSIZE[2:0],S0_AXI_ARBURST[1:0],S0_AXI_ARLOCK,S0_AXI_ARCACHE[3:0],S0_AXI_ARPROT[2:0],S0_AXI_ARQOS[3:0],S0_AXI_ARVALID,S0_AXI_ARREADY,S0_AXI_RID[0:0],S0_AXI_RDATA[31:0],S0_AXI_RRESP[1:0],S0_AXI_RLAST,S0_AXI_RVALID,S0_AXI_RREADY,S1_AXI_AWID[0:0],S1_AXI_AWADDR[31:0],S1_AXI_AWLEN[7:0],S1_AXI_AWSIZE[2:0],S1_AXI_AWBURST[1:0],S1_AXI_AWLOCK,S1_AXI_AWCACHE[3:0],S1_AXI_AWPROT[2:0],S1_AXI_AWQOS[3:0],S1_AXI_AWVALID,S1_AXI_AWREADY,S1_AXI_WDATA[31:0],S1_AXI_WSTRB[3:0],S1_AXI_WLAST,S1_AXI_WVALID,S1_AXI_WREADY,S1_AXI_BRESP[1:0],S1_AXI_BID[0:0],S1_AXI_BVALID,S1_AXI_BREADY,S1_AXI_ARID[0:0],S1_AXI_ARADDR[31:0],S1_AXI_ARLEN[7:0],S1_AXI_ARSIZE[2:0],S1_AXI_ARBURST[1:0],S1_AXI_ARLOCK,S1_AXI_ARCACHE[3:0],S1_AXI_ARPROT[2:0],S1_AXI_ARQOS[3:0],S1_AXI_ARVALID,S1_AXI_ARREADY,S1_AXI_RID[0:0],S1_AXI_RDATA[31:0],S1_AXI_RRESP[1:0],S1_AXI_RLAST,S1_AXI_RVALID,S1_AXI_RREADY,M0_AXI_AWID[0:0],M0_AXI_AWADDR[31:0],M0_AXI_AWLEN[7:0],M0_AXI_AWSIZE[2:0],M0_AXI_AWBURST[1:0],M0_AXI_AWLOCK,M0_AXI_AWCACHE[3:0],M0_AXI_AWPROT[2:0],M0_AXI_AWQOS[3:0],M0_AXI_AWVALID,M0_AXI_AWREADY,M0_AXI_WDATA[31:0],M0_AXI_WSTRB[3:0],M0_AXI_WLAST,M0_AXI_WVALID,M0_AXI_WREADY,M0_AXI_BRESP[1:0],M0_AXI_BID[0:0],M0_AXI_BVALID,M0_AXI_BREADY,M0_AXI_ARID[0:0],M0_AXI_ARADDR[31:0],M0_AXI_ARLEN[7:0],M0_AXI_ARSIZE[2:0],M0_AXI_ARBURST[1:0],M0_AXI_ARLOCK,M0_AXI_ARCACHE[3:0],M0_AXI_ARPROT[2:0],M0_AXI_ARQOS[3:0],M0_AXI_ARVALID,M0_AXI_ARREADY,M0_AXI_RID[0:0],M0_AXI_RDATA[31:0],M0_AXI_RRESP[1:0],M0_AXI_RLAST,M0_AXI_RVALID,M0_AXI_RREADY" */;
  input ACLK;
  input ARESETN;
  input [0:0]S0_AXI_AWID;
  input [31:0]S0_AXI_AWADDR;
  input [7:0]S0_AXI_AWLEN;
  input [2:0]S0_AXI_AWSIZE;
  input [1:0]S0_AXI_AWBURST;
  input S0_AXI_AWLOCK;
  input [3:0]S0_AXI_AWCACHE;
  input [2:0]S0_AXI_AWPROT;
  input [3:0]S0_AXI_AWQOS;
  input S0_AXI_AWVALID;
  output S0_AXI_AWREADY;
  input [31:0]S0_AXI_WDATA;
  input [3:0]S0_AXI_WSTRB;
  input S0_AXI_WLAST;
  input S0_AXI_WVALID;
  output S0_AXI_WREADY;
  output [1:0]S0_AXI_BRESP;
  output [0:0]S0_AXI_BID;
  output S0_AXI_BVALID;
  input S0_AXI_BREADY;
  input [0:0]S0_AXI_ARID;
  input [31:0]S0_AXI_ARADDR;
  input [7:0]S0_AXI_ARLEN;
  input [2:0]S0_AXI_ARSIZE;
  input [1:0]S0_AXI_ARBURST;
  input S0_AXI_ARLOCK;
  input [3:0]S0_AXI_ARCACHE;
  input [2:0]S0_AXI_ARPROT;
  input [3:0]S0_AXI_ARQOS;
  input S0_AXI_ARVALID;
  output S0_AXI_ARREADY;
  output [0:0]S0_AXI_RID;
  output [31:0]S0_AXI_RDATA;
  output [1:0]S0_AXI_RRESP;
  output S0_AXI_RLAST;
  output S0_AXI_RVALID;
  input S0_AXI_RREADY;
  input [0:0]S1_AXI_AWID;
  input [31:0]S1_AXI_AWADDR;
  input [7:0]S1_AXI_AWLEN;
  input [2:0]S1_AXI_AWSIZE;
  input [1:0]S1_AXI_AWBURST;
  input S1_AXI_AWLOCK;
  input [3:0]S1_AXI_AWCACHE;
  input [2:0]S1_AXI_AWPROT;
  input [3:0]S1_AXI_AWQOS;
  input S1_AXI_AWVALID;
  output S1_AXI_AWREADY;
  input [31:0]S1_AXI_WDATA;
  input [3:0]S1_AXI_WSTRB;
  input S1_AXI_WLAST;
  input S1_AXI_WVALID;
  output S1_AXI_WREADY;
  output [1:0]S1_AXI_BRESP;
  output [0:0]S1_AXI_BID;
  output S1_AXI_BVALID;
  input S1_AXI_BREADY;
  input [0:0]S1_AXI_ARID;
  input [31:0]S1_AXI_ARADDR;
  input [7:0]S1_AXI_ARLEN;
  input [2:0]S1_AXI_ARSIZE;
  input [1:0]S1_AXI_ARBURST;
  input S1_AXI_ARLOCK;
  input [3:0]S1_AXI_ARCACHE;
  input [2:0]S1_AXI_ARPROT;
  input [3:0]S1_AXI_ARQOS;
  input S1_AXI_ARVALID;
  output S1_AXI_ARREADY;
  output [0:0]S1_AXI_RID;
  output [31:0]S1_AXI_RDATA;
  output [1:0]S1_AXI_RRESP;
  output S1_AXI_RLAST;
  output S1_AXI_RVALID;
  input S1_AXI_RREADY;
  output [0:0]M0_AXI_AWID;
  output [31:0]M0_AXI_AWADDR;
  output [7:0]M0_AXI_AWLEN;
  output [2:0]M0_AXI_AWSIZE;
  output [1:0]M0_AXI_AWBURST;
  output M0_AXI_AWLOCK;
  output [3:0]M0_AXI_AWCACHE;
  output [2:0]M0_AXI_AWPROT;
  output [3:0]M0_AXI_AWQOS;
  output M0_AXI_AWVALID;
  input M0_AXI_AWREADY;
  output [31:0]M0_AXI_WDATA;
  output [3:0]M0_AXI_WSTRB;
  output M0_AXI_WLAST;
  output M0_AXI_WVALID;
  input M0_AXI_WREADY;
  input [1:0]M0_AXI_BRESP;
  input [0:0]M0_AXI_BID;
  input M0_AXI_BVALID;
  output M0_AXI_BREADY;
  output [0:0]M0_AXI_ARID;
  output [31:0]M0_AXI_ARADDR;
  output [7:0]M0_AXI_ARLEN;
  output [2:0]M0_AXI_ARSIZE;
  output [1:0]M0_AXI_ARBURST;
  output M0_AXI_ARLOCK;
  output [3:0]M0_AXI_ARCACHE;
  output [2:0]M0_AXI_ARPROT;
  output [3:0]M0_AXI_ARQOS;
  output M0_AXI_ARVALID;
  input M0_AXI_ARREADY;
  input [0:0]M0_AXI_RID;
  input [31:0]M0_AXI_RDATA;
  input [1:0]M0_AXI_RRESP;
  input M0_AXI_RLAST;
  input M0_AXI_RVALID;
  output M0_AXI_RREADY;
endmodule
