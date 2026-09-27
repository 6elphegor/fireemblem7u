	.include "macro.inc"

	.syntax unified

	thumb_func_start ComputeBattleUnitAttack
ComputeBattleUnitAttack: @ 0x08028B10
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r5, #0
	adds r6, #0x48
	ldrh r0, [r6]
	bl GetItemMight
	adds r1, r5, #0
	adds r1, #0x54
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r1, r1, r0
	adds r0, r5, #0
	adds r0, #0x5a
	strh r1, [r0]
	ldrh r0, [r6]
	adds r1, r4, #0
	bl IsItemEffectiveAgainst
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08028B52
	ldrh r0, [r6]
	bl GetItemIndex
	adds r1, r5, #0
	adds r1, #0x5a
	ldrh r2, [r1]
	lsls r0, r2, #1
	strh r0, [r1]
_08028B52:
	adds r1, r5, #0
	adds r1, #0x5a
	movs r0, #0x14
	ldrsb r0, [r5, r0]
	ldrh r2, [r1]
	adds r0, r2, r0
	strh r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
