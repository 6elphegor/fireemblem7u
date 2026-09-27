	.include "macro.inc"

	.syntax unified

	thumb_func_start GetPermanentFlagBits
GetPermanentFlagBits: @ 0x08079924
	ldr r0, _08079928 @ =0x03004AD0
	bx lr
	.align 2, 0
_08079928: .4byte 0x03004AD0
