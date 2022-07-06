module digit_printer(
	input F25MHZ,
	input[3:0] DIGIT,
	input [3:0] output_data,
	output reg[9:0] DIGIT_LOW_Y ,DIGIT_LOW_X ,
	output reg [3:0] NUMBER=12

);


	
	localparam OUTPUT_Y    = 87;
	localparam OUTPUT_X	  = 151;
	
	always @ (posedge F25MHZ)
	begin
	DIGIT_LOW_Y = OUTPUT_Y;
		case(DIGIT)
				8: 
				begin
					DIGIT_LOW_X = OUTPUT_X;
					NUMBER = output_data[3];
				end
				4: 
				begin
					DIGIT_LOW_X = OUTPUT_X+9;
					NUMBER = output_data[2];
				end
				2: 
				begin
					DIGIT_LOW_X = OUTPUT_X+18;
					NUMBER = output_data[1];
				end
				1: 
				begin
					DIGIT_LOW_X = OUTPUT_X+27;
					NUMBER = output_data[0];
				end
				default NUMBER = 12;
		endcase
	
	end 
endmodule 