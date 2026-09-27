	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_ExitMap
EvtCmd_ExitMap: @ 0x0800E88C
	push {lr}
	bl Event_SetExitMap
	movs r0, #0
	pop {r1}
	bx r1
