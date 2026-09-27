	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803B3EC
sub_0803B3EC: @ 0x0803B3EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	str r0, [sp, #0x10]
	mov sl, r1
	movs r0, #0
	str r0, [sp, #0x14]
	movs r1, #0
	str r1, [sp, #0x18]
	movs r2, #0
	str r2, [sp, #0x1c]
	movs r3, #0
	str r3, [sp, #0x20]
	ldr r1, _0803B568 @ =0x0203A8EC
	adds r1, #0x7b
	movs r0, #4
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0803B41C
	b _0803B558
_0803B41C:
	ldr r0, _0803B56C @ =0x03004690
	ldr r0, [r0]
	bl sub_0803758C
	movs r0, #1
	rsbs r0, r0, #0
	bl GenerateMagicSealMap
	movs r4, #1
	mov sb, r4
_0803B430:
	mov r0, sb
	bl GetUnit
	adds r6, r0, #0
	cmp r6, #0
	beq _0803B528
	ldr r0, [r6]
	cmp r0, #0
	beq _0803B528
	ldr r0, [r6, #0xc]
	ldr r1, _0803B570 @ =0x00010005
	ands r0, r1
	cmp r0, #0
	bne _0803B528
	ldr r1, _0803B568 @ =0x0203A8EC
	adds r1, #0x7b
	movs r0, #4
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0803B46C
	mov r0, sl
	cmp r0, #0
	beq _0803B46C
	adds r0, r6, #0
	bl sub_080BFC74
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803B528
_0803B46C:
	adds r1, r6, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #3
	beq _0803B528
	adds r0, r6, #0
	bl sub_08037548
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803B528
	ldr r1, _0803B56C @ =0x03004690
	mov r8, r1
	ldr r0, [r1]
	bl GetUnitMagRange
	mov r3, r8
	ldr r2, [r3]
	ldr r1, [r2, #4]
	ldrb r4, [r2, #0x1d]
	ldrb r1, [r1, #0x12]
	adds r1, r4, r1
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
	beq _0803B528
	adds r0, r6, #0
	bl sub_0803B340
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803B528
	adds r0, r6, #0
	bl GetAiSilenceEffectivenessScore
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #0
	beq _0803B528
	ldr r0, [sp, #0x14]
	cmp r7, r0
	blo _0803B528
	ldr r0, _0803B574 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	movs r4, #0x10
	ldrsb r4, [r6, r4]
	movs r5, #0x11
	ldrsb r5, [r6, r5]
	mov r1, r8
	ldr r0, [r1]
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
	beq _0803B528
	str r7, [sp, #0x14]
	add r0, sp, #0xc
	movs r3, #0
	ldrsh r2, [r0, r3]
	str r2, [sp, #0x18]
	movs r1, #2
	ldrsh r0, [r4, r1]
	str r0, [sp, #0x1c]
	ldrb r6, [r6, #0xb]
	lsls r6, r6, #0x18
	asrs r6, r6, #0x18
	str r6, [sp, #0x20]
_0803B528:
	movs r2, #1
	add sb, r2
	mov r3, sb
	cmp r3, #0xbf
	bgt _0803B534
	b _0803B430
_0803B534:
	ldr r4, [sp, #0x14]
	cmp r4, #0
	beq _0803B558
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	ldr r2, [sp, #0x20]
	lsls r3, r2, #0x18
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
_0803B558:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803B568: .4byte 0x0203A8EC
_0803B56C: .4byte 0x03004690
_0803B570: .4byte 0x00010005
_0803B574: .4byte 0x0202E3E8
