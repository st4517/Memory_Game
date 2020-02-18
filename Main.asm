	#include p18f87k22.inc

acs0    udata_acs				; named variables in access ram	
d0	res 1				    ; reserve 1 byte for variable delay
d1	res 1
d2	res 1
level	res 1
Length res 1
	
tables	udata	0x400		  ; reserve data anywhere in RAM (here at 0x400)
TextLocation res 0x80			    ; reserve 128 bytes for message data

 ;

	extern  LCD_Setup, LCD_Write_Message	      ; external LCD subroutines
	extern writemessage
	extern setup
	extern flashcounter
	global TextLocation
	global Greeting
	global Length
	

rst	code	0						 ;reset vector
	goto	start
	
pdata	 code
	 ;	; ******* Greeting, data in programme memory, and its length *****
Greeting data	    "Press any key\n"	; message, plus carriage return
	constant greet_len = .14
	
main	code

start	call	setup
	call	setlfsr
	call	setflash
	movlw	greet_len
	movwf	Length ; length of data
	call	writemessage
	goto	$

level	call	load   ;produces and stores random sequence
	clrf	flashcounter
	call	read
	call	int_on


	end