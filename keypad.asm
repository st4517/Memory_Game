#include p18f87k22.inc

	
global	keypadsetup, keypadloop	
	
	
	
	

keypad code                     ; let linker place main program

keypadsetup
	banksel PADCFG1		    ; PADCFG1 is not in Access Bank!!
	bsf PADCFG1,REPU,BANKED	    ;enable pullup resistors
	movlw	0x0F
	movwf	TRISE		    ;lower nibble input, upper nibble output
	return
	
keypadloop
	btfss	PORTE,RE0
	return
	btfss	PORTE,RE1
	return
	btfss	PORTE,RE2
	return
	btfss	PORTE,RE3
	return
	bra keypadloop


    end