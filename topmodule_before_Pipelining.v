module topmodule(input  [6:0] opcode,
    input clk,
    input  [6:0] funct7,
    input  [2:0] funct3,
    input [31:0]a,
    input [31:0]b,
    output reg [31:0]c);
    
    wire [3:0] alu_op;
    wire [31:0] alu_out;
    decoder dut(.funct7(funct7),.funct3(funct3),.opcode(opcode),.alu_op(alu_op));
    alu dut1(.a(a),.b(b),.alu_op(alu_op),.c(alu_out));
    
    always@(posedge clk)
    c <= alu_out;
    
endmodule
