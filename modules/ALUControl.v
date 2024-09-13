module ALUControl (

	// Codes
	input [3:0] OpCode,
	input [1:0] TypeCode,
	input is_immediate,
	
	// Values
	input [31:0] immediate_value,
	input [31:0] RhValue,
	input [31:0] RoValue,
	
	// Outputs
	output zero,
	output negative,
	output [31:0] result,
	
	output [31:0] r1_value,
	output [31:0] r2_value
	
);

	// These enter ALU
	wire [31:0] operand1;
	wire [31:0] operand2;
	
	// Auxiliar
	wire [31:0] operand2_check;
	
	// Op1 is always RhValue
	assign operand1 = RhValue;
	
	assign operand2_check = {32{is_immediate}};
	
	// Op2 can be immediate or RoValue
	assign operand2 = (immediate_value & operand2_check) | (RoValue & (~ operand2_check));

	alu alu (
		.A(operand1),
		.B(operand2),
		.TypeCode(TypeCode),
		.OpCode(OpCode),
		.result(result),
		.negative(negative),
		.zero(zero),
		.r1_value(r1_value),
		.r2_value(r2_value)
		);
		
endmodule