module adder(A, B, select, result,
 overflow, isNotEqual, isLessThan);
  input [31:0]A, B;
  input [4:0]select;
  output [31:0]result;
  output overflow, isNotEqual, isLessThan;
  wire [31:0]inputB;
  wire [31:0]reB;
  
  Mux32 Mux0(
	       .in1(reB[31:0]),
			 .in2(B[31:0]),
			 .select(select[0]),
			 .out(inputB[31:0])
  );
  
  reverse reverse0(
          .rightB(B[31:0]),
			 .reverseB(reB[31:0])
  );
  
  Carry_select_adder Carry_select_adder0(
          .in1(A[31:0]),
	       .in2(inputB[31:0]),
			 .cin1(select[0]),
			 .cin2(1'b0),
			 .cin3(1'b1),
			 .sum(result[31:0]),
			 .overflow(overflow)
  );
  
  Equal equ(
          .in(result[31:0]),
			 .out(isNotEqual)
  );
  
  Lessthan less(
          .in(result[31:0]),
			 .out(isLessThan)
  );
endmodule