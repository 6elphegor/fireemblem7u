	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_EnterMap
EvtCmd_EnterMap: @ 0x0800E898
	push {lr}
	bl Event_SetEnterMap
	movs r0, #0
	pop {r1}
	bx r1
