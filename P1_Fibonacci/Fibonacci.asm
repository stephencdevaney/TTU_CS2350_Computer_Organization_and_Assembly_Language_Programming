TITLE Fibonacci, Version 1 (Fibonacci.asm)
; Author: Stephen Devaney
; Last Updated: 10/24/2019
; For Professor Victor Sheng's CS 2350-001 course at TTU

; This program uses a loop to calculate the 
; first seven values in the Fibonacci number
; sequence. This program will use DumpRegs
; to display each value in the EAX register.

INCLUDE Irvine32.inc
.code
main PROC
	MOV ECX, 7 ;setup for loop counter
	MOV EBX, 0 ;previous intialized to 0
	MOV EAX, 1 ;current intialized to 1 (first output)
FibonacciLoop:
	CALL DumpRegs ;output current which is register EAX
	MOV EDX, EAX ;next = current + previous
	ADD EDX, EBX
	MOV EBX, EAX ;previous = current
	MOV EAX, EDX ;current = next
LOOP FibonacciLoop

exit
main ENDP
END main