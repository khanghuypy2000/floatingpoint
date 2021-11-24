module checkinf(a,f);
input[7:0] a;
output f;
wire[7:0] n;
xnor(n[0],a[0],1'b1);
xnor(n[1],a[1],1'b1);
xnor(n[2],a[2],1'b1);
xnor(n[3],a[3],1'b1);
xnor(n[4],a[4],1'b1);
xnor(n[5],a[5],1'b1);
xnor(n[6],a[6],1'b1);
xnor(n[7],a[7],1'b1);
and(f,n[0],n[1],n[2],n[3],n[4],n[5],n[6],n[7]);
endmodule	
