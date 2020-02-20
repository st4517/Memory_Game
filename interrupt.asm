	#include p18f87k22.inc


global	int_on	
	
interrupt   code
   
  
int_on	banksel PADCFG1		    ; PADCFG1 is not in Access Bank!!
	bsf PADCFG1,REPU,BANKED	    ;enable pullup resistors
	movlw	0x0F
	movwf	TRISB		    ;lower nibble input, upper nibble output
	;call delay
	clrf	PORTB		    ;drives outputs low	
	bsf	INTCON, INT0IE	    ;enable INT0
	bsf	INTCON3, INT1IE	    ;enable INT1
	bsf	INTCON3, INT2IE	    ;enable INT2
	bsf	INTCON3, INT3IE	    ;enable INT3
	bsf	INTCON, GIE	    ;enable all interrupts
	return
   
hi_int	code 0x0008
	btfsc	INTCON,INT0IF
	call	red
	btfsc	INTCON3,INT1IF
	call	blue
	btfsc	INTCON3,INT2IF
	call	violet
	btfsc	INTCON3,INT3IF
	call	yellow
	call	compare
	retfie	FAST
	
red	movlw	0x01
	movwf	PORTD
	bcf	INTCON,INT0IF
	movlw	0x00
	return
	
blue	movlw	0x02
	movwf	PORTD
	bcf	INTCON3,INT1IF
	movlw	0x01
	return
	
violet	movlw	0x04
	movwf	PORTD
	bcf	INTCON3,INT2IF
	movlw	0x02
	return
	
yellow	movlw	0x08
	movwf	PORTD
	bcf	INTCON3,INT3IF
	movlw	0x03
	return	
	
compare cpfseq	POSTINC1
	goto	errormess
	call	success
	return
	
errormess   goto $
	
success	    goto $
	
	
  end

	
   
   