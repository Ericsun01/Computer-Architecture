module regfile (
    clock,
    ctrl_writeEnable,
    ctrl_reset, ctrl_writeReg,
    ctrl_readRegA, ctrl_readRegB, data_writeReg,
    data_readRegA, data_readRegB
);

   input clock, ctrl_writeEnable, ctrl_reset;
   input [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
   input [31:0] data_writeReg;

   output [31:0] data_readRegA, data_readRegB;
   wire [31:0]midout1;
   
  Write_port Write_port0(
     .ctrl_write(ctrl_writeReg),
	  .ctrl_enable(ctrl_writeEnable),
	  .output1(midout1)
  );
  
  trans trans0(
     .write(data_writeReg),
	  .readA(ctrl_readRegA),
	  .readB(ctrl_readRegB),
	  .clk(clock),
	  .en(midout1),
	  .clr(ctrl_reset),
	  .outA(data_readRegA),
	  .outB(data_readRegB)
	  );
  
  

endmodule
