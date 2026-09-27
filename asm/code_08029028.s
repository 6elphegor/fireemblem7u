	.include "macro.inc"

	.syntax unified

	thumb_func_start BattleGetBattleUnitOrder
BattleGetBattleUnitOrder: @ 0x08029028
	ldr r2, _08029034 @ =0x0203A3F0
	str r2, [r0]
	ldr r0, _08029038 @ =0x0203A470
	str r0, [r1]
	bx lr
	.align 2, 0
_08029034: .4byte 0x0203A3F0
_08029038: .4byte 0x0203A470
