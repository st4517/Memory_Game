#include p18f87k22.inc

acs0    udata_acs   ; named variables in access ram           

shiftregister	res 1				    ;simulates the LFSR
temp		res 1				    ;temporary variable
random		res 1				    ;random number produced
LFSRCounter	res 1				    ;sequence length
seed		res 1
      
global setlfsr, load, LFSRCounter, shiftregister
extern sequence

random	code

setlfsr clrf	LFSRCounter	    ;resets counter
        lfsr	FSR1, 0x140	    ;sets FSR1
	movlw	0x04
	movwf	sequence	    ;sets initial sequence length to 4
	movlw	0x0F
	cpfsgt	shiftregister	    ;ensures seed is not 0000
	setf	shiftregister	    ;replaces 0000 seeds for 1111
	return	
	
	
load    call	produce		    ;produces random number 0-3, stores in random
        movff	random, POSTINC1    ;stores in FSR1, increases FSR1
        incf	LFSRCounter,1,0	    ;increases counter
        movff	sequence, WREG	    
        cpfseq	LFSRCounter	    ;checks if sequence if finished    
        bra	load		    ;continues creating numbers if sequence unfinished
        lfsr	FSR1, 0x140	    ;resets values and exits if sequence finished
	clrf	LFSRCounter
        return
	
produce call	shift		    ;makes first random number
        movwf	random		    ;puts it in random
        call	shift		    ;makes second random number                        
        addwf	random,1,0	    ;adds twice to random
        addwf	random,1,0	    ;now random number can be 0-3
        return
	
shift	movlw	0x01		    ;moves bit 4 to temp
	movwf	temp
	btfss	shiftregister,4	    
	clrf	temp
	btfss	shiftregister,5	    ;moves bit 5 to W
	clrf	WREG
	xorwf	temp, WREG	    ;xors bit 4 and 5, moves result to W
	bcf	STATUS, C	    ;moves result to carry bit
	tstfsz	WREG
	bsf	STATUS, C
	rrcf	shiftregister	    ;rotates shift register and uses carry bit as new input
	return			    ;new bit is now in W and bit 7
	
	end