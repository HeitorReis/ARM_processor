module registerBank ( // Inputs are Rh, Ro (Op2), Clock, TypeCode, WriteData (to Rd), Rd

	// Addresses
	input [4:0] RhAddress,
	input [4:0] RoAddress,
	input [4:0] RdAddress,
	
	// Values
	input [31:0] WriteData,
	input [31:0] new_LinkValue,
	
	// Codes
	input Load,
	input [1:0] TypeCode,
	input write_condition,
	input should_store_link,
	
	// Clock
	input clock,
	
	// Outputs
	output [31:0] RhValue,
	output [31:0] RoValue,
	output [31:0] RdValue,
	output [31:0] LinkValue,
	
	// Test
	output [31:0] r0_value,
	output [31:0] r31_value
);

	reg [31:0] regBank [31:0]; // Register bank
	reg [31:0] LinkRegister;
	
	initial begin
	
		regBank[16] = 5'd16;
		regBank[31] = 5'd31;
	
	end

	always@(posedge clock) begin
		// If should write
		if (write_condition) begin
			if ( (TypeCode == 2'b00) | ( (TypeCode == 2'b01) & Load ) ) begin
			
					regBank[RdAddress] = WriteData; // Write
					
			end
			if ( should_store_link )
				LinkRegister = new_LinkValue;
		end
		
	end
	
	assign r31_value = regBank[31];
	assign r0_value = regBank[0];
	
	assign RhValue = regBank[RhAddress];
	assign RoValue = regBank[RoAddress];
	assign RdValue = regBank[RdAddress];
	
	assign LinkValue = LinkRegister;
	
endmodule