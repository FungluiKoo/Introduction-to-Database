# working with codecs
#Import this python module to work with additional character sets:
import codecs

# An important consideration is how you open your file.
# For example, when you use FILE / SAVE AS in many text editors,
# you can see if your file is in UTF-8, for example.

# In such a case, you would do well to open the file
# with a stipulation for python of the character set
# that you want Python to use.

def main():

    # for "latin-1"
    #s = codecs.open(filename, "r", "latin-1")

    # for "utf-8":
    #s = codecs.open(filename, "r", "utf-8")

    # The same is true for writing:
    #t = codecs.open(filename, "w", "latin-1");
    #t = codecs.open(filename, "w", "utf-8");

