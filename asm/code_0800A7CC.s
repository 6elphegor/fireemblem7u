	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800A7CC
sub_0800A7CC: @ 0x0800A7CC
	ldr r0, _0800A7DC @ =0x08B90C9C
	ldr r2, _0800A7E0 @ =0x03000100
	ldr r1, [r2]
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r1, #1
	str r1, [r2]
	bx lr
	.align 2, 0
_0800A7DC: .4byte 0x08B90C9C
_0800A7E0: .4byte 0x03000100
