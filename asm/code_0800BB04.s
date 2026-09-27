	.include "macro.inc"

	.syntax unified

	thumb_func_start Event14_TalkContinue
Event14_TalkContinue: @ 0x0800BB04
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800BB28
	bl ResumeTalk
	ldr r0, _0800BB24 @ =EventEndTalk
	str r0, [r4, #0x40]
	movs r0, #2
	b _0800BB2E
	.align 2, 0
_0800BB24: .4byte EventEndTalk
_0800BB28:
	bl EndTalk
	movs r0, #0
_0800BB2E:
	pop {r4}
	pop {r1}
	bx r1
