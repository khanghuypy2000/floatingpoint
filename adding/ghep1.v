module ghep1(a,aout);
input[22:0] a;
output[23:0] aout;
assign aout={1'b1,a[22:0]};
endmodule 