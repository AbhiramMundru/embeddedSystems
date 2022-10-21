ORG 0000H 
SJMP START 
DELAY: 
MOV TMOD, #01H // Timer 0 in mode 1 
MOV TH0,#00H // value in TH0TL0 = 0000h 
 MOV TL0,#00H // produce a delay 0f 65ms 
SETB TR0 // start count 
CHECK: JNB TF0, CHECK // check if TF0 is set 
CLR TR0 // clear TR0 flag
 CLR TF0 // clear TF0 flag to produce desired delay 
RET // Return from Delay subroutine.


ORG 0035H
 START: MOV R0,#08H // moving 8 in R0 to 8 bits in registers. 
MOV A,#00H // clearing A 
LABEL: SETB C // setting carry flag 
RLC A // rotate left with carry to set bits
 MOV P1,A // send accumulator data to port 0 to blink leds 
ACALL DELAY // generate a delay of 65ms 
ACALL DELAY // generate a delay of 65ms
 DJNZ R0, LABEL // repeat above process 8 times. 
JMP START // continuously repeat this process. 
END