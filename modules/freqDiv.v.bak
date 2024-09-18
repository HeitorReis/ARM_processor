module freqDiv (CLOCK_50, clk);
	 input wire CLOCK_50;
	 reg S; 
	 reg [27:0] OUT;
	 output clk;

	always @ (posedge CLOCK_50)
	begin
		if(OUT == 27'd50000000)
		begin
			OUT = 0;
			S = 1;
		end
		else begin
			OUT = OUT + 1;
			S = 0;
		end
	end

	assign clk = S;

endmodule