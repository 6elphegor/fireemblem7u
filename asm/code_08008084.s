	.include "macro.inc"

	.syntax unified

	thumb_func_start ClearAllTalkFlags
ClearAllTalkFlags: @ 0x08008084
	ldr r0, _08008090 @ =0x08B909B8
	ldr r0, [r0]
	adds r0, #0x80
	movs r1, #0
	strh r1, [r0]
	bx lr
	.align 2, 0
_08008090: .4byte 0x08B909B8
