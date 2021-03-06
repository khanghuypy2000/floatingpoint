module fadder(x, y, cin, s, cout);
input x, y, cin;
output s, cout;
wire m1,m2,m3;
xor(m1,x,y);
xor(s,cin,m1);
and(m2,cin,m1);
and(m3,x,y);
or(cout,m3,m2);
endmodule

module add9b(a2, b2, ci2, s2, cout2); 
input[8:0] a2,b2;
input ci2; 
output[8:0] s2;
output cout2;
wire[7:0] w;
wire[8:0] t;
xor(t[0], b2[0], ci2);
xor(t[1], b2[1], ci2);
xor(t[2], b2[2], ci2);
xor(t[3], b2[3], ci2);
xor(t[4], b2[4], ci2);
xor(t[5], b2[5], ci2); 
xor(t[6], b2[6], ci2);
xor(t[7], b2[7], ci2);
xor(t[8], b2[8], ci2);
fadder fadder1(a2[0], t[0], ci2, s2[0],w[0]);
fadder fadder2(a2[1], t[1], w[0], s2[1],w[1]);
fadder fadder3(a2[2], t[2], w[1], s2[2],w[2]);
fadder fadder4(a2[3], t[3], w[2], s2[3],w[3]);
fadder fadder5(a2[4], t[4], w[3], s2[4],w[4]);
fadder fadder6(a2[5], t[5], w[4], s2[5],w[5]);
fadder fadder7(a2[6], t[6], w[5], s2[6],w[6]);
fadder fadder8(a2[7], t[7], w[6], s2[7],w[7]);
fadder fadder9(a2[8], t[8], w[7], s2[8],cout2);
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
	not(n0[7], x2[8]);
	add9b add1(n0[8:0],9'd1,1'b0,y2[8:0],Cout2);         
endmodule 

module mux2_9b(a3, b3, s3, f3);
input[8:0] a3, b3;
input s3;
output reg[8:0] f3;
always @(a3 or b3 or s3) 
begin
	if(s3)
		f3 = a3; 
	else 
		f3 = b3;
end
endmodule

module sub_exp(x,y,z);
input[8:0] x,y;
output[8:0] z;
wire c;
wire[8:0] z1, z2;
add9b u1(x, y, 1'b1, z1, c);
bu2 u2(z1, z2);
mux2_9b u3(z1, z2, c, z);
endmodule

