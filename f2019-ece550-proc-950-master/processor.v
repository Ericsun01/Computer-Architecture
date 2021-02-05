/**
 * READ THIS DESCRIPTION!
 *
 * The processor takes in several inputs from a skeleton file.
 *
 * Inputs
 * clock: this is the clock for your processor at 50 MHz
 * reset: we should be able to assert a reset to start your pc from 0 (sync or
 * async is fine)
 *
 * Imem: input data from imem
 * Dmem: input data from dmem
 * Regfile: input data from regfile
 *
 * Outputs
 * Imem: output control signals to interface with imem
 * Dmem: output control signals and data to interface with dmem
 * Regfile: output control signals and data to interface with regfile
 *
 * Notes
 *
 * Ultimately, your processor will be tested by subsituting a master skeleton, imem, dmem, so the
 * testbench can see which controls signal you active when. Therefore, there needs to be a way to
 * "inject" imem, dmem, and regfile interfaces from some external controller module. The skeleton
 * file acts as a small wrapper around your processor for this purpose.
 *
 * You will need to figure out how to instantiate two memory elements, called
 * "syncram," in Quartus: one for imem and one for dmem. Each should take in a
 * 12-bit address and allow for storing a 32-bit value at each address. Each
 * should have a single clock.
 *
 * Each memory element should have a corresponding .mif file that initializes
 * the memory element to certain value on start up. These should be named
 * imem.mif and dmem.mif respectively.
 *
 * Importantly, these .mif files should be placed at the top level, i.e. there
 * should be an imem.mif and a dmem.mif at the same level as process.v. You
 * should figure out how to point your generated imem.v and dmem.v files at
 * these MIF files.
 *
 * imem
 * Inputs:  12-bit address, 1-bit clock enable, and a clock
 * Outputs: 32-bit instruction
 *
 * dmem
 * Inputs:  12-bit address, 1-bit clock, 32-bit data, 1-bit write enable
 * Outputs: 32-bit data at the given address
 *
 */
module processor(
    // Control signals
    clock,                          // I: The master clock
    reset,                          // I: A reset signal

    // Imem
    address_imem,                   // O: The address of the data to get from imem
    q_imem,                         // I: The data from imem

    // Dmem
    address_dmem,                   // O: The address of the data to get or put from/to dmem
    data,                           // O: The data to write to dmem
    wren,                           // O: Write enable for dmem
    q_dmem,                         // I: The data from dmem

    // Regfile
    ctrl_writeEnable,               // O: Write enable for regfile
    ctrl_writeReg,                  // O: Register to write to in regfile
    ctrl_readRegA,                  // O: Register to read from port A of regfile
    ctrl_readRegB,                  // O: Register to read from port B of regfile
    data_writeReg,                  // O: Data to write to for regfile
    data_readRegA,                  // I: Data from port A of regfile
    data_readRegB,                   // I: Data from port B of regfile
	 
	 
	 
);
    // Control signals
    input clock, reset;

    // Imem
    output [11:0] address_imem;
    input [31:0] q_imem;

    // Dmem
    output [11:0] address_dmem;
    output [31:0] data;
    output wren;
    input [31:0] q_dmem;

    // Regfile
    output ctrl_writeEnable;
    output [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
    output [31:0] data_writeReg;
    input [31:0] data_readRegA, data_readRegB;

    /* YOUR CODE STARTS HERE */
	 wire [31:0]pcout;
	 wire [4:0]in_s1, in_s2, in_d, in_s2mid, in_dmid;
	 wire Bex, Rwe, Rdt, Setxo, Jal, ALUinB, Rwd, Setx, BR, JP, CI, JR;
	 wire NE, LT, OF;
	 wire [31:0]adder0_out;
	 wire [31:0]adder1_out;
	 wire [16:0]immed;
	 wire [26:0]target;
	 wire [31:0]extend_out;
	 wire [31:0]in_aluB;
	 wire [31:0]in_aluA;
	 wire [31:0]alu_out;
	 wire [31:0]mux7_out;
	 wire [31:0]mux8_out;
	 wire [31:0]targetextend;
	 wire [31:0]mux9_out;
	 wire [31:0]mux10_out;
	 wire [31:0]mux11_out;
	 wire [31:0]mux12_out;
	 wire [31:0]mux13_out;
	 wire [31:0]Overfl;
	 wire [4:0]ALUopm;
	
	  
	 control control_0(
	 .opcode(q_imem[31:27]), 
	 .ALU_op(q_imem[6:2]),
	 .NE(NE),
	 .LT(LT),
	 .OF(OF),
	 .BR(BR), 
	 .JP(JP), 
	 .ALUinB(ALUinB), 
	 .DMwe(wren), 
	 .Rwe(Rwe), 
	 .Rdt(Rdt), 
	 .Rwd(Rwd), 
	 .Overfl(Overfl), 
	 .Jal(Jal),  
	 .JR(JR), 
	 .Bex(Bex), 
	 .Setx(Setx), 
	 .CI(CI), 
	 .Setxo(Setxo),
	 .ALUopm(ALUopm)
); 
	  
	 dffe_ref pc0(
	 .q(pcout),
	 .d(mux11_out),
	 .clk(clock),
	 .en(1'b1),
	 .clr(reset)
	 );
	 
	  alu adder0(
	 .data_operandA(32'b1), 
	 .data_operandB(pcout), 
	 .ctrl_ALUopcode(5'b00000), 
	 .ctrl_shiftamt(q_imem[11:7]), 
	 .data_result(adder0_out),
	 .isNotEqual(), 
	 .isLessThan(), 
	 .overflow()
	 );
	 
	  alu adder1(
	 .data_operandA(adder0_out), 
	 .data_operandB(extend_out), 
	 .ctrl_ALUopcode(5'b00000), 
	 .ctrl_shiftamt(q_imem[11:7]), 
	 .data_result(adder1_out),
	 .isNotEqual(), 
	 .isLessThan(), 
	 .overflow()
	 );
	 
	 assign address_imem[11:0] = pcout[11:0];
	 /* operation of Imem*/
	 assign in_d[4:0] = q_imem[26:22];
	 assign in_s1[4:0] = q_imem[21:17];
	 assign in_s2[4:0] = q_imem[16:12];
	 assign immed[16:0] = q_imem[16:0];
	 assign target[26:0] = q_imem[26:0];
	 assign in_aluA[31:0] = data_readRegA[31:0];
	 assign targetextend[31:0] = {pcout[31:27],target[26:0]};
	 assign ctrl_writeEnable = Rwe;
	 
	 
	 mux_5bit mux1(
	 .in1(5'b11110),
	 .in2(in_s1),
	 .select(Bex),
	 .out(ctrl_readRegA)
	 );
	 
	 mux_5bit mux2(
	 .in1(5'b00000),
	 .in2(in_s2mid),
	 .select(Bex),
	 .out(ctrl_readRegB)
	 );
	 
	 mux_5bit mux3(
	 .in1(in_dmid),
	 .in2(in_s2),
	 .select(Rdt),
	 .out(in_s2mid)
	 );
	 
	 mux_5bit mux4(
	 .in1(5'b11110),
	 .in2(in_dmid),
	 .select(Setxo),
	 .out(ctrl_writeReg)
	 );
	 
	 mux_5bit mux5(
	 .in1(5'b11111),
	 .in2(in_d),
	 .select(Jal),
	 .out(in_dmid)
	 );
	 
	 alu alu0(
	 .data_operandA(in_aluA), 
	 .data_operandB(in_aluB), 
	 .ctrl_ALUopcode(ALUopm), 
	 .ctrl_shiftamt(q_imem[11:7]), 
	 .data_result(alu_out),
	 .isNotEqual(NE), 
	 .isLessThan(LT), 
	 .overflow(OF)
	 );
    
	 sx_17to32 signext(
	 .in(immed[16:0]), 
	 .out(extend_out[31:0])
	 );
	 
	 mux_32bit mux6(
	 .in1(extend_out),
	 .in2(data_readRegB),
	 .select(ALUinB),
	 .out(in_aluB)
	 );
	 
	 assign address_dmem[11:0] = alu_out[11:0];
	 assign data[31:0] = data_readRegB[31:0];
	 /* operator of Dmem*/
	 
	  mux_32bit mux7(
	 .in1(q_dmem),
	 .in2(alu_out),
	 .select(Rwd),
	 .out(mux7_out)
	 );
	 
	  mux_32bit mux8(
	 .in1(adder0_out),
	 .in2(mux7_out),
	 .select(Jal),
	 .out(mux8_out)
	 );
	 
	  mux_32bit mux9(
	 .in1(targetextend),
	 .in2(mux8_out),
	 .select(Setx),
	 .out(mux9_out)
	 );
	 
	  mux_32bit mux10(
	 .in1(Overfl),
	 .in2(mux9_out),
	 .select(CI),
	 .out(mux10_out)
	 );
	 
	 assign data_writeReg = mux10_out;
	  mux_32bit mux12(
	 .in1(adder1_out),
	 .in2(adder0_out),
	 .select(BR),
	 .out(mux12_out)
	 );
	 
	  mux_32bit mux13(
	 .in1(targetextend),
	 .in2(mux12_out),
	 .select(JP),
	 .out(mux13_out)
	 );
	 
	  mux_32bit mux11(
	 .in1(data_readRegB),
	 .in2(mux13_out),
	 .select(JR),
	 .out(mux11_out)
	 );
	 
	 
	 
	 
endmodule
