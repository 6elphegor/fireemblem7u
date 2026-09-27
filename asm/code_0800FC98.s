	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_BoxTalkByTactGender
EvtCmd_BoxTalkByTactGender: @ 0x0800FC98
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800FD2A
	bl IsTactFemale
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800FCF0
	ldr r1, [r4, #0x30]
	ldr r2, [r1, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800FCCC
	ldr r3, _0800FCC8 @ =0x0000FFFF
	ands r3, r2
	b _0800FCD0
	.align 2, 0
_0800FCC8: .4byte 0x0000FFFF
_0800FCCC:
	movs r3, #1
	rsbs r3, r3, #0
_0800FCD0:
	ldrh r2, [r1, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, #0
	bne _0800FCE2
	adds r4, r2, #0
_0800FCE2:
	ldr r2, [r1, #8]
	adds r0, r3, #0
	adds r1, r4, #0
	movs r3, #0
	bl StartBoxDialogueSimple
	b _0800FD2A
_0800FCF0:
	ldr r1, [r4, #0x30]
	ldr r2, [r1, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800FD08
	ldr r3, _0800FD04 @ =0x0000FFFF
	ands r3, r2
	b _0800FD0C
	.align 2, 0
_0800FD04: .4byte 0x0000FFFF
_0800FD08:
	movs r3, #1
	rsbs r3, r3, #0
_0800FD0C:
	ldrh r2, [r1, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, #0
	bne _0800FD1E
	adds r4, r2, #0
_0800FD1E:
	ldr r2, [r1, #0xc]
	adds r0, r3, #0
	adds r1, r4, #0
	movs r3, #0
	bl StartBoxDialogueSimple
_0800FD2A:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
