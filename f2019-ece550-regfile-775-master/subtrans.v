module subtrans(write,clk,en,clr,tristateA,tristateB,outA,outB);

input [31:0]write;
input clk,en,clr,tristateA,tristateB;
output [31:0]outA,outB;
wire [31:0]DFF;

Reg Reg0(
	  .data_write(write[31:0]),
	  .clk(clk),
	  .en(en),
	  .clr(clr),
	  .output2(DFF[31:0])
	);
	assign outA[31:0] = tristateA ? DFF[31:0] : 32'bz; 
	assign outB[31:0] = tristateB ? DFF[31:0] : 32'bz;
endmodule