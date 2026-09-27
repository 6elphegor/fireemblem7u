	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804C550
sub_0804C550: @ 0x0804C550
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x120
	mov sb, r0
	movs r0, #0
	str r0, [sp, #0xd8]
	bl GetGameTime
	lsrs r0, r0, #3
	movs r1, #3
	bl DivRem
	str r0, [sp, #0xe4]
	mov r0, sb
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #1
	bne _0804C57C
	b _0804CD20
_0804C57C:
	mov r0, sb
	adds r0, #0x29
	ldrb r1, [r0]
	str r0, [sp, #0x108]
	cmp r1, #0
	bne _0804C66A
	mov r1, sb
	ldrh r1, [r1, #0x3a]
	lsls r0, r1, #0x10
	asrs r4, r0, #0x13
	lsls r0, r4, #5
	movs r2, #0xd0
	lsls r2, r2, #1
	adds r7, r0, r2
	cmp r7, #0
	bge _0804C59E
	movs r7, #0
_0804C59E:
	adds r6, r4, #7
	cmp r6, #7
	ble _0804C5A6
	movs r6, #7
_0804C5A6:
	movs r0, #7
	subs r0, r0, r6
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #1
	mov sl, r1
	ldr r0, _0804C5C8 @ =0x0203E02C
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0
	blt _0804C5CC
	cmp r0, #2
	bgt _0804C5CC
	movs r4, #0
	movs r0, #0xf
	str r0, [sp, #0xdc]
	b _0804C5D2
	.align 2, 0
_0804C5C8: .4byte 0x0203E02C
_0804C5CC:
	movs r1, #8
	str r1, [sp, #0xdc]
	movs r4, #8
_0804C5D2:
	ldr r2, _0804C6B8 @ =0x02022FA0
	mov r8, r2
	movs r0, #0x9f
	str r0, [sp]
	mov r0, r8
	movs r1, #0x1e
	movs r2, #8
	movs r3, #0
	bl FillBGRect
	mov r3, sb
	ldr r0, [r3, #0x4c]
	cmp r0, #0
	bne _0804C624
	ldr r0, _0804C6BC @ =0x081D8D9C
	add r0, sl
	lsls r5, r7, #1
	lsls r1, r4, #1
	ldr r2, _0804C6C0 @ =0xFFFFFCC0
	add r2, r8
	adds r1, r1, r2
	adds r5, r5, r1
	lsls r4, r6, #0x10
	lsrs r4, r4, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	adds r1, r5, #0
	movs r2, #0xf
	adds r3, r4, #0
	bl EfxTmCpyBG
	movs r0, #0x80
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0xf
	adds r2, r4, #0
	movs r3, #2
	bl sub_0806693C
_0804C624:
	mov r4, sb
	ldr r0, [r4, #0x50]
	cmp r0, #0
	bne _0804C664
	ldr r0, _0804C6C4 @ =0x081D8E70
	add r0, sl
	lsls r5, r7, #1
	ldr r2, [sp, #0xdc]
	lsls r1, r2, #1
	ldr r2, _0804C6C0 @ =0xFFFFFCC0
	add r2, r8
	adds r1, r1, r2
	adds r5, r5, r1
	lsls r4, r6, #0x10
	lsrs r4, r4, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	adds r1, r5, #0
	movs r2, #0x10
	adds r3, r4, #0
	bl EfxTmCpyBG
	movs r0, #0x80
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x10
	adds r2, r4, #0
	movs r3, #3
	bl sub_0806693C
_0804C664:
	movs r0, #1
	bl EnableBgSync
_0804C66A:
	ldr r1, _0804C6C8 @ =0x0203E0C0
	ldr r0, _0804C6CC @ =0x0203E0B8
	ldrh r2, [r0]
	adds r5, r0, #0
	ldrh r3, [r1]
	ldrh r4, [r5]
	cmp r3, r4
	beq _0804C67E
	movs r0, #1
	str r0, [sp, #0xd8]
_0804C67E:
	ldrh r0, [r5, #2]
	ldrh r3, [r1, #2]
	cmp r3, r0
	beq _0804C68A
	movs r4, #1
	str r4, [sp, #0xd8]
_0804C68A:
	strh r2, [r1]
	strh r0, [r1, #2]
	ldrh r7, [r5]
	ldr r0, _0804C6D0 @ =0x0203E0BC
	ldrh r6, [r0]
	ldrh r1, [r5, #2]
	mov r8, r1
	ldrh r0, [r0, #2]
	str r0, [sp, #0xd4]
	ldr r0, _0804C6D4 @ =0x0203E02C
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #3
	beq _0804C6D8
	cmp r0, #3
	bgt _0804C6F8
	cmp r0, #0
	blt _0804C6F8
	mov r3, sb
	movs r4, #0x32
	ldrsh r3, [r3, r4]
	mov sl, r3
	b _0804C702
	.align 2, 0
_0804C6B8: .4byte 0x02022FA0
_0804C6BC: .4byte 0x081D8D9C
_0804C6C0: .4byte 0xFFFFFCC0
_0804C6C4: .4byte 0x081D8E70
_0804C6C8: .4byte 0x0203E0C0
_0804C6CC: .4byte 0x0203E0B8
_0804C6D0: .4byte 0x0203E0BC
_0804C6D4: .4byte 0x0203E02C
_0804C6D8:
	ldr r0, _0804C6EC @ =0x0203E010
	ldrh r0, [r0]
	cmp r0, #1
	bne _0804C6F0
	mov r1, sb
	movs r2, #0x32
	ldrsh r0, [r1, r2]
	adds r0, #0x38
	b _0804C700
	.align 2, 0
_0804C6EC: .4byte 0x0203E010
_0804C6F0:
	mov r3, sb
	movs r4, #0x32
	ldrsh r0, [r3, r4]
	b _0804C6FE
_0804C6F8:
	mov r1, sb
	movs r2, #0x32
	ldrsh r0, [r1, r2]
_0804C6FE:
	subs r0, #0x38
_0804C700:
	mov sl, r0
_0804C702:
	ldr r3, [sp, #0x108]
	ldrb r0, [r3]
	cmp r0, #0
	bne _0804C71C
	ldr r4, _0804C718 @ =0x0000FFF8
	mov r0, sb
	ldrh r1, [r0, #0x3a]
	ands r1, r4
	str r1, [sp, #0xe0]
	b _0804C724
	.align 2, 0
_0804C718: .4byte 0x0000FFF8
_0804C71C:
	mov r2, sb
	movs r3, #0x3a
	ldrsh r2, [r2, r3]
	str r2, [sp, #0xe0]
_0804C724:
	adds r4, r5, #0
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r1, #0xa
	bl Div
	add r2, sp, #0x68
	strh r0, [r2]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #1
	ldrh r3, [r4]
	subs r1, r3, r1
	strh r1, [r2, #2]
	lsls r0, r0, #0x10
	adds r3, r2, #0
	cmp r0, #0
	bne _0804C74C
	movs r0, #0xb
	strh r0, [r3]
_0804C74C:
	movs r1, #2
	ldrsh r0, [r4, r1]
	movs r1, #0xa
	str r3, [sp, #0x11c]
	bl Div
	ldr r3, [sp, #0x11c]
	strh r0, [r3, #4]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #1
	ldrh r2, [r4, #2]
	subs r1, r2, r1
	strh r1, [r3, #6]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0804C772
	movs r0, #0xb
	strh r0, [r3, #4]
_0804C772:
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0x50
	ble _0804C780
	movs r0, #0xc
	strh r0, [r3]
	strh r0, [r3, #2]
_0804C780:
	movs r2, #2
	ldrsh r0, [r5, r2]
	cmp r0, #0x50
	ble _0804C78E
	movs r0, #0xc
	strh r0, [r3, #4]
	strh r0, [r3, #6]
_0804C78E:
	mov r4, sl
	adds r4, #9
	str r4, [sp, #0xf4]
	ldr r0, [sp, #0xe0]
	adds r0, #0x91
	str r0, [sp, #0x114]
	mov r1, sl
	adds r1, #0x81
	str r1, [sp, #0x110]
	lsls r2, r7, #0x10
	str r2, [sp, #0xf8]
	lsls r6, r6, #0x10
	str r6, [sp, #0xfc]
	adds r4, #0x14
	str r4, [sp, #0x10c]
	mov r0, r8
	lsls r0, r0, #0x10
	str r0, [sp, #0x100]
	ldr r1, [sp, #0xd4]
	lsls r1, r1, #0x10
	str r1, [sp, #0x104]
	mov r2, sl
	adds r2, #0x95
	str r2, [sp, #0x118]
	ldr r4, [sp, #0xd8]
	cmp r4, #1
	bne _0804C820
	add r0, sp, #0xd0
	movs r1, #0
	str r1, [r0]
	ldr r1, _0804C858 @ =0x02016DC8
	ldr r2, _0804C85C @ =0x01000020
	str r3, [sp, #0x11c]
	bl CpuFastSet
	movs r0, #0
	ldr r3, [sp, #0x11c]
_0804C7D8:
	adds r1, r0, #1
	mov r8, r1
	lsls r5, r0, #6
	lsls r0, r0, #2
	adds r4, r0, r3
	movs r6, #1
_0804C7E4:
	ldrh r2, [r4]
	lsls r0, r2, #5
	ldr r1, _0804C860 @ =0x081D9170
	adds r0, r0, r1
	ldr r7, _0804C858 @ =0x02016DC8
	adds r1, r5, r7
	movs r2, #0x10
	str r3, [sp, #0x11c]
	bl CpuSet
	adds r5, #0x20
	adds r4, #2
	subs r6, #1
	ldr r3, [sp, #0x11c]
	cmp r6, #0
	bge _0804C7E4
	mov r0, r8
	cmp r0, #1
	ble _0804C7D8
	ldr r1, _0804C864 @ =0x060139C0
	adds r0, r7, #0
	movs r2, #0x40
	bl RegisterDataMove
	adds r0, r7, #0
	adds r0, #0x40
	ldr r1, _0804C868 @ =0x06013DC0
	movs r2, #0x40
	bl RegisterDataMove
_0804C820:
	add r0, sp, #8
	movs r4, #0
	ldr r1, _0804C86C @ =0x000051CE
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sb
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r0, r2, #0
	add r1, sp, #0xf4
	ldrh r1, [r1]
	strh r1, [r0, #2]
	add r2, sp, #0x114
	ldrh r2, [r2]
	strh r2, [r0, #4]
	strh r4, [r0, #0xc]
	movs r0, #0
	bl EkrEfxIsUnitHittedNow
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #1
	beq _0804C874
	ldr r0, _0804C870 @ =0x08B9AA44
	str r0, [sp, #0x44]
	str r4, [sp, #0x24]
	b _0804C89E
	.align 2, 0
_0804C858: .4byte 0x02016DC8
_0804C85C: .4byte 0x01000020
_0804C860: .4byte 0x081D9170
_0804C864: .4byte 0x060139C0
_0804C868: .4byte 0x06013DC0
_0804C86C: .4byte 0x000051CE
_0804C870: .4byte 0x08B9AA44
_0804C874:
	add r1, sp, #0x70
	str r1, [sp, #0x44]
	movs r0, #0x80
	lsls r0, r0, #2
	str r0, [sp, #0x24]
	add r2, sp, #8
	adds r0, r2, #0
	ldrh r0, [r0, #2]
	subs r0, #8
	strh r0, [r2, #2]
	adds r0, r2, #0
	ldrh r0, [r0, #4]
	subs r0, #8
	strh r0, [r2, #4]
	ldr r0, _0804C8E8 @ =0x08B9AA44
	movs r2, #0x80
	lsls r2, r2, #1
	str r3, [sp]
	movs r3, #0x80
	bl BanimUpdateSpriteRotScale
_0804C89E:
	mov r3, sb
	ldr r0, [r3, #0x4c]
	cmp r0, #0
	bne _0804C8AC
	add r0, sp, #8
	bl AnimDisplay
_0804C8AC:
	movs r4, #0
	str r4, [sp, #0x24]
	add r0, sp, #8
	ldr r1, _0804C8EC @ =0x000061EE
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sb
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r0, r2, #0
	add r1, sp, #0x110
	ldrh r1, [r1]
	strh r1, [r0, #2]
	add r2, sp, #0x114
	ldrh r2, [r2]
	strh r2, [r0, #4]
	strh r4, [r0, #0xc]
	movs r0, #1
	bl EkrEfxIsUnitHittedNow
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #1
	beq _0804C8F0
	ldr r0, _0804C8E8 @ =0x08B9AA44
	str r0, [sp, #0x44]
	str r4, [sp, #0x24]
	b _0804C91A
	.align 2, 0
_0804C8E8: .4byte 0x08B9AA44
_0804C8EC: .4byte 0x000061EE
_0804C8F0:
	add r1, sp, #0x70
	str r1, [sp, #0x44]
	movs r0, #0x80
	lsls r0, r0, #2
	str r0, [sp, #0x24]
	add r2, sp, #8
	adds r0, r2, #0
	ldrh r0, [r0, #2]
	subs r0, #8
	strh r0, [r2, #2]
	adds r0, r2, #0
	ldrh r0, [r0, #4]
	subs r0, #8
	strh r0, [r2, #4]
	ldr r0, _0804CA14 @ =0x08B9AA44
	movs r2, #0x80
	lsls r2, r2, #1
	str r3, [sp]
	movs r3, #0x80
	bl BanimUpdateSpriteRotScale
_0804C91A:
	mov r3, sb
	ldr r0, [r3, #0x50]
	cmp r0, #0
	bne _0804C928
	add r0, sp, #8
	bl AnimDisplay
_0804C928:
	ldr r4, [sp, #0xf8]
	ldr r0, _0804CA18 @ =0xFFD80000
	adds r1, r4, r0
	ldr r2, [sp, #0xfc]
	adds r0, r2, r0
	lsrs r5, r0, #0x10
	lsrs r7, r4, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	lsrs r6, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0x28
	ble _0804C944
	movs r6, #0x28
_0804C944:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble _0804C94E
	movs r5, #0x28
_0804C94E:
	lsls r0, r6, #0x10
	cmp r0, #0
	bge _0804C956
	movs r6, #0
_0804C956:
	lsls r0, r5, #0x10
	cmp r0, #0
	bge _0804C95E
	movs r5, #0
_0804C95E:
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble _0804C968
	movs r7, #0x28
_0804C968:
	mov r3, r8
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble _0804C976
	movs r4, #0x28
	mov r8, r4
_0804C976:
	add r0, sp, #8
	movs r3, #0
	movs r1, #0xb0
	lsls r1, r1, #8
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r4, sb
	ldr r0, [r4, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	str r3, [sp, #0x24]
	adds r0, r2, #0
	add r1, sp, #0x10c
	ldrh r1, [r1]
	strh r1, [r0, #2]
	ldr r0, _0804CA1C @ =0x08B9AA14
	str r0, [sp, #0x44]
	ldr r2, [r4, #0x4c]
	str r2, [sp, #0xe8]
	cmp r2, #0
	bne _0804CA4C
	lsls r0, r5, #0x10
	asrs r2, r0, #0x10
	add r4, sp, #0x50
	cmp r2, #0
	beq _0804C9E6
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl sub_08066CA0
	ldr r3, [sp, #0xd8]
	cmp r3, #1
	bne _0804C9C2
	ldr r1, _0804CA20 @ =0x02016E48
	adds r0, r4, #0
	bl sub_0804C118
_0804C9C2:
	add r1, sp, #8
	ldr r0, [sp, #0xe0]
	adds r0, #0x8e
	strh r0, [r1, #4]
	adds r2, r1, #0
	movs r0, #0xfc
	lsls r0, r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	strh r0, [r1, #8]
	adds r0, r1, #0
	add r1, sp, #0xe8
	ldrh r1, [r1]
	strh r1, [r0, #0xc]
	bl AnimDisplay
_0804C9E6:
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	mov r3, r8
	lsls r2, r3, #0x10
	asrs r2, r2, #0x10
	adds r0, r4, #0
	bl sub_08066CA0
	ldr r0, [sp, #0xd8]
	cmp r0, #1
	bne _0804CA04
	ldr r1, _0804CA24 @ =0x02017248
	adds r0, r4, #0
	bl sub_0804C118
_0804CA04:
	cmp r5, #0
	beq _0804CA28
	add r1, sp, #8
	ldr r0, [sp, #0xe0]
	adds r0, #0x95
	strh r0, [r1, #4]
	b _0804CA30
	.align 2, 0
_0804CA14: .4byte 0x08B9AA44
_0804CA18: .4byte 0xFFD80000
_0804CA1C: .4byte 0x08B9AA14
_0804CA20: .4byte 0x02016E48
_0804CA24: .4byte 0x02017248
_0804CA28:
	add r0, sp, #8
	add r1, sp, #0x114
	ldrh r1, [r1]
	strh r1, [r0, #4]
_0804CA30:
	add r2, sp, #8
	adds r1, r2, #0
	movs r0, #0xfc
	lsls r0, r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	movs r3, #0
	movs r1, #0x20
	orrs r0, r1
	strh r0, [r2, #8]
	adds r0, r2, #0
	strh r3, [r0, #0xc]
	bl AnimDisplay
_0804CA4C:
	ldr r2, [sp, #0x100]
	ldr r3, _0804CB44 @ =0xFFD80000
	adds r1, r2, r3
	ldr r4, [sp, #0x104]
	adds r0, r4, r3
	lsrs r5, r0, #0x10
	lsrs r7, r2, #0x10
	lsrs r4, r4, #0x10
	mov r8, r4
	lsrs r6, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0x28
	ble _0804CA68
	movs r6, #0x28
_0804CA68:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble _0804CA72
	movs r5, #0x28
_0804CA72:
	lsls r0, r6, #0x10
	cmp r0, #0
	bge _0804CA7A
	movs r6, #0
_0804CA7A:
	lsls r0, r5, #0x10
	cmp r0, #0
	bge _0804CA82
	movs r5, #0
_0804CA82:
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble _0804CA8C
	movs r7, #0x28
_0804CA8C:
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble _0804CA9A
	movs r2, #0x28
	mov r8, r2
_0804CA9A:
	add r0, sp, #8
	movs r3, #0
	mov ip, r3
	movs r1, #0xc0
	lsls r1, r1, #8
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r4, sb
	ldr r0, [r4, #0x44]
	add r4, sp, #0xec
	strh r3, [r4]
	orrs r0, r1
	strh r0, [r2, #8]
	mov r0, ip
	str r0, [sp, #0x24]
	adds r0, r2, #0
	add r1, sp, #0x118
	ldrh r1, [r1]
	strh r1, [r0, #2]
	ldr r0, _0804CB48 @ =0x08B9AA14
	str r0, [sp, #0x44]
	mov r2, sb
	ldr r2, [r2, #0x50]
	str r2, [sp, #0xf0]
	cmp r2, #0
	bne _0804CB78
	lsls r0, r5, #0x10
	asrs r2, r0, #0x10
	adds r5, r0, #0
	add r4, sp, #0x50
	cmp r2, #0
	beq _0804CB16
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl sub_08066CA0
	ldr r3, [sp, #0xd8]
	cmp r3, #1
	bne _0804CAF2
	ldr r1, _0804CB4C @ =0x02017048
	adds r0, r4, #0
	bl sub_0804C118
_0804CAF2:
	add r1, sp, #8
	ldr r0, [sp, #0xe0]
	adds r0, #0x8e
	strh r0, [r1, #4]
	adds r2, r1, #0
	movs r0, #0xfc
	lsls r0, r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strh r0, [r2, #8]
	adds r0, r2, #0
	add r1, sp, #0xf0
	ldrh r1, [r1]
	strh r1, [r0, #0xc]
	bl AnimDisplay
_0804CB16:
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	mov r3, r8
	lsls r2, r3, #0x10
	asrs r2, r2, #0x10
	adds r0, r4, #0
	bl sub_08066CA0
	ldr r0, [sp, #0xd8]
	cmp r0, #1
	bne _0804CB34
	ldr r1, _0804CB50 @ =0x02017448
	adds r0, r4, #0
	bl sub_0804C118
_0804CB34:
	cmp r5, #0
	beq _0804CB54
	add r1, sp, #8
	ldr r0, [sp, #0xe0]
	adds r0, #0x95
	strh r0, [r1, #4]
	b _0804CB5C
	.align 2, 0
_0804CB44: .4byte 0xFFD80000
_0804CB48: .4byte 0x08B9AA14
_0804CB4C: .4byte 0x02017048
_0804CB50: .4byte 0x02017448
_0804CB54:
	add r0, sp, #8
	add r1, sp, #0x114
	ldrh r1, [r1]
	strh r1, [r0, #4]
_0804CB5C:
	add r2, sp, #8
	adds r1, r2, #0
	movs r0, #0xfc
	lsls r0, r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	movs r3, #0
	movs r1, #0x30
	orrs r0, r1
	strh r0, [r2, #8]
	adds r0, r2, #0
	strh r3, [r0, #0xc]
	bl AnimDisplay
_0804CB78:
	ldr r2, [sp, #0xd8]
	cmp r2, #1
	bne _0804CB8A
	ldr r0, _0804CD30 @ =0x02016E48
	ldr r1, _0804CD34 @ =0x06013000
	movs r2, #0x80
	lsls r2, r2, #4
	bl RegisterDataMove
_0804CB8A:
	mov r3, sb
	ldr r4, [r3, #0x4c]
	cmp r4, #0
	bne _0804CBE8
	str r4, [sp, #0x24]
	ldr r0, _0804CD38 @ =0x08B9AA5C
	str r0, [sp, #0x44]
	add r0, sp, #8
	ldr r1, _0804CD3C @ =0x000051D0
	strh r1, [r0, #8]
	adds r2, r0, #0
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	mov r0, sl
	adds r0, #0xf
	strh r0, [r1, #2]
	ldr r0, [sp, #0xe0]
	adds r0, #0x70
	strh r0, [r1, #4]
	adds r0, r1, #0
	strh r4, [r0, #0xc]
	bl AnimDisplay
	str r4, [sp, #0x24]
	ldr r0, _0804CD40 @ =0x08B9AA8C
	str r0, [sp, #0x44]
	add r0, sp, #8
	ldr r1, _0804CD44 @ =0x000051C0
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sb
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	mov r0, sl
	adds r0, #0x65
	strh r0, [r1, #2]
	ldr r0, [sp, #0xe0]
	adds r0, #0x78
	strh r0, [r1, #4]
	adds r0, r1, #0
	strh r4, [r0, #0xc]
	bl AnimDisplay
_0804CBE8:
	mov r0, sb
	ldr r4, [r0, #0x50]
	cmp r4, #0
	bne _0804CC48
	str r4, [sp, #0x24]
	ldr r0, _0804CD38 @ =0x08B9AA5C
	str r0, [sp, #0x44]
	add r0, sp, #8
	ldr r1, _0804CD48 @ =0x000061F0
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sb
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	mov r0, sl
	adds r0, #0xd7
	strh r0, [r1, #2]
	ldr r0, [sp, #0xe0]
	adds r0, #0x70
	strh r0, [r1, #4]
	adds r0, r1, #0
	strh r4, [r0, #0xc]
	bl AnimDisplay
	str r4, [sp, #0x24]
	ldr r0, _0804CD4C @ =0x08B9AAC8
	str r0, [sp, #0x44]
	add r0, sp, #8
	ldr r1, _0804CD50 @ =0x000061C0
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sb
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	mov r0, sl
	adds r0, #0x87
	strh r0, [r1, #2]
	ldr r0, [sp, #0xe0]
	adds r0, #0x78
	strh r0, [r1, #4]
	adds r0, r1, #0
	strh r4, [r0, #0xc]
	bl AnimDisplay
_0804CC48:
	mov r0, sb
	ldr r4, [r0, #0x4c]
	cmp r4, #0
	bne _0804CCB4
	str r4, [sp, #0x24]
	ldr r1, _0804CD54 @ =0x0203E0E0
	movs r2, #0
	ldrsh r0, [r1, r2]
	ldr r5, [sp, #0xe0]
	adds r5, #0x7a
	cmp r0, #0
	beq _0804CC8E
	adds r1, r0, #0
	add r0, sp, #8
	ldr r2, [sp, #0xe4]
	bl sub_0804C504
	add r0, sp, #8
	movs r1, #0xe5
	lsls r1, r1, #1
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sb
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	mov r0, sl
	adds r0, #0x35
	strh r0, [r1, #2]
	adds r0, r1, #0
	strh r5, [r0, #4]
	strh r4, [r0, #0xc]
	bl AnimDisplay
_0804CC8E:
	ldr r0, _0804CD58 @ =0x08B9AB04
	str r0, [sp, #0x44]
	add r0, sp, #8
	ldr r1, _0804CD5C @ =0x0000D1DC
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sb
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	mov r0, sl
	adds r0, #0x2b
	strh r0, [r1, #2]
	adds r0, r1, #0
	strh r5, [r0, #4]
	strh r4, [r0, #0xc]
	bl AnimDisplay
_0804CCB4:
	mov r0, sb
	ldr r4, [r0, #0x50]
	cmp r4, #0
	bne _0804CD20
	str r4, [sp, #0x24]
	ldr r1, _0804CD54 @ =0x0203E0E0
	movs r2, #2
	ldrsh r0, [r1, r2]
	ldr r5, [sp, #0xe0]
	adds r5, #0x7a
	cmp r0, #0
	beq _0804CCFA
	adds r1, r0, #0
	add r0, sp, #8
	ldr r2, [sp, #0xe4]
	bl sub_0804C504
	add r0, sp, #8
	movs r1, #0xe5
	lsls r1, r1, #1
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sb
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	mov r0, sl
	adds r0, #0x84
	strh r0, [r1, #2]
	adds r0, r1, #0
	strh r5, [r0, #4]
	strh r4, [r0, #0xc]
	bl AnimDisplay
_0804CCFA:
	ldr r0, _0804CD58 @ =0x08B9AB04
	str r0, [sp, #0x44]
	add r0, sp, #8
	ldr r1, _0804CD60 @ =0x0000E1DE
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sb
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	mov r0, sl
	adds r0, #0x7a
	strh r0, [r1, #2]
	adds r0, r1, #0
	strh r5, [r0, #4]
	strh r4, [r0, #0xc]
	bl AnimDisplay
_0804CD20:
	add sp, #0x120
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804CD30: .4byte 0x02016E48
_0804CD34: .4byte 0x06013000
_0804CD38: .4byte 0x08B9AA5C
_0804CD3C: .4byte 0x000051D0
_0804CD40: .4byte 0x08B9AA8C
_0804CD44: .4byte 0x000051C0
_0804CD48: .4byte 0x000061F0
_0804CD4C: .4byte 0x08B9AAC8
_0804CD50: .4byte 0x000061C0
_0804CD54: .4byte 0x0203E0E0
_0804CD58: .4byte 0x08B9AB04
_0804CD5C: .4byte 0x0000D1DC
_0804CD60: .4byte 0x0000E1DE
