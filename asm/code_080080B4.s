	.include "macro.inc"

	.syntax unified

	thumb_func_start ClearTalkFlag
ClearTalkFlag: @ 0x080080B4
	ldr r1, _080080C4 @ =0x08B909B8
	ldr r1, [r1]
	adds r1, #0x80
	ldrh r2, [r1]
	bics r2, r0
	adds r0, r2, #0
	strh r0, [r1]
	bx lr
	.align 2, 0
_080080C4: .4byte 0x08B909B8
