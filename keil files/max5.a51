ORG 0000H
SJMP START
ORG 0035H
START: MOV A, #00H 
MOV R0, #00H ; clearing R0 to store maximum number
MOV DPTR, #90H ; assuming data stored is from 90H
MOV R1, #10 ; loop 10 times
LOOP: MOVC B, @DPTR 
CLR C 
INC DPTR ; pointing to next location
SUBB A, B 
JNC SKIP ; if carry, then b > a
MOV RO, B ; store maximum number in R0
SKIP: MOV A, R0 ; compare max number till now with next number
DJNZ R1, LOOP ; loop for 10 times
END 

ORG 0090H
	DB 4 , 5, 6, 7, 8