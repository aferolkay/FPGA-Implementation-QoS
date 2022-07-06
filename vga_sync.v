module vga_sync
	(
		input clk, reset,
		output hsync, vsync, video_on , CLK,
		output wire [9:0] x, y,
		output wire new_frame
	);
	
	localparam H_DISPLAY  		=640;//horizontal display area 640
	localparam H_L_BORDER 		=48 ;//horizontal left border
	localparam H_R_BORDER 		=16 ;//horizontal right border
	localparam H_RETRACE  		=96 ;//horizontal retrace
	localparam H_MAX      		=H_DISPLAY + H_L_BORDER + H_R_BORDER + H_RETRACE - 1;
	localparam START_H_RETRACE =H_DISPLAY + H_R_BORDER;
	localparam END_H_RETRACE 	=H_DISPLAY + H_R_BORDER + H_RETRACE - 1;
	
	localparam V_DISPLAY       = 480; // vertical display area
	localparam V_T_BORDER      = 33; // vertical top border
	localparam V_B_BORDER      = 10; // vertical bottom border
	localparam V_RETRACE       = 2; // vertical retrace
	localparam V_MAX           = V_DISPLAY + V_T_BORDER + V_B_BORDER + V_RETRACE - 1;
   localparam START_V_RETRACE = V_DISPLAY + V_B_BORDER;
	localparam END_V_RETRACE   = V_DISPLAY + V_B_BORDER + V_RETRACE - 1;
	

	F_25MHz freq_downgrade( clk, CLK);
	
	reg[18:0] 	counter=0;
	reg[9:0] h_count_reg, v_count_reg ;
	reg vsync_reg, hsync_reg;
	
	initial begin
	h_count_reg=0;
	v_count_reg=0;
	end
	
	
	always@(posedge CLK, posedge reset) 
		if(reset) begin
			v_count_reg<=0;
			h_count_reg<=0;
			counter=0;
			end
		
		else begin
			h_count_reg = (h_count_reg == H_MAX) ? 0 : h_count_reg + 1;  //sonradan küçük eşittir yapmaya da çalış
			v_count_reg = (h_count_reg == H_MAX)?
									(v_count_reg == V_MAX) ? 0 : v_count_reg + 1
									:v_count_reg;			
			counter=counter+1;
				
		end
		
	assign 	
				x=h_count_reg,
				y=v_count_reg,
				video_on = (h_count_reg < H_DISPLAY) && (v_count_reg < V_DISPLAY) ,
				hsync = ~(h_count_reg >= START_H_RETRACE && h_count_reg <= END_H_RETRACE),
				vsync = ~(v_count_reg >= START_V_RETRACE && v_count_reg <= END_V_RETRACE),
				count=counter,
				new_frame = h_count_reg==H_MAX && v_count_reg ==V_MAX ;
	
	endmodule
	


	
//module vga_sync_tb();
//
//reg   clk, reset;
//wire hsync, vsync, video_on , CLK;
//wire [9:0] x, y;
//wire [19:0] count;
//
//vga_sync dut(.clk(clk), .reset(reset), .hsync(hsync),
//					.vsync(vsync), .video_on(video_on),.CLK(CLK),.count(count),
//					.x(x),.y(y) );
//					
//initial begin
//clk=0;
//reset=0;
//end
//
//always begin
//	clk <= 0; #5 ; clk<=1; #5 ;
//end

//endmodule
