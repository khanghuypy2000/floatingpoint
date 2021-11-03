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

module mux2(a1, b1, s1, f1);   
input a1, b1, s1;
output f1;
wire m4,m5,m6;
	not(m4,s1);
	and(m5,m4,a1);
	and(m6,s1,b1);
	or(f1,m5,m6);
endmodule

module mux2_8b(a3, b3, s3, f3);
input[7:0] a3, b3;
input s3;
output reg[7:0] f3;
wire k4,k5,k6;
/*not(k4,s3s3s3s3s3s3s3s3);
and(k5,k4,a3);
and(k6,s3s3s3s3s3s3s3s3,b3);
or(f3,k5,k6);*/
always @(a3 or b3 or s3) 
begin
	if(s3)
		f3 = a3; 
	else 
		f3 = b3;
end
endmodule

module add8b(a2, b2, ci2, s2, cout2); 
input[7:0] a2,b2;
input ci2; 
output[7:0] s2;
output cout2;
wire[6:0] w;
wire[7:0] t;
xor(t[0], b2[0], ci2);
xor(t[1], b2[1], ci2);
xor(t[2], b2[2], ci2);
xor(t[3], b2[3], ci2);
xor(t[4], b2[4], ci2);
xor(t[5], b2[5], ci2); 
xor(t[6], b2[6], ci2);
xor(t[7], b2[7], ci2);
fadder fadder1(a2[0], t[0], ci2, s2[0],w[0]);
fadder fadder2(a2[1], t[1], w[0], s2[1],w[1]);
fadder fadder3(a2[2], t[2], w[1], s2[2],w[2]);
fadder fadder4(a2[3], t[3], w[2], s2[3],w[3]);
fadder fadder5(a2[4], t[4], w[3], s2[4],w[4]);
fadder fadder6(a2[5], t[5], w[4], s2[5],w[5]);
fadder fadder7(a2[6], t[6], w[5], s2[6],w[6]);
fadder fadder8(a2[7], t[7], w[6], s2[7],cout2);
endmodule

module bu2(x2, y2);
input[7:0] x2;
output[7:0] y2;
wire[7:0] n0;
wire Cout2;
	not(n0[0], x2[0]);
	not(n0[1], x2[1]);
	not(n0[2], x2[2]);
	not(n0[3], x2[3]);
	not(n0[4], x2[4]);
	not(n0[5], x2[5]);
	not(n0[6], x2[6]);
	not(n0[7], x2[7]);
	add8b add1(n0[7:0],8'd1,1'b0,y2[7:0],Cout2);         
endmodule 

module SmallAlu(a,b,out,alb);
input[7:0] a,b;
output[7:0] out;
output alb;
wire[7:0] numb, num;
wire c_temp;
add8b truab(a,b,1'b1,num,c_temp);
mux2 mux2alb(1'b0,1'b1,c_temp,alb);
bu2 bu21(num,numb);
mux2_8b mux2num(num,numb,c_temp,out);	
endmodule 