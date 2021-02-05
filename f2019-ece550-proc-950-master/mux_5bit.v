module mux_5bit(in1,in2,select,out);
  input [4:0]in1,in2;
  input select;
  output [4:0]out;
  assign out = select? in1: in2;
endmodule