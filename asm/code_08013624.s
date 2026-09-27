	.include "macro.inc"

	.syntax unified

	thumb_func_start GetPalFadeSt
GetPalFadeSt: @ 0x08013624
	ldr r0, _08013628 @ =0x0202B5B8
	bx lr
	.align 2, 0
_08013628: .4byte 0x0202B5B8
