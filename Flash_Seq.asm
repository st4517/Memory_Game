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
	
global	read, setflash, flashcounter, delay, delayreset, shortdelay, bigdelay
extern	sequence


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
     
read	call	compare
	movff	signal, PORTD
	movf	POSTINC1,W
	call	delayreset
	call	delay
	incf	flashcounter, 1,0
	movff	sequence, WREG
	cpfseq	flashcounter
	bra	read
	clrf	PORTD
	lfsr	FSR1, 0x140		;restores FSR1
	return

compare	movff	red, signal
	movlw	0x00 
	cpfsgt  INDF1
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
				
allLEDS movlw	0x00
	movwf	TRISD,ACCESS
	movlw	0x0F
	movwf	PORTD, ACCESS	
	movff	POSTINC1,W
	;goto	interpret	
	
delayreset movlw 0x40	;sets delay time
	movwf	d0
	movwf	d1
	movwf	d2
	return
	
bigdelay movlw 0xF0	;sets delay time
	movwf	d0
	movwf	d1
	movwf	d2
	return
	
shortdelay movlw 0x15	;sets delay time
	movwf	d0
	movwf	d1
	movwf	d2
	return
	
delay	call	delay1
	decfsz	d0
	bra	delay
	return
	
delay1	call	delay2
	decfsz	d1
	bra	delay1
	return
	
delay2	decfsz	d2
	bra	delay2
	return
	 
	end


