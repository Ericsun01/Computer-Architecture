module Write_port(ctrl_write,ctrl_enable,output1);
    input [4:0]ctrl_write;
	 input ctrl_enable;
	 output [31:0]output1;
	 
	 wire [31:0]mid1;
	 
	 Decd Decd0(
	    .select(ctrl_write[4:0]),
		 .out(mid1[31:0])
	 );
	 
	 and and_gate0(output1[0],ctrl_enable,mid1[0]);
	 and and_gate1(output1[1],ctrl_enable,mid1[1]);
	 and and_gate2(output1[2],ctrl_enable,mid1[2]);
	 and and_gate3(output1[3],ctrl_enable,mid1[3]);
	 and and_gate4(output1[4],ctrl_enable,mid1[4]);
	 and and_gate5(output1[5],ctrl_enable,mid1[5]);
	 and and_gate6(output1[6],ctrl_enable,mid1[6]);
	 and and_gate7(output1[7],ctrl_enable,mid1[7]);
	 and and_gate8(output1[8],ctrl_enable,mid1[8]);
	 and and_gate9(output1[9],ctrl_enable,mid1[9]);
	 and and_gate10(output1[10],ctrl_enable,mid1[10]);
	 and and_gate11(output1[11],ctrl_enable,mid1[11]);
	 and and_gate12(output1[12],ctrl_enable,mid1[12]);
	 and and_gate13(output1[13],ctrl_enable,mid1[13]);
	 and and_gate14(output1[14],ctrl_enable,mid1[14]);
	 and and_gate15(output1[15],ctrl_enable,mid1[15]);
	 and and_gate16(output1[16],ctrl_enable,mid1[16]);
	 and and_gate17(output1[17],ctrl_enable,mid1[17]);
	 and and_gate18(output1[18],ctrl_enable,mid1[18]);
	 and and_gate19(output1[19],ctrl_enable,mid1[19]);
	 and and_gate20(output1[20],ctrl_enable,mid1[20]);
	 and and_gate21(output1[21],ctrl_enable,mid1[21]);
	 and and_gate22(output1[22],ctrl_enable,mid1[22]);
	 and and_gate23(output1[23],ctrl_enable,mid1[23]);
	 and and_gate24(output1[24],ctrl_enable,mid1[24]);
	 and and_gate25(output1[25],ctrl_enable,mid1[25]);
	 and and_gate26(output1[26],ctrl_enable,mid1[26]);
	 and and_gate27(output1[27],ctrl_enable,mid1[27]);
	 and and_gate28(output1[28],ctrl_enable,mid1[28]);
	 and and_gate29(output1[29],ctrl_enable,mid1[29]);
	 and and_gate30(output1[30],ctrl_enable,mid1[30]);
	 and and_gate31(output1[31],ctrl_enable,mid1[31]);
	 

endmodule