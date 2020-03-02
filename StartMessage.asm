#include p18f87k22.inc

	extern  LCD_Setup, LCD_Write_Message	    ; external LCD subroutines
	
	global greeting
	global failure
	global setup
	global levelmessage	
	global toolate
	global playagain
	
acs0	    udata_acs		  ; reserve data space in access ram
counter	    res 1		  ; reserve one byte for a counter variable
delay_count res 1		  ; counter in the delay routine
length	    res 1		  ; length of message
 
tables	udata	0x400		  ; reserve data anywhere in RAM (here at 0x400)
TextLocation res 0x80		  ; reserve 128 bytes for message data

 
pdata	code    ; a section of programme where messages are stored
	
	
initial data	    "Press any key\n"		;greeting message
	constant greet_len = .14
	
wrong	data	    "WRONG! GAME OVER\n"	;error message
	constant wrong_len = .17
	
next	data	    "Next level\n"		;next level message
	constant next_len = .11
	
latee	data	    "Took too long\n"		;too late message
	constant late_len = .14
	
restart data	    "Press to restart\n"	;restartmessage
	constant again_len = .17
	
	
	
	
main	code
	
setup				        ; calls LCD setup
	bcf	EECON1, CFGS	        ; point to Flash program memory  
	bsf	EECON1, EEPGD	        ; access Flash program memory
	call	LCD_Setup	        ; setup LCD
	return
	

greeting				; sends greeting message to LCD
	lfsr	FSR0, TextLocation	; Load FSR0 with address in RAM
	movlw	greet_len
	movwf	length			; sets length of data
	movlw	upper(initial)		; address of data in PM
	movwf	TBLPTRU			; load upper bits to TBLPTRU
	movlw	high(initial)		; address of data in PM
	movwf	TBLPTRH			; load high byte to TBLPTRH
	movlw	low(initial)		; address of data in PM
	movwf	TBLPTRL			; load low byte to TBLPTRL
	movff	length, counter
	call	loop			; proceeds to displaying in LCD
	return
		
failure					;sends failure message to LCD
	lfsr	FSR0, TextLocation	
	movlw	wrong_len
	movwf	length
	movlw	upper(wrong)	
	movwf	TBLPTRU		
	movlw	high(wrong)	
	movwf	TBLPTRH		
	movlw	low(wrong)	
	movwf	TBLPTRL		
	movff	length, counter
	call	loop
	return
		
levelmessage				;sends new level message to LCD
	lfsr	FSR0, TextLocation
	movlw	next_len
	movwf	length
	movlw	upper(next)	
	movwf	TBLPTRU		
	movlw	high(next)	
	movwf	TBLPTRH		
	movlw	low(next)	
	movwf	TBLPTRL		
	movff	length, counter
	call	loop
	return
		
toolate					;sends too late message to LCD
	lfsr	FSR0, TextLocation
	movlw	late_len
	movwf	length
	movlw	upper(latee)
	movwf	TBLPTRU	
	movlw	high(latee)
	movwf	TBLPTRH		
	movlw	low(latee)	
	movwf	TBLPTRL		
	movff	length, counter
	call	loop
	return
		
playagain				;sends restart message to LCD
	lfsr	FSR0, TextLocation	
	movlw	again_len
	movwf	length
	movlw	upper(restart)
	movwf	TBLPTRU		
	movlw	high(restart)	
	movwf	TBLPTRH		
	movlw	low(restart)	
	movwf	TBLPTRL		
	movff	length, counter
	call	loop
	return
		
loop				    ; sends length and outputs message
	tblrd*+			    ; one byte from PM to TABLA increment TBLPRT
	movff	TABLAT, POSTINC0    ; move data from TABLAT to (FSR0), inc FSR0	
	decfsz	counter		    ; count down to zero
	bra	loop		    ; keep going until finished
			    
	movff	length, WREG	    ; output message to LCD (leave out "\n")
	decf	WREG
	lfsr	FSR2, TextLocation
	call	LCD_Write_Message
	return

	
	end


