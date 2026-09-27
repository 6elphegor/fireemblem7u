	.include "macro.inc"

	.syntax unified

	thumb_func_start BattleGenerateSimulation
BattleGenerateSimulation: @ 0x080283A4
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r2, #0
	bge _080283BC
	cmp r3, #0
	bge _080283BC
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	movs r3, #0x11
	ldrsb r3, [r4, r3]
_080283BC:
	ldr r0, _080283D8 @ =0x0203A3D8
	movs r1, #2
	strh r1, [r0]
	ldr r0, [sp, #0x10]
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	bl BattleGenerateSimulationInternal
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080283D8: .4byte 0x0203A3D8
