	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08089794
sub_08089794: @ 0x08089794
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	mov r8, r0
	ldr r2, _08089878 @ =0x03002870
	movs r6, #1
	ldrb r0, [r2, #1]
	orrs r0, r6
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	movs r0, #0
	bl SetOnVMatch
	movs r0, #0
	bl InitBgs
	bl ResetText
	bl ResetTextFont
	bl ClearIcons
	bl ApplyUnitSpritePalettes
	movs r4, #0
	str r4, [sp, #4]
	ldr r1, _0808987C @ =0x02022BC0
	ldr r2, _08089880 @ =0x01000008
	add r0, sp, #4
	bl CpuFastSet
	bl ApplySystemObjectsGraphics
	mov r0, r8
	bl StartGreenText
	mov r0, r8
	adds r0, #0x3b
	strb r4, [r0]
	subs r0, #0xd
	movs r5, #6
	strb r5, [r0]
	mov r0, r8
	bl sub_08089714
	mov r0, r8
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #1
	bne _08089828
	mov r0, r8
	adds r0, #0x2a
	mov r1, r8
	adds r1, #0x32
	str r1, [sp, #0x18]
	mov r2, r8
	adds r2, #0x29
	str r2, [sp, #0xc]
	movs r1, #0x2f
	add r1, r8
	mov sl, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _080898A0
_08089828:
	ldr r4, _08089884 @ =0x0202BBF8
	ldrb r1, [r4, #0x1a]
	mov r3, r8
	adds r3, #0x34
	mov r2, r8
	adds r2, #0x32
	str r2, [sp, #0x18]
	cmp r1, #0
	beq _0808984C
	lsrs r0, r1, #7
	ands r0, r6
	adds r2, #1
	strb r0, [r2]
	strb r0, [r3]
	movs r0, #0x7f
	ands r1, r0
	ldr r6, [sp, #0x18]
	strb r1, [r6]
_0808984C:
	mov r0, r8
	adds r0, #0x29
	str r0, [sp, #0xc]
	movs r0, #0x2f
	add r0, r8
	mov sl, r0
	ldr r1, [sp, #0xc]
	ldrb r1, [r1]
	cmp r1, #4
	beq _08089896
	ldrb r0, [r0]
	cmp r0, #0
	beq _08089896
	ldrb r4, [r4, #0x19]
	lsrs r1, r4, #4
	cmp r1, #0
	beq _08089896
	cmp r1, #6
	bls _08089888
	mov r2, sl
	strb r5, [r2]
	b _0808988C
	.align 2, 0
_08089878: .4byte 0x03002870
_0808987C: .4byte 0x02022BC0
_08089880: .4byte 0x01000008
_08089884: .4byte 0x0202BBF8
_08089888:
	mov r6, sl
	strb r1, [r6]
_0808988C:
	mov r1, sl
	ldrb r0, [r1]
	mov r1, r8
	adds r1, #0x36
	strb r0, [r1]
_08089896:
	ldr r2, [sp, #0x18]
	ldrb r0, [r2]
	ldrb r1, [r3]
	bl SortUnitList
_080898A0:
	ldr r0, _0808997C @ =0x02022C60
	movs r1, #0
	bl TmFill
	ldr r4, _08089980 @ =0x02023460
	adds r0, r4, #0
	movs r1, #0
	bl TmFill
	ldr r0, _08089984 @ =0x02023C60
	movs r1, #0
	bl TmFill
	bl InitIcons
	movs r0, #4
	bl ApplyIconPalettes
	bl UnpackUiWindowFrameGraphics
	ldr r0, _08089988 @ =0x0840D3F8
	ldr r1, _0808998C @ =0x06014800
	bl Decompress
	ldr r0, _08089990 @ =0x0840DCE4
	movs r1, #0xc8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	bl sub_08090F30
	ldr r1, _08089994 @ =0x0840D304
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r4, #0
	bl sub_080AACD8
	movs r4, #0
	mov r6, r8
	adds r6, #0x2e
	str r6, [sp, #0x14]
	mov r0, r8
	adds r0, #0x39
	str r0, [sp, #8]
	mov r1, r8
	adds r1, #0x2b
	str r1, [sp, #0x10]
	ldr r6, _08089998 @ =0x0200D5A8
	movs r2, #0x10
	adds r2, r2, r6
	mov sb, r2
	adds r5, r6, #0
	movs r7, #0
_0808990C:
	lsls r0, r4, #3
	ldr r1, _0808999C @ =0x0200D570
	adds r0, r0, r1
	movs r1, #5
	bl InitText
	adds r0, r5, #0
	movs r1, #7
	bl InitTextDb
	adds r0, r6, #0
	adds r0, #8
	adds r0, r7, r0
	movs r1, #7
	bl InitText
	mov r0, sb
	movs r1, #5
	bl InitText
	movs r0, #0x18
	add sb, r0
	adds r5, #0x18
	adds r7, #0x18
	adds r4, #1
	cmp r4, #6
	ble _0808990C
	ldr r0, _080899A0 @ =0x0200D650
	movs r1, #4
	bl InitText
	ldr r0, _080899A4 @ =0x0200D658
	movs r1, #0x14
	bl InitText
	ldr r0, _080899A8 @ =0x0200D660
	movs r1, #4
	bl InitText
	ldr r1, [sp, #0x18]
	ldrb r0, [r1]
	bl sub_08088CD4
	ldr r2, [sp, #0xc]
	ldrb r2, [r2]
	cmp r2, #4
	bne _080899AC
	mov r0, r8
	movs r1, #0
	bl sub_08088F3C
	movs r0, #0
	ldr r6, [sp, #0xc]
	strb r0, [r6]
	b _080899BC
	.align 2, 0
_0808997C: .4byte 0x02022C60
_08089980: .4byte 0x02023460
_08089984: .4byte 0x02023C60
_08089988: .4byte 0x0840D3F8
_0808998C: .4byte 0x06014800
_08089990: .4byte 0x0840DCE4
_08089994: .4byte 0x0840D304
_08089998: .4byte 0x0200D5A8
_0808999C: .4byte 0x0200D570
_080899A0: .4byte 0x0200D650
_080899A4: .4byte 0x0200D658
_080899A8: .4byte 0x0200D660
_080899AC:
	ldr r0, [sp, #8]
	ldrb r0, [r0]
	cmp r0, #1
	bne _080899BC
	mov r0, r8
	movs r1, #1
	bl sub_08088F3C
_080899BC:
	movs r1, #0
	movs r0, #0
	mov r2, r8
	strh r0, [r2, #0x3c]
	ldr r6, [sp, #0x10]
	strb r1, [r6]
	ldr r4, _08089A10 @ =0x0200D650
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetCursor
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColor
	ldr r0, _08089A14 @ =0x000010F2
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	ldr r1, _08089A18 @ =0x02023DA6
	adds r0, r4, #0
	bl PutText
	ldr r1, _08089A1C @ =0x0200E66C
	movs r2, #0xff
	adds r0, r1, #0
	adds r0, #0x4c
_080899FE:
	str r2, [r0]
	subs r0, #4
	cmp r0, r1
	bge _080899FE
	mov r0, r8
	ldrh r0, [r0, #0x3e]
	lsrs r4, r0, #4
	adds r0, r4, #6
	b _08089A3E
	.align 2, 0
_08089A10: .4byte 0x0200D650
_08089A14: .4byte 0x000010F2
_08089A18: .4byte 0x02023DA6
_08089A1C: .4byte 0x0200E66C
_08089A20:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	mov r2, sl
	ldrb r3, [r2]
	movs r0, #1
	str r0, [sp]
	mov r0, r8
	ldr r2, _08089B58 @ =0x02022C60
	bl sub_0808AD00
	adds r4, #1
	mov r6, r8
	ldrh r6, [r6, #0x3e]
	lsrs r0, r6, #4
	adds r0, #6
_08089A3E:
	cmp r4, r0
	bge _08089A4A
	ldr r0, _08089B5C @ =0x0200E668
	ldrb r0, [r0]
	cmp r4, r0
	blt _08089A20
_08089A4A:
	ldr r1, [sp, #0x14]
	ldrb r0, [r1]
	mov r2, sl
	ldrb r1, [r2]
	movs r2, #1
	bl sub_0808AC90
	ldr r7, _08089B60 @ =0x03002870
	movs r0, #0x20
	ldrb r6, [r7, #1]
	orrs r0, r6
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	adds r1, r7, #0
	adds r1, #0x2d
	movs r5, #0x10
	movs r0, #0x10
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x38
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xe0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x98
	strb r0, [r1]
	adds r2, r7, #0
	adds r2, #0x34
	movs r0, #1
	mov sb, r0
	ldrb r0, [r2]
	mov r1, sb
	orrs r0, r1
	movs r4, #2
	orrs r0, r4
	movs r3, #4
	orrs r0, r3
	movs r1, #8
	orrs r0, r1
	orrs r0, r5
	strb r0, [r2]
	adds r2, #2
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r6, [r2]
	ands r0, r6
	orrs r0, r4
	orrs r0, r3
	orrs r0, r1
	orrs r0, r5
	strb r0, [r2]
	movs r0, #0xf
	bl EnableBgSync
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	mov r0, r8
	ldrh r2, [r0, #0x3e]
	subs r2, #0x38
	movs r0, #0xff
	ands r2, r0
	movs r0, #0
	movs r1, #0
	bl SetBgOffset
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r7, #0xc]
	ands r0, r2
	strb r0, [r7, #0xc]
	adds r0, r1, #0
	ldrb r6, [r7, #0x10]
	ands r0, r6
	orrs r0, r4
	strb r0, [r7, #0x10]
	ldrb r0, [r7, #0x14]
	ands r1, r0
	mov r2, sb
	orrs r1, r2
	strb r1, [r7, #0x14]
	movs r0, #3
	ldrb r6, [r7, #0x18]
	orrs r0, r6
	strb r0, [r7, #0x18]
	ldr r0, _08089B64 @ =0x0840D224
	ldr r1, _08089B68 @ =0x02023960
	bl Decompress
	ldr r0, _08089B6C @ =0x08405B0C
	movs r1, #0xf0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08089B70 @ =0x08CC3404
	mov r1, r8
	bl Proc_Start
	mov r1, r8
	str r0, [r1, #0x40]
	ldr r2, [sp, #8]
	ldrb r2, [r2]
	cmp r2, #1
	bne _08089B74
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08089B74
	movs r0, #0
	movs r1, #0xa
	bl StartPrepMuralBackground
	mov r6, r8
	str r0, [r6, #0x44]
	b _08089B82
	.align 2, 0
_08089B58: .4byte 0x02022C60
_08089B5C: .4byte 0x0200E668
_08089B60: .4byte 0x03002870
_08089B64: .4byte 0x0840D224
_08089B68: .4byte 0x02023960
_08089B6C: .4byte 0x08405B0C
_08089B70: .4byte 0x08CC3404
_08089B74:
	movs r0, #0
	movs r1, #0
	movs r2, #0xa
	bl StartMuralBackgroundAlt
	mov r1, r8
	str r0, [r1, #0x44]
_08089B82:
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	bl LoadHelpBoxGfx
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
