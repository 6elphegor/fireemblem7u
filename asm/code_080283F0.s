	.include "macro.inc"

	.syntax unified

	thumb_func_start BattleGenerateBallistaSimulation
BattleGenerateBallistaSimulation: @ 0x080283F0
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r5, _0802840C @ =0x0203A3D8
	movs r6, #0
	movs r4, #0xa
	strh r4, [r5]
	str r6, [sp]
	bl BattleGenerateSimulationInternal
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802840C: .4byte 0x0203A3D8
