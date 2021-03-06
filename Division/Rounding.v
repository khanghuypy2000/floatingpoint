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

module add8b(a2, b2, ci2, s2, cout2);  // bo cong 8 bit
input[7:0] a2,b2;
input ci2; 
output[7:0] s2;
output cout2;
wire[6:0] w;
fadder fadder1(a2[0], b2[0], ci2, s2[0],w[0]);
fadder fadder2(a2[1], b2[1], w[0], s2[1],w[1]);
fadder fadder3(a2[2], b2[2], w[1], s2[2],w[2]);
fadder fadder4(a2[3], b2[3], w[2], s2[3],w[3]);
fadder fadder5(a2[4], b2[4], w[3], s2[4],w[4]);
fadder fadder6(a2[5], b2[5], w[4], s2[5],w[5]);
fadder fadder7(a2[6], b2[6], w[5], s2[6],w[6]);
fadder fadder8(a2[7], b2[7], w[6], s2[7],cout2);
endmodule

module add5b(a2, b2, ci2, s2, cout2);  // bo cong 8 bit
input[4:0] a2,b2;
input ci2; 
output[4:0] s2;
output cout2;
wire[3:0] w;
fadder fadder1(a2[0], b2[0], ci2, s2[0],w[0]);
fadder fadder2(a2[1], b2[1], w[0], s2[1],w[1]);
fadder fadder3(a2[2], b2[2], w[1], s2[2],w[2]);
fadder fadder4(a2[3], b2[3], w[2], s2[3],w[3]);
fadder fadder5(a2[4], b2[4], w[3], s2[4],cout2);
endmodule

module Rounding(X,exp,Y,expo);
input[22:0] X;
input[7:0] exp;
output[7:0] expo;
output[22:0] Y;
wire Cout, Cout1;
wire[23:0] t;
assign Y[17:0] = 18'b0;
add5b cong5b({1'b0,X[22:19]},5'b0,X[18],t[23:19],Cout);
add8b cong8b(exp,8'b0,t[23],expo,Cout1);
assign Y[22:19] = t[22:19];
assign Y[18]=1'b0;
endmodule	