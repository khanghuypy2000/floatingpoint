module Swap_ab(a,b,alhb,aout,bout);
input[23:0] a,b;
input alhb;
output reg[23:0] aout, bout;
always @(alhb or a or b)
begin
if(alhb)
begin
		aout = b;
		bout = a;
end
else
begin 
	aout = a;
	bout = b;
end
end
endmodule