	.include "macro.inc"

	.syntax unified

	thumb_func_start SetTextFontGlyphs
SetTextFontGlyphs: @ 0x08005410
	cmp r0, #0
	bne _08005424
	ldr r0, _0800541C @ =0x02028D70
	ldr r1, [r0]
	ldr r0, _08005420 @ =0x08B896B0
	b _0800542A
	.align 2, 0
_0800541C: .4byte 0x02028D70
_08005420: .4byte 0x08B896B0
_08005424:
	ldr r0, _08005430 @ =0x02028D70
	ldr r1, [r0]
	ldr r0, _08005434 @ =0x08B8B5B0
_0800542A:
	str r0, [r1, #4]
	bx lr
	.align 2, 0
_08005430: .4byte 0x02028D70
_08005434: .4byte 0x08B8B5B0
