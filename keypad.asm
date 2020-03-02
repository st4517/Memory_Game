#include p18f87k22.inc

acs0    udata_acs				; named variables in access ram	

	
global	keypadsetup, keypadloop	, readinput
extern	nextlevel, no_buttons, sequence, countdown, lildelay, failure, shiftregister, errormess, leave
 
	
	
	
	

keypad code           

keypadsetup
	banksel PADCFG1			    ;PADCFG1 is not in Access Bank!!
	bsf	PADCFG1, REPU, BANKED	    ;enable pullup resistors
	movlw	0x0F
	movwf	TRISE			    ;lower nibble input, upper nibble output
	clrf	PORTE			    ;drives outputs low
	clrf	countdown
	setf	shiftregister
	return
	
keypadloop				    ;code that waits for ANY button to be pressed
.	btfss	PORTE, RE0		    ;checks if 1st button is pressed
	return
	btfss	PORTE, RE1		    ;checks if 2nd button is pressed
	return
	btfss	PORTE, RE2		    ;checks if 3rd button is pressed
	return
	btfss	PORTE, RE3		    ;checks if 4th button is pressed
	return
	incf	shiftregister, 1	    ;increases LFSR seed as it loops
	bra	keypadloop		    ;keeps looping if no button has been pressed
	
readinput				    ;reads what button has been pressed
	btfss	PORTE, RE0		    ;redirects code to a certain subroutine depending on button pressed
	call	red
	btfss	PORTE, RE1
	call	blue
	btfss	PORTE, RE2
	call	violet
	btfss	PORTE, RE3
	call	yellow
	movlw	0x15
	cpfsgt	countdown		    ;checks if time is up
	bra	readinput		    ;keeps looping if there is time left
	goto	leave			    ;exits if time has run out
	
	
red					    ;compares RED
	movlw	0x01
	movwf	PORTD			    ;flashes red led
	movlw	0x00
	call	check			    ;decides to exit or continue game
	call	lildelay
	clrf	PORTD
	movff	no_buttons, WREG
	cpfsgt	sequence		    ;checks if sequence has been completed
	goto	nextlevel		    ;goes to next level if all correct
	return				    ;keeps reading if sequence unfinished
	
blue					    ;compares BLUE
	movlw	0x02
	movwf	PORTD
	movlw	0x01
	call	check
	call	lildelay
	clrf	PORTD
	movff	no_buttons, WREG
	cpfsgt	sequence
	goto	nextlevel
	return
	
violet					    ;compares VIOLET
	movlw	0x04
	movwf	PORTD
	movlw	0x02
	call	check
	call	lildelay
	clrf	PORTD
	movff	no_buttons, WREG
	cpfsgt	sequence
	goto	nextlevel
	return
	
yellow					    ;compares YELLOW
	movlw	0x08
	movwf	PORTD
	movlw	0x03
	call	check
	call	lildelay
	clrf	PORTD
	movff	no_buttons, WREG
	cpfsgt	sequence
	goto	nextlevel
	return	
	
check	cpfseq	POSTINC1	    ;compares input to FSR1 contents +increases address
	goto	errormess	    ;exits game
	incf	no_buttons	    ;indicates number of correct inputs
	return
	

    end