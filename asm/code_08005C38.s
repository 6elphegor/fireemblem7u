	.include "macro.inc"

	.syntax unified

	thumb_func_start InitSpriteTextFont
InitSpriteTextFont: @ 0x08005C38
	push {r4, lr}
	adds r4, r0, #0
	str r1, [r4]
	ldr r0, _08005C6C @ =GetSpriteTextDrawDest
	str r0, [r4, #0xc]
	movs r0, #0xf
	ands r2, r0
	adds r2, #0x10
	movs r0, #0
	strh r2, [r4, #0x14]
	lsls r1, r1, #0xf
	lsrs r1, r1, #0x14
	strh r1, [r4, #0x10]
	strh r0, [r4, #0x12]
	bl GetLang
	strb r0, [r4, #0x16]
	adds r0, r4, #0
	bl SetTextFont
	ldr r0, _08005C70 @ =DrawSpriteTextGlyph
	str r0, [r4, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08005C6C: .4byte GetSpriteTextDrawDest
_08005C70: .4byte DrawSpriteTextGlyph
