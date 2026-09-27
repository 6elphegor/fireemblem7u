	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806BBAC
sub_0806BBAC: @ 0x0806BBAC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	bl sub_0806CC0C
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
