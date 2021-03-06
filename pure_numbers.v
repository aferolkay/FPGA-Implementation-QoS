module pure_numbers(clk, number, addr ,data);

	parameter DATA_WIDTH = 135;
	input clk;
	input [3:0] number;
	output reg[7:0] data;
	input [7:0] addr;
	
	reg [7:0] 	zero[(DATA_WIDTH-1):0],
					one[(DATA_WIDTH-1):0],
					two[(DATA_WIDTH-1):0],
					three[(DATA_WIDTH-1):0],
					four[(DATA_WIDTH-1):0],
					five[(DATA_WIDTH-1):0],
					six[(DATA_WIDTH-1):0],
					seven[(DATA_WIDTH-1):0],
					eight[(DATA_WIDTH-1):0],
					nine[(DATA_WIDTH-1):0];
					
	initial begin
		$readmemh("zero.tv",zero);
		$readmemh("one.tv",one);
		$readmemh("two.tv",two);
		$readmemh("three.tv",three);
		$readmemh("four.tv",four);
		$readmemh("five.tv",five);
		$readmemh("six.tv",six);
		$readmemh("seven.tv",seven);
		$readmemh("eight.tv",eight);
		$readmemh("nine.tv",nine);
	end
	
	always@(posedge clk ) begin
		case(number)
			0:data=zero[addr];
			1:data=one[addr];
			2:data=two[addr];
			3:data=three[addr];
			4:data=four[addr];
			5:data=five[addr];
			6:data=six[addr];
			7:data=seven[addr];
			8:data=eight[addr];
			9:data=nine[addr];
			default:data=0;
			endcase
	end 
endmodule 