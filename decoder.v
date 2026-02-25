module decoder(    input  [6:0] opcode,
    input  [6:0] funct7,
    input  [2:0] funct3,
    output reg [3:0] alu_op);
    
    always @(*)
    begin
    alu_op = 4'b1111;
    case(opcode)
    7'b0110011 : begin
                    case({funct7,funct3})
                    10'b0000000000 : alu_op = 4'b0000;
                    10'b0100000000 : alu_op = 4'b0001;
                    10'b0000000100 : alu_op = 4'b0100;
                    10'b0000000110 : alu_op = 4'b0011;
                    10'b0000000111 : alu_op = 4'b0010;
                    10'b0000000001 : alu_op = 4'b0101;
                    10'b0000000101 : alu_op = 4'b0110;
                    10'b0100000101 : alu_op = 4'b0111;
                    10'b0000000010 : alu_op = 4'b1000;
                    default: alu_op = 4'b1111;
                    endcase 
                 end
     default: alu_op = 4'b1111;
     endcase
     end
    
    
    
endmodule
