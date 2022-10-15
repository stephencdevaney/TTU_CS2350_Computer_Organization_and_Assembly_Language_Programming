TITLE Integer Summation Program (Sum2.asm)
; Modified By: Stephen Devaney
; Last Updated: 11/27/2019
; For Professor Victor Sheng's CS 2350-001 course at TTU

; This program inputs multiple integers from the user,
; stores them in an array, calculates the sum of the
; array, and displays the sum.

INCLUDE Irvine32.inc


;removed old array size that was here


.data
ARRAY_SIZE = 20	; modified to match standards outlined in assignments
array   DWORD  ARRAY_SIZE DUP(?) ; modified to new array size
prompt1 BYTE  "Enter a signed integer: ",0
prompt2 BYTE  "The sum of the integers is: ",0
prompt3 BYTE  "How many integers will be added? ", 0


.code
main PROC
	call Clrscr ; clear the screen
	CALL PromptForSize ; gets the number to be processed
	mov  esi,OFFSET array ; set address of the array to be inserted into
	mov  ecx,EAX ; changed from holding the array size to number to be processed
	call PromptForIntegers ; places user integers in the array
	call ArraySum ; adds the integers in the array
	call DisplaySum ; displays the sum
	exit
main ENDP


;-----------------------------------------------------
PromptForSize PROC USES EDX
;
; Prompts the user for an the size of the array to be
; filled with integers.
; Receives: nothing
; Returns:  EAX
;-----------------------------------------------------
MOV EDX, OFFSET prompt3 ; setup for prompt to be displayed
CALL WriteString ; display the prompt
CALL ReadInt ; get a integer from the user
RET ; return to calling function count is in eax
PromptForSize ENDP


;-----------------------------------------------------
PromptForIntegers PROC
;
; Prompts the user for an array of integers, and fills
; the array with the user's input.
; Receives: ESI points to the array, ECX = array size
; Returns:  nothing
;-----------------------------------------------------
	pushad		; save all registers
	mov  edx,OFFSET prompt1		; address of the prompt
L1:
	call WriteString		; display string
	call ReadInt		; read integer into EAX
	call Crlf		; go to next output line
	mov  [esi],eax		; store in array
	add  esi,4		; next integer
	loop L1
L2:
	popad		; restore all registers
	ret
PromptForIntegers ENDP


;-----------------------------------------------------
ArraySum PROC
;
; Calculates the sum of an array of 32-bit integers.
; Receives: ESI points to the array, ECX = array size
; Returns:  EAX = sum of the array elements
;-----------------------------------------------------
	push  esi		; save ESI, ECX
	push  ecx ; save information on ecx
	mov   eax,0		; set the sum to zero
L1:
	add   eax,[esi]		; add each integer to sum
	add   esi,4		; point to next integer
	loop  L1		; repeat for array size
L2:
	pop   ecx		; restore ECX, ESI
	pop   esi
	ret		; sum is in EAX
ArraySum ENDP


;-----------------------------------------------------
DisplaySum PROC
;
; Displays the sum on the screen
; Recevies: EAX = the sum
; Returns:  nothing
;-----------------------------------------------------
	push edx
	mov  edx,OFFSET prompt2		; set prompt to be displayed
	call WriteString ;dispays the prompt
	call WriteInt		; display EAX
	call Crlf ; carriage return line feed
	pop  edx ; restores edx
	ret
DisplaySum ENDP
END main