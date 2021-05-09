# Image-Processing-by-Verilog

In this project, we have used Verilog HDL to implement image processing techniques. The module applies different filters as per the choice of the user. 
The various filters available are:

 1. Grayscale
 2. Color Inversion [Negative]
 3. Increase Brightness
 4. Decrease Brightness
 5. RED filter
 6. BLUE filter
 7. GREEN filter
 8. Original Image

### To  use the module inorder to implement the above mentioned techniques, follow these steps.

- Install python and install PIL and OpenCV library.
- Run the coe_generator.py with the address of the image to get the .coe file of that image.
- Initiate a bram in Xilinx with that .coe file.
- Use the image processor.v module for the module code
- And the testbench.v code for stimulus 
- Stimulate the module and get the output .coe file
- Use the python code coetoimage.py to change that .coe file to an image


>**.coe file** is the coefficient file which contains information of each pixel of the image in either hexadecimal or binary format. For this project we have used binary .coe file. The verilog module can only process the file in .coe format hence it becomes necessary to change it into one. The output is also recieved in terms of .coe file.
The python script changes it back to .png image.

### Block Memory

The converted image [.coe] is such that it has as many rows as the total number of pixel and each row having 24 bit (8X3). So a 160X119p image will have 19040 rows. Then a Block Memory Module (bram) is created in the project which has as many addresses as the number of rows and 24 data bits. This Memory module, like other modules can be instantiated and used in the main module. The module has inputs as clock, address, data_in and read-write command and the data_out as output. So, for a given address, it gives the data at that address during that clock cycle. And thus can give only one data set at a time (here one pixel).
