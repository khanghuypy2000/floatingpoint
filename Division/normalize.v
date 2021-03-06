module Det1(x,y,z,t);
input x,y;
output z,t;
wire n;
and(z,x,y);
not(n,y);
and(t,x,n);
endmodule

module Detectb1(a,b);
input[23:0] a;
output[23:0] b;
wire m[23:1];
assign b[23]=a[23];
not(m1,a[23]);
Det1 s1(m1,a[22],b[22],m2);
Det1 s2(m2,a[21],b[21],m3);
Det1 s3(m3,a[20],b[20],m4);
Det1 s4(m4,a[19],b[19],m5);
Det1 s5(m5,a[18],b[18],m6);
Det1 s6(m6,a[17],b[17],m7);
Det1 s7(m7,a[16],b[16],m8);
Det1 s8(m8,a[15],b[15],m9);
Det1 s9(m9,a[14],b[14],m10);
Det1 s10(m10,a[13],b[13],m11);
Det1 s11(m11,a[12],b[12],m12);
Det1 s12(m12,a[11],b[11],m13);
Det1 s13(m13,a[10],b[10],m14);
Det1 s14(m14,a[9],b[9],m15);
Det1 s15(m15,a[8],b[8],m16);
Det1 s16(m16,a[7],b[7],m17);
Det1 s17(m17,a[6],b[6],m18);
Det1 s18(m18,a[5],b[5],m19);
Det1 s19(m19,a[4],b[4],m20);
Det1 s20(m20,a[3],b[3],m21);
Det1 s21(m21,a[2],b[2],m22);
Det1 s22(m22,a[1],b[1],m23);
and(b[0],a[0],m23);
endmodule

module log2detc(A,Z);
input[23:0] A;
output [4:0] Z;
or(Z[0],A[1],A[3],A[5],A[7],A[9],A[11],A[13],A[15],A[17],A[19],A[21],A[23]);
or(Z[1],A[2],A[3],A[6],A[7],A[10],A[11],A[14],A[15],A[18],A[19],A[22],A[23]);
or(Z[2],A[4],A[5],A[6],A[7],A[12],A[13],A[14],A[15],A[20],A[21],A[22],A[23]);
or(Z[3],A[8],A[9],A[10],A[11],A[12],A[13],A[14],A[15]);
or(Z[4],A[16],A[17],A[18],A[19],A[20],A[21],A[22],A[23]);
endmodule

module fadder(x1, y1, cin, s, cout);
input x1, y1, cin;
output s, cout;
wire m1,m2,m3;
xor(m1,x1,y1);
xor(s,cin,m1);
and(m2,cin,m1);
and(m3,x1,y1);
or(cout,m3,m2);
endmodule

module add5b(a2, b2, ci2, s2, cout2); 
input[4:0] a2,b2;
input ci2; 
output[4:0] s2;
output cout2;
wire[3:0] w;
wire[4:0] t;
xor(t[0], b2[0], ci2);
xor(t[1], b2[1], ci2);
xor(t[2], b2[2], ci2);
xor(t[3], b2[3], ci2);
xor(t[4], b2[4], ci2);
fadder fadder1(a2[0], t[0], ci2, s2[0],w[0]);
fadder fadder2(a2[1], t[1], w[0], s2[1],w[1]);
fadder fadder3(a2[2], t[2], w[1], s2[2],w[2]);
fadder fadder4(a2[3], t[3], w[2], s2[3],w[3]);
fadder fadder5(a2[4], t[4], w[3], s2[4],cout2);
endmodule

module normalize(X,Y);	
input[23:0] X;
output[4:0] Y;
wire[23:0] N;
wire[4:0] T;
wire Co;
Detectb1 Det1f(X,N);            //Ph??t hi???n s??? 1 ?????u ti??n, c??c s??? 1 sau n?? ?????u th??nh 0
log2detc logaritcs2(N,T);
add5b tru5b(5'd23,T,1'b1,Y[4:0],Co);
endmodule