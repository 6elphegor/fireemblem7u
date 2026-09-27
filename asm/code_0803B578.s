	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803B578
sub_0803B578: @ 0x0803B578
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	str r0, [sp, #0x10]
	mov sb, r1
	movs r0, #0
	mov sl, r0
	movs r1, #0
	str r1, [sp, #0x14]
	movs r2, #0
	str r2, [sp, #0x18]
	movs r3, #0
	str r3, [sp, #0x1c]
	ldr r1, _0803B6EC @ =0x0203A8EC
	adds r1, #0x7b
	movs r0, #4
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0803B5A8
	b _0803B6DA
_0803B5A8:
	ldr r0, _0803B6F0 @ =0x03004690
	ldr r0, [r0]
	bl sub_0803758C
	movs r0, #1
	rsbs r0, r0, #0
	bl GenerateMagicSealMap
	movs r4, #1
	mov r8, r4
_0803B5BC:
	mov r0, r8
	bl GetUnit
	adds r6, r0, #0
	cmp r6, #0
	beq _0803B6AA
	ldr r0, [r6]
	cmp r0, #0
	beq _0803B6AA
	ldr r0, [r6, #0xc]
	ldr r1, _0803B6F4 @ =0x00010005
	ands r0, r1
	cmp r0, #0
	bne _0803B6AA
	ldr r1, _0803B6EC @ =0x0203A8EC
	adds r1, #0x7b
	movs r0, #4
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0803B5F8
	mov r0, sb
	cmp r0, #0
	beq _0803B5F8
	adds r0, r6, #0
	bl sub_080BFC70
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803B6AA
_0803B5F8:
	adds r1, r6, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0803B6AA
	ldr r7, _0803B6F0 @ =0x03004690
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
	beq _0803B6AA
	adds r0, r6, #0
	bl sub_0803B340
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803B6AA
	ldr r0, [r7]
	adds r1, r6, #0
	bl GetOffensiveStaffAccuracy
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #4
	bls _0803B6AA
	movs r0, #8
	ldrsb r0, [r6, r0]
	adds r0, r1, r0
	cmp r0, sl
	blt _0803B6AA
	ldr r0, _0803B6F8 @ =0x0202E3E8
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
	add r4, sp, #0xc
	adds r0, r4, #0
	bl sub_08037380
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803B6AA
	ldrb r0, [r6, #8]
	mov sl, r0
	add r0, sp, #0xc
	movs r2, #0
	ldrsh r1, [r0, r2]
	str r1, [sp, #0x14]
	movs r0, #2
	ldrsh r3, [r4, r0]
	str r3, [sp, #0x18]
	ldrb r6, [r6, #0xb]
	lsls r6, r6, #0x18
	asrs r6, r6, #0x18
	str r6, [sp, #0x1c]
_0803B6AA:
	movs r1, #1
	add r8, r1
	mov r2, r8
	cmp r2, #0xbf
	bgt _0803B6B6
	b _0803B5BC
_0803B6B6:
	mov r3, sl
	cmp r3, #0
	beq _0803B6DA
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	ldr r4, [sp, #0x1c]
	lsls r3, r4, #0x18
	lsrs r3, r3, #0x18
	ldr r4, [sp, #0x10]
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #5
	bl AiSetDecision
_0803B6DA:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803B6EC: .4byte 0x0203A8EC
_0803B6F0: .4byte 0x03004690
_0803B6F4: .4byte 0x00010005
_0803B6F8: .4byte 0x0202E3E8
