	.include "macro.inc"

	.syntax unified

	thumb_func_start ArenaGetMatchupGoldValue
ArenaGetMatchupGoldValue: @ 0x0802F0D4
	ldr r0, _0802F0DC @ =0x0203A7F4
	movs r1, #8
	ldrsh r0, [r0, r1]
	bx lr
	.align 2, 0
_0802F0DC: .4byte 0x0203A7F4
