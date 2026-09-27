	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806C880
sub_0806C880: @ 0x0806C880
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
