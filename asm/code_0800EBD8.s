	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_SetVision
EvtCmd_SetVision: @ 0x0800EBD8
	push {lr}
	ldr r1, [r0, #0x30]
	ldrh r2, [r1, #2]
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0800EBF2
	adds r0, r2, #0
	bl SetVisionWithFade
	b _0800EBF8
_0800EBF2:
	adds r0, r2, #0
	bl SetVision
_0800EBF8:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
