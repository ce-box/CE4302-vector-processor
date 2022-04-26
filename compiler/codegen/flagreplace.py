from typing import List, Tuple
from codegen.mapper import flag_list, Flags
import sys

def flag_replacer(content: str) -> str:
    data = add_flags_values(add_flags_to_mapper(content))
    check_flags = check(data)
    if(not check_flags[0]):
        print("Flag %s are not defined" % check_flags[1])
        sys.exit(2)
    lines = data.splitlines()
    new_data : str =''
    for line in lines:
        #print(line)
        int_value = int(line, 2)
        hex_line = padhexa(hex(int_value))
        new_data += hex_line + '\n'

    return new_data

def padhexa(s):
    return s[2:].zfill(8)

def add_flags_to_mapper(content: str) ->  str:
    data = content
    for flag in flag_list:
        value: str = flag.split(':')[0]
        data_lines: List[str] = data.splitlines()
        counter = 0
        for i, line in enumerate(data_lines):
            if flag in line:
                if(counter == 0):
                    Flags[value] = i * 4
                    new_line = line.replace(flag, '')
                    data_lines[i] = new_line
                    counter += 1
                else:
                    print("Error: flag", flag, "defined more than one time.")
                    sys.Exit(2)
        data = join(data_lines)
    return data

def join(data: List[str]) -> str:
    temp = ''
    for line in data:
        temp += line + '\n'
    return temp

def add_flags_values(content: str) -> str:
    data = content
    for key, value in Flags.items():
        data = data.replace(key, format(value, '024b'))
    return data

def check(content: str) -> Tuple[bool, str]:
    b = '10\n'
    passbool = True
    string_error = ''
    for char in content:
        if char not in b:
            string_error += char
            passbool = False
    return (passbool, string_error)