	.include "macro.inc"

	.syntax unified

	thumb_func_start SetPalFadeStop
SetPalFadeStop: @ 0x08013B70
	strh r1, [r0, #0x2c]
	bx lr
