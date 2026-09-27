	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_SetFlag
EvtCmd_SetFlag: @ 0x0800E330
	push {lr}
	ldr r0, [r0, #0x30]
	ldrh r0, [r0, #2]
	bl SetFlag
	movs r0, #0
	pop {r1}
	bx r1
