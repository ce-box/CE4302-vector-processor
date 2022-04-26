start:
    JMP add
    JMP end

add:
# ra = 0
    MOV ra, 1
    MOV rb, 'C' #  rb = ascii(C)
    ADD ra, 4 // ra = ra + 4
    ADD ra, rb // ra = ra + rb = 5 + 3
    RET
    
end:
    ADD zero, zero