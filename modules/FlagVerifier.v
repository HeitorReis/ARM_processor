module FlagVerifier (

	input [3:0] cond_field,
	input [3:0] flags,
	
	output reg write_condition

);

	always@* begin
	
		case (cond_field)
		
			4'b0000: write_condition = 1; 	// ALWAYS case
			
			4'b0001: begin						// EQUAL case
			
				if (flags[0])
					write_condition = 1;
					
				else
					write_condition = 0;
				
			end
			
			4'b0010: begin						// NOT EQUAL case
			
				if (~flags[0])
					write_condition = 1;
					
				else
					write_condition = 0;
				
			end
			
			4'b0011: begin						// GREATER THAN case
			
				if (~flags[0] & ~flags[1])
					write_condition = 1;
					
				else
					write_condition = 0;
				
			end
			
			4'b0100: begin						// GREATER THAN OR EQUAL case
			
				if (flags[0] | ~flags[1])
					write_condition = 1;
					
				else
					write_condition = 0;
				
			end
			
			4'b0101: begin						// LESS THAN case
			
				if (flags[1])
					write_condition = 1;
					
				else
					write_condition = 0;
				
			end
			
			4'b0110:begin						// LESS THAN OR EQUAL case
			
				if (flags[0] | flags[1])
					write_condition = 1;
					
				else
					write_condition = 0;
				
			end
			
			default: write_condition = 0;
			
		endcase
	
	end

endmodule