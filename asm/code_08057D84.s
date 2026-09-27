	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08057D84
sub_08057D84: @ 0x08057D84
	push {lr}
	ldr r2, _08057D98 @ =0x0201774C
	ldr r1, [r2]
	subs r1, #1
	str r1, [r2]
	ldr r0, [r0, #0x60]
	bl AnimDelete
	pop {r0}
	bx r0
	.align 2, 0
_08057D98: .4byte 0x0201774C
