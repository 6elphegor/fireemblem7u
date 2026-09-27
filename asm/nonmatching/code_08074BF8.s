	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08074BF8
sub_08074BF8: @ 0x08074BF8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	movs r1, #0
	str r1, [r0, #0x54]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
