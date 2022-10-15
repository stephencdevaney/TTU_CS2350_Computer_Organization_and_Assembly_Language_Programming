TITLE All_Possible_Colors, Version 1 (Colors.asm)
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
	MOV EDX, 0 ; intialize background
	MOV ECX, sixteen ; set outer loop count
OuterLoop:
	MOV EBX, 0 ; intialize foreground
	PUSH ECX ; save outer loop count
	MOV ECX, sixteen ; set inner loop count
	
InnerLoop:
	MOV EAX, EDX ; set background to be outputed
	CALL multiply16 ; multiply EAX by 16 for background
	ADD EAX, EBX ; set foreground
	CALL SetTextColor ; changes the colors
	MOV al, "4" ; character to be displayed
	CALL WriteChar ; output the character
	INC EBX ; change the number for the foreground
	LOOP InnerLoop

	INC EDX ; change the number for the background
	POP ECX ; restore outer loop count
	CALL CRLF ; carriage return line feed
	LOOP OuterLoop
	MOV EAX, white + (black*16) ; restore console default colors
	CALL SetTextColor
exit
main ENDP


;-----------------------------------------------------
multiply16 PROC USES EDX
;
; Multiplies the EAX register by 16
; Receives: EAX with an integer to be multiplied
; Returns:  EAX
;-----------------------------------------------------
MOV EDX, 16
MUL EDX
ret
multiply16 ENDP


END main