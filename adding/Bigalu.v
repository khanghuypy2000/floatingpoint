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

module Bigalu(A, B, C, S, cout2); 
input[24:0] A,B; 
output[24:0] S;
input C;
output cout2;
wire[23:0] w;
wire[24:0] t;
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
xor(t[24], B[24], C);
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
fadder fadder24(A[23], t[23], w[22], S[23],w[23]);
fadder fadder25(A[24], t[24], w[23], S[24],cout2);
endmodule
