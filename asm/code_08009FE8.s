	.include "macro.inc"

	.syntax unified

	thumb_func_start SetTalkNumber
SetTalkNumber: @ 0x08009FE8
	ldr r1, _08009FF0 @ =0x08B909B8
	ldr r1, [r1]
	str r0, [r1, #0x3c]
	bx lr
	.align 2, 0
_08009FF0: .4byte 0x08B909B8
