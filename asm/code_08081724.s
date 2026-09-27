	.include "macro.inc"

	.syntax unified

	thumb_func_start HelpBoxPopulateStatScreenJInfo
HelpBoxPopulateStatScreenJInfo: @ 0x08081724
	ldr r1, _08081734 @ =0x0200310C
	ldr r1, [r1, #0xc]
	ldr r1, [r1, #4]
	ldrh r1, [r1, #2]
	adds r0, #0x4c
	strh r1, [r0]
	bx lr
	.align 2, 0
_08081734: .4byte 0x0200310C
