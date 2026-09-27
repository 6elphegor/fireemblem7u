	.include "macro.inc"

	.syntax unified

	thumb_func_start BattleGenerateReal
BattleGenerateReal: @ 0x080283DC
	push {lr}
	ldr r3, _080283EC @ =0x0203A3D8
	movs r2, #1
	strh r2, [r3]
	bl BattleGenerateRealInternal
	pop {r0}
	bx r0
	.align 2, 0
_080283EC: .4byte 0x0203A3D8
