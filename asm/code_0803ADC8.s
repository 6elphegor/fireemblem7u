	.include "macro.inc"

	.syntax unified

	thumb_func_start AiStaffPhysicRescue
AiStaffPhysicRescue: @ 0x0803ADC8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	str r0, [sp, #0x10]
	mov sb, r1
	movs r0, #0x64
	mov sl, r0
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [sp, #0x18]
	str r1, [sp, #0x14]
	movs r2, #0
	str r2, [sp, #0x1c]
	ldr r4, _0803AF78 @ =0x0203A8EC
	adds r5, r4, #0
	adds r5, #0x7b
	movs r0, #4
	ldrb r3, [r5]
	ands r0, r3
	cmp r0, #0
	beq _0803ADFA
	b _0803AF68
_0803ADFA:
	ldr r0, _0803AF7C @ =0x03004690
	ldr r0, [r0]
	bl sub_0803758C
	ldr r0, [sp, #0x18]
	bl GenerateMagicSealMap
	adds r1, r4, #0
	adds r1, #0x7c
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803AE16
	adds r4, r0, #0
	mov sl, r4
_0803AE16:
	movs r0, #1
	mov r8, r0
_0803AE1A:
	mov r0, r8
	bl GetUnit
	adds r6, r0, #0
	cmp r6, #0
	bne _0803AE28
	b _0803AF38
_0803AE28:
	ldr r0, [r6]
	cmp r0, #0
	bne _0803AE30
	b _0803AF38
_0803AE30:
	movs r1, #0x11
	ldrsb r1, [r6, r1]
	ldr r0, _0803AF80 @ =0x0202E3DC
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x10
	ldrsb r2, [r6, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	ldr r1, _0803AF84 @ =0x0202BD48
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	beq _0803AF38
	ldr r0, [r6, #0xc]
	ldr r1, _0803AF88 @ =0x00010005
	ands r0, r1
	cmp r0, #0
	bne _0803AF38
	movs r0, #4
	ldr r1, _0803AF8C @ =0x0203A967
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0803AE78
	mov r2, sb
	cmp r2, #0
	beq _0803AE78
	adds r0, r6, #0
	bl sub_080BFC70
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803AF38
_0803AE78:
	ldr r3, _0803AF90 @ =0x0203A968
	ldrb r0, [r3]
	cmp r0, #0
	bne _0803AE8A
	movs r0, #1
	ldrb r4, [r6, #0xa]
	ands r0, r4
	cmp r0, #0
	beq _0803AF38
_0803AE8A:
	ldr r7, _0803AF7C @ =0x03004690
	ldr r0, [r7]
	bl GetUnitMagRange
	ldr r2, [r7]
	ldr r1, [r2, #4]
	ldrb r3, [r2, #0x1d]
	ldrb r1, [r1, #0x12]
	adds r1, r3, r1
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r4, #0x10
	ldrsb r4, [r2, r4]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldrb r2, [r6, #0x10]
	ldrb r3, [r6, #0x11]
	str r0, [sp]
	adds r0, r4, #0
	bl AiIsWithinRectDistance
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803AF38
	ldr r0, _0803AF94 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	movs r4, #0x10
	ldrsb r4, [r6, r4]
	movs r5, #0x11
	ldrsb r5, [r6, r5]
	ldr r0, [r7]
	bl GetUnitMagRange
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #1
	bl MapAddInRange
	add r5, sp, #0xc
	adds r0, r5, #0
	bl sub_08037380
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803AF38
	adds r0, r6, #0
	bl GetUnitCurrentHp
	movs r1, #0x64
	adds r4, r0, #0
	muls r4, r1, r4
	adds r0, r6, #0
	bl GetUnitMaxHp
	adds r1, r0, #0
	adds r0, r4, #0
	bl Div
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, sl
	bhi _0803AF38
	mov sl, r0
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r4, [r0, r1]
	str r4, [sp, #0x14]
	movs r3, #2
	ldrsh r2, [r5, r3]
	str r2, [sp, #0x18]
	movs r1, #0x11
	ldrsb r1, [r6, r1]
	ldr r0, _0803AF80 @ =0x0202E3DC
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x10
	ldrsb r2, [r6, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	ldrb r0, [r0]
	str r0, [sp, #0x1c]
_0803AF38:
	movs r4, #1
	add r8, r4
	mov r0, r8
	cmp r0, #0xbf
	bgt _0803AF44
	b _0803AE1A
_0803AF44:
	movs r0, #1
	rsbs r0, r0, #0
	ldr r1, [sp, #0x14]
	cmp r1, r0
	beq _0803AF68
	adds r0, r1, #0
	ldr r1, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	ldr r4, [sp, #0x10]
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #5
	bl AiSetDecision
_0803AF68:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803AF78: .4byte 0x0203A8EC
_0803AF7C: .4byte 0x03004690
_0803AF80: .4byte 0x0202E3DC
_0803AF84: .4byte 0x0202BD48
_0803AF88: .4byte 0x00010005
_0803AF8C: .4byte 0x0203A967
_0803AF90: .4byte 0x0203A968
_0803AF94: .4byte 0x0202E3E8
