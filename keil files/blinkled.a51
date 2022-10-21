ORG 0000H
SJMP START
ORG 0035H
START: MOV R0, #15 
CPL P1.0
MOV TMOD, 01H ; using timer 0 in mode 1
REPEAT: MOV TH0, #00H
MOV TL0, #00H ; maximum delay
SETB TR0 ; starting counter
CHECK: JNB TF0, CHECK ; waiting until TF0 flag is set
CLR TR0 ; stopping timer
CLR TF0 ; clearing overflow flag
DJNZ R0, REPEAT ; loop 15 times
JMP START
END
