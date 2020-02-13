#include p18f87k22.inc

acs0    udata_acs   ; named variables in access ram           

s0            res 1   ; reserve 1 byte for variable delay
s1            res 1
s2            res 1
s3            res 1

random res 1
counter res 1
level      res 1

code
org 0x0
goto start
org 0x100                                 ; Main code starts here at address 0x100
shift	movff s3, WREG                
	xorwf s2,0, ACCESS          ;XOR gate, stores result in WREG
	movff s2,s3                         ; shifts values to right
	movff s1,s2
	movff s0,s1
	movwf s0, ACCESS           ;moves XORed result to s0
	return

setFSR lfsr FSR0, 0x140
	return
start   movlw 0x01
	movwf s0
	movwf s1
        movwf s2
        movwf s3
        clrf counter
        call setFSR

load    call produce                       ;produces random number 0-3, stores in random
        movff random, POSTINC0 ;stored in FSR
        incf counter,1,0
        movlw 0x04
        cpfseq counter                  stops looping when sequence is length 4
        bra load
        call setFSR
        goto theend

produce call shift                              ;makes first random number
        movff s0, random            ;puts it in random
        call shift                               ;makes second random number
        movff s0,W                        
        addwf random,1,0           ;adds twice to random
        addwf random,1,0           ;now random number can be 0-3
        return
	
theend goto $
	
	end