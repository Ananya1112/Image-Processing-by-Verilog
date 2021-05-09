`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:43:54 05/08/2021
// Design Name:   bram
// Module Name:   C:/Users/Ananya Agrawal/Desktop/Image Processing/ImageProcessing/bram_tb.v
// Project Name:  ImageProcessing
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: bram
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module bram_tb;

	// Inputs
	reg clka;
	reg rsta;
	reg ena;
	reg [0:0] wea;
	reg [14:0] addra;
	reg [23:0] dina;

	// Outputs
	wire [23:0] douta;

	// Instantiate the Unit Under Test (UUT)
	bram uut (
		.clka(clka), 
		.rsta(rsta), 
		.ena(ena), 
		.wea(wea), 
		.addra(addra), 
		.dina(dina), 
		.douta(douta)
	);
	
	initial begin
		clka = 0;
	end
	
	always begin 
		#0.01 clka = !clka;
	end
	
	initial 
	begin
		// Initialize Inputs
		rsta = 0;
		ena = 0;
		wea = 0;
		addra = 0;
		dina = 0;
   end    
	
	// Add stimulus here
	always @(posedge clka)
	begin
		wea=0;
		ena=1;
		if(addra < 15'd19040)
			begin
				$display("data at addr %d is %b",addra,douta);
				addra = addra + 1;
			end
		else
			$finish;
	end

endmodule

