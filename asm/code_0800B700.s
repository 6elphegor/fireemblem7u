	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_ClearSkip
EvtCmd_ClearSkip: @ 0x0800B700
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	cmp r0, #0
	bne _0800B718
	adds r0, r4, #0
	adds r0, #0x5e
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0800B71C
_0800B718:
	movs r0, #0
	b _0800B734
_0800B71C:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _0800B732
	adds r0, r4, #0
	bl Event_FadeOutOfSkip
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #0xff
	strb r0, [r1]
_0800B732:
	movs r0, #2
_0800B734:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
