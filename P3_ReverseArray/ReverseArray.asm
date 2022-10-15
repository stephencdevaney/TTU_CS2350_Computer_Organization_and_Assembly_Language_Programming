TITLE Reverse Array, Version 1 (ReverseArray.asm)
; Author: Stephen Devaney
; Last Updated: 10/29/2019
; For Professor Victor Sheng's CS 2350-001 course at TTU

; This program uses a loop with indirect addressing to 
; reverse the elements of an integer array in place. The
; program uses SIZEOF, TYPE, and LENGTHOF to try to remain
; flexible for future changes. The program uses DUMPMEM
; to display both the orginal array and the reversed array

INCLUDE Irvine32.inc
.data
array BYTE 1,2,3,4,5,6,7,8,9
Onotification BYTE 0dh, 0ah,"Array before changes: ", 0
Rnotification BYTE 0dh, 0ah,"Array after changes: ", 0

.code
main PROC
;display orginal array prior to changing array
	MOV EDX, offset Onotification
	CALL WRITESTRING
	MOV ESI, OFFSET array
	MOV ECX, LENGTHOF array
	MOV EBX, TYPE array
	CALL DUMPMEM
	
	MOV ECX, LENGTHOF array/2 ;loop counter is half of the elements
	MOV ESI, OFFSET array ;address of the front array
	MOV EDI, OFFSET array + SIZEOF array - TYPE array ;address of the rear
	
ReverseLoop:
	MOV BL, [ESI] ;Temp = source
	MOV AL, [EDI] ;Source = Destination
	MOV [ESI], AL
	MOV [EDI], BL ;Destination = Temp 
	ADD ESI, TYPE array ;move to next element at front of array
	SUB EDI, TYPE array ;move to next element at end of array
LOOP ReverseLoop
	
;display reversed array after changeing array
	MOV EDX, offset Rnotification
	CALL WRITESTRING
	MOV ESI, OFFSET array
	MOV ECX, LENGTHOF array
	MOV EBX, TYPE array
	CALL DUMPMEM

exit
main ENDP
END main