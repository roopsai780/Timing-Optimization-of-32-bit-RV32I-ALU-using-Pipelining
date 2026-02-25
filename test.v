module testbench;

reg clk;
reg [6:0]opcode;
reg [6:0]funct7;
reg [2:0]funct3;
reg [31:0]a;
reg [31:0]b;
wire [31:0]c;

topmodule dut(.clk(clk),.opcode(opcode),.funct7(funct7),.funct3(funct3),.a(a),.b(b),.c(c));

always #5 clk = ~clk;

initial
begin
clk = 0;
$monitor("time = %0t;c = %0d",$time,c);
opcode = 7'b0110011; {funct7,funct3} = 10'b0000000000 ; a = 32'd45; b = 32'd45;


#10{funct7, funct3} = 10'b0100000000;  // SUB
#10; {funct7, funct3} = 10'b0000000111;  // AND
#10;{funct7, funct3} = 10'b0000000110;  // OR

#10 $finish;

end

endmodule
