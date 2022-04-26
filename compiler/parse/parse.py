from ply.lex import LexToken
import ply.yacc as yacc
from codegen.codegen import run, run_flag
from lexer.lexer import *

def p_parse(p):
    '''
    parse : expression
          | expression DELIMETER
          | expression COMMENT DELIMETER
          | expression COMMENT
          | COMMENT DELIMETER
          | COMMENT
          | DELIMETER
          | flag COMMENT DELIMETER
          | flag COMMENT
          | flag DELIMETER
          | empty
    '''
    run(p[1])

def p_expression(p):
    '''
    expression : NO_REG_INSTRUCTION
               | ONE_REG_INSTRUCTION REGISTER
               | ONE_REG_INSTRUCTION FLAG
               | TWO_REG_INSTRUCTION REGISTER REG_DELIMETER REGISTER
               | TWO_REG_INSTRUCTION REGISTER REG_DELIMETER IMMEDIATE 
    '''
    if(len(p) > 3 and p[3] == ','):
        p[0] = (p[1], p[2], p[4])
    elif(len(p) > 2):
        p[0] = (p[1], p[2])
    else:
        p[0] = tuple([p[1]])

def p_flag(p):
    '''
    flag : FLAG_DEF
    '''
    run_flag(p[1])

def p_empty(p):
    '''
    empty : 
    '''
    p[0] = None


def p_error(p: LexToken):
    tok = p
    print("Parsing Error on", tok.type, "line no:", tok.lineno, "position", tok.lexpos)


parser = yacc.yacc()
