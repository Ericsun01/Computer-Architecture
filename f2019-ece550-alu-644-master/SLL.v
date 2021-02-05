module SLL(in, out, select);
     input [31:0]in;
	  input [4:0]select;
	  output [31:0]out;
  wire [31:0]out0, out1, out2, out3, out4;

  genvar i, j;
    
	 assign out0[0] = select[0]?1'b0:in[0];
  generate
    for (i = 1; i < 32; i = i+1)begin: layer0
	 assign out0[i] = select[0] ? in[i-1]:in[i];	     		
	 end
  endgenerate
  
	 assign out1[0] = select[1] ? 0:out0[0];
	 assign out1[1] = select[1] ? 0:out0[1];
  generate
    for (i = 2; i < 32; i = i+1)begin: layer1
	 assign out1[i] = select[1] ? out0[i-2]:out0[i];	     		
	 end
  endgenerate
	
    assign out2[0] = select[2] ? 0:out1[0];
	 assign out2[1] = select[2] ? 0:out1[1];
	 assign out2[2] = select[2] ? 0:out1[2];
	 assign out2[3] = select[2] ? 0:out1[3];
  generate
    for (i = 4; i < 32; i = i+1)begin: layer2
	 assign out2[i] = select[2] ? out1[i-4]:out1[i];	     		
	 end
  endgenerate
	 
  generate
    for (j = 0; j < 8; j = j+1)begin: layer3_1
	 assign out3[j] = select[3] ? 0:out2[j];
	 end
	 
    for (i = 8; i < 32; i = i+1)begin: layer3_2
	 assign out3[i] = select[3] ? out2[i-8]:out2[i];	     		
	 end
  endgenerate
	
	 
  generate
    for (j = 0; j < 16; j = j+1)begin: layer4_1
	 assign out4[j] = select[4] ? 0:out3[j];
	 end
	 
    for (i = 16; i < 32; i = i+1)begin: layer4_2
	 assign out4[i] = select[4] ? out3[i-16]:out3[i];	     		
	 end
  endgenerate
  
assign out = out4;
endmodule