	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_ClearTalk
EvtCmd_ClearTalk: @ 0x0800B6B4
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r2, #0
	adds r4, #0x4c
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0800B6D4
	adds r0, r2, #0
	bl Event_FadeOutOfBackgroundTalk
	movs r0, #0xff
	strb r0, [r4]
	b _0800B6F4
_0800B6D4:
	adds r0, r2, #0
	bl EventClearTalkDisplayed
	ldr r2, _0800B6FC @ =0x03002870
	movs r0, #1
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
_0800B6F4:
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800B6FC: .4byte 0x03002870
