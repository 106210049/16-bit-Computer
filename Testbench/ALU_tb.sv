// Code your testbench here
// or browse Examples
 `define          DELAY 20  
module ALU_tb;
import CPU_package::*;
  reg [DATA_WIDTH-1:0] 	in_a;
  reg [DATA_WIDTH-1:0] 	in_b;
  reg					input_carry;
  enum_alu_opcode_t 	alu_opcode;
  reg 				    alu_mode;
  wire [DATA_WIDTH-1:0] alu_out;
  struct_alu_flag_t 	alu_out_flag; 

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
    main;
    	   
    
  end
  task main;  
      fork  
            Start_Simulation;
        	testcase;
//         	endsimulation; 
      join  
 endtask  
  
  task Start_Simulation; begin
    	   $display("----------------------------------------------");  
           $display("------------------   -----------------------");  
           $display("----------- SIMULATION RESULT ----------------");  
           $display("--------------       -------------------");  
           $display("----------------     ---------------------");  
           $display("----------------------------------------------");  
  	end
  endtask
  
  task testcase; begin
    alu_mode=1;
    in_a=1;
    in_b=0;
    alu_opcode=ALU_OP_AND;
   	display_result_Simulation;
    #`DELAY
    alu_mode=0;
    in_a=1;
    in_b=1;
    alu_opcode=ALU_OP_AND;
    display_result_Simulation;
    #`DELAY
    alu_mode=1;
    in_a=1;
    in_b=0;
    alu_opcode=ALU_OP_OR;
    display_result_Simulation;
    #`DELAY
    alu_mode=1;
    in_a=16'd2;
    in_b=16'd2;
    alu_opcode=ALU_OP_CPR;
    display_result_Simulation;
    #`DELAY
    alu_mode=1;
    in_a=16'd20;
    in_b=16'd10;
    alu_opcode=ALU_OP_CPR;
    display_result_Simulation;
    #`DELAY
    alu_mode=1;
    in_a=16'd2;
    in_b=16'd10;
    alu_opcode=ALU_OP_CPR;
    display_result_Simulation;
    #`DELAY
    in_a=0;
    in_b=0;
    alu_mode=0;
    display_result_Simulation;
    #(`DELAY/2)
    alu_mode=0;
    alu_opcode=ALU_OP_ADD;
    for (int i=0;i<16;i=i+1) begin
     #`DELAY
      in_a=i;
      in_b=0;
      for(int j=0;j<9;j=j+1) begin
        #`DELAY
        in_b=j;
        display_result_Simulation;
      end
    end
    #`DELAY
    alu_mode=0;
    in_a=16'd4;
    alu_opcode=ALU_OP_SHR;
    display_result_Simulation;
    #`DELAY
    alu_mode=0;
    in_a=16'd4;
    alu_opcode=ALU_OP_SHL;
    display_result_Simulation;
    #`DELAY
    alu_mode=0;
    in_a=16'd2;
    in_b=16'd2;
    alu_opcode=ALU_OP_MUL;
    display_result_Simulation;
    #`DELAY
    alu_mode=0;
    in_a=16'd10;
    in_b=16'd2;
    alu_opcode=ALU_OP_DIV;
    display_result_Simulation;
    #`DELAY
    endsimulation; 
  end
 endtask
    
  task display_result_Simulation;	begin
    $monitor("TIME = %d, in_a = %d,	in_b = %d, alu_mode = %b, alu_opcode = %b , alu_out = %d , alu_out_flag = %5b",$time, in_a, in_b, alu_mode, alu_opcode, alu_out, alu_out_flag);  
  end
  endtask
    
    task endsimulation;  
      begin  
           $display("-------------- THE SIMUALTION FINISHED ------------");  
           $finish;  
      end  
 endtask  
endmodule
    
