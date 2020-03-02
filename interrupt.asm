	#include p18f87k22.inc


global	    int_on
extern	    countdown		    
extern	    failure
extern	    no_buttons
	
	
interrupt   code
   
  
int_on				    ; enables interrupts	
	movlw	b'10000111'	    ; set timer0 to 16-bit, Fosc/4/256
	movwf	T0CON		    ; = 62.5KHz clock rate, approx 1sec rollover
	bsf	INTCON,TMR0IE	    ; enable timer0 interrupt
	bsf	INTCON,GIE	    ; enable all interrupts
	return
   
hi_int	code 0x0008		    ; code when interrup is flagged
	btfss	INTCON,TMR0IF	    ; checks if timer is flagged
	retfie	FAST		    ; exits if unflagged
	incf	countdown,1	    ; increases countdown variable
	bcf	INTCON,TMR0IF	    ; clear interrupt flag	
	retfie	FAST		    ; returns from interrupt
	

  end

	
   
   