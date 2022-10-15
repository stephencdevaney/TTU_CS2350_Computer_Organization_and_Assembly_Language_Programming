;D:steph\Documents\Assembly\Hello
include irvine32.inc    ; from Irvine CDROM

.stack 4096

.data
greeting byte "Hello World!!", 13, 10, 0   ; message to write

.code
main proc
  mov edx, offset greeting
  invoke WriteString   ; irvine.inc: write NUL terminated string pointed to by edx
  exit                 ; irvine.inc: a macro that calls ExitProcess
main endp
end main