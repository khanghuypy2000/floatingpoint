module tb;
parameter DATA_WIDTH = 32;
reg [DATA_WIDTH-1:0]t_a;
reg [DATA_WIDTH-1:0]t_b;
reg t_sel;
wire [DATA_WIDTH-1:0]t_s;
main DUT(.a(t_a),.b(t_b),.sel(t_sel),.s(t_s));
initial begin
 #0
 t_a = 32'b00001111110000100000111111000010;
 t_b = 32'b00101111101010001000101000010000;
 t_sel = 1'b0;
 #50
 t_a = 32'b01001111111100000000100000000000;
 t_b = 32'b01010111100100000000000000000000;
 t_sel = 1'b0;

#100 $finish;
end
endmodule
