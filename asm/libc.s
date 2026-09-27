	.include "macro.inc"

	.syntax unified

	thumb_func_start memcpy
memcpy: @ 0x080BFF98
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r3, r1, #0
	cmp r2, #0xf
	bls _080BFFD8
	adds r0, r3, #0
	orrs r0, r5
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _080BFFD8
	adds r1, r5, #0
_080BFFB2:
	ldm r3!, {r0}
	stm r1!, {r0}
	ldm r3!, {r0}
	stm r1!, {r0}
	ldm r3!, {r0}
	stm r1!, {r0}
	ldm r3!, {r0}
	stm r1!, {r0}
	subs r2, #0x10
	cmp r2, #0xf
	bhi _080BFFB2
	cmp r2, #3
	bls _080BFFD6
_080BFFCC:
	ldm r3!, {r0}
	stm r1!, {r0}
	subs r2, #4
	cmp r2, #3
	bhi _080BFFCC
_080BFFD6:
	adds r4, r1, #0
_080BFFD8:
	subs r2, #1
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	beq _080BFFF2
	adds r1, r0, #0
_080BFFE4:
	ldrb r0, [r3]
	strb r0, [r4]
	adds r3, #1
	adds r4, #1
	subs r2, #1
	cmp r2, r1
	bne _080BFFE4
_080BFFF2:
	adds r0, r5, #0
	pop {r4, r5, pc}
	.align 2, 0

	thumb_func_start memset
memset: @ 0x080BFFF8
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r3, r5, #0
	cmp r2, #3
	bls _080C003E
	movs r0, #3
	ands r0, r5
	cmp r0, #0
	bne _080C003E
	adds r1, r5, #0
	movs r0, #0xff
	ands r4, r0
	lsls r3, r4, #8
	orrs r3, r4
	lsls r0, r3, #0x10
	orrs r3, r0
	cmp r2, #0xf
	bls _080C0032
_080C001E:
	stm r1!, {r3}
	stm r1!, {r3}
	stm r1!, {r3}
	stm r1!, {r3}
	subs r2, #0x10
	cmp r2, #0xf
	bhi _080C001E
	b _080C0032
_080C002E:
	stm r1!, {r3}
	subs r2, #4
_080C0032:
	cmp r2, #3
	bhi _080C002E
	adds r3, r1, #0
	b _080C003E
_080C003A:
	strb r4, [r3]
	adds r3, #1
_080C003E:
	adds r0, r2, #0
	subs r2, #1
	cmp r0, #0
	bne _080C003A
	adds r0, r5, #0
	pop {r4, r5, pc}
	.align 2, 0
_080C004C:
	.byte 0x0C, 0xB4, 0x30, 0xB5
	.byte 0x96, 0xB0, 0x19, 0x9C, 0x6B, 0x46, 0x00, 0x25, 0x82, 0x22, 0x92, 0x00, 0x9A, 0x81, 0x00, 0x91
	.byte 0x04, 0x91, 0x08, 0x49, 0x02, 0x91, 0x05, 0x91, 0x15, 0x90, 0x1A, 0xAA, 0x68, 0x46, 0x21, 0x1C
	.byte 0x00, 0xF0, 0xBC, 0xF8, 0x00, 0x99, 0x0D, 0x70, 0x16, 0xB0, 0x30, 0xBC, 0x08, 0xBC, 0x02, 0xB0
	.byte 0x18, 0x47, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0x7F

	thumb_func_start sub_080C0088
sub_080C0088: @ 0x080C0088
	push {r1, r2, r3}
	push {r4, lr}
	sub sp, #0x58
	ldr r1, [sp, #0x60]
	mov r3, sp
	movs r4, #0
	movs r2, #0x82
	lsls r2, r2, #2
	strh r2, [r3, #0xc]
	str r0, [sp]
	str r0, [sp, #0x10]
	ldr r0, _080C00C0 @ =0x7FFFFFFF
	str r0, [sp, #8]
	str r0, [sp, #0x14]
	ldr r0, _080C00C4 @ =0x08CF6638
	ldr r0, [r0]
	str r0, [sp, #0x54]
	add r2, sp, #0x64
	mov r0, sp
	bl sub_080C01EC
	ldr r1, [sp]
	strb r4, [r1]
	add sp, #0x58
	pop {r4}
	pop {r3}
	add sp, #0xc
	bx r3
	.align 2, 0
_080C00C0: .4byte 0x7FFFFFFF
_080C00C4: .4byte 0x08CF6638

	thumb_func_start strcpy
strcpy: @ 0x080C00C8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r3, r6, #0
	adds r2, r1, #0
	adds r0, r2, #0
	orrs r0, r6
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _080C0100
	ldr r1, [r2]
	ldr r5, _080C00E8 @ =0xFEFEFEFF
	adds r0, r1, r5
	bics r0, r1
	ldr r4, _080C00EC @ =0x80808080
	b _080C00FA
	.align 2, 0
_080C00E8: .4byte 0xFEFEFEFF
_080C00EC: .4byte 0x80808080
_080C00F0:
	ldm r2!, {r0}
	stm r3!, {r0}
	ldr r1, [r2]
	adds r0, r1, r5
	bics r0, r1
_080C00FA:
	ands r0, r4
	cmp r0, #0
	beq _080C00F0
_080C0100:
	ldrb r0, [r2]
	strb r0, [r3]
	lsls r0, r0, #0x18
	adds r2, #1
	adds r3, #1
	cmp r0, #0
	bne _080C0100
	adds r0, r6, #0
	pop {r4, r5, r6, pc}
	.align 2, 0

	thumb_func_start strlen
strlen: @ 0x080C0114
	push {r4, r5, lr}
	adds r1, r0, #0
	adds r5, r1, #0
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _080C014C
	adds r2, r1, #0
	ldr r1, [r2]
	ldr r4, _080C0130 @ =0xFEFEFEFF
	adds r0, r1, r4
	bics r0, r1
	ldr r3, _080C0134 @ =0x80808080
	b _080C0140
	.align 2, 0
_080C0130: .4byte 0xFEFEFEFF
_080C0134: .4byte 0x80808080
_080C0138:
	adds r2, #4
	ldr r1, [r2]
	adds r0, r1, r4
	bics r0, r1
_080C0140:
	ands r0, r3
	cmp r0, #0
	beq _080C0138
	adds r1, r2, #0
	b _080C014C
_080C014A:
	adds r1, #1
_080C014C:
	ldrb r0, [r1]
	cmp r0, #0
	bne _080C014A
	subs r0, r1, r5
	pop {r4, r5, pc}
	.align 2, 0

	thumb_func_start strstr
strstr: @ 0x080C0158
	push {r4, lr}
	adds r4, r1, #0
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _080C0170
	adds r1, r4, #0
	bl sub_080C2634
	movs r1, #0
	str r1, [r4, #8]
	str r1, [r4, #4]
	b _080C0174
_080C0170:
	str r1, [r4, #4]
	movs r0, #0
_080C0174:
	pop {r4, pc}
	.align 2, 0

	thumb_func_start sub_080C0178
sub_080C0178: @ 0x080C0178
	push {r4, r5, lr}
	ldr r4, _080C01E8 @ =0xFFFFFBA8
	add sp, r4
	adds r5, r0, #0
	ldr r0, [r5, #0x54]
	str r0, [sp, #0x54]
	mov r3, sp
	movs r0, #3
	rsbs r0, r0, #0
	ldrh r4, [r5, #0xc]
	ands r0, r4
	movs r4, #0
	strh r0, [r3, #0xc]
	ldrh r0, [r5, #0xe]
	strh r0, [r3, #0xe]
	ldr r0, [r5, #0x1c]
	str r0, [sp, #0x1c]
	ldr r0, [r5, #0x24]
	str r0, [sp, #0x24]
	add r0, sp, #0x58
	str r0, [sp]
	str r0, [sp, #0x10]
	movs r0, #0x80
	lsls r0, r0, #3
	str r0, [sp, #8]
	str r0, [sp, #0x14]
	str r4, [sp, #0x18]
	mov r0, sp
	bl sub_080C01EC
	adds r4, r0, #0
	cmp r4, #0
	blt _080C01C8
	mov r0, sp
	bl sub_080C21C4
	cmp r0, #0
	beq _080C01C8
	movs r4, #1
	rsbs r4, r4, #0
_080C01C8:
	mov r1, sp
	movs r0, #0x40
	ldrh r1, [r1, #0xc]
	ands r0, r1
	cmp r0, #0
	beq _080C01DC
	movs r0, #0x40
	ldrh r1, [r5, #0xc]
	orrs r0, r1
	strh r0, [r5, #0xc]
_080C01DC:
	adds r0, r4, #0
	movs r3, #0x8b
	lsls r3, r3, #3
	add sp, r3
	pop {r4, r5, pc}
	.align 2, 0
_080C01E8: .4byte 0xFFFFFBA8

	thumb_func_start sub_080C01EC
sub_080C01EC: @ 0x080C01EC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r3, r2, #0
	ldr r0, [r4, #0x54]
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_080C0200
	pop {r4, r5, pc}

	thumb_func_start sub_080C0200
sub_080C0200: @ 0x080C0200
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r4, _080C0268 @ =0xFFFFFDE0
	add sp, r4
	str r0, [sp, #0x1dc]
	str r1, [sp, #0x1e0]
	adds r4, r2, #0
	mov sl, r3
	bl sub_080C28FC
	ldr r0, [r0]
	str r0, [sp, #0x1f8]
	movs r1, #0
	add r0, sp, #0x1d0
	str r1, [r0]
	ldr r1, [sp, #0x1e0]
	ldr r0, [r1, #0x54]
	cmp r0, #0
	bne _080C0232
	ldr r0, _080C026C @ =0x08CF6638
	ldr r0, [r0]
	str r0, [r1, #0x54]
_080C0232:
	ldr r2, [sp, #0x1e0]
	ldr r1, [r2, #0x54]
	ldr r0, [r1, #0x38]
	cmp r0, #0
	bne _080C0242
	adds r0, r1, #0
	bl sub_080C2354
_080C0242:
	movs r0, #8
	ldr r1, [sp, #0x1e0]
	ldrh r1, [r1, #0xc]
	ands r0, r1
	cmp r0, #0
	beq _080C0256
	ldr r2, [sp, #0x1e0]
	ldr r0, [r2, #0x10]
	cmp r0, #0
	bne _080C0270
_080C0256:
	ldr r0, [sp, #0x1e0]
	bl sub_080C12C4
	cmp r0, #0
	beq _080C0270
	movs r0, #1
	rsbs r0, r0, #0
	bl _080C1150
	.align 2, 0
_080C0268: .4byte 0xFFFFFDE0
_080C026C: .4byte 0x08CF6638
_080C0270:
	movs r0, #0x1a
	ldr r1, [sp, #0x1e0]
	ldrh r1, [r1, #0xc]
	ands r0, r1
	cmp r0, #0xa
	bne _080C0294
	ldr r2, [sp, #0x1e0]
	movs r1, #0xe
	ldrsh r0, [r2, r1]
	cmp r0, #0
	blt _080C0294
	adds r0, r2, #0
	adds r1, r4, #0
	mov r2, sl
	bl sub_080C0178
	bl _080C1150
_080C0294:
	str r4, [sp, #0x1e4]
	add r1, sp, #0x1c
	add r5, sp, #0x28
	str r5, [sp, #0x1c]
	movs r0, #0
	str r0, [r1, #8]
	str r0, [r1, #4]
	movs r2, #0
	str r2, [sp, #0x1f0]
	mov sb, r1
	movs r4, #0xe6
	lsls r4, r4, #1
	add r4, sp
	str r4, [sp, #0x214]
	movs r0, #0xe8
	lsls r0, r0, #1
	add r0, sp
	str r0, [sp, #0x218]
_080C02B8:
	ldr r1, [sp, #0x1e4]
	mov r8, r1
_080C02BC:
	ldr r0, _080C0368 @ =0x08CF6638
	ldr r0, [r0]
	ldr r1, _080C036C @ =0x08CF663C
	ldr r3, [r1]
	ldr r2, [sp, #0x218]
	str r2, [sp]
	ldr r1, [sp, #0x214]
	ldr r2, [sp, #0x1e4]
	bl sub_080C2F04
	adds r4, r0, #0
	cmp r4, #0
	ble _080C02EA
	ldr r0, [sp, #0x1e4]
	adds r0, r0, r4
	str r0, [sp, #0x1e4]
	add r0, sp, #0x1cc
	ldr r0, [r0]
	cmp r0, #0x25
	bne _080C02BC
	ldr r1, [sp, #0x1e4]
	subs r1, #1
	str r1, [sp, #0x1e4]
_080C02EA:
	ldr r2, [sp, #0x1e4]
	mov r0, r8
	subs r6, r2, r0
	cmp r6, #0
	beq _080C0322
	str r0, [r5]
	str r6, [r5, #4]
	mov r1, sb
	ldr r0, [r1, #8]
	adds r0, r0, r6
	str r0, [r1, #8]
	adds r5, #8
	ldr r0, [r1, #4]
	adds r0, #1
	str r0, [r1, #4]
	cmp r0, #7
	ble _080C031C
	ldr r0, [sp, #0x1e0]
	bl strstr
	cmp r0, #0
	beq _080C031A
	bl _080C113C
_080C031A:
	add r5, sp, #0x28
_080C031C:
	ldr r2, [sp, #0x1f0]
	adds r2, r2, r6
	str r2, [sp, #0x1f0]
_080C0322:
	cmp r4, #0
	bgt _080C032A
	bl _080C1124
_080C032A:
	ldr r4, [sp, #0x1e4]
	adds r4, #1
	str r4, [sp, #0x1e4]
	movs r0, #0
	str r0, [sp, #0x1ec]
	movs r1, #0
	str r1, [sp, #0x208]
	movs r2, #0
	str r2, [sp, #0x1f4]
	movs r6, #1
	rsbs r6, r6, #0
	ldr r0, _080C0370 @ =0x000001C9
	add r0, sp
	strb r2, [r0]
_080C0346:
	ldr r0, [sp, #0x1e4]
	ldrb r0, [r0]
	str r0, [sp, #0x1e8]
	ldr r1, [sp, #0x1e4]
	adds r1, #1
	str r1, [sp, #0x1e4]
_080C0352:
	ldr r0, [sp, #0x1e8]
	subs r0, #0x20
	cmp r0, #0x58
	bls _080C035C
	b _080C0A0E
_080C035C:
	lsls r0, r0, #2
	ldr r1, _080C0374 @ =_080C0378
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C0368: .4byte 0x08CF6638
_080C036C: .4byte 0x08CF663C
_080C0370: .4byte 0x000001C9
_080C0374: .4byte _080C0378
_080C0378: @ jump table
	.4byte _080C04DC @ case 0
	.4byte _080C0A0E @ case 1
	.4byte _080C0A0E @ case 2
	.4byte _080C04F4 @ case 3
	.4byte _080C0A0E @ case 4
	.4byte _080C0A0E @ case 5
	.4byte _080C0A0E @ case 6
	.4byte _080C0A0E @ case 7
	.4byte _080C0A0E @ case 8
	.4byte _080C0A0E @ case 9
	.4byte _080C04F8 @ case 10
	.4byte _080C0512 @ case 11
	.4byte _080C0A0E @ case 12
	.4byte _080C050E @ case 13
	.4byte _080C0520 @ case 14
	.4byte _080C0A0E @ case 15
	.4byte _080C0580 @ case 16
	.4byte _080C0584 @ case 17
	.4byte _080C0584 @ case 18
	.4byte _080C0584 @ case 19
	.4byte _080C0584 @ case 20
	.4byte _080C0584 @ case 21
	.4byte _080C0584 @ case 22
	.4byte _080C0584 @ case 23
	.4byte _080C0584 @ case 24
	.4byte _080C0584 @ case 25
	.4byte _080C0A0E @ case 26
	.4byte _080C0A0E @ case 27
	.4byte _080C0A0E @ case 28
	.4byte _080C0A0E @ case 29
	.4byte _080C0A0E @ case 30
	.4byte _080C0A0E @ case 31
	.4byte _080C0A0E @ case 32
	.4byte _080C0A0E @ case 33
	.4byte _080C0A0E @ case 34
	.4byte _080C0A0E @ case 35
	.4byte _080C05EE @ case 36
	.4byte _080C0640 @ case 37
	.4byte _080C0A0E @ case 38
	.4byte _080C0640 @ case 39
	.4byte _080C0A0E @ case 40
	.4byte _080C0A0E @ case 41
	.4byte _080C0A0E @ case 42
	.4byte _080C0A0E @ case 43
	.4byte _080C05A8 @ case 44
	.4byte _080C0A0E @ case 45
	.4byte _080C0A0E @ case 46
	.4byte _080C07F6 @ case 47
	.4byte _080C0A0E @ case 48
	.4byte _080C0A0E @ case 49
	.4byte _080C0A0E @ case 50
	.4byte _080C0A0E @ case 51
	.4byte _080C0A0E @ case 52
	.4byte _080C088E @ case 53
	.4byte _080C0A0E @ case 54
	.4byte _080C0A0E @ case 55
	.4byte _080C08CA @ case 56
	.4byte _080C0A0E @ case 57
	.4byte _080C0A0E @ case 58
	.4byte _080C0A0E @ case 59
	.4byte _080C0A0E @ case 60
	.4byte _080C0A0E @ case 61
	.4byte _080C0A0E @ case 62
	.4byte _080C0A0E @ case 63
	.4byte _080C0A0E @ case 64
	.4byte _080C0A0E @ case 65
	.4byte _080C0A0E @ case 66
	.4byte _080C05DC @ case 67
	.4byte _080C05F6 @ case 68
	.4byte _080C0640 @ case 69
	.4byte _080C0640 @ case 70
	.4byte _080C0640 @ case 71
	.4byte _080C05AC @ case 72
	.4byte _080C05F6 @ case 73
	.4byte _080C0A0E @ case 74
	.4byte _080C0A0E @ case 75
	.4byte _080C05B0 @ case 76
	.4byte _080C0A0E @ case 77
	.4byte _080C07B0 @ case 78
	.4byte _080C07FE @ case 79
	.4byte _080C082C @ case 80
	.4byte _080C05D2 @ case 81
	.4byte _080C0A0E @ case 82
	.4byte _080C084C @ case 83
	.4byte _080C0A0E @ case 84
	.4byte _080C0896 @ case 85
	.4byte _080C0A0E @ case 86
	.4byte _080C0A0E @ case 87
	.4byte _080C08D4 @ case 88
_080C04DC:
	ldr r1, _080C04F0 @ =0x000001C9
	add r1, sp
	ldrb r0, [r1]
	cmp r0, #0
	beq _080C04E8
	b _080C0346
_080C04E8:
	movs r0, #0x20
	strb r0, [r1]
	b _080C0346
	.align 2, 0
_080C04F0: .4byte 0x000001C9
_080C04F4:
	movs r0, #1
	b _080C05C0
_080C04F8:
	movs r4, #4
	add sl, r4
	mov r0, sl
	subs r0, #4
	ldr r0, [r0]
	str r0, [sp, #0x1f4]
	cmp r0, #0
	blt _080C050A
	b _080C0346
_080C050A:
	rsbs r0, r0, #0
	str r0, [sp, #0x1f4]
_080C050E:
	movs r0, #4
	b _080C05D4
_080C0512:
	ldr r1, _080C051C @ =0x000001C9
	add r1, sp
	movs r0, #0x2b
	strb r0, [r1]
	b _080C0346
	.align 2, 0
_080C051C: .4byte 0x000001C9
_080C0520:
	ldr r2, [sp, #0x1e4]
	ldrb r2, [r2]
	str r2, [sp, #0x1e8]
	ldr r4, [sp, #0x1e4]
	adds r4, #1
	str r4, [sp, #0x1e4]
	cmp r2, #0x2a
	bne _080C054A
	movs r0, #4
	add sl, r0
	mov r0, sl
	subs r0, #4
	ldr r4, [r0]
	adds r6, r4, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r6, r0
	blt _080C0546
	b _080C0346
_080C0546:
	adds r6, r0, #0
	b _080C0346
_080C054A:
	movs r4, #0
	ldr r0, [sp, #0x1e8]
	b _080C056A
_080C0550:
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #1
	subs r0, #0x30
	ldr r1, [sp, #0x1e8]
	adds r4, r0, r1
	ldr r2, [sp, #0x1e4]
	ldrb r2, [r2]
	str r2, [sp, #0x1e8]
	ldr r0, [sp, #0x1e4]
	adds r0, #1
	str r0, [sp, #0x1e4]
	adds r0, r2, #0
_080C056A:
	subs r0, #0x30
	cmp r0, #9
	bls _080C0550
	adds r6, r4, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r6, r0
	blt _080C057C
	b _080C0352
_080C057C:
	adds r6, r0, #0
	b _080C0352
_080C0580:
	movs r0, #0x80
	b _080C05D4
_080C0584:
	movs r4, #0
_080C0586:
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #1
	subs r0, #0x30
	ldr r2, [sp, #0x1e8]
	adds r4, r0, r2
	ldr r0, [sp, #0x1e4]
	ldrb r0, [r0]
	str r0, [sp, #0x1e8]
	ldr r1, [sp, #0x1e4]
	adds r1, #1
	str r1, [sp, #0x1e4]
	subs r0, #0x30
	cmp r0, #9
	bls _080C0586
	str r4, [sp, #0x1f4]
	b _080C0352
_080C05A8:
	movs r0, #8
	b _080C05C0
_080C05AC:
	movs r0, #0x40
	b _080C05CA
_080C05B0:
	ldr r0, [sp, #0x1e4]
	ldrb r0, [r0]
	cmp r0, #0x6c
	bne _080C05C8
	ldr r1, [sp, #0x1e4]
	adds r1, #1
	str r1, [sp, #0x1e4]
	movs r0, #0x20
_080C05C0:
	ldr r2, [sp, #0x1ec]
	orrs r2, r0
	str r2, [sp, #0x1ec]
	b _080C0346
_080C05C8:
	movs r0, #0x10
_080C05CA:
	ldr r4, [sp, #0x1ec]
	orrs r4, r0
	str r4, [sp, #0x1ec]
	b _080C0346
_080C05D2:
	movs r0, #0x20
_080C05D4:
	ldr r1, [sp, #0x1ec]
	orrs r1, r0
	str r1, [sp, #0x1ec]
	b _080C0346
_080C05DC:
	add r2, sp, #0x68
	mov r8, r2
	movs r4, #4
	add sl, r4
	mov r0, sl
	subs r0, #4
	ldr r0, [r0]
	strb r0, [r2]
	b _080C0A1C
_080C05EE:
	movs r0, #0x10
	ldr r1, [sp, #0x1ec]
	orrs r1, r0
	str r1, [sp, #0x1ec]
_080C05F6:
	movs r0, #0x10
	ldr r2, [sp, #0x1ec]
	ands r0, r2
	cmp r0, #0
	beq _080C0606
	movs r4, #4
	add sl, r4
	b _080C0622
_080C0606:
	movs r0, #0x40
	ldr r1, [sp, #0x1ec]
	ands r0, r1
	cmp r0, #0
	beq _080C061E
	movs r2, #4
	add sl, r2
	mov r0, sl
	subs r0, #4
	movs r1, #0
	ldrsh r4, [r0, r1]
	b _080C0628
_080C061E:
	movs r2, #4
	add sl, r2
_080C0622:
	mov r0, sl
	subs r0, #4
	ldr r4, [r0]
_080C0628:
	cmp r4, #0
	bge _080C0636
	rsbs r4, r4, #0
	ldr r1, _080C063C @ =0x000001C9
	add r1, sp
	movs r0, #0x2d
	strb r0, [r1]
_080C0636:
	movs r2, #1
	b _080C0922
	.align 2, 0
_080C063C: .4byte 0x000001C9
_080C0640:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r6, r0
	bne _080C064C
	movs r6, #6
	b _080C065C
_080C064C:
	ldr r4, [sp, #0x1e8]
	cmp r4, #0x67
	beq _080C0656
	cmp r4, #0x47
	bne _080C065C
_080C0656:
	cmp r6, #0
	bne _080C065C
	movs r6, #1
_080C065C:
	movs r0, #8
	ldr r1, [sp, #0x1ec]
	ands r0, r1
	movs r2, #8
	add sl, r2
	mov r0, sl
	subs r0, #8
	ldr r1, [r0]
	ldr r2, [r0, #4]
	str r1, [sp, #0x1fc]
	str r2, [sp, #0x200]
	ldr r0, [sp, #0x1fc]
	ldr r1, [sp, #0x200]
	bl sub_080C3910
	cmp r0, #0
	beq _080C06B0
	ldr r3, _080C06A4 @ =0x00000000
	ldr r2, _080C06A0 @ =0x00000000
	ldr r0, [sp, #0x1fc]
	ldr r1, [sp, #0x200]
	bl sub_080C4BF8
	cmp r0, #0
	bge _080C0696
	ldr r1, _080C06A8 @ =0x000001C9
	add r1, sp
	movs r0, #0x2d
	strb r0, [r1]
_080C0696:
	ldr r2, _080C06AC @ =0x08B855FC
	mov r8, r2
	movs r3, #3
	b _080C0A26
	.align 2, 0
_080C06A0: .4byte 0x00000000
_080C06A4: .4byte 0x00000000
_080C06A8: .4byte 0x000001C9
_080C06AC: .4byte 0x08B855FC
_080C06B0:
	ldr r0, [sp, #0x1fc]
	ldr r1, [sp, #0x200]
	bl sub_080C3934
	cmp r0, #0
	beq _080C06C8
	ldr r4, _080C06C4 @ =0x08B85600
	mov r8, r4
	movs r3, #3
	b _080C0A26
	.align 2, 0
_080C06C4: .4byte 0x08B85600
_080C06C8:
	movs r0, #0x80
	lsls r0, r0, #1
	ldr r1, [sp, #0x1ec]
	orrs r1, r0
	str r1, [sp, #0x1ec]
	str r1, [sp]
	add r0, sp, #0x1c8
	str r0, [sp, #4]
	add r0, sp, #0x1d4
	str r0, [sp, #8]
	ldr r2, [sp, #0x1e8]
	str r2, [sp, #0xc]
	add r0, sp, #0x1d8
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x1dc]
	ldr r1, [sp, #0x1fc]
	ldr r2, [sp, #0x200]
	adds r3, r6, #0
	bl sub_080C1160
	mov r8, r0
	ldr r4, [sp, #0x1e8]
	cmp r4, #0x67
	beq _080C06FC
	cmp r4, #0x47
	bne _080C071E
_080C06FC:
	add r0, sp, #0x1d4
	ldr r1, [r0]
	movs r0, #4
	rsbs r0, r0, #0
	cmp r1, r0
	ble _080C070C
	cmp r1, r6
	ble _080C071A
_080C070C:
	movs r0, #0x45
	ldr r1, [sp, #0x1e8]
	cmp r1, #0x67
	bne _080C0716
	movs r0, #0x65
_080C0716:
	str r0, [sp, #0x1e8]
	b _080C071E
_080C071A:
	movs r2, #0x67
	str r2, [sp, #0x1e8]
_080C071E:
	ldr r4, [sp, #0x1e8]
	cmp r4, #0x65
	bgt _080C0744
	add r0, sp, #0x1d4
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	add r0, sp, #0x14
	ldr r2, [sp, #0x1e8]
	bl sub_080C1254
	str r0, [sp, #0x204]
	add r0, sp, #0x1d8
	ldr r0, [r0]
	ldr r1, [sp, #0x204]
	adds r3, r1, r0
	cmp r0, #1
	bgt _080C0784
	b _080C077A
_080C0744:
	ldr r4, [sp, #0x1e8]
	cmp r4, #0x66
	bne _080C076C
	add r0, sp, #0x1d4
	ldr r0, [r0]
	cmp r0, #0
	ble _080C0768
	adds r3, r0, #0
	cmp r6, #0
	bne _080C0762
	movs r0, #1
	ldr r1, [sp, #0x1ec]
	ands r0, r1
	cmp r0, #0
	beq _080C0794
_080C0762:
	adds r0, r3, #1
	adds r3, r0, r6
	b _080C0794
_080C0768:
	adds r3, r6, #2
	b _080C0794
_080C076C:
	add r0, sp, #0x1d4
	ldr r1, [r0]
	add r0, sp, #0x1d8
	ldr r0, [r0]
	cmp r1, r0
	blt _080C0788
	adds r3, r1, #0
_080C077A:
	movs r0, #1
	ldr r2, [sp, #0x1ec]
	ands r0, r2
	cmp r0, #0
	beq _080C0794
_080C0784:
	adds r3, #1
	b _080C0794
_080C0788:
	cmp r1, #0
	bgt _080C0792
	adds r0, #2
	subs r3, r0, r1
	b _080C0794
_080C0792:
	adds r3, r0, #1
_080C0794:
	add r0, sp, #0x1c8
	ldrb r0, [r0]
	adds r7, r5, #0
	adds r7, #8
	cmp r0, #0
	bne _080C07A2
	b _080C0A2A
_080C07A2:
	ldr r1, _080C07AC @ =0x000001C9
	add r1, sp
	movs r0, #0x2d
	strb r0, [r1]
	b _080C0A2A
	.align 2, 0
_080C07AC: .4byte 0x000001C9
_080C07B0:
	movs r0, #0x10
	ldr r4, [sp, #0x1ec]
	ands r0, r4
	cmp r0, #0
	beq _080C07CA
	movs r0, #4
	add sl, r0
	mov r0, sl
	subs r0, #4
	ldr r0, [r0]
	ldr r1, [sp, #0x1f0]
	str r1, [r0]
	b _080C02B8
_080C07CA:
	movs r0, #0x40
	ldr r2, [sp, #0x1ec]
	ands r2, r0
	cmp r2, #0
	beq _080C07E6
	movs r4, #4
	add sl, r4
	mov r0, sl
	subs r0, #4
	ldr r0, [r0]
	add r1, sp, #0x1f0
	ldrh r1, [r1]
	strh r1, [r0]
	b _080C02B8
_080C07E6:
	movs r2, #4
	add sl, r2
	mov r0, sl
	subs r0, #4
	ldr r0, [r0]
	ldr r4, [sp, #0x1f0]
	str r4, [r0]
	b _080C02B8
_080C07F6:
	movs r0, #0x10
	ldr r1, [sp, #0x1ec]
	orrs r1, r0
	str r1, [sp, #0x1ec]
_080C07FE:
	movs r0, #0x10
	ldr r2, [sp, #0x1ec]
	ands r0, r2
	cmp r0, #0
	bne _080C081E
	movs r0, #0x40
	ldr r1, [sp, #0x1ec]
	ands r0, r1
	cmp r0, #0
	beq _080C081E
	movs r2, #4
	add sl, r2
	mov r0, sl
	subs r0, #4
	ldrh r4, [r0]
	b _080C0828
_080C081E:
	movs r4, #4
	add sl, r4
	mov r0, sl
	subs r0, #4
	ldr r4, [r0]
_080C0828:
	movs r2, #0
	b _080C091A
_080C082C:
	movs r0, #4
	add sl, r0
	mov r0, sl
	subs r0, #4
	ldr r4, [r0]
	movs r2, #2
	ldr r1, _080C0848 @ =0x08B85604
	str r1, [sp, #0x210]
	ldr r0, [sp, #0x1ec]
	orrs r0, r2
	str r0, [sp, #0x1ec]
	movs r1, #0x78
	str r1, [sp, #0x1e8]
	b _080C091A
	.align 2, 0
_080C0848: .4byte 0x08B85604
_080C084C:
	movs r2, #4
	add sl, r2
	mov r0, sl
	subs r0, #4
	ldr r0, [r0]
	mov r8, r0
	cmp r0, #0
	bne _080C0860
	ldr r4, _080C0880 @ =0x08B85618
	mov r8, r4
_080C0860:
	cmp r6, #0
	blt _080C0884
	mov r0, r8
	movs r1, #0
	adds r2, r6, #0
	bl sub_080C2F30
	cmp r0, #0
	beq _080C087C
	mov r1, r8
	subs r3, r0, r1
	cmp r3, r6
	bgt _080C087C
	b _080C0A1E
_080C087C:
	adds r3, r6, #0
	b _080C0A1E
	.align 2, 0
_080C0880: .4byte 0x08B85618
_080C0884:
	mov r0, r8
	bl strlen
	adds r3, r0, #0
	b _080C0A1E
_080C088E:
	movs r0, #0x10
	ldr r2, [sp, #0x1ec]
	orrs r2, r0
	str r2, [sp, #0x1ec]
_080C0896:
	movs r0, #0x10
	ldr r4, [sp, #0x1ec]
	ands r0, r4
	cmp r0, #0
	beq _080C08A6
	movs r0, #4
	add sl, r0
	b _080C08C0
_080C08A6:
	movs r0, #0x40
	ldr r1, [sp, #0x1ec]
	ands r0, r1
	cmp r0, #0
	beq _080C08BC
	movs r2, #4
	add sl, r2
	mov r0, sl
	subs r0, #4
	ldrh r4, [r0]
	b _080C08C6
_080C08BC:
	movs r4, #4
	add sl, r4
_080C08C0:
	mov r0, sl
	subs r0, #4
	ldr r4, [r0]
_080C08C6:
	movs r2, #1
	b _080C091A
_080C08CA:
	ldr r0, _080C08D0 @ =0x08B85620
	str r0, [sp, #0x210]
	b _080C08D8
	.align 2, 0
_080C08D0: .4byte 0x08B85620
_080C08D4:
	ldr r1, _080C08F8 @ =0x08B85604
	str r1, [sp, #0x210]
_080C08D8:
	movs r0, #0x10
	ldr r2, [sp, #0x1ec]
	ands r0, r2
	cmp r0, #0
	bne _080C08FC
	movs r0, #0x40
	ldr r1, [sp, #0x1ec]
	ands r0, r1
	cmp r0, #0
	beq _080C08FC
	movs r2, #4
	add sl, r2
	mov r0, sl
	subs r0, #4
	ldrh r4, [r0]
	b _080C0906
	.align 2, 0
_080C08F8: .4byte 0x08B85604
_080C08FC:
	movs r4, #4
	add sl, r4
	mov r0, sl
	subs r0, #4
	ldr r4, [r0]
_080C0906:
	movs r2, #2
	movs r0, #1
	ldr r1, [sp, #0x1ec]
	ands r0, r1
	cmp r0, #0
	beq _080C091A
	cmp r4, #0
	beq _080C091A
	orrs r1, r2
	str r1, [sp, #0x1ec]
_080C091A:
	ldr r1, _080C0964 @ =0x000001C9
	add r1, sp
	movs r0, #0
	strb r0, [r1]
_080C0922:
	str r6, [sp, #0x208]
	cmp r6, #0
	blt _080C0932
	movs r0, #0x81
	rsbs r0, r0, #0
	ldr r1, [sp, #0x1ec]
	ands r1, r0
	str r1, [sp, #0x1ec]
_080C0932:
	movs r0, #0xe2
	lsls r0, r0, #1
	add r0, sp
	mov r8, r0
	cmp r4, #0
	bne _080C0948
	adds r7, r5, #0
	adds r7, #8
	ldr r1, [sp, #0x208]
	cmp r1, #0
	beq _080C0A00
_080C0948:
	cmp r2, #1
	beq _080C09A6
	cmp r2, #1
	blo _080C096C
	cmp r2, #2
	beq _080C09E0
	ldr r2, _080C0968 @ =0x08B85634
	mov r8, r2
	mov r0, r8
	bl strlen
	adds r3, r0, #0
	b _080C0A26
	.align 2, 0
_080C0964: .4byte 0x000001C9
_080C0968: .4byte 0x08B85634
_080C096C:
	adds r7, r5, #0
	adds r7, #8
	movs r2, #7
_080C0972:
	movs r0, #1
	rsbs r0, r0, #0
	add r8, r0
	adds r0, r4, #0
	ands r0, r2
	adds r1, r0, #0
	adds r1, #0x30
	mov r0, r8
	strb r1, [r0]
	lsrs r4, r4, #3
	cmp r4, #0
	bne _080C0972
	movs r0, #1
	ldr r2, [sp, #0x1ec]
	ands r0, r2
	cmp r0, #0
	beq _080C0A00
	cmp r1, #0x30
	beq _080C0A00
	movs r4, #1
	rsbs r4, r4, #0
	add r8, r4
	movs r0, #0x30
	mov r1, r8
	strb r0, [r1]
	b _080C0A00
_080C09A6:
	adds r7, r5, #0
	adds r7, #8
	cmp r4, #9
	bls _080C09D0
_080C09AE:
	movs r2, #1
	rsbs r2, r2, #0
	add r8, r2
	adds r0, r4, #0
	movs r1, #0xa
	bl __umodsi3
	adds r0, #0x30
	mov r1, r8
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0xa
	bl __udivsi3
	adds r4, r0, #0
	cmp r4, #9
	bhi _080C09AE
_080C09D0:
	movs r2, #1
	rsbs r2, r2, #0
	add r8, r2
	adds r0, r4, #0
	adds r0, #0x30
	mov r4, r8
	strb r0, [r4]
	b _080C0A00
_080C09E0:
	adds r7, r5, #0
	adds r7, #8
	movs r1, #0xf
_080C09E6:
	movs r0, #1
	rsbs r0, r0, #0
	add r8, r0
	adds r0, r4, #0
	ands r0, r1
	ldr r2, [sp, #0x210]
	adds r0, r2, r0
	ldrb r0, [r0]
	mov r2, r8
	strb r0, [r2]
	lsrs r4, r4, #4
	cmp r4, #0
	bne _080C09E6
_080C0A00:
	add r4, sp, #0x14
	mov r1, r8
	subs r0, r4, r1
	movs r2, #0xd8
	lsls r2, r2, #1
	adds r3, r0, r2
	b _080C0A2A
_080C0A0E:
	ldr r4, [sp, #0x1e8]
	cmp r4, #0
	bne _080C0A16
	b _080C1124
_080C0A16:
	add r0, sp, #0x68
	mov r8, r0
	strb r4, [r0]
_080C0A1C:
	movs r3, #1
_080C0A1E:
	ldr r1, _080C0A48 @ =0x000001C9
	add r1, sp
	movs r0, #0
	strb r0, [r1]
_080C0A26:
	adds r7, r5, #0
	adds r7, #8
_080C0A2A:
	str r3, [sp, #0x20c]
	ldr r2, [sp, #0x208]
	cmp r3, r2
	bge _080C0A34
	str r2, [sp, #0x20c]
_080C0A34:
	ldr r0, _080C0A48 @ =0x000001C9
	add r0, sp
	ldrb r0, [r0]
	cmp r0, #0
	beq _080C0A4C
	ldr r4, [sp, #0x20c]
	adds r4, #1
	str r4, [sp, #0x20c]
	b _080C0A5C
	.align 2, 0
_080C0A48: .4byte 0x000001C9
_080C0A4C:
	movs r0, #2
	ldr r1, [sp, #0x1ec]
	ands r0, r1
	cmp r0, #0
	beq _080C0A5C
	ldr r2, [sp, #0x20c]
	adds r2, #2
	str r2, [sp, #0x20c]
_080C0A5C:
	movs r0, #0x84
	ldr r4, [sp, #0x1ec]
	ands r0, r4
	cmp r0, #0
	bne _080C0ADC
	ldr r0, [sp, #0x1f4]
	ldr r1, [sp, #0x20c]
	subs r4, r0, r1
	cmp r4, #0
	ble _080C0ADC
	ldr r1, _080C0B08 @ =0x08B855DC
	cmp r4, #0x10
	ble _080C0AB0
	mov r6, sb
_080C0A78:
	str r1, [r5]
	movs r0, #0x10
	str r0, [r5, #4]
	ldr r0, [r6, #8]
	adds r0, #0x10
	str r0, [r6, #8]
	adds r5, r7, #0
	ldr r0, [r6, #4]
	adds r0, #1
	str r0, [r6, #4]
	cmp r0, #7
	ble _080C0AA6
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	str r3, [sp, #0x21c]
	bl strstr
	ldr r3, [sp, #0x21c]
	cmp r0, #0
	beq _080C0AA2
	b _080C113C
_080C0AA2:
	add r5, sp, #0x28
	ldr r1, _080C0B08 @ =0x08B855DC
_080C0AA6:
	subs r4, #0x10
	adds r7, r5, #0
	adds r7, #8
	cmp r4, #0x10
	bgt _080C0A78
_080C0AB0:
	str r1, [r5]
	str r4, [r5, #4]
	mov r2, sb
	ldr r0, [r2, #8]
	adds r0, r0, r4
	str r0, [r2, #8]
	adds r5, r7, #0
	ldr r0, [r2, #4]
	adds r0, #1
	str r0, [r2, #4]
	cmp r0, #7
	ble _080C0ADC
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	str r3, [sp, #0x21c]
	bl strstr
	ldr r3, [sp, #0x21c]
	cmp r0, #0
	beq _080C0ADA
	b _080C113C
_080C0ADA:
	add r5, sp, #0x28
_080C0ADC:
	ldr r1, _080C0B0C @ =0x000001C9
	add r1, sp
	ldrb r0, [r1]
	cmp r0, #0
	beq _080C0B10
	str r1, [r5]
	movs r0, #1
	str r0, [r5, #4]
	mov r4, sb
	ldr r0, [r4, #8]
	adds r0, #1
	str r0, [r4, #8]
	adds r5, #8
	ldr r0, [r4, #4]
	adds r0, #1
	str r0, [r4, #4]
	cmp r0, #7
	ble _080C0B50
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	b _080C0B40
	.align 2, 0
_080C0B08: .4byte 0x08B855DC
_080C0B0C: .4byte 0x000001C9
_080C0B10:
	movs r2, #2
	ldr r0, [sp, #0x1ec]
	ands r0, r2
	cmp r0, #0
	beq _080C0B50
	add r1, sp, #0x1c4
	movs r0, #0x30
	strb r0, [r1]
	add r0, sp, #0x1e8
	ldrb r0, [r0]
	strb r0, [r1, #1]
	str r1, [r5]
	str r2, [r5, #4]
	mov r1, sb
	ldr r0, [r1, #8]
	adds r0, #2
	str r0, [r1, #8]
	adds r5, #8
	ldr r0, [r1, #4]
	adds r0, #1
	str r0, [r1, #4]
	cmp r0, #7
	ble _080C0B50
	ldr r0, [sp, #0x1e0]
_080C0B40:
	str r3, [sp, #0x21c]
	bl strstr
	ldr r3, [sp, #0x21c]
	cmp r0, #0
	beq _080C0B4E
	b _080C113C
_080C0B4E:
	add r5, sp, #0x28
_080C0B50:
	movs r0, #0x84
	ldr r2, [sp, #0x1ec]
	ands r0, r2
	cmp r0, #0x80
	bne _080C0BCC
	ldr r0, [sp, #0x1f4]
	ldr r1, [sp, #0x20c]
	subs r4, r0, r1
	cmp r4, #0
	ble _080C0BCC
	ldr r1, _080C0C68 @ =0x08B855EC
	cmp r4, #0x10
	ble _080C0BA0
	mov r6, sb
_080C0B6C:
	str r1, [r5]
	movs r0, #0x10
	str r0, [r5, #4]
	ldr r0, [r6, #8]
	adds r0, #0x10
	str r0, [r6, #8]
	adds r5, #8
	ldr r0, [r6, #4]
	adds r0, #1
	str r0, [r6, #4]
	cmp r0, #7
	ble _080C0B9A
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	str r3, [sp, #0x21c]
	bl strstr
	ldr r3, [sp, #0x21c]
	cmp r0, #0
	beq _080C0B96
	b _080C113C
_080C0B96:
	add r5, sp, #0x28
	ldr r1, _080C0C68 @ =0x08B855EC
_080C0B9A:
	subs r4, #0x10
	cmp r4, #0x10
	bgt _080C0B6C
_080C0BA0:
	str r1, [r5]
	str r4, [r5, #4]
	mov r2, sb
	ldr r0, [r2, #8]
	adds r0, r0, r4
	str r0, [r2, #8]
	adds r5, #8
	ldr r0, [r2, #4]
	adds r0, #1
	str r0, [r2, #4]
	cmp r0, #7
	ble _080C0BCC
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	str r3, [sp, #0x21c]
	bl strstr
	ldr r3, [sp, #0x21c]
	cmp r0, #0
	beq _080C0BCA
	b _080C113C
_080C0BCA:
	add r5, sp, #0x28
_080C0BCC:
	ldr r0, [sp, #0x208]
	subs r4, r0, r3
	cmp r4, #0
	ble _080C0C3A
	ldr r1, _080C0C68 @ =0x08B855EC
	cmp r4, #0x10
	ble _080C0C10
	mov r6, sb
_080C0BDC:
	str r1, [r5]
	movs r0, #0x10
	str r0, [r5, #4]
	ldr r0, [r6, #8]
	adds r0, #0x10
	str r0, [r6, #8]
	adds r5, #8
	ldr r0, [r6, #4]
	adds r0, #1
	str r0, [r6, #4]
	cmp r0, #7
	ble _080C0C0A
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	str r3, [sp, #0x21c]
	bl strstr
	ldr r3, [sp, #0x21c]
	cmp r0, #0
	beq _080C0C06
	b _080C113C
_080C0C06:
	add r5, sp, #0x28
	ldr r1, _080C0C68 @ =0x08B855EC
_080C0C0A:
	subs r4, #0x10
	cmp r4, #0x10
	bgt _080C0BDC
_080C0C10:
	str r1, [r5]
	str r4, [r5, #4]
	mov r1, sb
	ldr r0, [r1, #8]
	adds r0, r0, r4
	str r0, [r1, #8]
	adds r5, #8
	ldr r0, [r1, #4]
	adds r0, #1
	str r0, [r1, #4]
	cmp r0, #7
	ble _080C0C3A
	ldr r0, [sp, #0x1e0]
	str r3, [sp, #0x21c]
	bl strstr
	ldr r3, [sp, #0x21c]
	cmp r0, #0
	beq _080C0C38
	b _080C113C
_080C0C38:
	add r5, sp, #0x28
_080C0C3A:
	movs r0, #0x80
	lsls r0, r0, #1
	ldr r2, [sp, #0x1ec]
	ands r0, r2
	cmp r0, #0
	bne _080C0C6C
	mov r4, r8
	str r4, [r5]
	str r3, [r5, #4]
	mov r1, sb
	ldr r0, [r1, #8]
	adds r0, r0, r3
	str r0, [r1, #8]
	adds r5, #8
	ldr r0, [r1, #4]
	adds r0, #1
	str r0, [r1, #4]
	cmp r0, #7
	bgt _080C0C62
	b _080C1082
_080C0C62:
	ldr r0, [sp, #0x1e0]
	b _080C1078
	.align 2, 0
_080C0C68: .4byte 0x08B855EC
_080C0C6C:
	ldr r2, [sp, #0x1e8]
	cmp r2, #0x65
	bgt _080C0C74
	b _080C0F58
_080C0C74:
	ldr r3, _080C0D40 @ =0x00000000
	ldr r2, _080C0D3C @ =0x00000000
	ldr r0, [sp, #0x1fc]
	ldr r1, [sp, #0x200]
	bl sub_080C4AC8
	cmp r0, #0
	bne _080C0D4C
	ldr r0, _080C0D44 @ =0x08B85650
	str r0, [r5]
	movs r6, #1
	str r6, [r5, #4]
	mov r4, sb
	ldr r0, [r4, #8]
	adds r0, #1
	str r0, [r4, #8]
	adds r5, #8
	ldr r0, [r4, #4]
	adds r0, #1
	str r0, [r4, #4]
	cmp r0, #7
	ble _080C0CB0
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	bl strstr
	cmp r0, #0
	beq _080C0CAE
	b _080C113C
_080C0CAE:
	add r5, sp, #0x28
_080C0CB0:
	add r0, sp, #0x1d4
	ldr r1, [r0]
	add r4, sp, #0x1d8
	ldr r0, [r4]
	cmp r1, r0
	blt _080C0CC6
	ldr r0, [sp, #0x1ec]
	ands r0, r6
	cmp r0, #0
	bne _080C0CC6
	b _080C1082
_080C0CC6:
	ldr r0, [sp, #0x1f8]
	str r0, [r5]
	str r6, [r5, #4]
	mov r1, sb
	ldr r0, [r1, #8]
	adds r0, #1
	str r0, [r1, #8]
	adds r5, #8
	ldr r0, [r1, #4]
	adds r0, #1
	str r0, [r1, #4]
	cmp r0, #7
	ble _080C0CEE
	ldr r0, [sp, #0x1e0]
	bl strstr
	cmp r0, #0
	beq _080C0CEC
	b _080C113C
_080C0CEC:
	add r5, sp, #0x28
_080C0CEE:
	ldr r0, [r4]
	subs r4, r0, #1
	cmp r4, #0
	bgt _080C0CF8
	b _080C1082
_080C0CF8:
	ldr r1, _080C0D48 @ =0x08B855EC
	cmp r4, #0x10
	ble _080C0D30
	mov r6, sb
_080C0D00:
	str r1, [r5]
	movs r0, #0x10
	str r0, [r5, #4]
	ldr r0, [r6, #8]
	adds r0, #0x10
	str r0, [r6, #8]
	adds r5, #8
	ldr r0, [r6, #4]
	adds r0, #1
	str r0, [r6, #4]
	cmp r0, #7
	ble _080C0D2A
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	bl strstr
	cmp r0, #0
	beq _080C0D26
	b _080C113C
_080C0D26:
	add r5, sp, #0x28
	ldr r1, _080C0D48 @ =0x08B855EC
_080C0D2A:
	subs r4, #0x10
	cmp r4, #0x10
	bgt _080C0D00
_080C0D30:
	str r1, [r5]
	str r4, [r5, #4]
	mov r2, sb
	ldr r0, [r2, #8]
	adds r0, r0, r4
	b _080C1066
	.align 2, 0
_080C0D3C: .4byte 0x00000000
_080C0D40: .4byte 0x00000000
_080C0D44: .4byte 0x08B85650
_080C0D48: .4byte 0x08B855EC
_080C0D4C:
	add r6, sp, #0x1d4
	ldr r2, [r6]
	cmp r2, #0
	bgt _080C0E34
	ldr r0, _080C0E2C @ =0x08B85650
	str r0, [r5]
	movs r4, #1
	str r4, [r5, #4]
	mov r1, sb
	ldr r0, [r1, #8]
	adds r0, #1
	str r0, [r1, #8]
	adds r5, #8
	ldr r0, [r1, #4]
	adds r0, #1
	str r0, [r1, #4]
	cmp r0, #7
	ble _080C0D7E
	ldr r0, [sp, #0x1e0]
	bl strstr
	cmp r0, #0
	beq _080C0D7C
	b _080C113C
_080C0D7C:
	add r5, sp, #0x28
_080C0D7E:
	ldr r2, [sp, #0x1f8]
	str r2, [r5]
	str r4, [r5, #4]
	mov r4, sb
	ldr r0, [r4, #8]
	adds r0, #1
	str r0, [r4, #8]
	adds r5, #8
	ldr r0, [r4, #4]
	adds r0, #1
	str r0, [r4, #4]
	cmp r0, #7
	ble _080C0DA8
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	bl strstr
	cmp r0, #0
	beq _080C0DA6
	b _080C113C
_080C0DA6:
	add r5, sp, #0x28
_080C0DA8:
	ldr r0, [r6]
	rsbs r4, r0, #0
	cmp r4, #0
	ble _080C0E0E
	ldr r1, _080C0E30 @ =0x08B855EC
	cmp r4, #0x10
	ble _080C0DE8
	mov r6, sb
_080C0DB8:
	str r1, [r5]
	movs r0, #0x10
	str r0, [r5, #4]
	ldr r0, [r6, #8]
	adds r0, #0x10
	str r0, [r6, #8]
	adds r5, #8
	ldr r0, [r6, #4]
	adds r0, #1
	str r0, [r6, #4]
	cmp r0, #7
	ble _080C0DE2
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	bl strstr
	cmp r0, #0
	beq _080C0DDE
	b _080C113C
_080C0DDE:
	add r5, sp, #0x28
	ldr r1, _080C0E30 @ =0x08B855EC
_080C0DE2:
	subs r4, #0x10
	cmp r4, #0x10
	bgt _080C0DB8
_080C0DE8:
	str r1, [r5]
	str r4, [r5, #4]
	mov r1, sb
	ldr r0, [r1, #8]
	adds r0, r0, r4
	str r0, [r1, #8]
	adds r5, #8
	ldr r0, [r1, #4]
	adds r0, #1
	str r0, [r1, #4]
	cmp r0, #7
	ble _080C0E0E
	ldr r0, [sp, #0x1e0]
	bl strstr
	cmp r0, #0
	beq _080C0E0C
	b _080C113C
_080C0E0C:
	add r5, sp, #0x28
_080C0E0E:
	mov r2, r8
	str r2, [r5]
	add r0, sp, #0x1d8
	ldr r1, [r0]
	str r1, [r5, #4]
	mov r4, sb
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	adds r5, #8
	ldr r0, [r4, #4]
	adds r0, #1
	str r0, [r4, #4]
	b _080C1070
	.align 2, 0
_080C0E2C: .4byte 0x08B85650
_080C0E30: .4byte 0x08B855EC
_080C0E34:
	add r4, sp, #0x1d8
	ldr r1, [r4]
	cmp r2, r1
	blt _080C0EF0
	mov r0, r8
	str r0, [r5]
	str r1, [r5, #4]
	mov r2, sb
	ldr r0, [r2, #8]
	adds r0, r0, r1
	str r0, [r2, #8]
	adds r5, #8
	ldr r0, [r2, #4]
	adds r0, #1
	str r0, [r2, #4]
	cmp r0, #7
	ble _080C0E66
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	bl strstr
	cmp r0, #0
	beq _080C0E64
	b _080C113C
_080C0E64:
	add r5, sp, #0x28
_080C0E66:
	ldr r1, [r6]
	ldr r0, [r4]
	subs r4, r1, r0
	cmp r4, #0
	ble _080C0ECE
	ldr r1, _080C0EE8 @ =0x08B855EC
	cmp r4, #0x10
	ble _080C0EA8
	mov r6, sb
_080C0E78:
	str r1, [r5]
	movs r0, #0x10
	str r0, [r5, #4]
	ldr r0, [r6, #8]
	adds r0, #0x10
	str r0, [r6, #8]
	adds r5, #8
	ldr r0, [r6, #4]
	adds r0, #1
	str r0, [r6, #4]
	cmp r0, #7
	ble _080C0EA2
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	bl strstr
	cmp r0, #0
	beq _080C0E9E
	b _080C113C
_080C0E9E:
	add r5, sp, #0x28
	ldr r1, _080C0EE8 @ =0x08B855EC
_080C0EA2:
	subs r4, #0x10
	cmp r4, #0x10
	bgt _080C0E78
_080C0EA8:
	str r1, [r5]
	str r4, [r5, #4]
	mov r1, sb
	ldr r0, [r1, #8]
	adds r0, r0, r4
	str r0, [r1, #8]
	adds r5, #8
	ldr r0, [r1, #4]
	adds r0, #1
	str r0, [r1, #4]
	cmp r0, #7
	ble _080C0ECE
	ldr r0, [sp, #0x1e0]
	bl strstr
	cmp r0, #0
	beq _080C0ECC
	b _080C113C
_080C0ECC:
	add r5, sp, #0x28
_080C0ECE:
	movs r1, #1
	ldr r0, [sp, #0x1ec]
	ands r0, r1
	cmp r0, #0
	bne _080C0EDA
	b _080C1082
_080C0EDA:
	ldr r0, _080C0EEC @ =0x08B85654
	str r0, [r5]
	str r1, [r5, #4]
	mov r2, sb
	ldr r0, [r2, #8]
	adds r0, #1
	b _080C1066
	.align 2, 0
_080C0EE8: .4byte 0x08B855EC
_080C0EEC: .4byte 0x08B85654
_080C0EF0:
	mov r0, r8
	str r0, [r5]
	str r2, [r5, #4]
	mov r1, sb
	ldr r0, [r1, #8]
	adds r0, r0, r2
	str r0, [r1, #8]
	adds r5, #8
	ldr r0, [r1, #4]
	adds r0, #1
	str r0, [r1, #4]
	cmp r0, #7
	ble _080C0F18
	ldr r0, [sp, #0x1e0]
	bl strstr
	cmp r0, #0
	beq _080C0F16
	b _080C113C
_080C0F16:
	add r5, sp, #0x28
_080C0F18:
	ldr r0, [r6]
	add r8, r0
	ldr r0, _080C0F54 @ =0x08B85654
	str r0, [r5]
	movs r0, #1
	str r0, [r5, #4]
	mov r2, sb
	ldr r0, [r2, #8]
	adds r0, #1
	str r0, [r2, #8]
	adds r5, #8
	ldr r0, [r2, #4]
	adds r0, #1
	str r0, [r2, #4]
	cmp r0, #7
	ble _080C0F48
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	bl strstr
	cmp r0, #0
	beq _080C0F46
	b _080C113C
_080C0F46:
	add r5, sp, #0x28
_080C0F48:
	mov r0, r8
	str r0, [r5]
	ldr r1, [r4]
	ldr r0, [r6]
	subs r1, r1, r0
	b _080C105E
	.align 2, 0
_080C0F54: .4byte 0x08B85654
_080C0F58:
	add r4, sp, #0x1d8
	ldr r0, [r4]
	cmp r0, #1
	bgt _080C0F6A
	movs r1, #1
	ldr r0, [sp, #0x1ec]
	ands r0, r1
	cmp r0, #0
	beq _080C1030
_080C0F6A:
	add r1, sp, #0x1c4
	mov r2, r8
	ldrb r0, [r2]
	strb r0, [r1]
	movs r0, #1
	add r8, r0
	movs r0, #0x2e
	strb r0, [r1, #1]
	str r1, [r5]
	movs r0, #2
	str r0, [r5, #4]
	mov r1, sb
	ldr r0, [r1, #8]
	adds r0, #2
	str r0, [r1, #8]
	adds r5, #8
	ldr r0, [r1, #4]
	adds r0, #1
	str r0, [r1, #4]
	cmp r0, #7
	ble _080C0FA2
	ldr r0, [sp, #0x1e0]
	bl strstr
	cmp r0, #0
	beq _080C0FA0
	b _080C113C
_080C0FA0:
	add r5, sp, #0x28
_080C0FA2:
	ldr r3, _080C0FCC @ =0x00000000
	ldr r2, _080C0FC8 @ =0x00000000
	ldr r0, [sp, #0x1fc]
	ldr r1, [sp, #0x200]
	bl sub_080C4B14
	cmp r0, #0
	beq _080C0FD0
	mov r2, r8
	str r2, [r5]
	ldr r1, [r4]
	subs r0, r1, #1
	str r0, [r5, #4]
	mov r4, sb
	ldr r0, [r4, #8]
	subs r0, #1
	adds r0, r0, r1
	b _080C103C
	.align 2, 0
_080C0FC8: .4byte 0x00000000
_080C0FCC: .4byte 0x00000000
_080C0FD0:
	ldr r0, [r4]
	subs r4, r0, #1
	cmp r4, #0
	ble _080C1058
	ldr r1, _080C102C @ =0x08B855EC
	cmp r4, #0x10
	ble _080C1010
	mov r6, sb
_080C0FE0:
	str r1, [r5]
	movs r0, #0x10
	str r0, [r5, #4]
	ldr r0, [r6, #8]
	adds r0, #0x10
	str r0, [r6, #8]
	adds r5, #8
	ldr r0, [r6, #4]
	adds r0, #1
	str r0, [r6, #4]
	cmp r0, #7
	ble _080C100A
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	bl strstr
	cmp r0, #0
	beq _080C1006
	b _080C113C
_080C1006:
	add r5, sp, #0x28
	ldr r1, _080C102C @ =0x08B855EC
_080C100A:
	subs r4, #0x10
	cmp r4, #0x10
	bgt _080C0FE0
_080C1010:
	str r1, [r5]
	str r4, [r5, #4]
	mov r1, sb
	ldr r0, [r1, #8]
	adds r0, r0, r4
	str r0, [r1, #8]
	adds r5, #8
	ldr r0, [r1, #4]
	adds r0, #1
	str r0, [r1, #4]
	cmp r0, #7
	ble _080C1058
	ldr r0, [sp, #0x1e0]
	b _080C104E
	.align 2, 0
_080C102C: .4byte 0x08B855EC
_080C1030:
	mov r2, r8
	str r2, [r5]
	str r1, [r5, #4]
	mov r4, sb
	ldr r0, [r4, #8]
	adds r0, #1
_080C103C:
	str r0, [r4, #8]
	adds r5, #8
	ldr r0, [r4, #4]
	adds r0, #1
	str r0, [r4, #4]
	cmp r0, #7
	ble _080C1058
	ldr r0, [sp, #0x1e0]
	mov r1, sb
_080C104E:
	bl strstr
	cmp r0, #0
	bne _080C113C
	add r5, sp, #0x28
_080C1058:
	add r0, sp, #0x14
	str r0, [r5]
	ldr r1, [sp, #0x204]
_080C105E:
	str r1, [r5, #4]
	mov r2, sb
	ldr r0, [r2, #8]
	adds r0, r0, r1
_080C1066:
	str r0, [r2, #8]
	adds r5, #8
	ldr r0, [r2, #4]
	adds r0, #1
	str r0, [r2, #4]
_080C1070:
	cmp r0, #7
	ble _080C1082
	ldr r0, [sp, #0x1e0]
	mov r1, sb
_080C1078:
	bl strstr
	cmp r0, #0
	bne _080C113C
	add r5, sp, #0x28
_080C1082:
	movs r0, #4
	ldr r4, [sp, #0x1ec]
	ands r4, r0
	cmp r4, #0
	beq _080C10EE
	ldr r0, [sp, #0x1f4]
	ldr r1, [sp, #0x20c]
	subs r4, r0, r1
	cmp r4, #0
	ble _080C10EE
	ldr r1, _080C1120 @ =0x08B855DC
	cmp r4, #0x10
	ble _080C10CC
	mov r6, sb
_080C109E:
	str r1, [r5]
	movs r0, #0x10
	str r0, [r5, #4]
	ldr r0, [r6, #8]
	adds r0, #0x10
	str r0, [r6, #8]
	adds r5, #8
	ldr r0, [r6, #4]
	adds r0, #1
	str r0, [r6, #4]
	cmp r0, #7
	ble _080C10C6
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	bl strstr
	cmp r0, #0
	bne _080C113C
	add r5, sp, #0x28
	ldr r1, _080C1120 @ =0x08B855DC
_080C10C6:
	subs r4, #0x10
	cmp r4, #0x10
	bgt _080C109E
_080C10CC:
	str r1, [r5]
	str r4, [r5, #4]
	mov r2, sb
	ldr r0, [r2, #8]
	adds r0, r0, r4
	str r0, [r2, #8]
	ldr r0, [r2, #4]
	adds r0, #1
	str r0, [r2, #4]
	cmp r0, #7
	ble _080C10EE
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	bl strstr
	cmp r0, #0
	bne _080C113C
_080C10EE:
	ldr r0, [sp, #0x20c]
	ldr r4, [sp, #0x1f4]
	cmp r0, r4
	bge _080C10F8
	adds r0, r4, #0
_080C10F8:
	ldr r1, [sp, #0x1f0]
	adds r1, r1, r0
	str r1, [sp, #0x1f0]
	mov r2, sb
	ldr r0, [r2, #8]
	cmp r0, #0
	beq _080C1112
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	bl strstr
	cmp r0, #0
	bne _080C113C
_080C1112:
	movs r0, #0
	mov r4, sb
	str r0, [r4, #4]
	add r5, sp, #0x28
	bl _080C02B8
	.align 2, 0
_080C1120: .4byte 0x08B855DC
_080C1124:
	mov r1, sb
	ldr r0, [r1, #8]
	cmp r0, #0
	beq _080C1136
	ldr r0, [sp, #0x1e0]
	bl strstr
	cmp r0, #0
	bne _080C113C
_080C1136:
	movs r0, #0
	mov r1, sb
	str r0, [r1, #4]
_080C113C:
	movs r0, #0x40
	ldr r2, [sp, #0x1e0]
	ldrh r2, [r2, #0xc]
	ands r0, r2
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, #0
	bne _080C114E
	ldr r1, [sp, #0x1f0]
_080C114E:
	adds r0, r1, #0
_080C1150:
	movs r3, #0x88
	lsls r3, r3, #2
	add sp, r3
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}

	thumb_func_start sub_080C1160
sub_080C1160: @ 0x080C1160
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	str r0, [sp, #0x18]
	adds r5, r2, #0
	adds r4, r1, #0
	mov r8, r3
	ldr r6, [sp, #0x3c]
	ldr r0, [sp, #0x44]
	mov sl, r0
	ldr r1, [sp, #0x48]
	mov sb, r1
	cmp r1, #0x66
	bne _080C1186
	movs r7, #3
	b _080C1196
_080C1186:
	mov r0, sb
	cmp r0, #0x65
	beq _080C1190
	cmp r0, #0x45
	bne _080C1194
_080C1190:
	movs r1, #1
	add r8, r1
_080C1194:
	movs r7, #2
_080C1196:
	lsls r0, r4, #0x1f
	lsrs r0, r0, #0x1f
	cmp r0, #0
	beq _080C11AC
	adds r1, r5, #0
	adds r0, r4, #0
	bl sub_080C4D80
	adds r5, r1, #0
	adds r4, r0, #0
	movs r0, #0x2d
_080C11AC:
	ldr r1, [sp, #0x40]
	strb r0, [r1]
	mov r0, r8
	str r0, [sp]
	mov r1, sl
	str r1, [sp, #4]
	add r0, sp, #0x10
	str r0, [sp, #8]
	add r0, sp, #0x14
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x18]
	adds r2, r5, #0
	adds r1, r4, #0
	adds r3, r7, #0
	bl sub_080C14CC
	adds r7, r0, #0
	mov r1, sb
	cmp r1, #0x67
	beq _080C11D8
	cmp r1, #0x47
	bne _080C11E0
_080C11D8:
	movs r0, #1
	ands r6, r0
	cmp r6, #0
	beq _080C1234
_080C11E0:
	mov r0, r8
	adds r6, r7, r0
	mov r1, sb
	cmp r1, #0x66
	bne _080C1210
	ldrb r0, [r7]
	cmp r0, #0x30
	bne _080C120A
	ldr r3, _080C1250 @ =0x00000000
	ldr r2, _080C124C @ =0x00000000
	adds r1, r5, #0
	adds r0, r4, #0
	bl sub_080C4B14
	cmp r0, #0
	beq _080C120A
	mov r1, r8
	rsbs r0, r1, #0
	adds r0, #1
	mov r1, sl
	str r0, [r1]
_080C120A:
	mov r1, sl
	ldr r0, [r1]
	adds r6, r6, r0
_080C1210:
	ldr r3, _080C1250 @ =0x00000000
	ldr r2, _080C124C @ =0x00000000
	adds r1, r5, #0
	adds r0, r4, #0
	bl sub_080C4AC8
	cmp r0, #0
	bne _080C1222
	str r6, [sp, #0x14]
_080C1222:
	ldr r0, [sp, #0x14]
	cmp r0, r6
	bhs _080C1234
	movs r1, #0x30
_080C122A:
	strb r1, [r0]
	adds r0, #1
	str r0, [sp, #0x14]
	cmp r0, r6
	blo _080C122A
_080C1234:
	ldr r0, [sp, #0x14]
	subs r0, r0, r7
	ldr r1, [sp, #0x4c]
	str r0, [r1]
	adds r0, r7, #0
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_080C124C: .4byte 0x00000000
_080C1250: .4byte 0x00000000

	thumb_func_start sub_080C1254
sub_080C1254: @ 0x080C1254
	push {r4, r5, r6, r7, lr}
	sub sp, #0x134
	adds r7, r0, #0
	adds r6, r1, #0
	strb r2, [r7]
	adds r5, r7, #1
	cmp r6, #0
	bge _080C126A
	rsbs r6, r6, #0
	movs r0, #0x2d
	b _080C126C
_080C126A:
	movs r0, #0x2b
_080C126C:
	strb r0, [r7, #1]
	adds r5, #1
	add r4, sp, #0x134
	cmp r6, #9
	ble _080C12AE
_080C1276:
	subs r4, #1
	adds r0, r6, #0
	movs r1, #0xa
	bl __modsi3
	adds r0, #0x30
	strb r0, [r4]
	adds r0, r6, #0
	movs r1, #0xa
	bl __divsi3
	adds r6, r0, #0
	cmp r6, #9
	bgt _080C1276
	subs r4, #1
	adds r0, #0x30
	strb r0, [r4]
	add r0, sp, #0x134
	cmp r4, r0
	bhs _080C12BC
	adds r1, r0, #0
_080C12A0:
	ldrb r0, [r4]
	strb r0, [r5]
	adds r4, #1
	adds r5, #1
	cmp r4, r1
	blo _080C12A0
	b _080C12BC
_080C12AE:
	movs r0, #0x30
	strb r0, [r5]
	adds r5, #1
	adds r0, r6, #0
	adds r0, #0x30
	strb r0, [r5]
	adds r5, #1
_080C12BC:
	subs r0, r5, r7
	add sp, #0x134
	pop {r4, r5, r6, r7, pc}
	.align 2, 0

	thumb_func_start sub_080C12C4
sub_080C12C4: @ 0x080C12C4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x54]
	cmp r0, #0
	bne _080C12D4
	ldr r0, _080C1300 @ =0x08CF6638
	ldr r0, [r0]
	str r0, [r4, #0x54]
_080C12D4:
	ldr r1, [r4, #0x54]
	ldr r0, [r1, #0x38]
	cmp r0, #0
	bne _080C12E2
	adds r0, r1, #0
	bl sub_080C2354
_080C12E2:
	ldrh r1, [r4, #0xc]
	movs r0, #8
	ands r0, r1
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	cmp r5, #0
	bne _080C133C
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _080C1304
	movs r0, #1
	rsbs r0, r0, #0
	b _080C136E
	.align 2, 0
_080C1300: .4byte 0x08CF6638
_080C1304:
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080C1334
	ldr r1, [r4, #0x30]
	cmp r1, #0
	beq _080C1322
	adds r0, r4, #0
	adds r0, #0x40
	cmp r1, r0
	beq _080C1320
	ldr r0, [r4, #0x54]
	bl sub_080C23B4
_080C1320:
	str r5, [r4, #0x30]
_080C1322:
	movs r0, #0x25
	rsbs r0, r0, #0
	ldrh r1, [r4, #0xc]
	ands r0, r1
	movs r1, #0
	strh r0, [r4, #0xc]
	str r1, [r4, #4]
	ldr r0, [r4, #0x10]
	str r0, [r4]
_080C1334:
	movs r0, #8
	ldrh r1, [r4, #0xc]
	orrs r0, r1
	strh r0, [r4, #0xc]
_080C133C:
	ldr r0, [r4, #0x10]
	cmp r0, #0
	bne _080C1348
	adds r0, r4, #0
	bl sub_080C290C
_080C1348:
	ldrh r1, [r4, #0xc]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080C135E
	movs r0, #0
	str r0, [r4, #8]
	ldr r0, [r4, #0x14]
	rsbs r0, r0, #0
	str r0, [r4, #0x18]
	b _080C136C
_080C135E:
	movs r0, #2
	ands r0, r1
	movs r1, #0
	cmp r0, #0
	bne _080C136A
	ldr r1, [r4, #0x14]
_080C136A:
	str r1, [r4, #8]
_080C136C:
	movs r0, #0
_080C136E:
	pop {r4, r5, pc}

	thumb_func_start sub_080C1370
sub_080C1370: @ 0x080C1370
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	str r0, [sp]
	str r1, [sp, #4]
	ldr r7, [r1, #0x10]
	ldr r0, [r0, #0x10]
	cmp r0, r7
	bge _080C138C
	movs r0, #0
	b _080C14C0
_080C138C:
	ldr r0, [sp, #4]
	adds r0, #0x14
	mov r8, r0
	subs r7, #1
	lsls r0, r7, #2
	mov r1, r8
	adds r1, r1, r0
	str r1, [sp, #0xc]
	ldr r4, [sp]
	adds r4, #0x14
	adds r5, r4, r0
	ldr r1, [r1]
	adds r1, #1
	ldr r2, [r5]
	mov sl, r2
	mov r0, sl
	bl __udivsi3
	str r0, [sp, #8]
	mov r3, r8
	str r3, [sp, #0x14]
	str r4, [sp, #0x10]
	cmp r0, #0
	beq _080C1436
	movs r6, #0
	mov sb, r6
	ldr r0, _080C1420 @ =0x0000FFFF
	mov ip, r0
_080C13C4:
	mov r2, r8
	adds r2, #4
	mov r8, r2
	subs r2, #4
	ldm r2!, {r1}
	adds r0, r1, #0
	mov r3, ip
	ands r0, r3
	ldr r2, [sp, #8]
	muls r0, r2, r0
	mov r3, sb
	adds r2, r0, r3
	lsrs r0, r1, #0x10
	ldr r3, [sp, #8]
	adds r1, r0, #0
	muls r1, r3, r1
	lsrs r0, r2, #0x10
	adds r3, r1, r0
	lsrs r0, r3, #0x10
	mov sb, r0
	ldr r0, [r4]
	mov r1, ip
	ands r0, r1
	ands r2, r1
	subs r0, r0, r2
	adds r2, r0, r6
	asrs r6, r2, #0x10
	ldr r0, [r4]
	lsrs r1, r0, #0x10
	mov r0, ip
	ands r3, r0
	subs r1, r1, r3
	adds r0, r1, r6
	asrs r6, r0, #0x10
	strh r0, [r4]
	strh r2, [r4, #2]
	adds r4, #4
	ldr r1, [sp, #0xc]
	cmp r8, r1
	bls _080C13C4
	mov r2, sl
	cmp r2, #0
	bne _080C1436
	ldr r4, [sp, #0x10]
	b _080C1426
	.align 2, 0
_080C1420: .4byte 0x0000FFFF
_080C1424:
	subs r7, #1
_080C1426:
	subs r5, #4
	cmp r5, r4
	bls _080C1432
	ldr r0, [r5]
	cmp r0, #0
	beq _080C1424
_080C1432:
	ldr r3, [sp]
	str r7, [r3, #0x10]
_080C1436:
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl sub_080C3560
	cmp r0, #0
	blt _080C14BE
	ldr r0, [sp, #8]
	adds r0, #1
	str r0, [sp, #8]
	movs r6, #0
	mov sb, r6
	ldr r4, [sp, #0x10]
	ldr r1, [sp, #0x14]
	mov r8, r1
	lsls r2, r7, #2
	mov sl, r2
	ldr r5, _080C14A8 @ =0x0000FFFF
_080C1458:
	mov r3, r8
	adds r3, #4
	mov r8, r3
	subs r3, #4
	ldm r3!, {r1}
	adds r0, r1, #0
	ands r0, r5
	mov r3, sb
	adds r2, r0, r3
	lsrs r1, r1, #0x10
	lsrs r0, r2, #0x10
	adds r3, r1, r0
	lsrs r0, r3, #0x10
	mov sb, r0
	ldr r1, [r4]
	adds r0, r1, #0
	ands r0, r5
	ands r2, r5
	subs r0, r0, r2
	adds r2, r0, r6
	asrs r6, r2, #0x10
	lsrs r1, r1, #0x10
	ands r3, r5
	subs r1, r1, r3
	adds r0, r1, r6
	asrs r6, r0, #0x10
	strh r0, [r4]
	strh r2, [r4, #2]
	adds r4, #4
	ldr r1, [sp, #0xc]
	cmp r8, r1
	bls _080C1458
	ldr r4, [sp, #0x10]
	mov r2, sl
	adds r5, r4, r2
	ldr r0, [r5]
	cmp r0, #0
	bne _080C14BE
	b _080C14AE
	.align 2, 0
_080C14A8: .4byte 0x0000FFFF
_080C14AC:
	subs r7, #1
_080C14AE:
	subs r5, #4
	cmp r5, r4
	bls _080C14BA
	ldr r0, [r5]
	cmp r0, #0
	beq _080C14AC
_080C14BA:
	ldr r3, [sp]
	str r7, [r3, #0x10]
_080C14BE:
	ldr r0, [sp, #8]
_080C14C0:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}

	thumb_func_start sub_080C14CC
sub_080C14CC: @ 0x080C14CC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x84
	mov sl, r0
	str r3, [sp, #0xc]
	ldr r4, [sp, #0xac]
	str r1, [sp, #0x40]
	str r2, [sp, #0x44]
	ldr r2, [r0, #0x40]
	cmp r2, #0
	beq _080C1504
	ldr r0, [r0, #0x44]
	str r0, [r2, #4]
	mov r0, sl
	ldr r1, [r0, #0x44]
	movs r0, #1
	lsls r0, r1
	str r0, [r2, #8]
	mov r0, sl
	adds r1, r2, #0
	bl sub_080C3098
	movs r0, #0
	mov r1, sl
	str r0, [r1, #0x40]
_080C1504:
	movs r0, #0x80
	lsls r0, r0, #0x18
	ldr r1, [sp, #0x40]
	ands r0, r1
	cmp r0, #0
	beq _080C1520
	movs r0, #1
	str r0, [r4]
	ldr r0, _080C151C @ =0x7FFFFFFF
	ands r1, r0
	str r1, [sp, #0x40]
	b _080C1522
	.align 2, 0
_080C151C: .4byte 0x7FFFFFFF
_080C1520:
	str r0, [r4]
_080C1522:
	ldr r1, _080C1564 @ =0x7FF00000
	ldr r2, [sp, #0x40]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, r1
	bne _080C1578
	ldr r0, _080C1568 @ =0x0000270F
	ldr r3, [sp, #0xa8]
	str r0, [r3]
	ldr r0, _080C156C @ =0x08B85664
	mov sb, r0
	ldr r1, [sp, #0x44]
	cmp r1, #0
	bne _080C154A
	ldr r0, _080C1570 @ =0x000FFFFF
	ands r2, r0
	cmp r2, #0
	bne _080C154A
	ldr r2, _080C1574 @ =0x08B85658
	mov sb, r2
_080C154A:
	ldr r3, [sp, #0xb0]
	cmp r3, #0
	beq _080C159C
	mov r1, sb
	ldrb r0, [r1, #3]
	adds r1, #3
	cmp r0, #0
	beq _080C155C
	adds r1, #5
_080C155C:
	ldr r2, [sp, #0xb0]
	str r1, [r2]
	b _080C159C
	.align 2, 0
_080C1564: .4byte 0x7FF00000
_080C1568: .4byte 0x0000270F
_080C156C: .4byte 0x08B85664
_080C1570: .4byte 0x000FFFFF
_080C1574: .4byte 0x08B85658
_080C1578:
	ldr r3, _080C15A8 @ =0x00000000
	ldr r2, _080C15A4 @ =0x00000000
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	bl sub_080C4AC8
	cmp r0, #0
	bne _080C15B0
	movs r0, #1
	ldr r3, [sp, #0xa8]
	str r0, [r3]
	ldr r0, _080C15AC @ =0x08B85668
	mov sb, r0
	ldr r1, [sp, #0xb0]
	cmp r1, #0
	beq _080C159C
	adds r0, #1
	str r0, [r1]
_080C159C:
	mov r0, sb
	bl _080C21B6
	.align 2, 0
_080C15A4: .4byte 0x00000000
_080C15A8: .4byte 0x00000000
_080C15AC: .4byte 0x08B85668
_080C15B0:
	add r0, sp, #8
	str r0, [sp]
	mov r0, sl
	ldr r1, [sp, #0x40]
	ldr r2, [sp, #0x44]
	add r3, sp, #4
	bl sub_080C3798
	str r0, [sp, #0x5c]
	ldr r2, [sp, #0x40]
	lsls r0, r2, #1
	lsrs r0, r0, #0x15
	mov r8, r0
	cmp r0, #0
	beq _080C1600
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	str r0, [sp, #0x48]
	str r1, [sp, #0x4c]
	ldr r0, _080C15F4 @ =0x000FFFFF
	ldr r1, [sp, #0x48]
	ands r1, r0
	str r1, [sp, #0x48]
	ldr r0, _080C15F8 @ =0x3FF00000
	adds r2, r1, #0
	orrs r2, r0
	str r2, [sp, #0x48]
	ldr r3, _080C15FC @ =0xFFFFFC01
	add r8, r3
	movs r0, #0
	str r0, [sp, #0x58]
	ldr r6, [sp, #8]
	b _080C1660
	.align 2, 0
_080C15F4: .4byte 0x000FFFFF
_080C15F8: .4byte 0x3FF00000
_080C15FC: .4byte 0xFFFFFC01
_080C1600:
	ldr r1, [sp, #8]
	ldr r0, [sp, #4]
	adds r2, r1, r0
	ldr r3, _080C1628 @ =0x00000432
	adds r3, r3, r2
	mov r8, r3
	adds r6, r1, #0
	cmp r3, #0x20
	ble _080C1630
	movs r0, #0x40
	subs r0, r0, r3
	ldr r4, [sp, #0x40]
	lsls r4, r0
	ldr r1, _080C162C @ =0x00000412
	adds r0, r2, r1
	ldr r2, [sp, #0x44]
	lsrs r2, r0
	adds r0, r2, #0
	orrs r4, r0
	b _080C163A
	.align 2, 0
_080C1628: .4byte 0x00000432
_080C162C: .4byte 0x00000412
_080C1630:
	movs r0, #0x20
	mov r3, r8
	subs r0, r0, r3
	ldr r4, [sp, #0x44]
	lsls r4, r0
_080C163A:
	adds r0, r4, #0
	bl sub_080C4C90
	cmp r4, #0
	bge _080C164C
	ldr r3, _080C1710 @ =0x00000000
	ldr r2, _080C170C @ =0x41F00000
	bl sub_080C4504
_080C164C:
	str r0, [sp, #0x48]
	str r1, [sp, #0x4c]
	ldr r1, _080C1714 @ =0xFE100000
	ldr r0, [sp, #0x48]
	adds r1, r0, r1
	str r1, [sp, #0x48]
	ldr r2, _080C1718 @ =0xFFFFFBCD
	add r8, r2
	movs r3, #1
	str r3, [sp, #0x58]
_080C1660:
	ldr r2, _080C171C @ =0x3FF80000
	ldr r3, _080C1720 @ =0x00000000
	ldr r0, [sp, #0x48]
	ldr r1, [sp, #0x4c]
	bl sub_080C4534
	ldr r2, _080C1724 @ =0x3FD287A7
	ldr r3, _080C1728 @ =0x636F4361
	bl sub_080C456C
	ldr r2, _080C172C @ =0x3FC68A28
	ldr r3, _080C1730 @ =0x8B60C8B3
	bl sub_080C4504
	adds r5, r1, #0
	adds r4, r0, #0
	mov r0, r8
	bl sub_080C4C90
	ldr r2, _080C1734 @ =0x3FD34413
	ldr r3, _080C1738 @ =0x509F79FB
	bl sub_080C456C
	adds r3, r1, #0
	adds r2, r0, #0
	adds r1, r5, #0
	adds r0, r4, #0
	bl sub_080C4504
	str r0, [sp, #0x6c]
	str r1, [sp, #0x70]
	bl sub_080C4D0C
	str r0, [sp, #0x24]
	ldr r2, _080C173C @ =0x00000000
	ldr r3, _080C1740 @ =0x00000000
	ldr r0, [sp, #0x6c]
	ldr r1, [sp, #0x70]
	bl sub_080C4BF8
	cmp r0, #0
	bge _080C16D0
	ldr r0, [sp, #0x24]
	bl sub_080C4C90
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r0, [sp, #0x6c]
	ldr r1, [sp, #0x70]
	bl sub_080C4B14
	cmp r0, #0
	beq _080C16D0
	ldr r0, [sp, #0x24]
	subs r0, #1
	str r0, [sp, #0x24]
_080C16D0:
	movs r1, #1
	str r1, [sp, #0x2c]
	ldr r2, [sp, #0x24]
	cmp r2, #0x16
	bhi _080C16FA
	ldr r1, _080C1744 @ =0x08B856B8
	lsls r0, r2, #3
	adds r0, r0, r1
	ldr r2, [r0]
	ldr r3, [r0, #4]
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	bl sub_080C4BF8
	cmp r0, #0
	bge _080C16F6
	ldr r3, [sp, #0x24]
	subs r3, #1
	str r3, [sp, #0x24]
_080C16F6:
	movs r0, #0
	str r0, [sp, #0x2c]
_080C16FA:
	mov r1, r8
	subs r0, r6, r1
	subs r4, r0, #1
	cmp r4, #0
	blt _080C1748
	movs r2, #0
	str r2, [sp, #0x10]
	str r4, [sp, #0x34]
	b _080C1750
	.align 2, 0
_080C170C: .4byte 0x41F00000
_080C1710: .4byte 0x00000000
_080C1714: .4byte 0xFE100000
_080C1718: .4byte 0xFFFFFBCD
_080C171C: .4byte 0x3FF80000
_080C1720: .4byte 0x00000000
_080C1724: .4byte 0x3FD287A7
_080C1728: .4byte 0x636F4361
_080C172C: .4byte 0x3FC68A28
_080C1730: .4byte 0x8B60C8B3
_080C1734: .4byte 0x3FD34413
_080C1738: .4byte 0x509F79FB
_080C173C: .4byte 0x00000000
_080C1740: .4byte 0x00000000
_080C1744: .4byte 0x08B856B8
_080C1748:
	rsbs r4, r4, #0
	str r4, [sp, #0x10]
	movs r3, #0
	str r3, [sp, #0x34]
_080C1750:
	ldr r0, [sp, #0x24]
	cmp r0, #0
	blt _080C1764
	movs r1, #0
	str r1, [sp, #0x14]
	str r0, [sp, #0x38]
	ldr r2, [sp, #0x34]
	adds r2, r2, r0
	str r2, [sp, #0x34]
	b _080C1774
_080C1764:
	ldr r3, [sp, #0x10]
	ldr r0, [sp, #0x24]
	subs r3, r3, r0
	str r3, [sp, #0x10]
	rsbs r1, r0, #0
	str r1, [sp, #0x14]
	movs r2, #0
	str r2, [sp, #0x38]
_080C1774:
	ldr r3, [sp, #0xc]
	cmp r3, #9
	bls _080C177E
	movs r0, #0
	str r0, [sp, #0xc]
_080C177E:
	movs r5, #1
	ldr r1, [sp, #0xc]
	cmp r1, #5
	ble _080C178C
	subs r1, #4
	str r1, [sp, #0xc]
	movs r5, #0
_080C178C:
	movs r2, #1
	str r2, [sp, #0x30]
	ldr r3, [sp, #0xc]
	cmp r3, #5
	bhi _080C1806
	lsls r0, r3, #2
	ldr r1, _080C17A0 @ =_080C17A4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C17A0: .4byte _080C17A4
_080C17A4: @ jump table
	.4byte _080C17BC @ case 0
	.4byte _080C17BC @ case 1
	.4byte _080C17CE @ case 2
	.4byte _080C17EA @ case 3
	.4byte _080C17D2 @ case 4
	.4byte _080C17EE @ case 5
_080C17BC:
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #0x18]
	str r0, [sp, #0x20]
	movs r1, #0x12
	mov r8, r1
	movs r2, #0
	str r2, [sp, #0xa4]
	b _080C1806
_080C17CE:
	movs r3, #0
	str r3, [sp, #0x30]
_080C17D2:
	ldr r0, [sp, #0xa4]
	cmp r0, #0
	bgt _080C17DC
	movs r1, #1
	str r1, [sp, #0xa4]
_080C17DC:
	ldr r2, [sp, #0xa4]
	mov r8, r2
	mov r3, r8
	str r3, [sp, #0x20]
	mov r0, r8
	str r0, [sp, #0x18]
	b _080C1806
_080C17EA:
	movs r1, #0
	str r1, [sp, #0x30]
_080C17EE:
	ldr r2, [sp, #0xa4]
	ldr r3, [sp, #0x24]
	adds r0, r2, r3
	adds r1, r0, #1
	mov r8, r1
	mov r2, r8
	str r2, [sp, #0x18]
	str r0, [sp, #0x20]
	cmp r1, #0
	bgt _080C1806
	movs r3, #1
	mov r8, r3
_080C1806:
	movs r4, #4
	movs r0, #0
	mov r1, sl
	str r0, [r1, #0x44]
	mov r2, r8
	cmp r2, #0x17
	bls _080C1826
	movs r1, #0
_080C1816:
	adds r1, #1
	lsls r4, r4, #1
	adds r0, r4, #0
	adds r0, #0x14
	cmp r0, r8
	bls _080C1816
	mov r3, sl
	str r1, [r3, #0x44]
_080C1826:
	mov r0, sl
	ldr r1, [r0, #0x44]
	bl sub_080C3040
	mov r1, sl
	str r0, [r1, #0x40]
	str r0, [sp, #0x74]
	mov sb, r0
	ldr r2, [sp, #0x18]
	cmp r2, #0xe
	bls _080C183E
	b _080C1BB0
_080C183E:
	cmp r5, #0
	bne _080C1844
	b _080C1BB0
_080C1844:
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	str r0, [sp, #0x78]
	str r1, [sp, #0x7c]
	str r0, [sp, #0x48]
	str r1, [sp, #0x4c]
	ldr r1, [sp, #0x24]
	str r1, [sp, #0x28]
	str r2, [sp, #0x1c]
	movs r7, #2
	cmp r1, #0
	ble _080C18D4
	ldr r0, _080C18CC @ =0x08B856B8
	movs r2, #0xf
	ands r1, r2
	lsls r1, r1, #3
	adds r3, r1, r0
	ldr r0, [r3]
	ldr r1, [r3, #4]
	str r0, [sp, #0x6c]
	str r1, [sp, #0x70]
	ldr r1, [sp, #0x24]
	asrs r4, r1, #4
	movs r0, #0x10
	ands r0, r4
	cmp r0, #0
	beq _080C1890
	ands r4, r2
	ldr r0, _080C18D0 @ =0x08B85780
	ldr r2, [r0, #0x20]
	ldr r3, [r0, #0x24]
	ldr r0, [sp, #0x78]
	ldr r1, [sp, #0x7c]
	bl sub_080C4814
	str r0, [sp, #0x40]
	str r1, [sp, #0x44]
	movs r7, #3
_080C1890:
	cmp r4, #0
	beq _080C18B8
	ldr r5, _080C18D0 @ =0x08B85780
_080C1896:
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _080C18B0
	adds r7, #1
	ldr r2, [r5]
	ldr r3, [r5, #4]
	ldr r0, [sp, #0x6c]
	ldr r1, [sp, #0x70]
	bl sub_080C456C
	str r0, [sp, #0x6c]
	str r1, [sp, #0x70]
_080C18B0:
	asrs r4, r4, #1
	adds r5, #8
	cmp r4, #0
	bne _080C1896
_080C18B8:
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	ldr r2, [sp, #0x6c]
	ldr r3, [sp, #0x70]
	bl sub_080C4814
	str r0, [sp, #0x40]
	str r1, [sp, #0x44]
	b _080C1920
	.align 2, 0
_080C18CC: .4byte 0x08B856B8
_080C18D0: .4byte 0x08B85780
_080C18D4:
	ldr r2, [sp, #0x24]
	rsbs r6, r2, #0
	cmp r6, #0
	beq _080C1920
	ldr r1, _080C19C8 @ =0x08B856B8
	movs r0, #0xf
	ands r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, [r0, #4]
	ldr r0, [r0]
	ldr r2, [sp, #0x78]
	ldr r3, [sp, #0x7c]
	bl sub_080C456C
	str r0, [sp, #0x40]
	str r1, [sp, #0x44]
	asrs r4, r6, #4
	cmp r4, #0
	beq _080C1920
	ldr r5, _080C19CC @ =0x08B85780
_080C18FE:
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _080C1918
	adds r7, #1
	ldr r0, [r5]
	ldr r1, [r5, #4]
	ldr r2, [sp, #0x40]
	ldr r3, [sp, #0x44]
	bl sub_080C456C
	str r0, [sp, #0x40]
	str r1, [sp, #0x44]
_080C1918:
	asrs r4, r4, #1
	adds r5, #8
	cmp r4, #0
	bne _080C18FE
_080C1920:
	ldr r3, [sp, #0x2c]
	cmp r3, #0
	beq _080C195E
	ldr r2, _080C19D0 @ =0x3FF00000
	ldr r3, _080C19D4 @ =0x00000000
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	bl sub_080C4BF8
	cmp r0, #0
	bge _080C195E
	ldr r0, [sp, #0x18]
	cmp r0, #0
	ble _080C195E
	ldr r1, [sp, #0x20]
	cmp r1, #0
	bgt _080C1944
	b _080C1B9C
_080C1944:
	str r1, [sp, #0x18]
	ldr r2, [sp, #0x24]
	subs r2, #1
	str r2, [sp, #0x24]
	ldr r0, _080C19D8 @ =0x40240000
	ldr r1, _080C19DC @ =0x00000000
	ldr r2, [sp, #0x40]
	ldr r3, [sp, #0x44]
	bl sub_080C456C
	str r0, [sp, #0x40]
	str r1, [sp, #0x44]
	adds r7, #1
_080C195E:
	adds r0, r7, #0
	bl sub_080C4C90
	ldr r2, [sp, #0x40]
	ldr r3, [sp, #0x44]
	bl sub_080C456C
	ldr r2, _080C19E0 @ =0x401C0000
	ldr r3, _080C19E4 @ =0x00000000
	bl sub_080C4504
	str r0, [sp, #0x50]
	str r1, [sp, #0x54]
	ldr r0, _080C19E8 @ =0xFCC00000
	ldr r3, [sp, #0x50]
	adds r0, r3, r0
	str r0, [sp, #0x50]
	ldr r1, [sp, #0x18]
	cmp r1, #0
	bne _080C19F4
	movs r2, #0
	str r2, [sp, #0x64]
	movs r3, #0
	str r3, [sp, #0x68]
	ldr r2, _080C19EC @ =0x40140000
	ldr r3, _080C19F0 @ =0x00000000
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	bl sub_080C4534
	adds r5, r1, #0
	adds r4, r0, #0
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x54]
	bl sub_080C4B60
	cmp r0, #0
	ble _080C19AC
	b _080C1F26
_080C19AC:
	ldr r0, [sp, #0x50]
	ldr r1, [sp, #0x54]
	bl sub_080C4D80
	adds r3, r1, #0
	adds r2, r0, #0
	adds r1, r5, #0
	adds r0, r4, #0
	bl sub_080C4BF8
	cmp r0, #0
	bge _080C19C6
	b _080C1F1E
_080C19C6:
	b _080C1B9C
	.align 2, 0
_080C19C8: .4byte 0x08B856B8
_080C19CC: .4byte 0x08B85780
_080C19D0: .4byte 0x3FF00000
_080C19D4: .4byte 0x00000000
_080C19D8: .4byte 0x40240000
_080C19DC: .4byte 0x00000000
_080C19E0: .4byte 0x401C0000
_080C19E4: .4byte 0x00000000
_080C19E8: .4byte 0xFCC00000
_080C19EC: .4byte 0x40140000
_080C19F0: .4byte 0x00000000
_080C19F4:
	ldr r0, [sp, #0x30]
	cmp r0, #0
	beq _080C1AC4
	ldr r1, _080C1A24 @ =0x08B856B8
	ldr r0, [sp, #0x18]
	subs r0, #1
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r2, [r0]
	ldr r3, [r0, #4]
	ldr r0, _080C1A28 @ =0x3FE00000
	ldr r1, _080C1A2C @ =0x00000000
	bl sub_080C4814
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x54]
	bl sub_080C4534
	str r0, [sp, #0x50]
	str r1, [sp, #0x54]
	movs r1, #0
	mov r8, r1
	b _080C1A50
	.align 2, 0
_080C1A24: .4byte 0x08B856B8
_080C1A28: .4byte 0x3FE00000
_080C1A2C: .4byte 0x00000000
_080C1A30:
	ldr r1, _080C1AB8 @ =0x00000000
	ldr r0, _080C1AB4 @ =0x40240000
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x54]
	bl sub_080C456C
	str r0, [sp, #0x50]
	str r1, [sp, #0x54]
	ldr r1, _080C1AB8 @ =0x00000000
	ldr r0, _080C1AB4 @ =0x40240000
	adds r3, r5, #0
	adds r2, r4, #0
	bl sub_080C456C
	str r0, [sp, #0x40]
	str r1, [sp, #0x44]
_080C1A50:
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	bl sub_080C4D0C
	adds r6, r0, #0
	bl sub_080C4C90
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	bl sub_080C4534
	adds r5, r1, #0
	adds r4, r0, #0
	adds r0, r6, #0
	adds r0, #0x30
	mov r2, sb
	strb r0, [r2]
	movs r3, #1
	add sb, r3
	adds r1, r5, #0
	adds r0, r4, #0
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x54]
	bl sub_080C4BF8
	cmp r0, #0
	bge _080C1A8C
	b _080C2196
_080C1A8C:
	ldr r0, _080C1ABC @ =0x3FF00000
	ldr r1, _080C1AC0 @ =0x00000000
	adds r3, r5, #0
	adds r2, r4, #0
	bl sub_080C4534
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x54]
	bl sub_080C4BF8
	cmp r0, #0
	bge _080C1AA6
	b _080C1CB0
_080C1AA6:
	movs r0, #1
	add r8, r0
	ldr r1, [sp, #0x18]
	cmp r8, r1
	blt _080C1A30
	b _080C1B9C
	.align 2, 0
_080C1AB4: .4byte 0x40240000
_080C1AB8: .4byte 0x00000000
_080C1ABC: .4byte 0x3FF00000
_080C1AC0: .4byte 0x00000000
_080C1AC4:
	ldr r1, _080C1AE4 @ =0x08B856B8
	ldr r0, [sp, #0x18]
	subs r0, #1
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, [r0, #4]
	ldr r0, [r0]
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x54]
	bl sub_080C456C
	str r0, [sp, #0x50]
	str r1, [sp, #0x54]
	movs r2, #1
	mov r8, r2
	b _080C1AFC
	.align 2, 0
_080C1AE4: .4byte 0x08B856B8
_080C1AE8:
	movs r3, #1
	add r8, r3
	ldr r1, _080C1B90 @ =0x00000000
	ldr r0, _080C1B8C @ =0x40240000
	adds r3, r5, #0
	adds r2, r4, #0
	bl sub_080C456C
	str r0, [sp, #0x40]
	str r1, [sp, #0x44]
_080C1AFC:
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	bl sub_080C4D0C
	adds r6, r0, #0
	bl sub_080C4C90
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	bl sub_080C4534
	adds r5, r1, #0
	adds r4, r0, #0
	adds r0, r6, #0
	adds r0, #0x30
	mov r1, sb
	strb r0, [r1]
	movs r2, #1
	add sb, r2
	ldr r3, [sp, #0x18]
	cmp r8, r3
	bne _080C1AE8
	ldr r6, _080C1B94 @ =0x3FE00000
	ldr r7, _080C1B98 @ =0x00000000
	adds r1, r7, #0
	adds r0, r6, #0
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x54]
	bl sub_080C4504
	adds r3, r1, #0
	adds r2, r0, #0
	adds r1, r5, #0
	adds r0, r4, #0
	bl sub_080C4B60
	cmp r0, #0
	ble _080C1B4E
	b _080C1CB0
_080C1B4E:
	adds r1, r7, #0
	adds r0, r6, #0
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x54]
	bl sub_080C4534
	adds r3, r1, #0
	adds r2, r0, #0
	adds r1, r5, #0
	adds r0, r4, #0
	bl sub_080C4BF8
	cmp r0, #0
	bge _080C1B9C
	movs r0, #1
	rsbs r0, r0, #0
	add sb, r0
	mov r1, sb
	ldrb r1, [r1]
	cmp r1, #0x30
	beq _080C1B7A
	b _080C1CD6
_080C1B7A:
	movs r2, #1
	rsbs r2, r2, #0
	add sb, r2
	mov r3, sb
	ldrb r3, [r3]
	cmp r3, #0x30
	beq _080C1B7A
	b _080C1CD6
	.align 2, 0
_080C1B8C: .4byte 0x40240000
_080C1B90: .4byte 0x00000000
_080C1B94: .4byte 0x3FE00000
_080C1B98: .4byte 0x00000000
_080C1B9C:
	ldr r1, [sp, #0x74]
	mov sb, r1
	ldr r2, [sp, #0x48]
	ldr r3, [sp, #0x4c]
	str r2, [sp, #0x40]
	str r3, [sp, #0x44]
	ldr r3, [sp, #0x28]
	str r3, [sp, #0x24]
	ldr r0, [sp, #0x1c]
	str r0, [sp, #0x18]
_080C1BB0:
	ldr r0, [sp, #4]
	cmp r0, #0
	bge _080C1BB8
	b _080C1CEC
_080C1BB8:
	ldr r1, [sp, #0x24]
	cmp r1, #0xe
	ble _080C1BC0
	b _080C1CEC
_080C1BC0:
	ldr r1, _080C1C0C @ =0x08B856B8
	ldr r2, [sp, #0x24]
	lsls r0, r2, #3
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r2, [r0, #4]
	str r1, [sp, #0x6c]
	str r2, [sp, #0x70]
	ldr r2, [sp, #0xa4]
	cmp r2, #0
	bge _080C1C18
	ldr r3, [sp, #0x18]
	cmp r3, #0
	bgt _080C1C18
	movs r0, #0
	str r0, [sp, #0x64]
	movs r1, #0
	str r1, [sp, #0x68]
	cmp r3, #0
	bge _080C1BEA
	b _080C1F1E
_080C1BEA:
	ldr r2, _080C1C10 @ =0x40140000
	ldr r3, _080C1C14 @ =0x00000000
	ldr r0, [sp, #0x6c]
	ldr r1, [sp, #0x70]
	bl sub_080C456C
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	bl sub_080C4C44
	cmp r0, #0
	bgt _080C1C08
	b _080C1F1E
_080C1C08:
	b _080C1F26
	.align 2, 0
_080C1C0C: .4byte 0x08B856B8
_080C1C10: .4byte 0x40140000
_080C1C14: .4byte 0x00000000
_080C1C18:
	movs r2, #1
	mov r8, r2
	b _080C1C3C
_080C1C1E:
	ldr r1, _080C1CE0 @ =0x00000000
	ldr r0, _080C1CDC @ =0x40240000
	bl sub_080C456C
	str r0, [sp, #0x40]
	str r1, [sp, #0x44]
	ldr r2, _080C1CE4 @ =0x00000000
	ldr r3, _080C1CE8 @ =0x00000000
	bl sub_080C4AC8
	cmp r0, #0
	bne _080C1C38
	b _080C2196
_080C1C38:
	movs r3, #1
	add r8, r3
_080C1C3C:
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	ldr r2, [sp, #0x6c]
	ldr r3, [sp, #0x70]
	bl sub_080C4814
	bl sub_080C4D0C
	adds r6, r0, #0
	bl sub_080C4C90
	ldr r2, [sp, #0x6c]
	ldr r3, [sp, #0x70]
	bl sub_080C456C
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	bl sub_080C4534
	adds r3, r1, #0
	adds r2, r0, #0
	adds r0, r6, #0
	adds r0, #0x30
	mov r1, sb
	strb r0, [r1]
	movs r0, #1
	add sb, r0
	ldr r1, [sp, #0x18]
	cmp r8, r1
	bne _080C1C1E
	adds r1, r3, #0
	adds r0, r2, #0
	bl sub_080C4504
	adds r5, r1, #0
	adds r4, r0, #0
	ldr r2, [sp, #0x6c]
	ldr r3, [sp, #0x70]
	bl sub_080C4B60
	cmp r0, #0
	bgt _080C1CB0
	adds r1, r5, #0
	adds r0, r4, #0
	ldr r2, [sp, #0x6c]
	ldr r3, [sp, #0x70]
	bl sub_080C4AC8
	cmp r0, #0
	beq _080C1CA6
	b _080C2196
_080C1CA6:
	movs r0, #1
	ands r0, r6
	cmp r0, #0
	bne _080C1CB0
	b _080C2196
_080C1CB0:
	movs r0, #0x30
_080C1CB2:
	movs r2, #1
	rsbs r2, r2, #0
	add sb, r2
	mov r3, sb
	ldrb r3, [r3]
	cmp r3, #0x39
	bne _080C1CCE
	ldr r1, [sp, #0x74]
	cmp sb, r1
	bne _080C1CB2
	ldr r2, [sp, #0x24]
	adds r2, #1
	str r2, [sp, #0x24]
	strb r0, [r1]
_080C1CCE:
	mov r3, sb
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
_080C1CD6:
	movs r0, #1
	add sb, r0
	b _080C2196
	.align 2, 0
_080C1CDC: .4byte 0x40240000
_080C1CE0: .4byte 0x00000000
_080C1CE4: .4byte 0x00000000
_080C1CE8: .4byte 0x00000000
_080C1CEC:
	ldr r5, [sp, #0x10]
	ldr r6, [sp, #0x14]
	movs r1, #0
	str r1, [sp, #0x60]
	movs r2, #0
	str r2, [sp, #0x64]
	ldr r3, [sp, #0x30]
	cmp r3, #0
	beq _080C1D62
	ldr r1, [sp, #0xc]
	cmp r1, #1
	bgt _080C1D20
	ldr r2, [sp, #0x58]
	cmp r2, #0
	beq _080C1D18
	ldr r3, _080C1D14 @ =0x00000433
	adds r3, r3, r0
	mov r8, r3
	b _080C1D4C
	.align 2, 0
_080C1D14: .4byte 0x00000433
_080C1D18:
	ldr r1, [sp, #8]
	movs r0, #0x36
	subs r0, r0, r1
	b _080C1D4A
_080C1D20:
	ldr r4, [sp, #0x18]
	subs r4, #1
	ldr r0, [sp, #0x14]
	cmp r0, r4
	blt _080C1D2E
	subs r6, r0, r4
	b _080C1D3E
_080C1D2E:
	ldr r1, [sp, #0x14]
	subs r4, r4, r1
	ldr r2, [sp, #0x38]
	adds r2, r2, r4
	str r2, [sp, #0x38]
	adds r1, r1, r4
	str r1, [sp, #0x14]
	movs r6, #0
_080C1D3E:
	ldr r3, [sp, #0x18]
	mov r8, r3
	cmp r3, #0
	bge _080C1D4C
	subs r5, r5, r3
	movs r0, #0
_080C1D4A:
	mov r8, r0
_080C1D4C:
	ldr r1, [sp, #0x10]
	add r1, r8
	str r1, [sp, #0x10]
	ldr r2, [sp, #0x34]
	add r2, r8
	str r2, [sp, #0x34]
	mov r0, sl
	movs r1, #1
	bl sub_080C32A8
	str r0, [sp, #0x64]
_080C1D62:
	cmp r5, #0
	ble _080C1D84
	ldr r3, [sp, #0x34]
	cmp r3, #0
	ble _080C1D84
	mov r8, r3
	cmp r8, r5
	ble _080C1D74
	mov r8, r5
_080C1D74:
	ldr r0, [sp, #0x10]
	mov r1, r8
	subs r0, r0, r1
	str r0, [sp, #0x10]
	subs r5, r5, r1
	ldr r2, [sp, #0x34]
	subs r2, r2, r1
	str r2, [sp, #0x34]
_080C1D84:
	ldr r3, [sp, #0x14]
	cmp r3, #0
	ble _080C1DD2
	ldr r0, [sp, #0x30]
	cmp r0, #0
	beq _080C1DC6
	cmp r6, #0
	ble _080C1DB6
	mov r0, sl
	ldr r1, [sp, #0x64]
	adds r2, r6, #0
	bl sub_080C3428
	str r0, [sp, #0x64]
	mov r0, sl
	ldr r1, [sp, #0x64]
	ldr r2, [sp, #0x5c]
	bl sub_080C32BC
	adds r4, r0, #0
	mov r0, sl
	ldr r1, [sp, #0x5c]
	bl sub_080C3098
	str r4, [sp, #0x5c]
_080C1DB6:
	ldr r1, [sp, #0x14]
	subs r4, r1, r6
	cmp r4, #0
	beq _080C1DD2
	mov r0, sl
	ldr r1, [sp, #0x5c]
	adds r2, r4, #0
	b _080C1DCC
_080C1DC6:
	mov r0, sl
	ldr r1, [sp, #0x5c]
	ldr r2, [sp, #0x14]
_080C1DCC:
	bl sub_080C3428
	str r0, [sp, #0x5c]
_080C1DD2:
	mov r0, sl
	movs r1, #1
	bl sub_080C32A8
	str r0, [sp, #0x68]
	ldr r2, [sp, #0x38]
	cmp r2, #0
	ble _080C1DEC
	mov r0, sl
	ldr r1, [sp, #0x68]
	bl sub_080C3428
	str r0, [sp, #0x68]
_080C1DEC:
	ldr r3, [sp, #0xc]
	cmp r3, #1
	bgt _080C1E28
	ldr r0, [sp, #0x44]
	cmp r0, #0
	bne _080C1E24
	ldr r0, _080C1E1C @ =0x000FFFFF
	ldr r1, [sp, #0x40]
	ands r0, r1
	cmp r0, #0
	bne _080C1E24
	ldr r0, _080C1E20 @ =0x7FF00000
	ands r1, r0
	cmp r1, #0
	beq _080C1E24
	ldr r1, [sp, #0x10]
	adds r1, #1
	str r1, [sp, #0x10]
	ldr r2, [sp, #0x34]
	adds r2, #1
	str r2, [sp, #0x34]
	movs r3, #1
	str r3, [sp, #0x3c]
	b _080C1E28
	.align 2, 0
_080C1E1C: .4byte 0x000FFFFF
_080C1E20: .4byte 0x7FF00000
_080C1E24:
	movs r0, #0
	str r0, [sp, #0x3c]
_080C1E28:
	ldr r1, [sp, #0x38]
	cmp r1, #0
	beq _080C1E54
	ldr r2, [sp, #0x68]
	ldr r1, [r2, #0x10]
	subs r1, #1
	lsls r1, r1, #2
	adds r0, r2, #0
	adds r0, #0x14
	adds r0, r0, r1
	ldr r0, [r0]
	bl sub_080C31CC
	ldr r1, [sp, #0x34]
	adds r1, #0x20
	subs r1, r1, r0
	mov r8, r1
	movs r0, #0x1f
	mov r3, r8
	ands r3, r0
	mov r8, r3
	b _080C1E62
_080C1E54:
	ldr r0, [sp, #0x34]
	adds r0, #1
	mov r8, r0
	movs r0, #0x1f
	mov r1, r8
	ands r1, r0
	mov r8, r1
_080C1E62:
	mov r2, r8
	cmp r2, #0
	beq _080C1E6E
	movs r0, #0x20
	subs r2, r0, r2
	mov r8, r2
_080C1E6E:
	mov r3, r8
	cmp r3, #4
	ble _080C1E7A
	movs r0, #4
	rsbs r0, r0, #0
	b _080C1E82
_080C1E7A:
	mov r3, r8
	cmp r3, #3
	bgt _080C1E92
	movs r0, #0x1c
_080C1E82:
	add r8, r0
	ldr r1, [sp, #0x10]
	add r1, r8
	str r1, [sp, #0x10]
	add r5, r8
	ldr r2, [sp, #0x34]
	add r2, r8
	str r2, [sp, #0x34]
_080C1E92:
	ldr r3, [sp, #0x10]
	cmp r3, #0
	ble _080C1EA4
	mov r0, sl
	ldr r1, [sp, #0x5c]
	adds r2, r3, #0
	bl sub_080C34C0
	str r0, [sp, #0x5c]
_080C1EA4:
	ldr r0, [sp, #0x34]
	cmp r0, #0
	ble _080C1EB6
	mov r0, sl
	ldr r1, [sp, #0x68]
	ldr r2, [sp, #0x34]
	bl sub_080C34C0
	str r0, [sp, #0x68]
_080C1EB6:
	ldr r1, [sp, #0x2c]
	cmp r1, #0
	beq _080C1EF4
	ldr r0, [sp, #0x5c]
	ldr r1, [sp, #0x68]
	bl sub_080C3560
	cmp r0, #0
	bge _080C1EF4
	ldr r2, [sp, #0x24]
	subs r2, #1
	str r2, [sp, #0x24]
	mov r0, sl
	ldr r1, [sp, #0x5c]
	movs r2, #0xa
	movs r3, #0
	bl sub_080C30B0
	str r0, [sp, #0x5c]
	ldr r3, [sp, #0x30]
	cmp r3, #0
	beq _080C1EF0
	mov r0, sl
	ldr r1, [sp, #0x64]
	movs r2, #0xa
	movs r3, #0
	bl sub_080C30B0
	str r0, [sp, #0x64]
_080C1EF0:
	ldr r0, [sp, #0x20]
	str r0, [sp, #0x18]
_080C1EF4:
	ldr r1, [sp, #0x18]
	cmp r1, #0
	bgt _080C1F38
	ldr r2, [sp, #0xc]
	cmp r2, #2
	ble _080C1F38
	cmp r1, #0
	blt _080C1F1E
	mov r0, sl
	ldr r1, [sp, #0x68]
	movs r2, #5
	movs r3, #0
	bl sub_080C30B0
	str r0, [sp, #0x68]
	ldr r0, [sp, #0x5c]
	ldr r1, [sp, #0x68]
	bl sub_080C3560
	cmp r0, #0
	bgt _080C1F26
_080C1F1E:
	ldr r3, [sp, #0xa4]
	mvns r3, r3
	str r3, [sp, #0x24]
	b _080C216E
_080C1F26:
	movs r0, #0x31
	mov r1, sb
	strb r0, [r1]
	movs r2, #1
	add sb, r2
	ldr r3, [sp, #0x24]
	adds r3, #1
	str r3, [sp, #0x24]
	b _080C216E
_080C1F38:
	ldr r0, [sp, #0x30]
	cmp r0, #0
	bne _080C1F40
	b _080C20B6
_080C1F40:
	cmp r5, #0
	ble _080C1F50
	mov r0, sl
	ldr r1, [sp, #0x64]
	adds r2, r5, #0
	bl sub_080C34C0
	str r0, [sp, #0x64]
_080C1F50:
	ldr r1, [sp, #0x64]
	str r1, [sp, #0x60]
	ldr r2, [sp, #0x3c]
	cmp r2, #0
	beq _080C1F82
	ldr r1, [r1, #4]
	mov r0, sl
	bl sub_080C3040
	str r0, [sp, #0x64]
	adds r0, #0xc
	ldr r1, [sp, #0x60]
	adds r1, #0xc
	ldr r3, [sp, #0x60]
	ldr r2, [r3, #0x10]
	lsls r2, r2, #2
	adds r2, #8
	bl memcpy
	mov r0, sl
	ldr r1, [sp, #0x64]
	movs r2, #1
	bl sub_080C34C0
	str r0, [sp, #0x64]
_080C1F82:
	movs r0, #1
	mov r8, r0
	mov r1, r8
	ldr r2, [sp, #0x44]
	ands r2, r1
	str r2, [sp, #0x80]
	b _080C1FD8
_080C1F90:
	mov r0, sl
	ldr r1, [sp, #0x5c]
	movs r2, #0xa
	movs r3, #0
	bl sub_080C30B0
	str r0, [sp, #0x5c]
	ldr r3, [sp, #0x60]
	ldr r0, [sp, #0x64]
	cmp r3, r0
	bne _080C1FB8
	mov r0, sl
	ldr r1, [sp, #0x64]
	movs r2, #0xa
	movs r3, #0
	bl sub_080C30B0
	str r0, [sp, #0x64]
	str r0, [sp, #0x60]
	b _080C1FD4
_080C1FB8:
	mov r0, sl
	ldr r1, [sp, #0x60]
	movs r2, #0xa
	movs r3, #0
	bl sub_080C30B0
	str r0, [sp, #0x60]
	mov r0, sl
	ldr r1, [sp, #0x64]
	movs r2, #0xa
	movs r3, #0
	bl sub_080C30B0
	str r0, [sp, #0x64]
_080C1FD4:
	movs r1, #1
	add r8, r1
_080C1FD8:
	ldr r0, [sp, #0x5c]
	ldr r1, [sp, #0x68]
	bl sub_080C1370
	adds r7, r0, #0
	adds r7, #0x30
	ldr r0, [sp, #0x5c]
	ldr r1, [sp, #0x60]
	bl sub_080C3560
	adds r4, r0, #0
	mov r0, sl
	ldr r1, [sp, #0x68]
	ldr r2, [sp, #0x64]
	bl sub_080C35A0
	adds r5, r0, #0
	ldr r0, [r5, #0xc]
	cmp r0, #0
	bne _080C200C
	ldr r0, [sp, #0x5c]
	adds r1, r5, #0
	bl sub_080C3560
	adds r6, r0, #0
	b _080C200E
_080C200C:
	movs r6, #1
_080C200E:
	mov r0, sl
	adds r1, r5, #0
	bl sub_080C3098
	cmp r6, #0
	bne _080C203A
	ldr r2, [sp, #0xc]
	cmp r2, #0
	bne _080C203A
	ldr r3, [sp, #0x80]
	cmp r3, #0
	bne _080C203A
	cmp r7, #0x39
	beq _080C208C
	cmp r4, #0
	ble _080C2030
	adds r7, #1
_080C2030:
	mov r0, sb
	strb r7, [r0]
	movs r1, #1
	add sb, r1
	b _080C216E
_080C203A:
	cmp r4, #0
	blt _080C204E
	cmp r4, #0
	bne _080C2084
	ldr r2, [sp, #0xc]
	cmp r2, #0
	bne _080C2084
	ldr r3, [sp, #0x80]
	cmp r3, #0
	bne _080C2084
_080C204E:
	cmp r6, #0
	ble _080C207E
	mov r0, sl
	ldr r1, [sp, #0x5c]
	movs r2, #1
	bl sub_080C34C0
	str r0, [sp, #0x5c]
	ldr r1, [sp, #0x68]
	bl sub_080C3560
	adds r6, r0, #0
	cmp r6, #0
	bgt _080C2078
	cmp r6, #0
	bne _080C207E
	adds r0, r7, #0
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080C207E
_080C2078:
	adds r7, #1
	cmp r7, #0x3a
	beq _080C208C
_080C207E:
	mov r2, sb
	strb r7, [r2]
	b _080C2136
_080C2084:
	cmp r6, #0
	ble _080C20A4
	cmp r7, #0x39
	bne _080C2098
_080C208C:
	movs r0, #0x39
	mov r1, sb
	strb r0, [r1]
	movs r2, #1
	add sb, r2
	b _080C210C
_080C2098:
	adds r0, r7, #1
	mov r3, sb
	strb r0, [r3]
	movs r0, #1
	add sb, r0
	b _080C216E
_080C20A4:
	mov r1, sb
	strb r7, [r1]
	movs r2, #1
	add sb, r2
	ldr r3, [sp, #0x18]
	cmp r8, r3
	beq _080C20B4
	b _080C1F90
_080C20B4:
	b _080C20E8
_080C20B6:
	movs r0, #1
	mov r8, r0
	b _080C20CE
_080C20BC:
	mov r0, sl
	ldr r1, [sp, #0x5c]
	movs r2, #0xa
	movs r3, #0
	bl sub_080C30B0
	str r0, [sp, #0x5c]
	movs r1, #1
	add r8, r1
_080C20CE:
	ldr r0, [sp, #0x5c]
	ldr r1, [sp, #0x68]
	bl sub_080C1370
	adds r7, r0, #0
	adds r7, #0x30
	mov r2, sb
	strb r7, [r2]
	movs r3, #1
	add sb, r3
	ldr r0, [sp, #0x18]
	cmp r8, r0
	blt _080C20BC
_080C20E8:
	mov r0, sl
	ldr r1, [sp, #0x5c]
	movs r2, #1
	bl sub_080C34C0
	str r0, [sp, #0x5c]
	ldr r1, [sp, #0x68]
	bl sub_080C3560
	adds r4, r0, #0
	cmp r4, #0
	bgt _080C210C
	cmp r4, #0
	bne _080C214E
	movs r0, #1
	ands r7, r0
	cmp r7, #0
	beq _080C214E
_080C210C:
	movs r1, #1
	rsbs r1, r1, #0
	add sb, r1
	mov r2, sb
	ldrb r2, [r2]
	cmp r2, #0x39
	bne _080C212E
_080C211A:
	ldr r3, [sp, #0x74]
	cmp sb, r3
	beq _080C213C
	movs r0, #1
	rsbs r0, r0, #0
	add sb, r0
	mov r1, sb
	ldrb r1, [r1]
	cmp r1, #0x39
	beq _080C211A
_080C212E:
	mov r2, sb
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
_080C2136:
	movs r3, #1
	add sb, r3
	b _080C216E
_080C213C:
	ldr r0, [sp, #0x24]
	adds r0, #1
	str r0, [sp, #0x24]
	movs r0, #0x31
	ldr r1, [sp, #0x74]
	strb r0, [r1]
	adds r1, #1
	mov sb, r1
	b _080C216E
_080C214E:
	movs r2, #1
	rsbs r2, r2, #0
	add sb, r2
	mov r3, sb
	ldrb r3, [r3]
	cmp r3, #0x30
	bne _080C216A
_080C215C:
	movs r0, #1
	rsbs r0, r0, #0
	add sb, r0
	mov r1, sb
	ldrb r1, [r1]
	cmp r1, #0x30
	beq _080C215C
_080C216A:
	movs r2, #1
	add sb, r2
_080C216E:
	mov r0, sl
	ldr r1, [sp, #0x68]
	bl sub_080C3098
	ldr r3, [sp, #0x64]
	cmp r3, #0
	beq _080C2196
	ldr r0, [sp, #0x60]
	cmp r0, #0
	beq _080C218E
	cmp r0, r3
	beq _080C218E
	mov r0, sl
	ldr r1, [sp, #0x60]
	bl sub_080C3098
_080C218E:
	mov r0, sl
	ldr r1, [sp, #0x64]
	bl sub_080C3098
_080C2196:
	mov r0, sl
	ldr r1, [sp, #0x5c]
	bl sub_080C3098
	movs r0, #0
	mov r1, sb
	strb r0, [r1]
	ldr r0, [sp, #0x24]
	adds r0, #1
	ldr r2, [sp, #0xa8]
	str r0, [r2]
	ldr r3, [sp, #0xb0]
	cmp r3, #0
	beq _080C21B4
	str r1, [r3]
_080C21B4:
	ldr r0, [sp, #0x74]
_080C21B6:
	add sp, #0x84
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}
	.align 2, 0

	thumb_func_start sub_080C21C4
sub_080C21C4: @ 0x080C21C4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	cmp r4, #0
	bne _080C21E0
	ldr r0, _080C21D8 @ =0x08CF6638
	ldr r0, [r0]
	ldr r1, _080C21DC @ =sub_080C21C4
	bl sub_080C2860
	b _080C2256
	.align 2, 0
_080C21D8: .4byte 0x08CF6638
_080C21DC: .4byte sub_080C21C4
_080C21E0:
	ldr r0, [r4, #0x54]
	cmp r0, #0
	bne _080C21EC
	ldr r0, _080C2220 @ =0x08CF6638
	ldr r0, [r0]
	str r0, [r4, #0x54]
_080C21EC:
	ldr r1, [r4, #0x54]
	ldr r0, [r1, #0x38]
	cmp r0, #0
	bne _080C21FA
	adds r0, r1, #0
	bl sub_080C2354
_080C21FA:
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080C2254
	ldr r6, [r4, #0x10]
	cmp r6, #0
	beq _080C2254
	ldr r0, [r4]
	subs r5, r0, r6
	str r6, [r4]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _080C2232
	ldr r0, [r4, #0x14]
	b _080C2234
	.align 2, 0
_080C2220: .4byte 0x08CF6638
_080C2224:
	movs r0, #0x40
	ldrh r1, [r4, #0xc]
	orrs r0, r1
	strh r0, [r4, #0xc]
	movs r0, #1
	rsbs r0, r0, #0
	b _080C2256
_080C2232:
	movs r0, #0
_080C2234:
	str r0, [r4, #8]
	cmp r5, #0
	ble _080C2254
_080C223A:
	ldr r0, [r4, #0x1c]
	ldr r3, [r4, #0x24]
	adds r1, r6, #0
	adds r2, r5, #0
	bl _call_via_r3
	adds r1, r0, #0
	cmp r1, #0
	ble _080C2224
	adds r6, r6, r1
	subs r5, r5, r1
	cmp r5, #0
	bgt _080C223A
_080C2254:
	movs r0, #0
_080C2256:
	pop {r4, r5, r6, pc}

	thumb_func_start sub_080C2258
sub_080C2258: @ 0x080C2258
	push {r4, lr}
	movs r4, #0
	str r4, [r0]
	str r4, [r0, #4]
	str r4, [r0, #8]
	strh r1, [r0, #0xc]
	strh r2, [r0, #0xe]
	str r4, [r0, #0x10]
	str r4, [r0, #0x18]
	str r0, [r0, #0x1c]
	ldr r1, _080C2280 @ =0x080C3981
	str r1, [r0, #0x20]
	ldr r1, _080C2284 @ =0x080C39B5
	str r1, [r0, #0x24]
	ldr r1, _080C2288 @ =0x080C39F5
	str r1, [r0, #0x28]
	ldr r1, _080C228C @ =0x080C3A35
	str r1, [r0, #0x2c]
	str r3, [r0, #0x54]
	pop {r4, pc}
	.align 2, 0
_080C2280: .4byte 0x080C3981
_080C2284: .4byte 0x080C39B5
_080C2288: .4byte 0x080C39F5
_080C228C: .4byte 0x080C3A35
_080C2290:
	.byte 0x70, 0xB5, 0x0D, 0x1C, 0x58, 0x21, 0x2E, 0x1C, 0x4E, 0x43, 0x31, 0x1C, 0x0C, 0x31, 0x00, 0xF0
	.byte 0x51, 0xFC, 0x04, 0x1C, 0x00, 0x2C, 0x09, 0xD0, 0x0C, 0x30, 0x00, 0x21, 0x21, 0x60, 0x65, 0x60
	.byte 0xA0, 0x60, 0x32, 0x1C, 0xFD, 0xF7, 0xA0, 0xFE, 0x20, 0x1C, 0x00, 0xE0, 0x00, 0x20, 0x70, 0xBD
	.byte 0x30, 0xB5, 0x05, 0x1C, 0xA8, 0x6B, 0x00, 0x28, 0x02, 0xD1, 0x28, 0x1C, 0x00, 0xF0, 0x42, 0xF8
	.byte 0xEC, 0x20, 0x40, 0x00, 0x2C, 0x18, 0x00, 0xE0, 0x24, 0x68, 0xA2, 0x68, 0x60, 0x68, 0x04, 0xE0
	.byte 0x0C, 0x23, 0xD1, 0x5E, 0x00, 0x29, 0x11, 0xD0, 0x58, 0x32, 0x01, 0x38, 0x00, 0x28, 0xF7, 0xDA
	.byte 0x20, 0x68, 0x00, 0x28, 0xF0, 0xD1, 0x28, 0x1C, 0x04, 0x21, 0xFF, 0xF7, 0xC9, 0xFF, 0x20, 0x60
	.byte 0x00, 0x28, 0xE9, 0xD1, 0x0C, 0x20, 0x28, 0x60, 0x00, 0x20, 0x0F, 0xE0, 0x01, 0x20, 0x90, 0x81
	.byte 0x11, 0x60, 0x91, 0x60, 0x51, 0x60, 0x11, 0x61, 0x51, 0x61, 0x91, 0x61, 0x04, 0x48, 0xD0, 0x81
	.byte 0x11, 0x63, 0x51, 0x63, 0x51, 0x64, 0x91, 0x64, 0x55, 0x65, 0x10, 0x1C, 0x30, 0xBD, 0x00, 0x00
	.byte 0xFF, 0xFF, 0x00, 0x00, 0x00, 0xB5, 0x02, 0x49, 0x00, 0xF0, 0x92, 0xFA, 0x00, 0xBD, 0x00, 0x00
	.byte 0xC5, 0x21, 0x0C, 0x08, 0x00, 0xB5, 0x02, 0x48, 0x00, 0x68, 0xFF, 0xF7, 0xF3, 0xFF, 0x00, 0xBD
	.byte 0x38, 0x66, 0xCF, 0x08

	thumb_func_start sub_080C2354
sub_080C2354: @ 0x080C2354
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _080C23B0 @ =0x080C2335
	str r0, [r5, #0x3c]
	movs r0, #1
	str r0, [r5, #0x38]
	movs r0, #0xf2
	lsls r0, r0, #1
	adds r4, r5, r0
	adds r0, r4, #0
	movs r1, #4
	movs r2, #0
	adds r3, r5, #0
	bl sub_080C2258
	movs r1, #0x8f
	lsls r1, r1, #2
	adds r0, r5, r1
	movs r1, #9
	movs r2, #1
	adds r3, r5, #0
	bl sub_080C2258
	movs r1, #0xa5
	lsls r1, r1, #2
	adds r0, r5, r1
	movs r1, #0xa
	movs r2, #2
	adds r3, r5, #0
	bl sub_080C2258
	movs r0, #0xec
	lsls r0, r0, #1
	adds r1, r5, r0
	movs r0, #0
	str r0, [r1]
	movs r0, #0xee
	lsls r0, r0, #1
	adds r1, r5, r0
	movs r0, #3
	str r0, [r1]
	movs r1, #0xf0
	lsls r1, r1, #1
	adds r0, r5, r1
	str r4, [r0]
	pop {r4, r5, pc}
	.align 2, 0
_080C23B0: .4byte 0x080C2335

	thumb_func_start sub_080C23B4
sub_080C23B4: @ 0x080C23B4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	adds r4, r1, #0
	cmp r4, #0
	bne _080C23C6
	b _080C256A
_080C23C6:
	bl sub_080C3038
	adds r5, r4, #0
	subs r5, #8
	ldr r1, [r5, #4]
	movs r6, #2
	rsbs r6, r6, #0
	ands r6, r1
	adds r7, r5, r6
	ldr r4, [r7, #4]
	movs r0, #4
	rsbs r0, r0, #0
	ands r4, r0
	ldr r0, _080C2428 @ =0x08CF6650
	mov ip, r0
	ldr r0, [r0, #8]
	cmp r7, r0
	bne _080C2434
	adds r6, r6, r4
	movs r4, #1
	ands r1, r4
	cmp r1, #0
	bne _080C2402
	ldr r0, [r5]
	subs r5, r5, r0
	adds r6, r6, r0
	ldr r3, [r5, #0xc]
	ldr r2, [r5, #8]
	str r3, [r2, #0xc]
	str r2, [r3, #8]
_080C2402:
	adds r0, r6, #0
	orrs r0, r4
	str r0, [r5, #4]
	mov r2, ip
	str r5, [r2, #8]
	ldr r0, _080C242C @ =0x08CF6A58
	ldr r0, [r0]
	cmp r6, r0
	blo _080C241E
	ldr r0, _080C2430 @ =0x08CF6A5C
	ldr r1, [r0]
	mov r0, sb
	bl sub_080C2574
_080C241E:
	mov r0, sb
	bl sub_080C303C
	b _080C256A
	.align 2, 0
_080C2428: .4byte 0x08CF6650
_080C242C: .4byte 0x08CF6A58
_080C2430: .4byte 0x08CF6A5C
_080C2434:
	str r4, [r7, #4]
	movs r0, #0
	mov r8, r0
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	bne _080C2460
	ldr r0, [r5]
	subs r5, r5, r0
	adds r6, r6, r0
	ldr r1, [r5, #8]
	mov r0, ip
	adds r0, #8
	cmp r1, r0
	bne _080C2458
	movs r2, #1
	mov r8, r2
	b _080C2460
_080C2458:
	ldr r3, [r5, #0xc]
	adds r2, r1, #0
	str r3, [r2, #0xc]
	str r2, [r3, #8]
_080C2460:
	adds r0, r7, r4
	ldr r0, [r0, #4]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080C2498
	adds r6, r6, r4
	ldr r1, [r7, #8]
	mov r0, r8
	cmp r0, #0
	bne _080C2490
	ldr r0, _080C248C @ =0x08CF6658
	cmp r1, r0
	bne _080C2490
	movs r2, #1
	mov r8, r2
	str r5, [r1, #0xc]
	str r5, [r1, #8]
	str r1, [r5, #0xc]
	str r1, [r5, #8]
	b _080C2498
	.align 2, 0
_080C248C: .4byte 0x08CF6658
_080C2490:
	ldr r3, [r7, #0xc]
	adds r2, r1, #0
	str r3, [r2, #0xc]
	str r2, [r3, #8]
_080C2498:
	movs r1, #1
	adds r0, r6, #0
	orrs r0, r1
	str r0, [r5, #4]
	adds r0, r5, r6
	str r6, [r0]
	mov r0, r8
	cmp r0, #0
	bne _080C2564
	ldr r0, _080C24C8 @ =0x000001FF
	cmp r6, r0
	bhi _080C24D0
	lsrs r4, r6, #3
	ldr r2, _080C24CC @ =0x08CF6650
	adds r0, r4, #0
	asrs r0, r0, #2
	lsls r1, r0
	ldr r0, [r2, #4]
	orrs r0, r1
	str r0, [r2, #4]
	lsls r0, r4, #3
	adds r3, r0, r2
	ldr r2, [r3, #8]
	b _080C255C
	.align 2, 0
_080C24C8: .4byte 0x000001FF
_080C24CC: .4byte 0x08CF6650
_080C24D0:
	lsrs r1, r6, #9
	cmp r1, #0
	bne _080C24DA
	lsrs r4, r6, #3
	b _080C2522
_080C24DA:
	cmp r1, #4
	bhi _080C24E6
	lsrs r0, r6, #6
	adds r4, r0, #0
	adds r4, #0x38
	b _080C2522
_080C24E6:
	cmp r1, #0x14
	bhi _080C24F0
	adds r4, r1, #0
	adds r4, #0x5b
	b _080C2522
_080C24F0:
	cmp r1, #0x54
	bhi _080C24FC
	lsrs r0, r6, #0xc
	adds r4, r0, #0
	adds r4, #0x6e
	b _080C2522
_080C24FC:
	movs r0, #0xaa
	lsls r0, r0, #1
	cmp r1, r0
	bhi _080C250C
	lsrs r0, r6, #0xf
	adds r4, r0, #0
	adds r4, #0x77
	b _080C2522
_080C250C:
	ldr r0, _080C251C @ =0x00000554
	cmp r1, r0
	bhi _080C2520
	lsrs r0, r6, #0x12
	adds r4, r0, #0
	adds r4, #0x7c
	b _080C2522
	.align 2, 0
_080C251C: .4byte 0x00000554
_080C2520:
	movs r4, #0x7e
_080C2522:
	lsls r0, r4, #3
	ldr r7, _080C2540 @ =0x08CF6650
	adds r3, r0, r7
	ldr r2, [r3, #8]
	cmp r2, r3
	bne _080C2544
	adds r0, r4, #0
	asrs r0, r0, #2
	movs r1, #1
	lsls r1, r0
	ldr r0, [r7, #4]
	orrs r0, r1
	str r0, [r7, #4]
	b _080C255C
	.align 2, 0
_080C2540: .4byte 0x08CF6650
_080C2544:
	ldr r0, [r2, #4]
	movs r1, #4
	rsbs r1, r1, #0
	b _080C2554
_080C254C:
	ldr r2, [r2, #8]
	cmp r2, r3
	beq _080C255A
	ldr r0, [r2, #4]
_080C2554:
	ands r0, r1
	cmp r6, r0
	blo _080C254C
_080C255A:
	ldr r3, [r2, #0xc]
_080C255C:
	str r3, [r5, #0xc]
	str r2, [r5, #8]
	str r5, [r3, #8]
	str r5, [r2, #0xc]
_080C2564:
	mov r0, sb
	bl sub_080C303C
_080C256A:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7, pc}
	.align 2, 0

	thumb_func_start sub_080C2574
sub_080C2574: @ 0x080C2574
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r4, r1, #0
	bl sub_080C3038
	ldr r0, _080C25FC @ =0x08CF6650
	mov r8, r0
	ldr r0, [r0, #8]
	ldr r6, [r0, #4]
	movs r0, #4
	rsbs r0, r0, #0
	ands r6, r0
	subs r4, r6, r4
	movs r5, #0x80
	lsls r5, r5, #5
	ldr r1, _080C2600 @ =0x00000FEF
	adds r4, r4, r1
	adds r0, r4, #0
	adds r1, r5, #0
	bl __udivsi3
	subs r0, #1
	lsls r4, r0, #0xc
	cmp r4, r5
	blt _080C25F2
	adds r0, r7, #0
	movs r1, #0
	bl sub_080C3954
	adds r2, r0, #0
	mov r1, r8
	ldr r0, [r1, #8]
	adds r0, r0, r6
	cmp r2, r0
	bne _080C25F2
	rsbs r1, r4, #0
	adds r0, r7, #0
	bl sub_080C3954
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _080C260C
	adds r0, r7, #0
	movs r1, #0
	bl sub_080C3954
	adds r2, r0, #0
	mov r0, r8
	ldr r3, [r0, #8]
	subs r6, r2, r3
	cmp r6, #0xf
	ble _080C25F2
	ldr r1, _080C2604 @ =0x08CF6A6C
	ldr r0, _080C2608 @ =0x08CF6A60
	ldr r0, [r0]
	subs r0, r2, r0
	str r0, [r1]
	movs r0, #1
	orrs r6, r0
	str r6, [r3, #4]
_080C25F2:
	adds r0, r7, #0
	bl sub_080C303C
	movs r0, #0
	b _080C2628
	.align 2, 0
_080C25FC: .4byte 0x08CF6650
_080C2600: .4byte 0x00000FEF
_080C2604: .4byte 0x08CF6A6C
_080C2608: .4byte 0x08CF6A60
_080C260C:
	mov r1, r8
	ldr r2, [r1, #8]
	subs r0, r6, r4
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #4]
	ldr r1, _080C2630 @ =0x08CF6A6C
	ldr r0, [r1]
	subs r0, r0, r4
	str r0, [r1]
	adds r0, r7, #0
	bl sub_080C303C
	movs r0, #1
_080C2628:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_080C2630: .4byte 0x08CF6A6C

	thumb_func_start sub_080C2634
sub_080C2634: @ 0x080C2634
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	mov sl, r1
	ldr r6, [r1, #8]
	cmp r6, #0
	bne _080C264C
	b _080C2842
_080C264C:
	movs r0, #8
	ldrh r1, [r5, #0xc]
	ands r0, r1
	cmp r0, #0
	beq _080C265C
	ldr r0, [r5, #0x10]
	cmp r0, #0
	bne _080C2668
_080C265C:
	adds r0, r5, #0
	bl sub_080C12C4
	cmp r0, #0
	beq _080C2668
	b _080C284E
_080C2668:
	mov r2, sl
	ldr r2, [r2]
	mov r8, r2
	movs r6, #0
	ldrh r1, [r5, #0xc]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080C26BC
_080C267A:
	ldr r0, [r5, #0x1c]
	ldr r3, [r5, #0x24]
	cmp r6, #0
	bne _080C2690
_080C2682:
	mov r1, r8
	ldr r7, [r1]
	ldr r6, [r1, #4]
	movs r2, #8
	add r8, r2
	cmp r6, #0
	beq _080C2682
_080C2690:
	adds r2, r6, #0
	movs r1, #0x80
	lsls r1, r1, #3
	cmp r6, r1
	bls _080C269C
	adds r2, r1, #0
_080C269C:
	adds r1, r7, #0
	bl _call_via_r3
	adds r4, r0, #0
	cmp r4, #0
	bgt _080C26AA
	b _080C2846
_080C26AA:
	adds r7, r7, r4
	subs r6, r6, r4
	mov r1, sl
	ldr r0, [r1, #8]
	subs r0, r0, r4
	str r0, [r1, #8]
	cmp r0, #0
	bne _080C267A
	b _080C2842
_080C26BC:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080C2776
_080C26C4:
	ldrh r1, [r5, #0xc]
	ldr r0, [r5, #8]
	ldr r3, [r5]
	cmp r6, #0
	bne _080C26DC
_080C26CE:
	mov r2, r8
	ldr r7, [r2]
	ldr r6, [r2, #4]
	movs r2, #8
	add r8, r2
	cmp r6, #0
	beq _080C26CE
_080C26DC:
	adds r4, r0, #0
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _080C270A
	cmp r6, r4
	bhs _080C26F0
	adds r4, r6, #0
_080C26F0:
	adds r0, r3, #0
	adds r1, r7, #0
	adds r2, r4, #0
	bl sub_080C2FB0
	ldr r0, [r5, #8]
	subs r0, r0, r4
	str r0, [r5, #8]
	ldr r0, [r5]
	adds r0, r0, r4
	str r0, [r5]
	adds r4, r6, #0
	b _080C2764
_080C270A:
	ldr r0, [r5, #0x10]
	cmp r3, r0
	bls _080C2732
	cmp r6, r4
	bls _080C2732
	adds r0, r3, #0
	adds r1, r7, #0
	adds r2, r4, #0
	bl sub_080C2FB0
	ldr r0, [r5]
	adds r0, r0, r4
	str r0, [r5]
	adds r0, r5, #0
	bl sub_080C21C4
	cmp r0, #0
	beq _080C2730
	b _080C2846
_080C2730:
	b _080C2764
_080C2732:
	ldr r4, [r5, #0x14]
	cmp r6, r4
	blo _080C274C
	ldr r0, [r5, #0x1c]
	ldr r3, [r5, #0x24]
	adds r1, r7, #0
	adds r2, r4, #0
	bl _call_via_r3
	adds r4, r0, #0
	cmp r4, #0
	ble _080C2846
	b _080C2764
_080C274C:
	adds r4, r6, #0
	adds r0, r3, #0
	adds r1, r7, #0
	adds r2, r4, #0
	bl sub_080C2FB0
	ldr r0, [r5, #8]
	subs r0, r0, r4
	str r0, [r5, #8]
	ldr r0, [r5]
	adds r0, r0, r4
	str r0, [r5]
_080C2764:
	adds r7, r7, r4
	subs r6, r6, r4
	mov r1, sl
	ldr r0, [r1, #8]
	subs r0, r0, r4
	str r0, [r1, #8]
	cmp r0, #0
	bne _080C26C4
	b _080C2842
_080C2776:
	movs r2, #0
	str r2, [sp]
_080C277A:
	cmp r6, #0
	bne _080C2790
	movs r0, #0
	str r0, [sp]
_080C2782:
	mov r1, r8
	ldr r7, [r1]
	ldr r6, [r1, #4]
	movs r2, #8
	add r8, r2
	cmp r6, #0
	beq _080C2782
_080C2790:
	ldr r0, [sp]
	cmp r0, #0
	bne _080C27B4
	adds r0, r7, #0
	movs r1, #0xa
	adds r2, r6, #0
	bl sub_080C2F30
	adds r1, r0, #0
	cmp r1, #0
	beq _080C27AC
	subs r0, r7, #1
	subs r1, r1, r0
	b _080C27AE
_080C27AC:
	adds r1, r6, #1
_080C27AE:
	mov sb, r1
	movs r2, #1
	str r2, [sp]
_080C27B4:
	mov r2, sb
	cmp sb, r6
	bls _080C27BC
	adds r2, r6, #0
_080C27BC:
	ldr r0, [r5, #8]
	ldr r1, [r5, #0x14]
	adds r4, r0, r1
	ldr r0, [r5, #0x10]
	ldr r3, [r5]
	cmp r3, r0
	bls _080C27EA
	cmp r2, r4
	ble _080C27EA
	adds r0, r3, #0
	adds r1, r7, #0
	adds r2, r4, #0
	bl sub_080C2FB0
	ldr r0, [r5]
	adds r0, r0, r4
	str r0, [r5]
	adds r0, r5, #0
	bl sub_080C21C4
	cmp r0, #0
	bne _080C2846
	b _080C281A
_080C27EA:
	adds r4, r1, #0
	cmp r2, r4
	blt _080C2804
	ldr r0, [r5, #0x1c]
	ldr r3, [r5, #0x24]
	adds r1, r7, #0
	adds r2, r4, #0
	bl _call_via_r3
	adds r4, r0, #0
	cmp r4, #0
	ble _080C2846
	b _080C281A
_080C2804:
	adds r4, r2, #0
	adds r0, r3, #0
	adds r1, r7, #0
	bl sub_080C2FB0
	ldr r0, [r5, #8]
	subs r0, r0, r4
	str r0, [r5, #8]
	ldr r0, [r5]
	adds r0, r0, r4
	str r0, [r5]
_080C281A:
	mov r0, sb
	subs r0, r0, r4
	mov sb, r0
	cmp r0, #0
	bne _080C2832
	adds r0, r5, #0
	bl sub_080C21C4
	cmp r0, #0
	bne _080C2846
	movs r1, #0
	str r1, [sp]
_080C2832:
	adds r7, r7, r4
	subs r6, r6, r4
	mov r2, sl
	ldr r0, [r2, #8]
	subs r0, r0, r4
	str r0, [r2, #8]
	cmp r0, #0
	bne _080C277A
_080C2842:
	movs r0, #0
	b _080C2852
_080C2846:
	movs r0, #0x40
	ldrh r1, [r5, #0xc]
	orrs r0, r1
	strh r0, [r5, #0xc]
_080C284E:
	movs r0, #1
	rsbs r0, r0, #0
_080C2852:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}
	.align 2, 0

	thumb_func_start sub_080C2860
sub_080C2860: @ 0x080C2860
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r1
	movs r7, #0
	movs r1, #0xec
	lsls r1, r1, #1
	adds r6, r0, r1
	cmp r6, #0
	beq _080C2898
_080C2874:
	ldr r5, [r6, #8]
	ldr r4, [r6, #4]
	b _080C288C
_080C287A:
	movs r1, #0xc
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _080C288A
	adds r0, r5, #0
	bl sub_080BFC6C
	orrs r7, r0
_080C288A:
	adds r5, #0x58
_080C288C:
	subs r4, #1
	cmp r4, #0
	bge _080C287A
	ldr r6, [r6]
	cmp r6, #0
	bne _080C2874
_080C2898:
	adds r0, r7, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7, pc}
_080C28A0:
	.byte 0x70, 0xB5, 0x05, 0x1C, 0x0E, 0x1C, 0x14, 0x1C, 0x00, 0x2C, 0x13, 0xD0, 0x06, 0x49, 0x20, 0x1C
	.byte 0x01, 0xF0, 0xC8, 0xF8, 0x00, 0x28, 0x0B, 0xD0, 0x04, 0x49, 0x20, 0x1C, 0x01, 0xF0, 0xC2, 0xF8
	.byte 0x00, 0x28, 0x05, 0xD0, 0x00, 0x20, 0x06, 0xE0, 0xA8, 0x56, 0xB8, 0x08, 0xA0, 0x56, 0xB8, 0x08
	.byte 0x2E, 0x63, 0x6C, 0x63, 0x00, 0x48, 0x70, 0xBD, 0xA8, 0x56, 0xB8, 0x08

	thumb_func_start sub_080C28DC
sub_080C28DC: @ 0x080C28DC
	ldr r0, _080C28E0 @ =0x08B85670
	bx lr
	.align 2, 0
_080C28E0: .4byte 0x08B85670
_080C28E4:
	.byte 0x00, 0xB5, 0x03, 0x1C, 0x0A, 0x1C, 0x03, 0x48, 0x00, 0x68, 0x19, 0x1C
	.byte 0xFF, 0xF7, 0xD6, 0xFF, 0x00, 0xBD, 0x00, 0x00, 0x38, 0x66, 0xCF, 0x08

	thumb_func_start sub_080C28FC
sub_080C28FC: @ 0x080C28FC
	push {lr}
	ldr r0, _080C2908 @ =0x08CF6638
	ldr r0, [r0]
	bl sub_080C28DC
	pop {pc}
	.align 2, 0
_080C2908: .4byte 0x08CF6638

	thumb_func_start sub_080C290C
sub_080C290C: @ 0x080C290C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	adds r4, r0, #0
	movs r0, #2
	ldrh r1, [r4, #0xc]
	ands r0, r1
	cmp r0, #0
	bne _080C29A2
	movs r2, #0xe
	ldrsh r0, [r4, r2]
	cmp r0, #0
	blt _080C2934
	ldr r0, [r4, #0x54]
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	mov r2, sp
	bl sub_080C3FC4
	cmp r0, #0
	bge _080C2946
_080C2934:
	movs r7, #0
	movs r6, #0x80
	lsls r6, r6, #3
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r1, #0
	ldrh r2, [r4, #0xc]
	orrs r0, r2
	b _080C298A
_080C2946:
	movs r7, #0
	ldr r1, [sp, #4]
	movs r0, #0xf0
	lsls r0, r0, #8
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #6
	cmp r1, r0
	bne _080C295A
	movs r7, #1
_080C295A:
	movs r6, #0x80
	lsls r6, r6, #3
	movs r0, #0x80
	lsls r0, r0, #8
	cmp r1, r0
	bne _080C2980
	ldr r1, [r4, #0x28]
	ldr r0, _080C297C @ =0x080C39F5
	cmp r1, r0
	bne _080C2980
	adds r0, r6, #0
	ldrh r1, [r4, #0xc]
	orrs r0, r1
	strh r0, [r4, #0xc]
	str r6, [r4, #0x4c]
	b _080C298C
	.align 2, 0
_080C297C: .4byte 0x080C39F5
_080C2980:
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r2, #0
	ldrh r1, [r4, #0xc]
	orrs r0, r1
_080C298A:
	strh r0, [r4, #0xc]
_080C298C:
	ldr r0, [r4, #0x54]
	adds r1, r6, #0
	bl sub_080C2B44
	adds r2, r0, #0
	cmp r2, #0
	bne _080C29B0
	movs r0, #2
	ldrh r2, [r4, #0xc]
	orrs r0, r2
	strh r0, [r4, #0xc]
_080C29A2:
	adds r0, r4, #0
	adds r0, #0x43
	str r0, [r4]
	str r0, [r4, #0x10]
	movs r0, #1
	str r0, [r4, #0x14]
	b _080C29DE
_080C29B0:
	ldr r1, [r4, #0x54]
	ldr r0, _080C29E4 @ =0x080C2335
	str r0, [r1, #0x3c]
	movs r0, #0x80
	movs r5, #0
	ldrh r1, [r4, #0xc]
	orrs r0, r1
	strh r0, [r4, #0xc]
	str r2, [r4]
	str r2, [r4, #0x10]
	str r6, [r4, #0x14]
	cmp r7, #0
	beq _080C29DE
	movs r2, #0xe
	ldrsh r0, [r4, r2]
	bl sub_080C4010
	cmp r0, #0
	beq _080C29DE
	movs r0, #1
	ldrh r1, [r4, #0xc]
	orrs r0, r1
	strh r0, [r4, #0xc]
_080C29DE:
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_080C29E4: .4byte 0x080C2335

	thumb_func_start sub_080C29E8
sub_080C29E8: @ 0x080C29E8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	ldr r0, _080C2A5C @ =0x08CF6650
	ldr r0, [r0, #8]
	mov r8, r0
	ldr r7, [r0, #4]
	movs r0, #4
	rsbs r0, r0, #0
	ands r7, r0
	mov r2, r8
	adds r4, r2, r7
	ldr r0, _080C2A60 @ =0x08CF6A5C
	ldr r0, [r0]
	adds r1, r1, r0
	adds r6, r1, #0
	adds r6, #0x10
	ldr r3, _080C2A64 @ =0x08CF6A60
	mov sl, r3
	ldr r0, [r3]
	movs r2, #1
	rsbs r2, r2, #0
	mov sb, r2
	cmp r0, sb
	beq _080C2A2A
	ldr r3, _080C2A68 @ =0x0000100F
	adds r6, r1, r3
	ldr r0, _080C2A6C @ =0xFFFFF000
	ands r6, r0
_080C2A2A:
	ldr r0, [sp]
	adds r1, r6, #0
	bl sub_080C3954
	adds r5, r0, #0
	cmp r5, sb
	beq _080C2B2C
	cmp r5, r4
	bhs _080C2A42
	ldr r0, _080C2A5C @ =0x08CF6650
	cmp r8, r0
	bne _080C2B2C
_080C2A42:
	ldr r1, _080C2A70 @ =0x08CF6A6C
	ldr r0, [r1]
	adds r2, r0, r6
	str r2, [r1]
	cmp r5, r4
	bne _080C2A74
	adds r2, r6, r7
	ldr r3, _080C2A5C @ =0x08CF6650
	ldr r1, [r3, #8]
	movs r0, #1
	orrs r2, r0
	str r2, [r1, #4]
	b _080C2B14
	.align 2, 0
_080C2A5C: .4byte 0x08CF6650
_080C2A60: .4byte 0x08CF6A5C
_080C2A64: .4byte 0x08CF6A60
_080C2A68: .4byte 0x0000100F
_080C2A6C: .4byte 0xFFFFF000
_080C2A70: .4byte 0x08CF6A6C
_080C2A74:
	mov r3, sl
	ldr r0, [r3]
	cmp r0, sb
	bne _080C2A80
	str r5, [r3]
	b _080C2A86
_080C2A80:
	subs r0, r5, r4
	adds r0, r2, r0
	str r0, [r1]
_080C2A86:
	adds r1, r5, #0
	adds r1, #8
	movs r0, #7
	ands r1, r0
	cmp r1, #0
	beq _080C2A9A
	movs r0, #8
	subs r4, r0, r1
	adds r5, r5, r4
	b _080C2A9C
_080C2A9A:
	movs r4, #0
_080C2A9C:
	adds r0, r5, r6
	movs r1, #0x80
	lsls r1, r1, #5
	subs r1, #1
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #5
	subs r0, r1, r0
	adds r4, r4, r0
	ldr r0, [sp]
	adds r1, r4, #0
	bl sub_080C3954
	adds r2, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	beq _080C2B2C
	ldr r1, _080C2AE4 @ =0x08CF6A6C
	ldr r0, [r1]
	adds r0, r0, r4
	str r0, [r1]
	ldr r1, _080C2AE8 @ =0x08CF6650
	str r5, [r1, #8]
	subs r0, r2, r5
	adds r2, r0, r4
	movs r3, #1
	orrs r2, r3
	str r2, [r5, #4]
	cmp r8, r1
	beq _080C2B14
	cmp r7, #0xf
	bhi _080C2AEC
	str r3, [r5, #4]
	b _080C2B2C
	.align 2, 0
_080C2AE4: .4byte 0x08CF6A6C
_080C2AE8: .4byte 0x08CF6650
_080C2AEC:
	subs r7, #0xc
	movs r0, #8
	rsbs r0, r0, #0
	ands r7, r0
	mov r2, r8
	ldr r0, [r2, #4]
	ands r0, r3
	orrs r0, r7
	str r0, [r2, #4]
	adds r1, r2, r7
	movs r0, #5
	str r0, [r1, #4]
	str r0, [r1, #8]
	cmp r7, #0xf
	bls _080C2B14
	mov r1, r8
	adds r1, #8
	ldr r0, [sp]
	bl sub_080C23B4
_080C2B14:
	ldr r0, _080C2B38 @ =0x08CF6A6C
	ldr r2, _080C2B3C @ =0x08CF6A64
	ldr r1, [r0]
	ldr r0, [r2]
	cmp r1, r0
	bls _080C2B22
	str r1, [r2]
_080C2B22:
	ldr r2, _080C2B40 @ =0x08CF6A68
	ldr r0, [r2]
	cmp r1, r0
	bls _080C2B2C
	str r1, [r2]
_080C2B2C:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_080C2B38: .4byte 0x08CF6A6C
_080C2B3C: .4byte 0x08CF6A64
_080C2B40: .4byte 0x08CF6A68

	thumb_func_start sub_080C2B44
sub_080C2B44: @ 0x080C2B44
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp]
	adds r1, #0xb
	cmp r1, #0x16
	ble _080C2B66
	movs r0, #8
	rsbs r0, r0, #0
	mov r8, r0
	mov r2, r8
	ands r2, r1
	mov r8, r2
	b _080C2B6A
_080C2B66:
	movs r3, #0x10
	mov r8, r3
_080C2B6A:
	ldr r0, [sp]
	bl sub_080C3038
	ldr r0, _080C2BB0 @ =0x000001F7
	cmp r8, r0
	bhi _080C2BBE
	mov r4, r8
	lsrs r4, r4, #3
	mov ip, r4
	ldr r0, _080C2BB4 @ =0x08CF6650
	mov r7, r8
	adds r2, r7, r0
	ldr r5, [r2, #0xc]
	cmp r5, r2
	bne _080C2B92
	adds r2, r5, #0
	adds r2, #8
	ldr r5, [r2, #0xc]
	cmp r5, r2
	beq _080C2BB8
_080C2B92:
	ldr r2, [r5, #4]
	movs r0, #4
	rsbs r0, r0, #0
	ands r2, r0
	ldr r6, [r5, #0xc]
	ldr r4, [r5, #8]
	str r6, [r4, #0xc]
	str r4, [r6, #8]
	adds r2, r5, r2
	ldr r0, [r2, #4]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #4]
	b _080C2EEA
	.align 2, 0
_080C2BB0: .4byte 0x000001F7
_080C2BB4: .4byte 0x08CF6650
_080C2BB8:
	movs r0, #2
	add ip, r0
	b _080C2C6A
_080C2BBE:
	mov r2, r8
	lsrs r1, r2, #9
	cmp r1, #0
	bne _080C2BCA
	lsrs r2, r2, #3
	b _080C2C1A
_080C2BCA:
	cmp r1, #4
	bhi _080C2BD8
	mov r3, r8
	lsrs r0, r3, #6
	adds r0, #0x38
	mov ip, r0
	b _080C2C1C
_080C2BD8:
	cmp r1, #0x14
	bhi _080C2BE2
	adds r1, #0x5b
	mov ip, r1
	b _080C2C1C
_080C2BE2:
	cmp r1, #0x54
	bhi _080C2BF0
	mov r4, r8
	lsrs r0, r4, #0xc
	adds r0, #0x6e
	mov ip, r0
	b _080C2C1C
_080C2BF0:
	movs r0, #0xaa
	lsls r0, r0, #1
	cmp r1, r0
	bhi _080C2C02
	mov r7, r8
	lsrs r0, r7, #0xf
	adds r0, #0x77
	mov ip, r0
	b _080C2C1C
_080C2C02:
	ldr r0, _080C2C14 @ =0x00000554
	cmp r1, r0
	bhi _080C2C18
	mov r1, r8
	lsrs r0, r1, #0x12
	adds r0, #0x7c
	mov ip, r0
	b _080C2C1C
	.align 2, 0
_080C2C14: .4byte 0x00000554
_080C2C18:
	movs r2, #0x7e
_080C2C1A:
	mov ip, r2
_080C2C1C:
	mov r3, ip
	lsls r0, r3, #3
	ldr r1, _080C2C40 @ =0x08CF6650
	adds r4, r0, r1
	ldr r5, [r4, #0xc]
	cmp r5, r4
	beq _080C2C66
	ldr r1, [r5, #4]
	movs r0, #4
	rsbs r0, r0, #0
	ands r1, r0
	mov r7, r8
	subs r3, r1, r7
	cmp r3, #0xf
	ble _080C2C44
	adds r0, #3
	add ip, r0
	b _080C2C66
	.align 2, 0
_080C2C40: .4byte 0x08CF6650
_080C2C44:
	cmp r3, #0
	blt _080C2C4A
	b _080C2E84
_080C2C4A:
	ldr r5, [r5, #0xc]
	cmp r5, r4
	beq _080C2C66
	ldr r1, [r5, #4]
	movs r0, #4
	rsbs r0, r0, #0
	ands r1, r0
	mov r2, r8
	subs r3, r1, r2
	cmp r3, #0xf
	ble _080C2C44
	movs r3, #1
	rsbs r3, r3, #0
	add ip, r3
_080C2C66:
	movs r4, #1
	add ip, r4
_080C2C6A:
	ldr r0, _080C2CA8 @ =0x08CF6658
	ldr r5, [r0, #8]
	mov sl, r0
	cmp r5, sl
	bne _080C2C76
	b _080C2D78
_080C2C76:
	ldr r1, [r5, #4]
	movs r0, #4
	rsbs r0, r0, #0
	ands r1, r0
	mov r7, r8
	subs r3, r1, r7
	cmp r3, #0xf
	ble _080C2CAC
	adds r2, r5, r7
	movs r1, #1
	adds r0, r7, #0
	orrs r0, r1
	str r0, [r5, #4]
	mov r4, sl
	str r2, [r4, #0xc]
	str r2, [r4, #8]
	str r4, [r2, #0xc]
	str r4, [r2, #8]
	adds r0, r3, #0
	orrs r0, r1
	str r0, [r2, #4]
	adds r0, r2, r3
	str r3, [r0]
	b _080C2EEA
	.align 2, 0
_080C2CA8: .4byte 0x08CF6658
_080C2CAC:
	mov r7, sl
	str r7, [r7, #0xc]
	str r7, [r7, #8]
	cmp r3, #0
	blt _080C2CC2
	adds r2, r5, r1
	ldr r0, [r2, #4]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #4]
	b _080C2EEA
_080C2CC2:
	ldr r0, _080C2CE4 @ =0x000001FF
	cmp r1, r0
	bhi _080C2CE8
	lsrs r2, r1, #3
	mov r3, sl
	subs r3, #8
	adds r0, r2, #0
	asrs r0, r0, #2
	movs r1, #1
	lsls r1, r0
	ldr r0, [r3, #4]
	orrs r0, r1
	str r0, [r3, #4]
	lsls r0, r2, #3
	adds r6, r0, r3
	ldr r4, [r6, #8]
	b _080C2D70
	.align 2, 0
_080C2CE4: .4byte 0x000001FF
_080C2CE8:
	lsrs r2, r1, #9
	cmp r2, #0
	bne _080C2CF2
	lsrs r2, r1, #3
	b _080C2D36
_080C2CF2:
	cmp r2, #4
	bhi _080C2CFE
	lsrs r0, r1, #6
	adds r2, r0, #0
	adds r2, #0x38
	b _080C2D36
_080C2CFE:
	cmp r2, #0x14
	bhi _080C2D06
	adds r2, #0x5b
	b _080C2D36
_080C2D06:
	cmp r2, #0x54
	bhi _080C2D12
	lsrs r0, r1, #0xc
	adds r2, r0, #0
	adds r2, #0x6e
	b _080C2D36
_080C2D12:
	movs r0, #0xaa
	lsls r0, r0, #1
	cmp r2, r0
	bhi _080C2D22
	lsrs r0, r1, #0xf
	adds r2, r0, #0
	adds r2, #0x77
	b _080C2D36
_080C2D22:
	ldr r0, _080C2D30 @ =0x00000554
	cmp r2, r0
	bhi _080C2D34
	lsrs r0, r1, #0x12
	adds r2, r0, #0
	adds r2, #0x7c
	b _080C2D36
	.align 2, 0
_080C2D30: .4byte 0x00000554
_080C2D34:
	movs r2, #0x7e
_080C2D36:
	lsls r0, r2, #3
	ldr r3, _080C2D54 @ =0x08CF6650
	adds r6, r0, r3
	ldr r4, [r6, #8]
	cmp r4, r6
	bne _080C2D58
	adds r0, r2, #0
	asrs r0, r0, #2
	movs r1, #1
	lsls r1, r0
	ldr r7, _080C2D54 @ =0x08CF6650
	ldr r0, [r7, #4]
	orrs r0, r1
	str r0, [r7, #4]
	b _080C2D70
	.align 2, 0
_080C2D54: .4byte 0x08CF6650
_080C2D58:
	ldr r0, [r4, #4]
	movs r2, #4
	rsbs r2, r2, #0
	b _080C2D68
_080C2D60:
	ldr r4, [r4, #8]
	cmp r4, r6
	beq _080C2D6E
	ldr r0, [r4, #4]
_080C2D68:
	ands r0, r2
	cmp r1, r0
	blo _080C2D60
_080C2D6E:
	ldr r6, [r4, #0xc]
_080C2D70:
	str r6, [r5, #0xc]
	str r4, [r5, #8]
	str r5, [r6, #8]
	str r5, [r4, #0xc]
_080C2D78:
	mov r0, ip
	cmp r0, #0
	bge _080C2D80
	adds r0, #3
_080C2D80:
	asrs r0, r0, #2
	movs r6, #1
	lsls r6, r0
	ldr r0, _080C2DA4 @ =0x08CF6650
	ldr r1, [r0, #4]
	cmp r6, r1
	bhi _080C2E42
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _080C2DB6
	movs r0, #4
	rsbs r0, r0, #0
	mov r2, ip
	ands r0, r2
	adds r0, #4
	mov ip, r0
	b _080C2DAC
	.align 2, 0
_080C2DA4: .4byte 0x08CF6650
_080C2DA8:
	movs r3, #4
	add ip, r3
_080C2DAC:
	lsls r6, r6, #1
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _080C2DA8
_080C2DB6:
	ldr r4, _080C2E34 @ =0x08CF6650
	mov sb, r4
_080C2DBA:
	mov r7, ip
	str r7, [sp, #4]
	mov r1, ip
	lsls r0, r1, #3
	mov r3, sb
	adds r2, r0, r3
	adds r4, r2, #0
_080C2DC8:
	ldr r5, [r4, #0xc]
	cmp r5, r4
	beq _080C2DE8
	movs r0, #4
	rsbs r0, r0, #0
_080C2DD2:
	ldr r1, [r5, #4]
	ands r1, r0
	mov r7, r8
	subs r3, r1, r7
	cmp r3, #0xf
	bgt _080C2E98
	cmp r3, #0
	bge _080C2EC0
	ldr r5, [r5, #0xc]
	cmp r5, r4
	bne _080C2DD2
_080C2DE8:
	adds r4, #8
	movs r0, #1
	add ip, r0
	mov r0, ip
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _080C2DC8
_080C2DF8:
	ldr r0, [sp, #4]
	ands r0, r1
	cmp r0, #0
	beq _080C2E38
	ldr r3, [sp, #4]
	subs r3, #1
	str r3, [sp, #4]
	subs r2, #8
	ldr r0, [r2, #8]
	cmp r0, r2
	beq _080C2DF8
_080C2E0E:
	lsls r6, r6, #1
	mov r4, sb
	ldr r1, [r4, #4]
	cmp r6, r1
	bhi _080C2E42
	cmp r6, #0
	beq _080C2E42
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _080C2DBA
_080C2E24:
	movs r7, #4
	add ip, r7
	lsls r6, r6, #1
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _080C2E24
	b _080C2DBA
	.align 2, 0
_080C2E34: .4byte 0x08CF6650
_080C2E38:
	mov r1, sb
	ldr r0, [r1, #4]
	bics r0, r6
	str r0, [r1, #4]
	b _080C2E0E
_080C2E42:
	ldr r2, _080C2E80 @ =0x08CF6650
	ldr r0, [r2, #8]
	ldr r0, [r0, #4]
	movs r4, #4
	rsbs r4, r4, #0
	ands r0, r4
	mov r7, r8
	subs r3, r0, r7
	cmp r0, r8
	blo _080C2E5A
	cmp r3, #0xf
	bgt _080C2ED4
_080C2E5A:
	ldr r0, [sp]
	mov r1, r8
	bl sub_080C29E8
	ldr r1, _080C2E80 @ =0x08CF6650
	ldr r0, [r1, #8]
	ldr r0, [r0, #4]
	ands r0, r4
	mov r2, r8
	subs r3, r0, r2
	cmp r0, r8
	blo _080C2E76
	cmp r3, #0xf
	bgt _080C2ED4
_080C2E76:
	ldr r0, [sp]
	bl sub_080C303C
	movs r0, #0
	b _080C2EF4
	.align 2, 0
_080C2E80: .4byte 0x08CF6650
_080C2E84:
	ldr r6, [r5, #0xc]
	ldr r4, [r5, #8]
	str r6, [r4, #0xc]
	str r4, [r6, #8]
	adds r2, r5, r1
	ldr r0, [r2, #4]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #4]
	b _080C2EEA
_080C2E98:
	mov r4, r8
	adds r2, r5, r4
	movs r1, #1
	orrs r4, r1
	str r4, [r5, #4]
	ldr r6, [r5, #0xc]
	ldr r4, [r5, #8]
	str r6, [r4, #0xc]
	str r4, [r6, #8]
	mov r7, sl
	str r2, [r7, #0xc]
	str r2, [r7, #8]
	str r7, [r2, #0xc]
	str r7, [r2, #8]
	adds r0, r3, #0
	orrs r0, r1
	str r0, [r2, #4]
	adds r0, r2, r3
	str r3, [r0]
	b _080C2EEA
_080C2EC0:
	adds r2, r5, r1
	ldr r0, [r2, #4]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #4]
	ldr r6, [r5, #0xc]
	ldr r4, [r5, #8]
	str r6, [r4, #0xc]
	str r4, [r6, #8]
	b _080C2EEA
_080C2ED4:
	ldr r2, _080C2F00 @ =0x08CF6650
	ldr r5, [r2, #8]
	movs r1, #1
	mov r0, r8
	orrs r0, r1
	str r0, [r5, #4]
	mov r4, r8
	adds r0, r5, r4
	str r0, [r2, #8]
	orrs r3, r1
	str r3, [r0, #4]
_080C2EEA:
	ldr r0, [sp]
	bl sub_080C303C
	adds r0, r5, #0
	adds r0, #8
_080C2EF4:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_080C2F00: .4byte 0x08CF6650

	thumb_func_start sub_080C2F04
sub_080C2F04: @ 0x080C2F04
	sub sp, #4
	cmp r1, #0
	bne _080C2F0C
	mov r1, sp
_080C2F0C:
	cmp r2, #0
	beq _080C2F28
	cmp r3, #0
	bne _080C2F1A
	movs r0, #1
	rsbs r0, r0, #0
	b _080C2F2A
_080C2F1A:
	ldrb r0, [r2]
	str r0, [r1]
	ldrb r0, [r2]
	cmp r0, #0
	beq _080C2F28
	movs r0, #1
	b _080C2F2A
_080C2F28:
	movs r0, #0
_080C2F2A:
	add sp, #4
	bx lr
	.align 2, 0

	thumb_func_start sub_080C2F30
sub_080C2F30: @ 0x080C2F30
	push {r4, r5, r6, r7, lr}
	adds r5, r1, #0
	adds r1, r0, #0
	movs r0, #0xff
	ands r5, r0
	cmp r2, #3
	bls _080C2FA4
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _080C2FA4
	adds r4, r1, #0
	movs r6, #0
	movs r1, #0
_080C2F4C:
	lsls r0, r6, #8
	adds r6, r0, r5
	adds r1, #1
	cmp r1, #3
	bls _080C2F4C
	cmp r2, #3
	bls _080C2F8A
	ldr r0, _080C2F90 @ =0xFEFEFEFF
	mov ip, r0
	ldr r7, _080C2F94 @ =0x80808080
_080C2F60:
	ldr r1, [r4]
	eors r1, r6
	mov r3, ip
	adds r0, r1, r3
	bics r0, r1
	ands r0, r7
	cmp r0, #0
	beq _080C2F82
	adds r1, r4, #0
	movs r3, #0
_080C2F74:
	ldrb r0, [r1]
	cmp r0, r5
	beq _080C2F9E
	adds r1, #1
	adds r3, #1
	cmp r3, #3
	bls _080C2F74
_080C2F82:
	subs r2, #4
	adds r4, #4
	cmp r2, #3
	bhi _080C2F60
_080C2F8A:
	adds r1, r4, #0
	b _080C2FA4
	.align 2, 0
_080C2F90: .4byte 0xFEFEFEFF
_080C2F94: .4byte 0x80808080
_080C2F98:
	ldrb r0, [r1]
	cmp r0, r5
	bne _080C2FA2
_080C2F9E:
	adds r0, r1, #0
	b _080C2FAE
_080C2FA2:
	adds r1, #1
_080C2FA4:
	adds r0, r2, #0
	subs r2, #1
	cmp r0, #0
	bne _080C2F98
	movs r0, #0
_080C2FAE:
	pop {r4, r5, r6, r7, pc}

	thumb_func_start sub_080C2FB0
sub_080C2FB0: @ 0x080C2FB0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r3, r1, #0
	cmp r3, r5
	bhs _080C2FE2
	adds r0, r3, r2
	cmp r5, r0
	bhs _080C2FE2
	adds r3, r0, #0
	adds r4, r5, r2
	subs r2, #1
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	beq _080C3034
	adds r1, r0, #0
_080C2FD2:
	subs r4, #1
	subs r3, #1
	ldrb r0, [r3]
	strb r0, [r4]
	subs r2, #1
	cmp r2, r1
	bne _080C2FD2
	b _080C3034
_080C2FE2:
	cmp r2, #0xf
	bls _080C301A
	adds r0, r3, #0
	orrs r0, r4
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _080C301A
	adds r1, r3, #0
_080C2FF4:
	ldm r1!, {r0}
	stm r4!, {r0}
	ldm r1!, {r0}
	stm r4!, {r0}
	ldm r1!, {r0}
	stm r4!, {r0}
	ldm r1!, {r0}
	stm r4!, {r0}
	subs r2, #0x10
	cmp r2, #0xf
	bhi _080C2FF4
	cmp r2, #3
	bls _080C3018
_080C300E:
	ldm r1!, {r0}
	stm r4!, {r0}
	subs r2, #4
	cmp r2, #3
	bhi _080C300E
_080C3018:
	adds r3, r1, #0
_080C301A:
	subs r2, #1
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	beq _080C3034
	adds r1, r0, #0
_080C3026:
	ldrb r0, [r3]
	strb r0, [r4]
	adds r3, #1
	adds r4, #1
	subs r2, #1
	cmp r2, r1
	bne _080C3026
_080C3034:
	adds r0, r5, #0
	pop {r4, r5, pc}

	thumb_func_start sub_080C3038
sub_080C3038: @ 0x080C3038
	bx lr
	.align 2, 0

	thumb_func_start sub_080C303C
sub_080C303C: @ 0x080C303C
	bx lr
	.align 2, 0

	thumb_func_start sub_080C3040
sub_080C3040: @ 0x080C3040
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	bne _080C305C
	adds r0, r4, #0
	movs r1, #4
	movs r2, #0x10
	bl sub_080C3F34
	str r0, [r4, #0x4c]
	cmp r0, #0
	beq _080C3084
_080C305C:
	ldr r1, [r4, #0x4c]
	lsls r0, r6, #2
	adds r2, r0, r1
	ldr r1, [r2]
	cmp r1, #0
	beq _080C306E
	ldr r0, [r1]
	str r0, [r2]
	b _080C308C
_080C306E:
	movs r5, #1
	lsls r5, r6
	lsls r2, r5, #2
	adds r2, #0x14
	adds r0, r4, #0
	movs r1, #1
	bl sub_080C3F34
	adds r1, r0, #0
	cmp r1, #0
	bne _080C3088
_080C3084:
	movs r0, #0
	b _080C3094
_080C3088:
	str r6, [r1, #4]
	str r5, [r1, #8]
_080C308C:
	movs r0, #0
	str r0, [r1, #0x10]
	str r0, [r1, #0xc]
	adds r0, r1, #0
_080C3094:
	pop {r4, r5, r6, pc}
	.align 2, 0

	thumb_func_start sub_080C3098
sub_080C3098: @ 0x080C3098
	adds r3, r0, #0
	adds r2, r1, #0
	cmp r2, #0
	beq _080C30AE
	ldr r0, [r2, #4]
	ldr r1, [r3, #0x4c]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	str r1, [r2]
	str r2, [r0]
_080C30AE:
	bx lr

	thumb_func_start sub_080C30B0
sub_080C30B0: @ 0x080C30B0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	adds r5, r1, #0
	adds r4, r2, #0
	mov r8, r3
	ldr r6, [r5, #0x10]
	adds r3, r5, #0
	adds r3, #0x14
	movs r7, #0
	ldr r0, _080C3144 @ =0x0000FFFF
	mov ip, r0
_080C30CC:
	ldr r1, [r3]
	adds r0, r1, #0
	mov r2, ip
	ands r0, r2
	adds r2, r0, #0
	muls r2, r4, r2
	add r2, r8
	lsrs r1, r1, #0x10
	adds r0, r1, #0
	muls r0, r4, r0
	lsrs r1, r2, #0x10
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	mov r8, r1
	lsls r0, r0, #0x10
	mov r1, ip
	ands r2, r1
	adds r0, r0, r2
	stm r3!, {r0}
	adds r7, #1
	cmp r7, r6
	blt _080C30CC
	mov r2, r8
	cmp r2, #0
	beq _080C313A
	ldr r0, [r5, #8]
	cmp r6, r0
	blt _080C312A
	ldr r1, [r5, #4]
	adds r1, #1
	mov r0, sb
	bl sub_080C3040
	adds r4, r0, #0
	adds r0, #0xc
	adds r1, r5, #0
	adds r1, #0xc
	ldr r2, [r5, #0x10]
	lsls r2, r2, #2
	adds r2, #8
	bl memcpy
	mov r0, sb
	adds r1, r5, #0
	bl sub_080C3098
	adds r5, r4, #0
_080C312A:
	lsls r1, r6, #2
	adds r0, r5, #0
	adds r0, #0x14
	adds r0, r0, r1
	mov r1, r8
	str r1, [r0]
	adds r6, #1
	str r6, [r5, #0x10]
_080C313A:
	adds r0, r5, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_080C3144: .4byte 0x0000FFFF
_080C3148:
	.byte 0xF0, 0xB5, 0x47, 0x46, 0x80, 0xB4, 0x07, 0x1C
	.byte 0x0C, 0x1C, 0x16, 0x1C, 0x98, 0x46, 0x40, 0x46, 0x08, 0x30, 0x09, 0x21, 0xFC, 0xF7, 0x94, 0xFD
	.byte 0x00, 0x21, 0x01, 0x22, 0x01, 0x28, 0x03, 0xDD, 0x52, 0x00, 0x01, 0x31, 0x90, 0x42, 0xFB, 0xDC
	.byte 0x38, 0x1C, 0xFF, 0xF7, 0x65, 0xFF, 0x01, 0x1C, 0x06, 0x98, 0x48, 0x61, 0x01, 0x20, 0x08, 0x61
	.byte 0x09, 0x25, 0x09, 0x2E, 0x0D, 0xDD, 0x09, 0x34, 0x23, 0x78, 0x30, 0x3B, 0x01, 0x34, 0x38, 0x1C
	.byte 0x0A, 0x22, 0xFF, 0xF7, 0x8D, 0xFF, 0x01, 0x1C, 0x01, 0x35, 0xB5, 0x42, 0xF4, 0xDB, 0x01, 0x34
	.byte 0x00, 0xE0, 0x0A, 0x34, 0x45, 0x45, 0x0C, 0xDA, 0x40, 0x46, 0x45, 0x1B, 0x23, 0x78, 0x30, 0x3B
	.byte 0x01, 0x34, 0x38, 0x1C, 0x0A, 0x22, 0xFF, 0xF7, 0x7B, 0xFF, 0x01, 0x1C, 0x01, 0x3D, 0x00, 0x2D
	.byte 0xF4, 0xD1, 0x08, 0x1C, 0x08, 0xBC, 0x98, 0x46, 0xF0, 0xBD, 0x00, 0x00

	thumb_func_start sub_080C31CC
sub_080C31CC: @ 0x080C31CC
	adds r1, r0, #0
	movs r2, #0
	ldr r0, _080C321C @ =0xFFFF0000
	ands r0, r1
	cmp r0, #0
	bne _080C31DC
	movs r2, #0x10
	lsls r1, r1, #0x10
_080C31DC:
	movs r0, #0xff
	lsls r0, r0, #0x18
	ands r0, r1
	cmp r0, #0
	bne _080C31EA
	adds r2, #8
	lsls r1, r1, #8
_080C31EA:
	movs r0, #0xf0
	lsls r0, r0, #0x18
	ands r0, r1
	cmp r0, #0
	bne _080C31F8
	adds r2, #4
	lsls r1, r1, #4
_080C31F8:
	movs r0, #0xc0
	lsls r0, r0, #0x18
	ands r0, r1
	cmp r0, #0
	bne _080C3206
	adds r2, #2
	lsls r1, r1, #2
_080C3206:
	cmp r1, #0
	blt _080C3220
	adds r2, #1
	movs r0, #0x80
	lsls r0, r0, #0x17
	ands r0, r1
	cmp r0, #0
	bne _080C3220
	movs r0, #0x20
	b _080C3222
	.align 2, 0
_080C321C: .4byte 0xFFFF0000
_080C3220:
	adds r0, r2, #0
_080C3222:
	bx lr

	thumb_func_start sub_080C3224
sub_080C3224: @ 0x080C3224
	adds r3, r0, #0
	ldr r1, [r3]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	beq _080C3254
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080C323C
	movs r0, #0
	b _080C32A4
_080C323C:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080C324C
	lsrs r0, r1, #1
	str r0, [r3]
	movs r0, #1
	b _080C32A4
_080C324C:
	lsrs r0, r1, #2
	str r0, [r3]
	movs r0, #2
	b _080C32A4
_080C3254:
	movs r2, #0
	ldr r0, _080C329C @ =0x0000FFFF
	ands r0, r1
	cmp r0, #0
	bne _080C3262
	movs r2, #0x10
	lsrs r1, r1, #0x10
_080C3262:
	movs r0, #0xff
	ands r0, r1
	cmp r0, #0
	bne _080C326E
	adds r2, #8
	lsrs r1, r1, #8
_080C326E:
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _080C327A
	adds r2, #4
	lsrs r1, r1, #4
_080C327A:
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _080C3286
	adds r2, #2
	lsrs r1, r1, #2
_080C3286:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080C32A0
	adds r2, #1
	lsrs r1, r1, #1
	cmp r1, #0
	bne _080C32A0
	movs r0, #0x20
	b _080C32A4
	.align 2, 0
_080C329C: .4byte 0x0000FFFF
_080C32A0:
	str r1, [r3]
	adds r0, r2, #0
_080C32A4:
	bx lr
	.align 2, 0

	thumb_func_start sub_080C32A8
sub_080C32A8: @ 0x080C32A8
	push {r4, lr}
	adds r4, r1, #0
	movs r1, #1
	bl sub_080C3040
	str r4, [r0, #0x14]
	movs r1, #1
	str r1, [r0, #0x10]
	pop {r4, pc}
	.align 2, 0

	thumb_func_start sub_080C32BC
sub_080C32BC: @ 0x080C32BC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	adds r3, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r1, [r4, #0x10]
	ldr r0, [r5, #0x10]
	cmp r1, r0
	bge _080C32DC
	str r4, [sp]
	adds r4, r5, #0
	ldr r5, [sp]
_080C32DC:
	ldr r1, [r4, #4]
	ldr r6, [r4, #0x10]
	ldr r0, [r5, #0x10]
	mov r8, r0
	mov r2, r8
	adds r2, r6, r2
	str r2, [sp, #4]
	ldr r0, [r4, #8]
	cmp r2, r0
	ble _080C32F2
	adds r1, #1
_080C32F2:
	adds r0, r3, #0
	bl sub_080C3040
	str r0, [sp]
	adds r7, r0, #0
	adds r7, #0x14
	ldr r1, [sp, #4]
	lsls r0, r1, #2
	adds r2, r7, r0
	str r2, [sp, #8]
	str r0, [sp, #0x18]
	adds r1, r4, #0
	adds r1, #0x14
	lsls r3, r6, #2
	adds r2, r5, #0
	adds r2, #0x14
	mov r5, r8
	lsls r4, r5, #2
	ldr r0, [sp, #8]
	cmp r7, r0
	bhs _080C3326
	movs r0, #0
_080C331E:
	stm r7!, {r0}
	ldr r5, [sp, #8]
	cmp r7, r5
	blo _080C331E
_080C3326:
	str r1, [sp, #8]
	adds r3, r1, r3
	str r3, [sp, #0xc]
	mov r8, r2
	add r4, r8
	str r4, [sp, #0x10]
	ldr r0, [sp]
	adds r0, #0x14
	mov sb, r0
	mov r1, sb
	str r1, [sp, #0x20]
	cmp r8, r4
	bhs _080C33EE
_080C3340:
	mov r2, r8
	ldm r2!, {r6}
	str r2, [sp, #0x14]
	ldr r0, _080C33FC @ =0x0000FFFF
	ands r6, r0
	mov r4, sb
	adds r4, #4
	str r4, [sp, #0x1c]
	cmp r6, #0
	beq _080C3398
	ldr r7, [sp, #8]
	mov r5, sb
	movs r1, #0
	mov ip, r1
	mov sl, r0
_080C335E:
	ldm r7!, {r3}
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	adds r1, r0, #0
	muls r1, r6, r1
	ldr r2, [r5]
	adds r0, r2, #0
	mov r4, sl
	ands r0, r4
	adds r1, r1, r0
	mov r0, ip
	adds r4, r1, r0
	lsrs r1, r4, #0x10
	lsrs r3, r3, #0x10
	adds r0, r3, #0
	muls r0, r6, r0
	lsrs r2, r2, #0x10
	adds r0, r0, r2
	adds r2, r0, r1
	lsrs r0, r2, #0x10
	mov ip, r0
	strh r2, [r5]
	strh r4, [r5, #2]
	adds r5, #4
	ldr r1, [sp, #0xc]
	cmp r7, r1
	blo _080C335E
	str r0, [r5]
_080C3398:
	mov r2, r8
	ldrh r6, [r2, #2]
	cmp r6, #0
	beq _080C33E0
	ldr r7, [sp, #8]
	mov r5, sb
	movs r4, #0
	mov ip, r4
	ldr r2, [r5]
	ldr r3, _080C33FC @ =0x0000FFFF
_080C33AC:
	ldm r7!, {r1}
	adds r0, r1, #0
	ands r0, r3
	muls r0, r6, r0
	ldrh r4, [r5, #2]
	adds r4, r4, r0
	mov r8, r4
	add r4, ip
	lsrs r0, r4, #0x10
	mov ip, r0
	strh r4, [r5]
	strh r2, [r5, #2]
	adds r5, #4
	lsrs r1, r1, #0x10
	muls r1, r6, r1
	ldr r0, [r5]
	ands r0, r3
	adds r1, r1, r0
	mov r4, ip
	adds r2, r1, r4
	lsrs r0, r2, #0x10
	mov ip, r0
	ldr r1, [sp, #0xc]
	cmp r7, r1
	blo _080C33AC
	str r2, [r5]
_080C33E0:
	ldr r2, [sp, #0x14]
	mov r8, r2
	ldr r4, [sp, #0x1c]
	mov sb, r4
	ldr r5, [sp, #0x10]
	cmp r8, r5
	blo _080C3340
_080C33EE:
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x18]
	adds r5, r0, r1
	ldr r2, [sp, #4]
	cmp r2, #0
	ble _080C3412
	b _080C340A
	.align 2, 0
_080C33FC: .4byte 0x0000FFFF
_080C3400:
	ldr r4, [sp, #4]
	subs r4, #1
	str r4, [sp, #4]
	cmp r4, #0
	ble _080C3412
_080C340A:
	subs r5, #4
	ldr r0, [r5]
	cmp r0, #0
	beq _080C3400
_080C3412:
	ldr r5, [sp, #4]
	ldr r0, [sp]
	str r5, [r0, #0x10]
	ldr r0, [sp]
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}
	.align 2, 0

	thumb_func_start sub_080C3428
sub_080C3428: @ 0x080C3428
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r7, r1, #0
	adds r6, r2, #0
	movs r1, #3
	ands r1, r6
	cmp r1, #0
	beq _080C3452
	ldr r0, _080C3474 @ =0x08B856AC
	subs r1, #1
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r2, [r1]
	mov r0, r8
	adds r1, r7, #0
	movs r3, #0
	bl sub_080C30B0
	adds r7, r0, #0
_080C3452:
	asrs r6, r6, #2
	cmp r6, #0
	beq _080C34B8
	mov r0, r8
	ldr r5, [r0, #0x48]
	adds r4, r5, #0
	cmp r5, #0
	bne _080C3494
	ldr r1, _080C3478 @ =0x00000271
	bl sub_080C32A8
	mov r1, r8
	str r0, [r1, #0x48]
	adds r5, r0, #0
	str r4, [r5]
	b _080C3494
	.align 2, 0
_080C3474: .4byte 0x08B856AC
_080C3478: .4byte 0x00000271
_080C347C:
	ldr r0, [r5]
	adds r4, r0, #0
	cmp r0, #0
	bne _080C3492
	mov r0, r8
	adds r1, r5, #0
	adds r2, r5, #0
	bl sub_080C32BC
	str r0, [r5]
	str r4, [r0]
_080C3492:
	adds r5, r0, #0
_080C3494:
	movs r0, #1
	ands r0, r6
	cmp r0, #0
	beq _080C34B2
	mov r0, r8
	adds r1, r7, #0
	adds r2, r5, #0
	bl sub_080C32BC
	adds r4, r0, #0
	mov r0, r8
	adds r1, r7, #0
	bl sub_080C3098
	adds r7, r4, #0
_080C34B2:
	asrs r6, r6, #1
	cmp r6, #0
	bne _080C347C
_080C34B8:
	adds r0, r7, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7, pc}

	thumb_func_start sub_080C34C0
sub_080C34C0: @ 0x080C34C0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sl, r0
	mov r8, r1
	adds r5, r2, #0
	asrs r6, r5, #5
	ldr r1, [r1, #4]
	mov r2, r8
	ldr r0, [r2, #0x10]
	adds r0, r6, r0
	adds r7, r0, #1
	ldr r2, [r2, #8]
	cmp r7, r2
	ble _080C34EA
_080C34E2:
	adds r1, #1
	lsls r2, r2, #1
	cmp r7, r2
	bgt _080C34E2
_080C34EA:
	mov r0, sl
	bl sub_080C3040
	mov sb, r0
	mov r4, sb
	adds r4, #0x14
	mov r0, r8
	adds r0, #0x14
	cmp r6, #0
	ble _080C350A
	movs r1, #0
	adds r2, r6, #0
_080C3502:
	stm r4!, {r1}
	subs r2, #1
	cmp r2, #0
	bne _080C3502
_080C350A:
	adds r3, r0, #0
	mov r1, r8
	ldr r0, [r1, #0x10]
	lsls r0, r0, #2
	adds r6, r3, r0
	movs r0, #0x1f
	ands r5, r0
	cmp r5, #0
	beq _080C353C
	movs r0, #0x20
	subs r1, r0, r5
	movs r2, #0
_080C3522:
	ldr r0, [r3]
	lsls r0, r5
	orrs r0, r2
	stm r4!, {r0}
	ldm r3!, {r2}
	lsrs r2, r1
	cmp r3, r6
	blo _080C3522
	str r2, [r4]
	cmp r2, #0
	beq _080C3544
	adds r7, #1
	b _080C3544
_080C353C:
	ldm r3!, {r0}
	stm r4!, {r0}
	cmp r3, r6
	blo _080C353C
_080C3544:
	subs r0, r7, #1
	mov r2, sb
	str r0, [r2, #0x10]
	mov r0, sl
	mov r1, r8
	bl sub_080C3098
	mov r0, sb
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}
	.align 2, 0

	thumb_func_start sub_080C3560
sub_080C3560: @ 0x080C3560
	push {r4, r5, lr}
	adds r2, r0, #0
	adds r5, r1, #0
	ldr r0, [r2, #0x10]
	ldr r1, [r5, #0x10]
	subs r0, r0, r1
	cmp r0, #0
	bne _080C359C
	adds r4, r2, #0
	adds r4, #0x14
	lsls r1, r1, #2
	adds r3, r4, r1
	adds r0, r5, #0
	adds r0, #0x14
	adds r1, r0, r1
_080C357E:
	subs r3, #4
	subs r1, #4
	ldr r0, [r3]
	ldr r2, [r1]
	cmp r0, r2
	beq _080C3596
	movs r1, #1
	cmp r0, r2
	bhs _080C3592
	subs r1, #2
_080C3592:
	adds r0, r1, #0
	b _080C359C
_080C3596:
	cmp r3, r4
	bhi _080C357E
	movs r0, #0
_080C359C:
	pop {r4, r5, pc}
	.align 2, 0

	thumb_func_start sub_080C35A0
sub_080C35A0: @ 0x080C35A0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	adds r5, r1, #0
	mov r8, r2
	adds r0, r5, #0
	mov r1, r8
	bl sub_080C3560
	adds r4, r0, #0
	cmp r4, #0
	bne _080C35D2
	adds r0, r6, #0
	movs r1, #0
	bl sub_080C3040
	adds r7, r0, #0
	movs r0, #1
	str r0, [r7, #0x10]
	str r4, [r7, #0x14]
	b _080C3682
_080C35D2:
	cmp r4, #0
	bge _080C35E0
	adds r7, r5, #0
	mov r5, r8
	mov r8, r7
	movs r4, #1
	b _080C35E2
_080C35E0:
	movs r4, #0
_080C35E2:
	ldr r1, [r5, #4]
	adds r0, r6, #0
	bl sub_080C3040
	adds r7, r0, #0
	str r4, [r7, #0xc]
	ldr r0, [r5, #0x10]
	mov sb, r0
	adds r6, r5, #0
	adds r6, #0x14
	lsls r0, r0, #2
	adds r0, r0, r6
	mov sl, r0
	mov r1, r8
	ldr r0, [r1, #0x10]
	movs r3, #0x14
	add r3, r8
	mov ip, r3
	lsls r0, r0, #2
	add r0, ip
	str r0, [sp]
	adds r4, r7, #0
	adds r4, #0x14
	movs r5, #0
	ldr r0, _080C366C @ =0x0000FFFF
	mov r8, r0
_080C3616:
	ldm r6!, {r1}
	str r1, [sp, #4]
	mov r3, r8
	ands r1, r3
	mov r0, ip
	adds r0, #4
	mov ip, r0
	subs r0, #4
	ldm r0!, {r2}
	adds r0, r2, #0
	ands r0, r3
	subs r1, r1, r0
	adds r0, r1, r5
	asrs r5, r0, #0x10
	ldr r1, [sp, #4]
	lsrs r3, r1, #0x10
	lsrs r2, r2, #0x10
	subs r3, r3, r2
	adds r1, r3, r5
	asrs r5, r1, #0x10
	strh r1, [r4]
	strh r0, [r4, #2]
	adds r4, #4
	ldr r3, [sp]
	cmp ip, r3
	blo _080C3616
	cmp r6, sl
	bhs _080C3676
	ldr r2, _080C366C @ =0x0000FFFF
_080C3650:
	ldm r6!, {r1}
	adds r0, r1, #0
	ands r0, r2
	adds r0, r0, r5
	asrs r5, r0, #0x10
	lsrs r1, r1, #0x10
	adds r1, r1, r5
	asrs r5, r1, #0x10
	strh r1, [r4]
	strh r0, [r4, #2]
	adds r4, #4
	cmp r6, sl
	blo _080C3650
	b _080C3676
	.align 2, 0
_080C366C: .4byte 0x0000FFFF
_080C3670:
	movs r0, #1
	rsbs r0, r0, #0
	add sb, r0
_080C3676:
	subs r4, #4
	ldr r0, [r4]
	cmp r0, #0
	beq _080C3670
	mov r1, sb
	str r1, [r7, #0x10]
_080C3682:
	adds r0, r7, #0
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}
_080C3690:
	.byte 0x10, 0xB5, 0x04, 0x4A, 0x02, 0x40, 0x04, 0x48, 0x12, 0x18, 0x00, 0x2A, 0x06, 0xDD, 0x13, 0x1C
	.byte 0x00, 0x24, 0x18, 0xE0, 0x00, 0x00, 0xF0, 0x7F, 0x00, 0x00, 0xC0, 0xFC, 0x50, 0x42, 0x02, 0x15
	.byte 0x13, 0x2A, 0x05, 0xDC, 0x80, 0x20, 0x00, 0x03, 0x03, 0x1C, 0x13, 0x41, 0x00, 0x24, 0x0A, 0xE0
	.byte 0x00, 0x23, 0x14, 0x3A, 0x1E, 0x2A, 0x04, 0xDC, 0x1F, 0x20, 0x80, 0x1A, 0x01, 0x21, 0x81, 0x40
	.byte 0x00, 0xE0, 0x01, 0x21, 0x0C, 0x1C, 0x21, 0x1C, 0x18, 0x1C, 0x10, 0xBD, 0xF0, 0xB5, 0x47, 0x46
	.byte 0x80, 0xB4, 0x81, 0xB0, 0x0C, 0x1C, 0x14, 0x21, 0x09, 0x18, 0x88, 0x46, 0x00, 0x69, 0x80, 0x00
	.byte 0x0D, 0x18, 0x04, 0x3D, 0x2A, 0x68, 0x10, 0x1C, 0x00, 0x92, 0xFF, 0xF7, 0x67, 0xFD, 0x03, 0x1C
	.byte 0x20, 0x20, 0xC0, 0x1A, 0x20, 0x60, 0x00, 0x9A, 0x0A, 0x2B, 0x17, 0xDC, 0x0B, 0x20, 0xC0, 0x1A
	.byte 0x11, 0x1C, 0xC1, 0x40, 0x03, 0x48, 0x0E, 0x1C, 0x06, 0x43, 0x45, 0x45, 0x04, 0xD9, 0x04, 0x3D
	.byte 0x29, 0x68, 0x02, 0xE0, 0x00, 0x00, 0xF0, 0x3F, 0x00, 0x21, 0x18, 0x1C, 0x15, 0x30, 0x82, 0x40
	.byte 0x0B, 0x20, 0xC0, 0x1A, 0xC1, 0x40, 0x17, 0x1C, 0x0F, 0x43, 0x25, 0xE0, 0x45, 0x45, 0x02, 0xD9
	.byte 0x04, 0x3D, 0x2C, 0x68, 0x00, 0xE0, 0x00, 0x24, 0x0B, 0x3B, 0x00, 0x2B, 0x18, 0xD0, 0x9A, 0x40
	.byte 0x20, 0x20, 0xC0, 0x1A, 0x21, 0x1C, 0xC1, 0x40, 0x04, 0x48, 0x01, 0x43, 0x16, 0x1C, 0x0E, 0x43
	.byte 0x45, 0x45, 0x05, 0xD9, 0x04, 0x3D, 0x2A, 0x68, 0x03, 0xE0, 0x00, 0x00, 0x00, 0x00, 0xF0, 0x3F
	.byte 0x00, 0x22, 0x9C, 0x40, 0x20, 0x20, 0xC0, 0x1A, 0xC2, 0x40, 0x27, 0x1C, 0x17, 0x43, 0x03, 0xE0
	.byte 0x04, 0x48, 0x16, 0x1C, 0x06, 0x43, 0x27, 0x1C, 0x39, 0x1C, 0x30, 0x1C, 0x01, 0xB0, 0x08, 0xBC
	.byte 0x98, 0x46, 0xF0, 0xBD, 0x00, 0x00, 0xF0, 0x3F

	thumb_func_start sub_080C3798
sub_080C3798: @ 0x080C3798
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sb, r3
	ldr r3, [sp, #0x28]
	mov sl, r3
	adds r5, r2, #0
	adds r4, r1, #0
	movs r1, #1
	bl sub_080C3040
	adds r6, r0, #0
	movs r0, #0x14
	adds r0, r0, r6
	mov r8, r0
	ldr r2, _080C3800 @ =0x000FFFFF
	adds r1, r4, #0
	ands r2, r1
	str r2, [sp, #4]
	ldr r0, _080C3804 @ =0x7FFFFFFF
	ands r4, r0
	lsrs r7, r4, #0x14
	cmp r7, #0
	beq _080C37D6
	movs r0, #0x80
	lsls r0, r0, #0xd
	orrs r0, r2
	str r0, [sp, #4]
_080C37D6:
	str r5, [sp]
	cmp r5, #0
	beq _080C3820
	mov r0, sp
	bl sub_080C3224
	adds r2, r0, #0
	cmp r2, #0
	beq _080C3808
	movs r0, #0x20
	subs r0, r0, r2
	ldr r1, [sp, #4]
	lsls r1, r0
	ldr r0, [sp]
	orrs r0, r1
	str r0, [r6, #0x14]
	ldr r0, [sp, #4]
	lsrs r0, r2
	str r0, [sp, #4]
	b _080C380C
	.align 2, 0
_080C3800: .4byte 0x000FFFFF
_080C3804: .4byte 0x7FFFFFFF
_080C3808:
	ldr r0, [sp]
	str r0, [r6, #0x14]
_080C380C:
	ldr r0, [sp, #4]
	mov r1, r8
	str r0, [r1, #4]
	movs r1, #1
	cmp r0, #0
	beq _080C381A
	movs r1, #2
_080C381A:
	str r1, [r6, #0x10]
	adds r4, r1, #0
	b _080C3834
_080C3820:
	add r0, sp, #4
	bl sub_080C3224
	adds r2, r0, #0
	ldr r0, [sp, #4]
	str r0, [r6, #0x14]
	movs r0, #1
	str r0, [r6, #0x10]
	movs r4, #1
	adds r2, #0x20
_080C3834:
	cmp r7, #0
	beq _080C3850
	ldr r3, _080C384C @ =0xFFFFFBCD
	adds r0, r2, r3
	adds r0, r7, r0
	mov r1, sb
	str r0, [r1]
	movs r0, #0x35
	subs r0, r0, r2
	mov r3, sl
	str r0, [r3]
	b _080C386C
	.align 2, 0
_080C384C: .4byte 0xFFFFFBCD
_080C3850:
	ldr r1, _080C387C @ =0xFFFFFBCE
	adds r0, r2, r1
	mov r3, sb
	str r0, [r3]
	lsls r0, r4, #2
	add r0, r8
	subs r0, #4
	ldr r0, [r0]
	bl sub_080C31CC
	lsls r1, r4, #5
	subs r1, r1, r0
	mov r0, sl
	str r1, [r0]
_080C386C:
	adds r0, r6, #0
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_080C387C: .4byte 0xFFFFFBCE
_080C3880:
	.byte 0xF0, 0xB5, 0x84, 0xB0, 0x04, 0x1C, 0x0D, 0x1C, 0x69, 0x46, 0xFF, 0xF7, 0x27, 0xFF, 0x02, 0x90
	.byte 0x03, 0x91, 0x01, 0xA9, 0x28, 0x1C, 0xFF, 0xF7, 0x21, 0xFF, 0x0F, 0x1C, 0x06, 0x1C, 0x00, 0x9A
	.byte 0x01, 0x98, 0x12, 0x1A, 0x20, 0x69, 0x29, 0x69, 0x40, 0x1A, 0x40, 0x01, 0x10, 0x18, 0x00, 0x28
	.byte 0x04, 0xDD, 0x00, 0x05, 0x02, 0x99, 0x08, 0x18, 0x02, 0x90, 0x01, 0xE0, 0x00, 0x05, 0x36, 0x1A
	.byte 0x02, 0x98, 0x03, 0x99, 0x3B, 0x1C, 0x32, 0x1C, 0x00, 0xF0, 0xA4, 0xFF, 0x04, 0xB0, 0xF0, 0xBD
	.byte 0x10, 0xB5, 0x04, 0x1C, 0x05, 0x49, 0x04, 0x48, 0x17, 0x2C, 0x0B, 0xDC, 0x04, 0x48, 0xE1, 0x00
	.byte 0x09, 0x18, 0x08, 0x68, 0x49, 0x68, 0x0E, 0xE0, 0x00, 0x00, 0xF0, 0x3F, 0x00, 0x00, 0x00, 0x00
	.byte 0xB8, 0x56, 0xB8, 0x08, 0x00, 0x2C, 0x06, 0xDD, 0x04, 0x4B, 0x03, 0x4A, 0x00, 0xF0, 0x36, 0xFE
	.byte 0x01, 0x3C, 0x00, 0x2C, 0xF8, 0xDC, 0x10, 0xBD, 0x00, 0x00, 0x24, 0x40, 0x00, 0x00, 0x00, 0x00

	thumb_func_start sub_080C3910
sub_080C3910: @ 0x080C3910
	ldr r3, _080C392C @ =0x7FFFFFFF
	ands r3, r0
	rsbs r2, r1, #0
	orrs r2, r1
	lsrs r2, r2, #0x1f
	orrs r3, r2
	ldr r0, _080C3930 @ =0x7FF00000
	subs r3, r0, r3
	rsbs r0, r3, #0
	orrs r3, r0
	lsrs r3, r3, #0x1f
	movs r0, #1
	subs r0, r0, r3
	bx lr
	.align 2, 0
_080C392C: .4byte 0x7FFFFFFF
_080C3930: .4byte 0x7FF00000

	thumb_func_start sub_080C3934
sub_080C3934: @ 0x080C3934
	ldr r3, _080C394C @ =0x7FFFFFFF
	ands r3, r0
	rsbs r2, r1, #0
	orrs r2, r1
	lsrs r2, r2, #0x1f
	orrs r3, r2
	ldr r0, _080C3950 @ =0x7FF00000
	subs r3, r0, r3
	lsrs r3, r3, #0x1f
	adds r0, r3, #0
	bx lr
	.align 2, 0
_080C394C: .4byte 0x7FFFFFFF
_080C3950: .4byte 0x7FF00000

	thumb_func_start sub_080C3954
sub_080C3954: @ 0x080C3954
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, r1, #0
	ldr r4, _080C397C @ =0x03005E78
	movs r1, #0
	str r1, [r4]
	bl sub_080C3E60
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080C3976
	ldr r0, [r4]
	cmp r0, #0
	beq _080C3976
	str r0, [r5]
_080C3976:
	adds r0, r1, #0
	pop {r4, r5, pc}
	.align 2, 0
_080C397C: .4byte 0x03005E78
_080C3980:
	.byte 0x30, 0xB5, 0x05, 0x1C, 0x0C, 0x1C, 0x13, 0x1C, 0x68, 0x6D, 0x0E, 0x22, 0xA9, 0x5E, 0x22, 0x1C
	.byte 0x00, 0xF0, 0x5A, 0xFB, 0x01, 0x1C, 0x00, 0x29, 0x03, 0xDB, 0x28, 0x6D, 0x40, 0x18, 0x28, 0x65
	.byte 0x03, 0xE0, 0x03, 0x48, 0xAA, 0x89, 0x10, 0x40, 0xA8, 0x81, 0x08, 0x1C, 0x30, 0xBD, 0x00, 0x00
	.byte 0xFF, 0xEF, 0xFF, 0xFF, 0x70, 0xB5, 0x04, 0x1C, 0x0D, 0x1C, 0x16, 0x1C, 0x80, 0x20, 0x40, 0x00
	.byte 0xA1, 0x89, 0x08, 0x40, 0x00, 0x28, 0x06, 0xD0, 0x60, 0x6D, 0x0E, 0x22, 0xA1, 0x5E, 0x00, 0x22
	.byte 0x02, 0x23, 0x00, 0xF0, 0x21, 0xFB, 0x06, 0x48, 0xA1, 0x89, 0x08, 0x40, 0xA0, 0x81, 0x60, 0x6D
	.byte 0x0E, 0x22, 0xA1, 0x5E, 0x2A, 0x1C, 0x33, 0x1C, 0x00, 0xF0, 0x8C, 0xFA, 0x70, 0xBD, 0x00, 0x00
	.byte 0xFF, 0xEF, 0xFF, 0xFF, 0x30, 0xB5, 0x05, 0x1C, 0x0C, 0x1C, 0x13, 0x1C, 0x68, 0x6D, 0x0E, 0x22
	.byte 0xA9, 0x5E, 0x22, 0x1C, 0x00, 0xF0, 0x08, 0xFB, 0x01, 0x1C, 0x01, 0x20, 0x40, 0x42, 0x81, 0x42
	.byte 0x06, 0xD1, 0x02, 0x48, 0xAA, 0x89, 0x10, 0x40, 0xA8, 0x81, 0x08, 0xE0, 0xFF, 0xEF, 0xFF, 0xFF
	.byte 0x80, 0x22, 0x52, 0x01, 0x10, 0x1C, 0xAA, 0x89, 0x10, 0x43, 0xA8, 0x81, 0x29, 0x65, 0x08, 0x1C
	.byte 0x30, 0xBD, 0x00, 0x00, 0x00, 0xB5, 0x42, 0x6D, 0x0E, 0x23, 0xC1, 0x5E, 0x10, 0x1C, 0x00, 0xF0
	.byte 0xA5, 0xFA, 0x00, 0xBD, 0x30, 0xB5, 0x02, 0x1C, 0x0B, 0x1C, 0x18, 0x43, 0x03, 0x21, 0x08, 0x40
	.byte 0x00, 0x28, 0x1A, 0xD1, 0x11, 0x68, 0x18, 0x68, 0x81, 0x42, 0x16, 0xD1, 0x04, 0x4D, 0x05, 0x4C
	.byte 0x11, 0x68, 0x48, 0x19, 0x88, 0x43, 0x20, 0x40, 0x00, 0x28, 0x05, 0xD0, 0x00, 0x20, 0x15, 0xE0
	.byte 0xFF, 0xFE, 0xFE, 0xFE, 0x80, 0x80, 0x80, 0x80, 0x04, 0x32, 0x04, 0x33, 0x11, 0x68, 0x18, 0x68
	.byte 0x81, 0x42, 0xED, 0xD0, 0x01, 0xE0, 0x01, 0x32, 0x01, 0x33, 0x10, 0x78, 0x00, 0x28, 0x02, 0xD0
	.byte 0x19, 0x78, 0x88, 0x42, 0xF7, 0xD0, 0x12, 0x78, 0x1B, 0x78, 0xD0, 0x1A, 0x30, 0xBD, 0x00, 0x00

	thumb_func_start sub_080C3AA0
sub_080C3AA0: @ 0x080C3AA0
	adds r3, r0, #0
	movs r1, #0
	ldr r2, _080C3AA8 @ =0x03002388
	b _080C3AB4
	.align 2, 0
_080C3AA8: .4byte 0x03002388
_080C3AAC:
	adds r2, #8
	adds r1, #1
	cmp r1, #0x13
	bgt _080C3ABA
_080C3AB4:
	ldr r0, [r2]
	cmp r0, r3
	bne _080C3AAC
_080C3ABA:
	adds r0, r1, #0
	bx lr
	.align 2, 0

	thumb_func_start sub_080C3AC0
sub_080C3AC0: @ 0x080C3AC0
	adds r2, r0, #0
	ldr r0, _080C3AD4 @ =0x08CF6638
	ldr r1, [r0]
	ldr r0, [r1, #4]
	movs r3, #0xe
	ldrsh r0, [r0, r3]
	cmp r2, r0
	bne _080C3ADC
	ldr r0, _080C3AD8 @ =0x0300237C
	b _080C3B02
	.align 2, 0
_080C3AD4: .4byte 0x08CF6638
_080C3AD8: .4byte 0x0300237C
_080C3ADC:
	ldr r0, [r1, #8]
	movs r3, #0xe
	ldrsh r0, [r0, r3]
	cmp r2, r0
	bne _080C3AF0
	ldr r0, _080C3AEC @ =0x03002380
	b _080C3B02
	.align 2, 0
_080C3AEC: .4byte 0x03002380
_080C3AF0:
	ldr r0, [r1, #0xc]
	movs r1, #0xe
	ldrsh r0, [r0, r1]
	cmp r2, r0
	beq _080C3B00
	adds r0, r2, #0
	subs r0, #0x20
	b _080C3B04
_080C3B00:
	ldr r0, _080C3B08 @ =0x03002384
_080C3B02:
	ldr r0, [r0]
_080C3B04:
	bx lr
	.align 2, 0
_080C3B08: .4byte 0x03002384
_080C3B0C:
	.byte 0x30, 0xB5, 0x83, 0xB0
	.byte 0x15, 0x4C, 0x00, 0x94, 0x03, 0x23, 0x02, 0x93, 0x00, 0x20, 0x01, 0x90, 0x01, 0x25, 0x28, 0x1C
	.byte 0x69, 0x46, 0xAB, 0xDF, 0x02, 0x1C, 0x11, 0x4D, 0x2A, 0x60, 0x00, 0x94, 0x02, 0x93, 0x04, 0x20
	.byte 0x01, 0x90, 0x0F, 0x4B, 0x01, 0x24, 0x20, 0x1C, 0x69, 0x46, 0xAB, 0xDF, 0x02, 0x1C, 0x0D, 0x48
	.byte 0x02, 0x60, 0x1A, 0x60, 0x0C, 0x4A, 0x11, 0x1C, 0x02, 0x3C, 0x10, 0x1C, 0x98, 0x30, 0x04, 0x60
	.byte 0x08, 0x38, 0x88, 0x42, 0xFB, 0xDA, 0x00, 0x20, 0x29, 0x68, 0x11, 0x60, 0x50, 0x60, 0x19, 0x68
	.byte 0x91, 0x60, 0xD0, 0x60, 0x03, 0xB0, 0x30, 0xBD, 0xD0, 0x57, 0xB8, 0x08, 0x7C, 0x23, 0x00, 0x03
	.byte 0x80, 0x23, 0x00, 0x03, 0x84, 0x23, 0x00, 0x03, 0x88, 0x23, 0x00, 0x03

	thumb_func_start sub_080C3B7C
sub_080C3B7C: @ 0x080C3B7C
	push {r4, lr}
	movs r3, #0x13
	movs r4, #0
	adds r0, r3, #0
	adds r1, r4, #0
	svc #0xab
	adds r2, r0, #0
	adds r0, r2, #0
	pop {r4, pc}
	.align 2, 0

	thumb_func_start sub_080C3B90
sub_080C3B90: @ 0x080C3B90
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_080C3FB8
	adds r4, r0, #0
	bl sub_080C3B7C
	str r0, [r4]
	adds r0, r5, #0
	pop {r4, r5, pc}
_080C3BA4:
	.byte 0x00, 0xB5, 0x01, 0x1C, 0x01, 0x20, 0x40, 0x42, 0x81, 0x42, 0x01, 0xD0
	.byte 0x08, 0x1C, 0x02, 0xE0, 0x08, 0x1C, 0xFF, 0xF7, 0xEB, 0xFF, 0x00, 0xBD, 0x30, 0xB5, 0x83, 0xB0
	.byte 0x0C, 0x1C, 0x15, 0x1C, 0xFF, 0xF7, 0x7C, 0xFF, 0x00, 0x90, 0x01, 0x94, 0x02, 0x95, 0x06, 0x23
	.byte 0x18, 0x1C, 0x69, 0x46, 0xAB, 0xDF, 0x02, 0x1C, 0x10, 0x1C, 0x03, 0xB0, 0x30, 0xBD, 0x00, 0x00
	.byte 0xF0, 0xB5, 0x04, 0x1C, 0x0D, 0x1C, 0x17, 0x1C, 0xFF, 0xF7, 0x6A, 0xFF, 0xFF, 0xF7, 0x58, 0xFF
	.byte 0x06, 0x1C, 0x20, 0x1C, 0x29, 0x1C, 0x3A, 0x1C, 0xFF, 0xF7, 0xE0, 0xFF, 0x00, 0x28, 0x04, 0xDA
	.byte 0x01, 0x20, 0x40, 0x42, 0xFF, 0xF7, 0xC4, 0xFF, 0x0A, 0xE0, 0x3A, 0x1A, 0x14, 0x2E, 0x06, 0xD0
	.byte 0x04, 0x48, 0xF1, 0x00, 0x04, 0x30, 0x09, 0x18, 0x08, 0x68, 0x80, 0x18, 0x08, 0x60, 0x10, 0x1C
	.byte 0xF0, 0xBD, 0x00, 0x00, 0x88, 0x23, 0x00, 0x03, 0xF0, 0xB5, 0x47, 0x46, 0x80, 0xB4, 0x82, 0xB0
	.byte 0x80, 0x46, 0x0D, 0x1C, 0x14, 0x1C, 0xFF, 0xF7, 0x43, 0xFF, 0x07, 0x1C, 0xFF, 0xF7, 0x30, 0xFF
	.byte 0x06, 0x1C, 0x01, 0x2C, 0x0B, 0xD1, 0x14, 0x2E, 0x02, 0xD1, 0x01, 0x20, 0x40, 0x42, 0x27, 0xE0
	.byte 0x15, 0x48, 0xF1, 0x00, 0x04, 0x30, 0x09, 0x18, 0x08, 0x68, 0x2D, 0x18, 0x00, 0x24, 0x02, 0x2C
	.byte 0x06, 0xD1, 0x00, 0x97, 0x0C, 0x23, 0x18, 0x1C, 0x69, 0x46, 0xAB, 0xDF, 0x02, 0x1C, 0xAD, 0x18
	.byte 0x40, 0x46, 0xFF, 0xF7, 0x25, 0xFF, 0x00, 0x90, 0x01, 0x95, 0x0A, 0x23, 0x18, 0x1C, 0x69, 0x46
	.byte 0xAB, 0xDF, 0x02, 0x1C, 0x14, 0x2E, 0x06, 0xD0, 0x00, 0x2A, 0x04, 0xD1, 0x06, 0x48, 0xF1, 0x00
	.byte 0x04, 0x30, 0x09, 0x18, 0x0D, 0x60, 0x01, 0x20, 0x40, 0x42, 0x00, 0x2A, 0x00, 0xD1, 0x28, 0x1C
	.byte 0x02, 0xB0, 0x08, 0xBC, 0x98, 0x46, 0xF0, 0xBD, 0x88, 0x23, 0x00, 0x03, 0x00, 0xB5, 0xFF, 0xF7
	.byte 0xBB, 0xFF, 0xFF, 0xF7, 0x77, 0xFF, 0x00, 0xBD

	thumb_func_start sub_080C3CB8
sub_080C3CB8: @ 0x080C3CB8
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r1, #0
	adds r5, r2, #0
	bl sub_080C3AC0
	str r0, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r3, #5
	adds r0, r3, #0
	mov r1, sp
	svc #0xab
	adds r2, r0, #0
	adds r0, r2, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0

	thumb_func_start sub_080C3CDC
sub_080C3CDC: @ 0x080C3CDC
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl sub_080C3AC0
	bl sub_080C3AA0
	adds r7, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_080C3CB8
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080C3D04
	cmp r0, r6
	bne _080C3D0C
_080C3D04:
	adds r0, r1, #0
	bl sub_080C3B90
	b _080C3D22
_080C3D0C:
	subs r2, r6, r0
	cmp r7, #0x14
	beq _080C3D20
	ldr r0, _080C3D24 @ =0x03002388
	lsls r1, r7, #3
	adds r0, #4
	adds r1, r1, r0
	ldr r0, [r1]
	adds r0, r0, r2
	str r0, [r1]
_080C3D20:
	adds r0, r2, #0
_080C3D22:
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_080C3D24: .4byte 0x03002388
_080C3D28:
	.byte 0xF0, 0xB5, 0x47, 0x46, 0x80, 0xB4, 0x83, 0xB0
	.byte 0x07, 0x1C, 0x0C, 0x1C, 0x00, 0x25, 0x01, 0x26, 0x76, 0x42, 0x30, 0x1C, 0xFF, 0xF7, 0xB0, 0xFE
	.byte 0x80, 0x46, 0x14, 0x28, 0x01, 0xD1, 0x30, 0x1C, 0x39, 0xE0, 0x02, 0x20, 0x20, 0x40, 0x00, 0x28
	.byte 0x00, 0xD0, 0x02, 0x25, 0x80, 0x20, 0x80, 0x00, 0x20, 0x40, 0x00, 0x28, 0x01, 0xD0, 0x04, 0x20
	.byte 0x05, 0x43, 0x80, 0x20, 0xC0, 0x00, 0x20, 0x40, 0x00, 0x28, 0x01, 0xD0, 0x04, 0x20, 0x05, 0x43
	.byte 0x08, 0x21, 0x0C, 0x40, 0x00, 0x2C, 0x03, 0xD0, 0x05, 0x20, 0x40, 0x42, 0x05, 0x40, 0x0D, 0x43
	.byte 0x00, 0x97, 0x38, 0x1C, 0xFC, 0xF7, 0xC6, 0xF9, 0x02, 0x90, 0x01, 0x95, 0x01, 0x22, 0x10, 0x1C
	.byte 0x69, 0x46, 0xAB, 0xDF, 0x03, 0x1C, 0x00, 0x2B, 0x0E, 0xDB, 0x06, 0x48, 0x41, 0x46, 0xCA, 0x00
	.byte 0x11, 0x18, 0x0B, 0x60, 0x04, 0x30, 0x12, 0x18, 0x00, 0x20, 0x10, 0x60, 0x18, 0x1C, 0x20, 0x30
	.byte 0x05, 0xE0, 0x00, 0x00, 0x88, 0x23, 0x00, 0x03, 0x18, 0x1C, 0xFF, 0xF7, 0xE9, 0xFE, 0x03, 0xB0
	.byte 0x08, 0xBC, 0x98, 0x46, 0xF0, 0xBD, 0x00, 0x00, 0x0E, 0xB4, 0x00, 0xB5, 0x01, 0x99, 0xFF, 0xF7
	.byte 0xAB, 0xFF, 0xFF, 0xF7, 0xE7, 0xFE, 0x08, 0xBC, 0x03, 0xB0, 0x18, 0x47, 0x00, 0xB5, 0x81, 0xB0
	.byte 0xFF, 0xF7, 0x6E, 0xFE, 0x00, 0x90, 0xFF, 0xF7, 0x5B, 0xFE, 0x01, 0x1C, 0x14, 0x29, 0x05, 0xD0
	.byte 0x06, 0x48, 0xC9, 0x00, 0x09, 0x18, 0x01, 0x20, 0x40, 0x42, 0x08, 0x60, 0x02, 0x23, 0x18, 0x1C
	.byte 0x69, 0x46, 0xAB, 0xDF, 0x02, 0x1C, 0x10, 0x1C, 0x01, 0xB0, 0x00, 0xBD, 0x88, 0x23, 0x00, 0x03
	.byte 0x00, 0xB5, 0xFF, 0xF7, 0xE3, 0xFF, 0xFF, 0xF7, 0xC5, 0xFE, 0x00, 0xBD, 0x9C, 0x46, 0x43, 0x46
	.byte 0x08, 0xB4, 0x63, 0x46, 0x18, 0x22, 0x04, 0x4B, 0x10, 0x1C, 0x19, 0x1C, 0xAB, 0xDF, 0x80, 0x46
	.byte 0x08, 0xBC, 0x98, 0x46, 0x70, 0x47, 0x00, 0x00, 0x26, 0x00, 0x02, 0x00, 0x9C, 0x46, 0x43, 0x46
	.byte 0x08, 0xB4, 0x63, 0x46, 0x18, 0x22, 0x04, 0x4B, 0x10, 0x1C, 0x19, 0x1C, 0xAB, 0xDF, 0x80, 0x46
	.byte 0x08, 0xBC, 0x98, 0x46, 0x70, 0x47, 0x00, 0x00, 0x26, 0x00, 0x02, 0x00, 0x01, 0x20, 0x70, 0x47

	thumb_func_start sub_080C3E60
sub_080C3E60: @ 0x080C3E60
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _080C3E90 @ =0x03002378
	ldr r0, [r4]
	cmp r0, #0
	bne _080C3E70
	ldr r0, _080C3E94 @ =0x0203EEA8
	str r0, [r4]
_080C3E70:
	ldr r5, [r4]
	adds r0, r5, r6
	cmp r0, sp
	bls _080C3E86
	ldr r1, _080C3E98 @ =0x08B857D4
	movs r0, #1
	movs r2, #0x20
	bl sub_080C3CDC
	bl sub_080C3FF0
_080C3E86:
	ldr r0, [r4]
	adds r0, r0, r6
	str r0, [r4]
	adds r0, r5, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
_080C3E90: .4byte 0x03002378
_080C3E94: .4byte 0x0203EEA8
_080C3E98: .4byte 0x08B857D4

	thumb_func_start sub_080C3E9C
sub_080C3E9C: @ 0x080C3E9C
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r1, #4]
	movs r0, #0
	bx lr
	.align 2, 0
_080C3EA8:
	.byte 0x01, 0x20, 0x40, 0x42, 0x70, 0x47, 0x00, 0x00
	.byte 0x70, 0x47, 0x00, 0x00, 0x30, 0xB5, 0x02, 0x1C, 0x0B, 0x1C, 0x00, 0x2A, 0x09, 0xD0, 0x11, 0x24
	.byte 0x00, 0x25, 0x20, 0x1C, 0x29, 0x1C, 0xAB, 0xDF, 0x05, 0x1C, 0x2C, 0x1C, 0x14, 0x60, 0x00, 0x20
	.byte 0x50, 0x60, 0x00, 0x2B, 0x02, 0xD0, 0x00, 0x20, 0x18, 0x60, 0x58, 0x60, 0x00, 0x20, 0x30, 0xBD
	.byte 0x30, 0xB5, 0x02, 0x1C, 0x10, 0x24, 0x00, 0x25, 0x20, 0x1C, 0x29, 0x1C, 0xAB, 0xDF, 0x03, 0x1C
	.byte 0x00, 0x2A, 0x04, 0xD0, 0x13, 0x60, 0x00, 0x20, 0x50, 0x60, 0x90, 0x60, 0xD0, 0x60, 0x18, 0x1C
	.byte 0x30, 0xBD, 0x00, 0x00, 0x30, 0xB5, 0x05, 0x1C, 0x08, 0x1C, 0x11, 0x1C, 0x1A, 0x1C, 0x08, 0x4C
	.byte 0x00, 0x23, 0x23, 0x60, 0xFF, 0xF7, 0xE2, 0xFE, 0x01, 0x1C, 0x01, 0x20, 0x40, 0x42, 0x81, 0x42
	.byte 0x03, 0xD1, 0x20, 0x68, 0x00, 0x28, 0x00, 0xD0, 0x28, 0x60, 0x08, 0x1C, 0x30, 0xBD, 0x00, 0x00
	.byte 0x78, 0x5E, 0x00, 0x03

	thumb_func_start sub_080C3F34
sub_080C3F34: @ 0x080C3F34
	push {r4, lr}
	muls r1, r2, r1
	bl sub_080C2B44
	adds r4, r0, #0
	cmp r4, #0
	bne _080C3F46
	movs r0, #0
	b _080C3F8A
_080C3F46:
	adds r0, r4, #0
	subs r0, #8
	ldr r0, [r0, #4]
	movs r1, #4
	rsbs r1, r1, #0
	ands r0, r1
	subs r2, r0, #4
	cmp r2, #0x24
	bhi _080C3F80
	adds r1, r4, #0
	cmp r2, #0x13
	bls _080C3F76
	movs r0, #0
	stm r1!, {r0}
	str r0, [r4, #4]
	adds r1, #4
	cmp r2, #0x1b
	bls _080C3F76
	stm r1!, {r0}
	stm r1!, {r0}
	cmp r2, #0x23
	bls _080C3F76
	stm r1!, {r0}
	stm r1!, {r0}
_080C3F76:
	movs r0, #0
	stm r1!, {r0}
	stm r1!, {r0}
	str r0, [r1]
	b _080C3F88
_080C3F80:
	adds r0, r4, #0
	movs r1, #0
	bl memset
_080C3F88:
	adds r0, r4, #0
_080C3F8A:
	pop {r4, pc}
_080C3F8C:
	.byte 0x30, 0xB5, 0x05, 0x1C
	.byte 0x08, 0x1C, 0x08, 0x4C, 0x00, 0x21, 0x21, 0x60, 0xFF, 0xF7, 0x3A, 0xFF, 0x01, 0x1C, 0x01, 0x20
	.byte 0x40, 0x42, 0x81, 0x42, 0x03, 0xD1, 0x20, 0x68, 0x00, 0x28, 0x00, 0xD0, 0x28, 0x60, 0x08, 0x1C
	.byte 0x30, 0xBD, 0x00, 0x00, 0x78, 0x5E, 0x00, 0x03

	thumb_func_start sub_080C3FB8
sub_080C3FB8: @ 0x080C3FB8
	ldr r0, _080C3FC0 @ =0x08CF6638
	ldr r0, [r0]
	bx lr
	.align 2, 0
_080C3FC0: .4byte 0x08CF6638

	thumb_func_start sub_080C3FC4
sub_080C3FC4: @ 0x080C3FC4
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, r1, #0
	adds r1, r2, #0
	ldr r4, _080C3FEC @ =0x03005E78
	movs r2, #0
	str r2, [r4]
	bl sub_080C3E9C
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080C3FE8
	ldr r0, [r4]
	cmp r0, #0
	beq _080C3FE8
	str r0, [r5]
_080C3FE8:
	adds r0, r1, #0
	pop {r4, r5, pc}
	.align 2, 0
_080C3FEC: .4byte 0x03005E78

	thumb_func_start sub_080C3FF0
sub_080C3FF0: @ 0x080C3FF0
	mov ip, r3
	mov r3, r8
	push {r3}
	mov r3, ip
	movs r2, #0x18
	ldr r3, _080C400C @ =0x00020022
	adds r0, r2, #0
	adds r1, r3, #0
	svc #0xab
	mov r8, r0
	pop {r3}
	mov r8, r3
	bx lr
	.align 2, 0
_080C400C: .4byte 0x00020022

	thumb_func_start sub_080C4010
sub_080C4010: @ 0x080C4010
	movs r0, #1
	bx lr
_080C4014:
	.byte 0x70, 0x47, 0x00, 0x00, 0x30, 0xB5, 0x05, 0x1C, 0x08, 0x1C, 0x11, 0x1C
	.byte 0x1A, 0x1C, 0x08, 0x4C, 0x00, 0x23, 0x23, 0x60, 0xFF, 0xF7, 0x40, 0xFE, 0x01, 0x1C, 0x01, 0x20
	.byte 0x40, 0x42, 0x81, 0x42, 0x03, 0xD1, 0x20, 0x68, 0x00, 0x28, 0x00, 0xD0, 0x28, 0x60, 0x08, 0x1C
	.byte 0x30, 0xBD, 0x00, 0x00, 0x78, 0x5E, 0x00, 0x03, 0x30, 0xB5, 0x05, 0x1C, 0x08, 0x1C, 0x11, 0x1C
	.byte 0x1A, 0x1C, 0x08, 0x4C, 0x00, 0x23, 0x23, 0x60, 0xFF, 0xF7, 0xC2, 0xFD, 0x01, 0x1C, 0x01, 0x20
	.byte 0x40, 0x42, 0x81, 0x42, 0x03, 0xD1, 0x20, 0x68, 0x00, 0x28, 0x00, 0xD0, 0x28, 0x60, 0x08, 0x1C
	.byte 0x30, 0xBD, 0x00, 0x00, 0x78, 0x5E, 0x00, 0x03

	thumb_func_start sub_080C4078
sub_080C4078: @ 0x080C4078
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r1, r0, #0
	ldr r4, [r1, #0xc]
	ldr r5, [r1, #0x10]
	ldr r7, [r1, #4]
	movs r6, #0
	movs r2, #0
	ldr r0, [r1]
	cmp r0, #1
	bhi _080C4090
	movs r2, #1
_080C4090:
	cmp r2, #0
	beq _080C40B0
	ldr r6, _080C40A4 @ =0x000007FF
	ldr r2, _080C40A8 @ =0x00000000
	ldr r3, _080C40AC @ =0x00080000
	adds r0, r4, #0
	adds r1, r5, #0
	orrs r1, r3
	b _080C4168
	.align 2, 0
_080C40A4: .4byte 0x000007FF
_080C40A8: .4byte 0x00000000
_080C40AC: .4byte 0x00080000
_080C40B0:
	movs r2, #0
	cmp r0, #4
	bne _080C40B8
	movs r2, #1
_080C40B8:
	cmp r2, #0
	bne _080C4104
	movs r2, #0
	cmp r0, #2
	bne _080C40C4
	movs r2, #1
_080C40C4:
	cmp r2, #0
	beq _080C40CE
	movs r4, #0
	movs r5, #0
	b _080C416C
_080C40CE:
	adds r0, r5, #0
	orrs r0, r4
	cmp r0, #0
	beq _080C416C
	ldr r2, [r1, #8]
	ldr r0, _080C40EC @ =0xFFFFFC02
	cmp r2, r0
	bge _080C40FE
	subs r2, r0, r2
	cmp r2, #0x38
	ble _080C40F0
	movs r4, #0
	movs r5, #0
	b _080C415E
	.align 2, 0
_080C40EC: .4byte 0xFFFFFC02
_080C40F0:
	adds r1, r5, #0
	adds r0, r4, #0
	bl sub_080C5760
	adds r5, r1, #0
	adds r4, r0, #0
	b _080C415E
_080C40FE:
	ldr r0, _080C410C @ =0x000003FF
	cmp r2, r0
	ble _080C4114
_080C4104:
	ldr r6, _080C4110 @ =0x000007FF
	movs r4, #0
	movs r5, #0
	b _080C416C
	.align 2, 0
_080C410C: .4byte 0x000003FF
_080C4110: .4byte 0x000007FF
_080C4114:
	ldr r0, _080C413C @ =0x000003FF
	adds r6, r2, r0
	movs r0, #0xff
	adds r1, r4, #0
	ands r1, r0
	movs r2, #0
	cmp r1, #0x80
	bne _080C4140
	cmp r2, #0
	bne _080C4140
	adds r0, #1
	adds r1, r4, #0
	ands r1, r0
	adds r0, r2, #0
	orrs r0, r1
	cmp r0, #0
	beq _080C4148
	movs r0, #0x80
	movs r1, #0
	b _080C4144
	.align 2, 0
_080C413C: .4byte 0x000003FF
_080C4140:
	movs r0, #0x7f
	movs r1, #0
_080C4144:
	adds r4, r4, r0
	adcs r5, r1
_080C4148:
	ldr r0, _080C41AC @ =0x1FFFFFFF
	cmp r5, r0
	bls _080C415E
	lsls r3, r5, #0x1f
	lsrs r2, r4, #1
	adds r0, r3, #0
	orrs r0, r2
	lsrs r1, r5, #1
	adds r5, r1, #0
	adds r4, r0, #0
	adds r6, #1
_080C415E:
	lsls r3, r5, #0x18
	lsrs r2, r4, #8
	adds r0, r3, #0
	orrs r0, r2
	lsrs r1, r5, #8
_080C4168:
	adds r5, r1, #0
	adds r4, r0, #0
_080C416C:
	str r4, [sp]
	ldr r2, _080C41B0 @ =0x000FFFFF
	ands r2, r5
	ldr r0, [sp, #4]
	ldr r1, _080C41B4 @ =0xFFF00000
	ands r0, r1
	orrs r0, r2
	str r0, [sp, #4]
	mov r2, sp
	ldr r1, _080C41B8 @ =0x000007FF
	adds r0, r1, #0
	ands r6, r0
	lsls r1, r6, #4
	ldr r0, _080C41BC @ =0xFFFF800F
	ldrh r3, [r2, #6]
	ands r0, r3
	orrs r0, r1
	strh r0, [r2, #6]
	lsls r1, r7, #7
	movs r0, #0x7f
	ldrb r3, [r2, #7]
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #7]
	ldr r1, [sp]
	ldr r0, [sp, #4]
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [sp]
	ldr r1, [sp, #4]
	add sp, #8
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_080C41AC: .4byte 0x1FFFFFFF
_080C41B0: .4byte 0x000FFFFF
_080C41B4: .4byte 0xFFF00000
_080C41B8: .4byte 0x000007FF
_080C41BC: .4byte 0xFFFF800F

	thumb_func_start sub_080C41C0
sub_080C41C0: @ 0x080C41C0
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r2, r0, #0
	adds r6, r1, #0
	ldr r1, [r2, #4]
	str r1, [sp]
	ldr r0, [r2]
	str r0, [sp, #4]
	mov r2, sp
	adds r4, r1, #0
	lsls r0, r0, #0xc
	lsrs r5, r0, #0xc
	ldrh r3, [r2, #6]
	lsls r0, r3, #0x11
	lsrs r3, r0, #0x15
	ldrb r2, [r2, #7]
	lsrs r0, r2, #7
	str r0, [r6, #4]
	cmp r3, #0
	bne _080C4234
	orrs r1, r5
	cmp r1, #0
	bne _080C41F4
	movs r0, #2
	str r0, [r6]
	b _080C4288
_080C41F4:
	ldr r0, _080C422C @ =0xFFFFFC02
	str r0, [r6, #8]
	lsrs r3, r4, #0x18
	lsls r2, r5, #8
	adds r1, r3, #0
	orrs r1, r2
	lsls r0, r4, #8
	adds r5, r1, #0
	adds r4, r0, #0
	movs r0, #3
	str r0, [r6]
	ldr r0, _080C4230 @ =0x0FFFFFFF
	cmp r5, r0
	bhi _080C4264
	adds r7, r0, #0
_080C4212:
	lsrs r3, r4, #0x1f
	lsls r2, r5, #1
	adds r1, r3, #0
	orrs r1, r2
	lsls r0, r4, #1
	adds r5, r1, #0
	adds r4, r0, #0
	ldr r0, [r6, #8]
	subs r0, #1
	str r0, [r6, #8]
	cmp r5, r7
	bls _080C4212
	b _080C4264
	.align 2, 0
_080C422C: .4byte 0xFFFFFC02
_080C4230: .4byte 0x0FFFFFFF
_080C4234:
	ldr r0, _080C4248 @ =0x000007FF
	cmp r3, r0
	bne _080C426A
	orrs r1, r5
	cmp r1, #0
	bne _080C424C
	movs r0, #4
	str r0, [r6]
	b _080C4288
	.align 2, 0
_080C4248: .4byte 0x000007FF
_080C424C:
	movs r2, #0x80
	lsls r2, r2, #0xc
	movs r0, #0
	adds r1, r5, #0
	ands r1, r2
	orrs r1, r0
	cmp r1, #0
	beq _080C4262
	movs r0, #1
	str r0, [r6]
	b _080C4264
_080C4262:
	str r1, [r6]
_080C4264:
	str r4, [r6, #0xc]
	str r5, [r6, #0x10]
	b _080C4288
_080C426A:
	ldr r1, _080C428C @ =0xFFFFFC01
	adds r0, r3, r1
	str r0, [r6, #8]
	movs r0, #3
	str r0, [r6]
	lsrs r3, r4, #0x18
	lsls r2, r5, #8
	adds r1, r3, #0
	orrs r1, r2
	lsls r0, r4, #8
	ldr r2, _080C4290 @ =0x00000000
	ldr r3, _080C4294 @ =0x10000000
	orrs r1, r3
	str r0, [r6, #0xc]
	str r1, [r6, #0x10]
_080C4288:
	add sp, #8
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_080C428C: .4byte 0xFFFFFC01
_080C4290: .4byte 0x00000000
_080C4294: .4byte 0x10000000

	thumb_func_start sub_080C4298
sub_080C4298: @ 0x080C4298
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r3, r0, #0
	adds r4, r1, #0
	mov sl, r2
	movs r0, #0
	ldr r2, [r3]
	cmp r2, #1
	bhi _080C42B4
	movs r0, #1
_080C42B4:
	cmp r0, #0
	beq _080C42BC
_080C42B8:
	adds r0, r3, #0
	b _080C44F4
_080C42BC:
	movs r1, #0
	ldr r0, [r4]
	cmp r0, #1
	bhi _080C42C6
	movs r1, #1
_080C42C6:
	cmp r1, #0
	bne _080C433E
	movs r1, #0
	cmp r2, #4
	bne _080C42D2
	movs r1, #1
_080C42D2:
	cmp r1, #0
	beq _080C42F4
	movs r1, #0
	cmp r0, #4
	bne _080C42DE
	movs r1, #1
_080C42DE:
	cmp r1, #0
	beq _080C42B8
	ldr r1, [r3, #4]
	ldr r0, [r4, #4]
	cmp r1, r0
	beq _080C42B8
	ldr r0, _080C42F0 @ =0x03002428
	b _080C44F4
	.align 2, 0
_080C42F0: .4byte 0x03002428
_080C42F4:
	movs r1, #0
	cmp r0, #4
	bne _080C42FC
	movs r1, #1
_080C42FC:
	cmp r1, #0
	bne _080C433E
	movs r1, #0
	cmp r0, #2
	bne _080C4308
	movs r1, #1
_080C4308:
	cmp r1, #0
	beq _080C4330
	movs r0, #0
	cmp r2, #2
	bne _080C4314
	movs r0, #1
_080C4314:
	cmp r0, #0
	beq _080C42B8
	mov r1, sl
	adds r0, r3, #0
	ldm r0!, {r2, r5, r6}
	stm r1!, {r2, r5, r6}
	ldm r0!, {r2, r5}
	stm r1!, {r2, r5}
	ldr r0, [r3, #4]
	ldr r1, [r4, #4]
	ands r0, r1
	mov r6, sl
	str r0, [r6, #4]
	b _080C44F2
_080C4330:
	movs r1, #0
	ldr r0, [r3]
	cmp r0, #2
	bne _080C433A
	movs r1, #1
_080C433A:
	cmp r1, #0
	beq _080C4342
_080C433E:
	adds r0, r4, #0
	b _080C44F4
_080C4342:
	ldr r0, [r3, #8]
	mov sb, r0
	ldr r1, [r4, #8]
	mov r8, r1
	ldr r6, [r3, #0xc]
	ldr r7, [r3, #0x10]
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #0x10]
	str r0, [sp]
	str r1, [sp, #4]
	mov r1, sb
	mov r2, r8
	subs r0, r1, r2
	cmp r0, #0
	bge _080C4362
	rsbs r0, r0, #0
_080C4362:
	cmp r0, #0x3f
	bgt _080C43E0
	ldr r3, [r3, #4]
	mov ip, r3
	ldr r4, [r4, #4]
	str r4, [sp, #8]
	cmp sb, r8
	ble _080C43AC
	mov r3, sb
	mov r4, r8
	subs r3, r3, r4
	mov r8, r3
_080C437A:
	movs r5, #1
	rsbs r5, r5, #0
	add r8, r5
	ldr r2, [sp]
	movs r0, #1
	ands r2, r0
	movs r3, #0
	ldr r1, [sp, #4]
	lsls r5, r1, #0x1f
	ldr r0, [sp]
	lsrs r4, r0, #1
	adds r0, r5, #0
	orrs r0, r4
	adds r4, r1, #0
	lsrs r1, r4, #1
	adds r5, r2, #0
	orrs r5, r0
	str r5, [sp]
	adds r4, r3, #0
	orrs r4, r1
	str r4, [sp, #4]
	mov r5, r8
	cmp r5, #0
	bne _080C437A
	mov r8, sb
_080C43AC:
	cmp r8, sb
	ble _080C43FC
	mov r0, r8
	mov r1, sb
	subs r0, r0, r1
	mov sb, r0
_080C43B8:
	movs r2, #1
	rsbs r2, r2, #0
	add sb, r2
	movs r2, #1
	ands r2, r6
	movs r3, #0
	lsls r5, r7, #0x1f
	lsrs r4, r6, #1
	adds r0, r5, #0
	orrs r0, r4
	lsrs r1, r7, #1
	adds r6, r2, #0
	orrs r6, r0
	adds r7, r3, #0
	orrs r7, r1
	mov r3, sb
	cmp r3, #0
	bne _080C43B8
	mov sb, r8
	b _080C43FC
_080C43E0:
	cmp sb, r8
	ble _080C43EE
	movs r0, #0
	movs r1, #0
	str r0, [sp]
	str r1, [sp, #4]
	b _080C43F4
_080C43EE:
	mov sb, r8
	movs r6, #0
	movs r7, #0
_080C43F4:
	ldr r3, [r3, #4]
	mov ip, r3
	ldr r4, [r4, #4]
	str r4, [sp, #8]
_080C43FC:
	ldr r1, [sp, #8]
	cmp ip, r1
	beq _080C44A4
	mov r2, ip
	cmp r2, #0
	beq _080C441E
	adds r1, r7, #0
	adds r0, r6, #0
	bl sub_080C5794
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r4, [sp]
	ldr r5, [sp, #4]
	adds r2, r2, r4
	adcs r3, r5
	b _080C442A
_080C441E:
	adds r3, r7, #0
	adds r2, r6, #0
	ldr r0, [sp]
	ldr r1, [sp, #4]
	subs r2, r2, r0
	sbcs r3, r1
_080C442A:
	cmp r3, #0
	blt _080C4440
	movs r0, #0
	mov r1, sl
	str r0, [r1, #4]
	mov r4, sb
	str r4, [r1, #8]
	mov r5, sl
	str r2, [r5, #0xc]
	str r3, [r5, #0x10]
	b _080C4458
_080C4440:
	movs r0, #1
	mov r6, sl
	str r0, [r6, #4]
	mov r0, sb
	str r0, [r6, #8]
	adds r1, r3, #0
	adds r0, r2, #0
	bl sub_080C5794
	mov r2, sl
	str r0, [r2, #0xc]
	str r1, [r2, #0x10]
_080C4458:
	mov r4, sl
	ldr r2, [r4, #0xc]
	ldr r3, [r4, #0x10]
	movs r0, #1
	rsbs r0, r0, #0
	asrs r1, r0, #0x1f
_080C4464:
	adds r2, r2, r0
	adcs r3, r1
	ldr r0, _080C44A0 @ =0x0FFFFFFF
	cmp r3, r0
	bhi _080C44BC
	cmp r3, r0
	bne _080C447A
	movs r0, #2
	rsbs r0, r0, #0
	cmp r2, r0
	bhi _080C44BC
_080C447A:
	mov r5, sl
	ldr r0, [r5, #0xc]
	ldr r1, [r5, #0x10]
	lsrs r3, r0, #0x1f
	lsls r2, r1, #1
	adds r1, r3, #0
	orrs r1, r2
	lsls r0, r0, #1
	mov r6, sl
	str r0, [r6, #0xc]
	str r1, [r6, #0x10]
	ldr r2, [r6, #8]
	subs r2, #1
	str r2, [r6, #8]
	movs r2, #1
	rsbs r2, r2, #0
	asrs r3, r2, #0x1f
	b _080C4464
	.align 2, 0
_080C44A0: .4byte 0x0FFFFFFF
_080C44A4:
	mov r0, ip
	mov r1, sl
	str r0, [r1, #4]
	mov r2, sb
	str r2, [r1, #8]
	ldr r3, [sp]
	ldr r4, [sp, #4]
	adds r6, r6, r3
	adcs r7, r4
	mov r4, sl
	str r6, [r4, #0xc]
	str r7, [r4, #0x10]
_080C44BC:
	movs r0, #3
	mov r5, sl
	str r0, [r5]
	ldr r1, [r5, #0x10]
	ldr r0, _080C4500 @ =0x1FFFFFFF
	cmp r1, r0
	bls _080C44F2
	ldr r4, [r5, #0xc]
	ldr r5, [r5, #0x10]
	movs r2, #1
	adds r0, r4, #0
	ands r0, r2
	movs r1, #0
	lsls r6, r5, #0x1f
	mov r8, r6
	lsrs r6, r4, #1
	mov r2, r8
	orrs r2, r6
	lsrs r3, r5, #1
	orrs r0, r2
	orrs r1, r3
	mov r2, sl
	str r0, [r2, #0xc]
	str r1, [r2, #0x10]
	ldr r0, [r2, #8]
	adds r0, #1
	str r0, [r2, #8]
_080C44F2:
	mov r0, sl
_080C44F4:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_080C4500: .4byte 0x1FFFFFFF

	thumb_func_start sub_080C4504
sub_080C4504: @ 0x080C4504
	push {r4, lr}
	sub sp, #0x4c
	str r0, [sp, #0x3c]
	str r1, [sp, #0x40]
	str r2, [sp, #0x44]
	str r3, [sp, #0x48]
	add r0, sp, #0x3c
	mov r1, sp
	bl sub_080C41C0
	add r0, sp, #0x44
	add r4, sp, #0x14
	adds r1, r4, #0
	bl sub_080C41C0
	add r2, sp, #0x28
	mov r0, sp
	adds r1, r4, #0
	bl sub_080C4298
	bl sub_080C4078
	add sp, #0x4c
	pop {r4, pc}

	thumb_func_start sub_080C4534
sub_080C4534: @ 0x080C4534
	push {r4, lr}
	sub sp, #0x4c
	str r0, [sp, #0x3c]
	str r1, [sp, #0x40]
	str r2, [sp, #0x44]
	str r3, [sp, #0x48]
	add r0, sp, #0x3c
	mov r1, sp
	bl sub_080C41C0
	add r0, sp, #0x44
	add r4, sp, #0x14
	adds r1, r4, #0
	bl sub_080C41C0
	ldr r0, [r4, #4]
	movs r1, #1
	eors r0, r1
	str r0, [r4, #4]
	add r2, sp, #0x28
	mov r0, sp
	adds r1, r4, #0
	bl sub_080C4298
	bl sub_080C4078
	add sp, #0x4c
	pop {r4, pc}

	thumb_func_start sub_080C456C
sub_080C456C: @ 0x080C456C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x74
	str r0, [sp, #0x3c]
	str r1, [sp, #0x40]
	str r2, [sp, #0x44]
	str r3, [sp, #0x48]
	add r0, sp, #0x3c
	mov r1, sp
	bl sub_080C41C0
	add r0, sp, #0x44
	add r4, sp, #0x14
	adds r1, r4, #0
	bl sub_080C41C0
	mov r8, sp
	add r0, sp, #0x28
	mov sl, r0
	movs r0, #0
	ldr r1, [sp]
	cmp r1, #1
	bhi _080C45A2
	movs r0, #1
_080C45A2:
	cmp r0, #0
	bne _080C4606
	movs r2, #0
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bhi _080C45B0
	movs r2, #1
_080C45B0:
	cmp r2, #0
	beq _080C45B8
	ldr r0, [sp, #4]
	b _080C4628
_080C45B8:
	movs r2, #0
	cmp r1, #4
	bne _080C45C0
	movs r2, #1
_080C45C0:
	cmp r2, #0
	beq _080C45D2
	movs r1, #0
	cmp r0, #2
	bne _080C45CC
	movs r1, #1
_080C45CC:
	cmp r1, #0
	bne _080C45EA
	b _080C4606
_080C45D2:
	movs r2, #0
	cmp r0, #4
	bne _080C45DA
	movs r2, #1
_080C45DA:
	cmp r2, #0
	beq _080C45FA
	movs r0, #0
	cmp r1, #2
	bne _080C45E6
	movs r0, #1
_080C45E6:
	cmp r0, #0
	beq _080C45F4
_080C45EA:
	ldr r0, _080C45F0 @ =0x03002428
	b _080C47F2
	.align 2, 0
_080C45F0: .4byte 0x03002428
_080C45F4:
	mov r1, r8
	ldr r0, [r1, #4]
	b _080C4628
_080C45FA:
	movs r2, #0
	cmp r1, #2
	bne _080C4602
	movs r2, #1
_080C4602:
	cmp r2, #0
	beq _080C4618
_080C4606:
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x18]
	eors r0, r1
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r1, r1, #0x1f
	str r1, [sp, #4]
	mov r0, sp
	b _080C47F2
_080C4618:
	movs r1, #0
	cmp r0, #2
	bne _080C4620
	movs r1, #1
_080C4620:
	cmp r1, #0
	beq _080C4638
	mov r2, r8
	ldr r0, [r2, #4]
_080C4628:
	ldr r1, [sp, #0x18]
	eors r0, r1
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r1, r1, #0x1f
	str r1, [sp, #0x18]
	adds r0, r4, #0
	b _080C47F2
_080C4638:
	mov r4, r8
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #0x10]
	adds r6, r0, #0
	movs r7, #0
	str r1, [sp, #0x4c]
	movs r5, #0
	str r5, [sp, #0x50]
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x24]
	adds r4, r0, #0
	str r1, [sp, #0x54]
	movs r0, #0
	str r0, [sp, #0x58]
	adds r1, r5, #0
	adds r0, r4, #0
	adds r3, r7, #0
	adds r2, r6, #0
	bl __muldi3
	str r0, [sp, #0x5c]
	str r1, [sp, #0x60]
	ldr r0, [sp, #0x54]
	ldr r1, [sp, #0x58]
	adds r3, r7, #0
	adds r2, r6, #0
	bl __muldi3
	adds r7, r1, #0
	adds r6, r0, #0
	adds r1, r5, #0
	adds r0, r4, #0
	ldr r2, [sp, #0x4c]
	ldr r3, [sp, #0x50]
	bl __muldi3
	adds r5, r1, #0
	adds r4, r0, #0
	ldr r0, [sp, #0x54]
	ldr r1, [sp, #0x58]
	ldr r2, [sp, #0x4c]
	ldr r3, [sp, #0x50]
	bl __muldi3
	str r0, [sp, #0x64]
	str r1, [sp, #0x68]
	movs r1, #0
	movs r2, #0
	str r1, [sp, #0x6c]
	str r2, [sp, #0x70]
	adds r3, r7, #0
	adds r2, r6, #0
	adds r2, r2, r4
	adcs r3, r5
	cmp r7, r3
	bhi _080C46B0
	cmp r7, r3
	bne _080C46B8
	cmp r6, r2
	bls _080C46B8
_080C46B0:
	ldr r5, _080C4808 @ =0x00000001
	ldr r4, _080C4804 @ =0x00000000
	str r4, [sp, #0x6c]
	str r5, [sp, #0x70]
_080C46B8:
	adds r1, r2, #0
	movs r6, #0
	adds r7, r1, #0
	ldr r0, [sp, #0x5c]
	ldr r1, [sp, #0x60]
	adds r6, r6, r0
	adcs r7, r1
	cmp r1, r7
	bhi _080C46D4
	ldr r1, [sp, #0x60]
	cmp r1, r7
	bne _080C46E4
	cmp r0, r6
	bls _080C46E4
_080C46D4:
	movs r0, #1
	movs r1, #0
	ldr r4, [sp, #0x6c]
	ldr r5, [sp, #0x70]
	adds r4, r4, r0
	adcs r5, r1
	str r4, [sp, #0x6c]
	str r5, [sp, #0x70]
_080C46E4:
	adds r0, r3, #0
	adds r2, r0, #0
	movs r3, #0
	adds r5, r3, #0
	adds r4, r2, #0
	ldr r0, [sp, #0x64]
	ldr r1, [sp, #0x68]
	adds r4, r4, r0
	adcs r5, r1
	ldr r1, [sp, #0x6c]
	ldr r2, [sp, #0x70]
	adds r4, r4, r1
	adcs r5, r2
	mov r0, r8
	ldr r2, [r0, #8]
	ldr r0, [sp, #0x1c]
	adds r2, r2, r0
	str r2, [sp, #0x30]
	mov r0, r8
	ldr r1, [r0, #4]
	ldr r0, [sp, #0x18]
	eors r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	str r0, [sp, #0x2c]
	adds r2, #4
	str r2, [sp, #0x30]
	ldr r0, _080C480C @ =0x1FFFFFFF
	cmp r5, r0
	bls _080C4766
	movs r1, #1
	mov sb, r1
	mov r8, r0
	mov ip, r2
_080C472A:
	movs r2, #1
	add ip, r2
	mov r0, sb
	ands r0, r4
	cmp r0, #0
	beq _080C4750
	lsls r3, r7, #0x1f
	lsrs r2, r6, #1
	adds r0, r3, #0
	orrs r0, r2
	lsrs r1, r7, #1
	adds r7, r1, #0
	adds r6, r0, #0
	adds r0, r6, #0
	movs r1, #0x80
	lsls r1, r1, #0x18
	orrs r1, r7
	adds r7, r1, #0
	adds r6, r0, #0
_080C4750:
	lsls r3, r5, #0x1f
	lsrs r2, r4, #1
	adds r0, r3, #0
	orrs r0, r2
	lsrs r1, r5, #1
	adds r5, r1, #0
	adds r4, r0, #0
	cmp r5, r8
	bhi _080C472A
	mov r0, ip
	str r0, [sp, #0x30]
_080C4766:
	ldr r0, _080C4810 @ =0x0FFFFFFF
	cmp r5, r0
	bhi _080C47B8
	movs r1, #0x80
	lsls r1, r1, #0x18
	mov sb, r1
	mov r8, r0
	ldr r2, [sp, #0x30]
	mov ip, r2
_080C4778:
	movs r0, #1
	rsbs r0, r0, #0
	add ip, r0
	lsrs r3, r4, #0x1f
	lsls r2, r5, #1
	adds r1, r3, #0
	orrs r1, r2
	lsls r0, r4, #1
	adds r5, r1, #0
	adds r4, r0, #0
	movs r0, #0
	mov r1, sb
	ands r1, r7
	orrs r0, r1
	cmp r0, #0
	beq _080C47A2
	movs r0, #1
	orrs r0, r4
	adds r1, r5, #0
	adds r5, r1, #0
	adds r4, r0, #0
_080C47A2:
	lsrs r3, r6, #0x1f
	lsls r2, r7, #1
	adds r1, r3, #0
	orrs r1, r2
	lsls r0, r6, #1
	adds r7, r1, #0
	adds r6, r0, #0
	cmp r5, r8
	bls _080C4778
	mov r1, ip
	str r1, [sp, #0x30]
_080C47B8:
	movs r0, #0xff
	adds r1, r4, #0
	ands r1, r0
	movs r2, #0
	cmp r1, #0x80
	bne _080C47E6
	cmp r2, #0
	bne _080C47E6
	adds r0, #1
	adds r1, r4, #0
	ands r1, r0
	adds r0, r2, #0
	orrs r0, r1
	cmp r0, #0
	bne _080C47DE
	adds r0, r7, #0
	orrs r0, r6
	cmp r0, #0
	beq _080C47E6
_080C47DE:
	movs r0, #0x80
	movs r1, #0
	adds r4, r4, r0
	adcs r5, r1
_080C47E6:
	str r4, [sp, #0x34]
	str r5, [sp, #0x38]
	movs r0, #3
	mov r2, sl
	str r0, [r2]
	add r0, sp, #0x28
_080C47F2:
	bl sub_080C4078
	add sp, #0x74
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_080C4804: .4byte 0x00000000
_080C4808: .4byte 0x00000001
_080C480C: .4byte 0x1FFFFFFF
_080C4810: .4byte 0x0FFFFFFF

	thumb_func_start sub_080C4814
sub_080C4814: @ 0x080C4814
	push {r4, r5, r6, r7, lr}
	sub sp, #0x48
	str r0, [sp, #0x28]
	str r1, [sp, #0x2c]
	str r2, [sp, #0x30]
	str r3, [sp, #0x34]
	add r0, sp, #0x28
	mov r1, sp
	bl sub_080C41C0
	add r0, sp, #0x30
	add r4, sp, #0x14
	adds r1, r4, #0
	bl sub_080C41C0
	mov ip, sp
	movs r0, #0
	ldr r3, [sp]
	cmp r3, #1
	bhi _080C483E
	movs r0, #1
_080C483E:
	cmp r0, #0
	beq _080C4846
	mov r1, sp
	b _080C4988
_080C4846:
	movs r0, #0
	ldr r2, [sp, #0x14]
	adds r5, r2, #0
	cmp r2, #1
	bhi _080C4852
	movs r0, #1
_080C4852:
	cmp r0, #0
	beq _080C485A
	adds r1, r4, #0
	b _080C4988
_080C485A:
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x18]
	eors r0, r1
	str r0, [sp, #4]
	movs r0, #0
	cmp r3, #4
	bne _080C486A
	movs r0, #1
_080C486A:
	cmp r0, #0
	bne _080C487A
	movs r4, #0
	cmp r3, #2
	bne _080C4876
	movs r4, #1
_080C4876:
	cmp r4, #0
	beq _080C488C
_080C487A:
	mov r1, ip
	ldr r0, [r1]
	cmp r0, r5
	beq _080C4884
	b _080C4988
_080C4884:
	ldr r1, _080C4888 @ =0x03002428
	b _080C4988
	.align 2, 0
_080C4888: .4byte 0x03002428
_080C488C:
	movs r0, #0
	cmp r2, #4
	bne _080C4894
	movs r0, #1
_080C4894:
	cmp r0, #0
	beq _080C48A6
	movs r0, #0
	movs r1, #0
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	str r4, [sp, #8]
	mov r1, sp
	b _080C4988
_080C48A6:
	movs r0, #0
	cmp r2, #2
	bne _080C48AE
	movs r0, #1
_080C48AE:
	cmp r0, #0
	beq _080C48BA
	movs r0, #4
	mov r2, ip
	str r0, [r2]
	b _080C4986
_080C48BA:
	mov r3, ip
	ldr r1, [r3, #8]
	ldr r0, [sp, #0x1c]
	subs r6, r1, r0
	str r6, [r3, #8]
	ldr r4, [r3, #0xc]
	ldr r5, [r3, #0x10]
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x24]
	str r0, [sp, #0x38]
	str r1, [sp, #0x3c]
	cmp r1, r5
	bhi _080C48DE
	ldr r1, [sp, #0x3c]
	cmp r1, r5
	bne _080C48F2
	cmp r0, r4
	bls _080C48F2
_080C48DE:
	lsrs r3, r4, #0x1f
	lsls r2, r5, #1
	adds r1, r3, #0
	orrs r1, r2
	lsls r0, r4, #1
	adds r5, r1, #0
	adds r4, r0, #0
	subs r0, r6, #1
	mov r2, ip
	str r0, [r2, #8]
_080C48F2:
	ldr r7, _080C4998 @ =0x10000000
	ldr r6, _080C4994 @ =0x00000000
	movs r0, #0
	movs r1, #0
	str r0, [sp, #0x40]
	str r1, [sp, #0x44]
_080C48FE:
	ldr r1, [sp, #0x3c]
	cmp r1, r5
	bhi _080C4922
	cmp r1, r5
	bne _080C490E
	ldr r2, [sp, #0x38]
	cmp r2, r4
	bhi _080C4922
_080C490E:
	ldr r0, [sp, #0x40]
	orrs r0, r6
	ldr r1, [sp, #0x44]
	orrs r1, r7
	str r0, [sp, #0x40]
	str r1, [sp, #0x44]
	ldr r0, [sp, #0x38]
	ldr r1, [sp, #0x3c]
	subs r4, r4, r0
	sbcs r5, r1
_080C4922:
	lsls r3, r7, #0x1f
	lsrs r2, r6, #1
	adds r0, r3, #0
	orrs r0, r2
	lsrs r1, r7, #1
	adds r7, r1, #0
	adds r6, r0, #0
	lsrs r3, r4, #0x1f
	lsls r2, r5, #1
	adds r1, r3, #0
	orrs r1, r2
	lsls r0, r4, #1
	adds r5, r1, #0
	adds r4, r0, #0
	adds r0, r7, #0
	orrs r0, r6
	cmp r0, #0
	bne _080C48FE
	movs r0, #0xff
	ldr r1, [sp, #0x40]
	ands r1, r0
	movs r2, #0
	cmp r1, #0x80
	bne _080C497C
	cmp r2, #0
	bne _080C497C
	adds r0, #1
	ldr r1, [sp, #0x40]
	ands r1, r0
	adds r0, r2, #0
	orrs r0, r1
	cmp r0, #0
	bne _080C496C
	adds r0, r5, #0
	orrs r0, r4
	cmp r0, #0
	beq _080C497C
_080C496C:
	movs r0, #0x80
	movs r1, #0
	ldr r2, [sp, #0x40]
	ldr r3, [sp, #0x44]
	adds r2, r2, r0
	adcs r3, r1
	str r2, [sp, #0x40]
	str r3, [sp, #0x44]
_080C497C:
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	mov r2, ip
	str r0, [r2, #0xc]
	str r1, [r2, #0x10]
_080C4986:
	mov r1, ip
_080C4988:
	adds r0, r1, #0
	bl sub_080C4078
	add sp, #0x48
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_080C4994: .4byte 0x00000000
_080C4998: .4byte 0x10000000

	thumb_func_start sub_080C499C
sub_080C499C: @ 0x080C499C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r0, #0
	ldr r1, [r5]
	cmp r1, #1
	bhi _080C49AC
	movs r0, #1
_080C49AC:
	cmp r0, #0
	bne _080C49BE
	movs r0, #0
	ldr r2, [r6]
	cmp r2, #1
	bhi _080C49BA
	movs r0, #1
_080C49BA:
	cmp r0, #0
	beq _080C49C2
_080C49BE:
	movs r0, #1
	b _080C4A98
_080C49C2:
	movs r0, #0
	cmp r1, #4
	bne _080C49CA
	movs r0, #1
_080C49CA:
	cmp r0, #0
	beq _080C49E2
	movs r0, #0
	cmp r2, #4
	bne _080C49D6
	movs r0, #1
_080C49D6:
	cmp r0, #0
	beq _080C49E2
	ldr r0, [r6, #4]
	ldr r1, [r5, #4]
	subs r0, r0, r1
	b _080C4A98
_080C49E2:
	movs r1, #0
	ldr r0, [r5]
	cmp r0, #4
	bne _080C49EC
	movs r1, #1
_080C49EC:
	cmp r1, #0
	bne _080C4A3A
	movs r1, #0
	cmp r2, #4
	bne _080C49F8
	movs r1, #1
_080C49F8:
	cmp r1, #0
	beq _080C4A0A
_080C49FC:
	ldr r0, [r6, #4]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, #0
	beq _080C4A44
	movs r1, #1
	b _080C4A44
_080C4A0A:
	movs r1, #0
	cmp r0, #2
	bne _080C4A12
	movs r1, #1
_080C4A12:
	cmp r1, #0
	beq _080C4A22
	movs r1, #0
	cmp r2, #2
	bne _080C4A1E
	movs r1, #1
_080C4A1E:
	cmp r1, #0
	bne _080C4A96
_080C4A22:
	movs r1, #0
	cmp r0, #2
	bne _080C4A2A
	movs r1, #1
_080C4A2A:
	cmp r1, #0
	bne _080C49FC
	movs r0, #0
	cmp r2, #2
	bne _080C4A36
	movs r0, #1
_080C4A36:
	cmp r0, #0
	beq _080C4A48
_080C4A3A:
	ldr r0, [r5, #4]
	movs r1, #1
	cmp r0, #0
	beq _080C4A44
	subs r1, #2
_080C4A44:
	adds r0, r1, #0
	b _080C4A98
_080C4A48:
	ldr r0, [r6, #4]
	ldr r4, [r5, #4]
	cmp r4, r0
	beq _080C4A5A
_080C4A50:
	movs r0, #1
	cmp r4, #0
	beq _080C4A98
	subs r0, #2
	b _080C4A98
_080C4A5A:
	ldr r1, [r5, #8]
	ldr r0, [r6, #8]
	cmp r1, r0
	bgt _080C4A50
	cmp r1, r0
	bge _080C4A72
_080C4A66:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, #0
	beq _080C4A98
	movs r0, #1
	b _080C4A98
_080C4A72:
	ldr r3, [r5, #0x10]
	ldr r2, [r6, #0x10]
	cmp r3, r2
	bhi _080C4A50
	cmp r3, r2
	bne _080C4A86
	ldr r1, [r5, #0xc]
	ldr r0, [r6, #0xc]
	cmp r1, r0
	bhi _080C4A50
_080C4A86:
	cmp r2, r3
	bhi _080C4A66
	cmp r2, r3
	bne _080C4A96
	ldr r1, [r6, #0xc]
	ldr r0, [r5, #0xc]
	cmp r1, r0
	bhi _080C4A66
_080C4A96:
	movs r0, #0
_080C4A98:
	pop {r4, r5, r6, pc}
	.align 2, 0
_080C4A9C:
	.byte 0x10, 0xB5, 0x8E, 0xB0
	.byte 0x0A, 0x90, 0x0B, 0x91, 0x0C, 0x92, 0x0D, 0x93, 0x0A, 0xA8, 0x69, 0x46, 0xFF, 0xF7, 0x88, 0xFB
	.byte 0x0C, 0xA8, 0x05, 0xAC, 0x21, 0x1C, 0xFF, 0xF7, 0x83, 0xFB, 0x68, 0x46, 0x21, 0x1C, 0xFF, 0xF7
	.byte 0x6D, 0xFF, 0x0E, 0xB0, 0x10, 0xBD, 0x00, 0x00

	thumb_func_start sub_080C4AC8
sub_080C4AC8: @ 0x080C4AC8
	push {r4, lr}
	sub sp, #0x38
	str r0, [sp, #0x28]
	str r1, [sp, #0x2c]
	str r2, [sp, #0x30]
	str r3, [sp, #0x34]
	add r0, sp, #0x28
	mov r1, sp
	bl sub_080C41C0
	add r0, sp, #0x30
	add r4, sp, #0x14
	adds r1, r4, #0
	bl sub_080C41C0
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #1
	bhi _080C4AF0
	movs r1, #1
_080C4AF0:
	cmp r1, #0
	bne _080C4B02
	movs r1, #0
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bhi _080C4AFE
	movs r1, #1
_080C4AFE:
	cmp r1, #0
	beq _080C4B06
_080C4B02:
	movs r0, #1
	b _080C4B0E
_080C4B06:
	mov r0, sp
	adds r1, r4, #0
	bl sub_080C499C
_080C4B0E:
	add sp, #0x38
	pop {r4, pc}
	.align 2, 0

	thumb_func_start sub_080C4B14
sub_080C4B14: @ 0x080C4B14
	push {r4, lr}
	sub sp, #0x38
	str r0, [sp, #0x28]
	str r1, [sp, #0x2c]
	str r2, [sp, #0x30]
	str r3, [sp, #0x34]
	add r0, sp, #0x28
	mov r1, sp
	bl sub_080C41C0
	add r0, sp, #0x30
	add r4, sp, #0x14
	adds r1, r4, #0
	bl sub_080C41C0
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #1
	bhi _080C4B3C
	movs r1, #1
_080C4B3C:
	cmp r1, #0
	bne _080C4B4E
	movs r1, #0
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bhi _080C4B4A
	movs r1, #1
_080C4B4A:
	cmp r1, #0
	beq _080C4B52
_080C4B4E:
	movs r0, #1
	b _080C4B5A
_080C4B52:
	mov r0, sp
	adds r1, r4, #0
	bl sub_080C499C
_080C4B5A:
	add sp, #0x38
	pop {r4, pc}
	.align 2, 0

	thumb_func_start sub_080C4B60
sub_080C4B60: @ 0x080C4B60
	push {r4, lr}
	sub sp, #0x38
	str r0, [sp, #0x28]
	str r1, [sp, #0x2c]
	str r2, [sp, #0x30]
	str r3, [sp, #0x34]
	add r0, sp, #0x28
	mov r1, sp
	bl sub_080C41C0
	add r0, sp, #0x30
	add r4, sp, #0x14
	adds r1, r4, #0
	bl sub_080C41C0
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #1
	bhi _080C4B88
	movs r1, #1
_080C4B88:
	cmp r1, #0
	bne _080C4B9A
	movs r1, #0
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bhi _080C4B96
	movs r1, #1
_080C4B96:
	cmp r1, #0
	beq _080C4BA0
_080C4B9A:
	movs r0, #1
	rsbs r0, r0, #0
	b _080C4BA8
_080C4BA0:
	mov r0, sp
	adds r1, r4, #0
	bl sub_080C499C
_080C4BA8:
	add sp, #0x38
	pop {r4, pc}
_080C4BAC:
	.byte 0x10, 0xB5, 0x8E, 0xB0
	.byte 0x0A, 0x90, 0x0B, 0x91, 0x0C, 0x92, 0x0D, 0x93, 0x0A, 0xA8, 0x69, 0x46, 0xFF, 0xF7, 0x00, 0xFB
	.byte 0x0C, 0xA8, 0x05, 0xAC, 0x21, 0x1C, 0xFF, 0xF7, 0xFB, 0xFA, 0x00, 0x21, 0x00, 0x98, 0x01, 0x28
	.byte 0x00, 0xD8, 0x01, 0x21, 0x00, 0x29, 0x06, 0xD1, 0x00, 0x21, 0x05, 0x98, 0x01, 0x28, 0x00, 0xD8
	.byte 0x01, 0x21, 0x00, 0x29, 0x02, 0xD0, 0x01, 0x20, 0x40, 0x42, 0x03, 0xE0, 0x68, 0x46, 0x21, 0x1C
	.byte 0xFF, 0xF7, 0xD4, 0xFE, 0x0E, 0xB0, 0x10, 0xBD

	thumb_func_start sub_080C4BF8
sub_080C4BF8: @ 0x080C4BF8
	push {r4, lr}
	sub sp, #0x38
	str r0, [sp, #0x28]
	str r1, [sp, #0x2c]
	str r2, [sp, #0x30]
	str r3, [sp, #0x34]
	add r0, sp, #0x28
	mov r1, sp
	bl sub_080C41C0
	add r0, sp, #0x30
	add r4, sp, #0x14
	adds r1, r4, #0
	bl sub_080C41C0
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #1
	bhi _080C4C20
	movs r1, #1
_080C4C20:
	cmp r1, #0
	bne _080C4C32
	movs r1, #0
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bhi _080C4C2E
	movs r1, #1
_080C4C2E:
	cmp r1, #0
	beq _080C4C36
_080C4C32:
	movs r0, #1
	b _080C4C3E
_080C4C36:
	mov r0, sp
	adds r1, r4, #0
	bl sub_080C499C
_080C4C3E:
	add sp, #0x38
	pop {r4, pc}
	.align 2, 0

	thumb_func_start sub_080C4C44
sub_080C4C44: @ 0x080C4C44
	push {r4, lr}
	sub sp, #0x38
	str r0, [sp, #0x28]
	str r1, [sp, #0x2c]
	str r2, [sp, #0x30]
	str r3, [sp, #0x34]
	add r0, sp, #0x28
	mov r1, sp
	bl sub_080C41C0
	add r0, sp, #0x30
	add r4, sp, #0x14
	adds r1, r4, #0
	bl sub_080C41C0
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #1
	bhi _080C4C6C
	movs r1, #1
_080C4C6C:
	cmp r1, #0
	bne _080C4C7E
	movs r1, #0
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bhi _080C4C7A
	movs r1, #1
_080C4C7A:
	cmp r1, #0
	beq _080C4C82
_080C4C7E:
	movs r0, #1
	b _080C4C8A
_080C4C82:
	mov r0, sp
	adds r1, r4, #0
	bl sub_080C499C
_080C4C8A:
	add sp, #0x38
	pop {r4, pc}
	.align 2, 0

	thumb_func_start sub_080C4C90
sub_080C4C90: @ 0x080C4C90
	push {r4, r5, lr}
	sub sp, #0x14
	adds r2, r0, #0
	movs r0, #3
	str r0, [sp]
	lsrs r1, r2, #0x1f
	str r1, [sp, #4]
	cmp r2, #0
	bne _080C4CA8
	movs r0, #2
	str r0, [sp]
	b _080C4CFE
_080C4CA8:
	movs r0, #0x3c
	str r0, [sp, #8]
	cmp r1, #0
	beq _080C4CCE
	movs r0, #0x80
	lsls r0, r0, #0x18
	cmp r2, r0
	bne _080C4CC8
	ldr r1, _080C4CC4 @ =0x00000000
	ldr r0, _080C4CC0 @ =0xC1E00000
	b _080C4D04
	.align 2, 0
_080C4CC0: .4byte 0xC1E00000
_080C4CC4: .4byte 0x00000000
_080C4CC8:
	rsbs r0, r2, #0
	asrs r1, r0, #0x1f
	b _080C4CD2
_080C4CCE:
	adds r0, r2, #0
	asrs r1, r2, #0x1f
_080C4CD2:
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	ldr r0, [sp, #0x10]
	ldr r1, _080C4D08 @ =0x0FFFFFFF
	cmp r0, r1
	bhi _080C4CFE
	adds r5, r1, #0
	ldr r4, [sp, #8]
_080C4CE2:
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	lsrs r3, r0, #0x1f
	lsls r2, r1, #1
	adds r1, r3, #0
	orrs r1, r2
	lsls r0, r0, #1
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	subs r4, #1
	ldr r0, [sp, #0x10]
	cmp r0, r5
	bls _080C4CE2
	str r4, [sp, #8]
_080C4CFE:
	mov r0, sp
	bl sub_080C4078
_080C4D04:
	add sp, #0x14
	pop {r4, r5, pc}
	.align 2, 0
_080C4D08: .4byte 0x0FFFFFFF

	thumb_func_start sub_080C4D0C
sub_080C4D0C: @ 0x080C4D0C
	push {lr}
	sub sp, #0x1c
	str r0, [sp, #0x14]
	str r1, [sp, #0x18]
	add r0, sp, #0x14
	mov r1, sp
	bl sub_080C41C0
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #2
	bne _080C4D26
	movs r1, #1
_080C4D26:
	cmp r1, #0
	bne _080C4D5A
	movs r1, #0
	cmp r0, #1
	bhi _080C4D32
	movs r1, #1
_080C4D32:
	cmp r1, #0
	bne _080C4D5A
	movs r1, #0
	cmp r0, #4
	bne _080C4D3E
	movs r1, #1
_080C4D3E:
	cmp r1, #0
	beq _080C4D54
_080C4D42:
	ldr r0, [sp, #4]
	ldr r1, _080C4D50 @ =0x7FFFFFFF
	cmp r0, #0
	beq _080C4D78
	adds r1, #1
	b _080C4D78
	.align 2, 0
_080C4D50: .4byte 0x7FFFFFFF
_080C4D54:
	ldr r0, [sp, #8]
	cmp r0, #0
	bge _080C4D5E
_080C4D5A:
	movs r0, #0
	b _080C4D7A
_080C4D5E:
	cmp r0, #0x1e
	bgt _080C4D42
	movs r2, #0x3c
	subs r2, r2, r0
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	bl sub_080C5760
	adds r1, r0, #0
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _080C4D78
	rsbs r1, r1, #0
_080C4D78:
	adds r0, r1, #0
_080C4D7A:
	add sp, #0x1c
	pop {pc}
	.align 2, 0

	thumb_func_start sub_080C4D80
sub_080C4D80: @ 0x080C4D80
	push {lr}
	sub sp, #0x1c
	str r0, [sp, #0x14]
	str r1, [sp, #0x18]
	add r0, sp, #0x14
	mov r1, sp
	bl sub_080C41C0
	movs r1, #0
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _080C4D9A
	movs r1, #1
_080C4D9A:
	str r1, [sp, #4]
	mov r0, sp
	bl sub_080C4078
	add sp, #0x1c
	pop {pc}
	.align 2, 0
_080C4DA8:
	.byte 0x81, 0xB0, 0x10, 0xB5, 0x85, 0xB0, 0x07, 0x93
	.byte 0x07, 0x9B, 0x08, 0x9C, 0x00, 0x90, 0x01, 0x91, 0x02, 0x92, 0x03, 0x93, 0x04, 0x94, 0x68, 0x46
	.byte 0xFF, 0xF7, 0x5A, 0xF9, 0x05, 0xB0, 0x10, 0xBC, 0x08, 0xBC, 0x01, 0xB0, 0x18, 0x47, 0x00, 0x00
	.byte 0x30, 0xB5, 0x87, 0xB0, 0x05, 0x90, 0x06, 0x91, 0x05, 0xA8, 0x69, 0x46, 0xFF, 0xF7, 0xF0, 0xF9
	.byte 0x03, 0x9A, 0x04, 0x9B, 0x9D, 0x00, 0x94, 0x0F, 0x28, 0x1C, 0x20, 0x43, 0x05, 0x1C, 0x08, 0x4C
	.byte 0x10, 0x1C, 0x20, 0x40, 0x00, 0x21, 0x08, 0x43, 0x00, 0x28, 0x01, 0xD0, 0x01, 0x20, 0x05, 0x43
	.byte 0x00, 0x98, 0x01, 0x99, 0x02, 0x9A, 0x2B, 0x1C, 0x00, 0xF0, 0x88, 0xFC, 0x07, 0xB0, 0x30, 0xBD
	.byte 0xFF, 0xFF, 0xFF, 0x3F, 0x70, 0xB5, 0xC2, 0x68, 0x46, 0x68, 0x00, 0x25, 0x00, 0x21, 0x03, 0x68
	.byte 0x01, 0x2B, 0x00, 0xD8, 0x01, 0x21, 0x00, 0x29, 0x04, 0xD0, 0xFF, 0x25, 0x80, 0x20, 0x40, 0x03
	.byte 0x02, 0x43, 0x32, 0xE0, 0x00, 0x21, 0x04, 0x2B, 0x00, 0xD1, 0x01, 0x21, 0x00, 0x29, 0x17, 0xD1
	.byte 0x00, 0x21, 0x02, 0x2B, 0x00, 0xD1, 0x01, 0x21, 0x00, 0x29, 0x01, 0xD0, 0x00, 0x22, 0x24, 0xE0
	.byte 0x00, 0x2A, 0x22, 0xD0, 0x80, 0x68, 0x7E, 0x23, 0x5B, 0x42, 0x98, 0x42, 0x06, 0xDA, 0x18, 0x1A
	.byte 0x19, 0x28, 0x01, 0xDD, 0x00, 0x22, 0x17, 0xE0, 0xC2, 0x40, 0x15, 0xE0, 0x7F, 0x28, 0x02, 0xDD
	.byte 0xFF, 0x25, 0x00, 0x22, 0x11, 0xE0, 0x05, 0x1C, 0x7F, 0x35, 0x7F, 0x20, 0x10, 0x40, 0x40, 0x28
	.byte 0x05, 0xD1, 0x80, 0x20, 0x10, 0x40, 0x00, 0x28, 0x02, 0xD0, 0x40, 0x32, 0x00, 0xE0, 0x3F, 0x32
	.byte 0x00, 0x2A, 0x01, 0xDA, 0x52, 0x08, 0x01, 0x35, 0xD2, 0x09, 0x08, 0x48, 0x02, 0x40, 0x08, 0x48
	.byte 0x04, 0x40, 0x14, 0x43, 0xFF, 0x20, 0x05, 0x40, 0xE9, 0x05, 0x06, 0x48, 0x04, 0x40, 0x0C, 0x43
	.byte 0xF1, 0x07, 0x05, 0x48, 0x04, 0x40, 0x0C, 0x43, 0x20, 0x1C, 0x70, 0xBD, 0xFF, 0xFF, 0x7F, 0x00
	.byte 0x00, 0x00, 0x80, 0xFF, 0xFF, 0xFF, 0x7F, 0x80, 0xFF, 0xFF, 0xFF, 0x7F, 0x10, 0xB5, 0x0B, 0x1C
	.byte 0x00, 0x68, 0x41, 0x02, 0x4A, 0x0A, 0x41, 0x00, 0x09, 0x0E, 0xC0, 0x0F, 0x58, 0x60, 0x00, 0x29
	.byte 0x16, 0xD1, 0x00, 0x2A, 0x02, 0xD1, 0x02, 0x20, 0x18, 0x60, 0x2B, 0xE0, 0x0C, 0x1C, 0x7E, 0x3C
	.byte 0x9C, 0x60, 0xD2, 0x01, 0x03, 0x20, 0x18, 0x60, 0x04, 0x49, 0x8A, 0x42, 0x16, 0xD8, 0x20, 0x1C
	.byte 0x52, 0x00, 0x01, 0x38, 0x8A, 0x42, 0xFB, 0xD9, 0x98, 0x60, 0x0F, 0xE0, 0xFF, 0xFF, 0xFF, 0x3F
	.byte 0xFF, 0x29, 0x0D, 0xD1, 0x00, 0x2A, 0x02, 0xD1, 0x04, 0x20, 0x18, 0x60, 0x12, 0xE0, 0x80, 0x20
	.byte 0x40, 0x03, 0x10, 0x40, 0x00, 0x28, 0x00, 0xD0, 0x01, 0x20, 0x18, 0x60, 0xDA, 0x60, 0x09, 0xE0
	.byte 0x08, 0x1C, 0x7F, 0x38, 0x98, 0x60, 0x03, 0x20, 0x18, 0x60, 0xD0, 0x01, 0x80, 0x21, 0xC9, 0x05
	.byte 0x08, 0x43, 0xD8, 0x60, 0x10, 0xBD, 0x00, 0x00, 0xF0, 0xB5, 0x47, 0x46, 0x80, 0xB4, 0x06, 0x1C
	.byte 0x0F, 0x1C, 0x15, 0x1C, 0x00, 0x20, 0x32, 0x68, 0x01, 0x2A, 0x00, 0xD8, 0x01, 0x20, 0x00, 0x28
	.byte 0x01, 0xD0, 0x30, 0x1C, 0xAA, 0xE0, 0x00, 0x21, 0x38, 0x68, 0x01, 0x28, 0x00, 0xD8, 0x01, 0x21
	.byte 0x00, 0x29, 0x37, 0xD1, 0x00, 0x21, 0x04, 0x2A, 0x00, 0xD1, 0x01, 0x21, 0x00, 0x29, 0x0D, 0xD0
	.byte 0x00, 0x21, 0x04, 0x28, 0x00, 0xD1, 0x01, 0x21, 0x00, 0x29, 0xEA, 0xD0, 0x71, 0x68, 0x78, 0x68
	.byte 0x81, 0x42, 0xE6, 0xD0, 0x00, 0x48, 0x91, 0xE0, 0x40, 0x24, 0x00, 0x03, 0x00, 0x21, 0x04, 0x28
	.byte 0x00, 0xD1, 0x01, 0x21, 0x00, 0x29, 0x1D, 0xD1, 0x00, 0x21, 0x02, 0x28, 0x00, 0xD1, 0x01, 0x21
	.byte 0x00, 0x29, 0x10, 0xD0, 0x00, 0x20, 0x02, 0x2A, 0x00, 0xD1, 0x01, 0x20, 0x00, 0x28, 0xD0, 0xD0
	.byte 0x29, 0x1C, 0x30, 0x1C, 0x1C, 0xC8, 0x1C, 0xC1, 0x00, 0x68, 0x08, 0x60, 0x70, 0x68, 0x79, 0x68
	.byte 0x08, 0x40, 0x68, 0x60, 0x71, 0xE0, 0x00, 0x21, 0x30, 0x68, 0x02, 0x28, 0x00, 0xD1, 0x01, 0x21
	.byte 0x00, 0x29, 0x01, 0xD0, 0x38, 0x1C, 0x69, 0xE0, 0xB1, 0x68, 0xBB, 0x68, 0xF2, 0x68, 0xFC, 0x68
	.byte 0xC8, 0x1A, 0x00, 0x28, 0x00, 0xDA, 0x40, 0x42, 0x1F, 0x28, 0x1F, 0xDC, 0x76, 0x68, 0x7F, 0x68
	.byte 0xB8, 0x46, 0x99, 0x42, 0x0B, 0xDD, 0x01, 0x27, 0xBC, 0x46, 0xCB, 0x1A, 0x01, 0x3B, 0x20, 0x1C
	.byte 0x67, 0x46, 0x38, 0x40, 0x64, 0x08, 0x04, 0x43, 0x00, 0x2B, 0xF7, 0xD1, 0x0B, 0x1C, 0x8B, 0x42
	.byte 0x15, 0xDD, 0x01, 0x20, 0x84, 0x46, 0x59, 0x1A, 0x01, 0x39, 0x10, 0x1C, 0x67, 0x46, 0x38, 0x40
	.byte 0x52, 0x08, 0x02, 0x43, 0x00, 0x29, 0xF7, 0xD1, 0x19, 0x1C, 0x08, 0xE0, 0x99, 0x42, 0x01, 0xDD
	.byte 0x00, 0x24, 0x01, 0xE0, 0x19, 0x1C, 0x00, 0x22, 0x76, 0x68, 0x7F, 0x68, 0xB8, 0x46, 0x46, 0x45
	.byte 0x22, 0xD0, 0x00, 0x2E, 0x01, 0xD0, 0xA3, 0x1A, 0x00, 0xE0, 0x13, 0x1B, 0x00, 0x2B, 0x04, 0xDB
	.byte 0x00, 0x20, 0x68, 0x60, 0xA9, 0x60, 0xEB, 0x60, 0x04, 0xE0, 0x01, 0x20, 0x68, 0x60, 0xA9, 0x60
	.byte 0x58, 0x42, 0xE8, 0x60, 0xE9, 0x68, 0x48, 0x1E, 0x06, 0x4A, 0x90, 0x42, 0x10, 0xD8, 0x48, 0x00
	.byte 0xE8, 0x60, 0xA9, 0x68, 0x01, 0x39, 0xA9, 0x60, 0x01, 0x1C, 0x48, 0x1E, 0x90, 0x42, 0xF6, 0xD9
	.byte 0x06, 0xE0, 0x00, 0x00, 0xFE, 0xFF, 0xFF, 0x3F, 0x6E, 0x60, 0xA9, 0x60, 0x10, 0x19, 0xE8, 0x60
	.byte 0x03, 0x20, 0x28, 0x60, 0xE9, 0x68, 0x00, 0x29, 0x07, 0xDA, 0x01, 0x20, 0x08, 0x40, 0x49, 0x08
	.byte 0x08, 0x43, 0xE8, 0x60, 0xA8, 0x68, 0x01, 0x30, 0xA8, 0x60, 0x28, 0x1C, 0x08, 0xBC, 0x98, 0x46
	.byte 0xF0, 0xBD, 0x00, 0x00, 0x10, 0xB5, 0x8E, 0xB0, 0x0C, 0x90, 0x0D, 0x91, 0x0C, 0xA8, 0x69, 0x46
	.byte 0xFF, 0xF7, 0xFC, 0xFE, 0x0D, 0xA8, 0x04, 0xAC, 0x21, 0x1C, 0xFF, 0xF7, 0xF7, 0xFE, 0x08, 0xAA
	.byte 0x68, 0x46, 0x21, 0x1C, 0xFF, 0xF7, 0x30, 0xFF, 0xFF, 0xF7, 0x94, 0xFE, 0x0E, 0xB0, 0x10, 0xBD
	.byte 0x10, 0xB5, 0x8E, 0xB0, 0x0C, 0x90, 0x0D, 0x91, 0x0C, 0xA8, 0x69, 0x46, 0xFF, 0xF7, 0xE6, 0xFE
	.byte 0x0D, 0xA8, 0x04, 0xAC, 0x21, 0x1C, 0xFF, 0xF7, 0xE1, 0xFE, 0x60, 0x68, 0x01, 0x21, 0x48, 0x40
	.byte 0x60, 0x60, 0x08, 0xAA, 0x68, 0x46, 0x21, 0x1C, 0xFF, 0xF7, 0x16, 0xFF, 0xFF, 0xF7, 0x7A, 0xFE
	.byte 0x0E, 0xB0, 0x10, 0xBD, 0xF0, 0xB5, 0x4F, 0x46, 0x46, 0x46, 0xC0, 0xB4, 0x8E, 0xB0, 0x0C, 0x90
	.byte 0x0D, 0x91, 0x0C, 0xA8, 0x69, 0x46, 0xFF, 0xF7, 0xC9, 0xFE, 0x0D, 0xA8, 0x04, 0xAC, 0x21, 0x1C
	.byte 0xFF, 0xF7, 0xC4, 0xFE, 0x6F, 0x46, 0x08, 0xA8, 0x80, 0x46, 0x00, 0x20, 0x00, 0x99, 0xC1, 0x46
	.byte 0x01, 0x29, 0x00, 0xD8, 0x01, 0x20, 0x00, 0x28, 0x2C, 0xD1, 0x00, 0x22, 0x04, 0x98, 0x01, 0x28
	.byte 0x00, 0xD8, 0x01, 0x22, 0x00, 0x2A, 0x01, 0xD0, 0x01, 0x98, 0x33, 0xE0, 0x00, 0x22, 0x04, 0x29
	.byte 0x00, 0xD1, 0x01, 0x22, 0x00, 0x2A, 0x06, 0xD0, 0x00, 0x21, 0x02, 0x28, 0x00, 0xD1, 0x01, 0x21
	.byte 0x00, 0x29, 0x0C, 0xD1, 0x16, 0xE0, 0x00, 0x22, 0x04, 0x28, 0x00, 0xD1, 0x01, 0x22, 0x00, 0x2A
	.byte 0x0A, 0xD0, 0x00, 0x20, 0x02, 0x29, 0x00, 0xD1, 0x01, 0x20, 0x00, 0x28, 0x19, 0xD0, 0x01, 0x48
	.byte 0x69, 0xE0, 0x00, 0x00, 0x40, 0x24, 0x00, 0x03, 0x00, 0x22, 0x02, 0x29, 0x00, 0xD1, 0x01, 0x22
	.byte 0x00, 0x2A, 0x08, 0xD0, 0x01, 0x98, 0x05, 0x99, 0x48, 0x40, 0x41, 0x42, 0x01, 0x43, 0xC9, 0x0F
	.byte 0x01, 0x91, 0x68, 0x46, 0x57, 0xE0, 0x00, 0x21, 0x02, 0x28, 0x00, 0xD1, 0x01, 0x21, 0x00, 0x29
	.byte 0x08, 0xD0, 0x78, 0x68, 0x05, 0x99, 0x48, 0x40, 0x41, 0x42, 0x01, 0x43, 0xC9, 0x0F, 0x05, 0x91
	.byte 0x20, 0x1C, 0x48, 0xE0, 0xF8, 0x68, 0x00, 0x21, 0x07, 0x9A, 0x00, 0x23, 0xFA, 0xF7, 0x00, 0xFE
	.byte 0x0A, 0x1C, 0x15, 0x1C, 0x06, 0x1C, 0xBC, 0x68, 0x06, 0x98, 0x24, 0x18, 0x0A, 0x94, 0x79, 0x68
	.byte 0x05, 0x98, 0x41, 0x40, 0x48, 0x42, 0x08, 0x43, 0xC0, 0x0F, 0x09, 0x90, 0x02, 0x34, 0x0A, 0x94
	.byte 0x00, 0x2A, 0x0D, 0xDA, 0x01, 0x22, 0x80, 0x21, 0x09, 0x06, 0x01, 0x34, 0x28, 0x1C, 0x10, 0x40
	.byte 0x00, 0x28, 0x01, 0xD0, 0x76, 0x08, 0x0E, 0x43, 0x6D, 0x08, 0x00, 0x2D, 0xF5, 0xDB, 0x0A, 0x94
	.byte 0x14, 0x48, 0x85, 0x42, 0x0F, 0xD8, 0x80, 0x24, 0x24, 0x06, 0x01, 0x23, 0x02, 0x1C, 0x0A, 0x99
	.byte 0x01, 0x39, 0x6D, 0x00, 0x30, 0x1C, 0x20, 0x40, 0x00, 0x28, 0x00, 0xD0, 0x1D, 0x43, 0x76, 0x00
	.byte 0x95, 0x42, 0xF5, 0xD9, 0x0A, 0x91, 0x7F, 0x20, 0x28, 0x40, 0x40, 0x28, 0x06, 0xD1, 0x80, 0x20
	.byte 0x28, 0x40, 0x00, 0x28, 0x01, 0xD1, 0x00, 0x2E, 0x00, 0xD0, 0x40, 0x35, 0x0B, 0x95, 0x03, 0x20
	.byte 0x41, 0x46, 0x08, 0x60, 0x48, 0x46, 0xFF, 0xF7, 0xCD, 0xFD, 0x0E, 0xB0, 0x18, 0xBC, 0x98, 0x46
	.byte 0xA1, 0x46, 0xF0, 0xBD, 0xFF, 0xFF, 0xFF, 0x3F, 0x70, 0xB5, 0x8A, 0xB0, 0x08, 0x90, 0x09, 0x91
	.byte 0x08, 0xA8, 0x69, 0x46, 0xFF, 0xF7, 0x1A, 0xFE, 0x09, 0xA8, 0x04, 0xAD, 0x29, 0x1C, 0xFF, 0xF7
	.byte 0x15, 0xFE, 0x6C, 0x46, 0x00, 0x20, 0x00, 0x9B, 0x01, 0x2B, 0x00, 0xD8, 0x01, 0x20, 0x00, 0x28
	.byte 0x01, 0xD0, 0x69, 0x46, 0x58, 0xE0, 0x00, 0x20, 0x04, 0x9A, 0x16, 0x1C, 0x01, 0x2A, 0x00, 0xD8
	.byte 0x01, 0x20, 0x00, 0x28, 0x01, 0xD0, 0x29, 0x1C, 0x4E, 0xE0, 0x01, 0x98, 0x05, 0x99, 0x48, 0x40
	.byte 0x01, 0x90, 0x00, 0x20, 0x04, 0x2B, 0x00, 0xD1, 0x01, 0x20, 0x00, 0x28, 0x05, 0xD1, 0x00, 0x20
	.byte 0x02, 0x2B, 0x00, 0xD1, 0x01, 0x20, 0x00, 0x28, 0x08, 0xD0, 0x20, 0x68, 0x21, 0x1C, 0xB0, 0x42
	.byte 0x3A, 0xD1, 0x01, 0x49, 0x38, 0xE0, 0x00, 0x00, 0x40, 0x24, 0x00, 0x03, 0x00, 0x21, 0x04, 0x2A
	.byte 0x00, 0xD1, 0x01, 0x21, 0x00, 0x29, 0x03, 0xD0, 0x03, 0x90, 0x02, 0x90, 0x69, 0x46, 0x2B, 0xE0
	.byte 0x00, 0x20, 0x02, 0x2A, 0x00, 0xD1, 0x01, 0x20, 0x00, 0x28, 0x02, 0xD0, 0x04, 0x20, 0x20, 0x60
	.byte 0x21, 0xE0, 0xA1, 0x68, 0x06, 0x98, 0x08, 0x1A, 0xA0, 0x60, 0xE2, 0x68, 0x07, 0x9B, 0x9A, 0x42
	.byte 0x02, 0xD2, 0x52, 0x00, 0x01, 0x38, 0xA0, 0x60, 0x80, 0x20, 0xC0, 0x05, 0x00, 0x21, 0x9A, 0x42
	.byte 0x01, 0xD3, 0x01, 0x43, 0xD2, 0x1A, 0x40, 0x08, 0x52, 0x00, 0x00, 0x28, 0xF7, 0xD1, 0x7F, 0x20
	.byte 0x08, 0x40, 0x40, 0x28, 0x06, 0xD1, 0x80, 0x20, 0x08, 0x40, 0x00, 0x28, 0x01, 0xD1, 0x00, 0x2A
	.byte 0x00, 0xD0, 0x40, 0x31, 0xE1, 0x60, 0x21, 0x1C, 0x08, 0x1C, 0xFF, 0xF7, 0x53, 0xFD, 0x0A, 0xB0
	.byte 0x70, 0xBD, 0x00, 0x00, 0x10, 0xB5, 0x04, 0x1C, 0x00, 0x20, 0x22, 0x68, 0x01, 0x2A, 0x00, 0xD8
	.byte 0x01, 0x20, 0x00, 0x28, 0x06, 0xD1, 0x00, 0x20, 0x0B, 0x68, 0x01, 0x2B, 0x00, 0xD8, 0x01, 0x20
	.byte 0x00, 0x28, 0x01, 0xD0, 0x01, 0x20, 0x5E, 0xE0, 0x00, 0x20, 0x04, 0x2A, 0x00, 0xD1, 0x01, 0x20
	.byte 0x00, 0x28, 0x09, 0xD0, 0x00, 0x20, 0x04, 0x2B, 0x00, 0xD1, 0x01, 0x20, 0x00, 0x28, 0x03, 0xD0
	.byte 0x48, 0x68, 0x61, 0x68, 0x40, 0x1A, 0x4E, 0xE0, 0x00, 0x22, 0x20, 0x68, 0x04, 0x28, 0x00, 0xD1
	.byte 0x01, 0x22, 0x00, 0x2A, 0x24, 0xD1, 0x00, 0x22, 0x04, 0x2B, 0x00, 0xD1, 0x01, 0x22, 0x00, 0x2A
	.byte 0x06, 0xD0, 0x48, 0x68, 0x01, 0x21, 0x49, 0x42, 0x00, 0x28, 0x1E, 0xD0, 0x01, 0x21, 0x1C, 0xE0
	.byte 0x00, 0x22, 0x02, 0x28, 0x00, 0xD1, 0x01, 0x22, 0x00, 0x2A, 0x05, 0xD0, 0x00, 0x22, 0x02, 0x2B
	.byte 0x00, 0xD1, 0x01, 0x22, 0x00, 0x2A, 0x2D, 0xD1, 0x00, 0x22, 0x02, 0x28, 0x00, 0xD1, 0x01, 0x22
	.byte 0x00, 0x2A, 0xE6, 0xD1, 0x00, 0x20, 0x02, 0x2B, 0x00, 0xD1, 0x01, 0x20, 0x00, 0x28, 0x06, 0xD0
	.byte 0x60, 0x68, 0x01, 0x21, 0x00, 0x28, 0x00, 0xD0, 0x02, 0x39, 0x08, 0x1C, 0x1B, 0xE0, 0x63, 0x68
	.byte 0x48, 0x68, 0x83, 0x42, 0x04, 0xD0, 0x01, 0x20, 0x00, 0x2B, 0x14, 0xD0, 0x02, 0x38, 0x12, 0xE0
	.byte 0xA2, 0x68, 0x88, 0x68, 0x82, 0x42, 0xF6, 0xDC, 0x82, 0x42, 0x05, 0xDA, 0x01, 0x20, 0x40, 0x42
	.byte 0x00, 0x2B, 0x08, 0xD0, 0x01, 0x20, 0x06, 0xE0, 0xE0, 0x68, 0xC9, 0x68, 0x88, 0x42, 0xEA, 0xD8
	.byte 0x88, 0x42, 0xF3, 0xD3, 0x00, 0x20, 0x10, 0xBD, 0x10, 0xB5, 0x8A, 0xB0, 0x08, 0x90, 0x09, 0x91
	.byte 0x08, 0xA8, 0x69, 0x46, 0xFF, 0xF7, 0x32, 0xFD, 0x09, 0xA8, 0x04, 0xAC, 0x21, 0x1C, 0xFF, 0xF7
	.byte 0x2D, 0xFD, 0x68, 0x46, 0x21, 0x1C, 0xFF, 0xF7, 0x7D, 0xFF, 0x0A, 0xB0, 0x10, 0xBD, 0x00, 0x00
	.byte 0x10, 0xB5, 0x8A, 0xB0, 0x08, 0x90, 0x09, 0x91, 0x08, 0xA8, 0x69, 0x46, 0xFF, 0xF7, 0x1E, 0xFD
	.byte 0x09, 0xA8, 0x04, 0xAC, 0x21, 0x1C, 0xFF, 0xF7, 0x19, 0xFD, 0x00, 0x21, 0x00, 0x98, 0x01, 0x28
	.byte 0x00, 0xD8, 0x01, 0x21, 0x00, 0x29, 0x06, 0xD1, 0x00, 0x21, 0x04, 0x98, 0x01, 0x28, 0x00, 0xD8
	.byte 0x01, 0x21, 0x00, 0x29, 0x01, 0xD0, 0x01, 0x20, 0x03, 0xE0, 0x68, 0x46, 0x21, 0x1C, 0xFF, 0xF7
	.byte 0x59, 0xFF, 0x0A, 0xB0, 0x10, 0xBD, 0x00, 0x00, 0x10, 0xB5, 0x8A, 0xB0, 0x08, 0x90, 0x09, 0x91
	.byte 0x08, 0xA8, 0x69, 0x46, 0xFF, 0xF7, 0xFA, 0xFC, 0x09, 0xA8, 0x04, 0xAC, 0x21, 0x1C, 0xFF, 0xF7
	.byte 0xF5, 0xFC, 0x00, 0x21, 0x00, 0x98, 0x01, 0x28, 0x00, 0xD8, 0x01, 0x21, 0x00, 0x29, 0x06, 0xD1
	.byte 0x00, 0x21, 0x04, 0x98, 0x01, 0x28, 0x00, 0xD8, 0x01, 0x21, 0x00, 0x29, 0x01, 0xD0, 0x01, 0x20
	.byte 0x03, 0xE0, 0x68, 0x46, 0x21, 0x1C, 0xFF, 0xF7, 0x35, 0xFF, 0x0A, 0xB0, 0x10, 0xBD, 0x00, 0x00
	.byte 0x10, 0xB5, 0x8A, 0xB0, 0x08, 0x90, 0x09, 0x91, 0x08, 0xA8, 0x69, 0x46, 0xFF, 0xF7, 0xD6, 0xFC
	.byte 0x09, 0xA8, 0x04, 0xAC, 0x21, 0x1C, 0xFF, 0xF7, 0xD1, 0xFC, 0x00, 0x21, 0x00, 0x98, 0x01, 0x28
	.byte 0x00, 0xD8, 0x01, 0x21, 0x00, 0x29, 0x06, 0xD1, 0x00, 0x21, 0x04, 0x98, 0x01, 0x28, 0x00, 0xD8
	.byte 0x01, 0x21, 0x00, 0x29, 0x02, 0xD0, 0x01, 0x20, 0x40, 0x42, 0x03, 0xE0, 0x68, 0x46, 0x21, 0x1C
	.byte 0xFF, 0xF7, 0x10, 0xFF, 0x0A, 0xB0, 0x10, 0xBD, 0x10, 0xB5, 0x8A, 0xB0, 0x08, 0x90, 0x09, 0x91
	.byte 0x08, 0xA8, 0x69, 0x46, 0xFF, 0xF7, 0xB2, 0xFC, 0x09, 0xA8, 0x04, 0xAC, 0x21, 0x1C, 0xFF, 0xF7
	.byte 0xAD, 0xFC, 0x00, 0x21, 0x00, 0x98, 0x01, 0x28, 0x00, 0xD8, 0x01, 0x21, 0x00, 0x29, 0x06, 0xD1
	.byte 0x00, 0x21, 0x04, 0x98, 0x01, 0x28, 0x00, 0xD8, 0x01, 0x21, 0x00, 0x29, 0x02, 0xD0, 0x01, 0x20
	.byte 0x40, 0x42, 0x03, 0xE0, 0x68, 0x46, 0x21, 0x1C, 0xFF, 0xF7, 0xEC, 0xFE, 0x0A, 0xB0, 0x10, 0xBD
	.byte 0x10, 0xB5, 0x8A, 0xB0, 0x08, 0x90, 0x09, 0x91, 0x08, 0xA8, 0x69, 0x46, 0xFF, 0xF7, 0x8E, 0xFC
	.byte 0x09, 0xA8, 0x04, 0xAC, 0x21, 0x1C, 0xFF, 0xF7, 0x89, 0xFC, 0x00, 0x21, 0x00, 0x98, 0x01, 0x28
	.byte 0x00, 0xD8, 0x01, 0x21, 0x00, 0x29, 0x06, 0xD1, 0x00, 0x21, 0x04, 0x98, 0x01, 0x28, 0x00, 0xD8
	.byte 0x01, 0x21, 0x00, 0x29, 0x01, 0xD0, 0x01, 0x20, 0x03, 0xE0, 0x68, 0x46, 0x21, 0x1C, 0xFF, 0xF7
	.byte 0xC9, 0xFE, 0x0A, 0xB0, 0x10, 0xBD, 0x00, 0x00, 0x10, 0xB5, 0x8A, 0xB0, 0x08, 0x90, 0x09, 0x91
	.byte 0x08, 0xA8, 0x69, 0x46, 0xFF, 0xF7, 0x6A, 0xFC, 0x09, 0xA8, 0x04, 0xAC, 0x21, 0x1C, 0xFF, 0xF7
	.byte 0x65, 0xFC, 0x00, 0x21, 0x00, 0x98, 0x01, 0x28, 0x00, 0xD8, 0x01, 0x21, 0x00, 0x29, 0x06, 0xD1
	.byte 0x00, 0x21, 0x04, 0x98, 0x01, 0x28, 0x00, 0xD8, 0x01, 0x21, 0x00, 0x29, 0x01, 0xD0, 0x01, 0x20
	.byte 0x03, 0xE0, 0x68, 0x46, 0x21, 0x1C, 0xFF, 0xF7, 0xA5, 0xFE, 0x0A, 0xB0, 0x10, 0xBD, 0x00, 0x00
	.byte 0x00, 0xB5, 0x84, 0xB0, 0x01, 0x1C, 0x03, 0x20, 0x00, 0x90, 0xCA, 0x0F, 0x01, 0x92, 0x00, 0x29
	.byte 0x02, 0xD1, 0x02, 0x20, 0x00, 0x90, 0x1B, 0xE0, 0x1E, 0x20, 0x02, 0x90, 0x00, 0x2A, 0x0A, 0xD0
	.byte 0x80, 0x20, 0x00, 0x06, 0x81, 0x42, 0x03, 0xD1, 0x00, 0x48, 0x14, 0xE0, 0x00, 0x00, 0x00, 0xCF
	.byte 0x48, 0x42, 0x03, 0x90, 0x00, 0xE0, 0x03, 0x91, 0x03, 0x9A, 0x08, 0x4B, 0x9A, 0x42, 0x07, 0xD8
	.byte 0x02, 0x99, 0x50, 0x00, 0x01, 0x39, 0x02, 0x1C, 0x98, 0x42, 0xFA, 0xD9, 0x02, 0x91, 0x03, 0x90
	.byte 0x68, 0x46, 0xFF, 0xF7, 0xC7, 0xFB, 0x04, 0xB0, 0x00, 0xBD, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0x3F
	.byte 0x00, 0xB5, 0x85, 0xB0, 0x04, 0x90, 0x04, 0xA8, 0x69, 0x46, 0xFF, 0xF7, 0x17, 0xFC, 0x00, 0x21
	.byte 0x00, 0x98, 0x02, 0x28, 0x00, 0xD1, 0x01, 0x21, 0x00, 0x29, 0x16, 0xD1, 0x00, 0x21, 0x01, 0x28
	.byte 0x00, 0xD8, 0x01, 0x21, 0x00, 0x29, 0x10, 0xD1, 0x00, 0x21, 0x04, 0x28, 0x00, 0xD1, 0x01, 0x21
	.byte 0x00, 0x29, 0x07, 0xD0, 0x01, 0x98, 0x02, 0x49, 0x00, 0x28, 0x12, 0xD0, 0x01, 0x31, 0x10, 0xE0
	.byte 0xFF, 0xFF, 0xFF, 0x7F, 0x02, 0x99, 0x00, 0x29, 0x01, 0xDA, 0x00, 0x20, 0x0A, 0xE0, 0x1E, 0x29
	.byte 0xF0, 0xDC, 0x1E, 0x20, 0x40, 0x1A, 0x03, 0x99, 0xC1, 0x40, 0x01, 0x98, 0x00, 0x28, 0x00, 0xD0
	.byte 0x49, 0x42, 0x08, 0x1C, 0x05, 0xB0, 0x00, 0xBD, 0x00, 0xB5, 0x85, 0xB0, 0x04, 0x90, 0x04, 0xA8
	.byte 0x69, 0x46, 0xFF, 0xF7, 0xE3, 0xFB, 0x00, 0x21, 0x01, 0x98, 0x00, 0x28, 0x00, 0xD1, 0x01, 0x21
	.byte 0x01, 0x91, 0x68, 0x46, 0xFF, 0xF7, 0x7E, 0xFB, 0x05, 0xB0, 0x00, 0xBD, 0x00, 0xB5, 0x84, 0xB0
	.byte 0x00, 0x90, 0x01, 0x91, 0x02, 0x92, 0x03, 0x93, 0x68, 0x46, 0xFF, 0xF7, 0x73, 0xFB, 0x04, 0xB0
	.byte 0x00, 0xBD, 0x00, 0x00, 0x70, 0xB5, 0x86, 0xB0, 0x05, 0x90, 0x05, 0xA8, 0x01, 0xA9, 0xFF, 0xF7
	.byte 0xC5, 0xFB, 0x01, 0x98, 0x02, 0x99, 0x03, 0x9A, 0x04, 0x9B, 0x00, 0x24, 0x9E, 0x08, 0xA5, 0x07
	.byte 0x34, 0x1C, 0x2C, 0x43, 0x9B, 0x07, 0x00, 0x94, 0xFF, 0xF7, 0x26, 0xFB, 0x06, 0xB0, 0x70, 0xBD

	thumb_func_start sub_080C5760
sub_080C5760: @ 0x080C5760
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	adds r5, r0, #0
	cmp r2, #0
	beq _080C5790
	movs r0, #0x20
	subs r0, r0, r2
	cmp r0, #0
	bgt _080C577C
	movs r4, #0
	rsbs r0, r0, #0
	adds r3, r6, #0
	lsrs r3, r0
	b _080C578C
_080C577C:
	adds r1, r6, #0
	lsls r1, r0
	adds r4, r6, #0
	lsrs r4, r2
	adds r0, r5, #0
	lsrs r0, r2
	adds r3, r0, #0
	orrs r3, r1
_080C578C:
	adds r1, r4, #0
	adds r0, r3, #0
_080C5790:
	pop {r4, r5, r6, pc}
	.align 2, 0

	thumb_func_start sub_080C5794
sub_080C5794: @ 0x080C5794
	push {r4, lr}
	rsbs r2, r0, #0
	adds r3, r2, #0
	rsbs r1, r1, #0
	cmp r2, #0
	beq _080C57A2
	subs r1, #1
_080C57A2:
	adds r4, r1, #0
	adds r1, r4, #0
	adds r0, r3, #0
	pop {r4, pc}
	.align 2, 0

