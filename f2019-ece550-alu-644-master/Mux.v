module Mux(in1,in2,select,out);
  input [15:0]in1,in2;
  input select;
  output [15:0]out;
  assign out = select? in1: in2;// select = 0, out = in1; select = 1, out = in2.
endmodule