	.include "macro.inc"

	.syntax unified

	thumb_func_start InitSubtitleHelpText
InitSubtitleHelpText: @ 0x08032340
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r5, [r7, #0x2c]
	adds r0, #0x30
	ldr r1, _08032404 @ =0x06014800
	movs r2, #0x14
	bl InitSpriteTextFont
	movs r0, #1
	bl SetTextFontGlyphs
	ldr r0, _08032408 @ =0x08194694
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r4, r7, #0
	adds r4, #0x48
	movs r6, #1
_0803236E:
	adds r0, r4, #0
	bl InitSpriteText
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColor
	adds r4, #8
	subs r6, #1
	cmp r6, #0
	bge _0803236E
	cmp r5, #0
	beq _080323F2
	movs r0, #0x5e
	adds r0, r0, r7
	mov r8, r0
	adds r6, r7, #0
	adds r6, #0x5c
	ldrb r2, [r5]
	cmp r2, #1
	bls _080323E0
	adds r4, r7, #0
	adds r4, #0x48
_080323A4:
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_DrawCharacter
	adds r5, r0, #0
	adds r0, r4, #0
	bl Text_GetCursor
	cmp r0, #0xe0
	ble _080323DA
	subs r5, #1
	adds r4, #8
	adds r0, r5, #0
	mov r1, sp
	bl GetCharTextLen
	adds r0, r7, #0
	adds r0, #0x48
	bl Text_GetCursor
	adds r1, r0, #0
	ldr r0, [sp]
	subs r1, r1, r0
	subs r1, #0xc0
	adds r0, r4, #0
	bl Text_SetCursor
_080323DA:
	ldrb r0, [r5]
	cmp r0, #1
	bhi _080323A4
_080323E0:
	ldr r0, [r7, #0x2c]
	bl GetStringTextLen
	adds r0, #0x10
	asrs r0, r0, #5
	adds r1, r0, #1
	mov r2, r8
	strh r1, [r2]
	strh r0, [r6]
_080323F2:
	movs r0, #0
	bl SetTextFont
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08032404: .4byte 0x06014800
_08032408: .4byte 0x08194694
