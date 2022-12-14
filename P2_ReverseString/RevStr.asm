TITLE Program Template          (RevStr.asm)

; This program reverses a string.
; Last update: 1/28/02

INCLUDE Irvine32.inc

.data
aName BYTE "Abraham Lincon",0
nameSize = ($ - aName) - 1 ;$ the current value of location counter, i.e., the current address

.code
main PROC
	;mov ecx, sizeof aName
	;call dumpRegs
; Push the name on the stack.
	mov ecx,nameSize
	mov esi,0

L1:	movzx eax,aName[esi]	; get character
	push eax	; push on stack
	inc esi
	Loop L1

; Pop the name from the stack, in reverse,
; and store in the aName array.
	mov ecx,nameSize
	mov esi,0

L2:	pop eax	; get character
	mov aName[esi],al	; store in string
	inc esi
	Loop L2

; Display the name.
	mov edx,OFFSET aName
	call Writestring
	call Crlf

	exit
main ENDP
END main