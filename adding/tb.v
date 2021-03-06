module tb;
parameter DATA_WIDTH = 32;
reg  t_sel;
reg [DATA_WIDTH-1:0]t_a;
reg [DATA_WIDTH-1:0]t_b;
wire [DATA_WIDTH-1:0]t_s;
wire t_underflow, t_overflow;
main DUT(.a(t_a),.b(t_b),.sel(t_sel),.s(t_s),.overflow(t_overflow),.underflow(t_underflow));
initial begin
 #0
 t_a = 32'b0_01110000_00101000000000000000000;
 t_b = 32'b0_00100101_00000000000000000000000;
 t_sel = 1'b1;
 #50
 t_a = 32'b0_10011111_11100000000100000000000;
 t_b = 32'b0_11101111_00100000000000000000000;
 t_sel = 1'b0;
#100 $finish;
end
endmodule