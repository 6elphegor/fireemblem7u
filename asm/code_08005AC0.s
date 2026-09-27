	.include "macro.inc"

	.syntax unified

	thumb_func_start SetTextDrawNoClear
SetTextDrawNoClear: @ 0x08005AC0
	ldr r0, _08005ACC @ =0x02028D70
	ldr r1, [r0]
	ldr r0, _08005AD0 @ =DrawTextGlyphNoClear
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_08005ACC: .4byte 0x02028D70
_08005AD0: .4byte DrawTextGlyphNoClear
