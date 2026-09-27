	.include "macro.inc"

	.syntax unified

	thumb_func_start BattleHitAdvance
BattleHitAdvance: @ 0x0802AB90
	ldr r1, _0802AB9C @ =0x0203A50C
	ldr r0, [r1]
	adds r0, #4
	str r0, [r1]
	bx lr
	.align 2, 0
_0802AB9C: .4byte 0x0203A50C
