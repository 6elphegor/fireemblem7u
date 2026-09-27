	.include "macro.inc"

	.syntax unified

	thumb_func_start BattleUnitTargetSetEquippedWeapon
BattleUnitTargetSetEquippedWeapon: @ 0x0802A0A4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x4a
	ldrh r0, [r4]
	cmp r0, #0
	bne _0802A0F2
	adds r0, r5, #0
	bl GetUnitEquippedWeapon
	strh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0802A0F2
	adds r0, r5, #0
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802A0F2
	movs r6, #0
	subs r4, #0x2c
_0802A0D0:
	ldrh r1, [r4]
	adds r0, r5, #0
	bl CanUnitUseStaff
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0802A0EA
	ldrh r1, [r4]
	adds r0, r5, #0
	adds r0, #0x4a
	strh r1, [r0]
	b _0802A0F2
_0802A0EA:
	adds r4, #2
	adds r6, #1
	cmp r6, #4
	ble _0802A0D0
_0802A0F2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
