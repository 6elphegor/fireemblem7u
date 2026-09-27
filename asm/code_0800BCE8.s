	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_TalkByFlag
EvtCmd_TalkByFlag: @ 0x0800BCE8
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	ldr r0, _0800BD04 @ =0x0000FFFD
	ldrh r2, [r1]
	ands r0, r2
	strh r0, [r1]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0800BD08
	movs r0, #0
	b _0800BD32
	.align 2, 0
_0800BD04: .4byte 0x0000FFFD
_0800BD08:
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800BD24
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #8]
	adds r0, r4, #0
	movs r2, #1
	bl EventStartTalk
	b _0800BD30
_0800BD24:
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #0xc]
	adds r0, r4, #0
	movs r2, #1
	bl EventStartTalk
_0800BD30:
	movs r0, #2
_0800BD32:
	pop {r4}
	pop {r1}
	bx r1
