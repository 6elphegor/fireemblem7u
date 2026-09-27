	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08076844
sub_08076844: @ 0x08076844
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	bl sub_08075168
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
