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