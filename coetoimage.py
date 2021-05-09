from PIL import Image  # PIL is the Python Imaging Library; provides python interpreter with image editing capabilities.

def coe_to_image(filename):
    imgdata = []  # imgdata is a list to store pixel data of the image
    file = open(filename, 'r')
    fileline = file.readlines()  # Returns a list with each line as a list item, so fileline is a list with all lines
    for line in fileline[5:]:  # 5: so as to ignore the starting 5 lines
        rgbtuple = (int(line[:8], 2), int(line[8:16], 2), int(line[16:24], 2))
        # Tuples are used to store multiple items in a single variable and are written with round brackets
        # Tuple items are ordered, unchangeable, and allow duplicate values.
        # Tuple items are indexed, the first item has index [0], the second item has index [1] etc

        imgdata.append(rgbtuple)  # The append() method adds a single item to the existing list
        # It doesn’t return a new list of items but will modify the original list
        # by adding the item to the end of the list

    IMAGE_SIZE = (160, 119)
    image = Image.new('RGB', IMAGE_SIZE)  # PIL.Image.new() method creates a new image with the given mode and size.
    # Size is given as a (width, height)-tuple, in pixels.
    image.putdata(imgdata)
    # putdata() copies pixel data to image. This method copies data from a sequence object into the image,
    # starting at the upper left corner (0, 0), and continuing until either the image or the sequence ends.
    image.save("result_image.png")  # to save the image with the name specified


if __name__ == '__main__':
    filename = input('Enter the name of .ceo file:')
    coe_to_image(filename)
