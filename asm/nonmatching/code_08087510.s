	.include "macro.inc"

	.syntax unified

	thumb_func_start SetCgTextBlendAlpha
SetCgTextBlendAlpha: @ 0x08087510
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	ldr r2, _08087524 @ =0x0203E738
	lsrs r1, r1, #8
	adds r0, r0, r1
	adds r2, #0x4e
	strh r0, [r2]
	bx lr
	.align 2, 0
_08087524: .4byte 0x0203E738
