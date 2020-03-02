#include p18f87k22.inc
    
   global ADCsetup, ADC_Read
    
adc	    code    
    
ADCsetup
    bsf	    TRISA,RA0		; use pin A0(==AN0) for input
    bsf	    ANCON0,ANSEL0	; set A0 to analog
    movlw   0x01		; select AN0 for measurement
    movwf   ADCON0		; and turn ADC on
    movlw   0x30		; Select 4.096V positive reference
    movwf   ADCON1		; 0V for -ve reference and -ve input
    movlw   0x76		; Left justified output
    movwf   ADCON2		; Fosc/64 A/D clock and 20x acquisition time
    return
    
ADC_Read
    bsf	    ADCON0,GO		 ; Start conversion 
adc_loop
    btfsc   ADCON0,GO		 ; check to see if finished
    bra	    adc_loop
    movlw   0x33
    cpfsgt  ADRESH		 ; compares contents of ADRESH to decide length of variabledelay
    retlw   0x10   
    movlw   0x66
    cpfsgt  ADRESH
    retlw   0x25
    movlw   0x99
    cpfsgt  ADRESH
    retlw   0x3A
    movlw   0xCC
    cpfsgt  ADRESL
    retlw   0x4F
    retlw   0x64
    
    
 end
    

