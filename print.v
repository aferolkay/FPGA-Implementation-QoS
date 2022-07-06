module print(
	input one,
	input zero,
	input start,
	input rst,
	input clk,RST,button,
	output  [7:0] R_out,B_out,G_out,
	output HS,VS,F25MHZ
	);
	wire [5:0] bf1_0;
	wire [5:0] bf1_1;  
	wire [2:0] bf1_counter;
	
	wire [5:0] bf2_0;
	wire [5:0] bf2_1;  
	wire [2:0] bf2_counter;
	
	wire [5:0] bf3_0;
	wire [5:0] bf3_1;  
	wire [2:0] bf3_counter;
	
	wire [5:0] bf4_0;
	wire [5:0] bf4_1;  
	wire [2:0] bf4_counter;
	
	wire [2:0] number;
	wire[1:0] color;
	wire new_frame;
	reg [5:0] frame_counter=0;
	
	wire[2:0] box;
	wire[1:0] buffer;
	wire[3:0] number_t;
	reg [3:0] temp_number;
	
	wire [3:0] DIGIT;

	localparam Y6  		=170;
	localparam Y5  		=200;
	localparam Y4  		=230;
	localparam Y3  		=260;
	localparam Y2  		=290;
	localparam Y1  		=320;
	localparam X1  		=50;
	localparam X2  		=120;
	localparam X3  		=190;
	localparam X4  		=260;
	
	localparam DX1  		=366;
	localparam DX2  		=426;
	localparam DX3  		=486;
	localparam DX4  		=546;
	localparam DX5  		=601;
	
	localparam DY1  		=337;
	localparam DY2  		=249;
	localparam DY3  		=154;
	
	localparam OUTPUT_Y    = 87;
	localparam OUTPUT_X	  = 151;

	wire [1:0] f_row;
	wire [3:0] f_column;
	
	wire  [7:0] bf1_dropped ;
	wire  [7:0] bf2_dropped ;
	wire  [7:0] bf3_dropped ;
	wire  [7:0] bf4_dropped ;
	wire  [7:0] bf1_total ;
	wire  [7:0] bf2_total ;
	wire  [7:0] bf3_total ;
	wire  [7:0] bf4_total ;
	wire  [7:0] bf1_read ;
	wire  [7:0] bf2_read ;
	wire  [7:0] bf3_read ;
	wire  [7:0] bf4_read ;
	wire [3:0] output_data;

	wire  [18:0]	CURSOR_1,CURSOR_2,CURSOR_3, CURSOR_4 ,CURSOR_Y;
	wire [9:0] block_location,table_location;
	wire[9:0] y_low_lim ,x_low_lim ;
	wire[9:0] y_tlow_lim ,x_tlow_lim; 
	wire [9:0] DIGIT_LOW_X, DIGIT_LOW_Y;
	reg [18:0] CURSOR;
	wire ON,ENABLE1,ENABLE2,ENABLE3,ENABLE4,write_wire,write_table,DIGIT_ACTIVE,BOX_1,BOX_2,BOX_3,BOX_4,BOX_5,BOX_6; //burada on belki reg'de olabilir F25MHZ
	wire [9:0] x_loc,y_loc;
	wire [7:0] DATA,DATA1,DATA2,DATA3,DATA4,data_in,number_data,DIGIT_DATA,DIGIT_LOCATION;
	reg write=0;
	reg[18:0] repaint;
	reg[2:0] i=0;
	wire enable;
	wire [3:0] NUMBER;
	
	assign 	ENABLE1 = (x_loc<640 && y_loc<120)? 1'b1: 1'b0,
				ENABLE2 = (x_loc<640 && y_loc<240  && y_loc>119)? 1'b1: 1'b0,
				ENABLE3 = (x_loc<640 && y_loc<360  && y_loc>239)? 1'b1: 1'b0,
				ENABLE4 = (x_loc<640 && y_loc<480  && y_loc>359)? 1'b1: 1'b0,
				DATA=write_wire? data_in :
					write_table? number_data :
						DIGIT_ACTIVE? DIGIT_DATA :
							DATA1+DATA2+DATA3+DATA4;

	deneme  a(CURSOR,clk,data_in,write,ENABLE1 && ON,DATA1);
	deneme2 b(CURSOR,clk,data_in,write,ENABLE2 && ON,DATA2);
	deneme3 c(CURSOR,clk,data_in,write,ENABLE3 && ON,DATA3);
	deneme4 d(CURSOR,clk,data_in,write,ENABLE4 && ON,DATA4);
	
	assign	R_out[7:5] = DATA[7:5],
				G_out[7:5] = DATA[4:2],
				B_out[7:6] = DATA[1:0];
				
	vga_sync sinyaller(clk, RST, HS, VS, ON, F25MHZ, x_loc, y_loc , new_frame );

	
	pure_numbers sayi_hafiza(clk,temp_number,table_location,number_data);
	pure_numbers digit_hafiza(clk,NUMBER,DIGIT_LOCATION,DIGIT_DATA);

	colored_numbers  hafiza( clk , color , number , block_location , data_in );	
	
	overall DUT(.clk(clk),.one(one),.zero(zero),.start(start),.rst(rst),
		.bf1_0(bf1_0),.bf1_1(bf1_1),.bf1_counter(bf1_counter),.enable(enable),
		.bf2_0(bf2_0),.bf2_1(bf2_1),.bf2_counter(bf2_counter),
		.bf3_0(bf3_0),.bf3_1(bf3_1),.bf3_counter(bf3_counter),
		.bf4_0(bf4_0),.bf4_1(bf4_1),.bf4_counter(bf4_counter), .bf1_dropped(bf1_dropped), 
		.bf2_dropped(bf2_dropped), .bf3_dropped(bf3_dropped), .bf4_dropped(bf4_dropped), 
		.bf1_total(bf1_total), .bf2_total(bf2_total), .bf3_total(bf3_total), 
		.bf4_total(bf4_total), .bf1_read(bf1_read), .bf2_read(bf2_read), 
		.bf3_read(bf3_read), .bf4_read(bf4_read), .output_data(output_data));
	
	box_printer selector( 					F25MHZ,
													buffer,
													box,
	
													bf1_0,
													bf1_1,
													bf1_counter,
	
													bf2_0,
													bf2_1,
													bf2_counter,
	
													bf3_0,
													bf3_1,
													bf3_counter,
												
													bf4_0,
													bf4_1,
													bf4_counter,
	
	
	
													number,
													color,
													y_low_lim ,
													x_low_lim 
	
	);
	
	table_printer(
					F25MHZ,
	f_row,
	f_column,
	
	bf1_dropped ,
	bf2_dropped ,
	bf3_dropped ,
	bf4_dropped ,
	bf1_total ,
	bf2_total ,
	bf3_total ,
	bf4_total ,
	bf1_read ,
	bf2_read ,
	bf3_read ,
	bf4_read ,
	

	y_tlow_lim ,
	x_tlow_lim ,
	number_t

);	
	digit_printer(
	F25MHZ,
	DIGIT,
	output_data,
	DIGIT_LOW_Y ,DIGIT_LOW_X ,
	NUMBER
);
	
	always@( posedge clk ) begin
	
		if( ON == 1 )begin
				CURSOR = (y_loc%120)*640 + x_loc;
				temp_number=number_t;
		end
				
	end
	

	
	
		assign 	write_wire = (x_loc> x_low_lim && x_loc < x_low_lim + 30 && y_loc> y_low_lim && y_loc< y_low_lim + 30) ? 1'b1: 1'b0,
					
					block_location =  ( (y_loc- (y_low_lim+1) )*30 + (x_loc -  (x_low_lim+1) ) ) * write_wire ,
					
					write_table = (x_loc > x_tlow_lim && x_loc < x_tlow_lim + 10 && y_loc > y_tlow_lim && y_loc < y_tlow_lim + 16) ? 1'b1: 1'b0,
					table_location = ( (y_loc - (y_tlow_lim+1) )*9 + (x_loc - (x_tlow_lim +1)))*write_table,
					
					BUFFER_1 = (x_loc > X1) && (x_loc < X1 + 30)? 1'b1 : 1'b0,
					BUFFER_2 = (x_loc > X2) && (x_loc < X2 + 30)? 1'b1 : 1'b0,
					BUFFER_3 = (x_loc > X3) && (x_loc < X3 + 30)? 1'b1 : 1'b0,
					BUFFER_4 = (x_loc > X4) && (x_loc < X4 + 30)? 1'b1 : 1'b0,
					buffer[1]= BUFFER_3||BUFFER_4,
					buffer[0]= BUFFER_2||BUFFER_4,
					
					BOX_1 = (y_loc > Y1 ) && (y_loc < Y1 + 30)? 1'b1 : 1'b0,
					BOX_2 = (y_loc > Y2 ) && (y_loc < Y2 + 30)? 1'b1 : 1'b0,
					BOX_3 = (y_loc > Y3 ) && (y_loc < Y3 + 30)? 1'b1 : 1'b0,
					BOX_4 = (y_loc > Y4 ) && (y_loc < Y4 + 30)? 1'b1 : 1'b0,
					BOX_5 = (y_loc > Y5 ) && (y_loc < Y5 + 30)? 1'b1 : 1'b0,
					BOX_6 = (y_loc > Y6 ) && (y_loc < Y6 + 30)? 1'b1 : 1'b0,
					box[2]=BOX_4 || BOX_5 || BOX_6,
					box[1]=BOX_2 || BOX_3 || BOX_6,
					box[0]=BOX_1 || BOX_3 || BOX_5,
					
					DROPPED = ( y_loc>DY1 && y_loc < DY1 + 16 )? 1'b1 : 1'b0 ,
					RECEIVED = ( y_loc>DY2 && y_loc < DY2 + 16 )? 1'b1 : 1'b0 ,
					TRANSMITTED = ( y_loc>DY3 && y_loc < DY3 + 16 )? 1'b1 : 1'b0 ,
					f_row[1]=RECEIVED || TRANSMITTED,
					f_row[0]=DROPPED|| TRANSMITTED,
					
					
					COLUMN1_1= ( x_loc>DX1 && x_loc < DX1 + 10 )? 1'b1 : 1'b0 ,
					COLUMN1_0= ( x_loc>DX1+9 && x_loc < DX1 + 19 )? 1'b1 : 1'b0 ,
					
					COLUMN2_1= ( x_loc>DX2 && x_loc < DX2 + 10 )? 1'b1 : 1'b0 ,
					COLUMN2_0= ( x_loc>DX2+9 && x_loc < DX2 + 19 )? 1'b1 : 1'b0 ,
					
					COLUMN3_1= ( x_loc>DX3 && x_loc < DX3 + 10 )? 1'b1 : 1'b0 ,
					COLUMN3_0= ( x_loc>DX3+9 && x_loc < DX3 + 19 )? 1'b1 : 1'b0 ,
					
					COLUMN4_1= ( x_loc>DX4 && x_loc < DX4 + 10 )? 1'b1 : 1'b0 ,
					COLUMN4_0= ( x_loc>DX4+9 && x_loc < DX4 + 19 )? 1'b1 : 1'b0 ,
					
					COLUMN5_1= ( x_loc>DX5 && x_loc < DX5 + 10 )? 1'b1 : 1'b0 ,
					COLUMN5_0= ( x_loc>DX5+9 && x_loc < DX5 + 19 )? 1'b1 : 1'b0 ,
					f_column[3]= COLUMN4_0 || COLUMN5_1 || COLUMN5_0,
					f_column[2]= COLUMN4_1 || COLUMN3_0 || COLUMN3_1 || COLUMN2_0,
					f_column[1]= COLUMN4_1 || COLUMN3_0 || COLUMN2_1 || COLUMN1_0 || COLUMN5_0,
					f_column[0]= COLUMN5_1 || COLUMN4_1 || COLUMN3_1 || COLUMN2_1 || COLUMN1_1,
					
					OUTPUT_ACTIVE_Y = ( y_loc>OUTPUT_Y && y_loc < OUTPUT_Y + 16 )? 1'b1 : 1'b0 ,
					OUTPUT_ACTIVE_X1 = ( x_loc>OUTPUT_X && x_loc < OUTPUT_X + 10 )? 1'b1 : 1'b0 ,
					OUTPUT_ACTIVE_X2 = ( x_loc>OUTPUT_X+10 && x_loc < OUTPUT_X + 20 )? 1'b1 : 1'b0 ,
					OUTPUT_ACTIVE_X3 = ( x_loc>OUTPUT_X+20 && x_loc < OUTPUT_X + 30 )? 1'b1 : 1'b0 ,
					OUTPUT_ACTIVE_X4 = ( x_loc>OUTPUT_X+30 && x_loc < OUTPUT_X + 40 )? 1'b1 : 1'b0 ,
					
					DIGIT[3] = OUTPUT_ACTIVE_X1 && OUTPUT_ACTIVE_Y,
					DIGIT[2] = OUTPUT_ACTIVE_X2 && OUTPUT_ACTIVE_Y,
					DIGIT[1] = OUTPUT_ACTIVE_X3 && OUTPUT_ACTIVE_Y,
					DIGIT[0] = OUTPUT_ACTIVE_X4 && OUTPUT_ACTIVE_Y,
					
					DIGIT_ACTIVE = (OUTPUT_ACTIVE_X1 || OUTPUT_ACTIVE_X2 || OUTPUT_ACTIVE_X3 || OUTPUT_ACTIVE_X4) && OUTPUT_ACTIVE_Y,
					DIGIT_LOCATION = (y_loc - DIGIT_LOW_Y-1)*9 + (x_loc - DIGIT_LOW_X-1);






	
		
		
endmodule
		