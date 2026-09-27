	.include "macro.inc"

	.syntax unified

	thumb_func_start SetCgTextBlendControl
SetCgTextBlendControl: @ 0x080874E4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r2, #0x20
	orrs r1, r2
	ldr r2, _08087500 @ =0x0203E738
	lsls r1, r1, #8
	adds r1, #0x40
	adds r0, r0, r1
	adds r2, #0x4c
	strh r0, [r2]
	bx lr
	.align 2, 0
_08087500: .4byte 0x0203E738
