	#include p18f87k22.inc

acs0    udata_acs				; named variables in access ram	
d0	res 1				    ; reserve 1 byte for variable delay
d1	res 1
d2	res 1
;length	res 1
	

	extern  LCD_Clear_Display	      ; external LCD subroutines
	extern	setup, greeting, failure
	extern	setlfsr, load
	extern	setflash, flashcounter, read
	extern	int_on
	;global	Greeting
	;global	length
	

rst	code	0						 ;reset vector
	goto	start
	

	
main	code

start	call	setup		    ;LCD setup
	call	setlfsr		    ;LFSR setup
	call	setflash	    ;LED setup
	;movlw	greet_len
	;movwf	length		    ;length of data
	call	greeting
	call	LCD_Clear_Display
	call	failure
	

level	call	load		    ;produces and stores random sequence
	clrf	flashcounter	    ;
	call	read		    ;flashes sequence
	call	int_on		    ;enables interrrupts


	end