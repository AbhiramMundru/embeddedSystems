ORG 0000H
	SJMP START
	ORG 0035H
		
		START:MOV DPTR,#LUT // moves starting address of LUT to DPTR
		MOV A,#0000000B // loads A with all 1's
		MOV P2,#00000000B // initializes P0 as output port

		BACK:MOV P1,#0FFH // make all ports high initially
     CLR P1.0  // makes row 1 low
     JB P1.4,NEXT1  // if the bit is high then switch is not pressed so check next key in the same row
     MOV A,#0   // key 1 is pressed
     ACALL DISPLAY   
NEXT1:JB P1.5,NEXT2 
      MOV A,#1 // key 2 is pressed
      ACALL DISPLAY 
NEXT2:JB P1.6,NEXT3  
      MOV A,#2 // key 3 is pressed
      ACALL DISPLAY  
NEXT3:JB P1.7,NEXT4  
      MOV A,#3 // key 4 is pressed
      ACALL DISPLAY  
	  
NEXT4:SETB P1.0 // done checking row 1 make row 1 high again 
      CLR P1.1 // make 2nd row low for checking
      JB P1.4,NEXT5  
      MOV A,#4 // key 1 is pressed
      ACALL DISPLAY  
NEXT5:JB P1.5,NEXT6  
      MOV A,#5 // key 2 is pressed
      ACALL DISPLAY  
NEXT6:JB P1.6,NEXT7  
      MOV A,#6 // key 3 is pressed
      ACALL DISPLAY  
NEXT7:JB P1.7,NEXT8  
      MOV A,#7 // key 4 is pressed
      ACALL DISPLAY
	  
NEXT8:SETB P1.1 // donce checking row 2 make row 2 high again 
      CLR P1.2 // make 3rd row low for checking
      JB P1.4,NEXT9  
      MOV A,#8 // key 1 is pressed
      ACALL DISPLAY  
NEXT9:JB P1.5,NEXT10  
      MOV A,#9 // key 2 is pressed
      ACALL DISPLAY  
NEXT10:JB P1.6,NEXT11  
       MOV A,#10 // key 3 is pressed
       ACALL DISPLAY  
NEXT11:JB P1.7,NEXT12  
       MOV A,#11 // key 4 is pressed
       ACALL DISPLAY  
	   
NEXT12:SETB P1.2 // donce checking row 3 make row 3 high
       CLR P1.3 // make 4th row low for checking
       JB P1.4,NEXT13  
       MOV A,#12 // key 1 is pressed
       ACALL DISPLAY  
NEXT13:JB P1.5,NEXT14  
       MOV A,#13 // key 2 is pressed
       ACALL DISPLAY  
NEXT14:JB P1.6,NEXT15  
       MOV A,#14 // key 3 is pressed
       ACALL DISPLAY  
NEXT15: JB P1.7,BACK // checks whether column 4 is low and repeat if not set
       MOV A, #15 // key 4 is pressed
       ACALL DISPLAY  
       LJMP BACK // repeat again

DISPLAY: MOVC A, @A+DPTR // based on the value on the accumulator dptr is incremented and moved to A
        MOV P2, A       // puts corresponding digit drive pattern into P0 to display on 7 segment display
        RET

// database for display
LUT: DB 00000111B // 7
     DB 01111111B // 8
     DB 01101111B // 9
     DB 01110001B // F
     DB 01100110B // 4
     DB 01101101B // 5
     DB 01111101B // 6
     DB 01111001B // E		 
     DB 00000110B // 1
     DB 01011011B // 2
     DB 01001111B // 3
     DB 01011110B // D
     DB 01110111B // A
     DB 00111111B // 0 
     DB 01111100B // B
     DB 00111001B // C
     END
