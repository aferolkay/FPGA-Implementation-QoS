module colored_numbers( clk, color , number , addr, data  );
	input clk;
	input [1:0] color , number;
	output[7:0] out;
	parameter Frame=10'd900;
	input[9:0] addr;
	
	reg [7:0] out;
	reg [7:0] 	red0[Frame] , red1[Frame] , red2[Frame] , red3[Frame] ,
					blue0[Frame] , blue1[Frame] , blue2[Frame] , blue2[Frame] ,
					green0[Frame] , green1[Frame] , green2[Frame] , green2[Frame] ,
					yellow0[Frame] , yellow1[Frame] , yellow2[Frame] , yellow2[Frame] ;

	initial begin
		$readmemh ("red0.tv",red0);
		$readmemh ("red1.tv",red1);
		$readmemh ("red2.tv",red2);
		$readmemh ("red3.tv",red3);
		
		$readmemh ("blue0.tv",blue0);
		$readmemh ("blue1.tv",blue1);
		$readmemh ("blue2.tv",blue2);
		$readmemh ("blue3.tv",blue3);
		
		$readmemh ("green0.tv",green0);
		$readmemh ("green0.tv",green0);
		$readmemh ("green0.tv",green0);
		$readmemh ("green0.tv",green0);
		
		$readmemh ("yellow0.tv",yellow0);
		$readmemh ("yellow0.tv",yellow0);
		$readmemh ("yellow0.tv",yellow0);
		$readmemh ("yellow0.tv",yellow0);
	end
	
	always @(posedge clk)
	begin
		case(color)
			2'b00	:begin
				
				case(number)
					2'b00	: out = red0[addr];
					2'b01	: out = red1[addr];
					2'b10	: out = red2[addr];
					2'b11	: out = red3[addr];
				endcase
					
	
			end
	
			2'b01	:begin
			
				case(number)
					2'b00	: out = green0[addr];
					2'b01	: out = green1[addr];
					2'b10	: out = green2[addr];
					2'b11	: out = green3[addr];
				endcase
			end
			
			2'b10	:begin
				
				case(number)
					2'b00	: out = blue0[addr];
					2'b01	: out = blue1[addr];
					2'b10	: out = blue2[addr];
					2'b11	: out = blue3[addr];
				endcase
			
			end
			2'b11	:begin
			
				case(number)
					2'b00	: out = yellow0[addr];
					2'b01	: out = yellow1[addr];
					2'b10	: out = yellow2[addr];
					2'b11	: out = yellow3[addr];
				endcase
			
			end
			
		endcase
		
	end
			
		
endmodule