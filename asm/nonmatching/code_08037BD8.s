	.include "macro.inc"

	.syntax unified

	thumb_func_start AiScriptCmd_08_DoStandardActionAgainstClass
AiScriptCmd_08_DoStandardActionAgainstClass: @ 0x08037BD8
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x64
	bl RandNext
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08037C08 @ =0x030013B8
	ldr r1, [r1]
	ldrb r1, [r1, #1]
	cmp r0, r1
	bhi _08037C10
	ldr r4, _08037C0C @ =AiIsUnitEnemyAndScrClassId
	adds r0, r4, #0
	bl AiTryDoStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08037C18
	adds r0, r4, #0
	bl AiAttemptOffensiveAction
	b _08037C18
	.align 2, 0
_08037C08: .4byte 0x030013B8
_08037C0C: .4byte AiIsUnitEnemyAndScrClassId
_08037C10:
	ldr r0, _08037C24 @ =0x0203A8EC
	adds r0, #0x79
	movs r1, #4
	strb r1, [r0]
_08037C18:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08037C24: .4byte 0x0203A8EC
