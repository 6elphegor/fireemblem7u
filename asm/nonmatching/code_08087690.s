	.include "macro.inc"

	.syntax unified

	thumb_func_start CgText_Init
CgText_Init: @ 0x08087690
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r6, r0, #0
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	adds r1, r6, #0
	adds r1, #0x55
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	bl GetCgTextFlags
	lsrs r0, r0, #0xb
	movs r1, #7
	ands r0, r1
	cmp r0, #0
	beq _080876CA
	bl GetCgTextFlags
	lsrs r0, r0, #0xb
	movs r1, #7
	ands r0, r1
	subs r0, #1
	b _080876CE
_080876CA:
	bl GetTextPrintDelay
_080876CE:
	adds r1, r6, #0
	adds r1, #0x52
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x60
	movs r2, #0
	strb r2, [r0]
	movs r0, #0
	ldrsb r0, [r1, r0]
	movs r1, #0x7f
	cmp r0, #0
	beq _080876E8
	movs r1, #1
_080876E8:
	adds r0, r6, #0
	adds r0, #0x53
	strb r1, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r0, #0xa
	strb r2, [r0]
	adds r0, r6, #0
	bl sub_808EB0C
	adds r0, r6, #0
	adds r0, #0x5b
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r7, r0, #0
	movs r0, #0x5c
	adds r0, r0, r6
	mov sb, r0
	cmp r1, #0
	blt _0808771A
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _0808774C
_0808771A:
	movs r0, #1
	bl SetTextFontGlyphs
	ldr r0, [r6, #0x2c]
	add r2, sp, #8
	add r1, sp, #4
	bl GetCgTextBoxDimensions
	movs r0, #0
	bl SetTextFontGlyphs
	ldr r1, [sp, #4]
	adds r0, r1, #7
	cmp r0, #0
	bge _0808773A
	adds r0, #7
_0808773A:
	asrs r0, r0, #3
	strb r0, [r7]
	ldr r0, [sp, #8]
	cmp r0, #0
	bge _08087746
	adds r0, #7
_08087746:
	asrs r0, r0, #3
	mov r1, sb
	strb r0, [r1]
_0808774C:
	bl GetCgTextFlags
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0808775A
	b _080878AC
_0808775A:
	movs r2, #0x58
	adds r2, r2, r6
	mov r8, r2
	mov r3, sb
	movs r0, #0
	ldrsb r0, [r3, r0]
	ldrb r5, [r2]
	subs r0, r5, r0
	subs r0, #1
	str r0, [sp, #0x10]
	bl GetCgTextFlags
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	beq _080877F8
	adds r5, r6, #0
	adds r5, #0x57
	movs r0, #0
	ldrsb r0, [r7, r0]
	ldrb r1, [r5]
	subs r0, r1, r0
	subs r0, #2
	str r0, [sp, #0xc]
	bl GetCgTextFlags
	movs r2, #0xc0
	lsls r2, r2, #8
	mov sl, r2
	ands r0, r2
	lsrs r0, r0, #0xe
	movs r3, #0
	ldrsb r3, [r7, r3]
	ldrb r7, [r5]
	subs r1, r7, r3
	subs r1, #2
	mov r2, sb
	movs r4, #0
	ldrsb r4, [r2, r4]
	mov r7, r8
	ldrb r2, [r7]
	subs r2, r2, r4
	mov ip, r2
	subs r2, #1
	adds r3, #2
	adds r4, #2
	str r4, [sp]
	bl PutTalkBubbleTm
	bl GetCgTextFlags
	movs r1, #0x80
	lsls r1, r1, #3
	ands r1, r0
	cmp r1, #0
	bne _0808786A
	bl GetCgTextFlags
	movs r1, #0x80
	lsls r1, r1, #0xb
	ands r1, r0
	movs r4, #3
	cmp r1, #0
	beq _080877DC
	movs r4, #5
_080877DC:
	bl GetCgTextFlags
	mov r3, sl
	ands r0, r3
	lsrs r0, r0, #0xe
	ldrb r1, [r5]
	subs r1, #1
	mov r5, r8
	ldrb r2, [r5]
	subs r2, #2
	adds r3, r4, #0
	bl PutTalkBubbleTail
	b _0808786A
_080877F8:
	adds r5, r6, #0
	adds r5, #0x57
	ldrb r0, [r5]
	adds r0, #1
	str r0, [sp, #0xc]
	bl GetCgTextFlags
	movs r1, #0xc0
	lsls r1, r1, #8
	mov sl, r1
	ands r0, r1
	lsrs r0, r0, #0xe
	ldrb r1, [r5]
	adds r1, #1
	mov r2, sb
	movs r4, #0
	ldrsb r4, [r2, r4]
	mov r3, r8
	ldrb r2, [r3]
	subs r2, r2, r4
	mov ip, r2
	subs r2, #1
	movs r3, #0
	ldrsb r3, [r7, r3]
	adds r3, #2
	adds r4, #2
	str r4, [sp]
	bl PutTalkBubbleTm
	bl GetCgTextFlags
	movs r1, #0x80
	lsls r1, r1, #3
	ands r1, r0
	cmp r1, #0
	bne _0808786A
	bl GetCgTextFlags
	movs r1, #0x80
	lsls r1, r1, #0xb
	ands r1, r0
	movs r4, #2
	cmp r1, #0
	beq _08087852
	movs r4, #5
_08087852:
	bl GetCgTextFlags
	mov r3, sl
	ands r0, r3
	lsrs r0, r0, #0xe
	ldrb r1, [r5]
	mov r5, r8
	ldrb r2, [r5]
	subs r2, #2
	adds r3, r4, #0
	bl PutTalkBubbleTail
_0808786A:
	bl GetCgTextFlags
	movs r1, #0x80
	lsls r1, r1, #9
	ands r1, r0
	cmp r1, #0
	beq _080878A6
	bl GetCgTextFlags
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #8
	ands r0, r1
	lsrs r0, r0, #0xe
	bl GetBgTilemap
	ldr r7, [sp, #0x10]
	lsls r1, r7, #6
	adds r0, r0, r1
	ldr r2, [sp, #0xc]
	lsls r1, r2, #1
	adds r0, r0, r1
	adds r1, r6, #0
	adds r1, #0x61
	ldrb r1, [r1]
	adds r1, #6
	movs r2, #0
	movs r3, #0
	bl TmFillRect_thm
_080878A6:
	movs r0, #0xf
	bl EnableBgSync
_080878AC:
	adds r0, r6, #0
	bl sub_808F3D8
	ldr r0, _08087920 @ =sub_808F5C8
	adds r1, r6, #0
	bl StartParallelWorker
	ldr r0, [r6, #0x30]
	bl SetTextFont
	movs r0, #1
	bl SetTextFontGlyphs
	mov r3, sb
	movs r0, #0
	ldrsb r0, [r3, r0]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	movs r5, #0
	cmp r0, #0
	blt _080878FE
_080878D6:
	lsls r0, r5, #2
	adds r4, r6, #0
	adds r4, #0x34
	adds r4, r4, r0
	ldr r0, [r4]
	bl InitSpriteText
	ldr r0, [r4]
	movs r1, #0xb
	bl Text_SetColor
	adds r5, #1
	mov r7, sb
	movs r0, #0
	ldrsb r0, [r7, r0]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	cmp r5, r0
	ble _080878D6
_080878FE:
	adds r0, r6, #0
	bl CgText_ClearSpriteText
	movs r0, #0
	bl SetTextFont
	bl GetCgTextFlags
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08087924
	adds r0, r6, #0
	movs r1, #3
	bl Proc_Goto
	b _08087A04
	.align 2, 0
_08087920: .4byte sub_808F5C8
_08087924:
	bl GetCgTextFlags
	movs r1, #0x80
	ands r1, r0
	cmp r1, #0
	beq _08087942
	movs r0, #0x10
	movs r1, #1
	bl SetCgTextBlendAlpha
	adds r0, r6, #0
	movs r1, #3
	bl Proc_Goto
	b _0808794A
_08087942:
	movs r0, #0
	movs r1, #0x10
	bl SetCgTextBlendAlpha
_0808794A:
	bl GetCgTextFlags
	movs r1, #0x80
	lsls r1, r1, #9
	ands r1, r0
	cmp r1, #0
	beq _08087978
	ldr r4, _08087974 @ =0x0203E738
	adds r3, r6, #0
	adds r3, #0x58
	ldrb r1, [r3]
	subs r1, #5
	adds r2, r4, #0
	adds r2, #0x48
	movs r0, #0x1f
	ands r1, r0
	movs r0, #0x20
	rsbs r0, r0, #0
	ldrb r5, [r2]
	ands r0, r5
	b _08087992
	.align 2, 0
_08087974: .4byte 0x0203E738
_08087978:
	ldr r4, _08087A2C @ =0x0203E738
	adds r3, r6, #0
	adds r3, #0x58
	ldrb r1, [r3]
	subs r1, #1
	adds r2, r4, #0
	adds r2, #0x48
	movs r0, #0x1f
	ands r1, r0
	movs r0, #0x20
	rsbs r0, r0, #0
	ldrb r7, [r2]
	ands r0, r7
_08087992:
	orrs r0, r1
	strb r0, [r2]
	mov r0, sb
	movs r1, #0
	ldrsb r1, [r0, r1]
	ldrb r3, [r3]
	adds r1, r3, r1
	adds r1, #1
	adds r2, r4, #0
	adds r2, #0x48
	movs r3, #0x1f
	mov r8, r3
	mov r5, r8
	ands r1, r5
	lsls r1, r1, #5
	ldr r0, _08087A30 @ =0xFFFFFC1F
	ldrh r7, [r2]
	ands r0, r7
	orrs r0, r1
	strh r0, [r2]
	bl GetCgTextFlags
	movs r6, #0xc0
	lsls r6, r6, #8
	ands r0, r6
	lsrs r0, r0, #0xe
	movs r4, #1
	adds r5, r4, #0
	lsls r5, r0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	bl GetCgTextFlags
	ands r0, r6
	lsrs r0, r0, #0xe
	lsls r4, r0
	mov r0, r8
	eors r4, r0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	adds r1, r4, #0
	bl SetCgTextBlendControl
	bl GetCgTextFlags
	movs r1, #0x80
	lsls r1, r1, #0xc
	ands r1, r0
	cmp r1, #0
	bne _08087A04
	movs r0, #0
	bl SetOnHBlankB
	ldr r0, _08087A34 @ =CgText_OnHBlank
	bl SetOnHBlankB
_08087A04:
	bl GetCgTextFlags
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #8
	ands r0, r1
	lsrs r0, r0, #0xe
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08087A2C: .4byte 0x0203E738
_08087A30: .4byte 0xFFFFFC1F
_08087A34: .4byte CgText_OnHBlank
