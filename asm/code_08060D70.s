	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08060D70
sub_08060D70: @ 0x08060D70
	push {lr}
	ldr r2, _08060D84 @ =0x0201774C
	ldr r1, [r2]
	subs r1, #1
	str r1, [r2]
	ldr r0, [r0, #0x60]
	bl AnimDelete
	pop {r0}
	bx r0
	.align 2, 0
_08060D84: .4byte 0x0201774C
