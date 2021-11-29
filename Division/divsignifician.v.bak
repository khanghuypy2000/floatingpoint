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

module addsub24b(A, B, C, S, cout2); 
input[23:0] A,B; 
output[23:0] S;
input C;
output cout2;
wire[22:0] w;
wire[23:0] t;
xor(t[0], B[0], C);
xor(t[1], B[1], C);
xor(t[2], B[2], C);
xor(t[3], B[3], C);
xor(t[4], B[4], C);
xor(t[5], B[5], C); 
xor(t[6], B[6], C);
xor(t[7], B[7], C);
xor(t[8], B[8], C);
xor(t[9], B[9], C);
xor(t[10], B[10], C);
xor(t[11], B[11], C);
xor(t[12], B[12], C);
xor(t[13], B[13], C); 
xor(t[14], B[14], C);
xor(t[15], B[15], C);
xor(t[16], B[16], C);
xor(t[17], B[17], C);
xor(t[18], B[18], C);
xor(t[19], B[19], C);
xor(t[20], B[20], C);
xor(t[21], B[21], C); 
xor(t[22], B[22], C);
xor(t[23], B[23], C);
fadder fadder1(A[0], t[0], C, S[0],w[0]);
fadder fadder2(A[1], t[1], w[0], S[1],w[1]);
fadder fadder3(A[2], t[2], w[1], S[2],w[2]);
fadder fadder4(A[3], t[3], w[2], S[3],w[3]);
fadder fadder5(A[4], t[4], w[3], S[4],w[4]);
fadder fadder6(A[5], t[5], w[4], S[5],w[5]);
fadder fadder7(A[6], t[6], w[5], S[6],w[6]);
fadder fadder8(A[7], t[7], w[6], S[7],w[7]);
fadder fadder9(A[8], t[8], w[7], S[8],w[8]);
fadder fadder10(A[9], t[9], w[8], S[9],w[9]);
fadder fadder11(A[10], t[10], w[9], S[10],w[10]);
fadder fadder12(A[11], t[11], w[10], S[11],w[11]);
fadder fadder13(A[12], t[12], w[11], S[12],w[12]);
fadder fadder14(A[13], t[13], w[12], S[13],w[13]);
fadder fadder15(A[14], t[14], w[13], S[14],w[14]);
fadder fadder16(A[15], t[15], w[14], S[15],w[15]);
fadder fadder17(A[16], t[16], w[15], S[16],w[16]);
fadder fadder18(A[17], t[17], w[16], S[17],w[17]);
fadder fadder19(A[18], t[18], w[17], S[18],w[18]);
fadder fadder20(A[19], t[19], w[18], S[19],w[19]);
fadder fadder21(A[20], t[20], w[19], S[20],w[20]);
fadder fadder22(A[21], t[21], w[20], S[21],w[21]);
fadder fadder23(A[22], t[22], w[21], S[22],w[22]);
fadder fadder24(A[23], t[23], w[22], S[23],cout2);
endmodule

module addsub25b(A1, B1, C1, S1, cout1);
input[24:0] A1,B1;
input C1;
output[24:0] S1;
output cout1;
wire co1,t24;
xor(t24, B1[24], C1);
addsub24b congtru24b_1(A1[23:0],B1[23:0],C1,S1[23:0],co1);
fadder fadder25(A1[24],t24,co1,S1[24],cout1);
endmodule

module mux2_1b(a1, b1, s1, f1);   
input a1, b1, s1;
output f1;
wire m4,m5,m6;
	and(m5,s1,a1);
	not(m4,s1);
	and(m6,m4,b1);
	or(f1,m5,m6);
endmodule

module mux2_24b(a, b, s, f);
input[23:0] a, b;
input s;
output reg[23:0] f;
always @(a or b or s) 
begin
	if(s)
		f = a; 
	else 
		f = b;
end
endmodule

module mux2_25b(a3, b3, s3, f3);
input[23:0] a3, b3;
input s3;
output reg[23:0] f3;
always @(a3 or b3 or s3) 
begin
	if(s3)
		f3 = a3; 
	else 
		f3 = b3;
end
endmodule

module divsignifician(X, Y, T, Z);
input[23:0] X, Y;
output[47:0] T;
output[23:0] Z;
wire[23:0] c;
wire[23:0] n23;
wire[23:0] r23;
wire[24:0] n22,n21,n20,n19,n18,n17,n16,n15,n14,n13,n12,n11,n10,n9,n8,n7,n6,n5,n4,n3,n2,n1,n0;
wire[24:0] r22,r21,r20,r19,r18,r17,r16,r15,r14,r13,r12,r11,r10,r9,r8,r7,r6,r5,r4,r3,r2,r1,r0;
assign T = {X,23'b0};
addsub24b Tru1(X, Y, 1'b1, n23, c[23]); 
mux2_1b u1(1'b1,1'b0,c[23],Z[23]);   //X>Y--> ket qua tai bit 23 cua thuong bang 1, nguoc lai bang 0
mux2_24b v1(n23,X,c[23],r23);      // X>Y --> so du bang hieu X-Y, nguoc lai so du bang X

addsub25b Tru2({r23,1'b0},{1'b0,Y},1'b1,n22,c[22]);
mux2_1b u2(1'b1,1'b0,c[22],Z[22]);
mux2_25b v2(n22,{r23,1'b0},c[22],r22);

addsub25b Tru3({r22[23:0],1'b0},{1'b0,Y},1'b1,n21,c[21]);
mux2_1b u3(1'b1,1'b0,c[21],Z[21]);
mux2_25b v3(n21,{r22[23:0],1'b0},c[21],r21);

addsub25b Tru4({r21[23:0],1'b0},{1'b0,Y},1'b1,n20,c[20]);
mux2_1b u4(1'b1,1'b0,c[20],Z[20]);
mux2_25b v4(n20,{r21[23:0],1'b0},c[20],r20);

addsub25b Tru5({r20[23:0],1'b0},{1'b0,Y},1'b1,n19,c[19]);
mux2_1b u5(1'b1,1'b0,c[19],Z[19]);
mux2_25b v5(n19,{r20[23:0],1'b0},c[19],r19);

addsub25b Tru6({r19[23:0],1'b0},{1'b0,Y},1'b1,n18,c[18]);
mux2_1b u6(1'b1,1'b0,c[18],Z[18]);
mux2_25b v6(n18,{r19[23:0],1'b0},c[18],r18);

addsub25b Tru7({r18[23:0],1'b0},{1'b0,Y},1'b1,n17,c[17]);
mux2_1b u7(1'b1,1'b0,c[17],Z[17]);
mux2_25b v7(n17,{r18[23:0],1'b0},c[17],r17);

addsub25b Tru8({r17[23:0],1'b0},{1'b0,Y},1'b1,n16,c[16]);
mux2_1b u8(1'b1,1'b0,c[16],Z[16]);
mux2_25b v8(n16,{r17[23:0],1'b0},c[16],r16);

addsub25b Tru9({r16[23:0],1'b0},{1'b0,Y},1'b1,n15,c[15]);
mux2_1b u9(1'b1,1'b0,c[15],Z[15]);
mux2_25b v9(n15,{r16[23:0],1'b0},c[15],r15);

addsub25b Tru10({r15[23:0],1'b0},{1'b0,Y},1'b1,n14,c[14]);
mux2_1b u10(1'b1,1'b0,c[14],Z[14]);
mux2_25b v10(n14,{r15[23:0],1'b0},c[14],r14);

addsub25b Tru11({r14[23:0],1'b0},{1'b0,Y},1'b1,n13,c[13]);
mux2_1b u11(1'b1,1'b0,c[13],Z[13]);
mux2_25b v11(n13,{r14[23:0],1'b0},c[13],r13);

addsub25b Tru12({r13[23:0],1'b0},{1'b0,Y},1'b1,n12,c[12]);
mux2_1b u12(1'b1,1'b0,c[12],Z[12]);
mux2_25b v12(n12,{r13[23:0],1'b0},c[12],r12);

addsub25b Tru13({r12[23:0],1'b0},{1'b0,Y},1'b1,n11,c[11]);
mux2_1b u13(1'b1,1'b0,c[11],Z[11]);
mux2_25b v13(n11,{r12[23:0],1'b0},c[11],r11);

addsub25b Tru14({r11[23:0],1'b0},{1'b0,Y},1'b1,n10,c[10]);
mux2_1b u14(1'b1,1'b0,c[10],Z[10]);
mux2_25b v14(n10,{r11[23:0],1'b0},c[10],r10);

addsub25b Tru15({r10[23:0],1'b0},{1'b0,Y},1'b1,n9,c[9]);
mux2_1b u15(1'b1,1'b0,c[9],Z[9]);
mux2_25b v15(n9,{r10[23:0],1'b0},c[9],r9);

addsub25b Tru16({r9[23:0],1'b0},{1'b0,Y},1'b1,n8,c[8]);
mux2_1b u16(1'b1,1'b0,c[8],Z[8]);
mux2_25b v16(n8,{r9[23:0],1'b0},c[8],r8);

addsub25b Tru17({r8[23:0],1'b0},{1'b0,Y},1'b1,n7,c[7]);
mux2_1b u17(1'b1,1'b0,c[7],Z[7]);
mux2_25b v17(n7,{r8[23:0],1'b0},c[7],r7);

addsub25b Tru18({r7[23:0],1'b0},{1'b0,Y},1'b1,n6,c[6]);
mux2_1b u18(1'b1,1'b0,c[6],Z[6]);
mux2_25b v18(n6,{r7[23:0],1'b0},c[6],r6);

addsub25b Tru19({r6[23:0],1'b0},{1'b0,Y},1'b1,n5,c[5]);
mux2_1b u19(1'b1,1'b0,c[5],Z[5]);
mux2_25b v19(n5,{r6[23:0],1'b0},c[5],r5);

addsub25b Tru20({r5[23:0],1'b0},{1'b0,Y},1'b1,n4,c[4]);
mux2_1b u20(1'b1,1'b0,c[4],Z[4]);
mux2_25b v20(n4,{r5[23:0],1'b0},c[4],r4);

addsub25b Tru21({r4[23:0],1'b0},{1'b0,Y},1'b1,n3,c[3]);
mux2_1b u21(1'b1,1'b0,c[3],Z[3]);
mux2_25b v21(n3,{r4[23:0],1'b0},c[3],r3);

addsub25b Tru22({r3[23:0],1'b0},{1'b0,Y},1'b1,n2,c[2]);
mux2_1b u22(1'b1,1'b0,c[2],Z[2]);
mux2_25b v22(n2,{r3[23:0],1'b0},c[2],r2);

addsub25b Tru23({r2[23:0],1'b0},{1'b0,Y},1'b1,n1,c[1]);
mux2_1b u23(1'b1,1'b0,c[1],Z[1]);
mux2_25b v23(n1,{r2[23:0],1'b0},c[1],r1);

addsub25b Tru24({r1[23:0],1'b0},{1'b0,Y},1'b1,n0,c[0]);
mux2_1b u24(1'b1,1'b0,c[0],Z[0]);
mux2_25b v24(n0,{r1[23:0],1'b0},c[0],r0);
endmodule
