TITLE All_Possible_Colors, Version 2 (Colors.asm)
; Author: Stephen Devaney
; Last Updated: 11/27/2019
; For Professor Victor Sheng's CS 2350-001 course at TTU

; This program uses a nested loop to display
; all the possible foreground colors and 
; background colors in the Irvine32 library.

INCLUDE Irvine32.inc
.data
sixteen DWord 16

.code
main PROC
	MOV AH, 1 ; intialize background
	MOV ECX, sixteen ; set outer loop count
OuterLoop:
	MOV AL, 0 ; intialize foreground
	PUSH ECX ; save outer loop count
	MOV ECX, sixteen ; set inner loop count
	
InnerLoop:
	CALL SetTextColor ; changes the colors
	PUSH EAX
	MOV al, "4" ; character to be displayed
	CALL WriteChar ; output the character
	POP EAX
	INC AL ; change the number for the foreground
	LOOP InnerLoop

	INC AH ; change the number for the background
	POP ECX ; restore outer loop count
	CALL CRLF ; carriage return line feed
	LOOP OuterLoop
	
	MOV EAX, white + (black*16) ; restore console default colors
	CALL SetTextColor ;restore default text color
	CALL ReadChar
exit
main ENDP


END main