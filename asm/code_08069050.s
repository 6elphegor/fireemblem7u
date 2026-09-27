	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08069050
sub_08069050: @ 0x08069050
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	mov sb, r0
	ldr r7, _08069100 @ =0x020200D8
	movs r4, #0
	str r4, [sp]
	ldr r5, _08069104 @ =0x02023460
	ldr r0, _08069108 @ =0x01000200
	mov r8, r0
	mov r0, sp
	adds r1, r5, #0
	mov r2, r8
	bl CpuFastSet
	str r4, [sp, #4]
	add r0, sp, #4
	ldr r6, _0806910C @ =0x02023C60
	adds r1, r6, #0
	mov r2, r8
	bl CpuFastSet
	ldr r1, _08069110 @ =0x06006800
	movs r4, #0x80
	lsls r4, r4, #4
	adds r0, r5, #0
	adds r2, r4, #0
	bl RegisterDataMove
	ldr r1, _08069114 @ =0x06007000
	adds r0, r5, #0
	adds r2, r4, #0
	bl RegisterDataMove
	ldr r1, _08069118 @ =0x06005000
	adds r0, r6, #0
	adds r2, r4, #0
	bl RegisterDataMove
	ldr r1, _0806911C @ =0x06005800
	adds r0, r6, #0
	adds r2, r4, #0
	bl RegisterDataMove
	ldr r1, _08069120 @ =0x0203E028
	ldrh r4, [r1]
	strh r4, [r7]
	movs r0, #3
	strh r0, [r7, #2]
	adds r0, #0xfd
	strh r0, [r7, #4]
	ldrh r3, [r1, #2]
	strh r3, [r7, #6]
	movs r0, #4
	strh r0, [r7, #8]
	movs r0, #0xa0
	lsls r0, r0, #1
	strh r0, [r7, #0xa]
	ldr r0, _08069124 @ =0x0203E02C
	ldrh r1, [r0]
	strh r1, [r7, #0xc]
	ldr r0, _08069128 @ =0x0000FFFF
	adds r2, r0, #0
	ldrh r0, [r7, #0xe]
	orrs r0, r2
	strh r0, [r7, #0xe]
	ldr r0, _0806912C @ =0x06010000
	str r0, [r7, #0x1c]
	ldr r0, _08069130 @ =0x020145C8
	str r0, [r7, #0x20]
	ldr r0, _08069134 @ =0x0203E00E
	ldrh r0, [r0]
	strh r0, [r7, #0x10]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #2
	bne _08069142
	ldr r0, _08069138 @ =0x02017744
	ldr r0, [r0]
	cmp r0, #0
	bne _0806913C
	adds r0, r3, #0
	orrs r0, r2
	strh r0, [r7, #6]
	b _08069142
	.align 2, 0
_08069100: .4byte 0x020200D8
_08069104: .4byte 0x02023460
_08069108: .4byte 0x01000200
_0806910C: .4byte 0x02023C60
_08069110: .4byte 0x06006800
_08069114: .4byte 0x06007000
_08069118: .4byte 0x06005000
_0806911C: .4byte 0x06005800
_08069120: .4byte 0x0203E028
_08069124: .4byte 0x0203E02C
_08069128: .4byte 0x0000FFFF
_0806912C: .4byte 0x06010000
_08069130: .4byte 0x020145C8
_08069134: .4byte 0x0203E00E
_08069138: .4byte 0x02017744
_0806913C:
	adds r0, r4, #0
	orrs r0, r2
	strh r0, [r7]
_08069142:
	bl GetBattleAnimArenaFlag
	cmp r0, #0
	bne _0806916A
	adds r0, r7, #0
	bl sub_08054F30
	ldr r3, [r7, #0x14]
	ldr r0, [r3, #0x4c]
	ldr r2, _0806928C @ =0x0000F3FF
	ands r0, r2
	movs r1, #0xc0
	lsls r1, r1, #4
	orrs r0, r1
	str r0, [r3, #0x4c]
	ldr r3, [r7, #0x18]
	ldr r0, [r3, #0x4c]
	ands r0, r2
	orrs r0, r1
	str r0, [r3, #0x4c]
_0806916A:
	mov r1, sb
	ldr r2, [r1, #0x5c]
	ldr r1, _0806928C @ =0x0000F3FF
	adds r0, r1, #0
	ldrh r3, [r2, #8]
	ands r0, r3
	strh r0, [r2, #8]
	mov r0, sb
	ldr r2, [r0, #0x5c]
	movs r0, #0xc0
	lsls r0, r0, #4
	adds r3, r0, #0
	ldrh r0, [r2, #8]
	orrs r0, r3
	strh r0, [r2, #8]
	mov r2, sb
	ldr r0, [r2, #0x60]
	ldrh r2, [r0, #8]
	ands r1, r2
	strh r1, [r0, #8]
	mov r0, sb
	ldr r1, [r0, #0x60]
	movs r4, #0
	ldrh r0, [r1, #8]
	orrs r0, r3
	strh r0, [r1, #8]
	ldr r5, _08069290 @ =0x03002870
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r5, #0x14]
	ands r0, r2
	strb r0, [r5, #0x14]
	adds r0, r1, #0
	ldrb r3, [r5, #0x10]
	ands r0, r3
	movs r2, #1
	orrs r0, r2
	strb r0, [r5, #0x10]
	ldrb r0, [r5, #0xc]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r5, #0xc]
	movs r0, #3
	ldrb r1, [r5, #0x18]
	orrs r0, r1
	strb r0, [r5, #0x18]
	ldr r0, _08069294 @ =0x0202012C
	movs r1, #0x90
	strh r1, [r0]
	ldr r0, _08069298 @ =0x0202012E
	strh r1, [r0]
	movs r0, #2
	movs r1, #0
	movs r2, #8
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #8
	bl SetBgOffset
	movs r1, #0xc0
	lsls r1, r1, #7
	movs r0, #0
	bl SetBgTilemapOffset
	movs r1, #0xd0
	lsls r1, r1, #7
	movs r0, #1
	bl SetBgTilemapOffset
	movs r1, #0xa0
	lsls r1, r1, #7
	movs r0, #2
	bl SetBgTilemapOffset
	movs r0, #1
	movs r1, #1
	bl SetBgScreenSize
	movs r0, #2
	movs r1, #1
	bl SetBgScreenSize
	bl NewEfxPartsofScroll
	ldr r1, _0806929C @ =0x020200D0
	str r0, [r1]
	bl sub_08069C34
	ldr r1, _080692A0 @ =0x020200D4
	str r0, [r1]
	bl EfxUpdatePartsofScroll
	movs r0, #2
	bl EkrGauge_0804CC68
	mov r2, sb
	ldr r0, [r2, #0x5c]
	bl DisableEfxStatusUnits
	mov r3, sb
	ldr r0, [r3, #0x60]
	bl DisableEfxStatusUnits
	bl DisableEfxWeaponIcon
	bl DisableEfxHpBarColorChange
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r5, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r5, #1]
	adds r1, r5, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x45
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	mov r0, sb
	bl Proc_Break
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806928C: .4byte 0x0000F3FF
_08069290: .4byte 0x03002870
_08069294: .4byte 0x0202012C
_08069298: .4byte 0x0202012E
_0806929C: .4byte 0x020200D0
_080692A0: .4byte 0x020200D4
