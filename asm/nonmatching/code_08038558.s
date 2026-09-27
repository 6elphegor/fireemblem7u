	.include "macro.inc"

	.syntax unified

	thumb_func_start AiAttemptOffensiveAction
AiAttemptOffensiveAction: @ 0x08038558
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	str r0, [sp, #0x24]
	add r0, sp, #0x18
	movs r5, #0
	strb r5, [r0, #2]
	str r5, [r0, #8]
	ldr r6, _080385C0 @ =0x03004690
	ldr r3, [r6]
	ldr r1, [r3, #0xc]
	movs r2, #0x80
	lsls r2, r2, #4
	ands r1, r2
	cmp r1, #0
	beq _080385C8
	ldr r4, _080385C4 @ =0x0202E3E4
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
	beq _080385B6
	b _0803871E
_080385B6:
	ldr r0, [r6]
	bl TryRemoveUnitFromBallista
	b _0803865E
	.align 2, 0
_080385C0: .4byte 0x03004690
_080385C4: .4byte 0x0202E3E4
_080385C8:
	ldr r0, [r3]
	ldr r1, [r3, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _080385FE
	adds r0, r3, #0
	bl GetUnitItemCount
	cmp r0, #4
	bgt _080385FE
	ldr r0, [r6]
	bl RevertMapChange
	bl sub_0801A0FC
	bl AiAttemptStealActionWithinMovement
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _080385FE
	movs r0, #0
	b _08038792
_080385FE:
	ldr r1, _08038634 @ =0x0203A8EC
	adds r1, #0x7b
	movs r0, #2
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08038640
	ldr r4, _08038638 @ =0x0202E3E4
	ldr r0, [r4]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	ldr r0, _0803863C @ =0x03004690
	ldr r2, [r0]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	b _08038648
	.align 2, 0
_08038634: .4byte 0x0203A8EC
_08038638: .4byte 0x0202E3E4
_0803863C: .4byte 0x03004690
_08038640:
	ldr r0, _080387A4 @ =0x03004690
	ldr r0, [r0]
	bl RevertMapChange
_08038648:
	ldr r0, _080387A4 @ =0x03004690
	ldr r0, [r0]
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803865E
	movs r0, #1
	rsbs r0, r0, #0
	bl GenerateMagicSealMap
_0803865E:
	ldr r0, _080387A8 @ =0x0202E3E8
	ldr r0, [r0]
	bl SetWorkingBmMap
	movs r0, #0
	mov r8, r0
	ldr r1, _080387A4 @ =0x03004690
	ldr r0, [r1]
	ldrh r5, [r0, #0x1e]
	cmp r5, #0
	beq _0803871E
	mov sl, r1
	add r1, sp, #0xc
	mov sb, r1
_0803867A:
	mov r2, sl
	ldr r0, [r2]
	adds r1, r5, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	mov r7, r8
	adds r7, #1
	cmp r0, #0
	beq _08038708
	mov r4, r8
	mov r3, sb
	strh r4, [r3, #4]
	movs r6, #1
_08038696:
	adds r0, r6, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _08038702
	ldr r0, [r4]
	cmp r0, #0
	beq _08038702
	ldr r0, [r4, #0xc]
	ldr r1, _080387AC @ =0x00010025
	ands r0, r1
	cmp r0, #0
	bne _08038702
	adds r0, r4, #0
	ldr r1, [sp, #0x24]
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08038702
	mov r2, sl
	ldr r0, [r2]
	adds r1, r4, #0
	adds r2, r5, #0
	bl AiReachesByBirdsEyeDistance
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08038702
	adds r0, r4, #0
	adds r1, r5, #0
	bl AiFillReversedAttackRangeMap
	ldrb r0, [r4, #0xb]
	mov r3, sb
	strb r0, [r3, #2]
	add r0, sp, #0xc
	bl AiSimulateBestBattleAgainstTarget
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08038702
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0x20]
	cmp r1, r0
	blo _08038702
	add r1, sp, #0x18
	add r0, sp, #0xc
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	mov r0, r8
	mov r4, sp
	strh r0, [r4, #0x1c]
_08038702:
	adds r6, #1
	cmp r6, #0xbf
	ble _08038696
_08038708:
	mov r8, r7
	cmp r7, #4
	bgt _0803871E
	mov r1, sl
	ldr r0, [r1]
	lsls r1, r7, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r5, [r0]
	cmp r5, #0
	bne _0803867A
_0803871E:
	ldr r0, _080387A4 @ =0x03004690
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r1, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08038754
	ldr r0, [sp, #0x24]
	add r1, sp, #0xc
	bl AiAttemptBallistaCombat
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08038754
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0x20]
	cmp r1, r0
	blo _08038754
	add r1, sp, #0x18
	add r0, sp, #0xc
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
_08038754:
	add r1, sp, #0x18
	ldr r0, [r1, #8]
	cmp r0, #0
	bne _08038762
	ldrb r0, [r1, #2]
	cmp r0, #0
	beq _08038792
_08038762:
	mov r1, sp
	ldrb r0, [r1, #0x18]
	ldrb r1, [r1, #0x19]
	mov r2, sp
	ldrb r3, [r2, #0x1a]
	ldrb r2, [r2, #0x1c]
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #1
	bl AiSetDecision
	mov r3, sp
	movs r1, #0x1c
	ldrsb r1, [r3, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08038792
	ldr r0, _080387A4 @ =0x03004690
	ldr r0, [r0]
	bl TryRemoveUnitFromBallista
_08038792:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080387A4: .4byte 0x03004690
_080387A8: .4byte 0x0202E3E8
_080387AC: .4byte 0x00010025
