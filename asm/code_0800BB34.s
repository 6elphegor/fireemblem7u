	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_TalkGeneric
EvtCmd_TalkGeneric: @ 0x0800BB34
	push {r4, lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	ldr r3, [r0, #4]
	adds r1, r2, #0
	adds r1, #0x5e
	ldr r0, _0800BB6C @ =0x0000FFFD
	ldrh r4, [r1]
	ands r0, r4
	strh r0, [r1]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0800BB74
	ldr r0, _0800BB70 @ =0x03004690
	ldr r0, [r0]
	ldr r0, [r0]
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r1, [r0]
	adds r0, r2, #0
	movs r2, #1
	bl EventStartTalk
	movs r0, #2
	b _0800BB76
	.align 2, 0
_0800BB6C: .4byte 0x0000FFFD
_0800BB70: .4byte 0x03004690
_0800BB74:
	movs r0, #0
_0800BB76:
	pop {r4}
	pop {r1}
	bx r1
