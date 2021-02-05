module Ripple_carry_adder( 
   input [15:0]a,
	input [15:0]b,
	input c_in,
	output [15:0]c_out,
	output [15:0]sum,
	output overflow
);

//	
	FA FA0(.in1(a[0]),
	       .in2(b[0]),
			 .cin(c_in),
			 .sum(sum[0]),
			 .cout(c_out[0])
	);
	FA FA1(.in1(a[1]),
	       .in2(b[1]),
			 .cin(c_out[0]),
			 .sum(sum[1]),
			 .cout(c_out[1])
	);
	FA FA2(.in1(a[2]),
	       .in2(b[2]),
			 .cin(c_out[1]),
			 .sum(sum[2]),
			 .cout(c_out[2])
	);
	FA FA3(.in1(a[3]),
	       .in2(b[3]),
			 .cin(c_out[2]),
			 .sum(sum[3]),
			 .cout(c_out[3])
	);
	FA FA4(.in1(a[4]),
	       .in2(b[4]),
			 .cin(c_out[3]),
			 .sum(sum[4]),
			 .cout(c_out[4])
	);
	FA FA5(.in1(a[5]),
	       .in2(b[5]),
			 .cin(c_out[4]),
			 .sum(sum[5]),
			 .cout(c_out[5])
	);
	FA FA6(.in1(a[6]),
	       .in2(b[6]),
			 .cin(c_out[5]),
			 .sum(sum[6]),
			 .cout(c_out[6])
	);
	FA FA7(.in1(a[7]),
	       .in2(b[7]),
			 .cin(c_out[6]),
			 .sum(sum[7]),
			 .cout(c_out[7])
	);
	FA FA8(.in1(a[8]),
	       .in2(b[8]),
			 .cin(c_out[7]),
			 .sum(sum[8]),
			 .cout(c_out[8])
	);
	FA FA9(.in1(a[9]),
	       .in2(b[9]),
			 .cin(c_out[8]),
			 .sum(sum[9]),
			 .cout(c_out[9])
	);
	FA FA10(.in1(a[10]),
	       .in2(b[10]),
			 .cin(c_out[9]),
			 .sum(sum[10]),
			 .cout(c_out[10])
	);
	FA FA11(.in1(a[11]),
	       .in2(b[11]),
			 .cin(c_out[10]),
			 .sum(sum[11]),
			 .cout(c_out[11])
	);
	FA FA12(.in1(a[12]),
	       .in2(b[12]),
			 .cin(c_out[11]),
			 .sum(sum[12]),
			 .cout(c_out[12])
	);
	FA FA13(.in1(a[13]),
	       .in2(b[13]),
			 .cin(c_out[12]),
			 .sum(sum[13]),
			 .cout(c_out[13])
	);
	FA FA14(.in1(a[14]),
	       .in2(b[14]),
			 .cin(c_out[13]),
			 .sum(sum[14]),
			 .cout(c_out[14])
	);
	FA FA15(.in1(a[15]),
	       .in2(b[15]),
			 .cin(c_out[14]),
			 .sum(sum[15]),
			 .cout(c_out[15])
	);
	
	xor xorgate(overflow, c_out[15], c_out[14]);
endmodule