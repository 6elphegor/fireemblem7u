	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B70B4
sub_080B70B4: @ 0x080B70B4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r2
	adds r6, r3, #0
	ldr r3, _080B70FC @ =0x08CEDE00
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #2
	ldr r0, [r3]
	adds r4, r0, r2
	ldr r5, [r4, #8]
	lsls r1, r1, #3
	ldr r0, _080B7100 @ =0x02000830
	adds r7, r1, r0
	subs r0, #0x18
	bl SetTextFont
	movs r0, #1
	bl SetTextFontGlyphs
	adds r0, r7, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	adds r0, r7, #0
	movs r1, #1
	bl Text_SetColor
	mov r0, r8
	cmp r0, #0
	beq _080B7104
	cmp r0, #1
	beq _080B714C
	b _080B7172
	.align 2, 0
_080B70FC: .4byte 0x08CEDE00
_080B7100: .4byte 0x02000830
_080B7104:
	ldr r0, [r5]
	cmp r0, #0xcd
	bne _080B7120
	ldr r0, _080B711C @ =0x0202BBF8
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _080B713C
	ldr r0, [r5, #8]
	b _080B713E
	.align 2, 0
_080B711C: .4byte 0x0202BBF8
_080B7120:
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	blt _080B713C
	ldr r0, [r5, #8]
	bl DecodeMsg
	adds r1, r0, #0
	str r1, [r6]
	movs r0, #0
	ldrsb r0, [r4, r0]
	bl sub_080B6FB8
	b _080B7144
_080B713C:
	ldr r0, [r5, #4]
_080B713E:
	bl DecodeMsg
	str r0, [r6]
_080B7144:
	bl MsgExpand
	str r0, [r6]
	b _080B7172
_080B714C:
	ldr r0, [r5]
	cmp r0, #0xcd
	beq _080B7172
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bge _080B7172
	movs r0, #0
	bl SetTextFontGlyphs
	ldrb r1, [r4, #1]
	ldrb r2, [r4, #2]
	ldrb r3, [r4, #3]
	adds r0, r7, #0
	bl EpilogueText_DrawStats
	movs r0, #1
	bl SetTextFontGlyphs
_080B7172:
	ldr r1, [r6]
	adds r0, r7, #0
	bl EpilogueText_Center
_080B717A:
	ldr r0, [r6]
	ldrb r2, [r0]
	adds r1, r0, #0
	cmp r2, #0
	beq _080B7196
	cmp r2, #1
	beq _080B7192
	adds r0, r7, #0
	bl Text_DrawCharacter
	str r0, [r6]
	b _080B717A
_080B7192:
	adds r0, #1
	str r0, [r6]
_080B7196:
	movs r0, #0
	bl SetTextFont
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
