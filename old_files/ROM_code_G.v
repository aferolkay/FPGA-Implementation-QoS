module ROM_code_G(out, addr, CS);
output[7:0] out;
parameter Frame=19'd307200;
input[18:0] addr;
input CS;
reg [7:0] out;
reg [7:0] ROM[Frame];

	initial begin
		$display("Loading image_G...");
		$readmemh ("G.mem",ROM);
		$display("Image loading completed.");
	end
	
always @(negedge CS)
	begin
		out=ROM[addr];
	end
endmodule
