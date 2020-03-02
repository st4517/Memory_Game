	#include p18f87k22.inc

acs0		udata_acs	    ; named variables in access ram	
d0		res 1		    ; delay lengths
d1		res 1		    ; more delay variables
d2		res 1		    ; more delay variables
variabledelay	res 1		    ; length of delay read from ADC
flashcounter	res 1		    ; counter
signal		res 1		    ; 1, 2, 4 or 8 depending on LED colour
red		res 1		    ; colour variables that make code easier
blue		res 1
violet		res 1
yellow		res 1
	
global	read, setflash, flashcounter, meddelay, lildelay, bigdelay, variabledelay
extern	sequence


flash   code
   
   
setflash 
	clrf	TRISD			 ;PORTD all outputs
	clrf	PORTD			    
	movlw	0x01			 ;sets colour variables
	movwf	red
	movlw	0x02
	movwf	blue
	movlw	0x04
	movwf	violet
	movlw	0x08
	movwf	yellow
	return
     
read					;reads sequence and flashes it
	call	compare			;translates numbers 0-3 into signal
	movff	signal, PORTD		;emits signal out of PORTD
	movf	POSTINC1,W		;increases FSR1 address
	call	flashdelay		;keeps light on for a bit
	incf	flashcounter, 1,0	;increases counter
	clrf	PORTD			;stops signal
	call	flashdelay		;delays for a bit
	movff	sequence, WREG		
	cpfseq	flashcounter		;checks if all sequence has been read
	bra	read			;keeps on reading if unfinished
	lfsr	FSR1, 0x140		;restores FSR1
	return

compare					;translates 0-3 into 1,2,4,8
	movff	red, signal
	movlw	0x00 
	cpfsgt  INDF1			;compares W to contents of FSR1
	return
	movff	blue, signal
	movlw	0x01
	cpfsgt	INDF1
	return
	movff	violet, signal
	movlw	0x02
	cpfsgt	INDF1
	return
	movff	yellow, signal
	return

	
meddelay				;medium delay
	movlw	0x20			;moves value to delay variables
	movwf	d0
	movwf	d1
	movwf	d2
	call	delay			;calls delay subroutine
	return
	
bigdelay
	movlw	0xF0			;moves bigger value to delay variables
	movwf	d0
	movwf	d1
	movwf	d2
	call	delay
	return
	
lildelay 
	movlw	0x10			;moves smaller value to delay variables
	movwf	d0
	movwf	d1
	movwf	d2
	call	delay
	return
	
flashdelay  
	movff	variabledelay, WREG	;moves one of 5 possible delay lengths
	movwf	d0
	movwf	d1
	movwf	d2
	call	delay
	return
	
delay					;main delay subroutine
	call	delay1
	decfsz	d0
	bra	delay
	return
	
delay1					;subsubroutine
	call	delay2
	decfsz	d1
	bra	delay1
	return
	
delay2					;subsubsubrountine
	decfsz	d2
	bra	delay2
	return
	 
	end


