	.include "macro.inc"

	.syntax unified

	thumb_func_start AiScriptCmd_04_ActionOnSelectedCharacter
AiScriptCmd_04_ActionOnSelectedCharacter: @ 0x08037A68
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r0, #0x64
	bl RandNext
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _08037AB8 @ =0x030013B8
	ldr r1, [r5]
	ldrb r1, [r1, #1]
	cmp r0, r1
	bhi _08037AE8
	ldr r0, _08037ABC @ =AiIsUnitEnemy
	bl AiTryDoStaff
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #0
	bne _08037AF0
	ldr r0, [r5]
	ldrh r0, [r0, #4]
	bl AiUnitWithCharIdExists
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08037AD0
	ldr r0, [r5]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	ldr r0, [r0, #0xc]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08037AC4
	ldr r0, _08037AC0 @ =0x0203A8EC
	adds r0, #0x86
	movs r1, #3
	b _08037AD6
	.align 2, 0
_08037AB8: .4byte 0x030013B8
_08037ABC: .4byte AiIsUnitEnemy
_08037AC0: .4byte 0x0203A8EC
_08037AC4:
	ldr r0, _08037ACC @ =AiIsUnitEnemyAndScrCharId
	bl AiAttemptOffensiveAction
	b _08037AF0
	.align 2, 0
_08037ACC: .4byte AiIsUnitEnemyAndScrCharId
_08037AD0:
	ldr r0, _08037AE0 @ =0x0203A8EC
	adds r0, #0x86
	movs r1, #1
_08037AD6:
	strb r1, [r0]
	ldr r0, _08037AE4 @ =0x030013B0
	strb r4, [r0]
	b _08037AF0
	.align 2, 0
_08037AE0: .4byte 0x0203A8EC
_08037AE4: .4byte 0x030013B0
_08037AE8:
	ldr r0, _08037AFC @ =0x0203A8EC
	adds r0, #0x79
	movs r1, #4
	strb r1, [r0]
_08037AF0:
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08037AFC: .4byte 0x0203A8EC
