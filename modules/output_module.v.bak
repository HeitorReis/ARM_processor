module output_module(

	input [5:0]number,
	
	output [6:0]HEX0,
	output [6:0]HEX1,
	output [6:0]HEX2,
	output [6:0]HEX3

);

	wire [31:0] number0;
	wire [31:0] number1;
	wire [31:0] number2;
	wire [31:0] number3;
	
	assign number0 = number;
	assign number1 = number/10;
	assign number2 = number/100;
	assign number3 = number/1000;
	
	to_display hex0(
		.number(number0),
		.display(HEX0)
	);
	
	to_display hex1(
		.number(number1),
		.display(HEX1)
	);
	
	to_display hex2(
		.number(number2),
		.display(HEX2)
	);
	
	to_display hex3(
		.number(number3),
		.display(HEX3)
	);
	
endmodule

module to_display(

	input [31:0] number,
	
	output reg [6:0] display
	
);
	
		always@* begin
			
				case(number)
					32'd0:	display = 7'b1000000;
					32'd1:	display = 7'b1111001;
					32'd2:	display = 7'b0100100;
					32'd3:	display = 7'b0110000;
					32'd4:	display = 7'b0011001;
					32'd5:	display = 7'b0010010;
					32'd6:	display = 7'b0000010;
					32'd7:	display = 7'b1111000;
					32'd8:	display = 7'b0000000;
					32'd9:	display = 7'b0011000;
					32'd10:	display = 7'b1000000;
					32'd11:	display = 7'b1111001;
					32'd12:	display = 7'b0100100;
					32'd13:	display = 7'b0110000;
					32'd14:	display = 7'b0011001;
					32'd15:	display = 7'b0010010;
					32'd16:	display = 7'b0000010;
					32'd17:	display = 7'b1111000;
					32'd18:	display = 7'b0000000;
					32'd19:	display = 7'b0011000;
					32'd20:	display = 7'b1000000;
					32'd21:	display = 7'b1111001;
					32'd22:	display = 7'b0100100;
					32'd23:	display = 7'b0110000;
					32'd24:	display = 7'b0011001;
					32'd25:	display = 7'b0010010;
					32'd26:	display = 7'b0000010;
					32'd27:	display = 7'b1111000;
					32'd28:	display = 7'b0000000;
					32'd29:	display = 7'b0011000;
					32'd30:	display = 7'b1000000;
					32'd31:	display = 7'b1111001;
					32'd32:	display = 7'b0100100;
					32'd33:	display = 7'b0110000;
					32'd34:	display = 7'b0011001;
					32'd35:	display = 7'b0010010;
					32'd36:	display = 7'b0000010;
					32'd37:	display = 7'b1111000;
					32'd38:	display = 7'b0000000;
					32'd39:	display = 7'b0011000;
					32'd40:	display = 7'b1000000;
					32'd41:	display = 7'b1111001;
					32'd42:	display = 7'b0100100;
					32'd43:	display = 7'b0110000;
					32'd44:	display = 7'b0011001;
					32'd45:	display = 7'b0010010;
					32'd46:	display = 7'b0000010;
					32'd47:	display = 7'b1111000;
					32'd48:	display = 7'b0000000;
					32'd49:	display = 7'b0011000;
					32'd50:	display = 7'b1000000;
					32'd51:	display = 7'b1111001;
					32'd52:	display = 7'b0100100;
					32'd53:	display = 7'b0110000;
					32'd54:	display = 7'b0011001;
					32'd55:	display = 7'b0010010;
					32'd56:	display = 7'b0000010;
					32'd57:	display = 7'b1111000;
					32'd58:	display = 7'b0000000;
					32'd59:	display = 7'b0011000;
					32'd60:	display = 7'b1000000;
					32'd61:	display = 7'b1111001;
					32'd62:	display = 7'b0100100;
					32'd63:	display = 7'b0110000;
					32'd64:	display = 7'b0011001;
					32'd65:	display = 7'b0010010;
					32'd66:	display = 7'b0000010;
					32'd67:	display = 7'b1111000;
					32'd68:	display = 7'b0000000;
					32'd69:	display = 7'b0011000;
					
					default: display = 7'b1111110;
				endcase		
		end
	
endmodule