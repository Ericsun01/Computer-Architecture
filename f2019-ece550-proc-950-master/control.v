module control(
	opcode, ALU_op,
	NE,LT,OF,
	BR, JP, ALUinB, DMwe, Rwe, Rdt, Rwd, Overfl, Jal, JR, Bex, Setx, CI, Setxo,
	ALUopm
);
  input [4:0]opcode, ALU_op;
  input NE,LT,OF;
  output BR, JP, ALUinB, DMwe, Rwe, Rdt, Rwd, Jal, JR, Bex, Setx, CI, Setxo;
  output [4:0]ALUopm;
  output [31:0]Overfl;
  
  wire [31:0]decode,dALUop;
  wire reverse_LT;
  wire BR_in1, BR_in2;
  wire [31:0]mid2;
  
  Decd decoder0(
  .select(opcode),
  .out(decode)
  );
  
  Decd decoder1(
  .select(ALU_op),
  .out(dALUop)
  );
  
  mux_32bit mux_01(
  .in1(32'b11),
  .in2(32'b10),
  .select(decode[0]&&dALUop[1]),
  .out(mid2)
  );
  
  mux_32bit mux_02(
  .in1(32'b01),
  .in2(mid2),
  .select(decode[0]&&dALUop[0]),
  .out(Overfl)
  );
  
  mux_5bit mux03(
  .in1(ALU_op),
  .in2(5'b0),
  .select(decode[0]),
  .out(ALUopm)
  );
  
 
  assign BR=(decode[2]&&NE)||(decode[6]&&NE&&~LT);
  assign JP = decode[1]||decode[3]||(decode[22]&&NE);
  assign ALUinB = decode[5]||decode[7]||decode[8];
  assign DMwe = decode[7];
  assign Rwe = decode[0]||decode[5]||decode[8]||decode[3]||decode[21];
  assign Rdt = decode[7]||decode[2]||decode[4]||decode[6];
  assign Rwd = decode[8];
  assign Jal = decode[3];
  assign JR = decode[4];
  assign Bex = decode[22];
  assign Setx = decode[21];
  assign CI = OF && ((decode[0]&&dALUop[0])||(decode[0]&&dALUop[1])||decode[5]);
  assign Setxo = CI||Setx;
  
endmodule