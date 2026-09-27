	.include "macro.inc"

	.syntax unified

	thumb_func_start WeaponSelectMenu_IsAvailable
WeaponSelectMenu_IsAvailable: @ 0x08021BA8
	push {r4, r5, lr}
	ldr r5, _08021BE8 @ =0x03004690
	ldr r0, [r5]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08021BEC
	ldr r0, [r5]
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08021BEC
	ldr r0, [r5]
	adds r1, r4, #0
	bl ListAttackTargetsForWeapon
	bl CountTargets
	cmp r0, #0
	beq _08021BEC
	movs r0, #1
	b _08021BEE
	.align 2, 0
_08021BE8: .4byte 0x03004690
_08021BEC:
	movs r0, #3
_08021BEE:
	pop {r4, r5}
	pop {r1}
	bx r1
