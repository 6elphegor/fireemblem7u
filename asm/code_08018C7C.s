	.include "macro.inc"

	.syntax unified

	thumb_func_start AddUnitHp
AddUnitHp: @ 0x08018C7C
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0x13
	ldrsb r4, [r5, r4]
	adds r4, r4, r1
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemHpBonus
	movs r1, #0x12
	ldrsb r1, [r5, r1]
	adds r1, r1, r0
	cmp r4, r1
	ble _08018CB0
	adds r0, r5, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemHpBonus
	movs r1, #0x12
	ldrsb r1, [r5, r1]
	adds r4, r1, r0
_08018CB0:
	cmp r4, #0
	bge _08018CB6
	movs r4, #0
_08018CB6:
	strb r4, [r5, #0x13]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
