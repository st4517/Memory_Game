#include p18f87k22.inc

	extern  LCD_Setup, LCD_Write_Message	    ; external LCD subroutines
	
	global greeting
	global failure
	global setup
	global levelmessage	
	global toolate
	global playagain
	
acs0	udata_acs   ; reserve data space in access ram
counter	    res 1   ; reserve one byte for a counter variable
delay_count res 1   ; reserve one byte for counter in the delay routine
message	    res 10
length	res 1
 
tables	udata	0x400		  ; reserve data anywhere in RAM (here at 0x400)
TextLocation res 0x80		  ; reserve 128 bytes for message data

 

;rst	code	0    ; reset vector
	;goto	setup

pdata	code    ; a section of programme memory for storing data
	
	
initial data	    "Press any key\n"	; message, plus carriage return
	constant greet_len = .14
	
wrong	data	    "lol thats wrong\n"	; message, plus carriage return
	constant wrong_len = .16
	
next	data	    "Next level\n"
	constant next_len = .11
	
late	data	    "too late m8\n"
	constant late_len = .12
	
restart data	    "Press to restart\n"	; message, plus carriage return
	constant again_len = .17
	
main	code
	
	
	; ******* Programme FLASH read Setup Code ***********************
setup	bcf	EECON1, CFGS	; point to Flash program memory  
	bsf	EECON1, EEPGD 	; access Flash program memory
	call	LCD_Setup	; setup LCD
	return
	;goto	start
	
	; ******* Main programme ****************************************
greeting	lfsr	FSR0, TextLocation	; Load FSR0 with address in RAM
		movlw	greet_len
		movwf	length		    ;length of data
		movlw	upper(initial)	; address of data in PM
		movwf	TBLPTRU		; load upper bits to TBLPTRU
		movlw	high(initial)	; address of data in PM
		movwf	TBLPTRH		; load high byte to TBLPTRH
		movlw	low(initial)	; address of data in PM
		movwf	TBLPTRL		; load low byte to TBLPTRL
		movff	length, counter
		call	loop
		return
		
failure	    	lfsr	FSR0, TextLocation	; Load FSR0 with address in RAM
		movlw	wrong_len
		movwf	length
		movlw	upper(wrong)	; address of data in PM
		movwf	TBLPTRU		; load upper bits to TBLPTRU
		movlw	high(wrong)	; address of data in PM
		movwf	TBLPTRH		; load high byte to TBLPTRH
		movlw	low(wrong)	; address of data in PM
		movwf	TBLPTRL		; load low byte to TBLPTRL
		movff	length, counter
		call	loop
		return
		
levelmessage	lfsr	FSR0, TextLocation	; Load FSR0 with address in RAM
		movlw	next_len
		movwf	length
		movlw	upper(next)	; address of data in PM
		movwf	TBLPTRU		; load upper bits to TBLPTRU
		movlw	high(next)	; address of data in PM
		movwf	TBLPTRH		; load high byte to TBLPTRH
		movlw	low(next)	; address of data in PM
		movwf	TBLPTRL		; load low byte to TBLPTRL
		movff	length, counter
		call	loop
		return
		
toolate	lfsr	FSR0, TextLocation	; Load FSR0 with address in RAM
		movlw	late_len
		movwf	length
		movlw	upper(late)	; address of data in PM
		movwf	TBLPTRU		; load upper bits to TBLPTRU
		movlw	high(late)	; address of data in PM
		movwf	TBLPTRH		; load high byte to TBLPTRH
		movlw	low(late)	; address of data in PM
		movwf	TBLPTRL		; load low byte to TBLPTRL
		movff	length, counter
		call	loop
		return
		
playagain	lfsr	FSR0, TextLocation	; Load FSR0 with address in RAM
		movlw	again_len
		movwf	length
		movlw	upper(restart)	; address of data in PM
		movwf	TBLPTRU		; load upper bits to TBLPTRU
		movlw	high(restart)	; address of data in PM
		movwf	TBLPTRH		; load high byte to TBLPTRH
		movlw	low(restart)	; address of data in PM
		movwf	TBLPTRL		; load low byte to TBLPTRL
		movff	length, counter
		call	loop
		return
		
loop 	tblrd*+			; one byte from PM to TABLA increment TBLPRT
	movff	TABLAT, POSTINC0; move data from TABLAT to (FSR0), inc FSR0	
	decfsz	counter		; count down to zero
	bra	loop		; keep going until finished
			
	movff	length, WREG	; output message to LCD (leave out "\n")
	decf	WREG
	lfsr	FSR2, TextLocation
	call	LCD_Write_Message
	
	return

	
	end


