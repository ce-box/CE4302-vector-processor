# +-----------------------+
# | Imagen: 0 - 250*250   |
# +-----------------------+
# | Texto:                |
# |    250*250+1 - inf    |
# +-----------------------+
start:
    JMP fillones
    JMP readworddef

readworddef:
    # g11: first value of text
    MOV g11, 250
    MUL g11, 250
    ADD g11, 1
    # x: g12
    MOV g12, 0
    # y: g13
    MOV g13, 0
    JMP readwordloop

# (ra: character, rb: x, rc, y)
readwordloop:
    LDR g11, ra
    # x >= 250 ? validatex
    MOV t5, g12
    ADD g12, 6
    CMP t5, 250
    JGE validatex
    JMP choosechar

validatex:
    MOV g12, 0
    ADD g13, 6
    RET

# (ra: character, rb: x, rc, y)
choosechar:
    CMP ra, 'A'
    JEQ drawa
    CMP ra, 'B'
    JEQ drawb
    CMP ra, 'C'
    JEQ drawc
    CMP ra, 'D'
    JEQ drawd
    CMP ra, 'E'
    JEQ drawe
    CMP ra, 'F'
    JEQ drawf
    CMP ra, 'G'
    JEQ drawg
    CMP ra, 'H'
    JEQ drawh
    CMP ra, 'I'
    JEQ drawi
    CMP ra, 'J'
    JEQ drawj
    CMP ra, 'K'
    JEQ drawk
    CMP ra, 'L'
    JEQ drawl
    CMP ra, 'M'
    JEQ drawm
    CMP ra, 'N'
    JEQ drawn
    CMP ra, 'O'
    JEQ drawo
    CMP ra, 'P'
    JEQ drawp
    CMP ra, 'Q'
    JEQ drawq
    CMP ra, 'R'
    JEQ drawr
    CMP ra, 'S'
    JEQ drawss
    CMP ra, 'T'
    JEQ drawt
    CMP ra, 'U'
    JEQ drawu
    CMP ra, 'V'
    JEQ drawv
    CMP ra, 'W'
    JEQ draww
    CMP ra, 'X'
    JEQ drawx
    CMP ra, 'Y'
    JEQ drawy
    CMP ra, 'Z'
    JEQ drawz
    CMP ra, ','
    JEQ comma
    CMP ra, '.'
    JEQ point
    CMP ra, 'o'
    JEQ sign
    JMP drawspace

enddraw:
    ADD g12, 6
    JMP readwordloop

comma:
# 0: 11111
# 1: 11111
# 2: 01111
# 3: 01111
# 4: 01111
    MOV t5, g12
    MOV ra, t5
    MOV rc, t5
    MOV t5, g13
    ADD t5, 2
    MOV rb, t5
    ADD t5, 2
    MOV rd, t5
    JMP bresenham
    JMP enddraw

point:
# 0: 11111
# 1: 11111
# 2: 11111
# 3: 11111
# 4: 01111
    MOV t5, g12
    MOV ra, t5
    MOV rc, t5
    MOV t5, g13
    ADD t5, 4
    MOV rb, t5
    MOV rd, t5
    JMP bresenham
    JMP enddraw

# (ra: character, rb: x, rc, y)
drawa:
# 0: 01111
# 1: 01111
# 2: 01111
# 3: 01111
# 4: 01111
    MOV t5, g12
    MOV ra, t5
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    ADD t5, 4
    MOV rd, t5
    JMP bresenham
# 0: 01110 
# 1: 01110
# 2: 01110  
# 3: 01110
# 4: 01110
    MOV t5, g12
    ADD t5, 4
    MOV ra, t5
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    ADD t5, 4
    MOV rd, t5
    JMP bresenham
# 0: 00000 
# 1: 01110
# 2: 01110  
# 3: 01110
# 4: 01110
    MOV t5, g12
    ADD t5, 1
    MOV ra, t5
    ADD t5, 2
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    MOV rd, t5
# 0: 00000 
# 1: 01110
# 2: 00000  
# 3: 01110
# 4: 01110
    MOV t5, g12
    ADD t5, 1
    MOV ra, t5
    ADD t5, 2
    MOV rc, t5
    MOV t5, g13
    ADD t5, 2
    MOV rb, t5
    MOV rd, t5
    JMP enddraw

drawb:
# 0: 01111
# 1: 01111
# 2: 01111
# 3: 01111
# 4: 01111
    MOV t5, g12
    MOV ra, t5
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    ADD t5, 4
    MOV rd, t5
    JMP bresenham
# 0: 00011 
# 1: 01111
# 2: 01111  
# 3: 01111
# 4: 01111
    MOV t5, g12
    ADD t5, 1
    MOV ra, t5
    ADD t5, 1
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    MOV rd, t5
    JMP enddraw
# 0: 00001 
# 1: 01101
# 2: 01111  
# 3: 01111
# 4: 01111
    MOV t5, g12
    # x = x + 3
    ADD t5, 3
    MOV ra, t5
    # same x
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    ADD t5, 1
    MOV rd, t5
    JMP bresenham
# 0: 00001 
# 1: 01101
# 2: 00001  
# 3: 01111
# 4: 01111
    MOV t5, g12
    ADD t5, 1
    MOV ra, t5
    ADD t5, 2
    MOV rc, t5
    MOV t5, g13
    ADD t5, 2
    MOV rb, t5
    MOV rd, t5
# 0: 00001 
# 1: 01101
# 2: 00000  
# 3: 01110
# 4: 01110
    MOV t5, g12
    ADD t5, 4
    MOV ra, t5
    MOV rc, t5
    MOV t5, g13
    ADD t5, 2
    MOV rb, t5
    ADD t5, 4
    MOV rd, t5
    JMP bresenham
# 0: 00001 
# 1: 01101
# 2: 00000  
# 3: 01110
# 4: 00000   
    MOV t5, g12
    ADD t5, 1
    MOV ra, t5
    ADD t5, 2
    MOV rc, t5
    MOV t5, g13
    ADD t5, 4
    MOV rb, t5
    MOV rd, t5
    JMP enddraw

drawc:
    # 0: 01111
    # 1: 01111
    # 2: 01111
    # 3: 01111
    # 4: 01111
    MOV t5, g12
    MOV ra, t5
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    ADD t5, 4
    MOV rd, t5
    JMP bresenham
    # 0: 00000
    # 1: 01111
    # 2: 01111
    # 3: 01111
    # 4: 01111
    MOV t5, g12
    MOV ra, t5
    ADD t5, 4
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    MOV rd, t5
    JMP bresenham
    # 0: 00000
    # 1: 01111
    # 2: 01111
    # 3: 01111
    # 4: 00000
    MOV t5, g12
    MOV ra, t5
    ADD t5, 4
    MOV rc, t5
    MOV t5, g13
    ADD t5, 4
    MOV rb, t5
    MOV rd, t5
    JMP bresenham
    JMP enddraw

drawd:
    # 0: 01111
    # 1: 01111
    # 2: 01111
    # 3: 01111
    # 4: 01111
    MOV t5, g12
    MOV ra, t5
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    ADD t5, 4
    MOV rd, t5
    JMP bresenham
    # 0: 00011
    # 1: 01100
    # 2: 01111
    # 3: 01111
    # 4: 01111
    MOV t5, g12
    MOV ra, t5
    ADD t5, 4
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    ADD t5, 1
    MOV rd, t5
    JMP bresenham
    # 0: 00011
    # 1: 01100
    # 2: 01111
    # 3: 01100
    # 4: 00011
    MOV t5, g12
    MOV ra, t5
    ADD t5, 4
    MOV rc, t5
    MOV t5, g13
    ADD t5, 4
    MOV rb, t5
    SUB t5, 1
    MOV rd, t5
    JMP bresenham
    # 0: 00011
    # 1: 01100
    # 2: 01110
    # 3: 01100
    # 4: 00011
    MOV t5, g12
    ADD t5, 4
    MOV ra, t5
    MOV rc, t5
    MOV t5, g13
    ADD t5, 1
    MOV rb, t5
    ADD t5, 2
    MOV rd, t5
    JMP bresenham
    JMP enddraw

drawe:
    # 0: 01111
    # 1: 01111
    # 2: 01111
    # 3: 01111
    # 4: 01111
    MOV t5, g12
    MOV ra, t5
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    ADD t5, 4
    MOV rd, t5
    JMP bresenham
    # 0: 00000
    # 1: 01111
    # 2: 01111
    # 3: 01111
    # 4: 01111
    MOV t5, g12
    MOV ra, t5
    ADD t5, 4
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    MOV rd, t5
    JMP bresenham
    # 0: 00000
    # 1: 01111
    # 2: 01111
    # 3: 01111
    # 4: 00000
    MOV t5, g12
    MOV ra, t5
    ADD t5, 4
    MOV rc, t5
    MOV t5, g13
    ADD t5, 4
    MOV rb, t5
    MOV rd, t5
    JMP bresenham
    # 0: 00000
    # 1: 01111
    # 2: 00011
    # 3: 01111
    # 4: 00000
    MOV t5, g12
    MOV ra, t5
    ADD t5, 2
    MOV rc, t5
    MOV t5, g13
    ADD t5, 2
    MOV rb, t5
    MOV rd, t5
    JMP bresenham
    JMP enddraw

drawf:
    # 0: 01111
    # 1: 01111
    # 2: 01111
    # 3: 01111
    # 4: 01111
    MOV t5, g12
    MOV ra, t5
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    ADD t5, 4
    MOV rd, t5
    JMP bresenham
    # 0: 00000
    # 1: 01111
    # 2: 01111
    # 3: 01111
    # 4: 01111
    MOV t5, g12
    MOV ra, t5
    ADD t5, 4
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    MOV rd, t5
    JMP bresenham
    # 0: 00000
    # 1: 01111
    # 2: 00011
    # 3: 01111
    # 4: 01111
    MOV t5, g12
    MOV ra, t5
    ADD t5, 2
    MOV rc, t5
    MOV t5, g13
    ADD t5, 2
    MOV rb, t5
    MOV rd, t5
    JMP bresenham
    JMP enddraw

drawg:
    # 0: 01111
    # 1: 01111
    # 2: 01111
    # 3: 01111
    # 4: 01111
    MOV t5, g12
    MOV ra, t5
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    ADD t5, 4
    MOV rd, t5
    JMP bresenham
    # 0: 00000
    # 1: 01111
    # 2: 01111
    # 3: 01111
    # 4: 01111
    MOV t5, g12
    MOV ra, t5
    ADD t5, 4
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    MOV rd, t5
    JMP bresenham
    # 0: 00000
    # 1: 01111
    # 2: 01111
    # 3: 01111
    # 4: 00000
    MOV t5, g12
    MOV ra, t5
    ADD t5, 4
    MOV rc, t5
    MOV t5, g13
    ADD t5, 4
    MOV rb, t5
    MOV rd, t5
    JMP bresenham
    # 0: 00000
    # 1: 01111
    # 2: 01110
    # 3: 01110
    # 4: 00000
    MOV t5, g12
    ADD t5, 4
    MOV ra, t5
    MOV rc, t5
    MOV t5, g13
    ADD t5, 2
    MOV rb, t5
    ADD t5, 2
    MOV rd, t5
    JMP bresenham
    # 0: 00000
    # 1: 01111
    # 2: 01000
    # 3: 01110
    # 4: 00000    
    MOV t5, g12
    ADD t5, 2
    MOV ra, t5
    ADD t5, 2
    MOV rc, t5
    MOV t5, g13
    ADD t5, 2
    MOV rb, t5
    MOV rd, t5
    JMP bresenham
    JMP enddraw

drawh:
    # 0: 01111
    # 1: 01111
    # 2: 01111
    # 3: 01111
    # 4: 01111
    MOV t5, g12
    MOV ra, t5
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    ADD t5, 4
    MOV rd, t5
    JMP bresenham
    # 0: 01111
    # 1: 01111
    # 2: 00000
    # 3: 01111
    # 4: 01111
    MOV t5, g12
    MOV ra, t5
    ADD t5, 4
    MOV rc, t5
    MOV t5, g13
    ADD t5, 2
    MOV rb, t5
    MOV rd, t5
    JMP bresenham
    # 0: 01110
    # 1: 01110
    # 2: 00000
    # 3: 01110
    # 4: 01110
    MOV t5, g12
    ADD t5, 4
    MOV ra, t5
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    ADD t5, 4
    MOV rd, t5
    JMP bresenham
    JMP enddraw

drawi:
# 0: 01111
# 1: 01111
# 2: 01111
# 3: 01111
# 4: 01111
    MOV t5, g12
    ADD t5, 2
    MOV ra, t5
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    ADD t5, 4
    MOV rd, t5
    JMP bresenham
    JMP enddraw

drawj:
# 0: 11110
# 1: 11110
# 2: 11110
# 3: 11110
# 4: 11110
    MOV t5, g12
    ADD t5, 4
    MOV ra, t5
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    ADD t5, 4
    MOV rd, t5
    JMP bresenham
# 0: 11110
# 1: 11110
# 2: 11110
# 3: 11110
# 4: 00000   
    MOV t5, g12
    MOV ra, t5
    ADD t5, 4
    MOV rc, t5
    MOV t5, g13
    ADD t5, 4
    MOV rb, t5
    MOV rd, t5
    JMP bresenham
    JMP enddraw

drawk:
    # 0: 11111
    # 1: 11111
    # 2: 00111
    # 3: 11001
    # 4: 11110
    MOV t5, g12
    MOV ra, t5
    ADD t5, 4
    MOV rc, t5
    MOV t5, g13
    ADD t5, 2
    MOV rb, t5
    ADD t5, 2
    MOV rd, t5
    JMP bresenham
    # 0: 11110
    # 1: 11001
    # 2: 00111
    # 3: 11001
    # 4: 11110
    MOV t5, g12
    ADD t5, 4
    MOV ra, t5
    SUB t5, 4
    MOV rc, t5 # x = 0
    MOV t5, g13
    MOV rb, t5
    ADD t5, 2
    MOV rd, t5
    JMP bresenham
    # 0: 01110
    # 1: 01001
    # 2: 00111
    # 3: 01001
    # 4: 01110
    MOV t5, g12
    MOV ra, t5
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    ADD t5, 4
    MOV rd, t5
    JMP bresenham
    JMP enddraw

drawl:
# 0: 01111
# 1: 01111
# 2: 01111
# 3: 01111
# 4: 01111
    MOV t5, g12
    MOV ra, t5
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    ADD t5, 4
    MOV rd, t5
    JMP bresenham
# 0: 01111
# 1: 01111
# 2: 01111
# 3: 01111
# 4: 00000   
    MOV t5, g12
    MOV ra, t5
    ADD t5, 4
    MOV rc, t5
    MOV t5, g13
    ADD t5, 4
    MOV rb, t5
    MOV rd, t5
    JMP bresenham
    JMP enddraw

drawm:
    # 0: 10111
    # 1: 10111
    # 2: 01111
    # 3: 01111
    # 4: 01111
    MOV t5, g12
    ADD t5, 1
    MOV ra, t5
    SUB t5, 1
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    ADD t5, 4
    MOV rd, t5
    JMP bresenham
    # 0: 10111
    # 1: 10111
    # 2: 01011
    # 3: 01011
    # 4: 01011
    MOV t5, g12
    ADD t5, 1
    MOV ra, t5
    ADD t5, 1
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    ADD t5, 4
    MOV rd, t5
    JMP bresenham
    # 0: 10101
    # 1: 10101
    # 2: 01011
    # 3: 01011
    # 4: 01011
    MOV t5, g12
    ADD t5, 3
    MOV ra, t5
    SUB t5, 1
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    ADD t5, 4
    MOV rd, t5
    JMP bresenham
    # 0: 10101
    # 1: 10101
    # 2: 01010
    # 3: 01010
    # 4: 01010
    MOV t5, g12
    ADD t5, 3
    MOV ra, t5
    ADD t5, 1
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    ADD t5, 4
    MOV rd, t5
    JMP bresenham 
    JMP enddraw

drawn:
# 0: 01111
# 1: 01111
# 2: 01111
# 3: 01111
# 4: 01111
    MOV t5, g12
    MOV ra, t5
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    ADD t5, 4
    MOV rd, t5
    JMP bresenham
# 0: 01111
# 1: 00111
# 2: 01011
# 3: 01101
# 4: 01110
    MOV t5, g12
    MOV ra, t5
    ADD t5, 4
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    ADD t5, 4
    MOV rd, t5
    JMP bresenham
# 0: 01110 
# 1: 00110
# 2: 01010  
# 3: 01100
# 4: 01110
    MOV t5, g12
    ADD t5, 4
    MOV ra, t5
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    ADD t5, 4
    MOV rd, t5
    JMP bresenham
    JMP enddraw

drawo:
    # 0: 01111
    # 1: 01111
    # 2: 01111
    # 3: 01111
    # 4: 01111
    MOV t5, g12
    MOV ra, t5
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    ADD t5, 4
    MOV rd, t5
    JMP bresenham
    # 0: 00000
    # 1: 01111
    # 2: 01111
    # 3: 01111
    # 4: 01111
    MOV t5, g12
    MOV ra, t5
    ADD t5, 4
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    MOV rd, t5
    JMP bresenham
    # 0: 00000
    # 1: 01111
    # 2: 01111
    # 3: 01111
    # 4: 00000
    MOV t5, g12
    MOV ra, t5
    ADD t5, 4
    MOV rc, t5
    MOV t5, g13
    ADD t5, 4
    MOV rb, t5
    MOV rd, t5
    JMP bresenham
    # 0: 00000
    # 1: 01110
    # 2: 01110
    # 3: 01110
    # 4: 00000
    MOV t5, g12
    ADD t5, 4
    MOV ra, t5
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    ADD t5, 4
    MOV rd, t5
    JMP bresenham
    JMP enddraw

drawp:
    # 0: 01111
    # 1: 01111
    # 2: 01111
    # 3: 01111
    # 4: 01111
    MOV t5, g12
    MOV ra, t5
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    ADD t5, 4
    MOV rd, t5
    JMP bresenham
    # 0: 00000
    # 1: 01111
    # 2: 01111
    # 3: 01111
    # 4: 01111
    MOV t5, g12
    MOV ra, t5
    ADD t5, 4
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    MOV rd, t5
    JMP bresenham
    # 0: 00000
    # 1: 01111
    # 2: 00000
    # 3: 01111
    # 4: 01111
    MOV t5, g12
    MOV ra, t5
    ADD t5, 4
    MOV rc, t5
    MOV t5, g13
    ADD t5, 2
    MOV rb, t5
    MOV rd, t5
    JMP bresenham
    # 0: 00000
    # 1: 01110
    # 2: 00000
    # 3: 01111
    # 4: 01111
    MOV t5, g12
    ADD t5, 4
    MOV ra, t5
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    ADD t5, 2
    MOV rd, t5
    JMP bresenham
    JMP enddraw

drawq:
    # 0: 01111
    # 1: 01111
    # 2: 01111
    # 3: 01111
    # 4: 01111
    MOV t5, g12
    MOV ra, t5
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    ADD t5, 4
    MOV rd, t5
    JMP bresenham
    # 0: 00000
    # 1: 01111
    # 2: 01111
    # 3: 01111
    # 4: 01111
    MOV t5, g12
    MOV ra, t5
    ADD t5, 4
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    MOV rd, t5
    JMP bresenham
    # 0: 00000
    # 1: 01111
    # 2: 01111
    # 3: 01111
    # 4: 00000
    MOV t5, g12
    MOV ra, t5
    ADD t5, 4
    MOV rc, t5
    MOV t5, g13
    ADD t5, 4
    MOV rb, t5
    MOV rd, t5
    JMP bresenham
    # 0: 00000
    # 1: 01110
    # 2: 01110
    # 3: 01110
    # 4: 00000
    MOV t5, g12
    ADD t5, 4
    MOV ra, t5
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    ADD t5, 4
    MOV rd, t5
    JMP bresenham
    # 0: 00000
    # 1: 01110
    # 2: 00110
    # 3: 01000
    # 4: 00000
    MOV t5, g12
    MOV ra, t5
    ADD t5, 4
    MOV rc, t5
    MOV t5, g13
    ADD t5, 2
    MOV rb, t5
    ADD t5, 2
    MOV rd, t5
    JMP bresenham   
    JMP enddraw

drawr:
    # 0: 01111
    # 1: 01111
    # 2: 01111
    # 3: 01111
    # 4: 01111
    MOV t5, g12
    MOV ra, t5
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    ADD t5, 4
    MOV rd, t5
    JMP bresenham
    # 0: 00000
    # 1: 01111
    # 2: 01111
    # 3: 01111
    # 4: 01111
    MOV t5, g12
    MOV ra, t5
    ADD t5, 4
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    MOV rd, t5
    JMP bresenham
    # 0: 00000
    # 1: 01111
    # 2: 00000
    # 3: 01111
    # 4: 01111
    MOV t5, g12
    MOV ra, t5
    ADD t5, 4
    MOV rc, t5
    MOV t5, g13
    ADD t5, 2
    MOV rb, t5
    MOV rd, t5
    JMP bresenham
    # 0: 00000
    # 1: 01110
    # 2: 00000
    # 3: 01111
    # 4: 01111
    MOV t5, g12
    ADD t5, 4
    MOV ra, t5
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    ADD t5, 2
    MOV rd, t5
    JMP bresenham
    # 0: 00000
    # 1: 01110
    # 2: 00000
    # 3: 01001
    # 4: 01110
    MOV t5, g12
    MOV ra, t5
    ADD t5, 4
    MOV rc, t5
    MOV t5, g13
    ADD t5, 2
    MOV rb, t5
    ADD t5, 2
    MOV rd, t5
    JMP bresenham    
    JMP enddraw

drawss:
    # 0: 00000
    # 1: 11111
    # 2: 11111
    # 3: 11111
    # 4: 11111
    MOV t5, g12
    MOV ra, t5
    ADD t5, 4
    MOV rc, t5
    MOV t5, g13
    ADD t5, 0 #offset
    MOV rb, t5
    MOV rd, t5
    JMP bresenham
    # 0: 00000
    # 1: 11111
    # 2: 00000
    # 3: 11111
    # 4: 11111
    MOV t5, g12
    MOV ra, t5
    ADD t5, 4
    MOV rc, t5
    MOV t5, g13
    ADD t5, 2 #offset
    MOV rb, t5
    MOV rd, t5
    JMP bresenham
    # 0: 00000
    # 1: 11111
    # 2: 00000
    # 3: 11111
    # 4: 00000
    MOV t5, g12
    MOV ra, t5
    ADD t5, 4
    MOV rc, t5
    MOV t5, g13
    ADD t5, 4 #offset
    MOV rb, t5
    MOV rd, t5
    JMP bresenham
    # 0: 00000
    # 1: 01111
    # 2: 00000
    # 3: 11111
    # 4: 00000
    MOV t5, g12
    MOV ra, t5
    MOV rc, t5
    MOV t5, g13
    ADD t5, 0 #offset
    MOV rb, t5
    ADD t5, 2
    MOV rd, t5
    JMP bresenham
    # 0: 00000
    # 1: 01111
    # 2: 00000
    # 3: 11111
    # 4: 00000
    MOV t5, g12
    ADD t5, 4
    MOV ra, t5
    MOV rc, t5
    MOV t5, g13
    ADD t5, 2 #offset
    MOV rb, t5
    ADD t5, 2
    MOV rd, t5
    JMP bresenham
    JMP enddraw

drawt:
    # 0: 00000
    # 1: 11111
    # 2: 11111
    # 3: 11111
    # 4: 11111
    MOV t5, g12
    MOV ra, t5
    ADD t5, 4
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    MOV rd, t5
    JMP bresenham
    # 0: 00000
    # 1: 11011
    # 2: 11011
    # 3: 11011
    # 4: 11011
    MOV t5, g12
    ADD t5, 2
    MOV ra, t5
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    ADD t5, 4
    MOV rd, t5
    JMP bresenham 
    JMP enddraw

drawu:
    # 0: 01111
    # 1: 01111
    # 2: 01111
    # 3: 01111
    # 4: 01111
    MOV t5, g12
    MOV ra, t5
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    ADD t5, 4
    MOV rd, t5
    JMP bresenham
    # 0: 01111
    # 1: 01111
    # 2: 01111
    # 3: 01111
    # 4: 00000
    MOV t5, g12
    MOV ra, t5
    ADD t5, 4
    MOV rc, t5
    MOV t5, g13
    ADD t5, 4
    MOV rb, t5
    MOV rd, t5
    JMP bresenham
    # 0: 01110
    # 1: 01110
    # 2: 01110
    # 3: 01110
    # 4: 00000
    MOV t5, g12
    ADD t5, 4
    MOV ra, t5
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    ADD t5, 4
    MOV rd, t5
    JMP bresenham
    JMP enddraw

drawv:
    # 0: 01111
    # 1: 01111
    # 2: 10111
    # 3: 10111
    # 4: 11011
    MOV t5, g12
    MOV ra, t5
    ADD t5, 2
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    ADD t5, 4
    MOV rd, t5
    JMP bresenham
    # 0: 01110
    # 1: 01110
    # 2: 10101
    # 3: 10101
    # 4: 11011
    MOV t5, g12
    ADD t5, 4
    MOV ra, t5
    SUB t5, 2
    MOV rc, t5 # x = 0
    MOV t5, g13
    MOV rb, t5
    ADD t5, 4
    MOV rd, t5
    JMP bresenham
    JMP enddraw

draww:
    # 0: 01111
    # 1: 01111
    # 2: 01111
    # 3: 10111
    # 4: 10111
    MOV t5, g12
    MOV ra, t5
    ADD t5, 1
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    ADD t5, 4
    MOV rd, t5
    JMP bresenham
    # 0: 01011
    # 1: 01011
    # 2: 01011
    # 3: 10111
    # 4: 10111
    MOV t5, g12
    ADD t5, 2
    MOV ra, t5
    SUB t5, 1
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    ADD t5, 4
    MOV rd, t5
    JMP bresenham
    # 0: 01011
    # 1: 01011
    # 2: 01011
    # 3: 10101
    # 4: 10101
    MOV t5, g12
    ADD t5, 2
    MOV ra, t5
    ADD t5, 1
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    ADD t5, 4
    MOV rd, t5
    JMP bresenham
    # 0: 01010
    # 1: 01010
    # 2: 01010
    # 3: 10101
    # 4: 10101
    MOV t5, g12
    ADD t5, 4
    MOV ra, t5
    SUB t5, 1
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    ADD t5, 4
    MOV rd, t5
    JMP bresenham  
    JMP enddraw

drawx:
    # 0: 01111
    # 1: 10111
    # 2: 11011
    # 3: 11101
    # 4: 11110
    MOV t5, g12
    MOV ra, t5
    ADD t5, 4
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    ADD t5, 4
    MOV rd, t5
    JMP bresenham
    # 0: 01110
    # 1: 10101
    # 2: 11011
    # 3: 10101
    # 4: 01110
    MOV t5, g12
    ADD t5, 4
    MOV ra, t5
    SUB t5, 4
    MOV rc, t5 # x = 0
    MOV t5, g13
    MOV rb, t5
    ADD t5, 4
    MOV rd, t5
    JMP bresenham
    JMP enddraw

drawy:
    # 0: 01111
    # 1: 10111
    # 2: 11011
    # 3: 11111
    # 4: 11111
    MOV t5, g12
    MOV ra, t5
    ADD t5, 2
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    ADD t5, 2
    MOV rd, t5
    JMP bresenham
    # 0: 01110
    # 1: 10101
    # 2: 11011
    # 3: 11111
    # 4: 11111
    MOV t5, g12
    ADD t5, 4
    MOV ra, t5
    SUB t5, 2
    MOV rc, t5 # x = 0
    MOV t5, g13
    MOV rb, t5
    ADD t5, 2
    MOV rd, t5
    JMP bresenham
    # 0: 01110
    # 1: 10101
    # 2: 11011
    # 3: 11111
    # 4: 11111
    MOV t5, g12
    ADD t5, 2
    MOV ra, t5
    MOV rc, t5
    MOV t5, g13
    ADD t5, 2
    MOV rb, t5
    ADD t5, 2
    MOV rd, t5
    JMP bresenham 
    JMP enddraw

drawz:
    # 0: 01111
    # 1: 10111
    # 2: 11011
    # 3: 11101
    # 4: 11110
    MOV t5, g12
    MOV ra, t5
    ADD t5, 4
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    ADD t5, 4
    MOV rd, t5
    JMP bresenham
    # 0: 00000
    # 1: 10111
    # 2: 11011
    # 3: 11101
    # 4: 11110
    MOV t5, g12
    MOV ra, t5
    ADD t5, 4
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    MOV rd, t5
    JMP bresenham
    # 0: 00000
    # 1: 10111
    # 2: 11011
    # 3: 11101
    # 4: 00000
    MOV t5, g12
    MOV ra, t5
    ADD t5, 4
    MOV rc, t5
    MOV t5, g13
    ADD t5, 4
    MOV rb, t5
    MOV rd, t5
    JMP bresenham
    JMP enddraw

drawspace:
    # 0: 11111
    # 1: 11111
    # 2: 11111
    # 3: 11111
    # 4: 11111
    JMP enddraw

sign:
    MOV ra, g12
    MOV rb, g13
    JMP lncircle
    MOV t5, g12
    MOV ra, t5
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    ADD t5, 4
    MOV rd, t5
    JMP bresenham
    MOV t5, g12
    MOV ra, t5
    ADD t5, 4
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    MOV rd, t5
    JMP bresenham
    MOV t5, g12
    MOV ra, t5
    ADD t5, 4
    MOV rc, t5
    MOV t5, g13
    ADD t5, 4
    MOV rb, t5
    MOV rd, t5
    JMP bresenham
    MOV t5, g12
    ADD t5, 4
    MOV ra, t5
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    ADD t5, 4
    MOV rd, t5
    JMP bresenham
    MOV t5, g12
    MOV ra, t5
    ADD t5, 4
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    ADD t5, 4
    MOV rd, t5
    JMP bresenham
    MOV t5, g12
    ADD t5, 4
    MOV ra, t5
    SUB t5, 4
    MOV rc, t5 # x = 0
    MOV t5, g13
    MOV rb, t5
    ADD t5, 4
    MOV rd, t5
    JMP bresenham
    JMP end


// Fills the array of ones
fillones:
# t5: max = 250 * 250
    MOV t5, 250
    MUL t5, 250
# t9: x = 0
    MOV t9, zero
# t10: y = 0
    MOV t10, zero
    JMP oneloop
    RET 

oneloop:
# t8: (x,y) = mempos = y * offset (250 pixels in y) + x
    MOV t8, t10
    MUL t8, 250
    ADD t8, t9
# draw mempos = 1
    MOV g11, 1
    STR g11, t8
# increment
    JMP increment
# for y < max loop : end
    CMP t6, t5
    JLT oneloop
    RET

increment:
    ADD t9, 1
    CMP t9, 250
    JGE incy 
    RET

incy:
    MOV t9, zero
    ADD t10, 1
    RET

# (xcorner: g12, ycorner: g13)
lncircle:
    # 0: 11111
    # 1: 01111
    # 2: 01111
    # 3: 01111
    # 4: 11111
    MOV t5, g12
    MOV ra, t5
    MOV rc, t5
    MOV t5, g13
    ADD t5, 1
    MOV rb, t5
    ADD t5, 2
    MOV rd, t5
    JMP bresenham
    # 0: 10001
    # 1: 01111
    # 2: 01111
    # 3: 01111
    # 4: 11111
    MOV t5, g12
    ADD t5, 1
    MOV ra, t5
    ADD t5, 2
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    MOV rd, t5
    JMP bresenham
    # 0: 10001
    # 1: 01111
    # 2: 01111
    # 3: 01111
    # 4: 10001
    MOV t5, g12
    ADD t5, 1
    MOV ra, t5
    ADD t5, 2
    MOV rc, t5
    MOV t5, g13
    ADD t5, 4
    MOV rb, t5
    MOV rd, t5
    JMP bresenham
    # 0: 10001
    # 1: 01110
    # 2: 01110
    # 3: 01110
    # 4: 10001
    MOV t5, g12
    ADD t5, 4
    MOV ra, t5
    MOV rc, t5
    MOV t5, g13
    ADD t5, 1
    MOV rb, t5
    ADD t5, 2
    MOV rd, t5
    JMP bresenham
    RET

# (x1: ra, y1: rb, x2: rc, y2: rd)
bresenham:
    CMP ra, rc
    JEQ brehor
    JMP brever
    RET

# (x1: ra, y1: rb, x2: rc, y2: rd)
brever: # (x1, y1) -> (x2, y2)
# t5: m definition
    MOV t5, 2  # t5: m = 2 
    MOV t6, rd # t6 = rd: y2 
    SUB t6, rb # rd = t6 - rb: (y2 - y1)
    MUL t5, rd # t5 * t6: 2 * (y2 - y1) = m
# t6: slope error definition
    MOV t7, rc # t6 = rc: x2
    SUB t7, ra # t6 = (x2 - x1)
    MOV t6, t5 # t5 = m
    SUB t6, t7 # slope = m - (x2 - x1)
# t7: (x2 - x1) * 2;
    MUL t7, 2
# loop    
    JMP breloopver
    RET

breloopver:
# t9: x = x1
    MOV t9, ra
# t10: y = y1
    MOV t10, rb
# t8: mempos = y * offset (250 pixels in y) + x
    MOV t8, t10
    MUL t8, 250
    ADD t8, t9
# draw mempos = 0
    STR zero, t8
# slope += m;
    ADD t6, t5
# if slope >= 0
    CMP t6, zero
    JGE sloperestore
# x++
    ADD t9, 1
# if x <= x2
    CMP t9, rc
    JLE breloopver
    RET

brehor:
# t5: m definition
    MOV t5, 2  # t5: m = 2 
    MOV t6, rc # t6 = rc: y2 
    SUB t6, ra # rc = t6 - ra: (y2 - y1)
    MUL t5, rc # t5 * t6: 2 * (y2 - y1) = m
# t6: slope error definition
    MOV t7, rd # t6 = rd: x2
    SUB t7, rb # t6 = (x2 - x1)
    MOV t6, t5 # t5 = m
    SUB t6, t7 # slope = m - (x2 - x1)
# t7: (x2 - x1) * 2;
    MUL t7, 2
# loop    
    JMP breloophor
    RET
    
breloophor:
# t9: y = y1
    MOV t9, rb
# t10: x = x1
    MOV t10, ra
# t8: mempos = y * offset (250 pixels in y) + x
    MOV t8, t9
    MUL t8, 250
    ADD t8, t10
# draw mempos = 0
    STR zero, t8
# slope += m;
    ADD t6, t5
# if slope >= 0
    CMP t6, zero
    JGE sloperestore
# y++
    ADD t9, 1
# if x <= x2
    CMP t9, rc
    JLE breloophor
    RET

sloperestore:
    ADD t10, 1
    SUB t6, t7
    RET

end:
    ADD zero, zero