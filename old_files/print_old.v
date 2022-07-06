module print(
	input clk,RST,
	output reg[7:0] R_out,B_out,G_out ,
	//output [7:0] R_out,B_out,G_out,
	
	output HS,VS
	);
	
	//reg[7:0] R_out,B_out,G_out
	
	reg [18:0]	CURSOR;
	parameter Frame=19'd307200;
	wire ON,F24MHZ; //burada on belki reg'de olabilir
	wire [9:0] x_loc,y_loc;
	reg[7:0] COLOUR_DATA_R[Frame], COLOUR_DATA_G[Frame],COLOUR_DATA_B[Frame];

	vga_sync sinyaller(clk, RST, HS, VS, ON, F24MHZ, x_loc, y_loc );
	
	
	initial begin
		CURSOR=0;
		$display("Loading image...");
		$readmemh ("R.mem",COLOUR_DATA_R);
		$readmemh ("G.mem",COLOUR_DATA_G);
		$readmemh ("B.mem",COLOUR_DATA_B);
		$display("Image loading completed.");
	end
	

	
	always@( posedge F24MHZ ) begin
	
		if( ON == 1 )begin
			CURSOR = y_loc*640 + x_loc;
			R_out=COLOUR_DATA_R[CURSOR]; //COLOUR_IN <= COLOUR_DATA[{STATE}];
			G_out=COLOUR_DATA_G[CURSOR];
			B_out=COLOUR_DATA_B[CURSOR];
			end
		else begin
			R_out=0;
			G_out=0;
			B_out=0;
			end	
	end
	
		
endmodule
		