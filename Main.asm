	#include p18f87k22.inc

acs0		udata_acs			; named variables in access ram	
countdown	res 1				; countdown variable for the timer
no_buttons	res 1				; variable for keypad reading
sequence	res 1				; length of sequence

	
;sharing of variables and subroutines across files
extern  LCD_Clear_Display	      
extern	setup, greeting, failure,levelmessage, toolate, playagain
extern	setlfsr, load, LFSRCounter, shiftregister
extern	setflash, flashcounter, read, meddelay, bigdelay, variabledelay
extern	keypadsetup, keypadloop, readinput
extern	int_on
extern	ADCsetup, ADC_Read
global	leave, nextlevel, no_buttons, countdown, sequence, errormess
	

rst	code	0		    ;reset vector
	goto	start
	

	
main	code

start	call	setup		    ;LCD setup
	call	setflash	    ;LED setup
	call	keypadsetup	    ;keypad setup
	call	ADCsetup	    ;ADC setup
	call	greeting	    ;displays 'Press any key'
	call	meddelay	    ;medium delay
	call	keypadloop	    ;waits until key is pressed
	call	setlfsr		    ;LFSR setup
	call	LCD_Clear_Display   ;clears LCD screen
	call	bigdelay	    ;waits to start game
	bcf	INTCON,GIE	    ;disables all interrupts

	

level	call	load		    ;produces and stores random sequence
	clrf	flashcounter	    ;resets counter
	call	ADC_Read	    ;reads voltage value in ADC
	movwf	variabledelay	    ;sets speed of LED flashes
	call	read		    ;flashes sequence
	call	int_on		    ;enables timer interrupts
	clrf	no_buttons	    ;resets counter for keypad
	call	readinput	    ;reads keypad

	
nextlevel			    ;prepares for next level
	call	levelmessage	    ;displays next level
	call	meddelay	    ;medium delay
	call	LCD_Clear_Display   ;clears LCD screen
	call	greeting	    ;displays 'Press any key'
	call	meddelay	    ;medium delay
	call	keypadloop	    ;waits until key is pressed
	movlw	0x0F		    
	cpfsgt	shiftregister	    ;checks if seed is 0000
	setf	shiftregister	    ;changes 0000 seeds to 1111
	call	LCD_Clear_Display   ;clears LCD screen
	incf	sequence, 1,0	    ;increases sequence length
	lfsr	FSR1, 0x140	    ;moves FSR1 address back so previous sequence is overwritten
	clrf	countdown	    ;clears timer
	call	bigdelay	    
	goto	level		    ;moves onto next level
	
leave	call	toolate		    ;displays "Time's up! message"
	call	bigdelay	    ;waits
	call	LCD_Clear_Display   ;clears LCD
	goto	restart
	
errormess   
	call	failure		    ;displays error message
	call	bigdelay	    ;waits
	call	LCD_Clear_Display   ;clears LCD
	goto	restart

restart	
	call	playagain	    ;displays "Press key to restart"
	call	meddelay	    ;medium delay
	call	keypadloop	    ;waits until key is pressed
	goto	start		    ;restarts game
	
	end