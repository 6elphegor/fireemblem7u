	.include "macro.inc"

	.syntax unified

	thumb_func_start SetActiveCRSpellBgColorProc
SetActiveCRSpellBgColorProc: @ 0x08064038
	ldr r1, _08064040 @ =0x0203E0F8
	str r0, [r1]
	bx lr
	.align 2, 0
_08064040: .4byte 0x0203E0F8
