	.include "macro.inc"

	.syntax unified

	thumb_func_start InitSpriteTalk
InitSpriteTalk: @ 0x08007E98
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	adds r4, r2, #0
	ldr r5, _08007F28 @ =0x030000E8
	ldr r1, _08007F2C @ =0x000003FF
	ands r1, r0
	lsls r1, r1, #5
	ldr r0, _08007F30 @ =0x06010000
	adds r1, r1, r0
	adds r0, r5, #0
	bl InitSpriteTextFont
	adds r0, r5, #0
	bl SetTextFont
	movs r0, #1
	bl SetTextFontGlyphs
	ldr r0, _08007F34 @ =0x08194694
	adds r4, #0x10
	lsls r1, r4, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r2, _08007F38 @ =0x02022860
	lsls r4, r4, #4
	adds r0, r4, #4
	lsls r0, r0, #1
	adds r0, r0, r2
	ldr r1, _08007F3C @ =0x00007247
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0xe
	lsls r0, r0, #1
	adds r0, r0, r2
	ldr r1, _08007F40 @ =0x000031AE
	strh r1, [r0]
	adds r4, #0xf
	lsls r4, r4, #1
	adds r4, r4, r2
	ldr r0, _08007F44 @ =0x00007FFF
	strh r0, [r4]
	ldr r0, _08007F48 @ =0x08B909B8
	ldr r0, [r0]
	strb r6, [r0, #0xa]
	movs r5, #0
	cmp r5, r6
	bge _08007F20
_08007EF8:
	lsls r4, r5, #3
	ldr r0, _08007F4C @ =0x030000C8
	adds r4, r4, r0
	adds r0, r4, #0
	bl InitSpriteText
	adds r0, r4, #0
	bl SpriteText_DrawBackground
	adds r0, r4, #0
	movs r1, #6
	bl Text_SetColor
	adds r0, r4, #0
	movs r1, #4
	bl Text_SetCursor
	adds r5, #1
	cmp r5, r6
	blt _08007EF8
_08007F20:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08007F28: .4byte 0x030000E8
_08007F2C: .4byte 0x000003FF
_08007F30: .4byte 0x06010000
_08007F34: .4byte 0x08194694
_08007F38: .4byte 0x02022860
_08007F3C: .4byte 0x00007247
_08007F40: .4byte 0x000031AE
_08007F44: .4byte 0x00007FFF
_08007F48: .4byte 0x08B909B8
_08007F4C: .4byte 0x030000C8
