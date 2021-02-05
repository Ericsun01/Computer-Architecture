module Mux2(in1,in2,select,out);
  input in1, in2, select;
  output out;
  assign out = select? in2: in1;// select = 0, out = in1; select = 1, out = in2.
endmodule