	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08061ED4
sub_08061ED4: @ 0x08061ED4
	push {lr}
	ldr r0, [r0, #0x60]
	bl AnimDelete
	ldr r1, _08061EE8 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08061EE8: .4byte 0x0201774C
