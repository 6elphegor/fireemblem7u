	.include "macro.inc"

	.syntax unified

	thumb_func_start GetUnitBattleAiPriority
GetUnitBattleAiPriority: @ 0x08034ACC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	movs r7, #0
	movs r0, #0
	mov r8, r0
	movs r6, #0
	ldrh r4, [r5, #0x1e]
	cmp r4, #0
	beq _08034B4A
_08034AE2:
	adds r0, r5, #0
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08034AFE
	adds r0, r5, #0
	adds r1, r4, #0
	bl CanUnitUseStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08034B36
_08034AFE:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	bne _08034B5C
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08034B36
	adds r0, r4, #0
	bl GetItemMaxRange
	cmp r0, #1
	ble _08034B2C
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	b _08034B36
_08034B2C:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
_08034B36:
	adds r6, #1
	cmp r6, #4
	bgt _08034B4A
	lsls r1, r6, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _08034AE2
_08034B4A:
	cmp r7, #0
	beq _08034B52
	movs r0, #0x28
	b _08034B62
_08034B52:
	mov r0, r8
	cmp r0, #0
	bne _08034B60
	movs r0, #0x57
	b _08034B62
_08034B5C:
	movs r0, #0x48
	b _08034B62
_08034B60:
	movs r0, #0x14
_08034B62:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
