	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_RestoreBgm
EvtCmd_RestoreBgm: @ 0x0800E450
	push {lr}
	ldr r0, [r0, #0x30]
	ldrh r0, [r0, #2]
	bl RestoreBgm
	movs r0, #2
	pop {r1}
	bx r1
