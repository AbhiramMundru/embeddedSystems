ORG 0000H         //Start the program
	SJMP MAIN
		 ORG 0035H
			 MAIN:CLR P2.0;
              MOV TMOD, #01H ;using Timer 0 in Mode 1
              LCALL one_eighty_degrees
			  ACALL delay
			  LCALL ninety_degrees
              SJMP MAIN ;to repeat the loop until manually stopped
				   
ORG 0055H
          zero_degrees: //To create a pulse of 1ms
          MOV TH0, #0FCH //(FFFF - FC19 + 1)H = (03E7)H 
          MOV TL0, #19H //equal TO (1000)D = 1ms
          SETB P2.0 ;Make P2.0 HIGH
          SETB TR0 ;Start the timer 0
          WAIT1:JNB TF0, WAIT1 ;Wait till the TF0 flag is set 
          CLR TF0 ;Clear the flag manually
          CLR TR0 ;Stop the timer 0
		  MOV TH0, #0B5H //(FFFF - FC19 + 1)H = (03E7)H 
          MOV TL0, #0C8H //equal TO (1000)D = 1ms
          CLR P2.0 ;Make P2.0 HIGH
          SETB TR0 ;Start the timer 0
          WAIT2:JNB TF0, WAIT2 ;Wait till the TF0 flag is set 
          CLR TF0 ;Clear the flag manually
          CLR TR0 ;Stop the timer 0
           RET
		   
		   
		   
ORG 0065H
		  ninety_degrees: //To create a pulse of 1.5ms
          MOV TH0, #0FAH //(FFFF - FC19 + 1)H = (03E7)H 
          MOV TL0, #25H //equal TO (1000)D = 1ms
          SETB P2.0 ;Make P2.0 HIGH
          SETB TR0 ;Start the timer 0
          WAIT3:JNB TF0, WAIT3 ;Wait till the TF0 flag is set 
          CLR TF0 ;Clear the flag manually
          CLR TR0 ;Stop the timer 0
		  MOV TH0, #0B7H //(FFFF - FC19 + 1)H = (03E7)H 
          MOV TL0, #0BCH //equal TO (1000)D = 1ms
          CLR P2.0 ;Make P2.0 HIGH
          SETB TR0 ;Start the timer 0
          WAIT4:JNB TF0, WAIT4 ;Wait till the TF0 flag is set 
          CLR TF0 ;Clear the flag manually
          CLR TR0 ;Stop the timer 0
          RET 

ORG 0075H
		  one_eighty_degrees: //To create a pulse of 2ms 
          MOV TH0, #0F8H //(FFFF - FC19 + 1)H = (03E7)H 
          MOV TL0, #31H //equal TO (1000)D = 1ms
          SETB P2.0 ;Make P2.0 HIGH
          SETB TR0 ;Start the timer 0
          WAIT5:JNB TF0, WAIT5 ;Wait till the TF0 flag is set 
          CLR TF0 ;Clear the flag manually
          CLR TR0 ;Stop the timer 0
		  MOV TH0, #0B9H //(FFFF - FC19 + 1)H = (03E7)H 
          MOV TL0, #0B0H //equal TO (1000)D = 1ms
          CLR P2.0 ;Make P2.0 HIGH
          SETB TR0 ;Start the timer 0
          WAIT6:JNB TF0, WAIT6 ;Wait till the TF0 flag is set 
          CLR TF0 ;Clear the flag manually
          CLR TR0 ;Stop the timer 0
               RET 
			   
			   			   
ORG 0085H
			  delay: //To create a delay of one second
			  MOV R4, #15
              SECOND:MOV TH0, #00H
			  MOV TL0, #00H
			  SETB TR0
			  CHECK: JNB TF0, CHECK
			  CLR TF0
			  CLR TR0
			  DJNZ R4, SECOND
              RET
								
            END






