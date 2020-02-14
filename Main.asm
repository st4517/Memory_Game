	#include p18f87k22.inc

acs0    udata_acs   ; named variables in access ram	
d0   res 1   ; reserve 1 byte for variable delay
d1	res 1
d2	res 1
counter	res 1
	
tables	udata	0x400    ; reserve data anywhere in RAM (here at 0x400)
myArray res 0x80    ; reserve 128 bytes for message data

	
	extern  LCD_Setup, LCD_Write_Message	    ; external LCD subroutines
	extern writemessage
	extern setup
	global myArray
	global myTable

rst	code	0    ; reset vector
	goto	$
	
	
main	code
;
;	; ******* myTable, data in programme memory, and its length *****
myTable data	    "Press key to continue\n"	; message, plus carriage return
;	constant    myTable_l=.13	; length of data
;	
;	global myTable_1
;	
;setup_main	;clearing and resetting here
;	lfsr	FSR0, myArray	; Load FSR0 with address in RAM	
;	movlw	upper(myTable)	; address of data in PM
;	movwf	TBLPTRU		; load upper bits to TBLPTRU
;	movlw	high(myTable)	; address of data in PM
;	movwf	TBLPTRH		; load high byte to TBLPTRH
;	movlw	low(myTable)	; address of data in PM
;	movwf	TBLPTRL		; load low byte to TBLPTRL
;	movlw	myTable_l	; bytes to read
;	movwf 	counter		; our counter register
;loop 	tblrd*+			; one byte from PM to TABLAT, increment TBLPRT
;	movff	TABLAT, POSTINC0; move data from TABLAT to (FSR0), inc FSR0	
;	decfsz	counter		; count down to zero
;	bra	loop		; keep going until finished

;setupMessageRAM


	end


