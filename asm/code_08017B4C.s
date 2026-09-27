	.include "macro.inc"

	.syntax unified

	thumb_func_start UnitApplyBonusLevels
UnitApplyBonusLevels: @ 0x08017B4C
	push {r4, lr}
	adds r4, r0, #0
	adds r2, r1, #0
	ldr r0, [r4, #4]
	ldrb r1, [r0, #4]
	adds r0, r4, #0
	bl UnitAutolevelCore
	adds r0, r4, #0
	bl UnitCheckStatCaps
	adds r0, r4, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemHpBonus
	movs r1, #0x12
	ldrsb r1, [r4, r1]
	adds r1, r1, r0
	strb r1, [r4, #0x13]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
