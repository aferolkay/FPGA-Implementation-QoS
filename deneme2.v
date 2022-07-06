module deneme2
	#(parameter DATA_WIDTH=8,
	  parameter ADDR_WIDTH = 20,
	  parameter DEPTH=76800) //38400
(
    input  [(ADDR_WIDTH-1):0] addr,
    input CLOCK_50,
	 input  [(DATA_WIDTH-1):0] data_in,
	 input write,
	 input ENABLE,
    output reg [(DATA_WIDTH-1):0] out_data
	 
);
    // Declare the ROM variable
    reg [DATA_WIDTH-1:0] rom [DEPTH-1:0];

    initial
    begin
        $readmemh("foto2_new.tv", rom);
    end

    always @ (posedge CLOCK_50)
	 begin
		 if(ENABLE==1)begin	
			if(write==1)
				begin
					out_data = 255;
					rom[addr] <= data_in;
				end
			else
				begin
					out_data = rom[addr];
				end
		 end
		 
		 else
			out_data=0;
	end

endmodule

//
//module deneme2_tb();
//	reg [19:0] addr = 0;
//	reg CLOCK_50 = 0;
//	wire [7:0] out_data;
//	
//	deneme2 ins1313(addr, CLOCK_50, out_data);
//	
//	always 
//		begin
//			#10; CLOCK_50 <= !CLOCK_50;
//		end
//		
//	always
//		begin
//			#20;
//			addr <= addr +1;
//		end
//
//endmodule
