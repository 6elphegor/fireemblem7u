	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806827C
sub_0806827C: @ 0x0806827C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r7, #0
	movs r1, #0
	mov r8, r1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #1
	bne _080682D8
	ldr r0, [r4, #0x5c]
	bl DisableEfxStatusUnits
	adds r0, r5, #0
	bl DisableEfxStatusUnits
	adds r0, r5, #0
	bl sub_08068540
	adds r0, r5, #0
	bl sub_08068638
	ldr r2, _080682D4 @ =0x03002870
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r3, [r2, #1]
	ands r0, r3
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	b _0806852A
	.align 2, 0
_080682D4: .4byte 0x03002870
_080682D8:
	cmp r1, #0x5f
	bne _08068308
	ldr r0, [r4, #0x5c]
	movs r1, #0xa
	bl NewEfxFlashBgWhite
	ldr r0, _08068304 @ =0x0000013B
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl PlaySFX
	movs r0, #1
	movs r1, #0
	movs r2, #8
	bl SetBgOffset
	b _0806852A
	.align 2, 0
_08068304: .4byte 0x0000013B
_08068308:
	cmp r1, #0x6a
	bne _0806832C
	ldr r1, [r4, #0x5c]
	ldr r0, _08068328 @ =0x0000F3FF
	ldrh r2, [r1, #8]
	ands r0, r2
	strh r0, [r1, #8]
	ldr r1, [r4, #0x5c]
	movs r3, #0x80
	lsls r3, r3, #3
	adds r0, r3, #0
	ldrh r2, [r1, #8]
	orrs r0, r2
	strh r0, [r1, #8]
	b _0806852A
	.align 2, 0
_08068328: .4byte 0x0000F3FF
_0806832C:
	cmp r1, #0x74
	bne _0806833C
	ldr r0, [r4, #0x5c]
	movs r1, #0xc
	movs r2, #0
	bl sub_08068994
	b _0806852A
_0806833C:
	cmp r1, #0x78
	bne _08068348
	ldr r0, [r4, #0x5c]
	bl sub_0806873C
	b _0806852A
_08068348:
	cmp r1, #0x80
	bne _08068354
	movs r0, #1
	bl SetAnimStateHidden
	b _0806852A
_08068354:
	cmp r1, #0x7e
	bne _08068398
	ldr r0, [r4, #0x5c]
	movs r1, #2
	str r1, [sp]
	movs r1, #0x38
	movs r2, #7
	movs r3, #0
	bl NewefxRestRST
	adds r2, r0, #0
	ldr r0, [r4, #0x5c]
	movs r1, #0x40
	str r1, [sp]
	adds r1, r2, #0
	movs r2, #0x38
	movs r3, #0
	bl NewEfxClasschgRST
	ldr r0, [r4, #0x5c]
	movs r1, #0x38
	movs r2, #0
	bl NewEfxRestWINH_
	ldr r0, [r4, #0x5c]
	mov r3, r8
	str r3, [sp]
	str r3, [sp, #4]
	movs r1, #0
	movs r2, #0x38
	movs r3, #0x10
	bl NewEfxALPHA
	b _0806852A
_08068398:
	cmp r1, #0xf2
	bne _08068430
	ldr r0, [r4, #0x5c]
	bl sub_08068584
	ldr r0, [r4, #0x5c]
	bl sub_080686BC
	ldr r6, _0806842C @ =0x03002870
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r6, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r6, #1]
	ldr r0, [r4, #0x5c]
	movs r1, #2
	str r1, [sp]
	movs r1, #0x38
	movs r2, #7
	movs r3, #0x40
	bl NewefxRestRST
	adds r2, r0, #0
	ldr r0, [r4, #0x5c]
	mov r3, r8
	str r3, [sp]
	adds r1, r2, #0
	movs r2, #0x38
	movs r3, #0x40
	bl NewEfxClasschgRST
	ldr r0, [r4, #0x5c]
	movs r1, #0x38
	movs r2, #0
	bl NewEfxRestWINH_
	adds r2, r6, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r6, #0
	adds r0, #0x44
	strb r7, [r0]
	adds r0, #1
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r7, [r0]
	ldr r0, [r4, #0x5c]
	str r1, [sp]
	mov r2, r8
	str r2, [sp, #4]
	movs r1, #0
	movs r2, #0x38
	movs r3, #0
	bl NewEfxALPHA
	movs r0, #0x9e
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	b _0806850E
	.align 2, 0
_0806842C: .4byte 0x03002870
_08068430:
	movs r0, #0x9c
	lsls r0, r0, #1
	cmp r1, r0
	bne _08068460
	movs r0, #0
	bl SetAnimStateUnHidden
	ldr r0, _0806845C @ =0x0000F3FF
	ldrh r1, [r5, #8]
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r5, #8]
	adds r0, r5, #0
	movs r1, #0xc
	movs r2, #1
	bl sub_08068994
	b _0806852A
	.align 2, 0
_0806845C: .4byte 0x0000F3FF
_08068460:
	movs r0, #0x9f
	lsls r0, r0, #1
	cmp r1, r0
	bne _08068482
	adds r0, r5, #0
	bl sub_0806873C
	ldr r0, [r4, #0x5c]
	movs r1, #0xa
	bl NewEfxFlashBgWhite
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	b _0806852A
_08068482:
	movs r3, #0x2c
	ldrsh r1, [r4, r3]
	movs r0, #0xa5
	lsls r0, r0, #1
	cmp r1, r0
	bne _080684A4
	ldr r0, _080684A0 @ =0x0000F3FF
	ldrh r1, [r5, #8]
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r5, #8]
	b _0806852A
	.align 2, 0
_080684A0: .4byte 0x0000F3FF
_080684A4:
	movs r0, #0xad
	lsls r0, r0, #1
	cmp r1, r0
	bne _080684BC
	bl RegisterEfxSpellCastEnd
	adds r0, r5, #0
	movs r1, #0xa
	movs r2, #0x46
	bl NewEfxWhiteOUT
	b _0806852A
_080684BC:
	movs r0, #0xb2
	lsls r0, r0, #1
	cmp r1, r0
	bne _0806851C
	adds r0, r5, #0
	movs r1, #0x82
	bl sub_080687A0
	adds r0, r5, #0
	movs r1, #0x82
	bl NewEfxClasschgCLONE
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x5a
	movs r2, #0x28
	movs r3, #0xe
	bl NewEfxALPHA
	movs r4, #0x80
	lsls r4, r4, #1
	movs r0, #1
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x82
	movs r2, #0xa
	adds r3, r4, #0
	bl NewefxRestRST
	adds r0, r5, #0
	movs r1, #0x82
	movs r2, #0
	bl NewEfxRestWINH_
	ldr r0, _08068518 @ =0x0000013D
	movs r3, #2
	ldrsh r2, [r5, r3]
	adds r1, r4, #0
_0806850E:
	movs r3, #1
	bl PlaySFX
	b _0806852A
	.align 2, 0
_08068518: .4byte 0x0000013D
_0806851C:
	movs r0, #0x94
	lsls r0, r0, #2
	cmp r1, r0
	bne _0806852A
	adds r0, r4, #0
	bl Proc_Break
_0806852A:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
