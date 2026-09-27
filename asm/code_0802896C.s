	.include "macro.inc"

	.syntax unified

	thumb_func_start SetBattleUnitWeaponBallista
SetBattleUnitWeaponBallista: @ 0x0802896C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r0, #0x10
	ldrsb r0, [r6, r0]
	movs r1, #0x11
	ldrsb r1, [r6, r1]
	bl GetBallistaItemAt
	adds r4, r6, #0
	adds r4, #0x48
	movs r5, #0
	strh r0, [r4]
	adds r1, r6, #0
	adds r1, #0x4a
	strh r0, [r1]
	ldrh r0, [r4]
	bl GetItemAttributes
	str r0, [r6, #0x4c]
	ldrh r0, [r4]
	bl GetItemType
	adds r1, r6, #0
	adds r1, #0x50
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x52
	strb r5, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
