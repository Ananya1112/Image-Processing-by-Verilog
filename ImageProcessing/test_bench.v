`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:41:05 05/08/2021
// Design Name:   image_processor
// Module Name:   C:/Users/Ananya Agrawal/Desktop/Image Processing/ImageProcessing/test_bench.v
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

module test_bench;

	// Inputs
	reg clk;
	reg reset;
	reg [7:0] R_in;
	reg [7:0] G_in;
	reg [7:0] B_in;
	reg [4:0] select;
	reg done_in;

	// Outputs
	wire done_out;
	wire [7:0] R_out;
	wire [7:0] G_out;
	wire [7:0] B_out;

	// Instantiate the Unit Under Test (UUT)
	image_processor uut (
		.clk(clk), 
		.reset(reset), 
		.R_in(R_in), 
		.G_in(G_in), 
		.B_in(B_in), 
		.select(select), 
		.done_in(done_in), 
		.done_out(done_out), 
		.R_out(R_out), 
		.G_out(G_out), 
		.B_out(B_out)
	);
	
	image bram (
	    .clka(clk),
		 .rsta(rsta),
		 .ena(ena),
		 .wea(wea),
		 .addra(addra),
		 .dina(dina),.
		 douta(douta)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		R_in = 0;
		G_in = 0;
		B_in = 0;
		select = 0;
		done_in = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

