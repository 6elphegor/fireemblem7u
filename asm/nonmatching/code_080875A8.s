	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_808EB0C
sub_808EB0C: @ 0x080875A8
	push {r4, r5, r6, lr}
	sub sp, #0x40
	adds r2, r0, #0
	add r3, sp, #0x18
	ldr r1, [r2, #0x2c]
	adds r6, r3, #0
	ldrb r0, [r1]
	cmp r0, #0x80
	bne _08087676
	ldrb r0, [r1, #1]
	cmp r0, #0x23
	bne _08087676
	adds r0, r1, #2
	str r0, [r2, #0x2c]
	add r5, sp, #0x38
	adds r4, r2, #0
	adds r4, #0x61
	ldrb r1, [r1, #2]
	cmp r1, #1
	beq _080875E2
_080875D0:
	ldr r0, [r2, #0x2c]
	ldrb r1, [r0]
	strb r1, [r3]
	adds r1, r0, #1
	str r1, [r2, #0x2c]
	adds r3, #1
	ldrb r0, [r0, #1]
	cmp r0, #1
	bne _080875D0
_080875E2:
	ldr r0, [r2, #0x2c]
	adds r0, #1
	str r0, [r2, #0x2c]
	movs r0, #0
	strb r0, [r3]
	movs r0, #0x80
	lsls r0, r0, #9
	bl SetCgTextFlag
	ldr r1, _08087630 @ =0x06017800
	mov r0, sp
	movs r2, #0x12
	bl InitSpriteTextFont
	mov r0, sp
	bl SetTextFont
	adds r0, r5, #0
	bl InitSpriteText
	adds r0, r5, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	movs r0, #0
	bl SetTextFontGlyphs
	adds r0, r6, #0
	bl GetStringTextLen
	adds r1, r0, #0
	cmp r1, #0x30
	ble _08087634
	subs r0, #0x29
	cmp r0, #0
	bge _0808762C
	adds r0, #7
_0808762C:
	asrs r0, r0, #3
	b _08087636
	.align 2, 0
_08087630: .4byte 0x06017800
_08087634:
	movs r0, #0
_08087636:
	strb r0, [r4]
	ldrb r0, [r4]
	adds r0, #6
	lsls r0, r0, #3
	adds r1, r6, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #0
	adds r3, r6, #0
	bl Text_InsertDrawString
	movs r0, #0
	bl SetTextFont
	ldr r0, _08087680 @ =0x08194674
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08087684 @ =0x0819D20C
	movs r1, #0x88
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08087688 @ =0x0819D174
	ldr r1, _0808768C @ =0x06017A00
	bl Decompress
_08087676:
	add sp, #0x40
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08087680: .4byte 0x08194674
_08087684: .4byte 0x0819D20C
_08087688: .4byte 0x0819D174
_0808768C: .4byte 0x06017A00
