module Xacdinhdau(Siout,sel,cout,siA,siB);
input sel,cout,siA,siB;
output Siout;
wire n1,n2,n3,coutb;
xor(n1,sel,siB);
not(coutb,cout);
and(n2,coutb,n1);
and(n3,cout,siA);
or(Siout,n3,n2);
endmodule