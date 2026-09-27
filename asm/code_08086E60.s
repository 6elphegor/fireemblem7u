	.include "macro.inc"

	.syntax unified

	thumb_func_start ChapterStatus_SetupFont
ChapterStatus_SetupFont: @ 0x08086E60
	push {r4, lr}
	ldr r0, _08086E9C @ =0x08194674
	movs r1, #0xd0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r4, _08086EA0 @ =0x020040D4
	ldr r1, _08086EA4 @ =0x06017800
	adds r0, r4, #0
	movs r2, #0x1a
	bl InitSpriteTextFont
	adds r0, r4, #0
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	subs r4, #8
	adds r0, r4, #0
	bl InitSpriteText
	movs r0, #0
	bl SetTextFont
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08086E9C: .4byte 0x08194674
_08086EA0: .4byte 0x020040D4
_08086EA4: .4byte 0x06017800
