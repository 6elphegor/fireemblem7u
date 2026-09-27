	.include "macro.inc"

	.syntax unified

	thumb_func_start Prep_DrawChapterGoal
Prep_DrawChapterGoal: @ 0x0808E488
	push {r4, r5, lr}
	sub sp, #0x20
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, _0808E500 @ =0x06010000
	adds r2, r2, r0
	mov r0, sp
	adds r1, r2, #0
	adds r2, r4, #0
	bl InitSpriteTextFont
	ldr r0, _0808E504 @ =0x08194674
	adds r4, #0x10
	lsls r4, r4, #5
	adds r1, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	add r5, sp, #0x18
	adds r0, r5, #0
	bl InitSpriteText
	mov r0, sp
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	adds r0, r5, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	ldr r0, _0808E508 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x8e
	ldrh r0, [r0]
	bl DecodeMsg
	adds r4, r0, #0
	movs r0, #0x60
	adds r1, r4, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #0
	adds r3, r4, #0
	bl Text_InsertDrawString
	movs r0, #0
	bl SetTextFont
	add sp, #0x20
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808E500: .4byte 0x06010000
_0808E504: .4byte 0x08194674
_0808E508: .4byte 0x0202BBF8
