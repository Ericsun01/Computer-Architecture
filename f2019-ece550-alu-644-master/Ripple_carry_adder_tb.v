module Ripple_carry_adder_tb();

      reg [15:0]a;
		reg [15:0]b;
		reg c_in;
		wire [15:0]c_out;
		wire [15:0]sum;
		integer i;
	
	Ripple_carry_adder Ripple_carry_adder0(a,
	       b,
			 c_in,
			 c_out,
			 sum);
	
	initial begin
	    a <= 0;
		 b <= 1;
		 c_in <= 0;
		 
		 $monitor ("a=0x%0h b=0x%0h c_in=0x%0h c_out=0x%0h sum=0x%0h", a, b, c_in, c_out, sum);
		 for (i = 0; i < 10; i = i+1) begin
		    #10 a <= $random;
			     b <= $random;
				  c_in <= 0;
		 end
	end
endmodule