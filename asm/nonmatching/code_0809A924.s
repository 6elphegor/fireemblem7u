	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809A924
sub_0809A924: @ 0x0809A924
	push {r4, r5, r6, lr}
	sub sp, #0x20
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _0809A99C @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x8e
	ldrh r0, [r0]
	bl DecodeMsg
	adds r6, r0, #0
	ldr r0, _0809A9A0 @ =0x06010000
	adds r5, r5, r0
	mov r0, sp
	adds r1, r5, #0
	movs r2, #1
	bl InitSpriteTextFont
	ldr r0, _0809A9A4 @ =0x08194674
	adds r4, #0x10
	lsls r4, r4, #5
	adds r1, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	add r4, sp, #0x18
	adds r0, r4, #0
	bl InitSpriteText
	mov r0, sp
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	movs r0, #0x60
	adds r1, r6, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0
	adds r3, r6, #0
	bl Text_InsertDrawString
	movs r0, #0
	bl SetTextFont
	add sp, #0x20
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809A99C: .4byte 0x0202BBF8
_0809A9A0: .4byte 0x06010000
_0809A9A4: .4byte 0x08194674
