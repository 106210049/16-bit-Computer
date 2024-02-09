// Code your design here
// `include"CPU_package.sv"
import CPU_package::*;
module Data_Memory 

(
  input Write_clock,
  input [ADDRESS_WIDTH-1:0] DM_address,
  input wire Write_Enable,
  input [DATA_WIDTH-1:0] DATA_WRITE,
  input Read_clock,
  input wire Read_Enable,
  output reg [DATA_WIDTH-1:0] DATA_READ
);
  
  reg [DATA_WIDTH-1:0] Memories [ADDRESS_MAX_WIDTH];
  
  always@(posedge Write_clock)
    begin
      if(Write_Enable) begin
        Memories[DM_address]<=DATA_WRITE;
      end
    end
  
  always@(posedge Read_clock)	begin
    if(Read_Enable)	begin
      DATA_READ<=Memories[DM_address];
    end
  end
endmodule
