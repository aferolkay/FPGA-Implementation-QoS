module F_25MHz (input clk, output CLK);
	
	
	reg DOWNCOUNTER=0;
	
	always @(posedge clk) 
		DOWNCOUNTER<=~DOWNCOUNTER;
		
	assign CLK=DOWNCOUNTER;

endmodule 