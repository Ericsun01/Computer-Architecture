module Carry_select_adder(in1,in2,cin1,cin2,cin3,sum,overflow);
   input [31:0]in1;
	input [31:0]in2;
	input cin1,cin2,cin3;
	output [31:0]sum;
	output overflow;
	
	wire [15:0]cout0,cout1,cout2;
	wire overflow0,overflow1,overflow2;
	wire [15:0]sum_temp1,sum_temp2;
	

   Ripple_carry_adder Ripple_carry_adder0(
	       .a(in1[15:0]),
	       .b(in2[15:0]),
			 .c_in(cin1),
			 .c_out(cout0[15:0]),
			 .sum(sum[15:0]),
			 .overflow(overflow0)
			 
);
			 
	
	
	Ripple_carry_adder Ripple_carry_adder1(
	       .a(in1[31:16]),
	       .b(in2[31:16]),
			 .c_in(cin2),
			 .c_out(cout1[15:0]),
			 .sum(sum_temp1[15:0]),
			 .overflow(overflow1)
);
		
	
	
	Ripple_carry_adder Ripple_carry_adder2(
			 .a(in1[31:16]),
	       .b(in2[31:16]),
			 .c_in(cin3),
			 .c_out(cout2[15:0]),
			 .sum(sum_temp2[15:0]),
			 .overflow(overflow2)
);
			  
	
	
	Mux mux0(
	       .in1(sum_temp2[15:0]),
			 .in2(sum_temp1[15:0]),
			 .select(cout0[15]),
			 .out(sum[31:16])
	);
	
	Mux2 mux1(
	       .in1(overflow2),
			 .in2(overflow1),
			 .select(cout0[15]),
			 .out(overflow)
	);
	
	
endmodule