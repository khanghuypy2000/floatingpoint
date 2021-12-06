module fadder(xi, yi, cin, s, cout);
input xi, yi, cin;
output s, cout;
wire m1,m2,m3;
xor(m1,xi,yi);
xor(s,cin,m1);
and(m2,cin,m1);
and(m3,xi,yi);
or(cout,m3,m2);
endmodule

module add_sub_9b(a2, b2, ci2, s2, cout2);  // bo cong 8 bit
input[8:0] a2,b2; 
input ci2; 
output[8:0] s2;
output cout2;
wire[7:0] w;
fadder fadder1(a2[0], b2[0], ci2, s2[0],w[0]);
fadder fadder2(a2[1], b2[1], w[0], s2[1],w[1]);
fadder fadder3(a2[2], b2[2], w[1], s2[2],w[2]);
fadder fadder4(a2[3], b2[3], w[2], s2[3],w[3]);
fadder fadder5(a2[4], b2[4], w[3], s2[4],w[4]);
fadder fadder6(a2[5], b2[5], w[4], s2[5],w[5]);
fadder fadder7(a2[6], b2[6], w[5], s2[6],w[6]);
fadder fadder8(a2[7], b2[7], w[6], s2[7],w[7]);
fadder fadder9(a2[8], b2[8], w[7], s2[8],cout2);
endmodule

module mux2_9b(a,b,s,f);
input[8:0] a,b;
input s;
output reg[8:0] f;
always @(a or b or s) 
begin
	if(s)
		f = a; 
	else 
		f = b;
end
endmodule

module bu2(x2, y2);
input[8:0] x2;
output[8:0] y2;
wire[8:0] n0;
wire Cout2;
	not(n0[0], x2[0]);
	not(n0[1], x2[1]);
	not(n0[2], x2[2]);
	not(n0[3], x2[3]);
	not(n0[4], x2[4]);
	not(n0[5], x2[5]);
	not(n0[6], x2[6]);
	not(n0[7], x2[7]);
	not(n0[8], x2[8]);
	add8b add1(n0[8:0],9'd1,1'b0,y2[8:0],Cout2);         
endmodule  

module add_exp(x,y,z);
input[8:0] x,y;
output[8:0] z;
wire[1:0] c,c_o;
wire[8:0] n1,n2;
wire[8:0] x_b,y_b;
wire[8:0] x_t,y_t;
wire[8:0] f;
add_sub_9b u1(x,9'd127,1'b1,n1,c[0]);
bu2 u2(x, x_b);
mux2_9b u3(x,x_b,c[0],x_t);

add_sub_9b u8(y,9'd127,1'b1,n2,c[1]);
bu2 u4(y, y_b);
mux2_9b u5(y,y_b,c[1],y_t);

add_sub_9b u6(x_t,y_t,1'b0,f,c_o[0]);
add_sub_9b u7(f,9'd127,1'b0,z,c_o[1]);

endmodule