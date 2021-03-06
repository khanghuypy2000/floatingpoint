module main(a,b,sel,s,overflow,underflow);
input[31:0] a,b;
input sel;
output reg[31:0] s;
output reg overflow,underflow;
wire[7:0] exo;
//wire siga, sigb;
wire[2:0] ctro;
wire alhb, cout2;
wire[7:0] numshift;
wire[23:0] shiftrout, swapoa, swapob;
wire[22:0] muxo1, muxo2; 
wire[24:0] signialu, neg2out;
wire[23:0] normalfracout;
wire[4:0] normalo;
wire c1,c3,dau;
wire[1:0] c2,c4;
wire[8:0] s1;
wire[22:0] s2, dinhtri_r;
wire[7:0] expo_r;
SmallAlu Smallalu1(a[30:23],b[30:23],numshift,alhb);
control controlu(alhb,ctro);
mux2_23b mux23_1(a[22:0],b[22:0],ctro[1],muxo1);
mux2_23b mux23_2(a[22:0],b[22:0],ctro[0],muxo2);
mux2_8b mux2_1(a[30:23],b[30:23],ctro[2],exo);
Shiftright Dichphai(numshift,{1'b1,muxo1},shiftrout);
Swap_ab Swap1(shiftrout,{1'b1,muxo2},alhb,swapoa,swapob);
//Bigalu alusignificant({1'b0,swapoa},{1'b0,swapob},sel,signialu,cout2);
add_csa csa1({1'b0,swapoa},{1'b0,swapob},sel,signialu,cout2);
bu2ifam bu2ifneg(signialu,neg2out);
normalize detectbit1(neg2out[24:1],normalo);
normalizeFrac normalfrac1(normalo,neg2out[24:1],normalfracout);
normalizeExpo normalexpo1(normalo,{1'b0,exo},s1);
assign s2=normalfracout[22:0];
Xacdinhdau Dau1(dau,sel,cout2,a[31],b[31]);
Rounding u7(s2,s1[7:0],dinhtri_r,expo_r);
check0 kt0(a[30:23],c1);
checkinf ktinf(a[30:23],a[22:0],c2);
check0 kt0_2(b[30:23],c3);
checkinf ktinf_2(b[30:23],b[22:0],c4);
always @(c1 or c2 or c3 or c4 or dau or expo_r or dinhtri_r or s1)
begin
case({c1,c2,c3,c4}) 
  7'b100000: begin s = b; end
  7'b000100: begin s = a; end
  7'b011000: begin s = 31'bx; end   //A: inf
  7'b001000: begin s = 31'bx; end   //A:NAN
  7'b000011: begin s = 31'bx; end   //B: inf 
  7'b000001: begin s = 31'bx; end    //B:NAN 
  7'b100100: begin s = 31'b0; end
  7'b011011: begin s = 31'bx; end
  7'b001001: begin s = 31'bx; end 
  default: 
  begin 
    if(s1<9'd0)
	     begin
	      underflow = 1'b1;
	      overflow = 1'b0;
	      s = 31'bx;
	      end
	    else if(s1>9'd254)
	      begin
	        underflow = 1'b0;
	        overflow = 1'b1;
	        s = 31'bx;
	      end
	    else
	      begin
	         underflow = 1'b0;
	         overflow = 1'b0;
	         s = {dau,expo_r,dinhtri_r};
	       end
  end
  endcase
end
endmodule