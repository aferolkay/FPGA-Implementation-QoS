`timescale 1 ns / 1 ns 

module overall(input clk,
input one,
input zero,
input start,
input rst,
output reg [5:0] bf1_0 = 0,
output reg [5:0] bf1_1 = 0,
output reg [2:0] bf1_counter = 0,
output reg enable,
output reg [5:0] bf2_0 = 0,
output reg [5:0] bf2_1 = 0,
output reg [5:0] bf3_0 = 0,
output reg [5:0] bf3_1 = 0,
output reg [5:0] bf4_0 = 0,
output reg [5:0] bf4_1 = 0,
output reg [2:0] bf2_counter = 0,
output reg [2:0] bf3_counter = 0,
output reg [2:0] bf4_counter = 0,
output reg [7:0] bf1_dropped = 0,
output reg [7:0] bf2_dropped = 0,
output reg [7:0] bf3_dropped = 0,
output reg [7:0] bf4_dropped = 0,
output reg [7:0] bf1_total = 0,
output reg [7:0] bf2_total = 0,
output reg [7:0] bf3_total = 0,
output reg [7:0] bf4_total = 0,
output reg [7:0] bf1_read = 0,
output reg [7:0] bf2_read = 0,
output reg [7:0] bf3_read = 0,
output reg [7:0] bf4_read = 0,
output reg [3:0] output_data = 0

);



reg [27:0] modifiled_clk_counter = 0;
reg [3:0] middle = 0;
//reg enable;
reg [3:0] data;
reg state;
reg one_enabler;
reg zero_enabler;
reg [2:0] counter;

parameter st0_idle = 'd0;
parameter st1_input = 'd1;

						
initial begin
state = st0_idle;
end

always @ (posedge clk)
begin
	
	if (state == st0_idle)
		begin
			if (start == 0)
				state <= st1_input;
		end
	else if (state == st1_input)
		begin
			if (counter > 4)
				state <= st0_idle;
		end
end


always @ (posedge clk)
	begin
		
		if (enable == 1)
			enable = 0;				
		if (state == st0_idle)
			begin
				if (counter != 0)
					counter = 0;
			end
		else if (state == st1_input)
			begin
				if (counter < 4)
					begin
						if (one_enabler == 0 && one == 0)
							begin
								middle = middle << 1;
								middle[0] = 1;
								counter = counter + 1;
								one_enabler = one_enabler + 1;
							end
						else if (one_enabler != 0 && one == 1)
							one_enabler = 0;
						if (zero_enabler == 0 && zero == 0)												
							begin
								middle = middle << 1;
								middle[0] = 0;
								counter = counter + 1;
								zero_enabler = zero_enabler + 1;
							end
						else if (zero_enabler != 0 && zero == 1)
							zero_enabler = 0;
					end
				else if (counter == 4)
					begin
						data=middle;
						enable = 1;
						counter = counter + 1;
					end
			end
	end
always @ (posedge clk)	
begin		
			if (rst == 0)
				begin
					bf1_total = 0;
					bf1_dropped = 0;
					bf1_read = 0;
					bf4_total = 0;
					bf4_dropped = 0;
					bf4_read = 0;
				end	
			else if (rst == 1)
			begin
			if (enable ==1)
				begin
					
					if (data[3:2]==2'b11)
						begin
							bf4_0 = bf4_0 << 1;
							bf4_1 = bf4_1 << 1;
							bf4_0[0] = data[0];
							bf4_1[0] = data[1];
							bf4_counter = bf4_counter + 1;
							bf4_total = bf4_total + 1;
							
							if (bf4_counter > 6)
								begin
									bf4_dropped = bf4_dropped + 1;
									bf4_counter = 6;
								end
						end
					else if (data[3:2]==2'b10)
						begin
							bf3_0 = bf3_0 << 1;
							bf3_1 = bf3_1 << 1;
							bf3_0[0] = data[0];
							bf3_1[0] = data[1];
							bf3_counter = bf3_counter + 1;
							bf3_total = bf3_total + 1;
							if (bf3_counter > 6)
								begin
									bf3_dropped = bf3_dropped + 1;
									bf3_counter = 6;
								end
						end
					else if (data[3:2]==2'b01)
						begin
							bf2_0 = bf2_0 << 1;
							bf2_1 = bf2_1 << 1;
							bf2_0[0] = data[0];
							bf2_1[0] = data[1];
							bf2_counter = bf2_counter + 1;
							bf2_total = bf2_total + 1;
							if (bf2_counter > 6)
								begin
									bf2_dropped = bf2_dropped + 1;
									bf2_counter = 6;
								end
						end
					else if (data[3:2]==2'b00)
						begin
							bf1_0 = bf1_0 << 1;
							bf1_1 = bf1_1 << 1;
							bf1_0[0] = data[0];
							bf1_1[0] = data[1];
							bf1_counter = bf1_counter + 1;
							bf1_total = bf1_total + 1;
							if (bf1_counter > 6)
								begin
									bf1_dropped = bf1_dropped + 1;
									bf1_counter = 6;
								end
						end
						
				end
				if (modifiled_clk_counter != 150000000)
					modifiled_clk_counter = modifiled_clk_counter + 1;
				else if (modifiled_clk_counter == 150000000)
					begin
						if (bf4_counter == 6)
							begin
								output_data[3:2] = 2'b11;
								output_data[1] = bf4_1[5];
								output_data[0] = bf4_0[5];
								bf4_counter = bf4_counter - 1;
								bf4_read = bf4_read + 1;
							end
						else if (bf3_counter == 6)
							begin
								output_data[3:2] = 2'b10;
								output_data[1] = bf3_1[5];
								output_data[0] = bf3_0[5];
								bf3_counter = bf3_counter - 1;
								bf3_read = bf3_read + 1;
							end
						else if (bf4_counter == 5)
							begin
								output_data[3:2] = 2'b11;
								output_data[1] = bf4_1[4];
								output_data[0] = bf4_0[4];
								bf4_counter = bf4_counter - 1;
								bf4_read = bf4_read + 1;
							end
						else if (bf2_counter == 6)
							begin
								output_data[3:2] = 2'b01;
								output_data[1] = bf2_1[5];
								output_data[0] = bf2_0[5];
								bf2_counter = bf2_counter - 1;
								bf2_read = bf2_read + 1;
							end
						else if (bf3_counter == 5)
							begin
								output_data[3:2] = 2'b10;
								output_data[1] = bf3_1[4];
								output_data[0] = bf3_0[4];
								bf3_counter = bf3_counter - 1;
								bf3_read = bf3_read + 1;
							end
						else if (bf1_counter == 6)
							begin
								output_data[3:2] = 2'b00;
								output_data[1] = bf1_1[5];
								output_data[0] = bf1_0[5];
								bf1_counter = bf1_counter - 1;
								bf1_read = bf1_read + 1;
							end
						else if (bf4_counter == 4)
							begin
								output_data[3:2] = 2'b11;
								output_data[1] = bf4_1[3];
								output_data[0] = bf4_0[3];
								bf4_counter = bf4_counter - 1;
								bf4_read = bf4_read + 1;
							end
						else if (bf2_counter == 5)
							begin
								output_data[3:2] = 2'b01;
								output_data[1] = bf2_1[4];
								output_data[0] = bf2_0[4];
								bf2_counter = bf2_counter - 1;
								bf2_read = bf2_read + 1;
							end
						else if (bf3_counter == 4)
							begin
								output_data[3:2] = 2'b10;
								output_data[1] = bf3_1[3];
								output_data[0] = bf3_0[3];
								bf3_counter = bf3_counter - 1;
								bf3_read = bf3_read + 1;
							end
						else if (bf1_counter == 5)
							begin
								output_data[3:2] = 2'b00;
								output_data[1] = bf1_1[4];
								output_data[0] = bf1_0[4];
								bf1_counter = bf1_counter - 1;
								bf1_read = bf1_read + 1;
							end
						else if (bf2_counter == 4)
							begin
								output_data[3:2] = 2'b01;
								output_data[1] = bf2_1[3];
								output_data[0] = bf2_0[3];
								bf2_counter = bf2_counter - 1;
								bf2_read = bf2_read + 1;
							end
						else if (bf1_counter == 4)
							begin
								output_data[3:2] = 2'b00;
								output_data[1] = bf1_1[3];
								output_data[0] = bf1_0[3];
								bf1_counter = bf1_counter - 1;
								bf1_read = bf1_read + 1;
							end
						else if (bf1_counter == 3)
							begin
								output_data[3:2] = 2'b00;
								output_data[1] = bf1_1[2];
								output_data[0] = bf1_0[2];
								bf1_counter = bf1_counter - 1;
								bf1_read = bf1_read + 1;
							end
						else if (bf2_counter == 3)
							begin
								output_data[3:2] = 2'b01;
								output_data[1] = bf2_1[2];
								output_data[0] = bf2_0[2];
								bf2_counter = bf2_counter - 1;
								bf2_read = bf2_read + 1;
							end
						else if (bf1_counter == 2)
							begin
								output_data[3:2] = 2'b00;
								output_data[1] = bf1_1[1];
								output_data[0] = bf1_0[1];
								bf1_counter = bf1_counter - 1;
								bf1_read = bf1_read + 1;
							end
						else if (bf3_counter == 3)
							begin
								output_data[3:2] = 2'b10;
								output_data[1] = bf3_1[2];
								output_data[0] = bf3_0[2];
								bf3_counter = bf3_counter - 1;
								bf3_read = bf3_read + 1;
							end
						else if (bf2_counter == 2)
							begin
								output_data[3:2] = 2'b01;
								output_data[1] = bf2_1[1];
								output_data[0] = bf2_0[1];
								bf2_counter = bf2_counter - 1;
								bf2_read = bf2_read + 1;
							end
						else if (bf1_counter == 1)
							begin
								output_data[3:2] = 2'b00;
								output_data[1] = bf1_1[0];
								output_data[0] = bf1_0[0];
								bf1_counter = bf1_counter - 1;
								bf1_read = bf1_read + 1;
							end
						else if (bf4_counter == 3)
							begin
								output_data[3:2] = 2'b11;
								output_data[1] = bf4_1[2];
								output_data[0] = bf4_0[2];
								bf4_counter = bf4_counter - 1;
								bf4_read = bf4_read + 1;
							end
						else if (bf3_counter == 2)
							begin
								output_data[3:2] = 2'b10;
								output_data[1] = bf3_1[1];
								output_data[0] = bf3_0[1];
								bf3_counter = bf3_counter - 1;
								bf3_read = bf3_read + 1;
							end
						else if (bf2_counter == 1)
							begin
								output_data[3:2] = 2'b01;
								output_data[1] = bf2_1[0];
								output_data[0] = bf2_0[0];
								bf2_counter = bf2_counter - 1;
								bf2_read = bf2_read + 1;
							end
						else if (bf4_counter == 2)
							begin
								output_data[3:2] = 2'b11;
								output_data[1] = bf4_1[1];
								output_data[0] = bf4_0[1];
								bf4_counter = bf4_counter - 1;
								bf4_read = bf4_read + 1;
							end
						else if (bf3_counter == 1)
							begin
								output_data[3:2] = 2'b10;
								output_data[1] = bf3_1[0];
								output_data[0] = bf3_0[0];
								bf3_counter = bf3_counter - 1;
								bf3_read = bf3_read + 1;
							end
						else if (bf4_counter == 1)
							begin
								output_data[3:2] = 2'b11;
								output_data[1] = bf4_1[0];
								output_data[0] = bf4_0[0];
								bf4_counter = bf4_counter - 1;
								bf4_read = bf4_read + 1;
							end
						modifiled_clk_counter = 0;
					end
				end
		end

endmodule


