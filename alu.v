module alu(alu_op,a,b,c);
input [3:0]alu_op;
input [31:0]a;
input [31:0]b;
output reg [31:0]c;

always@(*)
begin
case(alu_op)
    4'b0000 : c = a+b;
    4'b0001 : c = a-b;
    4'b0010 : c = a&b;
    4'b0011 : c = a|b;
    4'b0100 : c = a^b;
    4'b0101 : c = a<<b[4:0];
    4'b0110 : c = a>>b[4:0];
    4'b0111 : c = $signed(a) >>> b[4:0];
    4'b1000 : c = ($signed(a) < $signed(b))? 32'b1:32'b0;
    default: c = 32'b0;
    
endcase 
end
endmodule 