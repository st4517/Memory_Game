#include p18f87k22.inc

	extern  LCD_Setup, LCD_Write_Message	    ; external LCD subroutines
	
	global writemessage
	global setup
	extern Greeting
	extern Length
	extern TextLocation
	
acs0	udata_acs   ; reserve data space in access ram
counter	    res 1   ; reserve one byte for a counter variable
delay_count res 1   ; reserve one byte for counter in the delay routine

 

;rst	code	0    ; reset vector
	;goto	setup

pdata	code    ; a section of programme memory for storing data

	
main	code
	
	
	; ******* Programme FLASH read Setup Code ***********************
setup	bcf	EECON1, CFGS	; point to Flash program memory  
	bsf	EECON1, EEPGD 	; access Flash program memory
	call	LCD_Setup	; setup LCD
	return
	;goto	start
	
	; ******* Main programme ****************************************
writemessage 	lfsr	FSR0, TextLocation	; Load FSR0 with address in RAM	
		movlw	upper(Greeting)	; address of data in PM
		movwf	TBLPTRU		; load upper bits to TBLPTRU
		movlw	high(Greeting)	; address of data in PM
		movwf	TBLPTRH		; load high byte to TBLPTRH
		movlw	low(Greeting)	; address of data in PM
		movwf	TBLPTRL		; load low byte to TBLPTRL
		movff	Length, counter
loop 	tblrd*+			; one byte from PM to TABLAT, increment TBLPRT
	movff	TABLAT, POSTINC0; move data from TABLAT to (FSR0), inc FSR0	
	decfsz	counter		; count down to zero
	bra	loop		; keep going until finished
			
	movff	Length, WREG	; output message to LCD (leave out "\n")
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


