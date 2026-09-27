	.include "macro.inc"

	.syntax unified

	thumb_func_start GetCgTextBlendAlpha
GetCgTextBlendAlpha: @ 0x08087528
	ldr r0, _08087530 @ =0x0203E738
	adds r0, #0x4e
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_08087530: .4byte 0x0203E738
