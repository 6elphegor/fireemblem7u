	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_TalkByTactGender
EvtCmd_TalkByTactGender: @ 0x0800BC54
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	ldr r0, _0800BC70 @ =0x0000FFFD
	ldrh r2, [r1]
	ands r0, r2
	strh r0, [r1]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0800BC74
	movs r0, #0
	b _0800BC9A
	.align 2, 0
_0800BC70: .4byte 0x0000FFFD
_0800BC74:
	bl IsTactFemale
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800BC8C
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #4]
	adds r0, r4, #0
	movs r2, #1
	bl EventStartTalk
	b _0800BC98
_0800BC8C:
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #8]
	adds r0, r4, #0
	movs r2, #1
	bl EventStartTalk
_0800BC98:
	movs r0, #2
_0800BC9A:
	pop {r4}
	pop {r1}
	bx r1
