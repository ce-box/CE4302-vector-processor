ADD rc, 5
MOV ra, 12
LDR ra, t5 // LDR <mem_addr>,<reg> | LDR <reg>, <mem_addr>
MOV rd, 8
STR rd, rc // STR <dest>, <src>
ADD t6, 15