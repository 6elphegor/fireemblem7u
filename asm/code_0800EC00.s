	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_SetVisionInstant
EvtCmd_SetVisionInstant: @ 0x0800EC00
	push {lr}
	ldr r0, [r0, #0x30]
	ldrh r0, [r0, #2]
	bl SetVision
	movs r0, #0
	pop {r1}
	bx r1
