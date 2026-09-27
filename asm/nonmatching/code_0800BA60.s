	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_TalkMore
EvtCmd_TalkMore: @ 0x0800BA60
	push {lr}
	adds r2, r0, #0
	adds r0, #0x5e
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0800BA88
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0800BA88
	ldr r0, [r2, #0x30]
	ldr r1, [r0, #4]
	adds r0, r2, #0
	movs r2, #0
	bl EventStartTalk
	movs r0, #2
	b _0800BA8A
_0800BA88:
	movs r0, #0
_0800BA8A:
	pop {r1}
	bx r1
	.align 2, 0
