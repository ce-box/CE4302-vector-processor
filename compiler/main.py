from codegen import codegen
from codegen.content import Content
from codegen.flagreplace import flag_replacer
from parse.parse import parser
from system.system import create_file, read_file, write_on_file

def main():
    """
    Compiler for GEO arquitecture.
    """
    content = read_file()
    output = create_file()
    for index, value in enumerate(content):
        codegen.line = index
        parser.parse(value)
    data :str = Content.read_content()
    data = flag_replacer(data)
    write_on_file(data, output)

if __name__ == "__main__":
    main()

