MOV ra, 4 //0
MOV rb, 8 //4
MOV rc, 5 //8
CMP rb, 8 //C
JEQ add   //10
sub:
SUB ra, rc //14
JMP end    //18
add:
ADD ra, rc //1C
end:
ADD t5, ra //20