module hadder(x, y, s, c);  // bộ cộng bán phần
input x,y;
output s,c;
xor(s,x,y);
and(c,x,y);
endmodule

module inc1(a,s,cin,cout);   //bộ tăng 1
input[24:0] a;   
input cin;                 // Cin bằng 1 thì ngõ ra = ngõ vào + 1
wire[24:1] b;
output[24:0] s;
output cout;
hadder hadder1(a[0],cin,s[0],b[1]);
hadder hadder2(a[1],b[1],s[1],b[2]);
hadder hadder3(a[2],b[2],s[2],b[3]);
hadder hadder4(a[3],b[3],s[3],b[4]);
hadder hadder5(a[4],b[4],s[4],b[5]);
hadder hadder6(a[5],b[5],s[5],b[6]);
hadder hadder7(a[6],b[6],s[6],b[7]);
hadder hadder8(a[7],b[7],s[7],b[8]);
hadder hadder9(a[8],b[8],s[8],b[9]);
hadder hadder10(a[9],b[9],s[9],b[10]);
hadder hadder11(a[10],b[10],s[10],b[11]);
hadder hadder12(a[11],b[11],s[11],b[12]);
hadder hadder13(a[12],b[12],s[12],b[13]);
hadder hadder14(a[13],b[13],s[13],b[14]);
hadder hadder15(a[14],b[14],s[14],b[15]);
hadder hadder16(a[15],b[15],s[15],b[16]);
hadder hadder17(a[16],b[16],s[16],b[17]);
hadder hadder18(a[17],b[17],s[17],b[18]);
hadder hadder19(a[18],b[18],s[18],b[19]);
hadder hadder20(a[19],b[19],s[19],b[20]);
hadder hadder21(a[20],b[20],s[20],b[21]);
hadder hadder22(a[21],b[21],s[21],b[22]);
hadder hadder23(a[22],b[22],s[22],b[23]);
hadder hadder24(a[23],b[23],s[23],b[24]);
hadder hadder25(a[24],b[24],s[24],cout);
endmodule

module bu2ifam(A,B);
input[24:0] A;
output[24:0] B;
wire[24:0] t;
not(t[0],A[0]);
not(t[1],A[1]);
not(t[2],A[2]);
not(t[3],A[3]);
not(t[4],A[4]);
not(t[5],A[5]);
not(t[6],A[6]);
not(t[7],A[7]);
not(t[8],A[8]);
not(t[9],A[9]);
not(t[10],A[10]);
not(t[11],A[11]);
not(t[12],A[12]);
not(t[13],A[13]);
not(t[14],A[14]);
not(t[15],A[15]);
not(t[16],A[16]);
not(t[17],A[17]);
not(t[18],A[18]);
not(t[19],A[19]);
not(t[20],A[20]);
not(t[21],A[21]);
not(t[22],A[22]);
not(t[23],A[23]);
not(t[24],A[24]);
inc1(t[24:0],B,1'b1,Cout);
endmodule