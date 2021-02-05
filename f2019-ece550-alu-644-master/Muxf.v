module Muxf(in0,in1,in2,in3,in4,in5,in6,in7,sel,out);
  input [31:0]in0,in1,in2,in3,in4,in5,in6,in7;
  input [3:0]sel;
  output [31:0]out;
  wire [31:0]inter0,inter1,inter2,inter3;
  wire [31:0]outer0,outer1;
  
  Mux32 mux0(
     .in1(in0[31:0]),
	  .in2(in1[31:0]),
	  .select(sel[0]),
	  .out(inter0[31:0])
  );
  
  Mux32 mux1(
     .in1(in2[31:0]),
	  .in2(in3[31:0]),
	  .select(sel[0]),
	  .out(inter1[31:0])
  );
  
  Mux32 mux2(
     .in1(in4[31:0]),
	  .in2(in5[31:0]),
	  .select(sel[0]),
	  .out(inter2[31:0])
  );
  
  Mux32 mux3(
     .in1(in6[31:0]),
	  .in2(in7[31:0]),
	  .select(sel[0]),
	  .out(inter3[31:0])
  );
  
  Mux32 mux4(
     .in1(inter0[31:0]),
	  .in2(inter1[31:0]),
	  .select(sel[1]),
	  .out(outer0[31:0])
  );
  Mux32 mux5(
     .in1(inter2[31:0]),
	  .in2(inter3[31:0]),
	  .select(sel[1]),
	  .out(outer1[31:0])
  );
  Mux32 mux6(
     .in1(outer0[31:0]),
	  .in2(outer1[31:0]),
	  .select(sel[2]),
	  .out(out[31:0])
  );
  
  
  
  
  
    
endmodule