	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_FadeBgmOut
EvtCmd_FadeBgmOut: @ 0x0800E484
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800E4A2
	ldr r0, [r2, #0x30]
	ldrh r0, [r0, #2]
	bl FadeBgmOut_2
	movs r0, #2
	b _0800E4A4
_0800E4A2:
	movs r0, #0
_0800E4A4:
	pop {r1}
	bx r1
