module colored_numbers( clk, color , number , addr, data  );
	parameter DATA_WIDTH=900;
	input clk;
	input [2:0]   number;
	input [1:0]   color;
	output reg[7:0] data;
	input[9:0] addr;
	
	reg [7:0] 	red0[(DATA_WIDTH-1):0] , red1[(DATA_WIDTH-1):0] , red2[(DATA_WIDTH-1):0] , red3[(DATA_WIDTH-1):0] ,
					blue0[(DATA_WIDTH-1):0] , blue1[(DATA_WIDTH-1):0] , blue2[(DATA_WIDTH-1):0] , blue3[(DATA_WIDTH-1):0] ,
					green0[(DATA_WIDTH-1):0] , green1[(DATA_WIDTH-1):0] , green2[(DATA_WIDTH-1):0] , green3[(DATA_WIDTH-1):0] ,
					yellow0[(DATA_WIDTH-1):0] , yellow1[(DATA_WIDTH-1):0] , yellow2[(DATA_WIDTH-1):0] , yellow3[(DATA_WIDTH-1):0] ;

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
		$readmemh ("green1.tv",green1);
		$readmemh ("green2.tv",green2);
		$readmemh ("green3.tv",green3);
		
		$readmemh ("yellow0.tv",yellow0);
		$readmemh ("yellow1.tv",yellow1);
		$readmemh ("yellow2.tv",yellow2);
		$readmemh ("yellow3.tv",yellow3);
	end
	
	always @(posedge clk)
	begin
		case(color)
			2'b00	:begin
				
				case(number)
					3'b000	: data = red0[addr];
					3'b001	: data = red1[addr];
					3'b010	: data = red2[addr];
					3'b011	: data = red3[addr];
					3'b100	: data=255;	
				endcase
					
	
			end
	
			2'b01	:begin
			
				case(number)
					3'b000	: data = green0[addr];
					3'b001	: data = green1[addr];
					3'b010	: data = green2[addr];
					3'b011	: data = green3[addr];
					3'b100	: data=255;	
				endcase
			end
			
			2'b10	:begin
				
				case(number)
					3'b000	: data = blue0[addr];
					3'b001	: data = blue1[addr];
					3'b010	: data = blue2[addr];
					3'b011	: data = blue3[addr];
					3'b100	: data=255;	
				endcase
			
			end
			2'b11	:begin
			
				case(number)
					3'b000	: data = yellow0[addr];
					3'b001	: data = yellow1[addr];
					3'b010	: data = yellow2[addr];
					3'b011	: data = yellow3[addr];
					3'b100	: data=255;	
				endcase
			
			end
			
		endcase
		
	end
			
		
endmodule