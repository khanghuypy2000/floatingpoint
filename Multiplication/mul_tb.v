module mul_tb;
parameter DATA_WIDTH = 32;
reg [DATA_WIDTH-1:0]t_a;
reg [DATA_WIDTH-1:0]t_b;
wire [DATA_WIDTH-1:0]t_m;
wire t_underflow, t_overflow;
mul_main DUT(.a(t_a),.b(t_b),.m(t_m),.overflow(t_overflow),.underflow(t_underflow));
initial begin
 #0
 t_a = 32'b00111000000101000000000000000000;
 t_b = 32'b00010010100000000000000000000000;
 #50
 t_a = 32'b01001111111100000000100000000000;
 t_b = 32'b01110111100100000000000000000000;

#100 $finish;
end
endmodule
