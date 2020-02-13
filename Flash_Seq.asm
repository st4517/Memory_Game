	#include p18f87k22.inc

acs0    udata_acs   ; named variables in access ram	
d0   res 1   ; reserve 1 byte for variable delay
d1	res 1
d2	res 1
counter	res 1
	
	

;rst	code	0    ; reset vector
FLASH_SEQ   code
   
	goto	resetcounter

delay	call delay1
	decfsz	d0
	bra delay
	return
	
delay1	call delay2
	decfsz	d1
	bra delay1
	return
	
delay2	decfsz	d2
	bra delay2
	return
	
resetcounter movlw 0x00
	movwf counter
	clrf TRISC ;PORTC all outputs
	goto load

	
delayreset movlw 0x20	;sets delay time
	movwf d0
	movwf d1
	movwf d2
	return
	
redLED	movlw 0x00
	movwf TRISD,ACCESS
	movlw 0x01
	movwf PORTD, ACCESS
	movf  POSTINC0,W
	call delay
	
	incf counter, 1,0
	movff counter, PORTC
	;incf 0x9F0, W, ACCESS
	;movwf 0x9F0
	movlw 0x04
	cpfseq counter
	goto interpret
	goto endy
		

	
blueLED	movlw 0x00
	movwf TRISD,ACCESS
	movlw 0x02
	movwf PORTD, ACCESS
	movf  POSTINC0,W
	call delay
	incf counter, 1,0
	movff counter, PORTC
	movlw 0x04
	cpfseq counter
	goto interpret
	goto endy
		

	
violetLED movlw 0x00
	movwf TRISD,ACCESS
	movlw 0x04
	movwf PORTD, ACCESS
	movf  POSTINC0,W
	call delay
	incf counter, 1,0
	movff counter, PORTC
	movlw 0x04
	cpfseq counter
	goto interpret
	goto endy
	
	
yellowLED movlw 0x00
	movwf TRISD,ACCESS
	movlw 0x08
	movwf PORTD, ACCESS	
	movf  POSTINC0,W
	call delay
	incf counter, 1,0
	movff counter, PORTC
	movlw 0x04
	cpfseq counter
	goto interpret
	goto endy
		
	
allLEDS movlw 0x00
	movwf TRISD,ACCESS
	movlw 0x0F
	movwf PORTD, ACCESS	
	movf  POSTINC0,W
	
	goto interpret	
	
setFSR	lfsr FSR0, 0xA00
	return
load	call setFSR
	movlw 	0x00		    ;change these to change sequence
	movwf	POSTINC0
	movlw	0x01
	movwf	POSTINC0
	movlw	0x02
	movwf	POSTINC0
	movlw	0x03
	movwf	POSTINC0
	call	setFSR
	
interpret   
	call delayreset
	movlw 0x00 
	cpfsgt  INDF0
	call	redLED
	movlw	0x01
	cpfsgt	INDF0
	call	blueLED
	movlw	0x02
	cpfsgt	INDF0
	call	violetLED
	movlw	0x03
	cpfsgt	INDF0
	
	call	yellowLED
	 
endy	movlw 0x00
	goto $
	;goto resetcounter
	end


