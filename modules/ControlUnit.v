module ControlUnit (

	//input clk, rst,
	
	input [31:0] instruction,
	
	// Output register bank
	output [1:0] TypeCode,
	output Load,
	output should_store_link,
	output [4:0] Rh,
	output [4:0] Ro,
	output [4:0] Rd,
	//output clock,
	
	// Output ALU Control
	output [31:0] extended_immediate,
	output is_immediate,
	output [3:0] OpCode,
	// output [1:0] TypeCode,
	
	
	// Output Data Memory
	// output Load,
	// output [1:0] TypeCode,
	output should_use_data_memory,
	// output clock,
	
	// Output CPSR Module
	output [3:0] CondField,
	output set_cond_bit, // Set Condition
	// output clock,
	
	
	// Output PC
	output should_branch,
	// output WriteCondition,
	output should_branch_to_link
	// output clock,
	//output reset
);

	// Register bank management:
	assign TypeCode = instruction [27:26];
	assign Load = instruction [20];
	assign should_store_link = instruction[27] & instruction[26] & instruction[23];
	assign Rd = instruction [19:15];
	assign Rh = instruction [14:10];
	assign Ro = instruction [9:5];
	//assign clock = clk;
	
	
	// ALU Control management
	assign OpCode = instruction [23:20];
	// assign TypeCode = instruction [27:26];
	assign is_immediate = instruction [25];
	assign extended_immediate = {22'b0, instruction [9:0] };
	
	
	// Data Memory management
	// assign Load = instruction [20];
	// assign TypeCode = instruction [27:26];
	// assign clock = clk;
	assign should_use_data_memory = ~instruction[27] & instruction[26] & instruction[20];
	
	
	// CPSR Module management
	assign CondField = instruction [31:28];
	assign set_cond_bit = instruction [24];
	// assign clock = clk;
	
	// PC management
	// assign clock = clk;
	//assign reset = rst;
	assign should_branch = instruction[27] & instruction[26];
	assign should_branch_to_link = instruction[27] & instruction[26] & instruction[22];	

endmodule