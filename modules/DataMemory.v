// Quartus Prime Verilog Template
// Simple Dual Port RAM with separate read/write addresses and
// separate read/write clocks

module DataMemory
(
	input [31:0] new_data,
	input [31:0] mem_addr,
	input Load, clock, write_condition,
	input [1:0]TypeCode,
	
	output reg [31:0] ram_output,
	output reg [31:0] data_saved
);
	
	// Declare the RAM variable
	reg [31:0] ram [31:0];
	
	initial begin
	
		ram[0] <= 31'd10;
	
	end
	
	always @ (posedge clock) begin // Write in positive edge
	
		if (write_condition) begin
		
			// If Store -> WRITE
			if (~Load & (TypeCode == 2'b01))
				ram[mem_addr] <= new_data;
	end end
	
	always @ (negedge clock) begin // Read in negative edge
	
		if (write_condition) begin
		
			// If Load -> READ
			if (Load & (TypeCode == 2'b01)) begin
				ram_output <= ram[mem_addr];
			end
				
		end
		
	end
	
endmodule