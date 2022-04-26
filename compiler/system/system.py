from typing import List
import sys

argv = sys.argv[1:]
output_filename = ''


def read_file() -> List[str]:
    """
    Reads a file provided on argv[0].
    Returns:
    content -- content of the file read
    """
    if len(argv) > 0:
        try:
            content = List[str]
            path_to_file = './asm/' + argv[0]
            f = open(path_to_file, 'r')
            content = f.readlines()
            f.close()
            return content
        except:
            print("Error: filname not valid")
    else:
        print("Error: filename must be provided")
    sys.exit(2)


def create_file(output: str = None) -> str:
    """
    Creates output file
    Arguments:
    output -- name of the outputfile
    """
    if output == None:
        output_filename = argv[0].split('.')[0]
    else:
        output_filename = output
    try:
        path_to_file = './asm/' + output_filename + '.mem'
        f = open(path_to_file, 'w')
        f.close()
    except:
        print("Error: couldn't create file %s" %output_filename)
        sys.exit(2)
    return output_filename


def write_on_file(content: str, output_filename: str) -> None:
    """
    Writes on output file
    Arguments:
    content -- content to be written
    output_filename -- name of the outputfile
    """
    try:
        path_to_file = './asm/' + output_filename + '.mem'
        with open(path_to_file, "w") as mem:
            mem.write(content)
            mem.close()
    except:
        print("Error: couldn't add content to file %s" %output_filename)
        sys.exit(2)
