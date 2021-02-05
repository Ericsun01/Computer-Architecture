module SRA(in, out, select);
     input [31:0]in;
	  input [4:0]select;
	  output [31:0]out;
  wire [31:0]out0, out1, out2, out3, out4;

  genvar i, j;
  
generate
    for (i = 0; i < 31; i = i+1)begin: layer0
	   assign out0[i] = select[0] ? in[i+1]:in[i];	    	
	 end
	 assign out0[31] = select[0] ? in[31]:in[31];
endgenerate
  
generate
    for (i = 0; i < 30; i = i+1)begin: layer1
	   assign out1[i] = select[1] ? out0[i+2]:out0[i];	     		
	 end
  
	 assign out1[30] = select[1] ? in[31]:out0[30];
	 assign out1[31] = select[1] ? in[31]:out0[31];
endgenerate
	
	
generate
    for (i = 0; i < 28; i = i+1)begin: layer2
	 assign out2[i] = select[2] ? out1[i+4]:out1[i];	     		
	 end
  
    assign out2[28] = select[2] ? in[31]:out0[28];
	 assign out2[29] = select[2] ? in[31]:out0[29];
	 assign out2[30] = select[2] ? in[31]:out0[30];
	 assign out2[31] = select[2] ? in[31]:out0[31];
endgenerate
	 
generate
    for (i = 0; i < 24; i = i+1)begin: layer3_1
	 assign out3[i] = select[3] ? out2[i+8]:out2[i];	     		
	 end
	 
	 for (j = 0; j < 8; j = j+1)begin: layer3_2
	 assign out3[24+j] = select[3] ? in[31]:out2[24+j];
	 end
endgenerate
	
	 
generate
	 
    for (i = 0; i < 16; i = i+1)begin: layer4_1
	  assign out4[i] = select[4] ? out3[i+16]:out3[i];	     		
	 end
	 
	 for (j = 0; j < 16; j = j+1)begin: layer4_2
	  assign out4[16+j] = select[4] ? in[31]:out3[16+j];
	 end
endgenerate
  
assign out = out4;
endmodule