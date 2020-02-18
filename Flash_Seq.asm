	#include p18f87k22.inc

acs0    udata_acs   ; named variables in access ram	
d0	res 1   ; delay lengths
d1	res 1
d2	res 1
flashcounter res 1
signal	res 1
red   res 1
blue  res 1
violet	res 1
yellow	res 1
	
global	read, setflash, flashcounter

	
	
flash   code
   
   
setflash clrf	TRISD	;PORTD all outputs
	movlw	0x01
	movwf	red
	movlw	0x02
	movwf	blue
	movlw	0x04
	movwf	violet
	movlw	0x08
	movwf	yellow
	return
     
read	clrf	counter1
	call	compare
	movff	signal, PORTD
	movf	POSTINC0,W
	call	delay
	clrf	PORTD
	incf	flashcounter, 1,0
	movlw	0x04
	cpfseq	flashcounter
	bra	read
	return

compare	movff	red, signal
	movlw	0x00 
	cpfsgt  INDF0
	return
	movff	blue, signal
	movlw	0x01
	cpfsgt	INDF0
	return
	movff	violet, signal
	movlw	0x02
	cpfsgt	INDF0
	return
	movff	yellow, signal
	return
				
allLEDS movlw 0x00
	movwf TRISD,ACCESS
	movlw 0x0F
	movwf PORTD, ACCESS	
	movf  POSTINC0,W
	goto interpret	
	
delayreset movlw 0x20	;sets delay time
	movwf d0
	movwf d1
	movwf d2
	return
	
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
	 
	end


