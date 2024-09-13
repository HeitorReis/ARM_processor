module PC_main (

	input [31:0] branch_value,
	input [31:0] link_value,
	
	input should_branch,
	input write_condition,
	input should_branch_to_link,
	
	input clock,
	
	input reset,
	
	output reg signed [31:0] instruction_address
);
	
	initial begin
		instruction_address <= 5'b0;
	end
	
	always@( negedge clock ) begin // When clock ticksdown

		if (reset) // If reset
			instruction_address = 0; // Reset
		
		else begin // Else
			
			instruction_address = instruction_address + 1; // Add one to PC
		
			if (write_condition) begin // If should save
			
				if (should_branch) begin // If should branch
					
					if (should_branch_to_link) // If should branch to link
						instruction_address = link_value; // Then, branch to link
					
					else

						instruction_address = instruction_address + branch_value; // Else, branch to value
					
				end 
			
			end
		
		end
	
	end
	
	assign link = instruction_address;
	
endmodule