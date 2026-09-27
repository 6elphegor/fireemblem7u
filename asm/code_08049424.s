	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08049424
sub_08049424: @ 0x08049424
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	bl sub_08049944
	cmp r0, #0
	beq _0804943A
	b _08049800
_0804943A:
	adds r0, r6, #0
	adds r0, #0x4a
	ldrb r1, [r0]
	mov sl, r0
	cmp r1, #0xf
	bls _0804944E
	subs r0, r1, #1
	mov r1, sl
	strb r0, [r1]
	b _08049800
_0804944E:
	adds r1, r6, #0
	adds r1, #0x48
	ldrb r0, [r1]
	cmp r0, #0
	beq _08049478
	movs r0, #0
	strb r0, [r1]
	ldr r0, _08049474 @ =0x04000128
	ldrh r0, [r0]
	movs r4, #0xfc
	ands r4, r0
	cmp r4, #8
	beq _08049478
	adds r0, r6, #0
	bl MultiBootInit
	movs r0, #8
	eors r0, r4
	b _08049802
	.align 2, 0
_08049474: .4byte 0x04000128
_08049478:
	ldrb r2, [r6, #0x18]
	cmp r2, #0xdf
	bls _080494CA
	adds r0, r6, #0
	bl sub_08049954
	adds r4, r0, #0
	cmp r4, #0
	beq _0804948C
	b _08049802
_0804948C:
	adds r0, r6, #0
	adds r0, #0x4b
	ldrb r0, [r0]
	cmp r0, #1
	bne _080494A8
	ldrb r0, [r6, #0x18]
	cmp r0, #0xe1
	bls _080494A8
	adds r0, r6, #0
	bl sub_08049944
	cmp r0, #0
	bne _080494A8
	b _080497F0
_080494A8:
	adds r0, r6, #0
	bl sub_08049944
	cmp r0, #0
	beq _080494B4
	b _08049800
_080494B4:
	ldrh r0, [r6, #0x16]
	cmp r0, #0
	bne _080494C4
	adds r0, r6, #0
	bl MultiBootInit
	movs r0, #0x71
	b _08049802
_080494C4:
	subs r0, #1
	strh r0, [r6, #0x16]
	b _08049800
_080494CA:
	ldrb r0, [r6, #0x18]
	cmp r0, #2
	bne _080494D2
	b _08049608
_080494D2:
	cmp r0, #2
	bgt _080494E0
	cmp r0, #0
	beq _080494EE
	cmp r0, #1
	beq _080495AC
	b _08049744
_080494E0:
	cmp r0, #0xd0
	bne _080494E6
	b _08049654
_080494E6:
	cmp r0, #0xd1
	bne _080494EC
	b _080496F0
_080494EC:
	b _08049744
_080494EE:
	movs r5, #0xe
	movs r4, #3
	ldr r0, _08049534 @ =0x04000120
	ldrh r0, [r0, #6]
	adds r1, r0, #0
	ldr r0, _08049538 @ =0x0000FFFF
	ldrb r2, [r6, #0x1e]
	adds r7, r2, #0
	cmp r1, r0
	bne _08049516
	adds r3, r1, #0
	ldr r1, _0804953C @ =0x04000126
_08049506:
	asrs r5, r5, #1
	subs r1, #2
	subs r4, #1
	cmp r4, #0
	beq _08049516
	ldrh r0, [r1]
	cmp r0, r3
	beq _08049506
_08049516:
	movs r0, #0xe
	ands r5, r0
	strb r5, [r6, #0x1d]
	movs r4, #3
	ldr r0, _08049534 @ =0x04000120
	ldrh r0, [r0, #6]
	adds r3, r0, #0
	asrs r0, r2, #3
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08049544
	ldr r0, _08049540 @ =0x00007208
	b _0804956A
	.align 2, 0
_08049534: .4byte 0x04000120
_08049538: .4byte 0x0000FFFF
_0804953C: .4byte 0x04000126
_08049540: .4byte 0x00007208
_08049544:
	subs r4, #1
	cmp r4, #0
	beq _08049570
	lsls r0, r4, #1
	ldr r1, _08049598 @ =0x04000120
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r3, r0, #0
	adds r0, r2, #0
	asrs r0, r4
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08049544
	adds r0, r1, #0
	lsls r0, r4
	movs r1, #0xe4
	lsls r1, r1, #7
	orrs r0, r1
_0804956A:
	cmp r3, r0
	beq _08049544
	movs r5, #0
_08049570:
	adds r0, r5, #0
	ands r0, r7
	strb r0, [r6, #0x1e]
	cmp r5, #0
	bne _08049580
	movs r0, #0xf
	mov r2, sl
	strb r0, [r2]
_08049580:
	mov r1, sl
	ldrb r0, [r1]
	cmp r0, #0
	bne _0804959C
	ldrb r2, [r6, #0x1d]
	ldrb r0, [r6, #0x1e]
	cmp r2, r0
	beq _080495A2
	adds r0, r6, #0
	bl MultiBootStartProbe
	b _080495AC
	.align 2, 0
_08049598: .4byte 0x04000120
_0804959C:
	subs r0, #1
	mov r1, sl
	strb r0, [r1]
_080495A2:
	movs r2, #0xc4
	lsls r2, r2, #7
	adds r0, r2, #0
	ldrb r1, [r6, #0x1e]
	b _080496AC
_080495AC:
	adds r1, r6, #0
	adds r1, #0x49
	movs r0, #0
	strb r0, [r1]
	movs r4, #3
	adds r7, r1, #0
	ldr r5, _08049600 @ =0x03001450
_080495BA:
	lsls r0, r4, #1
	ldr r2, _08049604 @ =0x04000120
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r3, r0, #0
	asrs r0, r3, #8
	subs r2, r4, #1
	cmp r0, #0x72
	bne _080495E4
	lsls r0, r2, #1
	adds r0, r0, r5
	strh r3, [r0]
	movs r0, #0xff
	ands r3, r0
	movs r0, #1
	lsls r0, r4
	cmp r3, r0
	bne _080495E4
	ldrb r0, [r1]
	orrs r3, r0
	strb r3, [r1]
_080495E4:
	adds r4, r2, #0
	cmp r4, #0
	bne _080495BA
	ldrb r1, [r6, #0x1d]
	ldrb r2, [r7]
	cmp r1, r2
	bne _080495A2
	movs r0, #2
	strb r0, [r6, #0x18]
	movs r1, #0xc2
	lsls r1, r1, #7
	adds r0, r1, #0
	ldrb r1, [r7]
	b _080496AC
	.align 2, 0
_08049600: .4byte 0x03001450
_08049604: .4byte 0x04000120
_08049608:
	movs r4, #3
	adds r7, r6, #0
	adds r7, #0x49
	adds r5, r7, #0
	movs r2, #1
	mov ip, r2
	ldr r0, _0804964C @ =0x03001450
	mov sb, r0
	ldr r1, _08049650 @ =0x04000120
	mov r8, r1
_0804961C:
	ldrb r3, [r5]
	adds r0, r3, #0
	asrs r0, r4
	mov r2, ip
	ands r0, r2
	subs r2, r4, #1
	cmp r0, #0
	beq _08049644
	lsls r0, r4, #1
	add r0, r8
	ldrh r1, [r0]
	lsls r0, r2, #1
	add r0, sb
	ldrh r0, [r0]
	cmp r1, r0
	beq _08049644
	mov r0, ip
	lsls r0, r4
	eors r3, r0
	strb r3, [r5]
_08049644:
	adds r4, r2, #0
	cmp r4, #0
	bne _0804961C
	b _080497A8
	.align 2, 0
_0804964C: .4byte 0x03001450
_08049650: .4byte 0x04000120
_08049654:
	movs r5, #1
	movs r4, #3
	adds r7, r6, #0
	adds r7, #0x49
	movs r0, #0x19
	adds r0, r0, r6
	mov ip, r0
	ldr r1, _080496B8 @ =0x03001450
	mov r8, r1
_08049666:
	lsls r0, r4, #1
	ldr r2, _080496BC @ =0x04000120
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r3, r0, #0
	subs r2, r4, #1
	mov r1, ip
	adds r0, r1, r2
	strb r3, [r0]
	ldrb r1, [r7]
	asrs r1, r4
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	beq _0804969A
	asrs r0, r3, #8
	subs r0, #0x72
	cmp r0, #1
	bls _0804968E
	b _080497F6
_0804968E:
	lsls r0, r2, #1
	add r0, r8
	ldrh r0, [r0]
	cmp r3, r0
	bne _0804969A
	movs r5, #0
_0804969A:
	adds r4, r2, #0
	cmp r4, #0
	bne _08049666
	cmp r5, #0
	bne _080496C0
	movs r2, #0xc6
	lsls r2, r2, #7
	adds r0, r2, #0
	ldrb r1, [r6, #0x1c]
_080496AC:
	orrs r1, r0
	adds r0, r6, #0
	bl MultiBootSend
	b _08049802
	.align 2, 0
_080496B8: .4byte 0x03001450
_080496BC: .4byte 0x04000120
_080496C0:
	movs r0, #0xd1
	strb r0, [r6, #0x18]
	movs r5, #0x11
	movs r4, #3
	mov r0, ip
	adds r0, #2
_080496CC:
	ldrb r1, [r0]
	adds r5, r1, r5
	subs r0, #1
	subs r4, #1
	cmp r4, #0
	bne _080496CC
	strb r5, [r6, #0x14]
	movs r0, #0xff
	ands r5, r0
	movs r2, #0xc8
	lsls r2, r2, #7
	adds r0, r2, #0
	orrs r5, r0
	adds r0, r6, #0
	adds r1, r5, #0
	bl MultiBootSend
	b _08049802
_080496F0:
	movs r4, #3
	adds r7, r6, #0
	adds r7, #0x49
	ldrb r1, [r7]
	ldr r2, _08049730 @ =0x04000126
	movs r5, #1
_080496FC:
	ldrh r0, [r2]
	adds r3, r0, #0
	adds r0, r1, #0
	asrs r0, r4
	ands r0, r5
	cmp r0, #0
	beq _08049710
	asrs r0, r3, #8
	cmp r0, #0x73
	bne _080497F6
_08049710:
	subs r2, #2
	subs r4, #1
	cmp r4, #0
	bne _080496FC
	adds r0, r6, #0
	bl MultiBoot
	adds r4, r0, #0
	cmp r4, #0
	bne _08049734
	movs r0, #0xe0
	strb r0, [r6, #0x18]
	adds r0, #0xb0
	strh r0, [r6, #0x16]
	b _08049800
	.align 2, 0
_08049730: .4byte 0x04000126
_08049734:
	adds r0, r6, #0
	bl MultiBootInit
	movs r0, #0x1e
	mov r1, sl
	strb r0, [r1]
	movs r0, #0x70
	b _08049802
_08049744:
	movs r4, #3
	adds r7, r6, #0
	adds r7, #0x49
	mov ip, r7
	movs r2, #1
	mov r8, r2
_08049750:
	mov r0, ip
	ldrb r5, [r0]
	adds r0, r5, #0
	asrs r0, r4
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _0804978A
	lsls r0, r4, #1
	ldr r2, _080497A4 @ =0x04000120
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r3, r0, #0
	asrs r2, r3, #8
	ldrb r0, [r6, #0x18]
	lsrs r1, r0, #1
	movs r0, #0x62
	subs r0, r0, r1
	mov r1, r8
	lsls r1, r4
	cmp r2, r0
	bne _08049784
	movs r0, #0xff
	ands r3, r0
	cmp r3, r1
	beq _0804978A
_08049784:
	eors r5, r1
	mov r1, ip
	strb r5, [r1]
_0804978A:
	subs r4, #1
	cmp r4, #0
	bne _08049750
	ldrb r2, [r6, #0x18]
	cmp r2, #0xc4
	bne _080497A8
	movs r0, #0xe
	ldrb r7, [r7]
	ands r0, r7
	strb r0, [r6, #0x1e]
	strb r4, [r6, #0x18]
	b _080495A2
	.align 2, 0
_080497A4: .4byte 0x04000120
_080497A8:
	ldrb r0, [r7]
	cmp r0, #0
	bne _080497B8
	adds r0, r6, #0
	bl MultiBootInit
	movs r0, #0x50
	b _08049802
_080497B8:
	ldrb r0, [r6, #0x18]
	adds r0, #2
	strb r0, [r6, #0x18]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xc4
	bne _080497C8
	b _080495A2
_080497C8:
	ldr r0, [r6, #0x28]
	ldrb r1, [r6, #0x18]
	adds r0, r1, r0
	subs r1, r0, #3
	ldrb r1, [r1]
	lsls r1, r1, #8
	subs r0, #4
	ldrb r0, [r0]
	orrs r1, r0
	adds r0, r6, #0
	bl MultiBootSend
	adds r4, r0, #0
	cmp r4, #0
	bne _08049802
	adds r0, r6, #0
	adds r0, #0x4b
	ldrb r0, [r0]
	cmp r0, #1
	bne _08049800
_080497F0:
	bl MultiBootWaitSendDone
	b _0804944E
_080497F6:
	adds r0, r6, #0
	bl MultiBootInit
	movs r0, #0x60
	b _08049802
_08049800:
	movs r0, #0
_08049802:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
