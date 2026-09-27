	.include "macro.inc"

	.syntax unified

	thumb_func_start LockGame
LockGame: @ 0x08015308
	ldr r1, _08015314 @ =0x0202BBB8
	ldrb r0, [r1, #1]
	adds r0, #1
	strb r0, [r1, #1]
	bx lr
	.align 2, 0
_08015314: .4byte 0x0202BBB8
