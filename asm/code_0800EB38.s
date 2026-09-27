	.include "macro.inc"

	.syntax unified

	thumb_func_start EventScriptedBattleWaitB
EventScriptedBattleWaitB: @ 0x0800EB38
	push {lr}
	movs r1, #0
	str r1, [r0, #0x40]
	movs r1, #6
	bl Proc_Mark
	bl AiEndMuAndRefreshUnits
	pop {r0}
	bx r0
