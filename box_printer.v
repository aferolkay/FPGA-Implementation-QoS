module box_printer(
	input F25MHZ,
	input[1:0] buffer,
	input[2:0] box,
	
	input [5:0] bf1_0,
	input [5:0] bf1_1, 
	input [2:0] bf1_counter,
	
	input [5:0] bf2_0,
	input [5:0] bf2_1,  
	input [2:0] bf2_counter,
	
	input [5:0] bf3_0,
	input [5:0] bf3_1,  
	input [2:0] bf3_counter,
	
	input [5:0] bf4_0,
	input [5:0] bf4_1,  
	input [2:0] bf4_counter,
	
	
	
	output reg [2:0] number=4,
	output reg [1:0] color,
	
	output reg[9:0] y_low_lim=Y1 ,x_low_lim=X1 

);
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
	
	
//	reg[1:0] buffer,color; 
//	reg[2:0] box,number;
	
	
	
	always @ (posedge F25MHZ)
	begin
		
		case (buffer)
		
			2'b00:begin
				color=0;
				x_low_lim=X1+1;
				case(box)
					
					1:begin
					
						y_low_lim=Y1;
						
						if(bf1_counter>0)
						begin
							case ({bf1_1[0], bf1_0[0]})
								2'b00: number = 0;
								2'b01: number = 1;
								2'b10: number = 2;
								2'b11: number = 3;
							endcase
						end
						else  
							number=4;
					
					
					end
					2:begin
						
						y_low_lim=Y2;
						
						if(bf1_counter>1)
						begin
							case ({bf1_1[1], bf1_0[1]})
								2'b00: number = 0;
								2'b01: number = 1;
								2'b10: number = 2;
								2'b11: number = 3;
							endcase
						end
						else  
							number=4;
					end
					3:begin
						
						y_low_lim=Y3;
						
						if(bf1_counter>2)
						begin
							case ({bf1_1[2], bf1_0[2]})
								2'b00: number = 0;
								2'b01: number = 1;
								2'b10: number = 2;
								2'b11: number = 3;
							endcase
						end
						else  
							number=4;
					
					
					end
					4:begin
					
						y_low_lim=Y4;
						
						if(bf1_counter>3)
						begin
							case ({bf1_1[3], bf1_0[3]})
								2'b00: number = 0;
								2'b01: number = 1;
								2'b10: number = 2;
								2'b11: number = 3;
							endcase
						end
						else  
							number=4;
					end
					5:begin
					
						y_low_lim=Y5;
						
						if(bf1_counter>4)
						begin
							case ({bf1_1[4], bf1_0[4]})
								2'b00: number = 0;
								2'b01: number = 1;
								2'b10: number = 2;
								2'b11: number = 3;
							endcase
						end
						else  
							number=4;
					end
					6:begin
					
						y_low_lim=Y6;
						
						if(bf1_counter>5)
						begin
							case ({bf1_1[5], bf1_0[5]})
								2'b00: number = 0;
								2'b01: number = 1;
								2'b10: number = 2;
								2'b11: number = 3;
							endcase
						end
						else  
							number=4;
							
					end
					
				endcase
			
			
			
			
			end
			2'b01:begin
				
				color=2;
				x_low_lim=X2+1;
				case(box)
					
					1:begin
					
						y_low_lim=Y1;
						
						if(bf2_counter>0)
						begin
							case ({bf2_1[0], bf2_0[0]})
								2'b00: number = 0;
								2'b01: number = 1;
								2'b10: number = 2;
								2'b11: number = 3;
							endcase
						end
						else  
							number=4;
					
					
					end
					2:begin
						
						y_low_lim=Y2;
						
						if(bf2_counter>1)
						begin
							case ({bf2_1[1], bf2_0[1]})
								2'b00: number = 0;
								2'b01: number = 1;
								2'b10: number = 2;
								2'b11: number = 3;
							endcase
						end
						else  
							number=4;
					end
					3:begin
						
						y_low_lim=Y3;
						
						if(bf2_counter>2)
						begin
							case ({bf2_1[2], bf2_0[2]})
								2'b00: number = 0;
								2'b01: number = 1;
								2'b10: number = 2;
								2'b11: number = 3;
							endcase
						end
						else  
							number=4;
					
					
					end
					4:begin
					
						y_low_lim=Y4;
						
						if(bf2_counter>3)
						begin
							case ({bf2_1[3], bf2_0[3]})
								2'b00: number = 0;
								2'b01: number = 1;
								2'b10: number = 2;
								2'b11: number = 3;
							endcase
						end
						else  
							number=4;
					end
					5:begin
					
						y_low_lim=Y5;
						
						if(bf2_counter>4)
						begin
							case ({bf2_1[4], bf2_0[4]})
								2'b00: number = 0;
								2'b01: number = 1;
								2'b10: number = 2;
								2'b11: number = 3;
							endcase
						end
						else  
							number=4;
					end
					6:begin
					
						y_low_lim=Y6;
						
						if(bf2_counter>5)
						begin
							case ({bf2_1[5], bf2_0[5]})
								2'b00: number = 0;
								2'b01: number = 1;
								2'b10: number = 2;
								2'b11: number = 3;
							endcase
						end
						else  
							number=4;
							
					end
					
				endcase
			
			
			
			
			end
			2'b10:begin
			
				color=3;
				x_low_lim=X3+1;
				case(box)
					
					1:begin
					
						y_low_lim=Y1;
						
						if(bf3_counter>0)
						begin
							case ({bf3_1[0], bf3_0[0]})
								2'b00: number = 0;
								2'b01: number = 1;
								2'b10: number = 2;
								2'b11: number = 3;
							endcase
						end
						else  
							number=4;
					
					
					end
					2:begin
						
						y_low_lim=Y2;
						
						if(bf3_counter>1)
						begin
							case ({bf3_1[1], bf3_0[1]})
								2'b00: number = 0;
								2'b01: number = 1;
								2'b10: number = 2;
								2'b11: number = 3;
							endcase
						end
						else  
							number=4;
					end
					3:begin
						
						y_low_lim=Y3;
						
						if(bf3_counter>2)
						begin
							case ({bf3_1[2], bf3_0[2]})
								2'b00: number = 0;
								2'b01: number = 1;
								2'b10: number = 2;
								2'b11: number = 3;
							endcase
						end
						else  
							number=4;
					
					
					end
					4:begin
					
						y_low_lim=Y4;
						
						if(bf3_counter>3)
						begin
							case ({bf3_1[3], bf3_0[3]})
								2'b00: number = 0;
								2'b01: number = 1;
								2'b10: number = 2;
								2'b11: number = 3;
							endcase
						end
						else  
							number=4;
					end
					5:begin
					
						y_low_lim=Y5;
						
						if(bf3_counter>4)
						begin
							case ({bf3_1[4], bf3_0[4]})
								2'b00: number = 0;
								2'b01: number = 1;
								2'b10: number = 2;
								2'b11: number = 3;
							endcase
						end
						else  
							number=4;
					end
					6:begin
					
						y_low_lim=Y6;
						
						if(bf3_counter>5)
						begin
							case ({bf3_1[5], bf3_0[5]})
								2'b00: number = 0;
								2'b01: number = 1;
								2'b10: number = 2;
								2'b11: number = 3;
							endcase
						end
						else  
							number=4;
							
					end
					
				endcase
			
			
			
			
			end
			2'b11:begin
			
				color=1;
				x_low_lim=X4+1;
				case(box)
					
					1:begin
					
						y_low_lim=Y1;
						
						if(bf4_counter>0)
						begin
							case ({bf4_1[0], bf4_0[0]})
								2'b00: number = 0;
								2'b01: number = 1;
								2'b10: number = 2;
								2'b11: number = 3;
							endcase
						end
						else  
							number=4;
					
					
					end
					2:begin
						
						y_low_lim=Y2;
						
						if(bf4_counter>1)
						begin
							case ({bf4_1[1], bf4_0[1]})
								2'b00: number = 0;
								2'b01: number = 1;
								2'b10: number = 2;
								2'b11: number = 3;
							endcase
						end
						else  
							number=4;
					end
					3:begin
						
						y_low_lim=Y3;
						
						if(bf4_counter>2)
						begin
							case ({bf4_1[2], bf4_0[2]})
								2'b00: number = 0;
								2'b01: number = 1;
								2'b10: number = 2;
								2'b11: number = 3;
							endcase
						end
						else  
							number=4;
					
					
					end
					4:begin
					
						y_low_lim=Y4;
						
						if(bf4_counter>3)
						begin
							case ({bf4_1[3], bf4_0[3]})
								2'b00: number = 0;
								2'b01: number = 1;
								2'b10: number = 2;
								2'b11: number = 3;
							endcase
						end
						else  
							number=4;
					end
					5:begin
					
						y_low_lim=Y5;
						
						if(bf4_counter>4)
						begin
							case ({bf4_1[4], bf4_0[4]})
								2'b00: number = 0;
								2'b01: number = 1;
								2'b10: number = 2;
								2'b11: number = 3;
							endcase
						end
						else  
							number=4;
					end
					6:begin
					
						y_low_lim=Y6;
						
						if(bf4_counter>5)
						begin
							case ({bf4_1[5], bf4_0[5]})
								2'b00: number = 0;
								2'b01: number = 1;
								2'b10: number = 2;
								2'b11: number = 3;
							endcase
						end
						else  
							number=4;
							
					end
					
				endcase
			
			
			
			
			end
		
		endcase
		
	end
		
endmodule		
		
		
		
		
		
		
		
		
		
		
		
		
		