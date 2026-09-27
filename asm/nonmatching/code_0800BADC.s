	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_TalkAuto
EvtCmd_TalkAuto: @ 0x0800BADC
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800BAFC
	ldr r1, [r2, #0x48]
	adds r0, r2, #0
	movs r2, #1
	bl EventStartTalk
	movs r0, #2
	b _0800BAFE
_0800BAFC:
	movs r0, #0
_0800BAFE:
	pop {r1}
	bx r1
	.align 2, 0
