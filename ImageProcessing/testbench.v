`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:17:49 05/08/2021
// Design Name:   image_processor
// Module Name:   C:/Users/Ananya Agrawal/Desktop/Image Processing/ImageProcessing/testbench.v
// Project Name:  ImageProcessing
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: image_processor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testbench;

	// Inputs
	reg clk, rsta, ena;
	reg reset;
	reg [0:0] wea;
	reg [7:0] R_in;
	reg [7:0] G_in;
	reg [7:0] B_in;
	reg [4:0] select;
	reg done_in;
	reg [23:0] dina;
	reg [14:0] addra;

	// Outputs
	wire done_out;
   wire [23:0]	douta;
	wire [7:0] R_out;
	wire [7:0] G_out;
	wire [7:0] B_out;
	
	reg [23:0] din [19039:0];

	// Instantiate the Unit Under Test (UUT)
	image_processor uut (.clk(clk), .reset(reset), .R_in(R_in), .G_in(G_in), .B_in(B_in), .select(select), .done_in(done_in), .done_out(done_out), .R_out(R_out), .G_out(G_out), .B_out(B_out));
   bram bram (.clka(clk),.rsta(rsta),.ena(ena),.wea(wea),.addra(addra),.dina(dina),.douta(douta));

	initial 
		clk = 0;
	
	always 
	begin
		#0.001 clk = !clk;
	end

	initial 
	begin
		// Initialize Inputs
		reset = 0;
		R_in = 8'b0;
		G_in = 8'b0;
		B_in = 8'b0;
		select = 4'b0111;
		done_in = 0;
		wea = 0;
		ena = 0;
		addra = 0;
		dina = 0;
		rsta = 0;
	end
      
	`define filename "C:\\Users\\Ananya Agrawal\\Desktop\\output.coe"		
		
	// Add stimulus here
	task output_coe;
		integer FileHandle;
		begin
			addra = 0;
			FileHandle = $fopen(`filename,"wb");
		
			begin
				$fwrite(FileHandle,";	VGA Memory Map\n");
				$fwrite(FileHandle,"; .COE file with binary coefficients\n");
				$fwrite(FileHandle,"; Height : 119 ,Width:160\n");
				$fwrite(FileHandle,"memory_initialization_radix = 2\n");
				$fwrite(FileHandle,"memory_initialization_vector =\n");
			end
			
			while(addra < 15'd19040) @(posedge clk)
				begin
						if(addra == 15'd19039)
							begin
								$fwrite(FileHandle,"%b;",din[addra]);
								addra = addra + 1;
							end
						else
							begin
								$fwrite(FileHandle,"%b,\n",din[addra]);
								addra = addra + 1;
							end
				end
			$fclose(FileHandle);
		end
	endtask
	
   initial 
	begin
	   addra = 0;
	   while(addra < 15'd19040)@(posedge clk)
		   begin
			   done_in = 0;
			   wea = 0;
			   ena = 1;
				#0.01;
			   {R_in,G_in,B_in} = douta;
			   done_in = 1;
				#0.01;
			   if(done_out == 1)
				  begin
					  din[addra] = {R_out,G_out,B_out};
					  addra = addra + 1;
				  end	
		   end
   end
	
   initial
	begin
	   #700 output_coe;
	   #10 $finish;	
   end	
      
endmodule

