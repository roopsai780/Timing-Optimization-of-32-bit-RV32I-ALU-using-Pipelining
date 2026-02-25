module topmodule(input  [6:0] opcode,
    input clk,
    input  [6:0] funct7,
    input  [2:0] funct3,
    input [31:0]a,
    input [31:0]b,
    output reg [31:0]c);
    
    wire [3:0] alu_op_wire;
    wire [31:0] alu_out;
    
    reg [3:0] alu_op_reg;
    reg [31:0] a_reg;
    reg [31:0] b_reg;
    
    decoder dut(.funct7(funct7),.funct3(funct3),.opcode(opcode),.alu_op(alu_op_wire));
    
    always @(posedge clk) 
    begin
        alu_op_reg <= alu_op_wire;
        a_reg      <= a;
        b_reg      <= b;
    end
    
    alu dut1(.a(a_reg),.b(b_reg),.alu_op(alu_op_reg),.c(alu_out));
    
    always@(posedge clk)
    c <= alu_out;
    
endmodule
