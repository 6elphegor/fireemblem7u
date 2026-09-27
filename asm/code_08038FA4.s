	.include "macro.inc"

	.syntax unified

	thumb_func_start AiSimulateBattleAgainstTargetAtPosition
AiSimulateBattleAgainstTargetAtPosition: @ 0x08038FA4
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _08038FCC @ =0x0000FFFF
	ldrh r1, [r5, #4]
	cmp r1, r0
	beq _08038FD4
	ldrb r0, [r5, #2]
	bl GetUnit
	adds r1, r0, #0
	ldr r0, _08038FD0 @ =0x03004690
	ldr r0, [r0]
	ldrb r2, [r5]
	ldrb r3, [r5, #1]
	ldrh r4, [r5, #4]
	str r4, [sp]
	bl BattleGenerateSimulation
	b _08038FEA
	.align 2, 0
_08038FCC: .4byte 0x0000FFFF
_08038FD0: .4byte 0x03004690
_08038FD4:
	ldr r0, _08038FFC @ =0x03004690
	ldr r4, [r0]
	ldrb r0, [r5, #2]
	bl GetUnit
	adds r1, r0, #0
	ldrb r2, [r5]
	ldrb r3, [r5, #1]
	adds r0, r4, #0
	bl BattleGenerateBallistaSimulation
_08038FEA:
	adds r0, r5, #0
	bl sub_08038FA0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08039000
	movs r0, #0
	b _08039008
	.align 2, 0
_08038FFC: .4byte 0x03004690
_08039000:
	adds r0, r5, #0
	bl sub_08039240
	movs r0, #1
_08039008:
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
