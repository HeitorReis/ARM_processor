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

	// ALU input
	reg [31:0] operand2;
	
	always@(is_immediate or immediate_value or RoValue) begin
		
		if (is_immediate)
			operand2 = immediate_value;
		else
			operand2 = RoValue;
		
	end

	alu alu (
		.A(RhValue),
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