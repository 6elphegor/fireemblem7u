	.include "macro.inc"

	.syntax unified

	thumb_func_start SetTalkLines
SetTalkLines: @ 0x08008078
	ldr r1, _08008080 @ =0x08B909B8
	ldr r1, [r1]
	strb r0, [r1, #0xa]
	bx lr
	.align 2, 0
_08008080: .4byte 0x08B909B8
