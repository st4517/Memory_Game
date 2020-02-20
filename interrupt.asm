	#include p18f87k22.inc


global	int_on
extern	countdown
extern failure
extern no_buttons
interrupt   code
   
  
int_on	
	banksel PADCFG1		    ; PADCFG1 is not in Access Bank!!
	bsf PADCFG1,REPU,BANKED	    ;enable pullup resistors
	movlw	0x0F
	movwf	TRISE		    ;lower nibble input, upper nibble output
	movwf	TRISB
	;call delay
	clrf	PORTE		    ;drives outputs low	
	clrf	PORTB
	bsf	INTCON, INT0IE	    ;enable INT0
	bsf	INTCON3, INT1IE	    ;enable INT1
	bsf	INTCON3, INT2IE	    ;enable INT2
	bsf	INTCON3, INT3IE	    ;enable INT3
	movlw	b'10000111'	    ; Set timer0 to 16-bit, Fosc/4/256
	movwf	T0CON		    ; = 62.5KHz clock rate, approx 1sec rollover
	bsf	INTCON,TMR0IE	    ; Enable timer0 interrupt
	bsf	INTCON,GIE	    ; Enable all interrupts
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
	btfss	INTCON,TMR0IF	    ; check that this is timer0 interrupt
	call	compare
	btfsc	INTCON,TMR0IF
	call	clock	
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
	incf	no_buttons	    ;posssibly include success message here
	return
	
clock	incf	countdown,1
	bcf	INTCON,TMR0IF	    ; clear interrupt flag
	return
	
errormess call failure
	    goto $
	
	   
	   
	
	
  end

	
   
   