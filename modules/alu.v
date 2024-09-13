module alu (
	input signed [31:0] A,
	input signed [31:0] B,
	input [1:0] TypeCode,
	input [3:0] OpCode,
	output reg signed [31:0] result,
	output reg negative,
	output reg zero,
	
	// Test
	output [31:0] r1_value,
	output [31:0] r2_value
	); // inputs and outputs

	always @* begin
	
		if (TypeCode == 2'b00) begin
		
			case (OpCode)
			
				//TypeCode == 00
				4'b0000: result <= A + B; // ADD
				4'b0001: result <= A - B; // SUB
				4'b0010: result <= A * B; // MUL
				4'b0011: result <= A / B; // DIV
				4'b0100: result <= A & B; // AND
				4'b0101: result <= A | B; // OR
				4'b0110: result <= A ^ B; // XOR
				4'b0111: result <= -A;  // NOT
				4'b1000: result <= B;  // MOV
			
				default: result <= 32'b0;
			
			endcase
		
		end else begin
					
			result = B; // Address for load and store
				
		end
		
	end
	
	always@(result) begin
		if (result == 0)
			zero = 1;
		else
			zero = 0;
		
		if (result < 0)
			negative = 1;
		else
			negative = 0;
	end
	
	// Testing
	assign r1_value = A;
	assign r2_value = B;

endmodule