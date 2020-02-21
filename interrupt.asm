	#include p18f87k22.inc


global	int_on
extern	countdown
extern failure
extern no_buttons
interrupt   code
   
  
int_on	
;	banksel PADCFG1		    ; PADCFG1 is not in Access Bank!!
;	bsf PADCFG1,REPU,BANKED	    ;enable pullup resistors
;	movlw	0x0F
;	movwf	TRISE		    ;lower nibble input, upper nibble output
;	movwf	TRISB
;	;call delay
;	clrf	PORTE		    ;drives outputs low	
;	clrf	LATB
;	bsf	INTCON, INT0IE	    ;enable INT0
;	bsf	INTCON3, INT1IE	    ;enable INT1
;	bsf	INTCON3, INT2IE	    ;enable INT2
;	bsf	INTCON3, INT3IE	    ;enable INT3
	movlw	b'10000111'	    ; Set timer0 to 16-bit, Fosc/4/256
	movwf	T0CON		    ; = 62.5KHz clock rate, approx 1sec rollover
	bsf	INTCON,TMR0IE	    ; Enable timer0 interrupt
	bsf	INTCON,GIE	    ; Enable all interrupts
	return
   
hi_int	code 0x0008
;	btfsc	INTCON,INT0IF
;	call	red
;	btfsc	INTCON3,INT1IF
;	call	blue
;	btfsc	INTCON3,INT2IF
;	call	violet
;	btfsc	INTCON3,INT3IF
;	call	yellow
;	btfss	INTCON,TMR0IF	    ; check that this is timer0 interrupt
;	call	check
	btfss	INTCON,TMR0IF
	retfie	FAST
	incf	countdown,1
	bcf	INTCON,TMR0IF	    ; clear interrupt flag	
	retfie	FAST
	

  end

	
   
   