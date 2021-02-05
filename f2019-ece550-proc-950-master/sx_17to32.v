module sx_17to32(in, out);
  input [16:0]in;
  output [31:0]out;
  
  assign out = in[16] ? {15'b111111111111111, in[16:0]}:{15'b000000000000000, in[16:0]};
endmodule