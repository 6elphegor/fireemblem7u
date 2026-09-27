	.include "macro.inc"

	.syntax unified

	thumb_func_start BattleIsTriangleAttack
BattleIsTriangleAttack: @ 0x0802A804
	ldr r0, _0802A810 @ =0x0203A4F0
	ldrh r0, [r0]
	lsrs r0, r0, #0xa
	movs r1, #1
	ands r0, r1
	bx lr
	.align 2, 0
_0802A810: .4byte 0x0203A4F0
