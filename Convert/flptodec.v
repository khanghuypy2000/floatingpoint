module fadder(x, y, cin, s, cout);   //bộ full adder
input x, y, cin;
output s, cout;
wire m1,m2,m3;
xor(m1,x,y);
xor(s,cin,m1);
and(m2,cin,m1);
and(m3,x,y);
or(cout,m3,m2);
endmodule

module add8b(a2, b2, ci2, s2, cout2);  ///bộ cộng trừ 8 bit
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

module add5b(a2, b2, ci2, s2, cout2);  // bo cong 8 bit
input[4:0] a2,b2;
input ci2; 
output[4:0] s2;
output cout2;
wire[3:0] w;
fadder fadder1(a2[0], b2[0], ci2, s2[0],w[0]);
fadder fadder2(a2[1], b2[1], w[0], s2[1],w[1]);
fadder fadder3(a2[2], b2[2], w[1], s2[2],w[2]);
fadder fadder4(a2[3], b2[3], w[2], s2[3],w[3]);
fadder fadder5(a2[4], b2[4], w[3], s2[4],cout2);
endmodule

module add24b(X,Y,C,S);  // bo cong 48bit
input[23:0] X,Y;
input C;
output[23:0] S;
wire Co;
wire[1:0] n;
add8b add48b1(X[7:0],Y[7:0],C,S[7:0],n[0]);
add8b add48b2(X[15:8],Y[15:8],n[0],S[15:8],n[1]);
add8b add48b3(X[23:16],Y[23:16],n[1],S[23:16],Co);
endmodule

module phannguyen_muduong(num, a, b); //gia tri phan nguyen voi so mu lon hon 127
input[22:0] a;
input[7:0] num;
output reg[23:0] b;
always @(a or num)
begin
case(num)	
	8'd0: b={23'b0,1'b1};
	8'd1: b={22'b0,1'b1,a[22]};
	8'd2: b={21'b0,1'b1,a[22:21]};
	8'd3: b={20'b0,1'b1,a[22:20]};
	8'd4: b={19'b0,1'b1,a[22:19]};
	8'd5: b={18'b0,1'b1,a[22:18]};
	8'd6: b={17'b0,1'b1,a[22:17]};
	8'd7: b={16'b0,1'b1,a[22:15]};
	8'd9: b={15'b0,1'b1,a[22:14]};
	8'd10: b={14'b0,1'b1,a[22:13]};
	8'd11: b={13'b0,1'b1,a[22:12]};
	8'd12: b={12'b0,1'b1,a[22:11]};
	8'd13: b={11'b0,1'b1,a[22:10]};
	8'd14: b={10'b0,1'b1,a[22:9]};
	8'd15: b={9'b0,1'b1,a[22:8]};
	8'd16: b={8'b0,1'b1,a[22:7]};
	8'd17: b={7'b0,1'b1,a[22:6]};
	8'd18: b={6'b0,1'b1,a[22:5]};
	8'd19: b={5'b0,1'b1,a[22:4]};
	8'd20: b={4'b0,1'b1,a[22:3]};
	8'd21: b={3'b0,1'b1,a[22:2]};
	8'd22: b={2'b0,1'b0,a[22:1]};
	8'd23: b={1'b0,a[22:0]};
	default: b=24'b0;
endcase
end
endmodule

module phantp_muduong(num,a,b);
input[7:0] num;
input[22:0] a;
output reg[23:0] b;
always @(a or num)
begin
case(num)	
	8'd0: b={a[22:0],1'b0};
	8'd1: b={a[21:0],2'b0};
	8'd2: b={a[20:0],3'b0};
	8'd3: b={a[19:0],4'b0};
	8'd4: b={a[18:0],5'b0};
	8'd5: b={a[17:0],6'b0};
	8'd6: b={a[16:0],7'b0};
	8'd7: b={a[15:0],8'b0};
	8'd9: b={a[14:0],9'b0};
	8'd10: b={a[13:0],10'b0};
	8'd11: b={a[12:0],11'b0};
	8'd12: b={a[11:0],12'b0};
	8'd13: b={a[10:0],13'b0};
	8'd14: b={a[9:0],14'b0};
	8'd15: b={a[8:0],15'b0};
	8'd16: b={a[7:0],16'b0};
	8'd17: b={a[6:0],17'b0};
	8'd18: b={a[5:0],18'b0};
	8'd19: b={a[4:0],19'b0};
	8'd20: b={a[3:0],20'b0};
	8'd21: b={a[2:0],21'b0};
	8'd22: b={a[1:0],22'b0};
	8'd23: b={a[0],23'b0};
	default: b=24'b0;
endcase
end
endmodule

module phantp_muam(num, a, b);
input[22:0] a;
input[7:0] num;
output reg[23:0] b;
always @(a or num)
begin
case(num)	
	8'd0: b={1'b1,23'b0};
	8'd1: b={1'b1,a[22],22'b0};
	8'd2: b={1'b1,a[22:21],21'b0};
	8'd3: b={1'b1,a[22:20],20'b0};
	8'd4: b={1'b1,a[22:19],19'b0};
	8'd5: b={1'b1,a[22:18],18'b0};
	8'd6: b={1'b1,a[22:17],17'b0};
	8'd7: b={1'b1,a[22:15],16'b0};
	8'd9: b={1'b1,a[22:14],15'b0};
	8'd10: b={1'b1,a[22:13],14'b0};
	8'd11: b={1'b1,a[22:12],13'b0};
	8'd12: b={1'b1,a[22:11],12'b0};
	8'd13: b={1'b1,a[22:10],11'b0};
	8'd14: b={1'b1,a[22:9],10'b0};
	8'd15: b={1'b1,a[22:8],9'b0};
	8'd16: b={1'b1,a[22:7],8'b0};
	8'd17: b={1'b1,a[22:6],7'b0};
	8'd18: b={1'b1,a[22:5],6'b0};
	8'd19: b={1'b1,a[22:4],5'b0};
	8'd20: b={1'b1,a[22:3],4'b0};
	8'd21: b={1'b1,a[22:2],3'b0};
	8'd22: b={1'b0,a[22:1],2'b0,};
	8'd23: b={1'b0,a[22:0]};
	default: b=24'b0;
endcase
end
endmodule

module Rounding(X,exp,Y,expo);
input[22:0] X;
input[7:0] exp;
output[7:0] expo;
output[22:0] Y;
wire Cout, Cout1;
wire[23:0] t;
assign Y[17:0] = 18'b0;
add5b cong5b({1'b0,X[22:19]},5'b0,X[18],t[23:19],Cout);
add8b cong8b(exp,8'b0,t[23],expo,Cout1);
assign Y[22:19] = t[22:19];
assign Y[18]=1'b0;
endmodule	

module hadder(x, y, s, c);  // bộ cộng bán phần
input x,y;
output s,c;
xor(s,x,y);
and(c,x,y);
endmodule

module inc1(a,s,cin);   //bộ tăng 1
input[24:0] a;   
input cin;                 // Cin bằng 1 thì ngõ ra = ngõ vào + 1
wire[24:1] b;
output[24:0] s;
//output cout;
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
inc1 increase1(t[24:0],B,1'b1);
endmodule

module pnguyen_lh23b(exp_in,exp_out,out);
	input wire [7:0]exp_in;  // mu_in
	output reg [6:0]exp_out; // mu thap phan b
	output reg [6:0]out;	 // hang so a thoa: a*10^b = 2^mu_in, 4bit dau bieu dien phan nguyen, 3 bit cuoi bieu dien thap phan
		always @(exp_in) begin
		case (exp_in)
			8'd24:begin exp_out=7'd7 ; out=7'b0001100; end
			8'd25:begin exp_out=7'd7 ; out=7'b0011011; end
			8'd26:begin exp_out=7'd7 ; out=7'b0110110; end
			8'd27:begin exp_out=7'd8 ; out=7'b0001011; end
			8'd28:begin exp_out=7'd8 ; out=7'b0010101; end
			8'd29:begin exp_out=7'd8 ; out=7'b0101011; end
			8'd30:begin exp_out=7'd9 ; out=7'b0001001; end
			8'd31:begin exp_out=7'd9 ; out=7'b0010010; end
			8'd32:begin exp_out=7'd9 ; out=7'b0100010; end
			8'd33:begin exp_out=7'd9 ; out=7'b1000101; end
			8'd34:begin exp_out=7'd10; out=7'b0001110; end
			8'd35:begin exp_out=7'd10; out=7'b0011100; end
			8'd36:begin exp_out=7'd10; out=7'b0110111; end
			8'd37:begin exp_out=7'd11; out=7'b0001011; end
			8'd38:begin exp_out=7'd11; out=7'b0010110; end
			8'd39:begin exp_out=7'd11; out=7'b0101100; end
			8'd40:begin exp_out=7'd12; out=7'b0001001; end
			8'd41:begin exp_out=7'd12; out=7'b0010001; end
			8'd42:begin exp_out=7'd12; out=7'b0100011; end
			8'd43:begin exp_out=7'd12; out=7'b1000111; end
			8'd44:begin exp_out=7'd13; out=7'b0001110; end
			8'd45:begin exp_out=7'd13; out=7'b0011100; end
			8'd46:begin exp_out=7'd13; out=7'b0111000; end
			8'd47:begin exp_out=7'd14; out=7'b0001100; end
			8'd48:begin exp_out=7'd14; out=7'b0010110; end
			8'd49:begin exp_out=7'd14; out=7'b0101101; end
			8'd50:begin exp_out=7'd15; out=7'b0001001; end
			8'd51:begin exp_out=7'd15; out=7'b0010010; end
			8'd52:begin exp_out=7'd15; out=7'b0100100; end
			8'd53:begin exp_out=7'd15; out=7'b1001000; end
			8'd54:begin exp_out=7'd16; out=7'b0001110; end
			8'd55:begin exp_out=7'd16; out=7'b0011101; end
			8'd56:begin exp_out=7'd16; out=7'b0111010; end
			8'd57:begin exp_out=7'd17; out=7'b0001100; end
			8'd58:begin exp_out=7'd17; out=7'b0010111; end
			8'd59:begin exp_out=7'd17; out=7'b0101110; end
			8'd60:begin exp_out=7'd18; out=7'b0001001; end
			8'd61:begin exp_out=7'd18; out=7'b0010010; end
			8'd62:begin exp_out=7'd18; out=7'b0100101; end
			8'd63:begin exp_out=7'd18; out=7'b1001010; end
			8'd64:begin exp_out=7'd19; out=7'b0001110; end
			8'd65:begin exp_out=7'd19; out=7'b0011101; end
			8'd66:begin exp_out=7'd19; out=7'b0111011; end
			8'd67:begin exp_out=7'd20; out=7'b0001100; end
			8'd68:begin exp_out=7'd20; out=7'b0011000; end
			8'd69:begin exp_out=7'd20; out=7'b0110000; end
			8'd70:begin exp_out=7'd21; out=7'b0001001; end
			8'd71:begin exp_out=7'd21; out=7'b0010011; end
			8'd72:begin exp_out=7'd21; out=7'b0100110; end
			8'd73:begin exp_out=7'd21; out=7'b1001100; end   
			8'd74:begin exp_out=7'd22; out=7'b0001111; end   
			8'd75:begin exp_out=7'd22; out=7'b0011110; end
			8'd76:begin exp_out=7'd22; out=7'b0111100; end
			8'd77:begin exp_out=7'd23; out=7'b0001100; end
			8'd78:begin exp_out=7'd23; out=7'b0011000; end
			8'd79:begin exp_out=7'd23; out=7'b0110000; end
			8'd80:begin exp_out=7'd24; out=7'b0001010; end
			8'd81:begin exp_out=7'd24; out=7'b0010100; end
			8'd82:begin exp_out=7'd24; out=7'b0100110; end
			8'd83:begin exp_out=7'd24; out=7'b1001101; end
			8'd84:begin exp_out=7'd25; out=7'b0010000; end
			8'd85:begin exp_out=7'd25; out=7'b0011111; end
			8'd86:begin exp_out=7'd25; out=7'b0111110; end
			8'd87:begin exp_out=7'd26; out=7'b0001100; end
			8'd88:begin exp_out=7'd26; out=7'b0011001; end
			8'd89:begin exp_out=7'd26; out=7'b0110010; end
			8'd90:begin exp_out=7'd27; out=7'b0001010; end
			8'd91:begin exp_out=7'd27; out=7'b0010100; end
			8'd92:begin exp_out=7'd27; out=7'b0101000; end
			8'd93:begin exp_out=7'd27; out=7'b1010000; end
			8'd94:begin exp_out=7'd28; out=7'b0010000; end
			8'd95:begin exp_out=7'd28; out=7'b0100000; end
			8'd96:begin exp_out=7'd28; out=7'b1000000; end
			8'd97:begin exp_out=7'd29; out=7'b0001100; end
			8'd98:begin exp_out=7'd29; out=7'b0011001; end
			8'd99:begin exp_out=7'd29; out=7'b0110011; end
			8'd100:begin exp_out=7'd30;out=7'b0001010; end
			8'd101:begin exp_out=7'd30;out=7'b0010100; end
			8'd102:begin exp_out=7'd30;out=7'b0011000; end
			8'd103:begin exp_out=7'd31;out=7'b0001000; end
			8'd104:begin exp_out=7'd31;out=7'b0010000; end
			8'd105:begin exp_out=7'd31;out=7'b0100000; end
			8'd106:begin exp_out=7'd31;out=7'b1000001; end
			8'd107:begin exp_out=7'd32;out=7'b0001101; end
			8'd108:begin exp_out=7'd32;out=7'b0011010; end
			8'd109:begin exp_out=7'd32;out=7'b0110100; end
			8'd110:begin exp_out=7'd32;out=7'b0001010; end
			8'd111:begin exp_out=7'd33;out=7'b0010100; end
			8'd112:begin exp_out=7'd33;out=7'b0101001; end
			8'd113:begin exp_out=7'd34;out=7'b0001000; end
			8'd114:begin exp_out=7'd34;out=7'b0010000; end  
			8'd115:begin exp_out=7'd34;out=7'b0100001; end
			8'd116:begin exp_out=7'd34;out=7'b1000010; end
			8'd117:begin exp_out=7'd35;out=7'b0001101; end
			8'd118:begin exp_out=7'd35;out=7'b0011011; end
			8'd119:begin exp_out=7'd35;out=7'b0110101; end
			8'd120:begin exp_out=7'd36;out=7'b0001011; end
			8'd121:begin exp_out=7'd36;out=7'b0010101; end
			8'd122:begin exp_out=7'd36;out=7'b0101010; end
			8'd123:begin exp_out=7'd37;out=7'b0001000; end
			8'd124:begin exp_out=7'd37;out=7'b0010001; end
			8'd125:begin exp_out=7'd37;out=7'b0100010; end
			8'd126:begin exp_out=7'd37;out=7'b1000100; end
			8'd127:begin exp_out=7'd38;out=7'b0001110; end
			8'd128:begin exp_out=7'd38;out=7'b0011011; end
			default: begin exp_out=7'bx;out=7'bx; end
		endcase
	end
endmodule		

module mulab(x,y,fo);
input[6:0] x;
input y;
output[13:0] fo;
wire[6:0] f;
and(f[0],x[0],y);
and(f[1],x[1],y);
and(f[2],x[2],y);
and(f[3],x[3],y);
and(f[4],x[4],y);
and(f[5],x[5],y);
and(f[6],x[6],y);
assign fo = {7'b0,f};
endmodule	

module Shiftleft7b(a,b,num);   //Dich trai, toi thieu 0 bit, dich toi da 7 bit, ngo vao la so 14 bit
input[13:0] a;
input[2:0] num;
output reg[13:0] b;
always @(a or num)
begin
case(num)	
	2'd0: b={7'b0,a[6:0]};
	2'd1: b={6'b0,a[6:0],1'b0};
	2'd2: b={5'b0,a[6:0],2'b0};
	2'd3: b={4'b0,a[6:0],3'b0};
	2'd4: b={3'b0,a[6:0],4'b0};
	2'd5: b={2'b0,a[6:0],5'b0};
	2'd6: b={1'b0,a[6:0],6'b0};
	2'd7: b={a[6:0],7'b0};
endcase
end
endmodule

module Shiftleft10b(a,b,num);   //Dich trai, toi thieu 0 bit, dich toi da 10 bit, ngo vao la so 20 bit
input[19:0] a;
input[3:0] num;
output reg[19:0] b;
always @(a or num)
begin
case(num)	
	3'd0: b={10'b0,a[9:0]};
	3'd1: b={9'b0,a[9:0],1'b0};
	3'd2: b={8'b0,a[9:0],2'b0};
	3'd3: b={7'b0,a[9:0],3'b0};
	3'd4: b={6'b0,a[9:0],4'b0};
	3'd5: b={5'b0,a[9:0],5'b0};
	3'd6: b={4'b0,a[9:0],6'b0};
	3'd7: b={3'b0,a[9:0],7'b0};
	3'd8: b={2'b0,a[9:0],8'b0};
	3'd9: b={1'b0,a[9:0],9'b0};
	3'd10: b={a[9:0],10'b0};
	default: b=20'b0;   
endcase
end
endmodule


module add7b(a2, b2, ci2, s2, cout2);  // bo cong 8 bit
input[6:0] a2,b2;
input ci2; 
output[6:0] s2;
output cout2;
wire[5:0] w;
fadder fadder1(a2[0], b2[0], ci2, s2[0],w[0]);
fadder fadder2(a2[1], b2[1], w[0], s2[1],w[1]);
fadder fadder3(a2[2], b2[2], w[1], s2[2],w[2]);
fadder fadder4(a2[3], b2[3], w[2], s2[3],w[3]);
fadder fadder5(a2[4], b2[4], w[3], s2[4],w[4]);
fadder fadder6(a2[5], b2[5], w[4], s2[5],w[5]);
fadder fadder7(a2[6], b2[6], w[5], s2[6],cout2);
endmodule

module add14b(X,Y,C,S);  // bo cong 48bit
input[13:0] X,Y;
input C;
output[14:0] S;
wire Co;
wire n;
add7b add7b1(X[6:0],Y[6:0],C,S[6:0],n);
add7b add7b2(X[13:7],Y[13:7],n,S[13:7],Co);
assign S[14] = Co;
endmodule

module add10b(a2, b2, ci2, s2, cout2);  // bo cong 8 bit
input[9:0] a2,b2;
input ci2; 
output[9:0] s2;
output cout2;
wire[8:0] w;
fadder fadder1(a2[0], b2[0], ci2, s2[0],w[0]);
fadder fadder2(a2[1], b2[1], w[0], s2[1],w[1]);
fadder fadder3(a2[2], b2[2], w[1], s2[2],w[2]);
fadder fadder4(a2[3], b2[3], w[2], s2[3],w[3]);
fadder fadder5(a2[4], b2[4], w[3], s2[4],w[4]);
fadder fadder6(a2[5], b2[5], w[4], s2[5],w[5]);
fadder fadder7(a2[6], b2[6], w[5], s2[6],w[6]);
fadder fadder8(a2[7], b2[7], w[6], s2[7],w[7]);
fadder fadder9(a2[8], b2[8], w[7], s2[8],w[8]);
fadder fadder10(a2[9], b2[9], w[8], s2[9],cout2);
endmodule

module tp_table(x,y);   /// bang tra gia tri phan thap phan
input[2:0] x;
output reg[9:0] y;
always @(x)
begin
case(x)
	3'b000: y=10'd0;
	3'd001: y=10'd125;
	3'd010: y=10'd25;
	3'd011: y=10'd375;
	3'd100: y=10'd5;
	3'd101: y=10'd625;
	3'd110: y=10'd75;
	3'd111: y=10'd875;
endcase
end
endmodule

module Multiplier(A, B, M);
input[7:0] A,B;
output[13:0] M;
wire [13:0] z0,z1,z2,z3,z4,z5,z6,z7;
wire [13:0] t1,t2,t3,t4,t5,t6,t7;
wire [14:0] h1,h2,h3,h4,h5,h6,h7;
mulab mulab0(A,B[0],z0);
mulab mulab1(A,B[1],z1);
mulab mulab2(A,B[2],z2);
mulab mulab3(A,B[3],z3);
mulab mulab4(A,B[4],z4);
mulab mulab5(A,B[5],z5);
mulab mulab6(A,B[6],z6);
mulab mulab7(A,B[7],z7);

Shiftleft7b dich1b(z1,t1,3'b001);
Shiftleft7b dich2b(z2,t2,3'b010);
Shiftleft7b dich3b(z3,t3,3'b011);
Shiftleft7b dich4b(z4,t4,3'b100);
Shiftleft7b dich5b(z5,t5,3'b101);
Shiftleft7b dich6b(z6,t6,3'b110);
Shiftleft7b dich7b(z7,t7,3'b111);

add14b cong14b1(z0,t1,1'b0,h1);
add14b cong14b2(h1[13:0],t2,1'b0,h2);
add14b cong14b3(h2[13:0],t3,1'b0,h3);
add14b cong14b4(h3[13:0],t4,1'b0,h4);
add14b cong14b5(h4[13:0],t5,1'b0,h5);
add14b cong14b6(h5[13:0],t6,1'b0,h6);
add14b cong14b7(h6[13:0],t7,1'b0,h7);
add14b cong14b8(h7[13:0],t8,1'b0,M);
endmodule

module mux2_8b(a3, b3, s3, f3);
input[7:0] a3, b3;
input s3;
output reg[7:0] f3;
always @(a3 or b3 or s3) 
begin
	if(s3)
		f3 = a3; 
	else 
		f3 = b3;
end
endmodule

module flptodec(flp,dau,mu,dau_mu,phan_nguyen,phan_tp);
input[31:0] flp;
output dau;    // 0: duong, 1: am
output reg dau_mu; // 0: duong, 1: am
output reg[6:0] mu;
output reg[9:0] phan_tp;
output reg[23:0] phan_nguyen;
assign dau = flp[31];
wire[7:0] num,num_2,num_out,expo;
wire[6:0] out_rom,exp_ou1;
wire lh_127;
wire[23:0] pnguyen_1,ptphan_1,ptphan_2;
wire[9:0] ptphan_1_o,ptphan_2_o,Mul_tp_o;
wire[22:0] Round_out;
wire[13:0] Mul_out;
wire[23:0] mu_inc, Mul_dec;
add8b(flp[30:23], 8'b01111111, 1'b1, num, lh_127);
bu2ifam u1(num,num_2);
mux2_8b u2(num,num_2,lh_127,num_out);
phannguyen_muduong u3(num_out, flp[22:0], pnguyen_1);   ///Tim phan nguyen so mu duong, đk la so mu <= 23
phantp_muduong u4(num_out,flp[22:0],ptphan_1);   //Tim phan thap phan cua so mu duong, đk la so mu <= 23
phantp_muam u5(num_out,flp[22:0], ptphan_2);    //Tim phan thap phan cua so mu am
Rounding u6(flp[22:0],flp[30:23],Round_out,expo);
pnguyen_lh23b u7(expo,exp_ou1,out_rom);     ///Bang ROM tra cac gia tri de tinh mu thap phan 
Multiplier u8(out_rom, {3'b0,1'b1,Round_out[22:20]}, Mul_out);	
inc1 u9({17'b0,exp_ou1},mu_inc,1'b1);	
add24b u10({10'b0,Mul_out},24'd10,1'b1,Mul_dec);
tp_table u11(ptphan_1[23:21],ptphan_1_o);
tp_table u12(ptphan_2[23:21],ptphan_2_o);
tp_table u13(Mul_out[5:3],Mul_tp_o);

always @(pnguyen_1 or ptphan_1_o or ptphan_2_o or exp_ou1 or Mul_out)
begin
	if(lh_127)  // mu duong
		 begin
			if(num_out<8'd24)  //gia tri mu <= 23
				begin
					phan_nguyen = pnguyen_1;
					phan_tp = ptphan_1_o;
					mu = 7'd1;
					dau_mu = 1'd0;
				end
			else 
				begin
					phan_tp =Mul_tp_o;
					dau_mu = 1'd0;
					if(Mul_out>24'd10)
						begin
							mu = mu_inc[6:0];
							phan_nguyen = {20'b0,Mul_dec[9:6]};
						end
					else
						begin
							mu = exp_ou1;
							phan_nguyen = {20'b0,Mul_out[9:6]};
						end
				end
		 end
	else   // mu am
		if(num_out< 8'd24)
				begin
					phan_nguyen = 24'd0;
					phan_tp = ptphan_2_o;
					mu = 7'd1;
					dau_mu = 1'd1;  //mu am
				end
			else 
				begin
					phan_tp =Mul_tp_o;
					phan_nguyen = {20'b0,Mul_out[9:6]};
					dau_mu = 1'd1;
					if(Mul_out>24'd10)
						begin
							mu = mu_inc[6:0];
							phan_nguyen = {20'b0,Mul_dec[9:6]};
						end
					else
						begin
							mu = exp_ou1;
							phan_nguyen = {20'b0,Mul_out[9:6]};
						end
				end
end
endmodule
