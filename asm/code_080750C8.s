	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080750C8
sub_080750C8: @ 0x080750C8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl ClearTalk
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
