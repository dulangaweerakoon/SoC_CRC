
`timescale 1 ns / 1 ps

	module myiphwac_v1_0_S00_AXI #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line

		// Width of ID for for write address, write data, read address and read data
		parameter integer C_S_AXI_ID_WIDTH	= 1,
		// Width of S_AXI data bus
		parameter integer C_S_AXI_DATA_WIDTH	= 32,
		// Width of S_AXI address bus
		parameter integer C_S_AXI_ADDR_WIDTH	= 9,
		// Width of optional user defined signal in write address channel
		parameter integer C_S_AXI_AWUSER_WIDTH	= 0,
		// Width of optional user defined signal in read address channel
		parameter integer C_S_AXI_ARUSER_WIDTH	= 0,
		// Width of optional user defined signal in write data channel
		parameter integer C_S_AXI_WUSER_WIDTH	= 0,
		// Width of optional user defined signal in read data channel
		parameter integer C_S_AXI_RUSER_WIDTH	= 0,
		// Width of optional user defined signal in write response channel
		parameter integer C_S_AXI_BUSER_WIDTH	= 0
	)
	(
		// Users to add ports here
        input  crc_cal_done_in ,
		output [1023:0] bit_stream_out,
		output crc_cal_enable_out,
		input  [15:0]crc_result_in,
		// User ports ends
		// Do not modify the ports beyond this line

		// Global Clock Signal
		input wire  S_AXI_ACLK,
		// Global Reset Signal. This Signal is Active LOW
		input wire  S_AXI_ARESETN,
		// Write Address ID
		input wire [C_S_AXI_ID_WIDTH-1 : 0] S_AXI_AWID,
		// Write address
		input wire [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_AWADDR,
		// Burst length. The burst length gives the exact number of transfers in a burst
		input wire [7 : 0] S_AXI_AWLEN,
		// Burst size. This signal indicates the size of each transfer in the burst
		input wire [2 : 0] S_AXI_AWSIZE,
		// Burst type. The burst type and the size information, 
    // determine how the address for each transfer within the burst is calculated.
		input wire [1 : 0] S_AXI_AWBURST,
		// Lock type. Provides additional information about the
    // atomic characteristics of the transfer.
		input wire  S_AXI_AWLOCK,
		// Memory type. This signal indicates how transactions
    // are required to progress through a system.
		input wire [3 : 0] S_AXI_AWCACHE,
		// Protection type. This signal indicates the privilege
    // and security level of the transaction, and whether
    // the transaction is a data access or an instruction access.
		input wire [2 : 0] S_AXI_AWPROT,
		// Quality of Service, QoS identifier sent for each
    // write transaction.
		input wire [3 : 0] S_AXI_AWQOS,
		// Region identifier. Permits a single physical interface
    // on a slave to be used for multiple logical interfaces.
		input wire [3 : 0] S_AXI_AWREGION,
		// Optional User-defined signal in the write address channel.
		input wire [C_S_AXI_AWUSER_WIDTH-1 : 0] S_AXI_AWUSER,
		// Write address valid. This signal indicates that
    // the channel is signaling valid write address and
    // control information.
		input wire  S_AXI_AWVALID,
		// Write address ready. This signal indicates that
    // the slave is ready to accept an address and associated
    // control signals.
		output wire  S_AXI_AWREADY,
		// Write Data
		input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA,
		// Write strobes. This signal indicates which byte
    // lanes hold valid data. There is one write strobe
    // bit for each eight bits of the write data bus.
		input wire [(C_S_AXI_DATA_WIDTH/8)-1 : 0] S_AXI_WSTRB,
		// Write last. This signal indicates the last transfer
    // in a write burst.
		input wire  S_AXI_WLAST,
		// Optional User-defined signal in the write data channel.
		input wire [C_S_AXI_WUSER_WIDTH-1 : 0] S_AXI_WUSER,
		// Write valid. This signal indicates that valid write
    // data and strobes are available.
		input wire  S_AXI_WVALID,
		// Write ready. This signal indicates that the slave
    // can accept the write data.
		output wire  S_AXI_WREADY,
		// Response ID tag. This signal is the ID tag of the
    // write response.
		output wire [C_S_AXI_ID_WIDTH-1 : 0] S_AXI_BID,
		// Write response. This signal indicates the status
    // of the write transaction.
		output wire [1 : 0] S_AXI_BRESP,
		// Optional User-defined signal in the write response channel.
		output wire [C_S_AXI_BUSER_WIDTH-1 : 0] S_AXI_BUSER,
		// Write response valid. This signal indicates that the
    // channel is signaling a valid write response.
		output wire  S_AXI_BVALID,
		// Response ready. This signal indicates that the master
    // can accept a write response.
		input wire  S_AXI_BREADY,
		// Read address ID. This signal is the identification
    // tag for the read address group of signals.
		input wire [C_S_AXI_ID_WIDTH-1 : 0] S_AXI_ARID,
		// Read address. This signal indicates the initial
    // address of a read burst transaction.
		input wire [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_ARADDR,
		// Burst length. The burst length gives the exact number of transfers in a burst
		input wire [7 : 0] S_AXI_ARLEN,
		// Burst size. This signal indicates the size of each transfer in the burst
		input wire [2 : 0] S_AXI_ARSIZE,
		// Burst type. The burst type and the size information, 
    // determine how the address for each transfer within the burst is calculated.
		input wire [1 : 0] S_AXI_ARBURST,
		// Lock type. Provides additional information about the
    // atomic characteristics of the transfer.
		input wire  S_AXI_ARLOCK,
		// Memory type. This signal indicates how transactions
    // are required to progress through a system.
		input wire [3 : 0] S_AXI_ARCACHE,
		// Protection type. This signal indicates the privilege
    // and security level of the transaction, and whether
    // the transaction is a data access or an instruction access.
		input wire [2 : 0] S_AXI_ARPROT,
		// Quality of Service, QoS identifier sent for each
    // read transaction.
		input wire [3 : 0] S_AXI_ARQOS,
		// Region identifier. Permits a single physical interface
    // on a slave to be used for multiple logical interfaces.
		input wire [3 : 0] S_AXI_ARREGION,
		// Optional User-defined signal in the read address channel.
		input wire [C_S_AXI_ARUSER_WIDTH-1 : 0] S_AXI_ARUSER,
		// Write address valid. This signal indicates that
    // the channel is signaling valid read address and
    // control information.
		input wire  S_AXI_ARVALID,
		// Read address ready. This signal indicates that
    // the slave is ready to accept an address and associated
    // control signals.
		output wire  S_AXI_ARREADY,
		// Read ID tag. This signal is the identification tag
    // for the read data group of signals generated by the slave.
		output wire [C_S_AXI_ID_WIDTH-1 : 0] S_AXI_RID,
		// Read Data
		output wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA,
		// Read response. This signal indicates the status of
    // the read transfer.
		output wire [1 : 0] S_AXI_RRESP,
		// Read last. This signal indicates the last transfer
    // in a read burst.
		output wire  S_AXI_RLAST,
		// Optional User-defined signal in the read address channel.
		output wire [C_S_AXI_RUSER_WIDTH-1 : 0] S_AXI_RUSER,
		// Read valid. This signal indicates that the channel
    // is signaling the required read data.
		output wire  S_AXI_RVALID,
		// Read ready. This signal indicates that the master can
    // accept the read data and response information.
		input wire  S_AXI_RREADY
	);

	// AXI4FULL signals
	reg [C_S_AXI_ADDR_WIDTH-1 : 0] 	axi_awaddr;
	reg  	axi_awready;
	reg  	axi_wready;
	reg [1 : 0] 	axi_bresp;
	reg [C_S_AXI_BUSER_WIDTH-1 : 0] 	axi_buser;
	reg  	axi_bvalid;
	reg [C_S_AXI_ADDR_WIDTH-1 : 0] 	axi_araddr;
	reg  	axi_arready;
	reg [C_S_AXI_DATA_WIDTH-1 : 0] 	axi_rdata;
	reg [1 : 0] 	axi_rresp;
	reg  	axi_rlast;
	reg [C_S_AXI_RUSER_WIDTH-1 : 0] 	axi_ruser;
	reg  	axi_rvalid;
	// aw_wrap_en determines wrap boundary and enables wrapping
	wire aw_wrap_en;
	// ar_wrap_en determines wrap boundary and enables wrapping
	wire ar_wrap_en;
	// aw_wrap_size is the size of the write transfer, the
	// write address wraps to a lower address if upper address
	// limit is reached
	wire [31:0]  aw_wrap_size ; 
	// ar_wrap_size is the size of the read transfer, the
	// read address wraps to a lower address if upper address
	// limit is reached
	wire [31:0]  ar_wrap_size ; 
	// The axi_awv_awr_flag flag marks the presence of write address valid
	reg axi_awv_awr_flag;
	//The axi_arv_arr_flag flag marks the presence of read address valid
	reg axi_arv_arr_flag; 
	// The axi_awlen_cntr internal write address counter to keep track of beats in a burst transaction
	reg [7:0] axi_awlen_cntr;
	//The axi_arlen_cntr internal read address counter to keep track of beats in a burst transaction
	reg [7:0] axi_arlen_cntr;
	reg [1:0] axi_arburst;
	reg [1:0] axi_awburst;
	reg [7:0] axi_arlen;
	reg [7:0] axi_awlen;
	//local parameter for addressing 32 bit / 64 bit C_S_AXI_DATA_WIDTH
	//ADDR_LSB is used for addressing 32/64 bit registers/memories
	//ADDR_LSB = 2 for 32 bits (n downto 2) 
	//ADDR_LSB = 3 for 42 bits (n downto 3)

	localparam integer ADDR_LSB = (C_S_AXI_DATA_WIDTH/32)+ 1;
	localparam integer OPT_MEM_ADDR_BITS = 6;
	localparam integer USER_NUM_MEM = 1;
	
	localparam 			STATE_WIDTH =3;
	localparam          MAX_STREAM_WIDTH=1024;
	localparam [STATE_WIDTH-1:0] STATE_INIT= 0;
	localparam [STATE_WIDTH-1:0] STATE_MAKE_BITSTREAM=1;
	localparam [STATE_WIDTH-1:0] STATE_START_CRC_CALCULATION=2;
	//----------------------------------------------
	//-- Signals for user logic memory space example
	//------------------------------------------------
	wire [OPT_MEM_ADDR_BITS:0] mem_address;
	wire [USER_NUM_MEM-1:0] mem_select;
	reg [C_S_AXI_DATA_WIDTH-1:0] mem_data_out[0 : USER_NUM_MEM-1];
	
	reg [C_S_AXI_DATA_WIDTH-1:0]	hwac_inputcontrol_reg1;
	reg [C_S_AXI_DATA_WIDTH-1:0]	hwac_output_result_reg1;
	reg [C_S_AXI_DATA_WIDTH-1:0]	hwac_data_reg0;
	reg [C_S_AXI_DATA_WIDTH-1:0]	hwac_data_reg1;
	reg [C_S_AXI_DATA_WIDTH-1:0]	hwac_data_reg2;
	reg [C_S_AXI_DATA_WIDTH-1:0]	hwac_data_reg3;
	reg [C_S_AXI_DATA_WIDTH-1:0]	hwac_data_reg4;
	reg [C_S_AXI_DATA_WIDTH-1:0]	hwac_data_reg5;
	reg [C_S_AXI_DATA_WIDTH-1:0]	hwac_data_reg6;
	reg [C_S_AXI_DATA_WIDTH-1:0]	hwac_data_reg7;
	reg [C_S_AXI_DATA_WIDTH-1:0]	hwac_data_reg8;
	reg [C_S_AXI_DATA_WIDTH-1:0]	hwac_data_reg9;
	reg [C_S_AXI_DATA_WIDTH-1:0]	hwac_data_reg10;
	reg [C_S_AXI_DATA_WIDTH-1:0]	hwac_data_reg11;
	reg [C_S_AXI_DATA_WIDTH-1:0]	hwac_data_reg12;
	reg [C_S_AXI_DATA_WIDTH-1:0]	hwac_data_reg13;
	reg [C_S_AXI_DATA_WIDTH-1:0]	hwac_data_reg14;
	reg [C_S_AXI_DATA_WIDTH-1:0]	hwac_data_reg15;
	reg [C_S_AXI_DATA_WIDTH-1:0]	hwac_data_reg16;
	reg [C_S_AXI_DATA_WIDTH-1:0]	hwac_data_reg17;
	reg [C_S_AXI_DATA_WIDTH-1:0]	hwac_data_reg18;
	reg [C_S_AXI_DATA_WIDTH-1:0]	hwac_data_reg19;
	reg [C_S_AXI_DATA_WIDTH-1:0]	hwac_data_reg20;
	reg [C_S_AXI_DATA_WIDTH-1:0]	hwac_data_reg21;
	reg [C_S_AXI_DATA_WIDTH-1:0]	hwac_data_reg22;
	reg [C_S_AXI_DATA_WIDTH-1:0]	hwac_data_reg23;
	reg [C_S_AXI_DATA_WIDTH-1:0]	hwac_data_reg24;
	reg [C_S_AXI_DATA_WIDTH-1:0]	hwac_data_reg25;
	reg [C_S_AXI_DATA_WIDTH-1:0]	hwac_data_reg26;
	reg [C_S_AXI_DATA_WIDTH-1:0]	hwac_data_reg27;
	reg [C_S_AXI_DATA_WIDTH-1:0]	hwac_data_reg28;
	reg [C_S_AXI_DATA_WIDTH-1:0]	hwac_data_reg29;
	reg [C_S_AXI_DATA_WIDTH-1:0]    hwac_data_reg30;
	reg [C_S_AXI_DATA_WIDTH-1:0]    hwac_data_reg31;
	reg [C_S_AXI_DATA_WIDTH-1:0]    hwac_data_reg32;
	
	reg [9:0]                    	current_counter;
	reg [7:0] 						data_out_reg;
	reg [C_S_AXI_ADDR_WIDTH-1 : 0]  address;
    reg [STATE_WIDTH-1:0]           state_var;
	reg [C_S_AXI_DATA_WIDTH-1:0] reg_data_out;
	reg [32-1:0] reg_data_c_out;
	reg [MAX_STREAM_WIDTH-1:0]	bit_stream_reg;
	reg [MAX_STREAM_WIDTH-1:0]	bit_stream_reg1;
	reg crc_cal_enable_out;
	reg [1023:0]bit_stream_out;
	reg [15:0] crc_result_reg;

	genvar i;
	genvar j;
	genvar mem_byte_index;

	// I/O Connections assignments

	assign S_AXI_AWREADY	= axi_awready;
	assign S_AXI_WREADY	= axi_wready;
	assign S_AXI_BRESP	= axi_bresp;
	assign S_AXI_BUSER	= axi_buser;
	assign S_AXI_BVALID	= axi_bvalid;
	assign S_AXI_ARREADY	= axi_arready;
	assign S_AXI_RDATA	= axi_rdata;
	assign S_AXI_RRESP	= axi_rresp;
	assign S_AXI_RLAST	= axi_rlast;
	assign S_AXI_RUSER	= axi_ruser;
	assign S_AXI_RVALID	= axi_rvalid;
	assign S_AXI_BID = S_AXI_AWID;
	assign S_AXI_RID = S_AXI_ARID;
	assign  aw_wrap_size = (C_S_AXI_DATA_WIDTH/8 * (axi_awlen)); 
	assign  ar_wrap_size = (C_S_AXI_DATA_WIDTH/8 * (axi_arlen)); 
	assign  aw_wrap_en = ((axi_awaddr & aw_wrap_size) == aw_wrap_size)? 1'b1: 1'b0;
	assign  ar_wrap_en = ((axi_araddr & ar_wrap_size) == ar_wrap_size)? 1'b1: 1'b0;

	// Implement axi_awready generation

	// axi_awready is asserted for one S_AXI_ACLK clock cycle when both
	// S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_awready is
	// de-asserted when reset is low.

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_awready <= 1'b0;
	      axi_awv_awr_flag <= 1'b0;
	    end 
	  else
	    begin    
	      if (~axi_awready && S_AXI_AWVALID && ~axi_awv_awr_flag && ~axi_arv_arr_flag)
	        begin
	          // slave is ready to accept an address and
	          // associated control signals
	          axi_awready <= 1'b1;
	          axi_awv_awr_flag  <= 1'b1; 
	          // used for generation of bresp() and bvalid
	        end
	      else if (S_AXI_WLAST && axi_wready)          
	      // preparing to accept next address after current write burst tx completion
	        begin
	          axi_awv_awr_flag  <= 1'b0;
	        end
	      else        
	        begin
	          axi_awready <= 1'b0;
	        end
	    end 
	end       
	// Implement axi_awaddr latching

	// This process is used to latch the address when both 
	// S_AXI_AWVALID and S_AXI_WVALID are valid. 

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_awaddr <= 0;
	      axi_awlen_cntr <= 0;
	      axi_awburst <= 0;
	      axi_awlen <= 0;
	    end 
	  else
	    begin    
	      if (~axi_awready && S_AXI_AWVALID && ~axi_awv_awr_flag)
	        begin
	          // address latching 
	          axi_awaddr <= S_AXI_AWADDR[C_S_AXI_ADDR_WIDTH - 1:0];  
	           axi_awburst <= S_AXI_AWBURST; 
	           axi_awlen <= S_AXI_AWLEN;     
	          // start address of transfer
	          axi_awlen_cntr <= 0;
	        end   
	      else if((axi_awlen_cntr <= axi_awlen) && axi_wready && S_AXI_WVALID)        
	        begin

	          axi_awlen_cntr <= axi_awlen_cntr + 1;

	          case (axi_awburst)
	            2'b00: // fixed burst
	            // The write address for all the beats in the transaction are fixed
	              begin
	                axi_awaddr <= axi_awaddr;          
	                //for awsize = 4 bytes (010)
	              end   
	            2'b01: //incremental burst
	            // The write address for all the beats in the transaction are increments by awsize
	              begin
	                axi_awaddr[C_S_AXI_ADDR_WIDTH - 1:ADDR_LSB] <= axi_awaddr[C_S_AXI_ADDR_WIDTH - 1:ADDR_LSB] + 1;
	                //awaddr aligned to 4 byte boundary
	                axi_awaddr[ADDR_LSB-1:0]  <= {ADDR_LSB{1'b0}};   
	                //for awsize = 4 bytes (010)
	              end   
	            2'b10: //Wrapping burst
	            // The write address wraps when the address reaches wrap boundary 
	              if (aw_wrap_en)
	                begin
	                  axi_awaddr <= (axi_awaddr - aw_wrap_size); 
	                end
	              else 
	                begin
	                  axi_awaddr[C_S_AXI_ADDR_WIDTH - 1:ADDR_LSB] <= axi_awaddr[C_S_AXI_ADDR_WIDTH - 1:ADDR_LSB] + 1;
	                  axi_awaddr[ADDR_LSB-1:0]  <= {ADDR_LSB{1'b0}}; 
	                end                      
	            default: //reserved (incremental burst for example)
	              begin
	                axi_awaddr <= axi_awaddr[C_S_AXI_ADDR_WIDTH - 1:ADDR_LSB] + 1;
	                //for awsize = 4 bytes (010)
	              end
	          endcase              
	        end
	    end 
	end       
	// Implement axi_wready generation

	// axi_wready is asserted for one S_AXI_ACLK clock cycle when both
	// S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_wready is 
	// de-asserted when reset is low. 

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_wready <= 1'b0;
	    end 
	  else
	    begin    
	      if ( ~axi_wready && S_AXI_WVALID && axi_awv_awr_flag)
	        begin
	          // slave can accept the write data
	          axi_wready <= 1'b1;
	        end
	      //else if (~axi_awv_awr_flag)
	      else if (S_AXI_WLAST && axi_wready)
	        begin
	          axi_wready <= 1'b0;
	        end
	    end 
	end       
	// Implement write response logic generation

	// The write response and response valid signals are asserted by the slave 
	// when axi_wready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted.  
	// This marks the acceptance of address and indicates the status of 
	// write transaction.

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_bvalid <= 0;
	      axi_bresp <= 2'b0;
	      axi_buser <= 0;
	    end 
	  else
	    begin    
	      if (axi_awv_awr_flag && axi_wready && S_AXI_WVALID && ~axi_bvalid && S_AXI_WLAST )
	        begin
	          axi_bvalid <= 1'b1;
	          axi_bresp  <= 2'b0; 
	          // 'OKAY' response 
	        end                   
	      else
	        begin
	          if (S_AXI_BREADY && axi_bvalid) 
	          //check if bready is asserted while bvalid is high) 
	          //(there is a possibility that bready is always asserted high)   
	            begin
	              axi_bvalid <= 1'b0; 
	            end  
	        end
	    end
	 end   
	// Implement axi_arready generation

	// axi_arready is asserted for one S_AXI_ACLK clock cycle when
	// S_AXI_ARVALID is asserted. axi_awready is 
	// de-asserted when reset (active low) is asserted. 
	// The read address is also latched when S_AXI_ARVALID is 
	// asserted. axi_araddr is reset to zero on reset assertion.

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_arready <= 1'b0;
	      axi_arv_arr_flag <= 1'b0;
	    end 
	  else
	    begin    
	      if (~axi_arready && S_AXI_ARVALID && ~axi_awv_awr_flag && ~axi_arv_arr_flag)
	        begin
	          axi_arready <= 1'b1;
	          axi_arv_arr_flag <= 1'b1;
	        end
	      else if (axi_rvalid && S_AXI_RREADY && axi_arlen_cntr == axi_arlen)
	      // preparing to accept next address after current read completion
	        begin
	          axi_arv_arr_flag  <= 1'b0;
	        end
	      else        
	        begin
	          axi_arready <= 1'b0;
	        end
	    end 
	end       
	// Implement axi_araddr latching

	//This process is used to latch the address when both 
	//S_AXI_ARVALID and S_AXI_RVALID are valid. 
	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_araddr <= 0;
	      axi_arlen_cntr <= 0;
	      axi_arburst <= 0;
	      axi_arlen <= 0;
	      axi_rlast <= 1'b0;
	      axi_ruser <= 0;
	    end 
	  else
	    begin    
	      if (~axi_arready && S_AXI_ARVALID && ~axi_arv_arr_flag)
	        begin
	          // address latching 
	          axi_araddr <= S_AXI_ARADDR[C_S_AXI_ADDR_WIDTH - 1:0]; 
	          axi_arburst <= S_AXI_ARBURST; 
	          axi_arlen <= S_AXI_ARLEN;     
	          // start address of transfer
	          axi_arlen_cntr <= 0;
	          axi_rlast <= 1'b0;
	        end   
	      else if((axi_arlen_cntr <= axi_arlen) && axi_rvalid && S_AXI_RREADY)        
	        begin
	         
	          axi_arlen_cntr <= axi_arlen_cntr + 1;
	          axi_rlast <= 1'b0;
	        
	          case (axi_arburst)
	            2'b00: // fixed burst
	             // The read address for all the beats in the transaction are fixed
	              begin
	                axi_araddr       <= axi_araddr;        
	                //for arsize = 4 bytes (010)
	              end   
	            2'b01: //incremental burst
	            // The read address for all the beats in the transaction are increments by awsize
	              begin
	                axi_araddr[C_S_AXI_ADDR_WIDTH - 1:ADDR_LSB] <= axi_araddr[C_S_AXI_ADDR_WIDTH - 1:ADDR_LSB] + 1; 
	                //araddr aligned to 4 byte boundary
	                axi_araddr[ADDR_LSB-1:0]  <= {ADDR_LSB{1'b0}};   
	                //for awsize = 4 bytes (010)
	              end   
	            2'b10: //Wrapping burst
	            // The read address wraps when the address reaches wrap boundary 
	              if (ar_wrap_en) 
	                begin
	                  axi_araddr <= (axi_araddr - ar_wrap_size); 
	                end
	              else 
	                begin
	                axi_araddr[C_S_AXI_ADDR_WIDTH - 1:ADDR_LSB] <= axi_araddr[C_S_AXI_ADDR_WIDTH - 1:ADDR_LSB] + 1; 
	                //araddr aligned to 4 byte boundary
	                axi_araddr[ADDR_LSB-1:0]  <= {ADDR_LSB{1'b0}};   
	                end                      
	            default: //reserved (incremental burst for example)
	              begin
	                axi_araddr <= axi_araddr[C_S_AXI_ADDR_WIDTH - 1:ADDR_LSB]+1;
	                //for arsize = 4 bytes (010)
	              end
	          endcase              
	        end
	      else if((axi_arlen_cntr == axi_arlen) && ~axi_rlast && axi_arv_arr_flag )   
	        begin
	          axi_rlast <= 1'b1;
	        end          
	      else if (S_AXI_RREADY)   
	        begin
	          axi_rlast <= 1'b0;
	        end          
	    end 
	end       
	// Implement axi_arvalid generation

	// axi_rvalid is asserted for one S_AXI_ACLK clock cycle when both 
	// S_AXI_ARVALID and axi_arready are asserted. The slave registers 
	// data are available on the axi_rdata bus at this instance. The 
	// assertion of axi_rvalid marks the validity of read data on the 
	// bus and axi_rresp indicates the status of read transaction.axi_rvalid 
	// is deasserted on reset (active low). axi_rresp and axi_rdata are 
	// cleared to zero on reset (active low).  

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_rvalid <= 0;
	      axi_rresp  <= 0;
	    end 
	  else
	    begin    
	      if (axi_arv_arr_flag && ~axi_rvalid)
	        begin
	          axi_rvalid <= 1'b1;
	          axi_rresp  <= 2'b0; 
	          // 'OKAY' response
	        end   
	      else if (axi_rvalid && S_AXI_RREADY)
	        begin
	          axi_rvalid <= 1'b0;
	        end            
	    end
	end    
	// ------------------------------------------
	// -- Example code to access user logic memory region
	// ------------------------------------------

	generate
	  if (USER_NUM_MEM >= 1)
	    begin
	      assign mem_select  = 1;
	      assign mem_address = (axi_arv_arr_flag? axi_araddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB]:(axi_awv_awr_flag? axi_awaddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB]:0));
	    end
	endgenerate
	     
	// implement Block RAM(s)
	//generate 
	//  for(i=0; i<= USER_NUM_MEM-1; i=i+1)
	//    begin:BRAM_GEN
/* 	      wire mem_rden;
	      wire mem_wren;
	
	      assign mem_wren = axi_wready && S_AXI_WVALID ;
	
	      assign mem_rden = axi_arv_arr_flag ; //& ~axi_rvalid
	     
	  //    for(mem_byte_index=0; mem_byte_index<= 0; mem_byte_index=mem_byte_index+1)
	 //     begin:BYTE_BRAM_GEN
	        wire [8-1:0] data_in ;
	        wire [8-1:0] data_out;
	        reg  [8-1:0] byte_ram [0 : 127];
	  //      integer  j;
	     
	        //assigning 8 bit data
	        assign data_in  = S_AXI_WDATA[0 +: 8];
	        assign data_out = byte_ram[mem_address];
	     
	        always @( posedge S_AXI_ACLK )
	        begin
			
	          if (mem_wren && S_AXI_WSTRB[0])
	            begin
	              byte_ram[mem_address] <= data_in;
	            end   
	        end    
	      
	        always @( posedge S_AXI_ACLK )
	        begin
	          if (mem_rden)
	            begin
	              mem_data_out[0][0+: 8] <= data_out;
	            end   
	        end  */   
	               
	    //end
	  //end       
	//endgenerate
	//Output register or memory read data

	always @( mem_data_out, axi_rvalid)
	begin
	  if (axi_rvalid) 
	    begin
	      // Read address mux
	      axi_rdata <= reg_data_out;
	    end   
	  else
	    begin
	      axi_rdata <= 32'h00000000;
	    end       
	end    

	// Add user logic here
    wire mem_wren1;
	
	assign mem_wren1 = axi_wready && S_AXI_WVALID ;
	
	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      hwac_inputcontrol_reg1 <= 0;

	  
	    end 
	  else begin
	    if (mem_wren1)
	      begin
	        case ( axi_awaddr )
			  9'd0: 	             
			  if ( S_AXI_WSTRB[0] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 0
	                hwac_data_reg0<=S_AXI_WDATA;
					end   
			  9'd1:
	              if ( S_AXI_WSTRB[0] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 0
	                hwac_data_reg1<=S_AXI_WDATA;
	              end   			  
			  9'd2:
	              if ( S_AXI_WSTRB[0] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 0
	                hwac_data_reg2<=S_AXI_WDATA;
	              end
			  9'd3:
	              if ( S_AXI_WSTRB[0] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 0
	                hwac_data_reg3<=S_AXI_WDATA;
	              end
			  9'd4:
	              if ( S_AXI_WSTRB[0] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 0
	                hwac_data_reg4<=S_AXI_WDATA;
	              end
			  9'd5:
	              if ( S_AXI_WSTRB[0] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 0
	                hwac_data_reg5<=S_AXI_WDATA;
	              end
			  9'd6:
	              if ( S_AXI_WSTRB[0] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 0
	                hwac_data_reg6<=S_AXI_WDATA;
	              end
			  9'd7:
	              if ( S_AXI_WSTRB[0] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 0
	                hwac_data_reg7<=S_AXI_WDATA;
	              end
			  9'd8:
	              if ( S_AXI_WSTRB[0] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 0
	                hwac_data_reg8<=S_AXI_WDATA;
	              end
			  9'd9:
	              if ( S_AXI_WSTRB[0] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 0
	                hwac_data_reg9<=S_AXI_WDATA;
	              end
			  9'd10:
	              if ( S_AXI_WSTRB[0] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 0
	                hwac_data_reg10<=S_AXI_WDATA;
	              end
			  9'd11:
	              if ( S_AXI_WSTRB[0] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 0
	                hwac_data_reg11<=S_AXI_WDATA;
	              end
			  9'd12: 	             
			  if ( S_AXI_WSTRB[0] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 0
	                hwac_data_reg12<=S_AXI_WDATA;
					end   
			  9'd13:
	              if ( S_AXI_WSTRB[0] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 0
	                hwac_data_reg13<=S_AXI_WDATA;
	              end   			  
			  9'd14:
	              if ( S_AXI_WSTRB[0] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 0
	                hwac_data_reg14<=S_AXI_WDATA;
	              end
			  9'd15:
	              if ( S_AXI_WSTRB[0] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 0
	                hwac_data_reg15<=S_AXI_WDATA;
	              end
			  9'd16:
	              if ( S_AXI_WSTRB[0] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 0
	                hwac_data_reg16<=S_AXI_WDATA;
	              end
			  9'd17:
	              if ( S_AXI_WSTRB[0] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 0
	                hwac_data_reg17<=S_AXI_WDATA;
	              end
			  9'd18:
	              if ( S_AXI_WSTRB[0] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 0
	                hwac_data_reg18<=S_AXI_WDATA;
	              end
			  9'd19:
	              if ( S_AXI_WSTRB[0] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 0
	                hwac_data_reg19<=S_AXI_WDATA;
	              end
			  9'd20:
	              if ( S_AXI_WSTRB[0] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 0
	                hwac_data_reg20<=S_AXI_WDATA;
	              end
			  9'd21:
	              if ( S_AXI_WSTRB[0] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 0
	                hwac_data_reg21<=S_AXI_WDATA;
	              end
			  9'd22:
	              if ( S_AXI_WSTRB[0] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 0
	                hwac_data_reg22<=S_AXI_WDATA;
	              end
			  9'd23:
	              if ( S_AXI_WSTRB[0] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 0
	                hwac_data_reg23<=S_AXI_WDATA;
	              end
			  9'd24: 	             
			  if ( S_AXI_WSTRB[0] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 0
	                hwac_data_reg24<=S_AXI_WDATA;
					end   
			  9'd25:
	              if ( S_AXI_WSTRB[0] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 0
	                hwac_data_reg25<=S_AXI_WDATA;
	              end   			  
			  9'd26:
	              if ( S_AXI_WSTRB[0] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 0
	                hwac_data_reg26<=S_AXI_WDATA;
	              end
			  9'd27:
	              if ( S_AXI_WSTRB[0] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 0
	                hwac_data_reg27<=S_AXI_WDATA;
	              end
			  9'd28:
	              if ( S_AXI_WSTRB[0] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 0
	                hwac_data_reg28<=S_AXI_WDATA;
	              end
			  9'd29:
	              if ( S_AXI_WSTRB[0] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 0
	                hwac_data_reg29<=S_AXI_WDATA;
	              end
			  9'd30:
	              if ( S_AXI_WSTRB[0] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 0
	                hwac_data_reg30<=S_AXI_WDATA;
	              end
			  9'd31:
	              if ( S_AXI_WSTRB[0] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 0
	                hwac_data_reg31<=S_AXI_WDATA;
	              end
			  9'd32:
	              if ( S_AXI_WSTRB[0] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 0
	                hwac_data_reg32<=S_AXI_WDATA;
	              end
				  
	          9'd150:
	              if ( S_AXI_WSTRB[0] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 0
	                hwac_inputcontrol_reg1 <= S_AXI_WDATA;
	              end   

	          default : begin
	                      hwac_inputcontrol_reg1 <= hwac_inputcontrol_reg1;
	                     
	        
	                    end
	        endcase
	      end
	  end
	end 
    
    always @(*)
	begin
	      // Address decoding for reading registers
		  hwac_output_result_reg1<={16'b0,crc_result_reg};
	      case ( axi_araddr )
	        9'd0   : reg_data_out <= hwac_data_reg0;
			9'd1   : reg_data_out <= hwac_data_reg1;
			9'd2   : reg_data_out <= hwac_data_reg2;
	        9'd3   : reg_data_out <= hwac_data_reg3;
			9'd4   : reg_data_out <= hwac_data_reg4;
			9'd5   : reg_data_out <= hwac_data_reg5;
			9'd6   : reg_data_out <= hwac_data_reg6;
			9'd7   : reg_data_out <= hwac_data_reg7;
			9'd8   : reg_data_out <= hwac_data_reg8;
	        9'd9   : reg_data_out <= hwac_data_reg9;
			9'd10   : reg_data_out <= hwac_data_reg10;
			9'd11   : reg_data_out <= hwac_data_reg11;
			9'd12   : reg_data_out <= hwac_data_reg12;
			9'd13   : reg_data_out <= hwac_data_reg13;
			9'd14   : reg_data_out <= hwac_data_reg14;
	        9'd15   : reg_data_out <= hwac_data_reg15;
			9'd16   : reg_data_out <= hwac_data_reg16;
			9'd17   : reg_data_out <= hwac_data_reg17;
			9'd18   : reg_data_out <= hwac_data_reg18;
			9'd19   : reg_data_out <= hwac_data_reg19;
			9'd20  : reg_data_out <= hwac_data_reg20;
	        9'd21   : reg_data_out <= hwac_data_reg21;
			9'd22   : reg_data_out <= hwac_data_reg22;
			9'd23   : reg_data_out <= hwac_data_reg23;
			9'd24   : reg_data_out <= hwac_data_reg24;
			9'd25   : reg_data_out <= hwac_data_reg25;
			9'd26   : reg_data_out <= hwac_data_reg26;
	        9'd27   : reg_data_out <= hwac_data_reg27;
			9'd28   : reg_data_out <= hwac_data_reg28;
			9'd29   : reg_data_out <= hwac_data_reg29;
			9'd30   : reg_data_out <= hwac_data_reg30;
			9'd31   : reg_data_out <= hwac_data_reg31;
			9'd32   : reg_data_out <= hwac_data_reg32;

	        9'd160   : reg_data_out <= hwac_output_result_reg1;

	        default : reg_data_out <= 0;
	      endcase
	end	
	
        always @(*)
	begin
	      // Address decoding for reading registers
		
	      case ( address )
	        9'd0   : reg_data_c_out <=  hwac_data_reg0;
			9'd1   : reg_data_c_out <=  hwac_data_reg1;
			9'd2   : reg_data_c_out <=  hwac_data_reg2;
	        9'd3   : reg_data_c_out <=  hwac_data_reg3;
			9'd4   : reg_data_c_out <=  hwac_data_reg4;
			9'd5   : reg_data_c_out <=  hwac_data_reg5;
			9'd6   : reg_data_c_out <=  hwac_data_reg6;
			9'd7   : reg_data_c_out <=  hwac_data_reg7;
			9'd8   : reg_data_c_out <=  hwac_data_reg8;
	        9'd9   : reg_data_c_out <=  hwac_data_reg9;
			9'd10   : reg_data_c_out <= hwac_data_reg10;
			9'd11   : reg_data_c_out <= hwac_data_reg11;
			9'd12   : reg_data_c_out <= hwac_data_reg12;
			9'd13   : reg_data_c_out <= hwac_data_reg13;
			9'd14   : reg_data_c_out <= hwac_data_reg14;
	        9'd15   : reg_data_c_out <= hwac_data_reg15;
			9'd16   : reg_data_c_out <= hwac_data_reg16;
			9'd17   : reg_data_c_out <= hwac_data_reg17;
			9'd18   : reg_data_c_out <= hwac_data_reg18;
			9'd19   : reg_data_c_out <= hwac_data_reg19;
			9'd20  : reg_data_c_out <=  hwac_data_reg20;
	        9'd21   : reg_data_c_out <= hwac_data_reg21;
			9'd22   : reg_data_c_out <= hwac_data_reg22;
			9'd23   : reg_data_c_out <= hwac_data_reg23;
			9'd24   : reg_data_c_out <= hwac_data_reg24;
			9'd25   : reg_data_c_out <= hwac_data_reg25;
			9'd26   : reg_data_c_out <= hwac_data_reg26;
	        9'd27   : reg_data_c_out <= hwac_data_reg27;
			9'd28   : reg_data_c_out <= hwac_data_reg28;
			9'd29   : reg_data_c_out <= hwac_data_reg29;
			9'd30   : reg_data_c_out <= hwac_data_reg30;
			9'd31   : reg_data_c_out <= hwac_data_reg31;
			9'd32   : reg_data_c_out <= hwac_data_reg32; 

	        default : reg_data_c_out <= 0;
	      endcase
	end	
	
	 always @(posedge S_AXI_ACLK )begin
	
		if(S_AXI_ARESETN == 1'b0)begin
			state_var <= {STATE_WIDTH*{1'b0}};
			
			bit_stream_reg<=1024'b0;
			bit_stream_reg1<=1024'b0;
			current_counter <=10'b0;
			data_out_reg<=8'b0;
			address <={C_S_AXI_ADDR_WIDTH*{1'b0}};
			crc_cal_enable_out<=1'b0;
		end
		else begin
		   case (state_var)
		  STATE_INIT:begin
		    if(hwac_inputcontrol_reg1[10]==1'b1)begin
				state_var<=STATE_MAKE_BITSTREAM;
			end
			else begin
				state_var<=STATE_INIT;
			end
		  end
		  STATE_MAKE_BITSTREAM:begin
		  
		    if(current_counter%2==0) begin
				bit_stream_reg<={bit_stream_reg1[32+:992],reg_data_c_out};
				bit_stream_reg1<=bit_stream_reg<<32;
				current_counter<=current_counter+1;
			end
		    else if(current_counter < 2*hwac_inputcontrol_reg1[0+:10]-1)begin
			   // data_out_reg<=byte_ram[address];
				bit_stream_reg<={bit_stream_reg1[32+:992],reg_data_c_out};
				current_counter<=current_counter+1;
				bit_stream_reg1<=bit_stream_reg<<32;
				address<=address+1;
				
			end
			else begin
				state_var<=STATE_START_CRC_CALCULATION;
				address<={C_S_AXI_ADDR_WIDTH*{1'b0}};
				current_counter<=10'b0;
				bit_stream_out<=bit_stream_reg;
			end
		  end
		  STATE_START_CRC_CALCULATION:begin
		    if(!crc_cal_done_in)begin
				crc_cal_enable_out <=1'b1;
			end
			else begin
				state_var<=STATE_INIT;
				crc_cal_enable_out <=1'b0;
				crc_result_reg<=crc_result_in;
				bit_stream_reg<=1024'b0;
			    bit_stream_reg1<=1024'b0;
			end
		  end
		  
		  endcase 
		end
	end 
	// User logic ends

	endmodule
