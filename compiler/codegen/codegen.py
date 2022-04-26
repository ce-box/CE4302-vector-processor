from codegen.mapper import Instructions as InstructionsMapper, Registers as RegistersMapper, is_register, flag_list
from codegen.content import Content
from lexer.tokens import InstructionType, instrucction_type
import re
import sys

def run(p) -> None:
    binary_data: str = ''
    if type(p) == tuple:
        instruction = p[0]
        type_of_instruction: InstructionType = instrucction_type(instruction)
        ascii_pattern = re.compile("'[A-Zo| |,|.]'")

        if type_of_instruction == InstructionType.NO_REG_INSTRUCTION:
            binary_data = format_binary_data(
                instruction=InstructionsMapper[instruction],
            )

        elif type_of_instruction == InstructionType.ONE_REG_INSTRUCTION:
            if (is_register(p[1])):
                binary_data = format_binary_data(
                    instruction=InstructionsMapper[instruction],
                    first_arg=RegistersMapper[p[1]]
                )
            else:
                binary_data = format_binary_data(
                    instruction=InstructionsMapper[instruction],
                    flag=p[1],
                )

        elif type_of_instruction == InstructionType.TWO_REG_INSTRUCTION:
            if(is_register(p[2])):
                binary_data = format_binary_data(
                    instruction=InstructionsMapper[instruction],
                    first_arg=RegistersMapper[p[1]],
                    second_arg=RegistersMapper[p[2]]
                )

            elif(ascii_pattern.match(p[2])):
                binary_data = format_binary_data(
                    instruction=InstructionsMapper[instruction],
                    imm=True,
                    first_arg=RegistersMapper[p[1]],
                    second_arg=ord(p[2][1])
                )
                
            else:
                binary_data = format_binary_data(
                    instruction=InstructionsMapper[instruction],
                    imm=True,
                    first_arg=RegistersMapper[p[1]],
                    second_arg=int(p[2])
                )

        else:
            print("Parsing Error Ocurred.")
            sys.exit(2)
        
        Content.write_line_content(binary_data)


def format_binary_data(instruction: int,  imm: bool = False, first_arg: int = None, second_arg: int = None, flag: str = None) -> str:
    """
    Transforms instrucction into binary string.
    Arguments:
    instruction -- instruction code
    imm -- inmediate
    first_arg -- first argument
    second_arg -- second argument
    flag? -- name of flag
    Returns:
    complete_instruction -- binary instruction
    """
    cond_bin: str = get_cond(instruction)
    opcode_bin: str = get_op(instruction, imm)
    #print("Op Code:", opcode_bin)
    if(opcode_bin[0:2] == '00'):
        instruction_bin = get_instruction(instruction)
        dest = binary(first_arg, '04b')
        if (imm):
            source = binary(second_arg, '016b') 
        else:
            blank = binary(0, '012b')
            source = blank + binary(second_arg, '04b')
        complete_instruction = cond_bin + opcode_bin + instruction_bin + dest + source
        #print(complete_instruction, len(complete_instruction))
        return complete_instruction
    elif(opcode_bin[0:2] == '01'):
        blank1 = binary(0, '04b')
        dest = binary(first_arg, '04b')
        if (imm):
            source = binary(second_arg, '016b') 
        else:
            blank2 = binary(0, '012b')
            source = blank2 + binary(second_arg, '04b')
        complete_instruction = cond_bin + opcode_bin + blank1 + dest + source
        #print(complete_instruction, len(complete_instruction))
        return complete_instruction
    elif(opcode_bin[0:2] == '10'):
        complete_instruction = cond_bin + opcode_bin + flag
        #print(complete_instruction, len(complete_instruction))
        return complete_instruction
    elif(opcode_bin[0:2] == '11'):
        complete_instruction = cond_bin + opcode_bin + binary(0, '024b')
        #print(complete_instruction, len(complete_instruction))
        return complete_instruction
    else:
        print("Instruction not provided")
        sys.exit(2)


def get_cond(instruction: int) -> str:
    is_branch = instruction in range(9, 17)
    if (is_branch):
        code = [key for key in InstructionsMapper.keys()][instruction]
        return OpcodeMapper[code]
    else:
        return binary(14, '04b')

OpcodeMapper = {
    'JMP': '1110',
    'JEQ': '0000',
    'JZ' : '0000',
    'JNE': '0001',
    'JGT': '1100',
    'JLT': '1011',
    'JGE': '1010',
    'JLE': '1101',
}


def get_op(instruction: int, imm: bool) -> str:
    """
    Gets Operation Code of Instruction
    Arguments:
    instruction -- instruction code
    imm -- inmediate
    Returns:
    binary -- 4 bits binary code
    """
    is_data = instruction in range(0, 7)
    is_memory = instruction in range(7, 9)
    is_branch = instruction in range(9, 17)
    is_ret = instruction == 17
    if (is_data):
        I = binary(imm, '01b')
        S = binary([key for key in InstructionsMapper.keys()][instruction] == 'CMP', '01b')
        return binary(0, '02b') + I + S
    elif (is_memory):
        LOAD = 8
        return binary(1, '02b') + binary(imm, '01b') + binary(instruction == LOAD, '01b')
    elif (is_branch):
        return binary(8, '04b')
    elif (is_ret):
        return binary(12,'04b')
    else:
        print("Instruction not provided")
        sys.exit(2)

def get_instruction(instruction: int) -> str:
    """
    Gets Instruction Code
    Arguments:
    instruction -- instruction code
    Returns:
    binary -- 4 bits binary code of instruction
    """
    return binary(instruction, '04b')


def binary(data: int, formatstr: str) -> str:
    """
    Gets Binary
    Arguments:
    data -- number to be converted
    formatstr -- number of bits
    Returns:
    binary -- data in binary with specified bits
    """
    value: int = data if data != None else 0
    return format(value, formatstr)


def run_flag(p: str) -> None:
    value = p.split(':')[0] + ':'
    flag_list.append(value)
    Content.write_content(value)
