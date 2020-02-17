	#include p18f87k22.inc

acs0    udata_acs				; named variables in access ram	
d0	res 1				    ; reserve 1 byte for variable delay
d1	res 1
d2	res 1
counter	res 1
myTable_var res 1
	
tables	udata	0x400		  ; reserve data anywhere in RAM (here at 0x400)
myArray res 0x80			    ; reserve 128 bytes for message data

	
	extern  LCD_Setup, LCD_Write_Message	      ; external LCD subroutines
	extern writemessage
	extern setup
	global myArray
	global myTable
	global myTable_var
	;global myTable_1

rst	code	0						 ;reset vector
	goto	setup
	
	
main	code
;
;	; ******* myTable, data in programme memory, and its length *****
myTable data	    "Press key to continue\n"	; message, plus carriage return
	constant myTable_1 = .13
	
	
	movlw myTable_1
	movwf myTable_var ; length of data
	
	
initialmessage call writemessage

;setupMessageRAM


	end


