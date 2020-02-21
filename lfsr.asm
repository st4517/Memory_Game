#include p18f87k22.inc

acs0    udata_acs   ; named variables in access ram           

s0  res 1   ; bits for LFSR
s1  res 1
s2  res 1
s3  res 1
random	res 1	;random number produced
LFSRCounter res 1   ;sequence length
      
global setlfsr, load, produce, shift , LFSRCounter
extern	sequence

random	code

setlfsr movlw	0x01		    ;inputs seed
	movwf	s0
	movwf	s1
        movwf	s2
        movwf	s3
        clrf	LFSRCounter
        lfsr	FSR1, 0x140	    ;sets FSR1
	return	
	
	
load    call	produce		    ;produces random number 0-3, stores in random
        movff	random, POSTINC1    ;stores in FSR1, increases FSR1
        incf	LFSRCounter,1,0
        movff	sequence, WREG
        cpfseq	LFSRCounter	    ;stops looping when sequence is length 4
        bra	load
        lfsr	FSR1, 0x140
	clrf	LFSRCounter
        return
	
produce call	shift		    ;makes first random number
        movff	s0, random	    ;puts it in random
        call	shift		    ;makes second random number
        movff	s0,W                        
        addwf	random,1,0	    ;adds twice to random
        addwf	random,1,0	    ;now random number can be 0-3
        return
	
shift	movff	s3, WREG                
	xorwf	s2,0, ACCESS	    ;XOR gate, stores result in WREG
	movff	s2,s3		    ;shifts values to right
	movff	s1,s2
	movff	s0,s1
	movwf	s0, ACCESS	    ;moves XORed result to s0
	return

	end