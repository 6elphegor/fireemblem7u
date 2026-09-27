	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_TalkMoreByTactGender
EvtCmd_TalkMoreByTactGender: @ 0x0800BCA0
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x5e
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0800BCB8
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0800BCBC
_0800BCB8:
	movs r0, #0
	b _0800BCE2
_0800BCBC:
	bl IsTactFemale
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800BCD4
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #4]
	adds r0, r4, #0
	movs r2, #0
	bl EventStartTalk
	b _0800BCE0
_0800BCD4:
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #8]
	adds r0, r4, #0
	movs r2, #0
	bl EventStartTalk
_0800BCE0:
	movs r0, #2
_0800BCE2:
	pop {r4}
	pop {r1}
	bx r1
