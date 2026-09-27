	.include "macro.inc"

	.syntax unified

	thumb_func_start WmMuMove_Loop
WmMuMove_Loop: @ 0x080B3EB4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	adds r6, r0, #0
	ldr r0, [r6, #0x50]
	lsrs r1, r0, #0x14
	str r1, [sp, #4]
	lsls r0, r0, #0xc
	lsrs r0, r0, #0x16
	str r0, [sp, #8]
	adds r1, r6, #0
	adds r1, #0x2a
	ldrb r0, [r1]
	cmp r0, #0
	bne _080B3EDA
	b _080B42B0
_080B3EDA:
	adds r0, r6, #0
	adds r0, #0x29
	ldrb r0, [r0]
	mov sl, r0
	ldrb r1, [r1]
	subs r1, #1
	ldr r2, [sp, #4]
	cmp r2, r1
	blt _080B3EEE
	b _080B41F0
_080B3EEE:
	adds r0, r6, #0
	adds r0, #0x61
	ldrb r1, [r0]
	str r0, [sp, #0x20]
	adds r2, r6, #0
	adds r2, #0x60
	ldr r3, [sp, #4]
	cmp r1, r3
	beq _080B3F10
	ldr r0, [r6, #0x54]
	lsrs r0, r0, #0x15
	movs r1, #3
	ands r0, r1
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #1
	strb r1, [r2]
_080B3F10:
	ldrb r0, [r2]
	cmp r0, #0
	beq _080B3F34
	subs r0, #1
	strb r0, [r2]
	adds r1, r6, #0
	adds r1, #0x4a
	movs r5, #0
	ldrsh r4, [r1, r5]
	str r4, [sp, #0xc]
	adds r0, r6, #0
	adds r0, #0x4c
	movs r3, #0
	ldrsh r2, [r0, r3]
	str r2, [sp, #0x10]
	mov r8, r1
	adds r7, r0, #0
	b _080B4278
_080B3F34:
	ldr r4, [sp, #4]
	cmp r4, #0
	ble _080B3F52
	adds r0, r4, #0
	subs r0, #1
	lsls r0, r0, #1
	adds r1, r6, #0
	adds r1, #0x2e
	adds r0, r1, r0
	movs r2, #0
	ldrsh r5, [r0, r2]
	str r5, [sp, #0x14]
	adds r3, r1, #0
	lsls r4, r4, #1
	b _080B3F66
_080B3F52:
	ldr r3, [sp, #4]
	lsls r2, r3, #1
	adds r1, r6, #0
	adds r1, #0x2e
	adds r0, r1, r2
	movs r5, #0
	ldrsh r4, [r0, r5]
	str r4, [sp, #0x14]
	adds r3, r1, #0
	adds r4, r2, #0
_080B3F66:
	adds r0, r3, r4
	movs r2, #0
	ldrsh r1, [r0, r2]
	str r1, [sp, #0x18]
	ldr r2, [sp, #4]
	adds r2, #1
	lsls r0, r2, #1
	adds r0, r3, r0
	movs r1, #0
	ldrsh r5, [r0, r1]
	mov sb, r5
	adds r0, r6, #0
	adds r0, #0x2a
	ldrb r1, [r0]
	subs r1, #2
	mov ip, r0
	ldr r5, [sp, #4]
	cmp r5, r1
	bge _080B3F9C
	adds r0, r5, #0
	adds r0, #2
	lsls r0, r0, #1
	adds r0, r3, r0
	movs r3, #0
	ldrsh r1, [r0, r3]
	mov r8, r1
	b _080B3F9E
_080B3F9C:
	mov r8, sb
_080B3F9E:
	ldr r5, [sp, #4]
	cmp r5, #0
	ble _080B3FB6
	adds r0, r5, #0
	subs r0, #1
	lsls r0, r0, #1
	adds r1, r6, #0
	adds r1, #0x3c
	adds r0, r1, r0
	movs r3, #0
	ldrsh r7, [r0, r3]
	b _080B3FC0
_080B3FB6:
	adds r1, r6, #0
	adds r1, #0x3c
	adds r0, r1, r4
	movs r5, #0
	ldrsh r7, [r0, r5]
_080B3FC0:
	adds r0, r1, r4
	movs r4, #0
	ldrsh r3, [r0, r4]
	str r3, [sp, #0x1c]
	lsls r0, r2, #1
	adds r0, r1, r0
	movs r2, #0
	ldrsh r5, [r0, r2]
	mov r3, ip
	ldrb r0, [r3]
	subs r0, #2
	ldr r4, [sp, #4]
	cmp r4, r0
	bge _080B3FEA
	adds r0, r4, #0
	adds r0, #2
	lsls r0, r0, #1
	adds r0, r1, r0
	movs r1, #0
	ldrsh r4, [r0, r1]
	b _080B3FEC
_080B3FEA:
	adds r4, r5, #0
_080B3FEC:
	ldr r2, [sp, #8]
	str r2, [sp]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	mov r2, sb
	mov r3, r8
	bl sub_080A86A0
	str r0, [sp, #0xc]
	ldr r3, [sp, #8]
	str r3, [sp]
	adds r0, r7, #0
	ldr r1, [sp, #0x1c]
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_080A86A0
	str r0, [sp, #0x10]
	ldr r0, [sp, #8]
	str r0, [sp]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	mov r2, sb
	mov r3, r8
	bl sub_080A8778
	mov r8, r0
	ldr r1, [sp, #8]
	str r1, [sp]
	adds r0, r7, #0
	ldr r1, [sp, #0x1c]
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_080A8778
	adds r5, r0, #0
	mov r2, r8
	mov r0, r8
	muls r0, r2, r0
	adds r1, r5, #0
	muls r1, r5, r1
	adds r0, r0, r1
	bl Sqrt
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r3, [r6, #0x5c]
	adds r2, r3, r4
	str r2, [r6, #0x5c]
	ldr r0, [r6, #0x54]
	movs r1, #0x80
	lsls r1, r1, #0x11
	ands r0, r1
	cmp r0, #0
	beq _080B406E
	lsrs r1, r2, #0xc
	lsrs r0, r3, #0xc
	cmp r1, r0
	bls _080B406E
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	movs r2, #0
	adds r3, r6, #0
	bl StartWmMarker
_080B406E:
	adds r1, r4, #1
	movs r0, #0x80
	lsls r0, r0, #0xb
	bl __divsi3
	adds r1, r0, #0
	ldr r0, _080B4100 @ =0x000001FF
	cmp r1, r0
	bgt _080B4084
	movs r1, #0x80
	lsls r1, r1, #2
_080B4084:
	ldr r2, [r6, #0x54]
	movs r0, #0x80
	lsls r0, r0, #5
	ands r0, r2
	cmp r0, #0
	beq _080B4092
	lsls r1, r1, #1
_080B4092:
	movs r0, #0x80
	lsls r0, r0, #0xd
	ands r2, r0
	cmp r2, #0
	beq _080B409E
	asrs r1, r1, #1
_080B409E:
	ldr r0, [r6, #0x50]
	adds r0, r0, r1
	str r0, [r6, #0x50]
	mov r3, r8
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	bl ArcTan2
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x18
	adds r2, r6, #0
	adds r2, #0x62
	ldrb r0, [r2]
	cmp r0, #0
	beq _080B4104
	adds r0, r1, #0
	subs r0, #0x21
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xbf
	bls _080B40D0
	movs r4, #1
	mov sl, r4
_080B40D0:
	cmp r0, #0x3f
	bhi _080B40D8
	movs r5, #2
	mov sl, r5
_080B40D8:
	adds r0, r1, #0
	subs r0, #0x61
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3f
	bhi _080B40E8
	movs r0, #0
	mov sl, r0
_080B40E8:
	adds r0, r1, #0
	adds r0, #0x5f
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3f
	bhi _080B40F8
	movs r1, #3
	mov sl, r1
_080B40F8:
	movs r0, #0
	strb r0, [r2]
	b _080B4144
	.align 2, 0
_080B4100: .4byte 0x000001FF
_080B4104:
	adds r0, r1, #0
	subs r0, #0x1d
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xc7
	bls _080B4114
	movs r2, #1
	mov sl, r2
_080B4114:
	adds r0, r1, #0
	subs r0, #0x25
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x37
	bhi _080B4124
	movs r3, #2
	mov sl, r3
_080B4124:
	adds r0, r1, #0
	subs r0, #0x65
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x37
	bhi _080B4134
	movs r4, #0
	mov sl, r4
_080B4134:
	adds r0, r1, #0
	adds r0, #0x5b
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x37
	bhi _080B4144
	movs r5, #3
	mov sl, r5
_080B4144:
	adds r0, r6, #0
	mov r1, sl
	bl WmMuMove_SetFacing
	ldr r1, [r6, #0x54]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r1, r0
	movs r0, #0x4a
	adds r0, r0, r6
	mov r8, r0
	adds r7, r6, #0
	adds r7, #0x4c
	cmp r1, #0
	beq _080B41D6
	ldr r0, _080B41EC @ =0x02000000
	movs r1, #4
	ldrsh r2, [r0, r1]
	ldr r3, [sp, #0xc]
	subs r3, r3, r2
	mov sb, r3
	movs r4, #6
	ldrsh r3, [r0, r4]
	ldr r5, [sp, #0x10]
	subs r4, r5, r3
	mov r0, r8
	movs r5, #0
	ldrsh r1, [r0, r5]
	subs r1, r1, r2
	mov sl, r1
	mov r2, sb
	subs r2, #8
	movs r1, #0
	ldrsh r0, [r7, r1]
	subs r0, r0, r3
	mov ip, r0
	adds r3, r4, #0
	subs r3, #0xc
	mov r0, sb
	mov r1, sl
	subs r5, r0, r1
	mov r0, ip
	subs r1, r4, r0
	cmp r5, #0
	bge _080B41A2
	cmp r2, #0x70
	bgt _080B41AA
_080B41A2:
	cmp r5, #0
	ble _080B41AC
	cmp r2, #0x7f
	bgt _080B41AC
_080B41AA:
	movs r5, #0
_080B41AC:
	cmp r1, #0
	bge _080B41B4
	cmp r3, #0x40
	bgt _080B41BC
_080B41B4:
	cmp r1, #0
	ble _080B41BE
	cmp r3, #0x4f
	bgt _080B41BE
_080B41BC:
	movs r1, #0
_080B41BE:
	cmp r5, #0
	bne _080B41C6
	cmp r1, #0
	beq _080B41D6
_080B41C6:
	adds r0, r5, #0
	bl WmMoveCamera
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r1, #0
	bl WmUpdateCamera
_080B41D6:
	ldr r0, [r6, #0x54]
	movs r1, #0x80
	lsls r1, r1, #0x12
	ands r0, r1
	cmp r0, #0
	beq _080B4278
	movs r0, #1
	bl WmSetUnk02
	b _080B4278
	.align 2, 0
_080B41EC: .4byte 0x02000000
_080B41F0:
	lsls r1, r1, #1
	adds r0, r6, #0
	adds r0, #0x2e
	adds r0, r0, r1
	movs r3, #0
	ldrsh r2, [r0, r3]
	str r2, [sp, #0xc]
	adds r0, r6, #0
	adds r0, #0x3c
	adds r0, r0, r1
	movs r5, #0
	ldrsh r4, [r0, r5]
	str r4, [sp, #0x10]
	ldr r1, [r6, #0x54]
	movs r0, #0xc0
	lsls r0, r0, #2
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	beq _080B423E
	cmp r1, r0
	bhi _080B4224
	cmp r1, #0
	beq _080B4246
	b _080B4256
_080B4224:
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r1, r0
	bne _080B4256
	adds r1, r6, #0
	adds r1, #0x62
	movs r0, #1
	strb r0, [r1]
	adds r0, r6, #0
	movs r1, #4
	bl WmMuMove_SetFacing
	b _080B4256
_080B423E:
	ldr r0, [r6, #0x58]
	bl ShowMu
	b _080B4256
_080B4246:
	adds r1, r6, #0
	adds r1, #0x62
	movs r0, #1
	strb r0, [r1]
	adds r0, r6, #0
	movs r1, #0xf
	bl WmMuMove_SetFacing
_080B4256:
	ldr r1, [r6, #0x54]
	movs r0, #0x80
	lsls r0, r0, #0x12
	ands r1, r0
	adds r0, r6, #0
	adds r0, #0x61
	str r0, [sp, #0x20]
	movs r2, #0x4a
	adds r2, r2, r6
	mov r8, r2
	adds r7, r6, #0
	adds r7, #0x4c
	cmp r1, #0
	beq _080B4278
	movs r0, #0
	bl WmSetUnk02
_080B4278:
	mov r3, sp
	ldrh r4, [r3, #0xc]
	mov r3, r8
	strh r4, [r3]
	mov r5, sp
	ldrh r5, [r5, #0x10]
	strh r5, [r7]
	ldr r0, [r6, #0x58]
	ldr r2, _080B42AC @ =0x02000000
	movs r3, #4
	ldrsh r1, [r2, r3]
	ldr r4, [sp, #0xc]
	subs r1, r4, r1
	subs r1, #8
	movs r5, #6
	ldrsh r2, [r2, r5]
	ldr r3, [sp, #0x10]
	subs r2, r3, r2
	subs r2, #0xc
	bl SetMuScreenPosition
	ldr r0, [r6, #0x58]
	bl ShowMu
	b _080B42BA
	.align 2, 0
_080B42AC: .4byte 0x02000000
_080B42B0:
	ldr r0, [r6, #0x58]
	bl HideMu
	adds r6, #0x61
	str r6, [sp, #0x20]
_080B42BA:
	mov r4, sp
	ldrb r5, [r4, #4]
	ldr r4, [sp, #0x20]
	strb r5, [r4]
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
