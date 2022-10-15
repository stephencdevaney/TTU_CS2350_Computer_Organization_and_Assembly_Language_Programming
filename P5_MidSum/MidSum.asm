TITLE Middle Screen Summation Program (MidSum.asm)
; Modified By: Stephen Devaney
; Last Updated: 11/29/2019
; For Professor Victor Sheng's CS 2350-001 course at TTU

; This program clears the screen moves to the 
; center of the console, asks the user for two 
; integers, and find the sum of the two integers
; this process is repeated 3 times in a loop.

INCLUDE Irvine32.inc


;removed old array size that was here


.data
prompt1 BYTE  "Enter the first signed integer: ",0
prompt2 BYTE  "Enter the second signed integer: ",0
output BYTE  "The sum of the integers is: ", 0
final BYTE   "Press any key to continue... ", 0


.code
main PROC
	MOV ECX, 3
SumLoop:
	CALL Clrscr ; clear the screen
	MOV DH, 10 ; set y direction
	MOV DL, 20 ; set x direction
	CALL Gotoxy ; change the postion
	MOV  EDX,OFFSET prompt1	; address of the prompt
	CALL WriteString ; display string
	CALL ReadInt ; read integer into EAX
	MOV EBX, EAX ; save first integer into EBX
	MOV DH, 11 ; set y direction
	MOV DL, 19 ; set x direction
	CALL Gotoxy ; change the postion
	MOV  EDX,OFFSET prompt2	; address of the prompt
	CALL WriteString; display  string
	CALL ReadInt ; read integer into EAX
	MOV DH, 12 ; set y direction
	MOV DL, 23 ; set x direction
	CALL Gotoxy ; change the postion
	MOV  EDX,OFFSET output ; address of the output
	CALL WriteString ; display string
	ADD EAX, EBX ; add to integers together
	CALL WriteInt ; display the sum
	CALL Crlf
	CALL Crlf
	MOV  EDX,OFFSET final ; address of the output
	CALL WriteString ; display string
	CALL ReadChar ; a pause to be able to see each sum
	LOOP SumLoop
	exit
main ENDP
END main