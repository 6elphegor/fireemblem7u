	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804EC88
sub_0804EC88: @ 0x0804EC88
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r5, [r7, #0x44]
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, _0804ECD0 @ =0x00007FFF
	ldrh r0, [r0]
	cmp r0, r1
	beq _0804ECA6
	b _0804EDB4
_0804ECA6:
	ldr r0, _0804ECD4 @ =0x0203E02C
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _0804ECD8
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl CheckInEkrDragon
	cmp r0, #0
	beq _0804ECFA
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	b _0804ECFA
	.align 2, 0
_0804ECD0: .4byte 0x00007FFF
_0804ECD4: .4byte 0x0203E02C
_0804ECD8:
	cmp r0, #0
	blt _0804ECFA
	cmp r0, #2
	bgt _0804ECFA
	bl CheckInEkrDragon
	cmp r0, #0
	beq _0804ECF2
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
_0804ECF2:
	ldr r0, _0804ED9C @ =0x0201FB00
	ldr r0, [r0]
	bl sub_0804E6DC
_0804ECFA:
	ldr r0, [r7, #0x64]
	cmp r0, #0
	beq _0804ED0A
	bl AnimDelete
	ldr r0, _0804EDA0 @ =0x0201FAD0
	bl sub_08055320
_0804ED0A:
	ldr r3, _0804EDA4 @ =0x02000028
	movs r4, #0
	ldrsh r2, [r3, r4]
	ldr r0, _0804ED9C @ =0x0201FB00
	ldr r1, [r0]
	subs r6, r2, r1
	ldr r2, _0804EDA8 @ =0x0200002C
	movs r5, #2
	ldrsh r0, [r3, r5]
	subs r4, r0, r1
	movs r0, #2
	ldrsh r5, [r2, r0]
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	movs r3, #0
	ldrsh r2, [r2, r3]
	movs r0, #0
	bl SetEkrFrontAnimPostion
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	adds r2, r5, #0
	movs r0, #1
	bl SetEkrFrontAnimPostion
	ldr r1, _0804EDAC @ =0x02017740
	movs r0, #0
	str r0, [r1]
	adds r0, r7, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne _0804ED92
	bl CheckInEkrDragon
	cmp r0, #0
	beq _0804ED5E
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
_0804ED5E:
	ldr r4, _0804EDB0 @ =0x02000038
	ldrh r1, [r4]
	ldrh r2, [r4, #2]
	movs r0, #0
	bl SetBgOffset
	ldrh r5, [r4]
	rsbs r0, r5, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r6, [r4, #2]
	rsbs r1, r6, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_0804CC8C
	ldrh r1, [r4]
	rsbs r0, r1, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r4, [r4, #2]
	rsbs r1, r4, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl EkrDispUP_SetPositionSync
_0804ED92:
	adds r0, r7, #0
	bl Proc_End
	b _0804EFCE
	.align 2, 0
_0804ED9C: .4byte 0x0201FB00
_0804EDA0: .4byte 0x0201FAD0
_0804EDA4: .4byte 0x02000028
_0804EDA8: .4byte 0x0200002C
_0804EDAC: .4byte 0x02017740
_0804EDB0: .4byte 0x02000038
_0804EDB4:
	movs r2, #0x2c
	ldrsh r4, [r7, r2]
	cmp r4, #0
	bne _0804EDE0
	ldr r0, [r7, #0x64]
	cmp r0, #0
	beq _0804EDE0
	ldr r0, [r7, #0x5c]
	bl GetAnimPosition
	adds r1, r0, #0
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _0804EE3C @ =0x02023F20
	adds r0, r0, r1
	str r4, [sp]
	movs r1, #0xf
	movs r2, #5
	movs r3, #0
	bl FillBGRect
_0804EDE0:
	ldr r4, _0804EE40 @ =0x02017760
	movs r3, #0x2c
	ldrsh r0, [r7, r3]
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #0
	ldrsh r6, [r0, r1]
	mov r8, r6
	strh r6, [r4]
	movs r2, #0x2c
	ldrsh r0, [r7, r2]
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r3, #2
	ldrsh r5, [r0, r3]
	strh r5, [r4, #2]
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	ldr r0, [r7, #0x64]
	cmp r0, #0
	beq _0804EE4C
	ldr r0, [r7, #0x5c]
	bl GetAnimPosition
	ldr r1, _0804EE44 @ =0x0201FB00
	ldr r1, [r1]
	ldr r2, _0804EE48 @ =0x02000030
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	subs r1, r1, r0
	ldr r2, [r7, #0x64]
	ldrh r6, [r7, #0x36]
	ldrh r3, [r4]
	adds r0, r6, r3
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	subs r0, r0, r1
	strh r0, [r2, #2]
	ldrh r6, [r7, #0x3e]
	ldrh r4, [r4, #2]
	subs r0, r6, r4
	strh r0, [r2, #4]
	b _0804EE56
	.align 2, 0
_0804EE3C: .4byte 0x02023F20
_0804EE40: .4byte 0x02017760
_0804EE44: .4byte 0x0201FB00
_0804EE48: .4byte 0x02000030
_0804EE4C:
	ldrh r1, [r4]
	ldrh r2, [r4, #2]
	movs r0, #2
	bl SetBgOffset
_0804EE56:
	adds r0, r7, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne _0804EED0
	bl CheckInEkrDragon
	cmp r0, #0
	beq _0804EE7A
	mov r0, r8
	rsbs r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r5, #0x10
	lsrs r2, r2, #0x10
	movs r0, #3
	bl SetBgOffset
_0804EE7A:
	ldr r5, _0804EF0C @ =0x02017760
	ldr r4, _0804EF10 @ =0x02000038
	ldrh r2, [r5]
	ldrh r3, [r4]
	adds r1, r2, r3
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r6, [r5, #2]
	ldrh r0, [r4, #2]
	adds r2, r6, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	bl SetBgOffset
	ldrh r1, [r5]
	ldrh r2, [r4]
	adds r0, r1, r2
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r3, [r5, #2]
	ldrh r6, [r4, #2]
	adds r1, r3, r6
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_0804CC8C
	ldrh r1, [r5]
	ldrh r2, [r4]
	adds r0, r1, r2
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r5, [r5, #2]
	ldrh r4, [r4, #2]
	adds r1, r5, r4
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl EkrDispUP_SetPositionSync
_0804EED0:
	bl CheckInEkrDragon
	cmp r0, #0
	beq _0804EEE4
	ldr r0, _0804EF0C @ =0x02017760
	ldrh r1, [r0]
	ldrh r2, [r0, #2]
	movs r0, #3
	bl SetBgOffset
_0804EEE4:
	bl CheckInEkrDragon
	cmp r0, #0
	beq _0804EF20
	ldr r3, _0804EF14 @ =0x02000028
	mov ip, r3
	movs r4, #0
	ldrsh r1, [r3, r4]
	ldr r2, _0804EF0C @ =0x02017760
	movs r5, #0
	ldrsh r0, [r2, r5]
	subs r1, r1, r0
	ldr r4, _0804EF18 @ =0x0201FB00
	ldr r0, [r4]
	subs r6, r1, r0
	ldr r3, _0804EF1C @ =0x0200002C
	movs r0, #0
	ldrsh r1, [r3, r0]
	b _0804EF3C
	.align 2, 0
_0804EF0C: .4byte 0x02017760
_0804EF10: .4byte 0x02000038
_0804EF14: .4byte 0x02000028
_0804EF18: .4byte 0x0201FB00
_0804EF1C: .4byte 0x0200002C
_0804EF20:
	ldr r6, _0804EF88 @ =0x02000028
	mov ip, r6
	movs r0, #0
	ldrsh r1, [r6, r0]
	ldr r2, _0804EF8C @ =0x02017760
	movs r3, #0
	ldrsh r0, [r2, r3]
	adds r1, r1, r0
	ldr r4, _0804EF90 @ =0x0201FB00
	ldr r0, [r4]
	subs r6, r1, r0
	ldr r3, _0804EF94 @ =0x0200002C
	movs r5, #0
	ldrsh r1, [r3, r5]
_0804EF3C:
	movs r5, #2
	ldrsh r0, [r2, r5]
	subs r1, r1, r0
	mov r8, r1
	mov r5, ip
	movs r1, #2
	ldrsh r0, [r5, r1]
	movs r5, #0
	ldrsh r1, [r2, r5]
	adds r0, r0, r1
	ldr r1, [r4]
	subs r4, r0, r1
	movs r0, #2
	ldrsh r1, [r3, r0]
	movs r3, #2
	ldrsh r0, [r2, r3]
	subs r5, r1, r0
	ldr r0, _0804EF98 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0804EF9C
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	mov r3, r8
	lsls r2, r3, #0x10
	asrs r2, r2, #0x10
	movs r0, #0
	bl SetEkrFrontAnimPostion
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	lsls r2, r5, #0x10
	asrs r2, r2, #0x10
	movs r0, #1
	bl SetEkrFrontAnimPostion
	b _0804EFCE
	.align 2, 0
_0804EF88: .4byte 0x02000028
_0804EF8C: .4byte 0x02017760
_0804EF90: .4byte 0x0201FB00
_0804EF94: .4byte 0x0200002C
_0804EF98: .4byte 0x0203E02C
_0804EF9C:
	cmp r0, #0
	blt _0804EFCE
	cmp r0, #2
	bgt _0804EFCE
	ldr r0, [r7, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0804EFC0
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	mov r4, r8
	lsls r2, r4, #0x10
	asrs r2, r2, #0x10
	movs r0, #0
	bl SetEkrFrontAnimPostion
	b _0804EFCE
_0804EFC0:
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	lsls r2, r5, #0x10
	asrs r2, r2, #0x10
	movs r0, #1
	bl SetEkrFrontAnimPostion
_0804EFCE:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
