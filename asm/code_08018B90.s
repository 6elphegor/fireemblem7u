	.include "macro.inc"

	.syntax unified

	thumb_func_start GetUnitResistance
GetUnitResistance: @ 0x08018B90
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemResBonus
	adds r1, r0, #0
	movs r0, #0x18
	ldrsb r0, [r4, r0]
	adds r0, r0, r1
	adds r4, #0x31
	ldrb r4, [r4]
	lsrs r1, r4, #4
	adds r0, r0, r1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
