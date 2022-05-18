namespace GEO
{
    public enum Instruction
    {
        LDR  = 0b0001011001,
        STR  = 0b0001110000,
        VLDR = 0b1001011001,
        VSTR = 0b1001110000,
        ADD  = 0b0000001000,
        VADD = 0b1000001000,
        SUB  = 0b0000000101,
        VSUB = 0b1000010000,
        DIV  = 0b0000010000,
        VDIV = 0b1000011000,
        JBE  = 0b0010000000,
    }
}
