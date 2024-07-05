(Begin)
    @R2
    M=0
(LOOP)
    // R1 <= 0 end of itetaion
    @R1
    D=M
    @END
    D;JEQ
    // R2 += R0
    @R0
    D=M
    @R2
    M=D+M
    @R1
    M=M-1
    @LOOP
    0;JMP
    // end loop since no end syscall
(END)
    @END
    0;JMP
