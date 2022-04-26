from typing import List
import ply.lex as lex
from enum import Enum
import re

tokens = [
    'FLAG_DEF',
    'NO_REG_INSTRUCTION',
    'ONE_REG_INSTRUCTION',
    'TWO_REG_INSTRUCTION',
    'REGISTER',
    'IMMEDIATE',
    'COMMENT',
    'DELIMETER',
    'REG_DELIMETER',
    'FLAG',
]

registers = [
    'zero',
    'ra',
    'rb',
    'rc',
    'rd',
    't5',
    't6',
    't7',
    't8',
    't9',
    't10',
    'g11',
    'g12',
    'g13',
    'sp',
    'pc',
]

one_reg_instructions = [
    'JMP',
    'JEQ',
    'JZ',
    'JNE',
    'JGT',
    'JLT',
    'JGE',
    'JLE',
]

no_reg_instructions = [
    'RET',
]

two_reg_instructions = [
    'ADD',
    'SUB',
    'MUL',
    'AND',
    'OR',
    'MOV',
    'CMP',
    'STR',
    'LDR',
]


def regex_no_reg_instructions():
    """
    Definition of the Instructions not using registers
    """
    regexval = ''
    for index, instruction in enumerate(no_reg_instructions):
        if (index == (len(no_reg_instructions) - 1)):
            regexval += instruction
        else:
            regexval += instruction + '|'
    return regexval


def regex_one_reg_instructions():
    """
    Definition of the Instructions using one register
    """
    regexval = ''
    for index, instruction in enumerate(one_reg_instructions):
        if (index == (len(one_reg_instructions) - 1)):
            regexval += instruction
        else:
            regexval += instruction + '|'
    return regexval


def regex_two_reg_instructions():
    """
    Definition of the Instructions using two registers
    """
    regexval = ''
    for index, instruction in enumerate(two_reg_instructions):
        if (index == (len(two_reg_instructions) - 1)):
            regexval += instruction
        else:
            regexval += instruction + '|'
    return regexval


def regex_registers():
    """
    Definition of the registers
    """
    regexval = ''
    for index, register in enumerate(registers):
        if (index == (len(registers) - 1)):
            regexval += register
        else:
            regexval += register + '|'
    return regexval


regex_one_reg_instructions = regex_one_reg_instructions()
regex_two_reg_instructions = regex_two_reg_instructions()
regex_no_reg_instructions = regex_no_reg_instructions()
regex_registers = regex_registers()

t_IMMEDIATE = r"[0-9]+|'[A-Zo| |,|.]'"
t_FLAG_DEF = r'[a-z]+:'
t_ONE_REG_INSTRUCTION = r'%s' % regex_one_reg_instructions
t_TWO_REG_INSTRUCTION = r'%s' % regex_two_reg_instructions
t_NO_REG_INSTRUCTION = r'%s' % regex_no_reg_instructions
t_REGISTER = r'%s' % regex_registers
t_COMMENT = r'[#|\/\/|;].*$'
t_DELIMETER = r'\n'
t_REG_DELIMETER = r','
t_FLAG = r'[a-z]+'

t_ignore = r' '


def t_error(t):
    value = re.split('\ |,|\n', t.value)[0]
    print('Syntax error: "%s" not defined' % value)
    t.lexer.skip(1)

class InstructionType(Enum):
    ONE_REG_INSTRUCTION = 'ONE_REG_INSTRUCTION'
    TWO_REG_INSTRUCTION = 'TWO_REG_INSTRUCTION'
    NO_REG_INSTRUCTION = 'NO_REG_INSTRUCTION'

def instrucction_type(value: str) -> InstructionType or None:
    """
    Gets type of instruction
    Arguments:
    value -- Instruction Provided
    Returns:
    type -- Type of Instruction
    """
    if (value in one_reg_instructions):
        return InstructionType.ONE_REG_INSTRUCTION
    elif (value in two_reg_instructions):
        return InstructionType.TWO_REG_INSTRUCTION
    elif (value in no_reg_instructions):
        return InstructionType.NO_REG_INSTRUCTION
    else:
        return None


