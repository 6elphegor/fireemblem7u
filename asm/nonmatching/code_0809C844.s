	.include "macro.inc"

	.syntax unified

	thumb_func_start DrawSupportSubScreenRemainingText
DrawSupportSubScreenRemainingText: @ 0x0809C844
	push {r4, r5, r6, lr}
	sub sp, #0x20
	adds r5, r0, #0
	ldr r1, _0809C914 @ =0x06015000
	mov r0, sp
	movs r2, #0xe
	bl InitSpriteTextFont
	ldr r0, _0809C918 @ =0x08194674
	movs r1, #0xf0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	add r6, sp, #0x18
	adds r0, r6, #0
	bl InitSpriteText
	mov r0, sp
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	adds r0, r6, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	ldr r4, _0809C91C @ =0x08BDCE4C
	ldr r0, [r5, #0x2c]
	bl GetSupportScreenCharIdAt
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r4
	ldrh r0, [r0]
	bl DecodeMsg
	adds r4, r0, #0
	movs r0, #0x30
	adds r1, r4, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r6, #0
	movs r2, #0
	adds r3, r4, #0
	bl Text_InsertDrawString
	movs r4, #0
	adds r5, #0x3d
	ldrb r0, [r5]
	cmp r0, #0
	bne _0809C8B4
	movs r4, #1
_0809C8B4:
	movs r0, #0x94
	lsls r0, r0, #5
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r6, #0
	movs r1, #0x30
	adds r2, r4, #0
	bl Text_InsertDrawString
	movs r4, #0
	ldrb r0, [r5]
	cmp r0, #0
	bne _0809C8D2
	movs r4, #1
_0809C8D2:
	ldr r0, _0809C920 @ =0x00001281
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r6, #0
	movs r1, #0x60
	adds r2, r4, #0
	bl Text_InsertDrawString
	adds r0, r6, #0
	movs r1, #0x70
	bl Text_SetCursor
	ldrb r0, [r5]
	movs r1, #2
	cmp r0, #0
	bne _0809C8F6
	movs r1, #1
_0809C8F6:
	adds r0, r6, #0
	bl Text_SetColor
	ldrb r1, [r5]
	adds r0, r6, #0
	bl Text_DrawNumberOrBlank
	movs r0, #0
	bl SetTextFont
	add sp, #0x20
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809C914: .4byte 0x06015000
_0809C918: .4byte 0x08194674
_0809C91C: .4byte 0x08BDCE4C
_0809C920: .4byte 0x00001281
