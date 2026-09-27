	.include "macro.inc"

	.syntax unified

	thumb_func_start DrawSoundRoomSongTitle
DrawSoundRoomSongTitle: @ 0x080AC384
	push {r4, r5, lr}
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080AC39C
	ldr r0, _080AC398 @ =0x08CE5388
	ldr r0, [r0]
	b _080AC3A6
	.align 2, 0
_080AC398: .4byte 0x08CE5388
_080AC39C:
	ldr r0, _080AC3F0 @ =0x08CE4D28
	lsls r1, r1, #4
	adds r0, #0xc
	adds r1, r1, r0
	ldr r0, [r1]
_080AC3A6:
	bl DecodeMsg
	adds r5, r0, #0
	ldr r4, _080AC3F4 @ =0x0201EA50
	adds r0, r4, #0
	bl SetTextFont
	movs r0, #1
	bl SetTextFontGlyphs
	adds r4, #0x18
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	movs r0, #0xa0
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_SetCursor
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColor
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_DrawString
	movs r0, #0
	bl SetTextFont
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AC3F0: .4byte 0x08CE4D28
_080AC3F4: .4byte 0x0201EA50
