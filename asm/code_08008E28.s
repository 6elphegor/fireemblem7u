	.include "macro.inc"

	.syntax unified

	thumb_func_start SetActiveTalkFace
SetActiveTalkFace: @ 0x08008E28
	ldr r1, _08008E30 @ =0x08B909B8
	ldr r1, [r1]
	strb r0, [r1, #0x11]
	bx lr
	.align 2, 0
_08008E30: .4byte 0x08B909B8
