module mux2_8b(a, b, s, f);
input[7:0] a, b;
input s;
output reg[7:0] f;
always @(a or b or s) 
begin
	if(s)
		f = a; 
	else 
		f = b;
end
endmodule
