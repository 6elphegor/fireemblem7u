	.include "macro.inc"

	.syntax unified

	thumb_func_start AiGetInRangeCombatPositionScoreComponent
AiGetInRangeCombatPositionScoreComponent: @ 0x080392B4
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r2, r4]
	subs r3, r4, r0
	cmp r3, #0
	bge _080392C2
	subs r3, r0, r4
_080392C2:
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	subs r4, r0, r1
	cmp r4, #0
	blt _080392D0
	adds r5, r3, r4
	b _080392D4
_080392D0:
	subs r0, r1, r0
	adds r5, r3, r0
_080392D4:
	adds r0, r2, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _080392FA
	adds r0, r4, #0
	bl GetItemMaxRange
	cmp r5, r0
	bgt _080392F6
	adds r0, r4, #0
	bl GetItemMinRange
	cmp r5, r0
	bge _080392FA
_080392F6:
	movs r0, #0x32
	b _080392FC
_080392FA:
	movs r0, #0
_080392FC:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
