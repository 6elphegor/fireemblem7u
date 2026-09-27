	.include "macro.inc"

	.syntax unified

	thumb_func_start BattleGenerateBallistaReal
BattleGenerateBallistaReal: @ 0x08028410
	push {lr}
	ldr r3, _08028420 @ =0x0203A3D8
	movs r2, #9
	strh r2, [r3]
	bl BattleGenerateRealInternal
	pop {r0}
	bx r0
	.align 2, 0
_08028420: .4byte 0x0203A3D8
