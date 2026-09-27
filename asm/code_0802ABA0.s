	.include "macro.inc"

	.syntax unified

	thumb_func_start BattleHitTerminate
BattleHitTerminate: @ 0x0802ABA0
	ldr r0, _0802ABB0 @ =0x0203A50C
	ldr r1, [r0]
	adds r1, #4
	str r1, [r0]
	movs r0, #0x80
	strb r0, [r1, #2]
	bx lr
	.align 2, 0
_0802ABB0: .4byte 0x0203A50C
