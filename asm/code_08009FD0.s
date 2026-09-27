	.include "macro.inc"

	.syntax unified

	thumb_func_start GetTalkChoiceResult
GetTalkChoiceResult: @ 0x08009FD0
	ldr r0, _08009FD8 @ =0x030000E0
	ldr r0, [r0]
	bx lr
	.align 2, 0
_08009FD8: .4byte 0x030000E0
