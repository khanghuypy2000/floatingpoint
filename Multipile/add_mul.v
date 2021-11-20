module mulab(x,y,fo);  //Nhan A voi 1 bit trong B
input[23:0] x;
input y;
output[47:0] fo;
wire[23:0] f;
and(f[0],x[0],y);
and(f[1],x[1],y);
and(f[2],x[2],y);
and(f[3],x[3],y);
and(f[4],x[4],y);
and(f[5],x[5],y);
and(f[6],x[6],y);
and(f[7],x[7],y);
and(f[8],x[8],y);
and(f[9],x[9],y);
and(f[10],x[10],y);
and(f[11],x[11],y);
and(f[12],x[12],y);
and(f[13],x[13],y);
and(f[14],x[14],y);
and(f[15],x[15],y);
and(f[16],x[16],y);
and(f[17],x[17],y);
and(f[18],x[18],y);
and(f[19],x[19],y);
and(f[20],x[20],y);
and(f[21],x[21],y);
and(f[22],x[22],y);
and(f[23],x[23],y);
assign fo = {24'b0,f};
endmodule

module Shiftleft48b(a,b,num);   //Dich trai, toi thieu 0 bit, dich toi da 24 bit
input[47:0] a;
input[4:0] num;
output reg[47:0] b;
always @(a or num)
begin
case(num)	
	5'b00000: b={24'b0,a[23:0]};
	5'b00001: b={23'b0,a[23:0],1'b0};
	5'b00010: b={22'b0,a[23:0],2'b0};
	5'b00011: b={21'b0,a[23:0],3'b0};
	5'b00100: b={20'b0,a[23:0],4'b0};
	5'b00101: b={19'b0,a[23:0],5'b0};
	5'b00110: b={18'b0,a[23:0],6'b0};
	5'b00111: b={17'b0,a[23:0],7'b0};
	5'b01000: b={16'b0,a[23:0],8'b0};
	5'b01001: b={15'b0,a[23:0],9'b0};
	5'b01010: b={14'b0,a[23:0],10'b0};
	5'b01011: b={13'b0,a[23:0],11'b0};
	5'b01100: b={12'b0,a[23:0],12'b0};
	5'b01101: b={11'b0,a[23:0],13'b0};
	5'b01110: b={10'b0,a[23:0],14'b0};
	5'b01111: b={9'b0,a[23:0],15'b0};
	5'b10000: b={8'b0,a[23:0],16'b0};
	5'b10001: b={7'b0,a[23:0],17'b0};
	5'b10010: b={6'b0,a[23:0],18'b0};
	5'b10011: b={5'b0,a[23:0],19'b0};
	5'b10100: b={4'b0,a[23:0],20'b0};
	5'b10101: b={3'b0,a[23:0],21'b0};
	5'b10110: b={3'b0,a[23:0],22'b0};
	5'b10111: b={1'b0,a[23:0],23'b0};
	5'b11000: b={a[23:0],24'b0};
	default: b=24'b0;   ///cac th dich 25 den 48 bit thi xem như bang 0 het vi phep nhan chi can dich toi da 24 bit
endcase
end
endmodule

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

module add48b(X,Y,C,S);  // bo cong 48bit
input[47:0] X,Y;
input C;
output[48:0] S;
wire Co;
wire[5:0] n;
add8b add48b1(X[7:0],Y[7:0],C,S[7:0],n[0]);
add8b add48b2(X[15:8],Y[15:8],n[0],S[15:8],n[1]);
add8b add48b3(X[23:16],Y[23:16],n[1],S[23:16],n[2]);
add8b add48b4(X[31:24],Y[31:24],n[2],S[31:24],n[3]);
add8b add48b5(X[39:32],Y[39:32],n[3],S[39:32],n[4]);
add8b add48b6(X[47:40],Y[47:40],n[4],S[47:40],Co);
assign S[48] = Co;
endmodule

module add_mul(A,B,M);
input[23:0] A,B;
output[47:0] M;
wire [47:0] z0,z1,z2,z3,z4,z5,z6,z7,z8,z9,z10,z11,z12,z13,z14,z15,z16,z17,z18,z19,z20,z21,z22,z23,z24;
wire [47:0] t1,t2,t3,t4,t5,t6,t7,t8,t9,t10,t11,t12,t13,t14,t15,t16,t17,t18,t19,t20,t21,t22,t23;
wire [48:0] h1,h2,h3,h4,h5,h6,h7,h8,h9,h10,h11,h12,h13,h14,h15,h16,h17,h18,h19,h20,h21,h22,h23;
mulab mulab0(A,B[0],z0);
mulab mulab1(A,B[1],z1);
mulab mulab2(A,B[2],z2);
mulab mulab3(A,B[3],z3);
mulab mulab4(A,B[4],z4);
mulab mulab5(A,B[5],z5);
mulab mulab6(A,B[6],z6);
mulab mulab7(A,B[7],z7);
mulab mulab8(A,B[8],z8);
mulab mulab9(A,B[9],z9);
mulab mulab10(A,B[10],z10);
mulab mulab11(A,B[11],z11);
mulab mulab12(A,B[12],z12);
mulab mulab13(A,B[13],z13);
mulab mulab14(A,B[14],z14);
mulab mulab15(A,B[15],z15);
mulab mulab16(A,B[16],z16);
mulab mulab17(A,B[17],z17);
mulab mulab18(A,B[18],z18);
mulab mulab19(A,B[19],z19);
mulab mulab20(A,B[20],z20);
mulab mulab21(A,B[21],z21);
mulab mulab22(A,B[22],z22);
mulab mulab23(A,B[23],z23);

Shiftleft48b dich1b(z1,t1,5'b00001);
Shiftleft48b dich2b(z2,t2,5'b00010);
Shiftleft48b dich3b(z3,t3,5'b00011);
Shiftleft48b dich4b(z4,t4,5'b00100);
Shiftleft48b dich5b(z5,t5,5'b00101);
Shiftleft48b dich6b(z6,t6,5'b00110);
Shiftleft48b dich7b(z7,t7,5'b00111);
Shiftleft48b dich8b(z8,t8,5'b01000);
Shiftleft48b dich9b(z9,t9,5'b01001);
Shiftleft48b dich10b(z10,t10,5'b01010);
Shiftleft48b dich11b(z11,t11,5'b01011);
Shiftleft48b dich12b(z12,t12,5'b01100);
Shiftleft48b dich13b(z13,t13,5'b01101);
Shiftleft48b dich14b(z14,t14,5'b01110);
Shiftleft48b dich15b(z15,t15,5'b01111);
Shiftleft48b dich16b(z16,t16,5'b10000);
Shiftleft48b dich17b(z17,t17,5'b10001);
Shiftleft48b dich18b(z18,t18,5'b10010);
Shiftleft48b dich19b(z19,t19,5'b10011);
Shiftleft48b dich20b(z20,t20,5'b10100);
Shiftleft48b dich21b(z21,t21,5'b10101);
Shiftleft48b dich22b(z22,t22,5'b10110);
Shiftleft48b dich23b(z23,t23,5'b10111);

add48b cong48b1(z0,t1,1'b0,h1);
add48b cong48b2(h1[47:0],t2,1'b0,h2);
add48b cong48b3(h2[47:0],t3,1'b0,h3);
add48b cong48b4(h3[47:0],t4,1'b0,h4);
add48b cong48b5(h4[47:0],t5,1'b0,h5);
add48b cong48b6(h5[47:0],t6,1'b0,h6);
add48b cong48b7(h6[47:0],t7,1'b0,h7);
add48b cong48b8(h7[47:0],t8,1'b0,h8);
add48b cong48b9(h8[47:0],t9,1'b0,h9);
add48b cong48b10(h9[47:0],t10,1'b0,h10);
add48b cong48b11(h10[47:0],t11,1'b0,h11);
add48b cong48b12(h11[47:0],t12,1'b0,h12);
add48b cong48b13(h12[47:0],t13,1'b0,h13);
add48b cong48b14(h13[47:0],t14,1'b0,h14);
add48b cong48b15(h14[47:0],t15,1'b0,h15);
add48b cong48b16(h15[47:0],t16,1'b0,h16);
add48b cong48b17(h16[47:0],t17,1'b0,h17);
add48b cong48b18(h17[47:0],t18,1'b0,h18);
add48b cong48b19(h18[47:0],t19,1'b0,h19);
add48b cong48b20(h19[47:0],t20,1'b0,h20);
add48b cong48b21(h20[47:0],t21,1'b0,h21);
add48b cong48b22(h21[47:0],t22,1'b0,h22);
add48b cong48b23(h22[47:0],t23,1'b0,M);
//assign M = h23[48:25];
endmodule
