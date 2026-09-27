	.include "macro.inc"

	.syntax unified

	thumb_func_start DidBattleUnitBreakWeapon
DidBattleUnitBreakWeapon: @ 0x0802A814
	adds r1, r0, #0
	movs r0, #0x13
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0802A82A
	adds r0, r1, #0
	adds r0, #0x7d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _0802A82C
_0802A82A:
	movs r0, #0
_0802A82C:
	bx lr
	.align 2, 0
