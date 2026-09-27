	.include "macro.inc"

	.syntax unified

	thumb_func_start InitTalkTextFont
InitTalkTextFont: @ 0x08005A80
	push {r4, lr}
	ldr r0, _08005AB0 @ =0x08194694
	ldr r4, _08005AB4 @ =0x02028D70
	ldr r1, [r4]
	ldrh r1, [r1, #0x14]
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r1, _08005AB8 @ =0x02022860
	ldr r2, [r4]
	ldrh r3, [r2, #0x14]
	lsls r0, r3, #5
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08005ABC @ =DrawTextGlyph
	str r0, [r2, #8]
	movs r0, #1
	bl SetTextFontGlyphs
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08005AB0: .4byte 0x08194694
_08005AB4: .4byte 0x02028D70
_08005AB8: .4byte 0x02022860
_08005ABC: .4byte DrawTextGlyph
