	.include "macro.inc"

	.syntax unified

	thumb_func_start GetGameLock
GetGameLock: @ 0x08015328
	ldr r0, _08015330 @ =0x0202BBB8
	ldrb r0, [r0, #1]
	bx lr
	.align 2, 0
_08015330: .4byte 0x0202BBB8
