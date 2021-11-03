 module Shiftright (num, DataIn, Q); 
 input[7:0] num;
 input[23:0] DataIn;
 output reg[23:0] Q;
 always @(DataIn or num )
 begin
 case(num)
	8'b00000000: Q = {DataIn[23:0]};
	8'b00000001: Q = {1'b0, DataIn[23:1]};
	8'b00000010: Q = {2'b0, DataIn[23:2]};
	8'b00000011: Q = {3'b0, DataIn[23:3]};
	8'b00000100: Q = {4'b0, DataIn[23:4]};
	8'b00000101: Q = {5'b0, DataIn[23:5]};
	8'b00000110: Q = {6'b0, DataIn[23:6]};
	8'b00000111: Q = {7'b0, DataIn[23:7]};
	8'b00001000: Q = {8'b0, DataIn[23:8]};
	8'b00001001: Q = {9'b0, DataIn[23:9]};
	8'b00001010: Q = {10'b0, DataIn[23:10]};
	8'b00001011: Q = {11'b0, DataIn[23:11]};
	8'b00001100: Q = {12'b0, DataIn[23:12]};
	8'b00001101: Q = {13'b0, DataIn[23:13]};
	8'b00001110: Q = {14'b0, DataIn[23:14]};
	8'b00001111: Q = {15'b0, DataIn[23:15]};
	8'b00010000: Q = {16'b0, DataIn[23:16]};
	8'b00010001: Q = {17'b0, DataIn[23:17]};
	8'b00010010: Q = {18'b0, DataIn[23:18]};
	8'b00010011: Q = {19'b0, DataIn[23:19]};
	8'b00010100: Q = {20'b0, DataIn[23:20]};
	8'b00010101: Q = {21'b0, DataIn[23:21]};
	8'b00010110: Q = {22'b0, DataIn[23:22]};
	8'b00010111: Q = {23'b0, DataIn[23]};
	default: Q = 23'b0;
 endcase
 end
endmodule