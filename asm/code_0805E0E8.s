	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805E0E8
sub_0805E0E8: @ 0x0805E0E8
	push {lr}
	ldr r0, [r0, #0x60]
	bl AnimDelete
	ldr r1, _0805E0FC @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0805E0FC: .4byte 0x0201774C
