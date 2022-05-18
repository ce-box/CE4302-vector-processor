ADD r0 r0 0
LDR r1 r5 267
STR r2 r1 0
SUB r4 r3 r1
JBE Greater
SUB r4 r0 r5
Greater:
VADD r7 r6 48
VSUB r5 r3 r4
VDIV r4 r3 r2
VDIV r5 r3 r1
VADD r3 r2 10
VSTR r1 r2 r3
VLDR r2 r5 10