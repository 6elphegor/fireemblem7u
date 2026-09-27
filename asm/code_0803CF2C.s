	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803CF2C
sub_0803CF2C: @ 0x0803CF2C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r1, [sp, #4]
	lsls r0, r0, #0x18
	movs r1, #0
	mov r8, r1
	movs r2, #0
	str r2, [sp, #0xc]
	ldr r1, _0803CFA4 @ =0x030013E0
	lsrs r3, r0, #0x18
	str r3, [sp]
	asrs r2, r0, #0x17
	adds r3, r2, r1
	ldr r0, _0803CFA8 @ =0x030013E8
	adds r7, r2, r0
	ldrh r5, [r7]
	mov sl, r1
	ldrh r0, [r3]
	cmp r0, r5
	beq _0803D02E
	ldr r1, _0803CFAC @ =0x0203C90C
	ldrh r4, [r3]
	lsls r0, r4, #3
	adds r0, r2, r0
	adds r0, r0, r1
	ldr r6, _0803CFB0 @ =0x00004FFF
	mov sb, r1
	ldrh r0, [r0]
	cmp r0, r6
	beq _0803CFB8
	cmp r4, r5
	beq _0803CFE6
	adds r4, r2, #0
	adds r2, r3, #0
	mov ip, r6
	adds r3, r7, #0
	ldr r6, _0803CFB4 @ =0x000001FF
	mov r5, sb
_0803CF80:
	ldrh r0, [r2]
	adds r0, #1
	ands r0, r6
	strh r0, [r2]
	ldrh r1, [r2]
	lsls r0, r1, #3
	adds r0, r4, r0
	adds r0, r0, r5
	ldrh r0, [r0]
	cmp r0, ip
	bne _0803CF9C
	ldrh r7, [r3]
	cmp r1, r7
	bne _0803CFB8
_0803CF9C:
	ldrh r0, [r3]
	cmp r1, r0
	bne _0803CF80
	b _0803CFE6
	.align 2, 0
_0803CFA4: .4byte 0x030013E0
_0803CFA8: .4byte 0x030013E8
_0803CFAC: .4byte 0x0203C90C
_0803CFB0: .4byte 0x00004FFF
_0803CFB4: .4byte 0x000001FF
_0803CFB8:
	ldr r1, [sp]
	lsls r0, r1, #0x18
	asrs r1, r0, #0x17
	ldr r3, _0803CFD8 @ =0x030013E8
	adds r2, r1, r3
	add r1, sl
	ldrh r2, [r2]
	ldrh r1, [r1]
	adds r4, r0, #0
	cmp r2, r1
	bhs _0803CFDC
	movs r7, #0x80
	lsls r7, r7, #2
	adds r0, r2, r7
	subs r0, r0, r1
	b _0803CFDE
	.align 2, 0
_0803CFD8: .4byte 0x030013E8
_0803CFDC:
	subs r0, r2, r1
_0803CFDE:
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #4
	bhi _0803CFEC
_0803CFE6:
	movs r0, #4
	rsbs r0, r0, #0
	b _0803D0D4
_0803CFEC:
	asrs r0, r4, #0x17
	add r0, sl
	ldrh r3, [r0]
	adds r3, #1
	ldr r0, _0803D000 @ =0x000001FF
	cmp r3, r0
	bgt _0803D004
	lsls r0, r3, #0x10
	lsrs r0, r0, #0x10
	b _0803D006
	.align 2, 0
_0803D000: .4byte 0x000001FF
_0803D004:
	movs r0, #0
_0803D006:
	asrs r4, r4, #0x17
	lsls r0, r0, #3
	adds r0, r4, r0
	add r0, sb
	ldrh r6, [r0]
	cmp r6, #0x80
	bls _0803D028
	mov r1, sl
	adds r0, r4, r1
	ldrh r1, [r0]
	adds r1, #1
	ldr r2, _0803D024 @ =0x000001FF
	ands r1, r2
	strh r1, [r0]
	b _0803CFE6
	.align 2, 0
_0803D024: .4byte 0x000001FF
_0803D028:
	adds r0, r6, #6
	cmp r0, r1
	ble _0803D034
_0803D02E:
	movs r0, #2
	rsbs r0, r0, #0
	b _0803D0D4
_0803D034:
	mov r3, sl
	adds r2, r4, r3
	ldrh r0, [r2]
	adds r0, #2
	ldr r7, _0803D0C8 @ =0x000001FF
	ands r0, r7
	strh r0, [r2]
	ldrh r1, [r2]
	lsls r0, r1, #3
	adds r0, r4, r0
	add r0, sb
	ldrh r0, [r0]
	str r0, [sp, #8]
	adds r1, #1
	ands r1, r7
	strh r1, [r2]
	ldrh r1, [r2]
	lsls r0, r1, #3
	adds r0, r4, r0
	add r0, sb
	ldrh r0, [r0]
	mov sl, r0
	adds r1, #1
	ands r1, r7
	strh r1, [r2]
	ldr r0, _0803D0CC @ =0x00004FFF
	add r0, r8
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	movs r3, #0
	cmp r3, r6
	bge _0803D0B6
	mov ip, r4
	adds r4, r2, #0
	ldr r5, [sp, #4]
_0803D07E:
	ldrh r7, [r4]
	lsls r0, r7, #3
	add r0, ip
	add r0, sb
	ldrh r2, [r0]
	adds r3, #1
	adds r1, r2, #0
	muls r1, r3, r1
	mov r7, r8
	adds r0, r7, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	mvns r1, r1
	ldr r0, [sp, #0xc]
	adds r1, r0, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #0xc]
	strh r2, [r5]
	ldrh r0, [r4]
	adds r0, #1
	ldr r1, _0803D0C8 @ =0x000001FF
	ands r0, r1
	strh r0, [r4]
	adds r5, #2
	cmp r3, r6
	blt _0803D07E
_0803D0B6:
	ldr r2, [sp, #8]
	cmp r8, r2
	bne _0803D0C2
	ldr r3, [sp, #0xc]
	cmp r3, sl
	beq _0803D0D0
_0803D0C2:
	movs r0, #3
	rsbs r0, r0, #0
	b _0803D0D4
	.align 2, 0
_0803D0C8: .4byte 0x000001FF
_0803D0CC: .4byte 0x00004FFF
_0803D0D0:
	lsls r0, r6, #0x11
	asrs r0, r0, #0x10
_0803D0D4:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
