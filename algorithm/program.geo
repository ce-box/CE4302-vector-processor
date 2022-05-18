# MEM ESCALAR, Como estaba + junta con los switches
# MEM VECTORIAL, 200 KB

main:
    LDR rs, 0
    LDR t5, 256
    MUL t5, 256
    LDR g11, t5
    SUB t5, 1 # Memory Pointer
    JGE applyFilterLoop

applyFilterLoop:
    CMP t5, 0
    JGE end
    CMP rs, 0
    JGE sepia
    CMP rs, 1
    JGE gray
    CMP rs, 2
    JGE negative
    JGE end

sepia:
# Effect
    # Cargar a Registros
    VLDR vr, t5 # primeros 4 valores
    LDR  t6, t5
    ADD  t6, g11
    LDR  t7, t6
    ADD  t7, g11
    VLDR vg, t6 # primeros 4 valores
    VLDR vb, t7 # primeros 4 valores
    # SEPIA
    # RED
    VLDR vtr, vr
    VDIV vtr, 3
    VADD vtr, vg
    VLDR vt, vb
    VDIV vt, 5
    VADD vtr, vg
    # GREEN
    VLDR vtg, vr
    VDIV vtg, 3
    VADD vtg, vg
    VLDR vt, vb
    VDIV vt, 6
    VADD vtg, vg
    # BLUE
    VLDR vtb, vr
    VDIV vtb, 3
    VLDR vt, vg
    VDIV vt, 2
    VADD vtb, vt
    VLDR vt, vb
    VDIV vt, 5
    VADD vtb, vg
    # ASSIGN
    VLDR vr, vtr
    VLDR vg, vtg
    VLDR vb, vtb
    # MEMORY
    VSTR t5, vr
    VSTR t6, vg
    VSTR t7, vb
    JGE applyFilter
# Loop
    SUB r5, 4
    JGE applyFilter

gray:
# Effect
    VLDR vr, t5 # primeros 4 valores
    LDR  t6, t5
    ADD  t6, g11
    LDR  t7, t6
    ADD  t7, g11
    VLDR vg, t6 # primeros 4 valores
    VLDR vb, t7 # primeros 4 valores
    VDIV vr, 3
    VDIV vg, 3
    VDIV vb, 3
    VADD vr, vg
    VADD vr, vb
    VLDR vg, vr
    VLDR vb, vr
    # MEMORY
    VSTR t5, vr
    VSTR t6, vg
    VSTR t7, vb
# Loop
    SUB r5, 4
    JGE applyFilter

negative:
    LDR  t6, t5
    ADD  t6, g11
    LDR  t7, t6
    ADD  t7, g11
# R
    VLDR vr, 255
    VLDR vt, t5
    VSUB vr, vt
# G
    VLDR vg, 255
    VLDR vt, t6
    VSUB vg, vt
# B
    VLDR vb, 255
    VLDR vt, t7
    VSUB vb, vt
    # MEMORY
    VSTR t5, vr
    VSTR t6, vg
    VSTR t7, vb
# Loop
    SUB r5, 4
    JGE applyFilter

end:
    add ra, 0
