	.include "macro.inc"

	.syntax unified

	thumb_func_start AiScriptCmd_05_DoStandardAction
AiScriptCmd_05_DoStandardAction: @ 0x08037B00
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x64
	bl RandNext
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08037B34 @ =0x030013B8
	ldr r1, [r1]
	ldrb r2, [r1, #1]
	cmp r0, r2
	bhi _08037B58
	ldr r0, [r1, #8]
	cmp r0, #0
	bne _08037B3C
	ldr r4, _08037B38 @ =AiIsUnitEnemy
	adds r0, r4, #0
	bl AiTryDoStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08037B60
	adds r0, r4, #0
	bl AiAttemptOffensiveAction
	b _08037B60
	.align 2, 0
_08037B34: .4byte 0x030013B8
_08037B38: .4byte AiIsUnitEnemy
_08037B3C:
	ldr r0, _08037B50 @ =AiIsUnitEnemyOrInScrList
	bl AiTryDoStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08037B60
	ldr r0, _08037B54 @ =AiIsUnitEnemyAndNotInScrList
	bl AiAttemptOffensiveAction
	b _08037B60
	.align 2, 0
_08037B50: .4byte AiIsUnitEnemyOrInScrList
_08037B54: .4byte AiIsUnitEnemyAndNotInScrList
_08037B58:
	ldr r0, _08037B6C @ =0x0203A8EC
	adds r0, #0x79
	movs r1, #4
	strb r1, [r0]
_08037B60:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08037B6C: .4byte 0x0203A8EC
