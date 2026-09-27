	.include "macro.inc"

	.syntax unified

	thumb_func_start BMapDispResume_FromBattleDelayed
BMapDispResume_FromBattleDelayed: @ 0x0802E314
	push {lr}
	bl ApplySystemObjectsGraphics
	ldr r0, _0802E330 @ =0x0203A3F0
	bl StartMu
	bl MU_SetDefaultFacing_Auto
	ldr r0, _0802E334 @ =0x08B96284
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0802E330: .4byte 0x0203A3F0
_0802E334: .4byte 0x08B96284
