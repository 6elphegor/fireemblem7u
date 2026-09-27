	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A6748
sub_080A6748: @ 0x080A6748
	push {r4, r5, r6, r7, lr}
	ldr r4, _080A6810 @ =0x0200006C
	ldr r1, _080A6814 @ =0x06011000
	adds r0, r4, #0
	movs r2, #0xf
	bl InitSpriteTextFont
	adds r0, r4, #0
	bl SetTextFont
	movs r0, #1
	bl SetTextFontGlyphs
	adds r4, #0x18
	movs r5, #2
_080A6766:
	adds r0, r4, #0
	bl InitSpriteText
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _080A6766
	ldr r0, _080A6818 @ =0x08194714
	movs r1, #0xf8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r5, _080A681C @ =0x02000084
	bl GetTacticianName
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0
	movs r2, #4
	bl Text_InsertDrawString
	ldr r4, _080A6820 @ =0x0202BBF8
	adds r7, r4, #0
	adds r7, #0x2b
	ldrb r1, [r7]
	lsrs r0, r1, #4
	bl TactGetMsg_Birth
	bl DecodeMsg
	adds r6, r0, #0
	movs r0, #0x40
	adds r1, r6, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r1, #0x40
	adds r0, r5, #0
	movs r2, #4
	adds r3, r6, #0
	bl Text_InsertDrawString
	adds r4, #0x2c
	ldrb r4, [r4]
	lsls r0, r4, #0x1f
	lsrs r0, r0, #0x1f
	bl TactGetMsg_Gender
	bl DecodeMsg
	adds r6, r0, #0
	movs r0, #0x40
	adds r1, r6, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r1, #0x80
	adds r0, r5, #0
	movs r2, #4
	adds r3, r6, #0
	bl Text_InsertDrawString
	ldr r0, _080A6824 @ =0x02022DBC
	ldr r2, _080A6828 @ =0x081C3AC0
	ldrb r7, [r7]
	lsrs r1, r7, #4
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	adds r1, #0x79
	movs r2, #0xa0
	lsls r2, r2, #7
	bl PutIcon
	movs r0, #0
	bl SetTextFont
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A6810: .4byte 0x0200006C
_080A6814: .4byte 0x06011000
_080A6818: .4byte 0x08194714
_080A681C: .4byte 0x02000084
_080A6820: .4byte 0x0202BBF8
_080A6824: .4byte 0x02022DBC
_080A6828: .4byte 0x081C3AC0
