TITLE Reverse String, Version 1 (ReverseString.asm)
; Author: Stephen Devaney
; Last Updated: 10/29/2019
; For Professor Victor Sheng's CS 2350-001 course at TTU

; This program uses a loop with indirect addressing to 
; the reverse of a source string to a target string. At
; the end of the program both the source and the target
; are both display using WRITESTRING.

INCLUDE Irvine32.inc
.data
source BYTE  "Hello World!", 0
target BYTE SIZEOF source-1 DUP('#'),0
Onotification BYTE "Original String: ", 0dh, 0ah, 0
Rnotification BYTE "Reversed String: ", 0dh, 0ah, 0

.code
main PROC
	MOV ECX, SIZEOF source - 1 ;counter for the loop
	MOV ESI, OFFSET source ;address of the front of the source string
	MOV EDI, OFFSET target + SIZEOF TARGET - 2 ;address of the rear
	
ReverseLoop:
	MOV AL, [ESI] ;gets character from string
	MOV [EDI], AL ;stores character in target string
	INC ESI ;move to next charcter in source
	DEC EDI ;move to next character in target
LOOP ReverseLoop

	MOV EDX, OFFSET Onotification
	Call WRITESTRING
	MOV EDX,OFFSET source ;set source to be outputted
	CALL WRITESTRING ;output source
	CALL CRLF ;line feed and carriage return
	CALL CRLF ;line feed and carriage return

	MOV EDX, OFFSET Rnotification
	Call WRITESTRING
	MOV EDX,OFFSET target ;set target to be outputted
	CALL WRITESTRING ;output target
	CALL CRLF ;line feed and carriage return

exit
main ENDP
END main