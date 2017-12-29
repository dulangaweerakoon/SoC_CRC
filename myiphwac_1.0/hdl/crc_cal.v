`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ENTC - UOM
// Engineer: D.H. Gunasinghe
// 
// Create Date: 12/21/2017 03:05:01 PM
// Design Name: 
// Module Name: CRC
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module CRC(
  input [23:0] data_in,
  input crc_en,
  output [15:0] crc_out,
  output crcdone,
  input rst,
  input clk);

  reg [15:0] lfsr;
  reg crcin;
  reg crcdone;
  reg [10:0] counter;
  //reg [10:0] precounter;
  reg [2:0] state;
  reg [23:0] data;
  reg [15:0] crc_out;

  always @(posedge clk, posedge rst) begin
    if(rst) begin
      lfsr <= {16{1'b0}};
      crcin <= 0;
      counter <= {11{1'b0}};
      //precounter <= {11{1'b0}};
      state <= 3'b000;
      crcdone <= 0;
      data <= {24{1'b0}};
      crc_out <= {16{1'b0}};
    end
    else begin  
      case (state)
        3'b000: begin
                    crcin <= crc_en;
                    counter <= {11{1'b0}};
                    if (crcin) begin
                        state <= 3'b001;
                        data <= data_in;
                    end
                end
        3'b001: begin
                    //lfsr_q <= crcin ? lfsr_c : lfsr_q;
                    counter <= counter+1;
                    //precounter <= counter;
                    data[23:1] <= data[22:0];
                    lfsr[0]  <= data[23] ^ lfsr[15];
                    lfsr[1]  <= lfsr[0];
                    lfsr[2]  <= lfsr[1];
                    lfsr[3]  <= lfsr[2];
                    lfsr[4]  <= lfsr[3];
                    lfsr[5]  <= lfsr[4] ^ data[23] ^ lfsr[15];
                    lfsr[6]  <= lfsr[5];
                    lfsr[7]  <= lfsr[6];
                    lfsr[8]  <= lfsr[7];
                    lfsr[9]  <= lfsr[8];
                    lfsr[10] <= lfsr[9];
                    lfsr[11] <= lfsr[10];
                    lfsr[12] <= lfsr[11] ^ data[23] ^ lfsr[15];
                    lfsr[13] <= lfsr[12];
                    lfsr[14] <= lfsr[13];
                    lfsr[15] <= lfsr[14];
                    if(counter == 11'b00000010111) begin
                      crcin <= 0;
                      state <= 3'b010;
                    end
                end
        3'b010: begin
                    crcdone <= 1;
                    state <= 3'b011;
                    crc_out <= lfsr;
                    counter <= {11{1'b0}};                    
                end 
        3'b011: begin
                    counter <= counter+1;
                    if(counter == 11'b00000000011) begin         
                        crcdone <= 0;
                        lfsr <= {16{1'b0}};
                        data <= {24{1'b0}};
                        state <= 3'b000;
                    end
                end
      endcase
    end
  end // always  
endmodule //CRC
