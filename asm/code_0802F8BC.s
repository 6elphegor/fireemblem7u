	.include "macro.inc"

	.syntax unified

	thumb_func_start BATTLE_PostCombatDeathFades
BATTLE_PostCombatDeathFades: @ 0x0802F8BC
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r0, #0
	str r0, [r6, #0x54]
	ldr r7, _0802F944 @ =0x0203A3F0
	adds r0, r7, #0
	bl DidUnitDie
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802F8E6
	ldr r0, _0802F948 @ =0x08C9D00C
	bl Proc_Find
	adds r4, r0, #0
	bl StartMuDeathFade
	str r4, [r6, #0x54]
	adds r0, r7, #0
	bl TryRemoveUnitFromBallista
_0802F8E6:
	ldr r5, _0802F94C @ =0x0203A470
	adds r0, r5, #0
	bl DidUnitDie
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802F93E
	movs r0, #0xb
	ldrsb r0, [r5, r0]
	bl GetUnit
	ldr r1, [r0, #0xc]
	movs r2, #1
	orrs r1, r2
	str r1, [r0, #0xc]
	bl TryRemoveUnitFromBallista
	bl RefreshUnitSprites
	adds r0, r5, #0
	bl StartMu
	adds r4, r0, #0
	movs r0, #0x10
	ldrsb r0, [r7, r0]
	movs r1, #0x11
	ldrsb r1, [r7, r1]
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	movs r3, #0x11
	ldrsb r3, [r5, r3]
	bl GetFacingFromTo
	ldr r1, _0802F950 @ =0x02033E00
	strb r0, [r1]
	movs r0, #4
	strb r0, [r1, #1]
	adds r0, r4, #0
	bl SetMuMoveScript
	adds r0, r4, #0
	bl StartMuDeathFade
	str r4, [r6, #0x54]
_0802F93E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802F944: .4byte 0x0203A3F0
_0802F948: .4byte 0x08C9D00C
_0802F94C: .4byte 0x0203A470
_0802F950: .4byte 0x02033E00
