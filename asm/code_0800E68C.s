	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_NoSkipTalk
EvtCmd_NoSkipTalk: @ 0x0800E68C
	push {r4, lr}
	adds r1, r0, #0
	adds r4, r1, #0
	adds r4, #0x5e
	movs r0, #4
	ldrh r2, [r4]
	ands r0, r2
	cmp r0, #0
	beq _0800E6A4
	adds r0, r1, #0
	bl Event_EndSkip
_0800E6A4:
	movs r0, #0xc0
	ldrh r1, [r4]
	orrs r0, r1
	strh r0, [r4]
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
