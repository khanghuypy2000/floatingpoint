module main_div(a,b,m,overflow,underflow);     //a: so bi chia, b: so chia
input[31:0] a,b;
output reg[31:0] m;
output reg overflow,underflow;
wire[8:0] exp_o,newexp;
wire[7:0] expo_r;
wire[23:0] div_o;
wire[4:0] normalize_o;
wire[23:0] dinhtri_o;
wire[22:0] dinhtri_r;
wire c1,c3,s1, cout;
wire[1:0] c2,c4;
sub_exp u1({1'b0,a[30:23]},{1'b0,b[30:23]},exp_o);
divsignifician u2({1'b1,a[22:0]},{1'b1,b[22:0]},div_o);
normalize u3(div_o,normalize_o);
normalizeExpo u4(normalize_o,exp_o,newexp);
normalizeFrac u5(normalize_o,div_o,dinhtri_o);
Rounding u7(dinhtri_o[22:0],newexp[7:0],dinhtri_r,expo_r);
check0 kt0(a[30:23],c1);
checkinf ktinf(a[30:23],a[22:0],c2);
check0 kt0_2(b[30:23],c3);
checkinf ktinf_2(b[30:23],b[22:0],c4);
xor(s1,a[31],b[31]);
always @(c1 or c2 or c3 or c4 or s1 or expo_r or dinhtri_r)
begin
case({c1,c2,c3,c4}) 
  7'b100000: begin m = 31'b0; end
  7'b000100: begin m = 31'bx; end
  7'b011000: begin m = 31'bx; end   //A: inf
  7'b001000: begin m = 31'bx; end   //A:NAN
  7'b000011: begin m = 31'b0; end   //B: inf 
  7'b000001: begin m = 31'bx; end    //B:NAN 
  7'b100100: begin m = 31'bx; end
  7'b011011: begin m = 31'bx; end
  7'b001001: begin m = 31'bx; end 
  7'b110010: begin m = 31'b0; end 
  7'b010110: begin m = 31'bx; end
  7'b110110: begin m = 31'bx; end 
  7'b110000: begin m = 31'b0; end 
  7'b000110: begin m = 31'bx; end
  7'b110100: begin m = 31'bx; end 
  7'b100010: begin m = 31'b0; end 
  7'b010100: begin m = 31'bx; end
  7'b100110: begin m = 31'bx; end   
  default: 
  begin 
    if(newexp<9'd0)
	     begin
	      underflow = 1'b1;
	      overflow = 1'b0;
	      m = 31'bx;
	      end
	    else if(newexp>9'd254)
	      begin
	        underflow = 1'b0;
	        overflow = 1'b1;
	        m = 31'bx;
	      end
	    else
	      begin
	         underflow = 1'b0;
	         overflow = 1'b0;
	         m = {s1,expo_r,dinhtri_r};
	       end
  end
  endcase
end
endmodule
