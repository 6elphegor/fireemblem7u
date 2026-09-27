	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_BreakItemSeal
EvtCmd_BreakItemSeal: @ 0x0800EC10
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x30]
	ldr r0, [r1, #4]
	ldrb r1, [r1, #8]
	bl BreakItemSealForPid
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #0xc]
	bl SetFlag
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
