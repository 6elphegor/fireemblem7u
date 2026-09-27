	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_TalkByMode
EvtCmd_TalkByMode: @ 0x0800B9E4
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	ldr r0, _0800BA00 @ =0x0000FFFD
	ldrh r2, [r1]
	ands r0, r2
	strh r0, [r1]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0800BA04
	movs r0, #0
	b _0800BA36
	.align 2, 0
_0800BA00: .4byte 0x0000FFFD
_0800BA04:
	movs r0, #0x80
	movs r1, #2
	movs r2, #1
	bl InitTalk
	ldr r0, _0800BA24 @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	beq _0800BA28
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #4]
	adds r0, r4, #0
	movs r2, #1
	bl EventStartTalk
	b _0800BA34
	.align 2, 0
_0800BA24: .4byte 0x0202BBF8
_0800BA28:
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #8]
	adds r0, r4, #0
	movs r2, #1
	bl EventStartTalk
_0800BA34:
	movs r0, #2
_0800BA36:
	pop {r4}
	pop {r1}
	bx r1
