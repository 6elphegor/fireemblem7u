	.include "macro.inc"

	.syntax unified

	thumb_func_start ComputeBattleUnitWeaponRankBonuses
ComputeBattleUnitWeaponRankBonuses: @ 0x08028E78
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x48
	ldrh r0, [r1]
	cmp r0, #0
	beq _08028EAE
	bl GetItemType
	adds r1, r0, #0
	cmp r1, #7
	bgt _08028EAE
	adds r0, r4, #0
	adds r0, #0x28
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xfa
	bls _08028EAE
	adds r1, r4, #0
	adds r1, #0x60
	ldrh r0, [r1]
	adds r0, #5
	strh r0, [r1]
	adds r1, #6
	ldrh r0, [r1]
	adds r0, #5
	strh r0, [r1]
_08028EAE:
	pop {r4}
	pop {r0}
	bx r0
