	.include "macro.inc"

	.syntax unified

	thumb_func_start UnlockGame
UnlockGame: @ 0x08015318
	ldr r1, _08015324 @ =0x0202BBB8
	ldrb r0, [r1, #1]
	subs r0, #1
	strb r0, [r1, #1]
	bx lr
	.align 2, 0
_08015324: .4byte 0x0202BBB8
