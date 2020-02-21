#include p18f87k22.inc

acs0    udata_acs				; named variables in access ram	
pressed res 1
	
global	keypadsetup, keypadloop	, readinput, pressed
extern	leave, nextlevel, no_buttons, sequence,countdown, delay, shortdelay, failure
	
	
	
	

keypad code                     ; let linker place main program

keypadsetup
	banksel PADCFG1		    ; PADCFG1 is not in Access Bank!!
	bsf	PADCFG1,REPU,BANKED	    ;enable pullup resistors
	movlw	0x0F
	movwf	TRISE		    ;lower nibble input, upper nibble output
	clrf	PORTE
	return
	
keypadloop
	btfss	PORTE,RE0
	retlw	0x00
	btfss	PORTE,RE1
	retlw	0x01
	btfss	PORTE,RE2
	retlw	0x02
	btfss	PORTE,RE3
	retlw	0x03
	bra	keypadloop
	
readinput
	btfss	PORTE,RE0
	call	red
	btfss	PORTE,RE1
	call	blue
	btfss	PORTE,RE2
	call	violet
	btfss	PORTE,RE3
	call	yellow
	tstfsz	pressed
	call	check
	clrf	pressed
	call	shortdelay
	call	delay
	clrf	PORTD
	movff	no_buttons, WREG
	cpfsgt	sequence
	goto	nextlevel
	movlw	0x59
	cpfsgt	countdown
	bra	readinput
	goto	leave
	


	
red	movlw	0x01
	movwf	PORTD
	setf	pressed
	movlw	0x00
	return
	
blue	movlw	0x02
	movwf	PORTD
	setf	pressed
	movlw	0x01
	return
	
violet	movlw	0x04
	movwf	PORTD
	setf	pressed
	movlw	0x02
	return
	
yellow	movlw	0x08
	movwf	PORTD
	setf	pressed
	movlw	0x03
	return	
	
check	cpfseq	POSTINC1
	goto	errormess
	incf	no_buttons	    ;posssibly include success message here
	return
	
errormess   call failure
	goto $

	

    end