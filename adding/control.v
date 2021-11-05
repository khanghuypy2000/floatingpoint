module control(alhb,data);
input alhb;   //alhb = 1 thì exponent A >= exponent B
output reg[2:0] data; //data[2]:muxExponent, data[1]:muxFraction1, data[2]:muxfraction2
always @(alhb)
begin
case(alhb)     
	1'b0: data=3'b010;  //=1, chọn A, =0 chọn B      
	1'b1: data=3'b101;
endcase  
end
endmodule