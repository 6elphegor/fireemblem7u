	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809A280
sub_0809A280: @ 0x0809A280
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x4f
	movs r5, #0
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	ldr r1, _0809A2CC @ =0x08B857F8
	ldr r2, [r1]
	movs r0, #2
	ldrh r3, [r2, #8]
	ands r0, r3
	adds r3, r1, #0
	cmp r0, #0
	beq _0809A2D8
	ldr r0, _0809A2D0 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809A2B2
	ldr r0, _0809A2D4 @ =0x0000038B
	bl m4aSongNumStart
_0809A2B2:
	movs r1, #0x80
	lsls r1, r1, #1
	str r5, [sp]
	movs r0, #0x5a
	movs r2, #0xc0
	movs r3, #0x18
	bl CallSomeSoundMaybe
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	b _0809A370
	.align 2, 0
_0809A2CC: .4byte 0x08B857F8
_0809A2D0: .4byte 0x0202BBF8
_0809A2D4: .4byte 0x0000038B
_0809A2D8:
	movs r0, #4
	ldrh r2, [r2, #4]
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _0809A324
	adds r0, r4, #0
	adds r0, #0x5e
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	subs r0, #0x23
	ldrb r0, [r0]
	cmp r0, #0
	beq _0809A32A
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xb4
	bls _0809A32A
	ldr r0, _0809A31C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809A312
	ldr r0, _0809A320 @ =0x0000038A
	bl m4aSongNumStart
_0809A312:
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	b _0809A370
	.align 2, 0
_0809A31C: .4byte 0x0202BBF8
_0809A320: .4byte 0x0000038A
_0809A324:
	adds r1, r4, #0
	adds r1, #0x5e
	strh r0, [r1]
_0809A32A:
	ldr r1, [r3]
	movs r0, #0x88
	lsls r0, r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	adds r2, r4, #0
	adds r2, #0x4f
	cmp r0, #0
	beq _0809A340
	movs r0, #0xff
	strb r0, [r2]
_0809A340:
	ldr r1, [r3]
	movs r0, #0x88
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0809A352
	movs r0, #1
	strb r0, [r2]
_0809A352:
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bne _0809A368
	adds r0, r4, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0809A370
_0809A368:
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
_0809A370:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
