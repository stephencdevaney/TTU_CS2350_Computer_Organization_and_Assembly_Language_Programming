TITLE Different Random Locations, Version 1 (RandLoc.asm)
; Author: Stephen Devaney
; Last Updated: 11/29/2019
; For Professor Victor Sheng's CS 2350-001 course at TTU

; This program uses a loop to display a
; character in 100 different random location
; on the console.

INCLUDE Irvine32.inc
.code
main PROC
	MOV ECX, 100 ;setup for loop counter
	CALL Clrscr ; clear the screen
RandomLocationLoop:
	MOV EAX, 200 ; set max y direction
	CALL RandomRange ; get random number
	MOV DH, AL ; move random number into columns
	MOV EAX, 100 ; set max x direction
	CALL RandomRange ; get random number
	MOV DL, AL ; move random number into rows
	CALL Gotoxy ; change position
	MOV AL, "4" ; set character to be displayed
	CALL WriteChar ; display character
	MOV EAX, 100 ; set time to be delayed
	CALL Delay ; delay in milliseconds
LOOP RandomLocationLoop
exit
main ENDP
END main