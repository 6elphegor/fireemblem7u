	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_BoxTalk
EvtCmd_BoxTalk: @ 0x0800FBF0
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	ldr r3, [r2, #0x30]
	ldrh r6, [r3, #2]
	movs r4, #0
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800FC8E
	ldr r1, [r3, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800FC20
	ldr r3, _0800FC1C @ =0x0000FFFF
	ands r3, r1
	b _0800FC24
	.align 2, 0
_0800FC1C: .4byte 0x0000FFFF
_0800FC20:
	movs r3, #1
	rsbs r3, r3, #0
_0800FC24:
	ldr r1, [r2, #0x30]
	ldrh r2, [r1, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	movs r5, #1
	rsbs r5, r5, #0
	cmp r0, #0
	bne _0800FC38
	adds r5, r2, #0
_0800FC38:
	ldr r2, [r1, #8]
	adds r0, r3, #0
	adds r1, r5, #0
	movs r3, #0
	bl StartBoxDialogueSimple
	movs r0, #1
	ands r0, r6
	cmp r0, #0
	beq _0800FC50
	movs r0, #0x10
	orrs r4, r0
_0800FC50:
	movs r0, #2
	ands r0, r6
	cmp r0, #0
	beq _0800FC60
	movs r0, #0x80
	orrs r4, r0
	lsls r0, r4, #0x10
	lsrs r4, r0, #0x10
_0800FC60:
	movs r0, #4
	ands r0, r6
	cmp r0, #0
	beq _0800FC74
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
	orrs r4, r0
	lsls r0, r4, #0x10
	lsrs r4, r0, #0x10
_0800FC74:
	movs r0, #8
	ands r0, r6
	cmp r0, #0
	beq _0800FC84
	movs r0, #0x20
	orrs r4, r0
	lsls r0, r4, #0x10
	lsrs r4, r0, #0x10
_0800FC84:
	cmp r6, #0
	beq _0800FC8E
	adds r0, r4, #0
	bl SetDialogueBoxConfig
_0800FC8E:
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
