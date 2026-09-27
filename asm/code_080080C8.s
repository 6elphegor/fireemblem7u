	.include "macro.inc"

	.syntax unified

	thumb_func_start CheckTalkFlag
CheckTalkFlag: @ 0x080080C8
	ldr r1, _080080D4 @ =0x08B909B8
	ldr r1, [r1]
	adds r1, #0x80
	ldrh r1, [r1]
	ands r0, r1
	bx lr
	.align 2, 0
_080080D4: .4byte 0x08B909B8
