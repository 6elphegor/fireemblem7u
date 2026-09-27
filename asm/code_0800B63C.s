	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_BackgroundRandom
EvtCmd_BackgroundRandom: @ 0x0800B63C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800B668
	bl RandNextB
	movs r1, #0x5b
	bl __umodsi3
	adds r4, r0, #0
	bl DisplayBackground
	adds r0, r5, #0
	adds r0, #0x4c
	strb r4, [r0]
	movs r0, #2
	b _0800B66A
_0800B668:
	movs r0, #0
_0800B66A:
	pop {r4, r5}
	pop {r1}
	bx r1
