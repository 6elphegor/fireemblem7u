	.include "macro.inc"

	.syntax unified

	thumb_func_start AiAttemptCombatWithinMovement
AiAttemptCombatWithinMovement: @ 0x080387B0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	str r0, [sp, #0x24]
	add r2, sp, #0x18
	movs r5, #0
	strb r5, [r2, #2]
	str r5, [r2, #8]
	ldr r6, _08038954 @ =0x03004690
	ldr r0, [r6]
	ldr r0, [r0, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	mov r8, r2
	cmp r0, #0
	beq _08038814
	ldr r4, _08038958 @ =0x0202E3E4
	ldr r0, [r4]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	ldr r2, [r6]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	strb r5, [r0]
	ldr r1, [r6]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetRiddenBallistaAt
	cmp r0, #0
	bne _080388D2
	ldr r0, [r6]
	bl TryRemoveUnitFromBallista
_08038814:
	ldr r0, _0803895C @ =0x0202E3E8
	ldr r0, [r0]
	bl SetWorkingBmMap
	movs r0, #0
	mov sb, r0
	ldr r0, [r6]
	ldrh r5, [r0, #0x1e]
	cmp r5, #0
	beq _080388D2
	add r1, sp, #0xc
	mov sl, r1
_0803882C:
	ldr r2, _08038954 @ =0x03004690
	ldr r0, [r2]
	adds r1, r5, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	mov r7, sb
	adds r7, #1
	cmp r0, #0
	beq _080388BC
	mov r4, sb
	mov r3, sl
	strh r4, [r3, #4]
	movs r6, #1
_08038848:
	adds r0, r6, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _080388B6
	ldr r0, [r4]
	cmp r0, #0
	beq _080388B6
	ldr r0, [r4, #0xc]
	ldr r1, _08038960 @ =0x00010025
	ands r0, r1
	cmp r0, #0
	bne _080388B6
	adds r0, r4, #0
	ldr r1, [sp, #0x24]
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080388B6
	ldr r2, _08038954 @ =0x03004690
	ldr r0, [r2]
	adds r1, r4, #0
	adds r2, r5, #0
	bl AiReachesByBirdsEyeDistance
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080388B6
	adds r0, r4, #0
	adds r1, r5, #0
	bl AiFillReversedAttackRangeMap
	ldrb r0, [r4, #0xb]
	mov r3, sl
	strb r0, [r3, #2]
	add r0, sp, #0xc
	bl AiSimulateBestBattleAgainstTarget
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080388B6
	ldr r1, [sp, #0x14]
	mov r4, r8
	ldr r0, [r4, #8]
	cmp r1, r0
	blo _080388B6
	mov r1, r8
	add r0, sp, #0xc
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	mov r1, sb
	mov r0, r8
	strh r1, [r0, #4]
_080388B6:
	adds r6, #1
	cmp r6, #0xbf
	ble _08038848
_080388BC:
	mov sb, r7
	cmp r7, #4
	bgt _080388D2
	ldr r2, _08038954 @ =0x03004690
	ldr r0, [r2]
	lsls r1, r7, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r5, [r0]
	cmp r5, #0
	bne _0803882C
_080388D2:
	ldr r0, _08038954 @ =0x03004690
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r1, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0803890A
	ldr r0, [sp, #0x24]
	add r1, sp, #0xc
	bl AiAttemptBallistaCombat
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803890A
	ldr r1, [sp, #0x14]
	mov r3, r8
	ldr r0, [r3, #8]
	cmp r1, r0
	blo _0803890A
	mov r1, r8
	add r0, sp, #0xc
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
_0803890A:
	mov r1, r8
	ldr r0, [r1, #8]
	cmp r0, #0
	bne _08038918
	ldrb r0, [r1, #2]
	cmp r0, #0
	beq _08038944
_08038918:
	mov r4, r8
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	ldrb r3, [r4, #2]
	ldrb r2, [r4, #4]
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #1
	bl AiSetDecision
	movs r1, #4
	ldrsb r1, [r4, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08038944
	ldr r0, _08038954 @ =0x03004690
	ldr r0, [r0]
	bl TryRemoveUnitFromBallista
_08038944:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08038954: .4byte 0x03004690
_08038958: .4byte 0x0202E3E4
_0803895C: .4byte 0x0202E3E8
_08038960: .4byte 0x00010025
