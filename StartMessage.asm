#include p18f87k22.inc

	extern  LCD_Setup, LCD_Write_Message	    ; external LCD subroutines
	
	global greeting
	global failure
	global setup
	;extern Greeting
	;extern Length
	
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
loop 	tblrd*+			; one byte from PM to TABLA increment TBLPRT
	movff	TABLAT, POSTINC0; move data from TABLAT to (FSR0), inc FSR0	
	decfsz	counter		; count down to zero
	bra	loop		; keep going until finished
			
	movff	length, WREG	; output message to LCD (leave out "\n")
	decf	WREG
	lfsr	FSR2, TextLocation
	call	LCD_Write_Message
	
	return
	;goto	$		; goto current line in code

	; a delay subroutine if you need one, times around loop in delay_count
delay	decfsz	delay_count	; decrement until zero
	bra delay
	return
	
	end


