# +-----------------------+
# | Imagen: 0 - 250*250   |
# +-----------------------+
# | Texto:                |
# |    250*250+1 - inf    |
# +-----------------------+
start:
    JMP fillones

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
    JMP choosechardef

validatex:
    MOV g12, 0
    ADD g13, 6
    JMP choosechardef

# (ra: character, rb: x, rc, y)
choosechardef:
    CMP ra, 'A'
    JEQ drawadef
    CMP ra, 'B'
    JEQ drawbdef
    CMP ra, 'C'
    JEQ drawcdef
    CMP ra, 'D'
    JEQ drawddef
    CMP ra, 'E'
    JEQ drawedef
    CMP ra, 'F'
    JEQ drawfdef
    CMP ra, 'G'
    JEQ drawgdef
    CMP ra, 'H'
    JEQ drawhdef
    CMP ra, 'I'
    JEQ drawidef
    CMP ra, 'J'
    JEQ drawjdef
    CMP ra, 'K'
    JEQ drawkdef
    CMP ra, 'L'
    JEQ drawldef
    CMP ra, 'M'
    JEQ drawmdef
    CMP ra, 'N'
    JEQ drawndef
    CMP ra, 'O'
    JEQ drawodef
    CMP ra, 'P'
    JEQ drawpdef
    CMP ra, 'Q'
    JEQ drawqdef
    CMP ra, 'R'
    JEQ drawrdef
    CMP ra, 'S'
    JEQ drawsdef
    CMP ra, 'T'
    JEQ drawtdef
    CMP ra, 'U'
    JEQ drawudef
    CMP ra, 'V'
    JEQ drawvdef
    CMP ra, 'W'
    JEQ drawwdef
    CMP ra, 'X'
    JEQ drawxdef
    CMP ra, 'Y'
    JEQ drawydef
    CMP ra, 'Z'
    JEQ drawzdef
    CMP ra, ','
    JEQ commadef
    CMP ra, '.'
    JEQ pointdef
    CMP ra, 'o'
    JEQ signdef
    JMP drawspacedef

# (ra: character, rb: x, rc, y)
choosecharloop:
    CMP ra, 'A'
    JEQ drawaloop
    CMP ra, 'B'
    JEQ drawbloop
    CMP ra, 'C'
    JEQ drawcloop
    CMP ra, 'D'
    JEQ drawdloop
    CMP ra, 'E'
    JEQ draweloop
    CMP ra, 'F'
    JEQ drawfloop
    CMP ra, 'G'
    JEQ drawgloop
    CMP ra, 'H'
    JEQ drawhloop
    CMP ra, 'I'
    JEQ drawiloop
    CMP ra, 'J'
    JEQ drawjloop
    CMP ra, 'K'
    JEQ drawkloop
    CMP ra, 'L'
    JEQ drawlloop
    CMP ra, 'M'
    JEQ drawmloop
    CMP ra, 'N'
    JEQ drawnloop
    CMP ra, 'O'
    JEQ drawoloop
    CMP ra, 'P'
    JEQ drawploop
    CMP ra, 'Q'
    JEQ drawqloop
    CMP ra, 'R'
    JEQ drawrloop
    CMP ra, 'S'
    JEQ drawsloop
    CMP ra, 'T'
    JEQ drawtloop
    CMP ra, 'U'
    JEQ drawuloop
    CMP ra, 'V'
    JEQ drawvloop
    CMP ra, 'W'
    JEQ drawwloop
    CMP ra, 'X'
    JEQ drawxloop
    CMP ra, 'Y'
    JEQ drawyloop
    CMP ra, 'Z'
    JEQ drawzloop
    CMP ra, ','
    JEQ commaloop
    CMP ra, '.'
    JEQ pointloop
    CMP ra, 'o'
    JEQ signloop
    JMP drawspaceloop

enddraw:
    ADD g12, 6
    JMP readwordloop

commadef:
    MOV sp, 1
    JMP commaloop

commaloop:
    CMP sp, 1
    JEQ commaone
    JMP enddraw

commaone:
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

pointdef:
    MOV sp, 1
    JMP pointloop

pointloop:
    CMP sp, 1
    JEQ pointone
    JMP enddraw

pointone:
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

#### A ####
drawadef:
    MOV sp, 4
    JMP drawaloop

drawaloop:
    CMP sp, 4
    JEQ drawafor
    CMP sp, 3
    JEQ drawatre
    CMP sp, 2
    JEQ drawatwo
    CMP sp, 1
    JEQ drawaone
    JMP enddraw

# (ra: character, rb: x, rc, y)
drawaone:
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

drawatwo:
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

drawatre:
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
    JMP bresenham

drawafor:
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
    JMP bresenham

#### B ####
drawbdef:
    MOV sp, 6
    JMP drawbloop

drawbloop:
    CMP sp, 6
    JEQ drawbsix
    CMP sp, 5
    JEQ drawbfiv
    CMP sp, 4
    JEQ drawbfor
    CMP sp, 3
    JEQ drawbtre
    CMP sp, 2
    JEQ drawbtwo
    CMP sp, 1
    JEQ drawbone
    JMP enddraw

drawbone:
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

drawbtwo:
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
    JMP bresenham

drawbtre:
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

drawbfor:
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
    JMP bresenham

drawbfiv:   
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

drawbsix:
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
    JMP bresenham

#### C ####
drawcdef:
    MOV sp, 3
    JMP drawcloop

drawcloop:
    CMP sp, 3
    JEQ drawctre
    CMP sp, 2
    JEQ drawctwo
    CMP sp, 1
    JEQ drawcone
    JMP enddraw

drawcone:
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

drawctwo:
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

drawctre:
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

#### D ####
drawddef:
    MOV sp, 4
    JMP drawdloop

drawdloop:
    CMP sp, 4
    JEQ drawdfor
    CMP sp, 3
    JEQ drawdtre
    CMP sp, 2
    JEQ drawdtwo
    CMP sp, 1
    JEQ drawdone
    JMP enddraw

drawdone:
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

drawdtwo:
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
drawdtre:
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

drawdfor:
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

#### E ####
drawedef:
    MOV sp, 4
    JMP draweloop

draweloop:
    CMP sp, 4
    JEQ drawefor
    CMP sp, 3
    JEQ drawetre
    CMP sp, 2
    JEQ drawetwo
    CMP sp, 1
    JEQ draweone
    JMP enddraw

draweone:
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

drawetwo:
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

drawetre:
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

drawefor:
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

#### F ####
drawfdef:
    MOV sp, 3
    JMP drawfloop

drawfloop:
    CMP sp, 3
    JEQ drawftre
    CMP sp, 2
    JEQ drawftwo
    CMP sp, 1
    JEQ drawfone
    JMP enddraw

drawfone:
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
drawftwo:
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
drawftre:
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

#### G ####
drawgdef:
    MOV sp, 5
    JMP drawgloop

drawgloop:
    CMP sp, 5
    JEQ drawgfor
    CMP sp, 4
    JEQ drawgfor
    CMP sp, 3
    JEQ drawgtre
    CMP sp, 2
    JEQ drawgtwo
    CMP sp, 1
    JEQ drawgone
    JMP enddraw

drawgone:
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

drawgtwo:
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

drawgtre:
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

drawgfor:
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

drawgfiv:
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

#### H ####
drawhdef:
    MOV sp, 3
    JMP drawhloop

drawhloop:
    CMP sp, 3
    JEQ drawhtre
    CMP sp, 2
    JEQ drawhtwo
    CMP sp, 1
    JEQ drawhone
    JMP enddraw

drawhone:
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

drawhtwo:
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

drawhtre:
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

#### I ####
drawidef:
    MOV sp, 1
    JMP drawiloop

drawiloop:
    CMP sp, 1
    JEQ drawione
    JMP enddraw

drawione:
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

#### J ####
drawjdef:
    MOV sp, 4
    JMP drawjloop

drawjloop:
    CMP sp, 2
    JEQ drawjtwo
    CMP sp, 1
    JEQ drawjone
    JMP enddraw

drawjone:
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

drawjtwo:
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

#### K ####
drawkdef:
    MOV sp, 3
    JMP drawkloop

drawkloop:
    CMP sp, 3
    JEQ drawktre
    CMP sp, 2
    JEQ drawktwo
    CMP sp, 1
    JEQ drawkone
    JMP enddraw

drawkone:
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

drawktwo:
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

drawktre:
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

#### L ####
drawldef:
    MOV sp, 2
    JMP drawlloop

drawlloop:
    CMP sp, 2
    JEQ drawltwo
    CMP sp, 1
    JEQ drawlone
    JMP enddraw

drawlone:
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

drawltwo:
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

#### M ####
drawmdef:
    MOV sp, 4
    JMP drawmloop

drawmloop:
    CMP sp, 4
    JEQ drawmfor
    CMP sp, 3
    JEQ drawmtre
    CMP sp, 2
    JEQ drawmtwo
    CMP sp, 1
    JEQ drawmone
    JMP enddraw

drawmone:
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
drawmtwo:
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
drawmtre:
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
drawmfor:
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

#### N ####
drawndef:
    MOV sp, 3
    JMP drawnloop

drawnloop:
    CMP sp, 3
    JEQ drawntre
    CMP sp, 2
    JEQ drawntwo
    CMP sp, 1
    JEQ drawnone
    JMP enddraw

drawnone:
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
drawntwo:
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
drawntre:
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

#### O ####
drawodef:
    MOV sp, 4
    JMP drawoloop

drawoloop:
    CMP sp, 4
    JEQ drawofor
    CMP sp, 3
    JEQ drawotre
    CMP sp, 2
    JEQ drawotwo
    CMP sp, 1
    JEQ drawoone
    JMP enddraw

drawoone:
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

drawotwo:
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

drawotre:
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

drawofor:
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

#### P ####
drawpdef:
    MOV sp, 4
    JMP drawploop

drawploop:
    CMP sp, 4
    JEQ drawpfor
    CMP sp, 3
    JEQ drawptre
    CMP sp, 2
    JEQ drawptwo
    CMP sp, 1
    JEQ drawpone
    JMP enddraw

drawpone:
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

drawptwo:
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

drawptre:
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

drawpfor:
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

#### Q ####
drawqdef:
    MOV sp, 5
    JMP drawqloop

drawqloop:    
    CMP sp, 5
    JEQ drawqfiv
    CMP sp, 4
    JEQ drawqfor
    CMP sp, 3
    JEQ drawqtre
    CMP sp, 2
    JEQ drawqtwo
    CMP sp, 1
    JEQ drawqone
    JMP enddraw

drawqone:
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

drawqtwo:
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

drawqtre:
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
drawqfor:
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
drawqfiv:
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

#### R ####
drawrdef:
    MOV sp, 5
    JMP drawrloop

drawrloop:
    CMP sp, 5
    JEQ drawrfiv
    CMP sp, 4
    JEQ drawrfor
    CMP sp, 3
    JEQ drawrtre
    CMP sp, 2
    JEQ drawrtwo
    CMP sp, 1
    JEQ drawrone
    JMP enddraw

drawrone:
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
drawrtwo:
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

drawrtre:
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

drawrfor:
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

drawrfiv:
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

#### S ####
drawsdef:
    MOV sp, 5
    JMP drawsloop

drawsloop:
    CMP sp, 5
    JEQ drawsfiv
    CMP sp, 4
    JEQ drawsfor
    CMP sp, 3
    JEQ drawstre
    CMP sp, 2
    JEQ drawstwo
    CMP sp, 1
    JEQ drawsone
    JMP enddraw

drawsone:
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
drawstwo:
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
drawstre:
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

drawsfor:
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

drawsfiv:
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

#### T ####
drawtdef:
    MOV sp, 2
    JMP drawtloop

drawtloop:
    CMP sp, 2
    JEQ drawttwo
    CMP sp, 1
    JEQ drawtone
    JMP enddraw

drawtone:
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

drawttwo:
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

#### U ####
drawudef:
    MOV sp, 3
    JMP drawuloop

drawuloop:
    CMP sp, 3
    JEQ drawutre
    CMP sp, 2
    JEQ drawutwo
    CMP sp, 1
    JEQ drawuone
    JMP enddraw

drawuone:
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
drawutwo:
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

drawutre:
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

#### V ####
drawvdef:
    MOV sp, 2
    JMP drawvloop

drawvloop:
    CMP sp, 2
    JEQ drawvtwo
    CMP sp, 1
    JEQ drawvone
    JMP enddraw

drawvone:
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

drawvtwo:
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

#### W ####
drawwdef:
    MOV sp, 4
    JMP drawwloop

drawwloop:
    CMP sp, 4
    JEQ drawwfor
    CMP sp, 3
    JEQ drawwtre
    CMP sp, 2
    JEQ drawwtwo
    CMP sp, 1
    JEQ drawwone
    JMP enddraw

drawwone:
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
drawwtwo:
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

drawwtre:
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
drawwfor:
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

#### X ####
drawxdef:
    MOV sp, 2
    JMP drawxloop

drawxloop:
    CMP sp, 2
    JEQ drawxtwo
    CMP sp, 1
    JEQ drawxone
    JMP enddraw

drawxone:
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
drawxtwo:
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

#### Y ####
drawydef:
    MOV sp, 3
    JMP drawyloop

drawyloop:
    CMP sp, 3
    JEQ drawytre
    CMP sp, 2
    JEQ drawytwo
    CMP sp, 1
    JEQ drawyone
    JMP enddraw

drawyone:
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

drawytwo:
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

drawytre:
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

#### Z ####
drawzdef:
    MOV sp, 3
    JMP drawzloop

drawzloop:
    CMP sp, 3
    JEQ drawztre
    CMP sp, 2
    JEQ drawztwo
    CMP sp, 1
    JEQ drawzone
    JMP enddraw

drawzone:
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
drawztwo:
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
drawztre:
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

####   ####
drawspacedef:
    MOV sp, 0
    JMP drawspaceloop

drawspaceloop:
    JMP enddraw

#### o ####
signdef:
    MOV sp, 6
    JMP signloop

signloop:
    CMP sp, 6
    JEQ signsix
    CMP sp, 5
    JEQ signfiv
    CMP sp, 4
    JEQ signfor
    CMP sp, 3
    JEQ signtre
    CMP sp, 2
    JEQ signtwo
    CMP sp, 1
    JEQ signone
    JMP end

signone:
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

signtwo:
    MOV t5, g12
    MOV ra, t5
    ADD t5, 4
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    MOV rd, t5
    JMP bresenham

signtre:
    MOV t5, g12
    MOV ra, t5
    ADD t5, 4
    MOV rc, t5
    MOV t5, g13
    ADD t5, 4
    MOV rb, t5
    MOV rd, t5
    JMP bresenham

signfor:
    MOV t5, g12
    ADD t5, 4
    MOV ra, t5
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    ADD t5, 4
    MOV rd, t5
    JMP bresenham

signfiv:
    MOV t5, g12
    MOV ra, t5
    ADD t5, 4
    MOV rc, t5
    MOV t5, g13
    MOV rb, t5
    ADD t5, 4
    MOV rd, t5
    JMP bresenham

signsix:
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

oneloop:
# t8: (x,y) = mempos = y * offset (250 pixels in y) + x
    MOV t8, t10
    MUL t8, 250
    ADD t8, t9
    MUL t8, 4
# draw mempos = 1
    MOV g11, 1
    STR g11, t8
# increment
    ADD t9, 1
    CMP t9, 250
    JGE incy
# for y < max loop : end
    CMP t6, t5
    JLT oneloop
    JMP readworddef

incy:
    MOV t9, zero
    ADD t10, 1
    CMP t6, t5
    JLT oneloop
    JMP readworddef

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
    JMP enddraw

# (x1: ra, y1: rb, x2: rc, y2: rd)
bresenham:
    CMP ra, rc
    JEQ brehor
    JMP brever

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

breloopver:
# t9: x = x1
    MOV t9, ra
# t10: y = y1
    MOV t10, rb
# t8: mempos = y * offset (250 pixels in y) + x
    MOV t8, t10
    MUL t8, 250
    ADD t8, t9
    MUL t8, 4
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
    SUB sp, 1
    JMP choosecharloop

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
    
breloophor:
# t9: y = y1
    MOV t9, rb
# t10: x = x1
    MOV t10, ra
# t8: mempos = y * offset (250 pixels in y) + x
    MOV t8, t9
    MUL t8, 250
    ADD t8, t10
    MUL t8, 4
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
    SUB sp, 1
    JMP choosecharloop

sloperestore:
    ADD t10, 1
    SUB t6, t7
    # y++
    ADD t9, 1
    # if x <= x2
    CMP t9, rc
    JLE breloophor
    JMP enddraw

end:
    ADD zero, zero