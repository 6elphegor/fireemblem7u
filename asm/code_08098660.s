	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08098660
sub_08098660: @ 0x08098660
	push {r4, r5, lr}
	ldr r4, _08098700 @ =0x02012B50
	ldr r1, _08098704 @ =0x06011000
	adds r0, r4, #0
	movs r2, #0xb
	bl InitSpriteTextFont
	ldr r0, _08098708 @ =0x08194674
	movs r1, #0xd8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r5, r4, #0
	adds r5, #0x90
	adds r0, r5, #0
	bl InitSpriteText
	adds r0, r4, #0
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	adds r0, r5, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	movs r0, #0x93
	lsls r0, r0, #5
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0
	bl Text_InsertDrawString
	ldr r0, _0809870C @ =0x00001265
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x20
	movs r2, #0
	bl Text_InsertDrawString
	ldr r0, _08098710 @ =0x00001266
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x40
	movs r2, #0
	bl Text_InsertDrawString
	ldr r0, _08098714 @ =0x00001267
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x80
	movs r2, #3
	bl Text_InsertDrawString
	ldr r0, _08098718 @ =0x00001259
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0xc0
	movs r2, #3
	bl Text_InsertDrawString
	movs r0, #0
	bl SetTextFont
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08098700: .4byte 0x02012B50
_08098704: .4byte 0x06011000
_08098708: .4byte 0x08194674
_0809870C: .4byte 0x00001265
_08098710: .4byte 0x00001266
_08098714: .4byte 0x00001267
_08098718: .4byte 0x00001259
