from lexer.tokens import registers, two_reg_instructions, one_reg_instructions, no_reg_instructions
from typing import List

instructions = two_reg_instructions + one_reg_instructions + no_reg_instructions

Instructions = {}

#print("INSTRUCTIONS:")
for index, instruction in enumerate(instructions):
    #print(index, instruction)
    Instructions[instruction] = index

Registers = {}

#print("REGISTERS:")
for index, register in enumerate(registers):        
    #print(index, register)
    Registers[register] = index

def is_register(val: str) -> bool:
    return val in Registers

flag_list: List[str] = []

Flags = {}