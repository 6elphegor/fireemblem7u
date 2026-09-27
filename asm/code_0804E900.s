	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804E900
sub_0804E900: @ 0x0804E900
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r3, [r6, #0x44]
	ldrh r4, [r6, #0x2c]
	movs r1, #0x2c
	ldrsh r0, [r6, r1]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r2, [r0]
	ldr r1, _0804E978 @ =0x00007FFF
	cmp r2, r1
	bne _0804E98C
	ldr r3, _0804E97C @ =0x02000028
	movs r4, #0
	ldrsh r2, [r3, r4]
	ldr r0, _0804E980 @ =0x0201FB00
	ldr r1, [r0]
	subs r7, r2, r1
	ldr r2, _0804E984 @ =0x0200002C
	movs r4, #2
	ldrsh r0, [r3, r4]
	subs r4, r0, r1
	movs r0, #2
	ldrsh r5, [r2, r0]
	lsls r1, r7, #0x10
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
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl CheckInEkrDragon
	cmp r0, #0
	beq _0804E96A
	ldrh r1, [r6, #0x34]
	ldrh r2, [r6, #0x3c]
	movs r0, #3
	bl SetBgOffset
_0804E96A:
	ldr r1, _0804E988 @ =0x0201773C
	movs r0, #0
	str r0, [r1]
	adds r0, r6, #0
	bl Proc_End
	b _0804EA9E
	.align 2, 0
_0804E978: .4byte 0x00007FFF
_0804E97C: .4byte 0x02000028
_0804E980: .4byte 0x0201FB00
_0804E984: .4byte 0x0200002C
_0804E988: .4byte 0x0201773C
_0804E98C:
	ldr r5, _0804E9E4 @ =0x02017760
	strh r2, [r5]
	movs r1, #0x2c
	ldrsh r0, [r6, r1]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r0, [r0, #2]
	strh r0, [r5, #2]
	adds r0, r4, #1
	strh r0, [r6, #0x2c]
	ldrh r1, [r5]
	ldrh r2, [r5, #2]
	movs r0, #2
	bl SetBgOffset
	bl CheckInEkrDragon
	cmp r0, #0
	beq _0804E9CC
	ldrh r2, [r6, #0x34]
	ldrh r3, [r5]
	adds r1, r2, r3
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r4, [r6, #0x3c]
	ldrh r0, [r5, #2]
	adds r2, r4, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #3
	bl SetBgOffset
_0804E9CC:
	bl CheckInEkrDragon
	cmp r0, #0
	beq _0804E9EC
	ldr r4, _0804E9E8 @ =0x02000028
	movs r2, #0
	ldrsh r1, [r4, r2]
	movs r3, #0
	ldrsh r0, [r5, r3]
	subs r1, r1, r0
	b _0804E9F8
	.align 2, 0
_0804E9E4: .4byte 0x02017760
_0804E9E8: .4byte 0x02000028
_0804E9EC:
	ldr r4, _0804EA58 @ =0x02000028
	movs r2, #0
	ldrsh r1, [r4, r2]
	movs r3, #0
	ldrsh r0, [r5, r3]
	adds r1, r1, r0
_0804E9F8:
	ldr r3, _0804EA5C @ =0x0201FB00
	ldr r0, [r3]
	subs r7, r1, r0
	ldr r2, _0804EA60 @ =0x0200002C
	movs r1, #0
	ldrsh r0, [r2, r1]
	mov r8, r0
	movs r1, #2
	ldrsh r0, [r5, r1]
	mov r1, r8
	subs r1, r1, r0
	mov r8, r1
	adds r5, r2, #0
	movs r2, #2
	ldrsh r1, [r4, r2]
	ldr r2, _0804EA64 @ =0x02017760
	movs r4, #0
	ldrsh r0, [r2, r4]
	adds r1, r1, r0
	ldr r0, [r3]
	subs r4, r1, r0
	movs r0, #2
	ldrsh r1, [r5, r0]
	movs r3, #2
	ldrsh r0, [r2, r3]
	subs r5, r1, r0
	ldr r0, _0804EA68 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0804EA6C
	lsls r1, r7, #0x10
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
	b _0804EA9E
	.align 2, 0
_0804EA58: .4byte 0x02000028
_0804EA5C: .4byte 0x0201FB00
_0804EA60: .4byte 0x0200002C
_0804EA64: .4byte 0x02017760
_0804EA68: .4byte 0x0203E02C
_0804EA6C:
	cmp r0, #0
	blt _0804EA9E
	cmp r0, #2
	bgt _0804EA9E
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0804EA90
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	mov r4, r8
	lsls r2, r4, #0x10
	asrs r2, r2, #0x10
	movs r0, #0
	bl SetEkrFrontAnimPostion
	b _0804EA9E
_0804EA90:
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	lsls r2, r5, #0x10
	asrs r2, r2, #0x10
	movs r0, #1
	bl SetEkrFrontAnimPostion
_0804EA9E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
