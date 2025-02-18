module Processor(

	input CLOCK_50,
	input [3:0] KEY,
	input [17:0] SW,
	
	output [0:0] LEDR,
	output [6:0] HEX0,
	output [6:0] HEX1,
	output [6:0] HEX2,
	output [6:0] HEX3,
	output [6:0] HEX4,
	output [6:0] HEX5,
	output [6:0] HEX6,
	output [6:0] HEX7

);

	freqDiv freqDiv (.CLOCK_50(CLOCK_50), .clk(divided_clock));
	
	wire true_clock;
	assign true_clock = divided_clock & ~SW[17];
	
	wire [31:0] output0;
	wire [31:0] output1;
	wire [31:0] output2;
	wire [31:0] output3;
	
	integrated modules(
	
		.clock(true_clock),
		.reset(SW[16]),
		
		.peripheral_signal(SW[15]),
		.peripheral_value(SW[4:0]),
		
		.write_condition(LEDR[0]),
		
		.output0(output0),
		.output1(output1),
		.output2(output2),
		.output3(output3),		
	
	);

	output_module output_group0( // r31 value

		.number(output0),
		
		.HEX0(HEX0),
		.HEX1(HEX1),
		.HEX2(HEX2),
		.HEX3(HEX3)

	);
	output_module output_group1( // r0 value

		.number(output1),
		
		.HEX0(),
		.HEX1(),
		.HEX2(),
		.HEX3()

	);
	output_module output_group2( // ALU Result

		.number(output2),
		
		.HEX0(HEX4),
		.HEX1(HEX5),
		.HEX2(),
		.HEX3()

	);
	output_module output_group3( // Current Instr

		.number(output3),
		
		.HEX0(HEX6),
		.HEX1(HEX7),
		.HEX2(),
		.HEX3()

	);

endmodule