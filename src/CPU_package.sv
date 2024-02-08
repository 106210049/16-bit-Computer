package CPU_package;
  localparam DATA_WIDTH=16;
  localparam ADDRESS_WIDTH=8;
  localparam ADDRESS_MAX_WIDTH=2<<ADDRESS_WIDTH;

// ALU
localparam ALU_OPCODE=4;
typedef enum logic [ALU_OPCODE-1:0]{
      ALU_OP_ADD
    , ALU_OP_SUB
  	, ALU_OP_DIV
  	, ALU_OP_MUL
    , ALU_OP_INC
    , ALU_OP_DEC
    , ALU_OP_SHL
    , ALU_OP_SHR
    , ALU_OP_CPR
    , ALU_OP_AND
    , ALU_OP_OR
    , ALU_OP_XOR
    , ALU_OP_NOTA
  	, ALU_OP_NOTB
}enum_alu_opcode_t;

localparam ALU_FLAG_WIDTH = 5;
typedef struct packed {
    logic carry ;
    logic zero  ;
    logic equal ; // a=b
    logic larger; // a>b
    logic lower; // a<b
} struct_alu_flag_t;

endpackage: CPU_package
