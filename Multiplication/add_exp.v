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

module add_exp(a2, b2, ci2, s2, cout2);  // bo cong 8 bit
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
