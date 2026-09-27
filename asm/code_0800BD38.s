	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_TalkMoreByFlag
EvtCmd_TalkMoreByFlag: @ 0x0800BD38
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x5e
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0800BD50
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0800BD54
_0800BD50:
	movs r0, #0
	b _0800BD7E
_0800BD54:
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800BD70
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #8]
	adds r0, r4, #0
	movs r2, #0
	bl EventStartTalk
	b _0800BD7C
_0800BD70:
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #0xc]
	adds r0, r4, #0
	movs r2, #0
	bl EventStartTalk
_0800BD7C:
	movs r0, #2
_0800BD7E:
	pop {r4}
	pop {r1}
	bx r1
