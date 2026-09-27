	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_ClearFlag
EvtCmd_ClearFlag: @ 0x0800E340
	push {lr}
	ldr r0, [r0, #0x30]
	ldrh r0, [r0, #2]
	bl ClearFlag
	movs r0, #0
	pop {r1}
	bx r1
