	.include "macro.inc"

	.syntax unified

	thumb_func_start EventScriptedBattleWait
EventScriptedBattleWait: @ 0x0800EB04
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x52
	movs r1, #0
	ldrsh r4, [r0, r1]
	bl GetGameLock
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	bne _0800EB28
	ldr r0, _0800EB30 @ =EventScriptedBattleWaitB
	str r0, [r5, #0x40]
	bl BattleApplyUnitUpdates
	ldr r1, _0800EB34 @ =0x0203A85C
	movs r0, #0
	str r0, [r1, #0x18]
_0800EB28:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800EB30: .4byte EventScriptedBattleWaitB
_0800EB34: .4byte 0x0203A85C
