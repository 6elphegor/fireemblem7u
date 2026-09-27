	.include "macro.inc"

	.syntax unified

	thumb_func_start ComputeBattleUnitSpeed
ComputeBattleUnitSpeed: @ 0x08028B68
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemWeight
	adds r1, r0, #0
	movs r0, #0x1a
	ldrsb r0, [r4, r0]
	subs r1, r1, r0
	cmp r1, #0
	bge _08028B82
	movs r1, #0
_08028B82:
	movs r0, #0x16
	ldrsb r0, [r4, r0]
	subs r0, r0, r1
	adds r1, r4, #0
	adds r1, #0x5e
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08028B98
	movs r0, #0
	strh r0, [r1]
_08028B98:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
