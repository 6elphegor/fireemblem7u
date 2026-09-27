	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08072D7C
sub_08072D7C: @ 0x08072D7C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	movs r0, #0x86
	bl PlaySeSpacial
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
