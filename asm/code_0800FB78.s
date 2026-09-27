	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_SetFightScriptOverride
EvtCmd_SetFightScriptOverride: @ 0x0800FB78
	push {lr}
	ldr r0, [r0, #0x30]
	ldr r0, [r0, #4]
	bl SetScriptedBattle
	movs r0, #0
	pop {r1}
	bx r1
