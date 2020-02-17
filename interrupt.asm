;	#include p18f87k22.inc
;
;
;extern interrupt_setup	
;	
;interrupt   code
;   
;   
;hi_int	code 0x0008
;	btfss	INTCON,INTOIF
;	retfie	FAST
;	call	compare_red
;	btfss	INTCON3,INT1IF
;	retfie	FAST
;	call	compare_blue
;	btfss	INTCON3,INT2IF
;	retfie	FAST
;	call	compare_violet
;	btfss	INTCON3,INT3IF
;	retfie	FAST
;	call	compare_yellow
;	
;interrupt_setup	setf TRISB
;	clrf PORTB
;	bsf INTCON
;	
	
  end

	
   
   