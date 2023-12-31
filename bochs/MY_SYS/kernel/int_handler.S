;This file contains 2 part
;1.中断服务程序入口地址数组 (会调用中断服务程序具体内容入口地址数组)
;2.syscall_handler (会调用syscall_table[])

;int_entry_table
[bits 32]
extern int_content_entry_array

%define NO_ERROR_CODE push 0
%define ERROR_CODE nop

section .data
int_msg db "interrupt handling...",0xa,0
global int_entry_table
int_entry_table:

%macro VECTOR 2
section .text
int%1entry:
	%2
	push ds
	push es
	push fs
	push gs
	pushad

	;send EOI to slave and master
	mov al,0x20
	out 0xa0,al
	out 0x20,al

	;handle the interrupt
	push %1
	call [int_content_entry_array+%1*4]

	jmp exit_intr

section .data
	dd int%1entry	

%endmacro

section .text
global exit_intr
exit_intr:
	add esp,4

	popad
	pop gs
	pop fs
	pop es
	pop ds
	add esp,4
	iret

VECTOR 0,NO_ERROR_CODE
VECTOR 1,NO_ERROR_CODE
VECTOR 2,NO_ERROR_CODE
VECTOR 3,NO_ERROR_CODE
VECTOR 4,NO_ERROR_CODE
VECTOR 5,NO_ERROR_CODE
VECTOR 6,NO_ERROR_CODE
VECTOR 7,NO_ERROR_CODE
VECTOR 8,ERROR_CODE
VECTOR 9,NO_ERROR_CODE
VECTOR 10,ERROR_CODE
VECTOR 11,ERROR_CODE
VECTOR 12,ERROR_CODE
VECTOR 13,ERROR_CODE
VECTOR 14,ERROR_CODE
VECTOR 15,NO_ERROR_CODE
VECTOR 16,NO_ERROR_CODE
VECTOR 17,ERROR_CODE
VECTOR 18,NO_ERROR_CODE
VECTOR 19,NO_ERROR_CODE
VECTOR 20,NO_ERROR_CODE
VECTOR 21,NO_ERROR_CODE
VECTOR 22,NO_ERROR_CODE
VECTOR 23,NO_ERROR_CODE
VECTOR 24,NO_ERROR_CODE
VECTOR 25,NO_ERROR_CODE
VECTOR 26,NO_ERROR_CODE
VECTOR 27,NO_ERROR_CODE
VECTOR 28,NO_ERROR_CODE
VECTOR 29,NO_ERROR_CODE
VECTOR 30,NO_ERROR_CODE
VECTOR 31,NO_ERROR_CODE
VECTOR 32,NO_ERROR_CODE;IRQ0
VECTOR 33,NO_ERROR_CODE;IRQ1 kbd
VECTOR 34,NO_ERROR_CODE
VECTOR 35,NO_ERROR_CODE
VECTOR 36,NO_ERROR_CODE
VECTOR 37,NO_ERROR_CODE
VECTOR 38,NO_ERROR_CODE
VECTOR 39,NO_ERROR_CODE
VECTOR 40,NO_ERROR_CODE
VECTOR 41,NO_ERROR_CODE
VECTOR 42,NO_ERROR_CODE
VECTOR 43,NO_ERROR_CODE
VECTOR 44,NO_ERROR_CODE
VECTOR 45,NO_ERROR_CODE
VECTOR 46,NO_ERROR_CODE
VECTOR 47,NO_ERROR_CODE;IRQ15


;syscall_handler
extern syscall_table
section .text
global syscall_handler
syscall_handler:
	push 0
	push ds
	push es
	push fs
	push gs
	pushad

	push 0x80;让栈格式和int%1entry的类似从而可以使用exit_intr

	push edx
	push ecx
	push ebx
	call [syscall_table+eax*4]
	add esp,4*3
	mov [esp+8*4],eax;;;
	jmp exit_intr
