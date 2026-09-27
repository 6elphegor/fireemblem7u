	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803C558
sub_0803C558: @ 0x0803C558
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	movs r0, #0
	mov sb, r0
	ldr r0, _0803C5EC @ =0x030046B8
	movs r2, #1
	str r2, [r0]
	ldr r1, _0803C5F0 @ =0x08B98AEC
	ldr r0, [r1]
	mov r3, sb
	strb r3, [r0, #0x1e]
	ldr r0, _0803C5F4 @ =0x030046B4
	str r2, [r0]
	ldr r0, [r1]
	strb r3, [r0, #8]
	ldr r0, _0803C5F8 @ =0x0400010E
	mov r5, sb
	strh r5, [r0]
	ldr r2, [r1]
	ldr r3, _0803C5FC @ =0x04000128
	ldrh r0, [r3]
	lsls r1, r0, #0x10
	strh r0, [r2, #2]
	ldrh r0, [r2, #4]
	cmp r0, #6
	beq _0803C59C
	lsrs r0, r1, #0x14
	movs r1, #3
	ands r0, r1
	strb r0, [r2, #6]
_0803C59C:
	ldr r0, _0803C600 @ =0x04000120
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, #4]
	ldr r1, _0803C604 @ =0x030013C8
	movs r2, #0xc0
	lsls r2, r2, #7
	adds r0, r2, #0
	ldrb r1, [r1]
	orrs r0, r1
	strh r0, [r3]
	ldr r0, _0803C608 @ =0x00007FFF
	strh r0, [r3, #2]
	movs r5, #0
	ldr r3, _0803C60C @ =0x0000FFFF
	mov sl, r3
	mov r4, sp
	movs r7, #0
_0803C5C2:
	ldrh r0, [r4]
	cmp r0, #0
	beq _0803C610
	cmp r0, sl
	beq _0803C610
	ldr r1, _0803C5F0 @ =0x08B98AEC
	ldr r0, [r1]
	adds r0, #0xb
	adds r2, r0, r5
	ldrb r0, [r2]
	cmp r0, #0
	bne _0803C5DE
	movs r0, #1
	strb r0, [r2]
_0803C5DE:
	ldr r1, [r1]
	movs r0, #1
	lsls r0, r5
	ldrb r2, [r1, #8]
	orrs r0, r2
	strb r0, [r1, #8]
	b _0803C64A
	.align 2, 0
_0803C5EC: .4byte 0x030046B8
_0803C5F0: .4byte 0x08B98AEC
_0803C5F4: .4byte 0x030046B4
_0803C5F8: .4byte 0x0400010E
_0803C5FC: .4byte 0x04000128
_0803C600: .4byte 0x04000120
_0803C604: .4byte 0x030013C8
_0803C608: .4byte 0x00007FFF
_0803C60C: .4byte 0x0000FFFF
_0803C610:
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	bl sub_0803CD1C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803C64A
	ldr r0, _0803C63C @ =0x08B98AEC
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x12
	adds r0, r0, r7
	ldrh r0, [r0]
	cmp r0, sl
	bne _0803C640
	adds r0, r1, #0
	adds r0, #0x1a
	adds r0, r0, r5
	ldrb r1, [r0]
	adds r1, #1
	b _0803C648
	.align 2, 0
_0803C63C: .4byte 0x08B98AEC
_0803C640:
	adds r0, r1, #0
	adds r0, #0x1a
	adds r0, r0, r5
	movs r1, #0
_0803C648:
	strb r1, [r0]
_0803C64A:
	ldr r3, _0803C6A4 @ =0x08B98AEC
	mov r8, r3
	ldr r6, [r3]
	adds r3, r6, #0
	adds r3, #0x12
	adds r3, r3, r7
	mov ip, r3
	ldr r1, _0803C6A8 @ =0x0203C90C
	ldr r2, _0803C6AC @ =0x030013E8
	adds r2, r7, r2
	ldrh r3, [r2]
	lsls r0, r3, #3
	adds r0, r7, r0
	adds r0, r0, r1
	ldrh r1, [r4]
	strh r1, [r0]
	ldr r0, _0803C6B0 @ =0x0000FFFF
	ldrh r1, [r4]
	ands r0, r1
	mov r3, ip
	strh r0, [r3]
	ldrh r0, [r2]
	adds r0, #1
	ldr r1, _0803C6B4 @ =0x000001FF
	mov ip, r1
	mov r3, ip
	ands r0, r3
	strh r0, [r2]
	adds r4, #2
	adds r7, #2
	adds r5, #1
	cmp r5, #3
	ble _0803C5C2
	mov r4, r8
	adds r0, r6, #0
	ldrh r5, [r0, #4]
	cmp r5, #4
	bls _0803C770
	ldrb r0, [r0, #1]
	cmp r0, #1
	beq _0803C6B8
	cmp r0, #3
	beq _0803C718
	b _0803C770
	.align 2, 0
_0803C6A4: .4byte 0x08B98AEC
_0803C6A8: .4byte 0x0203C90C
_0803C6AC: .4byte 0x030013E8
_0803C6B0: .4byte 0x0000FFFF
_0803C6B4: .4byte 0x000001FF
_0803C6B8:
	ldr r0, _0803C704 @ =0x030013DA
	ldr r2, _0803C708 @ =0x030013D8
	ldrh r3, [r2]
	ldrh r0, [r0]
	cmp r0, r3
	beq _0803C6DE
	ldr r1, _0803C70C @ =0x0203C50C
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	add r0, sp, #8
	strh r1, [r0]
	adds r1, r3, #1
	mov r3, ip
	ands r1, r3
	strh r1, [r2]
	movs r1, #1
	bl SioSend16
_0803C6DE:
	ldr r1, [r4]
	movs r0, #6
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _0803C770
	ldr r5, _0803C710 @ =0x00001B7C
	adds r2, r1, r5
	ldrh r0, [r2]
	cmp r0, #0
	beq _0803C770
	ldr r1, _0803C714 @ =0x0400010C
	ldrh r2, [r2]
	rsbs r0, r2, #0
	str r0, [r1]
	adds r1, #2
	movs r0, #0xc3
	strh r0, [r1]
	b _0803C770
	.align 2, 0
_0803C704: .4byte 0x030013DA
_0803C708: .4byte 0x030013D8
_0803C70C: .4byte 0x0203C50C
_0803C710: .4byte 0x00001B7C
_0803C714: .4byte 0x0400010C
_0803C718:
	movs r0, #6
	ldrsb r0, [r6, r0]
	cmp r0, #0
	beq _0803C732
	adds r0, r6, #0
	adds r0, #0x30
	movs r1, #1
	bl SioSend16
	mov r0, r8
	ldr r1, [r0]
	ldr r0, _0803C788 @ =0x00005FFF
	strh r0, [r1, #0x30]
_0803C732:
	movs r5, #0
	ldr r6, _0803C78C @ =0x00001286
	mov r4, sp
_0803C738:
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	bl sub_0803CD1C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803C756
	ldrh r1, [r4]
	cmp r1, r6
	beq _0803C756
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
_0803C756:
	adds r4, #2
	adds r5, #1
	cmp r5, #3
	ble _0803C738
	mov r2, sb
	cmp r2, #0
	bne _0803C770
	ldr r0, _0803C790 @ =0x08B98AEC
	ldr r0, [r0]
	ldr r3, _0803C794 @ =0x00001B7E
	adds r0, r0, r3
	movs r1, #1
	strh r1, [r0]
_0803C770:
	ldr r1, _0803C798 @ =0x030046B4
	movs r0, #0
	str r0, [r1]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803C788: .4byte 0x00005FFF
_0803C78C: .4byte 0x00001286
_0803C790: .4byte 0x08B98AEC
_0803C794: .4byte 0x00001B7E
_0803C798: .4byte 0x030046B4
