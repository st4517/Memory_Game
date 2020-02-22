	#include p18f87k22.inc

acs0		udata_acs			; named variables in access ram	
d0		res 1				; reserve 1 byte for variable
d1		res 1
d2		res 1
countdown	res 1
no_buttons	res 1
sequence	res 1

	

	extern  LCD_Clear_Display	      
	extern	setup, greeting, failure,levelmessage, toolate
	extern	setlfsr, load, LFSRCounter
	extern	setflash, flashcounter, read, meddelay, bigdelay
	extern	keypadsetup, keypadloop, readinput
	extern	int_on
	global	leave, nextlevel, no_buttons, countdown, sequence
	

rst	code	0						 ;reset vector
	goto	start
	

	
main	code

start	call	setup		    ;LCD setup
	call	setflash	    ;LED setup
	call	keypadsetup	    ;keypad setup
	call	greeting	    ;displays 'Press any key'
	call	meddelay	    ;medium delay
	call	keypadloop	    ;waits until key is pressed
	call	setlfsr		    ;LFSR setup
	call	LCD_Clear_Display
	call	meddelay
	bcf	INTCON,GIE	    ; Disable all interrupts

	

level	call	load		    ;produces and stores random sequence
	clrf	flashcounter	    ;
	call	read		    ;flashes sequence
	call	int_on		    ;enables timer interrupts
	clrf	no_buttons
	call	readinput

	
nextlevel
	call	levelmessage	    ;displays next level
	incf	sequence, 1,0	    ;increases sequence length
	lfsr	FSR1, 0x140
	clrf	countdown
	call	bigdelay
	call	LCD_Clear_Display
	goto	level
	
leave	call	toolate
	goto $
	
	end