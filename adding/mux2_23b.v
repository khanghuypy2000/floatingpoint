module mux2_23b(a,b,sel,f);
input[22:0] a,b;
input sel;
output reg[22:0] f;
always @(a or b or sel)
begin    
	if(sel)
		f = a;   //sel =1 thì f=a
	else 
		f = b;   //sel=0 thì f=b
end
endmodule
