	#include p18f87k22.inc

acs0    udata_acs   ; named variables in access ram	
d0   res 1   ; reserve 1 byte for variable delay
d1	res 1
d2	res 1
counter	res 1
	
tables	udata	0x400    ; reserve data anywhere in RAM (here at 0x400)
myArray res 0x80    ; reserve 128 bytes for message data
	
	

rst	code	0    ; reset vector
	
	goto	setup
	extern  LCD_Setup, LCD_Write_Message	    ; external LCD subroutines
	extern writemessage
	extern setup
	global myTable
	
setup	;clearing and resetting here
	call setup
	
	; ******* myTable, data in programme memory, and its length *****
myTable data	    "Press key to continue\n"	; message, plus carriage return
	constant    myTable_l=.13	; length of data
	call writemessage



	end


