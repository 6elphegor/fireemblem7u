	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_TalkByFunc
EvtCmd_TalkByFunc: @ 0x0800BD84
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	ldr r0, _0800BDA0 @ =0x0000FFFD
	ldrh r2, [r1]
	ands r0, r2
	strh r0, [r1]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0800BDA4
	movs r0, #0
	b _0800BDCE
	.align 2, 0
_0800BDA0: .4byte 0x0000FFFD
_0800BDA4:
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl _call_via_r0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800BDC0
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #8]
	adds r0, r4, #0
	movs r2, #1
	bl EventStartTalk
	b _0800BDCC
_0800BDC0:
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #0xc]
	adds r0, r4, #0
	movs r2, #1
	bl EventStartTalk
_0800BDCC:
	movs r0, #2
_0800BDCE:
	pop {r4}
	pop {r1}
	bx r1
