	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806C8A0
sub_0806C8A0: @ 0x0806C8A0
	push {r4, r5, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	bl GetMuQ4MovementSpeed
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x10
	str r0, [r7, #4]
	ldr r0, [r7]
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x48
	ldr r3, [r7, #4]
	adds r2, r3, #0
	ldrh r3, [r1]
	adds r1, r2, r3
	adds r2, r0, #0
	adds r0, #0x48
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x4c
	ldr r2, _0806CAEC @ =0x08C9CEC0
	ldr r4, [r7]
	adds r3, r4, #0
	adds r4, #0x42
	movs r3, #0
	ldrsb r3, [r4, r3]
	adds r4, r3, #0
	lsls r3, r4, #2
	adds r2, r2, r3
	movs r4, #0
	ldrsh r3, [r2, r4]
	ldr r4, [r7, #4]
	adds r2, r3, #0
	muls r2, r4, r2
	ldrh r1, [r1]
	adds r1, r1, r2
	adds r2, r0, #0
	adds r0, #0x4c
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x4e
	ldr r2, _0806CAEC @ =0x08C9CEC0
	ldr r4, [r7]
	adds r3, r4, #0
	adds r4, #0x42
	movs r3, #0
	ldrsb r3, [r4, r3]
	adds r4, r3, #0
	lsls r3, r4, #1
	adds r4, r3, #1
	adds r3, r4, #0
	lsls r4, r3, #1
	adds r2, r2, r4
	movs r5, #0
	ldrsh r3, [r2, r5]
	ldr r4, [r7, #4]
	adds r2, r3, #0
	muls r2, r4, r2
	ldrh r1, [r1]
	adds r1, r1, r2
	adds r2, r0, #0
	adds r0, #0x4e
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x48
	ldrh r0, [r1]
	lsrs r1, r0, #4
	adds r0, r1, #0
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0xf
	bhi _0806C96C
	b _0806CA68
_0806C96C:
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x48
	ldrh r3, [r2]
	ldr r2, _0806CAF0 @ =0xFFFFFF00
	adds r1, r3, r2
	adds r2, r0, #0
	adds r0, #0x48
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x4c
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x48
	ldrh r2, [r3]
	ldr r3, _0806CAEC @ =0x08C9CEC0
	ldr r5, [r7]
	adds r4, r5, #0
	adds r5, #0x42
	movs r4, #0
	ldrsb r4, [r5, r4]
	adds r5, r4, #0
	lsls r4, r5, #2
	adds r3, r3, r4
	movs r5, #0
	ldrsh r4, [r3, r5]
	muls r2, r4, r2
	ldrh r1, [r1]
	subs r1, r1, r2
	adds r2, r0, #0
	adds r0, #0x4c
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x4e
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x48
	ldrh r2, [r3]
	ldr r3, _0806CAEC @ =0x08C9CEC0
	ldr r5, [r7]
	adds r4, r5, #0
	adds r5, #0x42
	movs r4, #0
	ldrsb r4, [r5, r4]
	adds r5, r4, #0
	lsls r4, r5, #1
	adds r5, r4, #1
	adds r4, r5, #0
	lsls r5, r4, #1
	adds r3, r3, r5
	movs r5, #0
	ldrsh r4, [r3, r5]
	muls r2, r4, r2
	ldrh r1, [r1]
	subs r1, r1, r2
	adds r2, r0, #0
	adds r0, #0x4e
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x48
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x4c
	ldrh r1, [r2]
	movs r2, #0xf
	bics r1, r2
	adds r2, r0, #0
	adds r0, #0x4c
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x4e
	ldrh r1, [r2]
	movs r2, #0xf
	bics r1, r2
	adds r2, r0, #0
	adds r0, #0x4e
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_0806CA68:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x3e
	ldrb r0, [r1]
	cmp r0, #0
	beq _0806CAC8
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x4c
	movs r2, #0
	ldrsh r0, [r1, r2]
	asrs r1, r0, #4
	adds r2, r1, #0
	lsls r0, r2, #0x10
	asrs r1, r0, #0x10
	adds r0, r1, #0
	bl GetCameraAdjustedX
	adds r1, r0, #0
	ldr r0, _0806CAF4 @ =0x0202BBB8
	ldrh r2, [r0, #0xc]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0xc]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x4e
	movs r4, #0
	ldrsh r0, [r1, r4]
	asrs r1, r0, #4
	adds r2, r1, #0
	lsls r0, r2, #0x10
	asrs r1, r0, #0x10
	adds r0, r1, #0
	bl GetCameraAdjustedY
	adds r1, r0, #0
	ldr r0, _0806CAF4 @ =0x0202BBB8
	ldrh r2, [r0, #0xe]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0xe]
_0806CAC8:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x4a
	ldrh r0, [r1]
	movs r1, #0x80
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x10
	asrs r0, r1, #0x10
	cmp r0, #0
	bne _0806CAE4
	ldr r0, [r7]
	bl UpdateMuStepSounds
_0806CAE4:
	add sp, #8
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806CAEC: .4byte 0x08C9CEC0
_0806CAF0: .4byte 0xFFFFFF00
_0806CAF4: .4byte 0x0202BBB8
