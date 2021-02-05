module alu(data_operandA, data_operandB, ctrl_ALUopcode,
ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);

	input [31:0]data_operandA, data_operandB;
	input [4:0]ctrl_ALUopcode, ctrl_shiftamt;
	output [31:0]data_result;
	output isNotEqual, isLessThan, overflow;
	wire [31:0]out0, out2, out3, out4, out5;

 

	adder adder0(
	  .A(data_operandA[31:0]),
	  .B(data_operandB[31:0]),
	  .select(ctrl_ALUopcode[4:0]),
	  .result(out0[31:0]),
	  .overflow(overflow),
	  .isNotEqual(isNotEqual),
	  .isLessThan(isLessThan)
	);
	
	
	myAnd and0(
	  .in1(data_operandA[31:0]),
	  .in2(data_operandB[31:0]),
	  .out(out2[31:0])
	);
	
	myOr or0(
	  .in1(data_operandA[31:0]),
	  .in2(data_operandB[31:0]),
	  .out(out3[31:0])
	);
	
	SLL sll0(
	  .in(data_operandA[31:0]),
	  .select(ctrl_shiftamt[4:0]),
	  .out(out4[31:0])
	);
	
	SRA sra0(
	  .in(data_operandA[31:0]),
	  .select(ctrl_shiftamt[4:0]),
	  .out(out5[31:0])
	);
	

	  wire [31:0] shift_result;
	  wire [31:0] wire1;
	  wire [31:0] wire2;
	  assign shift_result = ctrl_ALUopcode[0] ? out5 : out4;
	  assign data_result = ctrl_ALUopcode[2] ? shift_result : wire1;
	  assign wire1 = ctrl_ALUopcode[1] ? wire2 : out0;
	  assign wire2 = ctrl_ALUopcode[0] ? out3 : out2;
	  
endmodule