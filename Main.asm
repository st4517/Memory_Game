	#include p18f87k22.inc

acs0    udata_acs				; named variables in access ram	
d0	res 1				    ; reserve 1 byte for variable delay
d1	res 1
d2	res 1
countdown   res 1
no_buttons	res 1
sequence    res 1

	

	extern  LCD_Clear_Display	      ; external LCD subroutines
	extern	setup, greeting, failure,levelmessage
	extern	setlfsr, load, LFSRCounter
	extern	setflash, flashcounter, read, delay, delayreset, bigdelay
	extern	keypadsetup, keypadloop, readinput,pressed
	extern	int_on
	global	leave, nextlevel, no_buttons, countdown, sequence
	

rst	code	0						 ;reset vector
	goto	start
	

	
main	code

start	call	setup		    ;LCD setup
	call	setflash	    ;LED setup
	call	keypadsetup
	call	greeting
	call	delayreset
	call	delay
	call	keypadloop
	call	setlfsr		    ;LFSR setup
	call	LCD_Clear_Display
	call	delay
	movlw	0x04
	movwf	sequence
	clrf	countdown
	bcf	INTCON,GIE	    ; Disable all interrupts

	

level	call	load		    ;produces and stores random sequence
	clrf	flashcounter	    ;
	call	read		    ;flashes sequence
	call	int_on		    ;enables timer interrupts
	clrf	no_buttons
	clrf	pressed
	call	readinput

	
nextlevel
	
	call	levelmessage	    ;displays next level
	incf	sequence, 1,0
	lfsr	FSR1, 0x140
	clrf	countdown
	call	bigdelay
	call	delay
	call	LCD_Clear_Display
	goto	level
	
leave	call	toolate
	goto $
	
	
delayy	
	end