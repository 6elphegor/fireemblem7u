	.include "macro.inc"

	.syntax unified

	thumb_func_start BattleGenerateUiStats
BattleGenerateUiStats: @ 0x0802848C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x48
	adds r7, r0, #0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	ldr r1, _080284E8 @ =0x0203A3D8
	movs r3, #0
	movs r2, #0
	movs r0, #4
	strh r0, [r1]
	ldr r0, _080284EC @ =0x0203A470
	mov ip, r0
	adds r0, #0x48
	strh r2, [r0]
	mov r1, ip
	str r2, [r1, #0x4c]
	adds r1, #0x50
	movs r0, #0xff
	strb r0, [r1]
	mov r0, ip
	str r2, [r0, #4]
	ldr r5, _080284F0 @ =0x0203A3F0
	adds r0, r5, #0
	adds r0, #0x53
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	lsls r4, r6, #0x18
	lsrs r0, r4, #0x18
	cmp r0, #4
	bhi _080284F4
	mov r0, sp
	adds r1, r7, #0
	movs r2, #0x48
	bl memcpy
	asrs r1, r4, #0x18
	mov r0, sp
	bl EquipUnitItemSlot
	movs r6, #0
	adds r0, r5, #0
	mov r1, sp
	bl InitBattleUnit
	b _080284FC
	.align 2, 0
_080284E8: .4byte 0x0203A3D8
_080284EC: .4byte 0x0203A470
_080284F0: .4byte 0x0203A3F0
_080284F4:
	adds r0, r5, #0
	adds r1, r7, #0
	bl InitBattleUnit
_080284FC:
	ldr r4, _08028574 @ =0x0203A3F0
	adds r0, r4, #0
	bl SetBattleUnitTerrainBonusesAuto
	lsls r1, r6, #0x18
	asrs r1, r1, #0x18
	adds r0, r4, #0
	bl SetBattleUnitWeapon
	ldr r1, _08028578 @ =0x0203A470
	adds r0, r4, #0
	bl ComputeBattleUnitStats
	adds r5, r4, #0
	adds r5, #0x48
	ldrh r0, [r5]
	bl GetItemIndex
	cmp r0, #0x11
	bne _08028544
	adds r2, r4, #0
	adds r2, #0x5a
	movs r0, #0x14
	ldrsb r0, [r4, r0]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r1, [r2]
	subs r0, r1, r0
	movs r1, #0
	strh r0, [r2]
	adds r0, r4, #0
	adds r0, #0x66
	strh r1, [r0]
	adds r0, #4
	strh r1, [r0]
_08028544:
	ldrh r0, [r5]
	cmp r0, #0
	bne _0802855A
	adds r0, r4, #0
	adds r0, #0x5a
	movs r1, #0xff
	strh r1, [r0]
	adds r0, #6
	strh r1, [r0]
	adds r0, #6
	strh r1, [r0]
_0802855A:
	ldrh r0, [r5]
	bl GetItemWeaponEffect
	cmp r0, #3
	bne _0802856C
	adds r1, r4, #0
	adds r1, #0x5a
	movs r0, #0xff
	strh r0, [r1]
_0802856C:
	add sp, #0x48
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08028574: .4byte 0x0203A3F0
_08028578: .4byte 0x0203A470
