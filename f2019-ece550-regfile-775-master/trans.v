module trans(write,readA,readB,en,clk,clr,outA,outB);
 input [31:0]write;
 input [4:0]readA,readB;
 input [31:0]en;
 input clk,clr;
 
 output [31:0]outA,outB;
 wire [31:0]tristateA,tristateB;
 wire [31:0]output0A,output0B;
 wire clrA;
 
  Decd Decd0(
    .select(readA[4:0]),
	 .out(tristateA[31:0])
  );
  
  Decd Decd1(
    .select(readB[4:0]),
	 .out(tristateB[31:0])
  );
  
  or orgate_0(clrA,clr,1);
    subtrans sub1( 
	  .write(write),
	  .clk(clk),
	  .en(en[0]),
	  .clr(clrA),
	  .tristateA(tristateA[0]),
	  .tristateB(tristateB[0]),
	  .outA(outA),
	  .outB(outB)
	);
  
  genvar i;
  generate
 	
   for(i=1;i<32;i=i+1)begin :for1 
	subtrans sub0( 
	  .write(write),
	  .clk(clk),
	  .en(en[i]),
	  .clr(clr),
	  .tristateA(tristateA[i]),
	  .tristateB(tristateB[i]),
	  .outA(outA),
	  .outB(outB)
	);
	end
  endgenerate
endmodule

