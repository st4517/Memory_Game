	#include p18f87k22.inc


extern int_on	
	
interrupt   code
   
   
hi_int	code 0x0008
	btfsc	INTCON,INTOIF
	movlw	0x00
	btfsc	INTCON3,INT1IF
	movlw	0x01
	btfsc	INTCON3,INT2IF
	movlw	0x02
	btfsc	INTCON3,INT3IF
	movlw	0x03
	call	compare
	retfie	FAST
	
int_on	setf	TRISB
	clrf	PORTB
	bsf	INTCON, INT0IE
	bsf	INTCON3, INT1IE
	bsf	INTCON3, INT2IE
	bsf	INTCON3, INT3IE
	bsf	INTCON, GIE
	
compare cpfseq	POSTINC0
	goto	errormess
	call	success
	return
	
	
  end

	
   
   