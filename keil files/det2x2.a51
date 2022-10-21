ORG 0000H
SJMP START
ORG 0035H
//a b
//c d
START: MOV R1, #02H ; a
MOV R2, #04H ; b
MOV R3, #01H ; c
MOV R4, #03H ; d
MOV A, R1
MOV B, R4
MUL AB ; 1,1 * 2,2
MOV 45H, B ; lower 8 bits of 16 bit multiplication stored at 45H
MOV 46H, A ; higher 8 bits of 16 bit multiplication stored at 45H
MOV A, R2 ; moving for multiplication
MOV B, R3
MUL AB ; 1,2 * 2,1
MOV 47H, B ; lower 8 bits of 16 bit multiplication stored at 47H
MOV 48H, A ; higher 8 bits of 16 bit multiplication stored at 45H
CLR C ; clear carry before subtraction
MOV A, 45H ; lower 8 bits subtraction
SUBB A, 47H
MOV 50H, A
MOV A, 46H
SUBB A, 48H ; higher 8 bits subtraction
MOV 51H,A ; 16 bit determinant stored at 51H and 50H respectively
MOV R0,51H
MOV R1,50H
END
