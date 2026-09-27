	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_EnqueueEvent
EvtCmd_EnqueueEvent: @ 0x0800EC30
	push {lr}
	ldr r0, [r0, #0x30]
	adds r0, #4
	bl sub_0800AF5C
	movs r0, #0
	pop {r1}
	bx r1
