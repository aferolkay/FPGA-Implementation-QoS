module table_printer(
	input F25MHZ,
	input[1:0] f_row,
	input[3:0] f_column,
	
	input [7:0] bf1_dropped ,
	input[7:0] bf2_dropped ,
	input [7:0] bf3_dropped ,
	input [7:0] bf4_dropped ,
	input [7:0] bf1_total ,
	input [7:0] bf2_total ,
	input [7:0] bf3_total ,
	input [7:0] bf4_total ,
	input [7:0] bf1_read ,
	input [7:0] bf2_read ,
	input [7:0] bf3_read ,
	input [7:0] bf4_read ,
	

	output reg[9:0] y_tlow_lim=DY1 ,x_tlow_lim=DX1 ,
	output reg [3:0] number=12

);
	wire[7:0] number_transfer_total , number_received_total, number_dropped_total;

	assign 	number_transfer_total= bf1_read+ bf2_read+ bf3_read+ bf4_read,
				number_received_total= bf1_total + bf2_total + bf3_total + bf4_total, 
				number_dropped_total = bf1_dropped + bf2_dropped + bf3_dropped + bf4_dropped;
	


	localparam DX1  		=366;
	localparam DX2  		=426;
	localparam DX3  		=486;
	localparam DX4  		=546;
	localparam DX5  		=601;
	
	localparam DY1  		=337;
	localparam DY2  		=249;
	localparam DY3  		=154;
	
	always @ (posedge F25MHZ)
	begin
	
	case (f_column)
		1:begin
			x_tlow_lim=DX1+1;
			case ( f_row )
				1:begin
					y_tlow_lim=DY1;
					number=  (bf1_dropped-bf1_dropped%10)/10;
				end
				2:begin
					y_tlow_lim=DY2;
					number=  (bf1_total-bf1_total%10)/10;
				end
				3:begin
					y_tlow_lim=DY3;
					number= (bf1_read-bf1_read%10)/10;
				end
				default: number=12;
			endcase
		end
		2:begin
			x_tlow_lim=DX1+10;
			case ( f_row )
				1:begin
					y_tlow_lim=DY1;
					number =  bf1_dropped%10;
				end
				2:begin
					y_tlow_lim=DY2;
					number = bf1_total%10;
				end
				3:begin
					y_tlow_lim=DY3;
					number = bf1_read%10;
				end
				default: number=12;
			endcase
		end
		3:begin
			x_tlow_lim=DX2+1;
			case ( f_row )
				1:begin
					y_tlow_lim=DY1;
					number= (bf2_dropped-bf2_dropped%10)/10;
				end
				2:begin
					y_tlow_lim=DY2;
					number= (bf2_total-bf2_total%10)/10;
				end
				3:begin
					y_tlow_lim=DY3;
					number= (bf2_read-bf2_read%10)/10;
				end
				default: number=12;
			endcase
		end
		4:begin
			x_tlow_lim=DX2+10;
			case ( f_row )
				1:begin
					y_tlow_lim=DY1;
					number = bf2_dropped%10;
				end
				2:begin
					y_tlow_lim=DY2;
					number = bf2_total%10;
				end
				3:begin
					y_tlow_lim=DY3;
					number = bf2_read%10;
				end
				default: number=12;
			endcase
		end
		5:begin
			x_tlow_lim=DX3+1;
			case ( f_row )
				1:begin
					y_tlow_lim=DY1;
					number= (bf3_dropped-bf3_dropped%10)/10;
				end
				2:begin
					y_tlow_lim=DY2;
					number= (bf3_total-bf3_total%10)/10;
				end
				3:begin
					y_tlow_lim=DY3;
					number= (bf3_read-bf3_read%10)/10;
				end
				default: number=12;
			endcase
		end
		6:begin
			x_tlow_lim=DX3+10;
			case ( f_row )
				1:begin
					y_tlow_lim=DY1;
					number = bf3_dropped%10;
				end
				2:begin
					y_tlow_lim=DY2;
					number = bf3_total%10;
				end
				3:begin
					y_tlow_lim=DY3;
					number = bf3_read%10;
				end
				default: number=12;
			endcase
		end
		7:begin
			x_tlow_lim=DX4+1;
			case ( f_row )
				1:begin
					y_tlow_lim=DY1;
					number= (bf4_dropped-bf4_dropped%10)/10;
				end
				2:begin
					y_tlow_lim=DY2;
					number= (bf4_total-bf4_total%10)/10;
				end
				3:begin
					y_tlow_lim=DY3;
					number= (bf4_read-bf4_read%10)/10;
				end
				default: number=12;
			endcase
		end
		8:begin
			x_tlow_lim=DX4+10;
			case ( f_row )
				1:begin
					y_tlow_lim=DY1;
					number = bf4_dropped%10;
				end
				2:begin
					y_tlow_lim=DY2;
					number = bf4_total%10;
				end
				3:begin
					y_tlow_lim=DY3;
					number = bf4_read%10;
				end
				default: number=12;
			endcase
		end
		9:begin
			x_tlow_lim=DX5+1;
			case ( f_row )
				1:begin
					y_tlow_lim=DY1;
					number= (number_dropped_total-(number_dropped_total%10))/10;
				end
				2:begin
					y_tlow_lim=DY2;
					number= (number_received_total-(number_received_total%10))/10;
				end
				3:begin
					y_tlow_lim=DY3;
					number= (number_transfer_total-(number_transfer_total%10))/10;
				end
				default: number=12;
			endcase
		end
		10:begin
			x_tlow_lim=DX5+10; //10 olacak
			case ( f_row )
				1:begin
					y_tlow_lim=DY1;
					number = number_dropped_total%10;
				end
				2:begin
					y_tlow_lim=DY2;
					number = number_received_total%10;
				end
				3:begin
					y_tlow_lim=DY3;
					number = number_transfer_total%10;
				end
				default: number=12;
			endcase
		end
		
	endcase
	
	
	end 
endmodule 