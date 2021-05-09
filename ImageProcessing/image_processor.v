`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:45:54 05/06/2021 
// Design Name: 
// Module Name:    image_processor 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module image_processor(
    input clk,
    input reset,
    input [7:0] R_in,
    input [7:0] G_in,
    input [7:0] B_in,
    input [4:0] select,
	 input done_in,
    output reg done_out,
    output reg [7:0] R_out,
    output reg [7:0] G_out,
    output reg [7:0] B_out
    );
	 
reg [8:0] red_x,green_x,blue_x;
	 
always @ (posedge clk)
	begin
	  if(select == 4'b0000)  //RGB to Grayscale
	    begin
	     if(reset == 1)
          begin
            R_out <= 0;
            G_out <= 0;
            B_out <= 0;
				done_out <= 0;
          end
        else
          begin
            if(done_in == 1)
				  begin
				    R_out <= (R_in>>2) + (R_in>>5) + (G_in>>1) + (G_in>>4) + (B_in>>4) + (B_in>>5);
       		    G_out <= (R_in>>2) + (R_in>>5) + (G_in>>1) + (G_in>>4) + (B_in>>4) + (B_in>>5);
					 B_out <= (R_in>>2) + (R_in>>5) + (G_in>>1) + (G_in>>4) + (B_in>>4) + (B_in>>5);
					 done_out <= 1;
              end
				else
				  begin
				    R_out <= 0;
                G_out <= 0;
                B_out <= 0;
					 done_out <= 0;
              end
			 end
		 end
		 else if(select == 4'b0001)  //Mode to increase brightness
	    begin
	     if(reset == 1)
          begin
            R_out <= 0;
            G_out <= 0;
            B_out <= 0;
				done_out <= 0;
          end
        else
          begin
            if(done_in == 1)
				  begin
				    red_x = R_in+ 60;
					 green_x = G_in + 60;
					 blue_x = B_in + 60;
					 if(red_x > 255)
						 R_out <= 255;
					 else
					    R_out <= red_x;
					 if(green_x > 255)
						 G_out <= 255;
					 else
						 G_out <= green_x;
					 if(blue_x > 255)	
						 B_out <= 255;
					 else 
						 B_out <= blue_x;
					 done_out <= 1;	
              end
				else
				  begin
				    R_out <= 0;
                G_out <= 0;
                B_out <= 0;
					 done_out <= 0;
              end
			 end
		 end
		 else if(select == 4'b0010)  //Mode to increase darkness
	    begin
	     if(reset == 1)
          begin
            R_out <= 0;
            G_out <= 0;
            B_out <= 0;
				done_out <= 0;
          end
        else
          begin
            if(done_in == 1)
				  begin
				    red_x = R_in - 7;
					 green_x = G_in - 7;
					 blue_x = B_in - 7;
					 if(red_x < 0)
						 R_out <= 0;
					 else
					    R_out <= red_x;
					 if(green_x < 0)
						 G_out <= 0;
					 else
						 G_out <= green_x;
					 if(blue_x < 0)	
						 B_out <= 0;
					 else 
						 B_out <= blue_x;
					 done_out <= 1;	
              end
				else
				  begin
				    R_out <= 0;
                G_out <= 0;
                B_out <= 0;
					 done_out <= 0;
              end
			 end
		 end
		 else if(select == 4'b0011)  //Mode to invert colors
	    begin
	     if(reset == 1)
          begin
            R_out <= 0;
            G_out <= 0;
            B_out <= 0;
				done_out <= 0;
          end
        else
          begin
            if(done_in == 1)
				  begin
					 R_out <= 255 - R_in;
					 G_out <= 255 - G_in;
					 B_out <= 255 - B_in;
					 done_out <= 1;	
              end
				else
				  begin
				    R_out <= 0;
                G_out <= 0;
                B_out <= 0;
					 done_out <= 0;
              end
			 end
		 end
		 else if(select == 4'b0100)  //Mode for RED filter
	    begin
	     if(reset == 1)
          begin
            R_out <= 0;
            G_out <= 0;
            B_out <= 0;
				done_out <= 0;
          end
        else
          begin
            if(done_in == 1)
				  begin
					 R_out <= R_in;
					 G_out <= 0;
					 B_out <= 0;
					 done_out <= 1;	
              end
				else
				  begin
				    R_out <= 0;
                G_out <= 0;
                B_out <= 0;
					 done_out <= 0;
              end
			 end
		 end
		 else if(select == 4'b0101)  //Mode for GREEN filter
	    begin
	     if(reset == 1)
          begin
            R_out <= 0;
            G_out <= 0;
            B_out <= 0;
				done_out <= 0;
          end
        else
          begin
            if(done_in == 1)
				  begin
					 R_out <= 0;
					 G_out <= G_in;
					 B_out <= 0;
					 done_out <= 1;	
              end
				else
				  begin
				    R_out <= 0;
                G_out <= 0;
                B_out <= 0;
					 done_out <= 0;
              end
			 end
		 end
		 else if(select == 4'b0110)  //Mode for BLUE filter
	    begin
	     if(reset == 1)
          begin
            R_out <= 0;
            G_out <= 0;
            B_out <= 0;
				done_out <= 0;
          end
        else
          begin
            if(done_in == 1)
				  begin
					 R_out <= 0;
					 G_out <= 0;
					 B_out <= B_in;
					 done_out <= 1;	
              end
				else
				  begin
				    R_out <= 0;
                G_out <= 0;
                B_out <= 0;
					 done_out <= 0;
              end
			 end
		 end
		 else if(select == 4'b0111)  //Mode for Original Image
	    begin
	     if(reset == 1)
          begin
            R_out <= 0;
            G_out <= 0;
            B_out <= 0;
				done_out <= 0;
          end
        else
          begin
            if(done_in == 1)
				  begin
					 R_out <= R_in;
					 G_out <= G_in;
					 B_out <= B_in;
					 done_out <= 1;	
              end
				else
				  begin
				    R_out <= 0;
                G_out <= 0;
                B_out <= 0;
					 done_out <= 0;
              end
			 end
		 end
	end
endmodule
