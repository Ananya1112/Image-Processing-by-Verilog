import sys  # used to interact strongly with the interpreter
from PIL import Image  # used for image processing related functions


def convert(ImageName):  # defining a function
    img = Image.open(ImageName)  # opens the image

    if img.mode != 'RGB':  # checks the mode of the image. If not RGB, it changes the image to RGB
        img = img.convert(mode='RGB')  # used to change mode of image

    width = img.width
    height = img.height

    filename = ImageName[:ImageName.find('.')] + '.coe'  # Finds the . in filename inorder to keep the same name
    imgcoe = open(filename, 'wt')  # w --> write mode && t --> text file
    imgcoe.write(';	VGA Memory Map\n')
    imgcoe.write('; .COE file with hex coefficients\n')
    imgcoe.write('; Height: {0}, Width: {1}\n'.format(height, width))  # Placeholder{} used for key of values in format
    imgcoe.write('memory_initialization_radix = 2;\n')
    imgcoe.write('memory_initialization_vector =\n')

    cnt = 0
    line_cnt = 0
    for h in range(height):  # this for loop will loop over all the pixels one by one
        for w in range(width):
            cnt += 1

            try:
                R, G, B = img.getpixel((w, h))  # to get RGB values of each pixel.getpixel uses coordinates,w & h here
            except IndexError:
                print('Index Error Occurred At:')
                print('h: {}, w:{}'.format(h, w))
                sys.exit()

            # bin() function returns binary equivalent of the type 0bxxxx. Hence we have used [2:]
            Rb = bin(R)[2:].zfill(8)  # zfill(num) is used to place 0s infront of the number till it is of size num
            Gb = bin(G)[2:].zfill(8)
            Bb = bin(B)[2:].zfill(8)

            try:
                imgcoe.write('{}{}{}'.format(Rb, Gb, Bb))
            except ValueError:  # ValueError = it is a problem with the content of the object we assigned value to.
                print('Value Error Occurred At:')
                print('Contents at h:{0} w:{1}'.format(h, w))
                print('R:{0} G:{1} B:{2}'.format(R, G, B))
                sys.exit()

            if w == width - 1 and h == height - 1:
                imgcoe.write(';')
            else:
                imgcoe.write(',\n')
                line_cnt += 1
    imgcoe.close()
    print('Xilinx Coefficients File:{} DONE'.format(filename))
    print('Size: h:{} pixels w:{} pixels'.format(height, width))
    print('COE file is 32 bits wide and {} bits deep'.format(line_cnt))
    print('Total addresses: {}'.format(width * height))


if __name__ == "__main__":
    ImageName = input('Enter the name of your image: ')
    convert(ImageName)
