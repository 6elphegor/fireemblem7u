	.include "macro.inc"

	.syntax unified

	thumb_func_start SetTalkFunc
SetTalkFunc: @ 0x080080A8
	ldr r1, _080080B0 @ =0x08B909B8
	ldr r1, [r1]
	str r0, [r1, #0x38]
	bx lr
	.align 2, 0
_080080B0: .4byte 0x08B909B8
