	#include p18f87k22.inc

acs0    udata_acs				; named variables in access ram	
d0	res 1				    ; reserve 1 byte for variable delay
d1	res 1
d2	res 1
countdown   res 1
no_buttons	res 1
	

	extern  LCD_Clear_Display	      ; external LCD subroutines
	extern	setup, greeting, failure
	extern	setlfsr, load, LFSRCounter
	extern	setflash, flashcounter, read, delay
	extern	keypadsetup, keypadloop
	extern	int_on
	global	no_buttons
	global	countdown
	

rst	code	0						 ;reset vector
	goto	start
	

	
main	code

start	call	setup		    ;LCD setup
	call	setflash	    ;LED setup
	call	keypadsetup
	call	greeting
	call	delay
	call	keypadloop
	call	setlfsr		    ;LFSR setup
	call	LCD_Clear_Display
	call	delay


	

level	call	load		    ;produces and stores random sequence
	clrf	flashcounter	    ;
	call	read		    ;flashes sequence
	call	int_on		    ;enables interrrupts
hurryup
	movff	no_buttons, WREG
	cpfslt	LFSRCounter
	goto	nextlevel
	movlw	0xB
	cpfsgt	countdown
	bra	hurryup
	goto	leave
	
nextlevel
	goto $
	
leave
	goto $
	
	
delayy	
	end