	.include "macro.inc"

	.syntax unified

	thumb_func_start InitBattleForecastBattleStats
InitBattleForecastBattleStats: @ 0x0803351C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	adds r6, r0, #0
	ldr r7, _08033660 @ =0x0203A3F0
	adds r0, r7, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemUses
	str r0, [sp, #8]
	ldr r0, _08033664 @ =0x0203A470
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemUses
	str r0, [sp, #0xc]
	add r1, sp, #4
	mov r0, sp
	bl BattleGetFollowUpOrder
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	adds r4, r6, #0
	adds r4, #0x50
	movs r0, #0
	strb r0, [r4]
	adds r1, r6, #0
	adds r1, #0x52
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x48
	ldrh r0, [r0]
	cmp r0, #0
	bne _08033574
	adds r0, r7, #0
	adds r0, #0x7d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080335D2
_08033574:
	add r5, sp, #8
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl BattleForecastHitCountUpdate
	mov r0, r8
	cmp r0, #0
	beq _08033594
	ldr r0, [sp]
	cmp r0, r7
	bne _08033594
	adds r1, r4, #0
	adds r2, r5, #0
	bl BattleForecastHitCountUpdate
_08033594:
	ldr r4, _08033660 @ =0x0203A3F0
	adds r0, r4, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	ldr r1, _08033664 @ =0x0203A470
	bl IsItemEffectiveAgainst
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080335B0
	adds r1, r6, #0
	adds r1, #0x52
	movs r0, #1
	strb r0, [r1]
_080335B0:
	adds r0, r4, #0
	adds r0, #0x53
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _080335D2
	ldr r0, [r4, #0x4c]
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080335D2
	adds r1, r6, #0
	adds r1, #0x52
	movs r0, #1
	strb r0, [r1]
_080335D2:
	adds r4, r6, #0
	adds r4, #0x51
	movs r0, #0
	strb r0, [r4]
	adds r1, r6, #0
	adds r1, #0x53
	strb r0, [r1]
	ldr r5, _08033664 @ =0x0203A470
	adds r0, r5, #0
	adds r0, #0x48
	ldrh r0, [r0]
	adds r7, r1, #0
	cmp r0, #0
	bne _080335FC
	adds r0, r5, #0
	adds r0, #0x7d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08033652
_080335FC:
	add r6, sp, #0xc
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl BattleForecastHitCountUpdate
	mov r0, r8
	cmp r0, #0
	beq _0803361C
	ldr r0, [sp]
	cmp r0, r5
	bne _0803361C
	adds r1, r4, #0
	adds r2, r6, #0
	bl BattleForecastHitCountUpdate
_0803361C:
	ldr r4, _08033664 @ =0x0203A470
	adds r0, r4, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	ldr r1, _08033660 @ =0x0203A3F0
	bl IsItemEffectiveAgainst
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08033634
	movs r0, #1
	strb r0, [r7]
_08033634:
	adds r0, r4, #0
	adds r0, #0x53
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _08033652
	ldr r0, [r4, #0x4c]
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08033652
	movs r0, #1
	strb r0, [r7]
_08033652:
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08033660: .4byte 0x0203A3F0
_08033664: .4byte 0x0203A470
