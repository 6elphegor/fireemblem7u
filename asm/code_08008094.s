	.include "macro.inc"

	.syntax unified

	thumb_func_start SetTalkFlag
SetTalkFlag: @ 0x08008094
	ldr r1, _080080A4 @ =0x08B909B8
	ldr r1, [r1]
	adds r1, #0x80
	ldrh r2, [r1]
	orrs r0, r2
	strh r0, [r1]
	bx lr
	.align 2, 0
_080080A4: .4byte 0x08B909B8
