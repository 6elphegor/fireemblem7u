	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805EA34
sub_0805EA34: @ 0x0805EA34
	push {lr}
	ldr r2, _0805EA48 @ =0x0201774C
	ldr r1, [r2]
	subs r1, #1
	str r1, [r2]
	ldr r0, [r0, #0x60]
	bl AnimDelete
	pop {r0}
	bx r0
	.align 2, 0
_0805EA48: .4byte 0x0201774C
