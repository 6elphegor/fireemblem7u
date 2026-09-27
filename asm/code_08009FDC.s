	.include "macro.inc"

	.syntax unified

	thumb_func_start SetTalkChoiceResult
SetTalkChoiceResult: @ 0x08009FDC
	ldr r1, _08009FE4 @ =0x030000E0
	str r0, [r1]
	bx lr
	.align 2, 0
_08009FE4: .4byte 0x030000E0
