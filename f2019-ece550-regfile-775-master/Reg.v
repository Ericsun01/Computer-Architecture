module Reg(data_write,clk,en,clr,output2);
    
	 input [31:0]data_write;
	 input clk;
	 input en;
	 input clr;
	 output [31:0]output2;
	 
	 dffe_ref dffe_ref0(
	   .d(data_write[0]),
		.clk(clk),
		.en(en),
		.clr(clr),
		.q(output2[0])
	 
	 );
	 dffe_ref dffe_ref1(
	   .d(data_write[1]),
		.clk(clk),
		.en(en),
		.clr(clr),
		.q(output2[1])
	 
	 );
	 dffe_ref dffe_ref2(
	   .d(data_write[2]),
		.clk(clk),
		.en(en),
		.clr(clr),
		.q(output2[2])
	 
	 );
	 dffe_ref dffe_ref3(
	   .d(data_write[3]),
		.clk(clk),
		.en(en),
		.clr(clr),
		.q(output2[3])
	 
	 );
	 dffe_ref dffe_ref4(
	   .d(data_write[4]),
		.clk(clk),
		.en(en),
		.clr(clr),
		.q(output2[4])
	 
	 );
	 dffe_ref dffe_ref5(
	   .d(data_write[5]),
		.clk(clk),
		.en(en),
		.clr(clr),
		.q(output2[5])
	 
	 );
	 dffe_ref dffe_ref6(
	   .d(data_write[6]),
		.clk(clk),
		.en(en),
		.clr(clr),
		.q(output2[6])
	 
	 );
	 dffe_ref dffe_ref7(
	   .d(data_write[7]),
		.clk(clk),
		.en(en),
		.clr(clr),
		.q(output2[7])
	 
	 );
	 dffe_ref dffe_ref8(
	   .d(data_write[8]),
		.clk(clk),
		.en(en),
		.clr(clr),
		.q(output2[8])
	 
	 );
	 dffe_ref dffe_ref9(
	   .d(data_write[9]),
		.clk(clk),
		.en(en),
		.clr(clr),
		.q(output2[9])
	 
	 );
	  dffe_ref dffe_ref10(
	   .d(data_write[10]),
		.clk(clk),
		.en(en),
		.clr(clr),
		.q(output2[10])
	 
	 );
	  dffe_ref dffe_ref11(
	   .d(data_write[11]),
		.clk(clk),
		.en(en),
		.clr(clr),
		.q(output2[11])
	 
	 );
	  dffe_ref dffe_ref12(
	   .d(data_write[12]),
		.clk(clk),
		.en(en),
		.clr(clr),
		.q(output2[12])
	 
	 );
	  dffe_ref dffe_ref13(
	   .d(data_write[13]),
		.clk(clk),
		.en(en),
		.clr(clr),
		.q(output2[13])
	 
	 );
	  dffe_ref dffe_ref14(
	   .d(data_write[14]),
		.clk(clk),
		.en(en),
		.clr(clr),
		.q(output2[14])
	 
	 );
	  dffe_ref dffe_ref15(
	   .d(data_write[15]),
		.clk(clk),
		.en(en),
		.clr(clr),
		.q(output2[15])
	 
	 );
	  dffe_ref dffe_ref16(
	   .d(data_write[16]),
		.clk(clk),
		.en(en),
		.clr(clr),
		.q(output2[16])
	 
	 );
	  dffe_ref dffe_ref17(
	   .d(data_write[17]),
		.clk(clk),
		.en(en),
		.clr(clr),
		.q(output2[17])
	 
	 );
	  dffe_ref dffe_ref18(
	   .d(data_write[18]),
		.clk(clk),
		.en(en),
		.clr(clr),
		.q(output2[18])
	 
	 );
	  dffe_ref dffe_ref19(
	   .d(data_write[19]),
		.clk(clk),
		.en(en),
		.clr(clr),
		.q(output2[19])
	 
	 );
	  dffe_ref dffe_ref20(
	   .d(data_write[20]),
		.clk(clk),
		.en(en),
		.clr(clr),
		.q(output2[20])
	 
	 );
	  dffe_ref dffe_ref21(
	   .d(data_write[21]),
		.clk(clk),
		.en(en),
		.clr(clr),
		.q(output2[21])
	 
	 );
	  dffe_ref dffe_ref22(
	   .d(data_write[22]),
		.clk(clk),
		.en(en),
		.clr(clr),
		.q(output2[22])
	 
	 );
	  dffe_ref dffe_ref23(
	   .d(data_write[23]),
		.clk(clk),
		.en(en),
		.clr(clr),
		.q(output2[23])
	 
	 );
	 dffe_ref dffe_ref24(
	   .d(data_write[24]),
		.clk(clk),
		.en(en),
		.clr(clr),
		.q(output2[24])
	 
	 );
	 dffe_ref dffe_ref25(
	   .d(data_write[25]),
		.clk(clk),
		.en(en),
		.clr(clr),
		.q(output2[25])
	 
	 );
	 dffe_ref dffe_ref26(
	   .d(data_write[26]),
		.clk(clk),
		.en(en),
		.clr(clr),
		.q(output2[26])
	 
	 );
	 dffe_ref dffe_ref27(
	   .d(data_write[27]),
		.clk(clk),
		.en(en),
		.clr(clr),
		.q(output2[27])
	 
	 );
	 dffe_ref dffe_ref28(
	   .d(data_write[28]),
		.clk(clk),
		.en(en),
		.clr(clr),
		.q(output2[28])
	 
	 );
	  dffe_ref dffe_ref29(
	   .d(data_write[29]),
		.clk(clk),
		.en(en),
		.clr(clr),
		.q(output2[29])
	 
	 );
	  dffe_ref dffe_ref30(
	   .d(data_write[30]),
		.clk(clk),
		.en(en),
		.clr(clr),
		.q(output2[30])
	 
	 );
	  dffe_ref dffe_ref31(
	   .d(data_write[31]),
		.clk(clk),
		.en(en),
		.clr(clr),
		.q(output2[31])
	 
	 );
	 


endmodule