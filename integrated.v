module integrated (

	input clock,
	input reset,
	
	output write_condition,
	
	output [31:0] output0,
	output [31:0] output1,
	output [31:0] output2,
	output [31:0] output3

);

	assign output0 = r31_value;
	assign output1 = r0_value;
	assign output2 = alu_result;
	assign output3 = current_instr_addr;

	// Values
	wire [31:0] extended_immediate;
	wire [31:0] current_link_value;
	wire [31:0] alu_result;
	reg [31:0] write_in_reg;
	wire [31:0] rh_value;
	wire [31:0] ro_value;
	
	wire [31:0] op2_value;
	wire [31:0] r0_value;
	wire [31:0] r31_value;

	// Codes
	wire [1:0] TypeCode;
	wire Load_bit;
	wire should_store_link;
	wire is_immediate;
	wire [3:0] OpCode;
	wire should_use_data_memory;
	wire [3:0] CondField;
	wire set_cond_bit;
	wire should_branch;
	wire should_branch_to_link;
	wire [31:0] current_instr_code;
	wire zero_bit;
	wire neg_bit;
	wire should_write_using_ram;
	
	// Addresses
	wire [4:0] rh_addr;
	wire [4:0] ro_addr;
	wire [4:0] rd_addr;
	wire [31:0] current_instr_addr;

	// UC
	ControlUnit integrated0(

		//input clk, rst,
		
		.instruction(current_instr_code),
		
		// Output register bank
		.TypeCode(TypeCode),
		.Load(Load_bit),
		.should_store_link(should_store_link),
		.Rh(rh_addr),
		.Ro(ro_addr),
		.Rd(rd_addr),
		
		// Output ALU Control
		.extended_immediate(extended_immediate),
		.is_immediate(is_immediate),
		.OpCode(OpCode),
		// output [1:0] TypeCode,
		
		
		// Output Data Memory
		// output WriteCondition,
		// output Load,
		// output [1:0] TypeCode,
		.should_use_data_memory(should_use_data_memory),
		
		// Output CPSR Module
		.CondField(CondField),
		.set_cond_bit(set_cond_bit), // Set Condition
		
		
		// Output PC
		.should_branch(should_branch),
		// output WriteCondition,
		.should_branch_to_link(should_branch_to_link)
	);
	
	PC_main integrated1(

		.branch_value(alu_result), // ALU Result
		.link_value(current_link_value), // RegBank
		
		.should_branch(should_branch),
		.write_condition(write_condition),
		.should_branch_to_link(should_branch_to_link),
		
		.clock(clock),
		
		.reset(reset),
		
		.instruction_address(current_instr_addr)
	);
	
	InstructionMemory integrated2(
		.addr(current_instr_addr),
		.clock(clock), 
		.instruction(current_instr_code),
		.first_instr_line_test() // Test
	);
	
	registerBank integrated3( // Inputs are Rh, Ro (Op2), Clock, TypeCode, WriteData (to Rd), Rd

		// Addresses
		.RhAddress(rh_addr),
		.RoAddress(ro_addr),
		.RdAddress(rd_addr),
		
		// Values
		.WriteData(write_in_reg),
		.new_LinkValue(current_instr_addr),
		
		// Codes
		.Load(Load_bit),
		.TypeCode(TypeCode),
		.write_condition(write_condition),
		.should_store_link(should_store_link),
		
		// Clock
		.clock(clock),
		
		// Outputs
		.RhValue(rh_value),
		.RoValue(ro_value),
		.RdValue(), // Testing
		
		.LinkValue(current_link_value),
		
		// Test
		.r0_value(r0_value),
		.r31_value(r31_value)
	);
	
	ALUControl integrated4(

		// Codes
		.OpCode(OpCode),
		.TypeCode(TypeCode),
		.is_immediate(is_immediate),
		
		// Values
		.immediate_value(extended_immediate),
		.RhValue(rh_value),
		.RoValue(ro_value),
		
		// Outputs
		.zero(zero_bit),
		.negative(neg_bit),
		.result(alu_result),
		
		.r1_value(), // A
		.r2_value(op2_value) // B
	);

	CPSR_module	integrated5(

		.ALUresult(alu_result),
		
		.set_cond_bit(set_cond_bit),
		
		.zero(zero_bit),
		.negative(neg_bit),
		
		.Cond_field(CondField),
		
		.clock(clock),
		
		.write_condition(write_condition),
		
		.current_flags() // Test
		
	);
	
	DataMemory integrated6(
		.new_data(rh_value),
		.mem_addr(alu_result),
		.Load(Load_bit),
		.clock(clock),
		.write_condition(write_condition),
		.TypeCode(TypeCode),
		
		.ram_output(ram_output),
		
		.data_saved() // Test
	);
	
	assign should_write_using_ram = TypeCode[0] & ~TypeCode[1] & ~Load_bit;
	
	always@(should_write_using_ram or ram_output or alu_result) begin
	
		if (should_write_using_ram)
			write_in_reg = ram_output;
		else
			write_in_reg = alu_result;
	end
	
endmodule