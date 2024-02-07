// Code your testbench here
// or browse Examples
// Code your testbench here
// or browse Examples
module ALU_tb;
import CPU_package::*;
  reg [DATA_WIDTH-1:0] 	in_a;
  reg [DATA_WIDTH-1:0] 	in_b;
  reg					          input_carry;
  enum_alu_opcode_t 	  alu_opcode;
  reg 				          alu_mode;
  wire [DATA_WIDTH-1:0] alu_out;
  struct_alu_flag_t 	  alu_out_flag; 

  ALU alu(
    		    .in_a(in_a),
            .in_b(in_b),
            .input_carry(input_carry),
            .alu_opcode(alu_opcode),
        		.alu_mode(alu_mode),
        		.alu_out(alu_out),
        		.alu_out_flag(alu_out_flag)
  );
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    in_a=0;
    in_b=0;
    alu_mode=0;
    input_carry=0;
  end
  
  initial begin
    alu_mode=0;
    in_a=1;
    in_b=0;
    alu_opcode=ALU_OP_AND;
    #20
    alu_mode=0;
    in_a=1;
    in_b=1;
    alu_opcode=ALU_OP_AND;
    #20
    alu_mode=0;
    in_a=1;
    in_b=0;
    alu_opcode=ALU_OP_OR;
    #20
    alu_mode=0;
    in_a=16'd2;
    in_b=16'd2;
    alu_opcode=ALU_OP_CPR;
    #20
    alu_mode=0;
    in_a=16'd20;
    in_b=16'd10;
    alu_opcode=ALU_OP_CPR;
    #20
    alu_mode=0;
    in_a=16'd2;
    in_b=16'd10;
    alu_opcode=ALU_OP_CPR;
    #20
    in_a=0;
    in_b=0;
    alu_mode=1;
    #5
    alu_mode=1;
    alu_opcode=ALU_OP_ADD;
    for (int i=0;i<16;i=i+1) begin
      #20
      in_a=i;
      in_b=0;
      for(int j=0;j<9;j=j+1) begin
        #10
        in_b=j;
      end
    end
    #20
    alu_mode=1;
    in_a=16'd4;
    alu_opcode=ALU_OP_SHR;
    #20
    alu_mode=1;
    in_a=16'd4;
    alu_opcode=ALU_OP_SHL;
    #20
    $finish;
  end
endmodule
    
    
