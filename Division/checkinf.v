module checkinf(a,b,f);
input[7:0] a;
input[22:0] b;
output[1:0] f;
wire[7:0] n;
wire[22:0] m;
xnor(n[0],a[0],1'b1);
xnor(n[1],a[1],1'b1);
xnor(n[2],a[2],1'b1);
xnor(n[3],a[3],1'b1);
xnor(n[4],a[4],1'b1);
xnor(n[5],a[5],1'b1);
xnor(n[6],a[6],1'b1);
xnor(n[7],a[7],1'b1);
and(f[0],n[0],n[1],n[2],n[3],n[4],n[5],n[6],n[7]); /// Check exp co bang 0 ko ?

xnor(m[0],b[0],1'b0);
xnor(m[1],b[1],1'b0);
xnor(m[2],b[2],1'b0);
xnor(m[3],b[3],1'b0);
xnor(m[4],b[4],1'b0);
xnor(m[5],b[5],1'b0);
xnor(m[6],b[6],1'b0);
xnor(m[7],b[7],1'b0);
xnor(m[8],b[8],1'b0);
xnor(m[9],b[9],1'b0);
xnor(m[10],b[10],1'b0);
xnor(m[11],b[11],1'b0);
xnor(m[12],b[12],1'b0);
xnor(m[13],b[13],1'b0);
xnor(m[14],b[14],1'b0);
xnor(m[15],b[15],1'b0);
xnor(m[16],b[16],1'b0);
xnor(m[17],b[17],1'b0);
xnor(m[18],b[18],1'b0);
xnor(m[19],b[19],1'b0);
xnor(m[20],b[20],1'b0);
xnor(m[21],b[21],1'b0);
xnor(m[22],b[22],1'b0);    ///Neu f[1]=1 --> inf, f[1]=0 --> NAN
and(f[1],m[0],m[1],m[2],m[3],m[4],m[5],m[6],m[7],m[8],m[9],m[10],m[11],m[12],m[13],m[14],m[15],m[16],m[17],m[18],m[19],m[20],m[21],m[22]);
endmodule	