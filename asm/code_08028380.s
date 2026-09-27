	.include "macro.inc"

	.syntax unified

	thumb_func_start BattleApplyGameStateUpdates
BattleApplyGameStateUpdates: @ 0x08028380
	push {lr}
	bl BattleApplyUnitUpdates
	bl BattleApplyBallistaUpdates
	ldr r0, _0802839C @ =0x0203A3F0
	ldr r1, _080283A0 @ =0x0203A470
	bl BattlePrintDebugUnitInfo
	bl BattlePrintDebugHitInfo
	pop {r0}
	bx r0
	.align 2, 0
_0802839C: .4byte 0x0203A3F0
_080283A0: .4byte 0x0203A470
