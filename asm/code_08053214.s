	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08053214
sub_08053214: @ 0x08053214
	ldr r1, _08053224 @ =0x0203A4F0
	movs r0, #2
	ldrb r1, [r1, #2]
	ands r0, r1
	cmp r0, #0
	bne _08053228
	movs r0, #0
	b _0805322A
	.align 2, 0
_08053224: .4byte 0x0203A4F0
_08053228:
	movs r0, #1
_0805322A:
	bx lr

	thumb_func_start sub_0805322C
sub_0805322C: @ 0x0805322C
	ldr r3, _0805324C @ =0x030014D8
	ldr r2, [r0]
	ldr r1, [r0, #4]
	ldr r0, [r2, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	lsrs r0, r0, #8
	movs r1, #1
	ands r0, r1
	adds r2, #0x23
	adds r2, r2, r0
	ldrb r0, [r2]
	strh r0, [r3]
	subs r0, #1
	bx lr
	.align 2, 0
_0805324C: .4byte 0x030014D8

	thumb_func_start sub_08053250
sub_08053250: @ 0x08053250
	push {lr}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x8b
	bne _08053290
	adds r0, r1, #0
	bl GetItemIid
	cmp r0, #0x35
	beq _08053280
	cmp r0, #0x35
	bgt _08053272
	cmp r0, #0x34
	beq _08053278
	b _08053290
_08053272:
	cmp r0, #0x36
	beq _08053288
	b _08053290
_08053278:
	ldr r0, _0805327C @ =0x081DA224
	b _08053292
	.align 2, 0
_0805327C: .4byte 0x081DA224
_08053280:
	ldr r0, _08053284 @ =0x081DA204
	b _08053292
	.align 2, 0
_08053284: .4byte 0x081DA204
_08053288:
	ldr r0, _0805328C @ =0x081DA244
	b _08053292
	.align 2, 0
_0805328C: .4byte 0x081DA244
_08053290:
	movs r0, #0
_08053292:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08053298
sub_08053298: @ 0x08053298
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r0, #0
	cmp r0, #0x40
	beq _080532B4
	cmp r0, #0x40
	ble _080532BC
	cmp r1, #0x80
	beq _080532B0
	cmp r1, #0xc0
	beq _080532B8
	b _080532BC
_080532B0:
	movs r0, #1
	b _080532BE
_080532B4:
	movs r0, #2
	b _080532BE
_080532B8:
	movs r0, #3
	b _080532BE
_080532BC:
	movs r0, #0
_080532BE:
	bx lr

	thumb_func_start sub_080532C0
sub_080532C0: @ 0x080532C0
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r4, r1, #0x10
	lsrs r4, r4, #0x10
	bl sub_08054678
	ldr r1, _080532E8 @ =0x0203E08E
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r4, [r0]
	bl sub_08054024
	adds r0, r5, #0
	movs r1, #6
	bl sub_08054594
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080532E8: .4byte 0x0203E08E

	thumb_func_start sub_080532EC
sub_080532EC: @ 0x080532EC
	ldr r1, _08053308 @ =0x0203E036
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r2, [r0]
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08053310
	ldr r0, _0805330C @ =0x00000FFF
	ands r0, r2
	b _08053312
	.align 2, 0
_08053308: .4byte 0x0203E036
_0805330C: .4byte 0x00000FFF
_08053310:
	adds r0, r1, #0
_08053312:
	bx lr

	thumb_func_start sub_08053314
sub_08053314: @ 0x08053314
	ldr r1, _08053334 @ =0x0203E036
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r2, [r0]
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0805333C
	ldr r0, _08053338 @ =0xFFFFF000
	ands r0, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	b _0805333E
	.align 2, 0
_08053334: .4byte 0x0203E036
_08053338: .4byte 0xFFFFF000
_0805333C:
	movs r0, #0
_0805333E:
	bx lr

	thumb_func_start sub_08053340
sub_08053340: @ 0x08053340
	ldr r1, _08053350 @ =0x0203E062
	lsls r0, r0, #1
	adds r0, r0, r1
	ldr r1, _08053354 @ =0x00000FFF
	ldrh r0, [r0]
	ands r1, r0
	adds r0, r1, #0
	bx lr
	.align 2, 0
_08053350: .4byte 0x0203E062
_08053354: .4byte 0x00000FFF

	thumb_func_start sub_08053358
sub_08053358: @ 0x08053358
	ldr r1, _0805336C @ =0x0203E062
	lsls r0, r0, #1
	adds r0, r0, r1
	ldr r1, _08053370 @ =0xFFFFF000
	ldrh r0, [r0]
	ands r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r1, #0
	bx lr
	.align 2, 0
_0805336C: .4byte 0x0203E062
_08053370: .4byte 0xFFFFF000

	thumb_func_start sub_08053374
sub_08053374: @ 0x08053374
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r5, r4, #0
	adds r0, r4, #0
	bl GetItemIid
	cmp r0, #0x7c
	beq _080533A8
	adds r0, r4, #0
	bl GetItemIid
	cmp r0, #0x7d
	beq _080533A8
	adds r0, r4, #0
	bl GetItemIid
	cmp r0, #0x7e
	beq _080533A8
	adds r0, r5, #0
	bl GetItemIid
	cmp r0, #0x7f
	beq _080533A8
	movs r0, #0
	b _080533AA
_080533A8:
	movs r0, #1
_080533AA:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_080533B0
sub_080533B0: @ 0x080533B0
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r5, r4, #0
	adds r0, r4, #0
	bl GetItemIid
	cmp r0, #0x84
	beq _080533E4
	adds r0, r4, #0
	bl GetItemIid
	cmp r0, #0x85
	beq _080533E4
	adds r0, r4, #0
	bl GetItemIid
	cmp r0, #0x86
	beq _080533E4
	adds r0, r5, #0
	bl GetItemIid
	cmp r0, #0x3c
	beq _080533E4
	movs r0, #0
	b _080533E6
_080533E4:
	movs r0, #1
_080533E6:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_080533EC
sub_080533EC: @ 0x080533EC
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x13
	bgt _08053424
	ldr r1, _08053418 @ =0x0203E036
	lsls r0, r2, #1
	adds r0, r0, r1
_080533FA:
	movs r3, #0
	ldrsh r1, [r0, r3]
	cmp r1, #0
	beq _08053412
	cmp r1, #1
	beq _08053412
	cmp r1, #2
	beq _08053412
	cmp r1, #3
	beq _08053412
	cmp r1, #9
	bne _0805341C
_08053412:
	movs r0, #1
	b _08053426
	.align 2, 0
_08053418: .4byte 0x0203E036
_0805341C:
	adds r0, #4
	adds r2, #2
	cmp r2, #0x13
	ble _080533FA
_08053424:
	movs r0, #0
_08053426:
	bx lr

	thumb_func_start sub_08053428
sub_08053428: @ 0x08053428
	ldr r1, _08053430 @ =0x0203E0EC
	movs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_08053430: .4byte 0x0203E0EC

	thumb_func_start sub_08053434
sub_08053434: @ 0x08053434
	ldr r1, _0805343C @ =0x0203E0EC
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_0805343C: .4byte 0x0203E0EC

	thumb_func_start sub_08053440
sub_08053440: @ 0x08053440
	ldr r0, _0805344C @ =0x0203E0EC
	ldr r0, [r0]
	cmp r0, #0
	beq _08053450
	movs r0, #1
	b _08053452
	.align 2, 0
_0805344C: .4byte 0x0203E0EC
_08053450:
	movs r0, #0
_08053452:
	bx lr

	thumb_func_start sub_08053454
sub_08053454: @ 0x08053454
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	movs r2, #0

	thumb_func_start sub_08053460
sub_08053460: @ 0x08053460
	ldr r0, _080534C0 @ =0x03004830
	str r2, [r0]
	ldr r1, _080534C4 @ =0x02000000
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r7, [r0]
	adds r2, #1
	mov sb, r2
	cmp r7, #0
	bne _08053478
	bl _08053EEA
_08053478:
	movs r0, #0xf0
	lsls r0, r0, #8
	ldrh r1, [r7, #0xc]
	ands r1, r0
	mov r8, r1
	cmp r1, #0
	bne _0805348A
	bl _08053EEA
_0805348A:
	movs r0, #0x80
	lsls r0, r0, #5
	ands r0, r1
	cmp r0, #0
	bne _08053498
	bl sub_08053D22
_08053498:
	ldrb r0, [r7, #0x14]
	cmp r0, #0
	bne _080534A2
	bl _08053D18
_080534A2:
	subs r1, r0, #1
	adds r2, r7, #0
	adds r2, #0x15
	adds r1, r2, r1
	ldrb r1, [r1]
	adds r3, r0, #0
	cmp r1, #0x52
	bls _080534B6
	bl _08053D06
_080534B6:
	lsls r0, r1, #2
	ldr r1, _080534C8 @ =_080534CC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080534C0: .4byte 0x03004830
_080534C4: .4byte 0x02000000
_080534C8: .4byte _080534CC
_080534CC: @ jump table
	.4byte _08053D06 @ case 0
	.4byte _08053618 @ case 1
	.4byte _0805366C @ case 2
	.4byte _08053680 @ case 3
	.4byte _080536A6 @ case 4
	.4byte _0805372C @ case 5
	.4byte _08053790 @ case 6
	.4byte _08053D06 @ case 7
	.4byte _080537C0 @ case 8
	.4byte _080537C0 @ case 9
	.4byte _080537C0 @ case 10
	.4byte _080537C0 @ case 11
	.4byte _080537C0 @ case 12
	.4byte _0805385A @ case 13
	.4byte _08053D06 @ case 14
	.4byte _08053D06 @ case 15
	.4byte _08053D06 @ case 16
	.4byte _08053D06 @ case 17
	.4byte _08053D06 @ case 18
	.4byte _08053A08 @ case 19
	.4byte _08053A38 @ case 20
	.4byte _08053A4C @ case 21
	.4byte _08053D06 @ case 22
	.4byte _08053D06 @ case 23
	.4byte _08053A60 @ case 24
	.4byte _08053C78 @ case 25
	.4byte _08053A9C @ case 26
	.4byte _08053C78 @ case 27
	.4byte _08053C78 @ case 28
	.4byte _08053C78 @ case 29
	.4byte _08053C78 @ case 30
	.4byte _08053C78 @ case 31
	.4byte _08053C78 @ case 32
	.4byte _08053C78 @ case 33
	.4byte _08053C78 @ case 34
	.4byte _08053C78 @ case 35
	.4byte _08053C78 @ case 36
	.4byte _08053C78 @ case 37
	.4byte _08053B1C @ case 38
	.4byte _08053B32 @ case 39
	.4byte _08053C78 @ case 40
	.4byte _08053C78 @ case 41
	.4byte _08053C78 @ case 42
	.4byte _08053C78 @ case 43
	.4byte _08053B48 @ case 44
	.4byte _08053B5C @ case 45
	.4byte _08053BA6 @ case 46
	.4byte _08053BBC @ case 47
	.4byte _08053BD2 @ case 48
	.4byte _08053BE8 @ case 49
	.4byte _08053BFE @ case 50
	.4byte _08053C78 @ case 51
	.4byte _08053C78 @ case 52
	.4byte _08053C78 @ case 53
	.4byte _08053C78 @ case 54
	.4byte _08053C78 @ case 55
	.4byte _08053C78 @ case 56
	.4byte _08053C12 @ case 57
	.4byte _08053C78 @ case 58
	.4byte _08053C78 @ case 59
	.4byte _08053C78 @ case 60
	.4byte _08053C36 @ case 61
	.4byte _08053C78 @ case 62
	.4byte _08053C78 @ case 63
	.4byte _08053C78 @ case 64
	.4byte _08053C78 @ case 65
	.4byte _08053C78 @ case 66
	.4byte _08053C78 @ case 67
	.4byte _08053C78 @ case 68
	.4byte _08053C78 @ case 69
	.4byte _08053C78 @ case 70
	.4byte _08053C68 @ case 71
	.4byte _08053C78 @ case 72
	.4byte _08053C78 @ case 73
	.4byte _08053C78 @ case 74
	.4byte _08053C78 @ case 75
	.4byte _08053C78 @ case 76
	.4byte _08053C78 @ case 77
	.4byte _08053C70 @ case 78
	.4byte _08053C78 @ case 79
	.4byte _08053D06 @ case 80
	.4byte _08053C86 @ case 81
	.4byte _08053CAA @ case 82
_08053618:
	ldr r0, _08053624 @ =0x02000024
	ldr r0, [r0]
	cmp r0, #1
	bne _08053628
	ldr r0, [r7, #0x24]
	b _08053D04
	.align 2, 0
_08053624: .4byte 0x02000024
_08053628:
	ldrh r1, [r7, #0x10]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _08053634
	b _08053D00
_08053634:
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0805363E
	b _08053D06
_0805363E:
	bl sub_0804D574
	cmp r0, #1
	beq _08053648
	b _08053D06
_08053648:
	ldr r0, _08053668 @ =0x0000FFF2
	ldrh r2, [r7, #0x10]
	ands r0, r2
	strh r0, [r7, #0x10]
	ldr r0, [r7, #0x20]
	adds r0, #4
	str r0, [r7, #0x20]
	bl sub_08050808
	cmp r0, #0
	bne _08053660
	b _08053D06
_08053660:
	movs r0, #0
	bl sub_08050814
	b _08053D06
	.align 2, 0
_08053668: .4byte 0x0000FFF2
_0805366C:
	ldrh r1, [r7, #0x10]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08053678
	b _08053D06
_08053678:
	ldr r0, _0805367C @ =0x0000FFFE
	b _08053CFC
	.align 2, 0
_0805367C: .4byte 0x0000FFFE
_08053680:
	ldrh r1, [r7, #0x10]
	movs r2, #0x20
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _080536A2
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_08054664
	cmp r0, #0
	bne _080536A2
	adds r0, r7, #0
	bl sub_0806337C
_080536A2:
	ldrh r1, [r7, #0x10]
	b _08053CEE
_080536A6:
	ldrh r1, [r7, #0x10]
	movs r2, #0x20
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _080536BC
	adds r0, r2, #0
	orrs r0, r1
	movs r1, #0x40
	orrs r0, r1
	strh r0, [r7, #0x10]
_080536BC:
	ldrh r2, [r7, #0x10]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	bne _080536C8
	b _08053D06
_080536C8:
	ldr r1, _08053724 @ =0x0000FFDF
	ands r1, r2
	ldr r0, _08053728 @ =0x0000FFBF
	ands r1, r0
	ldr r0, [r7, #0x20]
	adds r0, #4
	str r0, [r7, #0x20]
	movs r5, #9
	movs r6, #0
	orrs r1, r5
	strh r1, [r7, #0x10]
	adds r0, r7, #0
	bl sub_080547A8
	adds r2, r0, #0
	adds r0, r7, #0
	str r2, [sp]
	bl sub_08054804
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	mov r4, r8
	adds r0, r4, #0
	bl sub_0805468C
	ldr r2, [sp]
	cmp r0, #1
	beq _08053704
	b _08053D06
_08053704:
	cmp r2, #0
	bne _0805370A
	b _08053D06
_0805370A:
	ldrh r0, [r2, #0x10]
	orrs r0, r5
	strh r0, [r2, #0x10]
	adds r0, r7, #0
	str r2, [sp]
	bl sub_08054664
	cmp r0, #0
	beq _0805371E
	b _08053D06
_0805371E:
	adds r0, r4, #0
	b _0805384A
	.align 2, 0
_08053724: .4byte 0x0000FFDF
_08053728: .4byte 0x0000FFBF
_0805372C:
	ldrh r1, [r7, #0x10]
	movs r2, #0x20
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08053742
	adds r0, r2, #0
	orrs r0, r1
	movs r1, #0x40
	orrs r0, r1
	strh r0, [r7, #0x10]
_08053742:
	ldrh r2, [r7, #0x10]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	bne _0805374E
	b _08053D06
_0805374E:
	ldr r1, _08053788 @ =0x0000FFDF
	ands r1, r2
	ldr r0, _0805378C @ =0x0000FFBF
	ands r1, r0
	ldr r0, [r7, #0x20]
	adds r0, #4
	str r0, [r7, #0x20]
	movs r0, #9
	orrs r1, r0
	strh r1, [r7, #0x10]
	adds r0, r7, #0
	bl sub_08054664
	cmp r0, #0
	beq _0805376E
	b _08053D06
_0805376E:
	adds r0, r7, #0
	bl sub_08055888
	bl sub_08050808
	cmp r0, #0
	bne _0805377E
	b _08053D06
_0805377E:
	movs r0, #2
	bl sub_08050814
	b _08053D06
	.align 2, 0
_08053788: .4byte 0x0000FFDF
_0805378C: .4byte 0x0000FFBF
_08053790:
	adds r0, r7, #0
	bl sub_080547A8
	adds r2, r0, #0
	cmp r2, #0
	bne _0805379E
	b _08053D06
_0805379E:
	str r2, [sp]
	bl sub_08054828
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	movs r0, #1
	rsbs r0, r0, #0
	ldr r2, [sp]
	cmp r8, r0
	bne _080537B6
	b _08053D06
_080537B6:
	movs r0, #2
	ldrh r3, [r2, #0x10]
	orrs r0, r3
	strh r0, [r2, #0x10]
	b _08053D06
_080537C0:
	adds r0, r7, #0
	bl sub_08054664
	cmp r0, #0
	beq _080537CC
	b _08053D06
_080537CC:
	adds r0, r7, #0
	bl sub_080547A8
	adds r2, r0, #0
	adds r0, r7, #0
	str r2, [sp]
	bl sub_08054804
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	bl sub_0805468C
	ldr r2, [sp]
	cmp r0, #0
	bne _0805382E
	adds r0, r2, #0
	bl sub_08067CC4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r2, [sp]
	cmp r0, #2
	beq _0805382E
	adds r0, r7, #0
	bl sub_08054678
	adds r1, r0, #0
	ldrh r0, [r7, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl sub_08053314
	movs r1, #0x80
	lsls r1, r1, #5
	ands r1, r0
	ldr r2, [sp]
	cmp r1, #0
	beq _08053824
	adds r0, r2, #0
	bl sub_080639C8
	b _0805382C
_08053824:
	adds r0, r2, #0
	str r2, [sp]
	bl sub_08062580
_0805382C:
	ldr r2, [sp]
_0805382E:
	cmp r2, #0
	bne _08053834
	b _08053D06
_08053834:
	movs r0, #9
	ldrh r1, [r2, #0x10]
	orrs r0, r1
	strh r0, [r2, #0x10]
	adds r0, r7, #0
	str r2, [sp]
	bl sub_08054804
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
_0805384A:
	bl sub_0805468C
	adds r1, r0, #0
	ldr r2, [sp]
	adds r0, r2, #0
	bl sub_08050140
	b _08053D06
_0805385A:
	adds r0, r7, #0
	bl sub_080547E4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	ldr r4, _0805389C @ =0x02000000
	adds r0, r7, #0
	bl sub_08054678
	lsls r0, r0, #3
	adds r0, r0, r4
	ldr r2, [r0]
	adds r0, r7, #0
	str r2, [sp]
	bl sub_08054678
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r6, [r0]
	ldrb r0, [r7, #0x12]
	ldr r2, [sp]
	cmp r0, #9
	bls _08053890
	b _08053D06
_08053890:
	lsls r0, r0, #2
	ldr r1, _080538A0 @ =_080538A4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805389C: .4byte 0x02000000
_080538A0: .4byte _080538A4
_080538A4: @ jump table
	.4byte _080538CC @ case 0
	.4byte _080538CC @ case 1
	.4byte _080538CC @ case 2
	.4byte _080538CC @ case 3
	.4byte _080539D0 @ case 4
	.4byte _080539D0 @ case 5
	.4byte _080539DE @ case 6
	.4byte _080539DE @ case 7
	.4byte _080539DE @ case 8
	.4byte _080538CC @ case 9
_080538CC:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r8, r0
	bne _080538D6
	b _080539D0
_080538D6:
	ldrh r0, [r2, #0xe]
	adds r0, #1
	strh r0, [r2, #0xe]
	ldrh r0, [r6, #0xe]
	adds r0, #1
	strh r0, [r6, #0xe]
	adds r0, r2, #0
	mov r1, r8
	str r2, [sp]
	bl sub_08054594
	adds r0, r6, #0
	mov r1, r8
	bl sub_08054594
	movs r1, #4
	ldr r2, [sp]
	ldrh r0, [r2, #0x10]
	orrs r0, r1
	strh r0, [r2, #0x10]
	ldrh r0, [r6, #0x10]
	orrs r0, r1
	strh r0, [r6, #0x10]
	ldr r1, _0805392C @ =0x081D8594
	ldr r0, _08053930 @ =0x0203E02C
	movs r3, #0
	ldrsh r0, [r0, r3]
	adds r0, r0, r1
	ldrb r0, [r0]
	mov r8, r0
	ldr r1, _08053934 @ =0x081D856C
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r4, [r0]
	adds r0, r7, #0
	str r2, [sp]
	bl sub_08054678
	ldr r2, [sp]
	cmp r0, #0
	bne _0805393C
	ldr r0, _08053938 @ =0x0200005C
	b _0805393E
	.align 2, 0
_0805392C: .4byte 0x081D8594
_08053930: .4byte 0x0203E02C
_08053934: .4byte 0x081D856C
_08053938: .4byte 0x0200005C
_0805393C:
	ldr r0, _080539BC @ =0x02000060
_0805393E:
	ldr r1, [r0]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r4, [r0]
	adds r0, r7, #0
	str r2, [sp]
	bl sub_08054678
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r0
	lsls r1, r1, #9
	ldr r0, _080539C0 @ =0x0200F1C8
	adds r1, r1, r0
	adds r1, r4, r1
	ldr r0, [r1, #4]
	ldr r2, [sp]
	str r0, [r2, #0x28]
	ldr r4, [r2, #0x30]
	ldr r1, [r1, #8]
	adds r4, r4, r1
	str r4, [r2, #0x3c]
	ldr r4, [r6, #0x30]
	ldr r0, _080539C4 @ =0x000057F0
	adds r4, r4, r0
	str r4, [r6, #0x3c]
	ldr r4, _080539C8 @ =0x0203E0B0
	adds r0, r7, #0
	str r2, [sp]
	bl sub_08054678
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r2, [sp]
	cmp r0, #0
	bne _080539F2
	ldr r4, _080539CC @ =0x0201FB10
	adds r0, r2, #0
	bl sub_08054678
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, [r0]
	ldr r2, [sp]
	ldr r0, [r2, #0x28]
	cmp r1, r0
	beq _080539F2
	adds r0, r2, #0
	bl sub_08053F4C
	ldr r2, [sp]
	adds r0, r2, #0
	bl sub_08054678
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r2, [sp]
	ldr r1, [r2, #0x28]
	str r1, [r0]
	b _080539F2
	.align 2, 0
_080539BC: .4byte 0x02000060
_080539C0: .4byte 0x0200F1C8
_080539C4: .4byte 0x000057F0
_080539C8: .4byte 0x0203E0B0
_080539CC: .4byte 0x0201FB10
_080539D0:
	ldr r1, _08053A00 @ =0x081D8594
	ldr r0, _08053A04 @ =0x0203E02C
	movs r3, #0
	ldrsh r0, [r0, r3]
	adds r0, r0, r1
	ldrb r0, [r0]
	mov r8, r0
_080539DE:
	adds r0, r2, #0
	mov r1, r8
	str r2, [sp]
	bl sub_08054594
	adds r0, r6, #0
	mov r1, r8
	bl sub_08054594
	ldr r2, [sp]
_080539F2:
	adds r0, r2, #0
	bl sub_08053F08
	adds r0, r6, #0
	bl sub_08053F08
	b _08053D18
	.align 2, 0
_08053A00: .4byte 0x081D8594
_08053A04: .4byte 0x0203E02C
_08053A08:
	ldrh r2, [r7, #0x10]
	movs r1, #0x20
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	bne _08053A1C
	adds r0, r1, #0
	orrs r0, r2
	strh r0, [r7, #0x10]
	b _08053D06
_08053A1C:
	ldr r1, _08053A30 @ =0x02017758
	ldr r0, [r1]
	cmp r0, #1
	beq _08053A26
	b _08053D06
_08053A26:
	movs r0, #0
	str r0, [r1]
	ldr r0, _08053A34 @ =0x0000FFDF
	ands r0, r2
	b _08053CFE
	.align 2, 0
_08053A30: .4byte 0x02017758
_08053A34: .4byte 0x0000FFDF
_08053A38:
	adds r0, r7, #0
	bl sub_08054664
	cmp r0, #0
	beq _08053A44
	b _08053D06
_08053A44:
	movs r0, #3
	bl sub_0804E804
	b _08053D06
_08053A4C:
	adds r0, r7, #0
	bl sub_08054664
	cmp r0, #0
	beq _08053A58
	b _08053D06
_08053A58:
	movs r0, #0
	bl sub_0804E804
	b _08053D06
_08053A60:
	ldrh r1, [r7, #0x10]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08053A6C
	b _08053D06
_08053A6C:
	ldr r0, _08053A94 @ =0x0000FFFE
	ands r0, r1
	strh r0, [r7, #0x10]
	ldr r0, [r7, #0x20]
	adds r0, #4
	str r0, [r7, #0x20]
	ldr r0, _08053A98 @ =0x0000F3FF
	ldrh r1, [r7, #8]
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r7, #8]
	movs r0, #0x8c
	strh r0, [r7, #0xa]
	bl sub_080065F8
	b _08053D06
	.align 2, 0
_08053A94: .4byte 0x0000FFFE
_08053A98: .4byte 0x0000F3FF
_08053A9C:
	adds r0, r7, #0
	bl sub_08054664
	cmp r0, #0
	beq _08053AA8
	b _08053D06
_08053AA8:
	adds r0, r7, #0
	bl sub_080547A8
	adds r2, r0, #0
	cmp r2, #0
	beq _08053ADA
	movs r0, #9
	ldrh r3, [r2, #0x10]
	orrs r0, r3
	strh r0, [r2, #0x10]
	adds r0, r7, #0
	str r2, [sp]
	bl sub_08054804
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	bl sub_0805468C
	adds r1, r0, #0
	ldr r2, [sp]
	adds r0, r2, #0
	bl sub_08050140
	ldr r2, [sp]
_08053ADA:
	adds r0, r2, #0
	str r2, [sp]
	bl sub_08067CC4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	bne _08053AEC
	b _08053D06
_08053AEC:
	adds r0, r7, #0
	bl sub_08054678
	adds r1, r0, #0
	ldrh r0, [r7, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl sub_08053314
	movs r1, #0x80
	lsls r1, r1, #5
	ands r1, r0
	ldr r2, [sp]
	cmp r1, #0
	beq _08053B14
	adds r0, r2, #0
	bl sub_080639C8
	b _08053D06
_08053B14:
	adds r0, r7, #0
	bl sub_080626B4
	b _08053D06
_08053B1C:
	adds r0, r7, #0
	bl sub_08054664
	cmp r0, #0
	beq _08053B28
	b _08053D06
_08053B28:
	adds r0, r7, #0
	movs r1, #0
	bl sub_080627F8
	b _08053D06
_08053B32:
	adds r0, r7, #0
	bl sub_08054664
	cmp r0, #0
	beq _08053B3E
	b _08053D06
_08053B3E:
	adds r0, r7, #0
	movs r1, #1
	bl sub_080627F8
	b _08053D06
_08053B48:
	adds r0, r7, #0
	bl sub_08054664
	cmp r0, #0
	beq _08053B54
	b _08053D06
_08053B54:
	adds r0, r7, #0
	bl sub_080629C8
	b _08053D06
_08053B5C:
	adds r0, r7, #0
	bl sub_08054678
	adds r1, r0, #0
	ldrh r0, [r7, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl sub_08053314
	movs r1, #0x80
	lsls r1, r1, #5
	ands r1, r0
	cmp r1, #0
	bne _08053B7C
	b _08053D00
_08053B7C:
	ldrh r1, [r7, #0x10]
	movs r2, #0x20
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08053B8A
	b _08053CEE
_08053B8A:
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_08054664
	cmp r0, #0
	beq _08053B9C
	b _08053D06
_08053B9C:
	adds r0, r7, #0
	movs r1, #0
	bl sub_08063B48
	b _08053D06
_08053BA6:
	adds r0, r7, #0
	bl sub_08054664
	cmp r0, #0
	beq _08053BB2
	b _08053D06
_08053BB2:
	adds r0, r7, #0
	movs r1, #0
	bl sub_08062C18
	b _08053D06
_08053BBC:
	adds r0, r7, #0
	bl sub_08054664
	cmp r0, #0
	beq _08053BC8
	b _08053D06
_08053BC8:
	adds r0, r7, #0
	movs r1, #1
	bl sub_08062C18
	b _08053D06
_08053BD2:
	adds r0, r7, #0
	bl sub_08054664
	cmp r0, #0
	beq _08053BDE
	b _08053D06
_08053BDE:
	adds r0, r7, #0
	movs r1, #0
	bl sub_08062DCC
	b _08053D06
_08053BE8:
	adds r0, r7, #0
	bl sub_08054664
	cmp r0, #0
	beq _08053BF4
	b _08053D06
_08053BF4:
	adds r0, r7, #0
	movs r1, #1
	bl sub_08062DCC
	b _08053D06
_08053BFE:
	adds r0, r7, #0
	bl sub_08054664
	cmp r0, #0
	bne _08053D06
	adds r0, r7, #0
	movs r1, #2
	bl sub_08062DCC
	b _08053D06
_08053C12:
	ldrh r1, [r7, #0x10]
	movs r2, #0x20
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08053CEE
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_08054664
	cmp r0, #0
	bne _08053D06
	adds r0, r7, #0
	bl sub_08063108
	b _08053D06
_08053C36:
	ldrh r1, [r7, #0x10]
	movs r2, #0x20
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08053C44
	b _080536A2
_08053C44:
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_08054664
	cmp r0, #0
	bne _08053C5A
	movs r0, #1
	bl sub_08050814
_08053C5A:
	adds r0, r7, #0
	bl sub_08063C70
	adds r0, r7, #0
	bl sub_08050820
	b _080536A2
_08053C68:
	adds r0, r7, #0
	bl sub_080637D4
	b _08053D06
_08053C70:
	adds r0, r7, #0
	bl sub_0806301C
	b _08053D06
_08053C78:
	subs r0, r3, #1
	adds r0, r2, r0
	ldrb r1, [r0]
	adds r0, r7, #0
	bl sub_080677A4
	b _08053D06
_08053C86:
	ldrh r1, [r7, #0x10]
	movs r2, #0x20
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08053CEE
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_08054664
	cmp r0, #0
	bne _08053D06
	adds r0, r7, #0
	bl sub_08063194
	b _08053D06
_08053CAA:
	adds r0, r7, #0
	bl sub_08054678
	adds r1, r0, #0
	ldrh r0, [r7, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl sub_08053314
	movs r1, #0x80
	lsls r1, r1, #5
	ands r1, r0
	cmp r1, #0
	beq _08053D00
	ldrh r1, [r7, #0x10]
	movs r2, #0x20
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08053CEE
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_08054664
	cmp r0, #0
	bne _08053D06
	adds r0, r7, #0
	movs r1, #1
	bl sub_08063B48
	b _08053D06
_08053CEE:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08053D06
	ldr r0, _08053D10 @ =0x0000FFDF
	ands r0, r1
	ldr r1, _08053D14 @ =0x0000FFBF
_08053CFC:
	ands r0, r1
_08053CFE:
	strh r0, [r7, #0x10]
_08053D00:
	ldr r0, [r7, #0x20]
	adds r0, #4
_08053D04:
	str r0, [r7, #0x20]
_08053D06:
	ldrb r0, [r7, #0x14]
	subs r0, #1
	strb r0, [r7, #0x14]
	bl _08053498
	.align 2, 0
_08053D10: .4byte 0x0000FFDF
_08053D14: .4byte 0x0000FFBF
_08053D18:
	movs r0, #0xe7
	lsls r0, r0, #8
	ldrh r1, [r7, #0xc]
	ands r0, r1
	strh r0, [r7, #0xc]

	non_word_aligned_thumb_func_start sub_08053D22
sub_08053D22: @ 0x08053D22
	movs r0, #0x80
	lsls r0, r0, #6
	mov r2, r8
	ands r0, r2
	cmp r0, #0
	beq _08053D88
	adds r0, r7, #0
	bl sub_08054664
	cmp r0, #0
	bne _08053D7E
	ldr r4, _08053DD8 @ =0x0203E0B0
	adds r0, r7, #0
	bl sub_08054678
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	cmp r0, #0
	bne _08053D7E
	movs r0, #0x80
	lsls r0, r0, #7
	ldrh r3, [r7, #0x10]
	ands r0, r3
	cmp r0, #0
	bne _08053D7E
	ldr r4, _08053DDC @ =0x0201FB10
	adds r0, r7, #0
	bl sub_08054678
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, [r0]
	ldr r0, [r7, #0x28]
	cmp r1, r0
	beq _08053D7E
	adds r0, r7, #0
	bl sub_08053F7C
	adds r0, r7, #0
	bl sub_08054678
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, [r7, #0x28]
	str r1, [r0]
_08053D7E:
	movs r0, #0xd7
	lsls r0, r0, #8
	ldrh r1, [r7, #0xc]
	ands r0, r1
	strh r0, [r7, #0xc]
_08053D88:
	movs r0, #0x80
	lsls r0, r0, #7
	mov r2, r8
	ands r2, r0
	cmp r2, #0
	bne _08053D9E
	ldr r0, _08053DE0 @ =0x02000024
	ldr r0, [r0]
	cmp r0, #1
	beq _08053D9E
	b _08053EEA
_08053D9E:
	ldrh r1, [r7, #0x10]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08053E24
	adds r0, r7, #0
	bl sub_080547E4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r8, r0
	beq _08053DEC
	ldr r6, _08053DE4 @ =0x02000000
	adds r0, r7, #0
	bl sub_08054678
	lsls r0, r0, #3
	adds r0, r0, r6
	ldr r2, [r0]
	adds r0, r2, #0
	mov r1, r8
	str r2, [sp]
	bl sub_08054594
	ldr r4, _08053DE8 @ =0x0000FFFD
	b _08053E5C
	.align 2, 0
_08053DD8: .4byte 0x0203E0B0
_08053DDC: .4byte 0x0201FB10
_08053DE0: .4byte 0x02000024
_08053DE4: .4byte 0x02000000
_08053DE8: .4byte 0x0000FFFD
_08053DEC:
	ldr r5, _08053E1C @ =0x02000000
	adds r0, r7, #0
	bl sub_08054678
	lsls r0, r0, #3
	adds r0, r0, r5
	ldr r2, [r0]
	ldr r4, _08053E20 @ =0x0000FFFD
	adds r0, r4, #0
	ldrh r1, [r2, #0x10]
	ands r0, r1
	strh r0, [r2, #0x10]
	adds r0, r7, #0
	bl sub_08054678
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r6, [r0]
	ldrh r2, [r6, #0x10]
	ands r4, r2
	strh r4, [r6, #0x10]
	b _08053EEA
	.align 2, 0
_08053E1C: .4byte 0x02000000
_08053E20: .4byte 0x0000FFFD
_08053E24:
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08053EB0
	adds r0, r7, #0
	bl sub_080547E4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r8, r0
	beq _08053EEA
	ldr r6, _08053EA8 @ =0x02000000
	adds r0, r7, #0
	bl sub_08054678
	lsls r0, r0, #3
	adds r0, r0, r6
	ldr r2, [r0]
	adds r0, r2, #0
	mov r1, r8
	str r2, [sp]
	bl sub_08054594
	ldr r4, _08053EAC @ =0x00007FFF
_08053E5C:
	adds r0, r4, #0
	ldr r2, [sp]
	ldrh r3, [r2, #0x10]
	ands r0, r3
	movs r5, #4
	orrs r0, r5
	strh r0, [r2, #0x10]
	adds r0, r7, #0
	str r2, [sp]
	bl sub_08054678
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r6, [r0]
	adds r0, r6, #0
	mov r1, r8
	bl sub_08054594
	ldrh r0, [r6, #0x10]
	ands r4, r0
	orrs r4, r5
	strh r4, [r6, #0x10]
	ldr r2, [sp]
	ldrh r0, [r2, #0xe]
	adds r0, #1
	strh r0, [r2, #0xe]
	ldrh r0, [r6, #0xe]
	adds r0, #1
	strh r0, [r6, #0xe]
	adds r0, r2, #0
	bl sub_08053F08
	adds r0, r6, #0
	bl sub_08053F08
	b _08053EEA
	.align 2, 0
_08053EA8: .4byte 0x02000000
_08053EAC: .4byte 0x00007FFF
_08053EB0:
	adds r0, r7, #0
	bl sub_08054664
	cmp r0, #0
	bne _08053EEA
	adds r0, r7, #0
	bl sub_08054678
	adds r1, r0, #0
	ldrh r2, [r7, #0xe]
	lsls r0, r2, #1
	adds r0, r0, r1
	bl sub_080532EC
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r8, r0
	bne _08053EEA
	adds r0, r7, #0
	bl sub_08054678
	ldr r1, _08053F04 @ =0x0201FAF8
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #1
	str r1, [r0]
_08053EEA:
	mov r2, sb
	cmp r2, #3
	bhi _08053EF4
	bl sub_08053460
_08053EF4:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08053F04: .4byte 0x0201FAF8

	thumb_func_start sub_08053F08
sub_08053F08: @ 0x08053F08
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #0x12]
	bl sub_080546D4
	cmp r0, #0
	beq _08053F44
	ldr r1, [r4, #0x20]
	ldr r0, _08053F24 @ =0x08B9B28C
	cmp r1, r0
	beq _08053F44
	movs r2, #0x3f
	b _08053F30
	.align 2, 0
_08053F24: .4byte 0x08B9B28C
_08053F28:
	cmp r1, #6
	bne _08053F30
	adds r0, #0xc
	str r0, [r4, #0x20]
_08053F30:
	ldr r0, [r4, #0x20]
	adds r1, r2, #0
	ldrb r3, [r0, #3]
	ands r1, r3
	cmp r1, #0
	beq _08053F40
	cmp r1, #5
	bne _08053F28
_08053F40:
	subs r0, #0xc
	str r0, [r4, #0x20]
_08053F44:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08053F4C
sub_08053F4C: @ 0x08053F4C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08053F60 @ =0x08B9B2C4
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08053F60: .4byte 0x08B9B2C4

	thumb_func_start sub_08053F64
sub_08053F64: @ 0x08053F64
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl sub_08053F7C
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08053F7C
sub_08053F7C: @ 0x08053F7C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _08053FA8 @ =0x000003FF
	ldrh r0, [r5, #8]
	ands r4, r0
	lsls r4, r4, #5
	ldr r0, _08053FAC @ =0x06010000
	adds r4, r4, r0
	ldr r0, [r5, #0x28]
	ldr r1, [r5, #0x2c]
	bl sub_080BFA28
	ldr r0, [r5, #0x2c]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r1, r4, #0
	bl sub_08003078
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08053FA8: .4byte 0x000003FF
_08053FAC: .4byte 0x06010000

	thumb_func_start sub_08053FB0
sub_08053FB0: @ 0x08053FB0
	adds r2, r0, #0
	ldr r0, _08053FD4 @ =0x0203E0E8
	lsls r1, r1, #1
	adds r1, r1, r0
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0
	beq _08053FD0
	movs r1, #0
	adds r3, r2, #0
	adds r3, #0x80
_08053FC6:
	ldm r3!, {r0}
	stm r2!, {r0}
	adds r1, #1
	cmp r1, #7
	bls _08053FC6
_08053FD0:
	bx lr
	.align 2, 0
_08053FD4: .4byte 0x0203E0E8

	thumb_func_start sub_08053FD8
sub_08053FD8: @ 0x08053FD8
	adds r2, r0, #0
	cmp r1, #0
	bne _08053FE8
	ldr r0, _08053FE4 @ =0x0203E094
	b _08053FEA
	.align 2, 0
_08053FE4: .4byte 0x0203E094
_08053FE8:
	ldr r0, _08054000 @ =0x0203E098
_08053FEA:
	ldr r0, [r0]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x19
	beq _08054012
	cmp r0, #0x19
	bhi _08054004
	cmp r0, #0x18
	beq _0805400E
	b _0805401E
	.align 2, 0
_08054000: .4byte 0x0203E098
_08054004:
	cmp r0, #0x1a
	beq _08054016
	cmp r0, #0x1b
	beq _0805401A
	b _0805401E
_0805400E:
	movs r0, #0x24
	b _08054020
_08054012:
	movs r0, #0x26
	b _08054020
_08054016:
	movs r0, #0x28
	b _08054020
_0805401A:
	movs r0, #0x2a
	b _08054020
_0805401E:
	adds r0, r2, #0
_08054020:
	bx lr
	.align 2, 0

	thumb_func_start sub_08054024
sub_08054024: @ 0x08054024
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _080541F4 @ =0x08E00008
	mov sb, r0
	ldr r1, _080541F8 @ =0x08FD8008
	mov sl, r1
	ldr r1, _080541FC @ =0x0201FB10
	movs r0, #0
	str r0, [r1, #4]
	str r0, [r1]
	ldr r0, _08054200 @ =0x0203E010
	movs r1, #0
	ldrsh r2, [r0, r1]
	mov r8, r2
	cmp r2, #1
	bne _080540DC
	ldr r0, _08054204 @ =0x0203E08E
	movs r2, #0
	ldrsh r5, [r0, r2]
	ldr r0, _08054208 @ =0x0203E020
	movs r1, #0
	ldrsh r7, [r0, r1]
	ldr r0, _0805420C @ =0x0203E01C
	movs r2, #0
	ldrsh r4, [r0, r2]
	lsls r0, r5, #5
	ldr r1, _080541F4 @ =0x08E00008
	adds r6, r0, r1
	ldr r0, [r6, #0x10]
	ldr r1, _08054210 @ =0x0200F1C8
	bl sub_080BFA28
	ldr r1, _08054214 @ =0x0200005C
	ldr r0, [r6, #0xc]
	str r0, [r1]
	adds r0, r5, #0
	movs r1, #0
	bl sub_08053FD8
	lsls r0, r0, #5
	ldr r2, _080541F4 @ =0x08E00008
	adds r0, r0, r2
	ldr r0, [r0, #0x1c]
	ldr r5, _08054218 @ =0x02004088
	adds r1, r5, #0
	bl sub_080BFA28
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	beq _080540A6
	lsls r0, r4, #4
	add r0, sl
	ldr r0, [r0, #0xc]
	adds r1, r5, #0
	bl sub_080BFA28
	adds r0, r5, #0
	movs r1, #0
	bl sub_08053FB0
_080540A6:
	ldr r1, _0805421C @ =0x02000054
	lsls r0, r7, #5
	adds r0, r0, r5
	str r0, [r1]
	ldr r4, _08054220 @ =0x02022B40
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r0, _08054224 @ =0x0203E0A8
	ldr r0, [r0]
	adds r4, #0x20
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	ldr r0, [r6, #0x18]
	ldr r4, _08054228 @ =0x020041C8
	adds r1, r4, #0
	bl sub_080BFA28
	ldr r0, _0805422C @ =0x000057F0
	adds r4, r4, r0
	mov r1, r8
	str r1, [r4]
_080540DC:
	ldr r0, _08054200 @ =0x0203E010
	movs r1, #2
	ldrsh r2, [r0, r1]
	mov r8, r2
	cmp r2, #1
	bne _08054176
	ldr r0, _08054204 @ =0x0203E08E
	movs r2, #2
	ldrsh r5, [r0, r2]
	ldr r0, _08054208 @ =0x0203E020
	movs r1, #2
	ldrsh r7, [r0, r1]
	ldr r0, _0805420C @ =0x0203E01C
	movs r2, #2
	ldrsh r4, [r0, r2]
	lsls r0, r5, #5
	mov r1, sb
	adds r6, r0, r1
	ldr r0, [r6, #0x10]
	ldr r1, _08054230 @ =0x02011BC8
	bl sub_080BFA28
	ldr r1, _08054234 @ =0x02000060
	ldr r0, [r6, #0xc]
	str r0, [r1]
	adds r0, r5, #0
	movs r1, #1
	bl sub_08053FD8
	lsls r0, r0, #5
	add r0, sb
	ldr r0, [r0, #0x1c]
	ldr r5, _08054238 @ =0x02004128
	adds r1, r5, #0
	bl sub_080BFA28
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	beq _08054140
	lsls r0, r4, #4
	add r0, sl
	ldr r0, [r0, #0xc]
	adds r1, r5, #0
	bl sub_080BFA28
	adds r0, r5, #0
	movs r1, #1
	bl sub_08053FB0
_08054140:
	ldr r1, _0805421C @ =0x02000054
	lsls r0, r7, #5
	adds r0, r0, r5
	str r0, [r1, #4]
	ldr r4, _0805423C @ =0x02022B80
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r0, _08054224 @ =0x0203E0A8
	ldr r0, [r0, #4]
	adds r4, #0x20
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	ldr r0, [r6, #0x14]
	ldr r4, _08054240 @ =0x020099C8
	adds r1, r4, #0
	bl sub_080BFA28
	ldr r2, _0805422C @ =0x000057F0
	adds r4, r4, r2
	mov r0, r8
	str r0, [r4]
_08054176:
	ldr r6, _08054244 @ =0x0203E0A0
	ldr r2, [r6]
	cmp r2, #0
	beq _080541E4
	ldr r0, [r2, #4]
	ldr r1, [r0, #0x34]
	adds r0, r2, #0
	movs r2, #0
	mov r3, sp
	bl sub_08052858
	lsls r0, r0, #0x10
	ldr r5, _08054224 @ =0x0203E0A8
	lsrs r0, r0, #0xb
	add r0, sb
	ldr r0, [r0, #0x1c]
	str r0, [r5]
	ldr r0, [r6]
	ldr r1, [sp]
	bl sub_0805322C
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	movs r7, #1
	rsbs r7, r7, #0
	cmp r4, r7
	beq _080541B4
	lsls r0, r4, #4
	add r0, sl
	ldr r0, [r0, #0xc]
	str r0, [r5]
_080541B4:
	ldr r0, [r6, #4]
	ldr r1, [r0, #4]
	ldr r1, [r1, #0x34]
	movs r2, #0
	mov r3, sp
	bl sub_08052858
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xb
	add r0, sb
	ldr r0, [r0, #0x1c]
	str r0, [r5, #4]
	ldr r0, [r6, #4]
	ldr r1, [sp]
	bl sub_0805322C
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, r7
	beq _080541E4
	lsls r0, r4, #4
	add r0, sl
	ldr r0, [r0, #0xc]
	str r0, [r5, #4]
_080541E4:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080541F4: .4byte 0x08E00008
_080541F8: .4byte 0x08FD8008
_080541FC: .4byte 0x0201FB10
_08054200: .4byte 0x0203E010
_08054204: .4byte 0x0203E08E
_08054208: .4byte 0x0203E020
_0805420C: .4byte 0x0203E01C
_08054210: .4byte 0x0200F1C8
_08054214: .4byte 0x0200005C
_08054218: .4byte 0x02004088
_0805421C: .4byte 0x02000054
_08054220: .4byte 0x02022B40
_08054224: .4byte 0x0203E0A8
_08054228: .4byte 0x020041C8
_0805422C: .4byte 0x000057F0
_08054230: .4byte 0x02011BC8
_08054234: .4byte 0x02000060
_08054238: .4byte 0x02004128
_0805423C: .4byte 0x02022B80
_08054240: .4byte 0x020099C8
_08054244: .4byte 0x0203E0A0

	thumb_func_start sub_08054248
sub_08054248: @ 0x08054248
	push {lr}
	ldr r0, _08054260 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #4
	bhi _080542C2
	lsls r0, r0, #2
	ldr r1, _08054264 @ =_08054268
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08054260: .4byte 0x0203E02C
_08054264: .4byte _08054268
_08054268: @ jump table
	.4byte _0805427C @ case 0
	.4byte _08054286 @ case 1
	.4byte _08054290 @ case 2
	.4byte _0805427C @ case 3
	.4byte _0805427C @ case 4
_0805427C:
	movs r0, #6
	movs r1, #6
	bl sub_080542D8
	b _080542C2
_08054286:
	movs r0, #8
	movs r1, #8
	bl sub_080542D8
	b _080542C2
_08054290:
	movs r0, #8
	movs r1, #8
	bl sub_080542D8
	bl sub_0804D43C
	cmp r0, #0
	bne _080542B4
	ldr r1, _080542B0 @ =0x02000000
	ldr r2, [r1, #8]
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r2, #2]
	ldr r1, [r1, #0xc]
	b _080542C0
	.align 2, 0
_080542B0: .4byte 0x02000000
_080542B4:
	ldr r1, _080542D0 @ =0x02000000
	ldr r2, [r1]
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r2, #2]
	ldr r1, [r1, #4]
_080542C0:
	strh r0, [r1, #2]
_080542C2:
	ldr r1, _080542D4 @ =0x0203E05E
	movs r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	pop {r0}
	bx r0
	.align 2, 0
_080542D0: .4byte 0x02000000
_080542D4: .4byte 0x0203E05E

	thumb_func_start sub_080542D8
sub_080542D8: @ 0x080542D8
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	adds r6, r1, #0
	ldr r4, _08054324 @ =0x02000000
	movs r0, #0
	str r0, [r4]
	str r0, [r4, #4]
	str r0, [r4, #8]
	str r0, [r4, #0xc]
	ldr r5, _08054328 @ =0x0203E010
	ldrh r0, [r5]
	cmp r0, #1
	bne _080542F8
	adds r0, r2, #0
	bl sub_08054330
_080542F8:
	ldrh r5, [r5, #2]
	cmp r5, #1
	bne _08054304
	adds r0, r6, #0
	bl sub_08054474
_08054304:
	ldr r0, _0805432C @ =0x0203E02C
	ldrh r0, [r0]
	cmp r0, #4
	bne _0805431E
	ldr r1, [r4]
	movs r2, #2
	ldrh r0, [r1]
	orrs r0, r2
	strh r0, [r1]
	ldr r1, [r4, #4]
	ldrh r0, [r1]
	orrs r0, r2
	strh r0, [r1]
_0805431E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08054324: .4byte 0x02000000
_08054328: .4byte 0x0203E010
_0805432C: .4byte 0x0203E02C

	thumb_func_start sub_08054330
sub_08054330: @ 0x08054330
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	ldr r2, _08054438 @ =0x081D856C
	lsls r1, r7, #2
	adds r0, r1, r2
	ldrb r5, [r0]
	adds r0, r1, #1
	adds r0, r0, r2
	ldrb r6, [r0]
	adds r0, r1, #2
	adds r0, r0, r2
	ldrb r0, [r0]
	mov r8, r0
	adds r1, #3
	adds r1, r1, r2
	ldrb r1, [r1]
	mov sb, r1
	ldr r0, _0805443C @ =0x081D8599
	ldr r1, _08054440 @ =0x0203E02C
	movs r2, #0
	ldrsh r1, [r1, r2]
	adds r0, r1, r0
	ldrb r4, [r0]
	ldr r3, _08054444 @ =0x02000030
	ldr r0, _08054448 @ =0x081D85A4
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r1, [r1]
	rsbs r1, r1, #0
	movs r2, #0
	strh r1, [r3]
	ldr r0, _0805444C @ =0x02000034
	strh r2, [r0]
	ldr r0, _08054450 @ =0x02000028
	adds r1, r1, r4
	strh r1, [r0]
	ldr r1, _08054454 @ =0x0200002C
	movs r0, #0x58
	strh r0, [r1]
	ldr r0, _08054458 @ =0x0200005C
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _0805445C @ =0x0200F1C8
	adds r0, r1, r0
	cmp r5, #0xff
	bne _08054398
	ldr r0, _08054460 @ =0x08B9B28C
_08054398:
	adds r1, r6, #0
	bl sub_08006594
	adds r2, r0, #0
	ldr r1, _08054450 @ =0x02000028
	ldr r0, _08054464 @ =0x0201FB00
	ldrh r1, [r1]
	ldrh r0, [r0]
	subs r0, r1, r0
	movs r1, #0
	strh r0, [r2, #2]
	ldr r0, _08054454 @ =0x0200002C
	ldrh r0, [r0]
	strh r0, [r2, #4]
	movs r0, #0xf4
	lsls r0, r0, #7
	strh r0, [r2, #8]
	movs r3, #0x80
	lsls r3, r3, #3
	adds r0, r3, #0
	ldrh r3, [r2, #0xc]
	orrs r0, r3
	strh r0, [r2, #0xc]
	strh r1, [r2, #0xe]
	strb r7, [r2, #0x12]
	ldr r0, _08054468 @ =0x02000088
	str r0, [r2, #0x2c]
	ldr r0, _0805446C @ =0x020041C8
	str r0, [r2, #0x30]
	ldr r0, _08054470 @ =0x02000000
	str r2, [r0]
	ldr r0, _08054458 @ =0x0200005C
	ldr r1, [r0]
	mov r2, r8
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _0805445C @ =0x0200F1C8
	adds r0, r1, r0
	cmp r2, #0xff
	bne _080543EC
	ldr r0, _08054460 @ =0x08B9B28C
_080543EC:
	mov r1, sb
	bl sub_08006594
	adds r2, r0, #0
	ldr r1, _08054450 @ =0x02000028
	ldr r0, _08054464 @ =0x0201FB00
	ldrh r1, [r1]
	ldrh r0, [r0]
	subs r0, r1, r0
	movs r1, #0
	strh r0, [r2, #2]
	ldr r0, _08054454 @ =0x0200002C
	ldrh r0, [r0]
	strh r0, [r2, #4]
	movs r0, #0xf4
	lsls r0, r0, #7
	strh r0, [r2, #8]
	movs r3, #0xa0
	lsls r3, r3, #3
	adds r0, r3, #0
	ldrh r3, [r2, #0xc]
	orrs r0, r3
	strh r0, [r2, #0xc]
	strh r1, [r2, #0xe]
	strb r7, [r2, #0x12]
	ldr r0, _08054468 @ =0x02000088
	str r0, [r2, #0x2c]
	ldr r0, _0805446C @ =0x020041C8
	str r0, [r2, #0x30]
	ldr r0, _08054470 @ =0x02000000
	str r2, [r0, #4]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08054438: .4byte 0x081D856C
_0805443C: .4byte 0x081D8599
_08054440: .4byte 0x0203E02C
_08054444: .4byte 0x02000030
_08054448: .4byte 0x081D85A4
_0805444C: .4byte 0x02000034
_08054450: .4byte 0x02000028
_08054454: .4byte 0x0200002C
_08054458: .4byte 0x0200005C
_0805445C: .4byte 0x0200F1C8
_08054460: .4byte 0x08B9B28C
_08054464: .4byte 0x0201FB00
_08054468: .4byte 0x02000088
_0805446C: .4byte 0x020041C8
_08054470: .4byte 0x02000000

	thumb_func_start sub_08054474
sub_08054474: @ 0x08054474
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r2, _0805455C @ =0x081D856C
	lsls r1, r5, #2
	adds r0, r1, r2
	ldrb r3, [r0]
	adds r0, r1, #1
	adds r0, r0, r2
	ldrb r4, [r0]
	adds r0, r1, #2
	adds r0, r0, r2
	ldrb r6, [r0]
	adds r1, #3
	adds r1, r1, r2
	ldrb r7, [r1]
	ldr r1, _08054560 @ =0x081D859E
	ldr r0, _08054564 @ =0x0203E02C
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, r0, r1
	ldrb r2, [r0]
	ldr r0, _08054568 @ =0x02000030
	movs r1, #0
	strh r1, [r0, #2]
	ldr r0, _0805456C @ =0x02000034
	strh r1, [r0, #2]
	ldr r0, _08054570 @ =0x02000028
	strh r2, [r0, #2]
	ldr r1, _08054574 @ =0x0200002C
	movs r0, #0x58
	strh r0, [r1, #2]
	ldr r0, _08054578 @ =0x02000060
	ldr r1, [r0]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _0805457C @ =0x02011BC8
	adds r0, r1, r0
	cmp r3, #0xff
	bne _080544C6
	ldr r0, _08054580 @ =0x08B9B28C
_080544C6:
	adds r1, r4, #0
	bl sub_08006594
	adds r2, r0, #0
	ldr r1, _08054570 @ =0x02000028
	ldr r0, _08054584 @ =0x0201FB00
	ldrh r1, [r1, #2]
	ldrh r0, [r0]
	subs r0, r1, r0
	movs r1, #0
	strh r0, [r2, #2]
	ldr r0, _08054574 @ =0x0200002C
	ldrh r0, [r0, #2]
	strh r0, [r2, #4]
	movs r0, #0x9b
	lsls r0, r0, #8
	strh r0, [r2, #8]
	movs r3, #0xc0
	lsls r3, r3, #3
	adds r0, r3, #0
	ldrh r3, [r2, #0xc]
	orrs r0, r3
	strh r0, [r2, #0xc]
	strh r1, [r2, #0xe]
	strb r5, [r2, #0x12]
	ldr r0, _08054588 @ =0x02002088
	str r0, [r2, #0x2c]
	ldr r0, _0805458C @ =0x020099C8
	str r0, [r2, #0x30]
	ldr r0, _08054590 @ =0x02000000
	str r2, [r0, #8]
	ldr r0, _08054578 @ =0x02000060
	ldr r1, [r0]
	lsls r0, r6, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _0805457C @ =0x02011BC8
	adds r0, r1, r0
	cmp r6, #0xff
	bne _08054518
	ldr r0, _08054580 @ =0x08B9B28C
_08054518:
	adds r1, r7, #0
	bl sub_08006594
	adds r2, r0, #0
	ldr r1, _08054570 @ =0x02000028
	ldr r0, _08054584 @ =0x0201FB00
	ldrh r1, [r1, #2]
	ldrh r0, [r0]
	subs r0, r1, r0
	movs r1, #0
	strh r0, [r2, #2]
	ldr r0, _08054574 @ =0x0200002C
	ldrh r0, [r0, #2]
	strh r0, [r2, #4]
	movs r0, #0x9b
	lsls r0, r0, #8
	strh r0, [r2, #8]
	movs r3, #0xe0
	lsls r3, r3, #3
	adds r0, r3, #0
	ldrh r3, [r2, #0xc]
	orrs r0, r3
	strh r0, [r2, #0xc]
	strh r1, [r2, #0xe]
	strb r5, [r2, #0x12]
	ldr r0, _08054588 @ =0x02002088
	str r0, [r2, #0x2c]
	ldr r0, _0805458C @ =0x020099C8
	str r0, [r2, #0x30]
	ldr r0, _08054590 @ =0x02000000
	str r2, [r0, #0xc]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805455C: .4byte 0x081D856C
_08054560: .4byte 0x081D859E
_08054564: .4byte 0x0203E02C
_08054568: .4byte 0x02000030
_0805456C: .4byte 0x02000034
_08054570: .4byte 0x02000028
_08054574: .4byte 0x0200002C
_08054578: .4byte 0x02000060
_0805457C: .4byte 0x02011BC8
_08054580: .4byte 0x08B9B28C
_08054584: .4byte 0x0201FB00
_08054588: .4byte 0x02002088
_0805458C: .4byte 0x020099C8
_08054590: .4byte 0x02000000

	thumb_func_start sub_08054594
sub_08054594: @ 0x08054594
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	bl sub_08054664
	cmp r0, #0
	bne _080545B4
	ldr r0, _080545B0 @ =0x081D856C
	lsls r1, r6, #2
	adds r2, r1, r0
	ldrb r5, [r2]
	adds r1, #1
	adds r1, r1, r0
	b _080545C2
	.align 2, 0
_080545B0: .4byte 0x081D856C
_080545B4:
	ldr r2, _080545E0 @ =0x081D856C
	lsls r1, r6, #2
	adds r0, r1, #2
	adds r0, r0, r2
	ldrb r5, [r0]
	adds r1, #3
	adds r1, r1, r2
_080545C2:
	ldrb r7, [r1]
	cmp r5, #0xff
	beq _08054608
	adds r0, r4, #0
	bl sub_08054678
	cmp r0, #0
	bne _080545EC
	ldr r0, _080545E4 @ =0x0200005C
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _080545E8 @ =0x0200F1C8
	b _080545F8
	.align 2, 0
_080545E0: .4byte 0x081D856C
_080545E4: .4byte 0x0200005C
_080545E8: .4byte 0x0200F1C8
_080545EC:
	ldr r0, _08054600 @ =0x02000060
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _08054604 @ =0x02011BC8
_080545F8:
	adds r1, r1, r0
	str r1, [r4, #0x24]
	str r1, [r4, #0x20]
	b _08054612
	.align 2, 0
_08054600: .4byte 0x02000060
_08054604: .4byte 0x02011BC8
_08054608:
	ldr r0, _08054658 @ =0x08B9B28C
	str r0, [r4, #0x24]
	str r0, [r4, #0x20]
	movs r0, #0
	strh r0, [r4, #0x10]
_08054612:
	movs r3, #0
	movs r2, #0
	strh r7, [r4, #0xa]
	ldr r0, _0805465C @ =0x0000F3FF
	ldrh r1, [r4, #8]
	ands r0, r1
	movs r5, #0x80
	lsls r5, r5, #4
	adds r1, r5, #0
	orrs r0, r1
	strh r0, [r4, #8]
	strh r2, [r4, #6]
	movs r0, #0xe0
	lsls r0, r0, #3
	ldrh r1, [r4, #0xc]
	ands r0, r1
	strh r0, [r4, #0xc]
	strb r6, [r4, #0x12]
	strb r3, [r4, #0x14]
	adds r0, r4, #0
	bl sub_08054678
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	subs r1, r1, r0
	lsls r1, r1, #0xb
	ldr r0, _08054660 @ =0x020041C8
	adds r1, r1, r0
	str r1, [r4, #0x30]
	bl sub_080065F8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08054658: .4byte 0x08B9B28C
_0805465C: .4byte 0x0000F3FF
_08054660: .4byte 0x020041C8

	thumb_func_start sub_08054664
sub_08054664: @ 0x08054664
	movs r1, #0x80
	lsls r1, r1, #1
	ldrh r0, [r0, #0xc]
	ands r1, r0
	cmp r1, #0
	beq _08054674
	movs r0, #1
	b _08054676
_08054674:
	movs r0, #0
_08054676:
	bx lr

	thumb_func_start sub_08054678
sub_08054678: @ 0x08054678
	movs r1, #0x80
	lsls r1, r1, #2
	ldrh r0, [r0, #0xc]
	ands r1, r0
	cmp r1, #0
	beq _08054688
	movs r0, #1
	b _0805468A
_08054688:
	movs r0, #0
_0805468A:
	bx lr

	thumb_func_start sub_0805468C
sub_0805468C: @ 0x0805468C
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bhi _080546D0
	lsls r0, r0, #2
	ldr r1, _080546A0 @ =_080546A4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080546A0: .4byte _080546A4
_080546A4: @ jump table
	.4byte _080546D0 @ case 0
	.4byte _080546D0 @ case 1
	.4byte _080546D0 @ case 2
	.4byte _080546D0 @ case 3
	.4byte _080546CC @ case 4
	.4byte _080546CC @ case 5
	.4byte _080546D0 @ case 6
	.4byte _080546D0 @ case 7
	.4byte _080546D0 @ case 8
	.4byte _080546D0 @ case 9
_080546CC:
	movs r0, #1
	b _080546D2
_080546D0:
	movs r0, #0
_080546D2:
	bx lr

	thumb_func_start sub_080546D4
sub_080546D4: @ 0x080546D4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bhi _08054718
	lsls r0, r0, #2
	ldr r1, _080546E8 @ =_080546EC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080546E8: .4byte _080546EC
_080546EC: @ jump table
	.4byte _08054718 @ case 0
	.4byte _08054718 @ case 1
	.4byte _08054718 @ case 2
	.4byte _08054718 @ case 3
	.4byte _08054718 @ case 4
	.4byte _08054718 @ case 5
	.4byte _08054714 @ case 6
	.4byte _08054714 @ case 7
	.4byte _08054714 @ case 8
	.4byte _08054718 @ case 9
_08054714:
	movs r0, #1
	b _0805471A
_08054718:
	movs r0, #0
_0805471A:
	bx lr

	thumb_func_start sub_0805471C
sub_0805471C: @ 0x0805471C
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bhi _08054760
	lsls r0, r0, #2
	ldr r1, _08054730 @ =_08054734
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08054730: .4byte _08054734
_08054734: @ jump table
	.4byte _0805475C @ case 0
	.4byte _0805475C @ case 1
	.4byte _0805475C @ case 2
	.4byte _0805475C @ case 3
	.4byte _08054760 @ case 4
	.4byte _08054760 @ case 5
	.4byte _08054760 @ case 6
	.4byte _08054760 @ case 7
	.4byte _08054760 @ case 8
	.4byte _0805475C @ case 9
_0805475C:
	movs r0, #1
	b _08054762
_08054760:
	movs r0, #0
_08054762:
	bx lr

	thumb_func_start sub_08054764
sub_08054764: @ 0x08054764
	ldrb r0, [r0, #0x12]
	cmp r0, #9
	bhi _080547A4
	lsls r0, r0, #2
	ldr r1, _08054774 @ =_08054778
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08054774: .4byte _08054778
_08054778: @ jump table
	.4byte _080547A4 @ case 0
	.4byte _080547A0 @ case 1
	.4byte _080547A4 @ case 2
	.4byte _080547A0 @ case 3
	.4byte _080547A4 @ case 4
	.4byte _080547A4 @ case 5
	.4byte _080547A4 @ case 6
	.4byte _080547A4 @ case 7
	.4byte _080547A4 @ case 8
	.4byte _080547A4 @ case 9
_080547A0:
	movs r0, #1
	b _080547A6
_080547A4:
	movs r0, #0
_080547A6:
	bx lr

	thumb_func_start sub_080547A8
sub_080547A8: @ 0x080547A8
	push {r4, lr}
	ldr r4, _080547C0 @ =0x02000000
	bl sub_08054678
	movs r1, #1
	eors r1, r0
	lsls r1, r1, #3
	adds r1, r1, r4
	ldr r0, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080547C0: .4byte 0x02000000

	thumb_func_start sub_080547C4
sub_080547C4: @ 0x080547C4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08054678
	adds r1, r0, #0
	ldrh r0, [r4, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl sub_080532EC
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_080547E4
sub_080547E4: @ 0x080547E4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08054678
	adds r1, r0, #0
	ldrh r4, [r4, #0xe]
	lsls r0, r4, #1
	adds r0, r0, r1
	bl sub_080532EC
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08054804
sub_08054804: @ 0x08054804
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08054678
	adds r2, r0, #0
	ldrh r0, [r4, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	movs r1, #1
	eors r1, r2
	adds r0, r0, r1
	bl sub_080532EC
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_08054828
sub_08054828: @ 0x08054828
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08054678
	adds r2, r0, #0
	ldrh r4, [r4, #0xe]
	lsls r0, r4, #1
	movs r1, #1
	eors r1, r2
	adds r0, r0, r1
	bl sub_080532EC
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0805484C
sub_0805484C: @ 0x0805484C
	cmp r0, #0
	bne _08054864
	ldr r2, _08054860 @ =0x02000000
	ldr r3, [r2]
	movs r1, #2
	ldrh r0, [r3]
	orrs r0, r1
	strh r0, [r3]
	ldr r3, [r2, #4]
	b _08054876
	.align 2, 0
_08054860: .4byte 0x02000000
_08054864:
	cmp r0, #1
	bne _0805487C
	ldr r2, _08054880 @ =0x02000000
	ldr r3, [r2, #8]
	movs r1, #2
	ldrh r0, [r3]
	orrs r0, r1
	strh r0, [r3]
	ldr r3, [r2, #0xc]
_08054876:
	ldrh r0, [r3]
	orrs r0, r1
	strh r0, [r3]
_0805487C:
	bx lr
	.align 2, 0
_08054880: .4byte 0x02000000

	thumb_func_start sub_08054884
sub_08054884: @ 0x08054884
	push {r4, lr}
	cmp r0, #0
	bne _080548A4
	ldr r2, _0805489C @ =0x02000000
	ldr r3, [r2]
	ldr r1, _080548A0 @ =0x0000FFFD
	adds r0, r1, #0
	ldrh r4, [r3]
	ands r0, r4
	strh r0, [r3]
	ldr r3, [r2, #4]
	b _080548B8
	.align 2, 0
_0805489C: .4byte 0x02000000
_080548A0: .4byte 0x0000FFFD
_080548A4:
	cmp r0, #1
	bne _080548BE
	ldr r2, _080548C4 @ =0x02000000
	ldr r3, [r2, #8]
	ldr r1, _080548C8 @ =0x0000FFFD
	adds r0, r1, #0
	ldrh r4, [r3]
	ands r0, r4
	strh r0, [r3]
	ldr r3, [r2, #0xc]
_080548B8:
	ldrh r0, [r3]
	ands r1, r0
	strh r1, [r3]
_080548BE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080548C4: .4byte 0x02000000
_080548C8: .4byte 0x0000FFFD

	thumb_func_start sub_080548CC
sub_080548CC: @ 0x080548CC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	cmp r4, #0
	bne _080548D8
	b _08054A5E
_080548D8:
	movs r5, #0xf0
	lsls r5, r5, #8
	ldrh r0, [r4, #0xc]
	ands r5, r0
	cmp r5, #0
	bne _080548E6
	b _08054A5E
_080548E6:
	movs r0, #0x80
	lsls r0, r0, #5
	ands r0, r5
	cmp r0, #0
	bne _080548F2
	b _08054A20
_080548F2:
	ldrb r0, [r4, #0x14]
	cmp r0, #0
	bne _080548FA
	b _08054A16
_080548FA:
	ldrb r1, [r4, #0x14]
	adds r0, r1, r4
	ldrb r0, [r0, #0x14]
	cmp r0, #0x32
	bls _08054906
	b _08054A0E
_08054906:
	lsls r0, r0, #2
	ldr r1, _08054910 @ =_08054914
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08054910: .4byte _08054914
_08054914: @ jump table
	.4byte _08054A0E @ case 0
	.4byte _080549E0 @ case 1
	.4byte _080549E0 @ case 2
	.4byte _080549F8 @ case 3
	.4byte _080549F8 @ case 4
	.4byte _080549E8 @ case 5
	.4byte _08054A0E @ case 6
	.4byte _08054A0E @ case 7
	.4byte _08054A0E @ case 8
	.4byte _08054A0E @ case 9
	.4byte _08054A0E @ case 10
	.4byte _08054A0E @ case 11
	.4byte _08054A0E @ case 12
	.4byte _08054A00 @ case 13
	.4byte _08054A0E @ case 14
	.4byte _08054A0E @ case 15
	.4byte _08054A0E @ case 16
	.4byte _08054A0E @ case 17
	.4byte _08054A0E @ case 18
	.4byte _08054A0E @ case 19
	.4byte _08054A0E @ case 20
	.4byte _08054A0E @ case 21
	.4byte _08054A0E @ case 22
	.4byte _08054A0E @ case 23
	.4byte _08054A08 @ case 24
	.4byte _08054A0E @ case 25
	.4byte _08054A0E @ case 26
	.4byte _08054A0E @ case 27
	.4byte _08054A0E @ case 28
	.4byte _08054A0E @ case 29
	.4byte _08054A0E @ case 30
	.4byte _08054A0E @ case 31
	.4byte _08054A0E @ case 32
	.4byte _08054A0E @ case 33
	.4byte _08054A0E @ case 34
	.4byte _08054A0E @ case 35
	.4byte _08054A0E @ case 36
	.4byte _08054A0E @ case 37
	.4byte _08054A0E @ case 38
	.4byte _08054A0E @ case 39
	.4byte _08054A0E @ case 40
	.4byte _08054A0E @ case 41
	.4byte _08054A0E @ case 42
	.4byte _08054A0E @ case 43
	.4byte _08054A0E @ case 44
	.4byte _08054A0E @ case 45
	.4byte _08054A0E @ case 46
	.4byte _08054A0E @ case 47
	.4byte _08054A0E @ case 48
	.4byte _08054A0E @ case 49
	.4byte _08054A0E @ case 50
_080549E0:
	adds r0, r4, #0
	bl sub_08054A68
	b _08054A0E
_080549E8:
	adds r0, r4, #0
	bl sub_08054664
	cmp r0, #0
	bne _080549F8
	adds r0, r4, #0
	bl sub_08064244
_080549F8:
	ldr r0, [r4, #0x20]
	adds r0, #4
	str r0, [r4, #0x20]
	b _08054A0E
_08054A00:
	adds r0, r4, #0
	bl sub_08054A8C
	b _08054A0E
_08054A08:
	adds r0, r4, #0
	bl sub_08054A68
_08054A0E:
	ldrb r0, [r4, #0x14]
	subs r0, #1
	strb r0, [r4, #0x14]
	b _080548F2
_08054A16:
	movs r0, #0xe7
	lsls r0, r0, #8
	ldrh r1, [r4, #0xc]
	ands r0, r1
	strh r0, [r4, #0xc]
_08054A20:
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r5
	cmp r0, #0
	beq _08054A50
	adds r0, r4, #0
	bl sub_08054664
	cmp r0, #0
	bne _08054A46
	ldr r1, [r6, #0x2c]
	ldr r0, [r4, #0x28]
	cmp r1, r0
	beq _08054A46
	adds r0, r4, #0
	bl sub_08053F7C
	ldr r0, [r4, #0x28]
	str r0, [r6, #0x2c]
_08054A46:
	movs r0, #0xd7
	lsls r0, r0, #8
	ldrh r1, [r4, #0xc]
	ands r0, r1
	strh r0, [r4, #0xc]
_08054A50:
	movs r0, #0x80
	lsls r0, r0, #7
	ands r5, r0
	cmp r5, #0
	beq _08054A5E
	ldr r0, _08054A64 @ =0x0000FFFF
	strh r0, [r4, #0xe]
_08054A5E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08054A64: .4byte 0x0000FFFF

	thumb_func_start sub_08054A68
sub_08054A68: @ 0x08054A68
	adds r1, r0, #0
	ldr r0, _08054A88 @ =0x0000FFFE
	strh r0, [r1, #0xe]
	movs r0, #8
	ldrh r2, [r1, #0x10]
	ands r0, r2
	cmp r0, #0
	beq _08054A84
	strh r0, [r1, #0x10]
	movs r0, #0
	strh r0, [r1, #0xe]
	ldr r0, [r1, #0x20]
	adds r0, #4
	str r0, [r1, #0x20]
_08054A84:
	bx lr
	.align 2, 0
_08054A88: .4byte 0x0000FFFE

	thumb_func_start sub_08054A8C
sub_08054A8C: @ 0x08054A8C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r6, [r7, #0x44]
	bl sub_08054664
	cmp r0, #0
	bne _08054ADE
	ldr r3, _08054AE4 @ =0x081D856C
	movs r1, #6
	ldrsh r0, [r6, r1]
	lsls r0, r0, #5
	ldr r1, _08054AE8 @ =0x08E00008
	adds r0, r0, r1
	ldr r1, [r0, #0xc]
	ldr r2, [r6, #0x14]
	ldr r4, [r6, #0x18]
	ldr r5, [r6, #0x28]
	ldrb r3, [r3, #0x18]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r5, r0
	ldr r0, [r1, #4]
	str r0, [r2, #0x28]
	ldr r5, [r2, #0x30]
	ldr r0, [r1, #8]
	adds r5, r5, r0
	str r5, [r2, #0x3c]
	ldr r5, [r4, #0x30]
	ldr r0, _08054AEC @ =0x000057F0
	adds r5, r5, r0
	str r5, [r4, #0x3c]
	ldr r1, [r6, #0x2c]
	ldr r0, [r7, #0x28]
	cmp r1, r0
	beq _08054ADE
	adds r0, r7, #0
	bl sub_08053F4C
	ldr r0, [r7, #0x28]
	str r0, [r6, #0x2c]
_08054ADE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08054AE4: .4byte 0x081D856C
_08054AE8: .4byte 0x08E00008
_08054AEC: .4byte 0x000057F0

	thumb_func_start sub_08054AF0
sub_08054AF0: @ 0x08054AF0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _08054B78 @ =0x08E00008
	mov sb, r0
	ldr r2, _08054B7C @ =0x081D856C
	ldrh r3, [r5, #0xa]
	lsls r1, r3, #2
	adds r0, r1, r2
	ldrb r4, [r0]
	adds r0, r1, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	mov r8, r0
	adds r0, r1, #2
	adds r0, r0, r2
	ldrb r6, [r0]
	adds r1, #3
	adds r1, r1, r2
	ldrb r1, [r1]
	str r1, [sp]
	movs r1, #6
	ldrsh r0, [r5, r1]
	lsls r0, r0, #5
	add r0, sb
	ldr r0, [r0, #0x10]
	ldr r1, [r5, #0x28]
	bl sub_080BFA28
	movs r2, #6
	ldrsh r0, [r5, r2]
	lsls r0, r0, #5
	mov r3, sb
	adds r1, r0, r3
	ldr r2, [r1, #0xc]
	ldr r3, [r5, #0x28]
	ldr r7, _08054B80 @ =0x08B9B28C
	cmp r4, #0xff
	beq _08054B4E
	lsls r0, r4, #2
	adds r0, r0, r2
	ldr r0, [r0]
	adds r7, r3, r0
_08054B4E:
	ldr r0, _08054B80 @ =0x08B9B28C
	mov sl, r0
	cmp r6, #0xff
	beq _08054B60
	lsls r0, r6, #2
	adds r0, r0, r2
	ldr r0, [r0]
	adds r3, r3, r0
	mov sl, r3
_08054B60:
	ldrh r0, [r5, #0xc]
	cmp r0, #0
	bne _08054B88
	ldr r4, [r5, #0x24]
	ldr r0, [r1, #0x18]
	adds r1, r4, #0
	bl sub_080BFA28
	ldr r2, _08054B84 @ =0x000057F0
	adds r1, r4, r2
	b _08054B96
	.align 2, 0
_08054B78: .4byte 0x08E00008
_08054B7C: .4byte 0x081D856C
_08054B80: .4byte 0x08B9B28C
_08054B84: .4byte 0x000057F0
_08054B88:
	ldr r4, [r5, #0x24]
	ldr r0, [r1, #0x14]
	adds r1, r4, #0
	bl sub_080BFA28
	ldr r3, _08054C80 @ =0x000057F0
	adds r1, r4, r3
_08054B96:
	movs r0, #1
	str r0, [r1]
	mov r1, r8
	adds r0, r7, #0
	bl sub_08006594
	adds r2, r0, #0
	ldr r0, [r5, #0x24]
	str r0, [r2, #0x30]
	ldrh r0, [r5, #2]
	movs r6, #0
	strh r0, [r2, #2]
	ldrh r0, [r5, #4]
	strh r0, [r2, #4]
	ldrh r1, [r5, #0x10]
	lsls r0, r1, #0xc
	movs r3, #0x80
	lsls r3, r3, #4
	adds r4, r3, #0
	orrs r0, r4
	ldrh r1, [r5, #0xe]
	orrs r0, r1
	strh r0, [r2, #8]
	ldrh r3, [r5, #0xc]
	lsls r0, r3, #9
	movs r3, #0x80
	lsls r3, r3, #3
	adds r1, r3, #0
	orrs r0, r1
	ldrh r1, [r2, #0xc]
	orrs r0, r1
	strh r0, [r2, #0xc]
	strh r6, [r2, #0xe]
	ldrh r0, [r5, #0xa]
	strb r0, [r2, #0x12]
	ldr r0, [r5, #0x1c]
	str r0, [r2, #0x2c]
	str r2, [r5, #0x14]
	str r5, [r2, #0x44]
	ldr r1, [sp]
	mov r0, sl
	bl sub_08006594
	adds r2, r0, #0
	ldr r0, [r5, #0x24]
	str r0, [r2, #0x30]
	ldrh r0, [r5, #2]
	strh r0, [r2, #2]
	ldrh r0, [r5, #4]
	strh r0, [r2, #4]
	ldrh r3, [r5, #0x10]
	lsls r0, r3, #0xc
	orrs r0, r4
	ldrh r1, [r5, #0xe]
	orrs r0, r1
	strh r0, [r2, #8]
	ldrh r3, [r5, #0xc]
	lsls r0, r3, #9
	movs r3, #0xa0
	lsls r3, r3, #3
	adds r1, r3, #0
	orrs r0, r1
	ldrh r1, [r2, #0xc]
	orrs r0, r1
	strh r0, [r2, #0xc]
	strh r6, [r2, #0xe]
	ldrh r0, [r5, #0xa]
	strb r0, [r2, #0x12]
	ldr r0, [r5, #0x1c]
	str r0, [r2, #0x2c]
	str r2, [r5, #0x18]
	str r5, [r2, #0x44]
	movs r2, #6
	ldrsh r0, [r5, r2]
	lsls r0, r0, #5
	add r0, sb
	ldr r0, [r0, #0x1c]
	ldr r1, [r5, #0x20]
	bl sub_080BFA28
	movs r3, #8
	ldrsh r1, [r5, r3]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08054C52
	adds r0, r1, #0
	lsls r0, r0, #4
	ldr r2, _08054C84 @ =0x08FD8008
	adds r0, r0, r2
	ldr r0, [r0, #0xc]
	ldr r1, [r5, #0x20]
	bl sub_080BFA28
_08054C52:
	ldrb r3, [r5, #1]
	lsls r1, r3, #5
	ldr r0, [r5, #0x20]
	adds r0, r0, r1
	ldrh r2, [r5, #0x10]
	lsls r1, r2, #5
	ldr r2, _08054C88 @ =0x02022A60
	adds r1, r1, r2
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	str r6, [r5, #0x2c]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08054C80: .4byte 0x000057F0
_08054C84: .4byte 0x08FD8008
_08054C88: .4byte 0x02022A60

	thumb_func_start sub_08054C8C
sub_08054C8C: @ 0x08054C8C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	ldr r0, _08054D00 @ =0x08E00008
	mov sb, r0
	ldr r2, _08054D04 @ =0x081D856C
	ldrh r1, [r6, #0xa]
	lsls r0, r1, #2
	adds r1, r0, r2
	ldrb r4, [r1]
	adds r0, #2
	adds r0, r0, r2
	ldrb r5, [r0]
	movs r2, #6
	ldrsh r0, [r6, r2]
	lsls r0, r0, #5
	add r0, sb
	ldr r0, [r0, #0x10]
	ldr r1, [r6, #0x28]
	bl sub_080BFA28
	movs r3, #6
	ldrsh r0, [r6, r3]
	lsls r0, r0, #5
	mov r7, sb
	adds r1, r0, r7
	ldr r2, [r1, #0xc]
	ldr r3, [r6, #0x28]
	ldr r7, _08054D08 @ =0x08B9B28C
	cmp r4, #0xff
	beq _08054CD6
	lsls r0, r4, #2
	adds r0, r0, r2
	ldr r0, [r0]
	adds r7, r3, r0
_08054CD6:
	ldr r0, _08054D08 @ =0x08B9B28C
	mov r8, r0
	cmp r5, #0xff
	beq _08054CE8
	lsls r0, r5, #2
	adds r0, r0, r2
	ldr r0, [r0]
	adds r3, r3, r0
	mov r8, r3
_08054CE8:
	ldrh r0, [r6, #0xc]
	cmp r0, #0
	bne _08054D10
	ldr r4, [r6, #0x24]
	ldr r0, [r1, #0x18]
	adds r1, r4, #0
	bl sub_080BFA28
	ldr r2, _08054D0C @ =0x000057F0
	adds r1, r4, r2
	b _08054D1E
	.align 2, 0
_08054D00: .4byte 0x08E00008
_08054D04: .4byte 0x081D856C
_08054D08: .4byte 0x08B9B28C
_08054D0C: .4byte 0x000057F0
_08054D10:
	ldr r4, [r6, #0x24]
	ldr r0, [r1, #0x14]
	adds r1, r4, #0
	bl sub_080BFA28
	ldr r3, _08054DF4 @ =0x000057F0
	adds r1, r4, r3
_08054D1E:
	movs r0, #1
	str r0, [r1]
	ldr r5, [r6, #0x14]
	str r7, [r5, #0x24]
	str r7, [r5, #0x20]
	ldr r0, [r6, #0x24]
	str r0, [r5, #0x30]
	ldrh r0, [r6, #2]
	movs r4, #0
	movs r2, #0
	strh r0, [r5, #2]
	ldrh r0, [r6, #4]
	strh r0, [r5, #4]
	ldrh r7, [r6, #0x10]
	lsls r0, r7, #0xc
	movs r1, #0x80
	lsls r1, r1, #4
	adds r3, r1, #0
	orrs r0, r3
	ldrh r7, [r6, #0xe]
	orrs r0, r7
	strh r0, [r5, #8]
	movs r1, #0xe0
	lsls r1, r1, #3
	adds r0, r1, #0
	ldrh r7, [r5, #0xc]
	ands r0, r7
	strh r0, [r5, #0xc]
	strh r2, [r5, #0x10]
	strh r2, [r5, #6]
	strh r2, [r5, #0xe]
	ldrh r0, [r6, #0xa]
	strb r0, [r5, #0x12]
	ldr r0, [r6, #0x1c]
	str r0, [r5, #0x2c]
	strb r4, [r5, #0x14]
	str r5, [r6, #0x14]
	ldr r5, [r6, #0x18]
	mov r0, r8
	str r0, [r5, #0x24]
	str r0, [r5, #0x20]
	ldr r0, [r6, #0x24]
	str r0, [r5, #0x30]
	ldrh r0, [r6, #2]
	strh r0, [r5, #2]
	ldrh r0, [r6, #4]
	strh r0, [r5, #4]
	ldrh r7, [r6, #0x10]
	lsls r0, r7, #0xc
	orrs r0, r3
	ldrh r3, [r6, #0xe]
	orrs r0, r3
	strh r0, [r5, #8]
	ldrh r7, [r5, #0xc]
	ands r1, r7
	strh r1, [r5, #0xc]
	strh r2, [r5, #0x10]
	strh r2, [r5, #6]
	strh r2, [r5, #0xe]
	ldrh r0, [r6, #0xa]
	strb r0, [r5, #0x12]
	ldr r0, [r6, #0x1c]
	str r0, [r5, #0x2c]
	strb r4, [r5, #0x14]
	str r5, [r6, #0x18]
	movs r1, #6
	ldrsh r0, [r6, r1]
	lsls r0, r0, #5
	add r0, sb
	ldr r0, [r0, #0x1c]
	ldr r1, [r6, #0x20]
	bl sub_080BFA28
	movs r2, #8
	ldrsh r1, [r6, r2]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08054DCC
	adds r0, r1, #0
	lsls r0, r0, #4
	ldr r7, _08054DF8 @ =0x08FD8008
	adds r0, r0, r7
	ldr r0, [r0, #0xc]
	ldr r1, [r6, #0x20]
	bl sub_080BFA28
_08054DCC:
	ldrb r0, [r6, #1]
	lsls r1, r0, #5
	ldr r0, [r6, #0x20]
	adds r0, r0, r1
	ldrh r6, [r6, #0x10]
	lsls r1, r6, #5
	ldr r2, _08054DFC @ =0x02022A60
	adds r1, r1, r2
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08054DF4: .4byte 0x000057F0
_08054DF8: .4byte 0x08FD8008
_08054DFC: .4byte 0x02022A60

	thumb_func_start sub_08054E00
sub_08054E00: @ 0x08054E00
	push {lr}
	strh r1, [r0, #6]
	strh r2, [r0, #8]
	bl sub_08054C8C
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08054E10
sub_08054E10: @ 0x08054E10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	strh r1, [r0, #2]
	strh r2, [r0, #4]
	ldr r2, [r0, #0x14]
	strh r1, [r2, #2]
	ldrh r1, [r0, #4]
	strh r1, [r2, #4]
	ldr r2, [r0, #0x18]
	ldrh r1, [r0, #2]
	strh r1, [r2, #2]
	ldrh r0, [r0, #4]
	strh r0, [r2, #4]
	bx lr

	thumb_func_start sub_08054E2C
sub_08054E2C: @ 0x08054E2C
	lsls r1, r1, #0x10
	ldr r2, [r0, #0x14]
	lsrs r1, r1, #6
	strh r1, [r2, #8]
	ldr r2, [r0, #0x18]
	strh r1, [r2, #8]
	bx lr
	.align 2, 0

	thumb_func_start sub_08054E3C
sub_08054E3C: @ 0x08054E3C
	ldr r1, [r0, #0x14]
	ldr r2, [r0, #0x18]
	ldr r0, _08054E54 @ =0x0000FFFE
	ldrh r1, [r1, #0xe]
	cmp r1, r0
	beq _08054E58
	ldrh r2, [r2, #0xe]
	cmp r2, r0
	beq _08054E58
	movs r0, #0
	b _08054E5A
	.align 2, 0
_08054E54: .4byte 0x0000FFFE
_08054E58:
	movs r0, #1
_08054E5A:
	bx lr

	thumb_func_start sub_08054E5C
sub_08054E5C: @ 0x08054E5C
	ldr r3, [r0, #0x14]
	movs r2, #8
	ldrh r1, [r3, #0x10]
	orrs r1, r2
	strh r1, [r3, #0x10]
	ldr r3, [r0, #0x18]
	ldrh r0, [r3, #0x10]
	orrs r0, r2
	strh r0, [r3, #0x10]
	bx lr

	thumb_func_start sub_08054E70
sub_08054E70: @ 0x08054E70
	ldr r1, [r0, #0x14]
	ldr r0, _08054E80 @ =0x0000FFFF
	ldrh r1, [r1, #0xe]
	cmp r1, r0
	bne _08054E84
	movs r0, #1
	b _08054E86
	.align 2, 0
_08054E80: .4byte 0x0000FFFF
_08054E84:
	movs r0, #0
_08054E86:
	bx lr

	thumb_func_start sub_08054E88
sub_08054E88: @ 0x08054E88
	push {r4, lr}
	ldr r4, _08054EA0 @ =0x0201FB0C
	ldr r0, _08054EA4 @ =0x08B9B2DC
	movs r1, #4
	bl SpawnProc
	str r0, [r4]
	bl sub_08006508
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08054EA0: .4byte 0x0201FB0C
_08054EA4: .4byte 0x08B9B2DC

	thumb_func_start sub_08054EA8
sub_08054EA8: @ 0x08054EA8
	push {lr}
	ldr r0, _08054EB8 @ =0x0201FB0C
	ldr r0, [r0]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_08054EB8: .4byte 0x0201FB0C

	thumb_func_start sub_08054EBC
sub_08054EBC: @ 0x08054EBC
	push {lr}
	bl sub_08006490
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08054EC8
sub_08054EC8: @ 0x08054EC8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _08054EEC @ =0x08B9B2F4
	movs r1, #4
	bl SpawnProc
	adds r5, r0, #0
	adds r0, r4, #0
	bl sub_08054AF0
	str r4, [r5, #0x5c]
	str r5, [r4, #0x34]
	movs r0, #1
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08054EEC: .4byte 0x08B9B2F4

	thumb_func_start sub_08054EF0
sub_08054EF0: @ 0x08054EF0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x14]
	bl sub_08006650
	ldr r0, [r4, #0x18]
	bl sub_08006650
	movs r0, #0
	str r0, [r4, #0x14]
	str r0, [r4, #0x18]
	ldr r0, [r4, #0x34]
	bl Proc_End
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08054F14
sub_08054F14: @ 0x08054F14
	push {r4, lr}
	ldr r4, [r0, #0x5c]
	ldr r1, [r4, #0x14]
	adds r0, r4, #0
	bl sub_080548CC
	ldr r1, [r4, #0x18]
	adds r0, r4, #0
	bl sub_080548CC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08054F30
sub_08054F30: @ 0x08054F30
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	adds r6, r0, #0
	movs r0, #0
	ldrsh r1, [r6, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r2, _08054F98 @ =0x08FC0008
	adds r0, r0, r2
	mov r8, r0
	movs r0, #6
	ldrsh r1, [r6, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r5, r0, r2
	movs r1, #0
	ldrsh r0, [r6, r1]
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, r4
	beq _08054F6E
	mov r2, r8
	ldr r0, [r2, #0xc]
	ldr r1, [r6, #0x20]
	bl sub_080BFA28
_08054F6E:
	movs r1, #6
	ldrsh r0, [r6, r1]
	cmp r0, r4
	beq _08054F84
	ldr r0, [r5, #0xc]
	ldr r1, [r6, #0x20]
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r1, r2
	bl sub_080BFA28
_08054F84:
	movs r1, #0xc
	ldrsh r0, [r6, r1]
	cmp r0, #3
	bgt _08054F9C
	cmp r0, #1
	bge _08054FAA
	cmp r0, #0
	beq _08054FA0
	b _08054FAA
	.align 2, 0
_08054F98: .4byte 0x08FC0008
_08054F9C:
	cmp r0, #4
	bne _08054FAA
_08054FA0:
	ldr r3, [r6, #0x20]
	movs r2, #0x80
	lsls r2, r2, #5
	adds r7, r3, r2
	b _08054FB8
_08054FAA:
	ldr r0, [r6, #0x20]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r3, r0, r1
	movs r2, #0xc0
	lsls r2, r2, #5
	adds r7, r0, r2
_08054FB8:
	mov r0, r8
	ldr r0, [r0, #0x10]
	mov r8, r0
	ldr r5, [r5, #0x10]
	mov sb, r5
	movs r1, #0xe
	ldrsh r4, [r6, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	beq _0805503C
	cmp r4, r0
	blt _0805509C
	cmp r4, #3
	bgt _0805509C
	movs r2, #4
	ldrsh r0, [r6, r2]
	adds r0, #0x40
	lsls r0, r0, #5
	movs r4, #0xc0
	lsls r4, r4, #0x13
	adds r0, r0, r4
	ldr r1, [r6, #0x1c]
	adds r1, r1, r0
	movs r5, #0x80
	lsls r5, r5, #4
	adds r0, r3, #0
	adds r2, r5, #0
	bl sub_08003078
	movs r1, #0xa
	ldrsh r0, [r6, r1]
	lsls r0, r0, #5
	adds r0, r0, r4
	ldr r1, [r6, #0x1c]
	adds r1, r1, r0
	adds r0, r7, #0
	adds r2, r5, #0
	bl sub_08003078
	movs r2, #2
	ldrsh r1, [r6, r2]
	lsls r1, r1, #5
	ldr r4, _08055038 @ =0x02022860
	adds r1, r1, r4
	mov r0, r8
	movs r2, #8
	bl CpuFastSet
	movs r0, #8
	ldrsh r1, [r6, r0]
	lsls r1, r1, #5
	adds r1, r1, r4
	mov r0, sb
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	adds r0, r6, #0
	bl sub_08055320
	b _0805509C
	.align 2, 0
_08055038: .4byte 0x02022860
_0805503C:
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, r4
	beq _0805506A
	movs r2, #4
	ldrsh r0, [r6, r2]
	lsls r0, r0, #5
	ldr r1, [r6, #0x1c]
	adds r1, r1, r0
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r3, #0
	bl sub_08003078
	movs r0, #2
	ldrsh r1, [r6, r0]
	lsls r1, r1, #5
	ldr r0, _080550B4 @ =0x02022A60
	adds r1, r1, r0
	mov r0, r8
	movs r2, #8
	bl CpuFastSet
_0805506A:
	movs r1, #6
	ldrsh r0, [r6, r1]
	cmp r0, r4
	beq _08055098
	movs r2, #0xa
	ldrsh r0, [r6, r2]
	lsls r0, r0, #5
	ldr r1, [r6, #0x1c]
	adds r1, r1, r0
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r7, #0
	bl sub_08003078
	movs r0, #8
	ldrsh r1, [r6, r0]
	lsls r1, r1, #5
	ldr r0, _080550B4 @ =0x02022A60
	adds r1, r1, r0
	mov r0, sb
	movs r2, #8
	bl CpuFastSet
_08055098:
	bl EnablePalSync
_0805509C:
	ldrh r0, [r6, #0xe]
	adds r0, #1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bls _080550AA
	b _080552CA
_080550AA:
	lsls r0, r0, #2
	ldr r1, _080550B8 @ =_080550BC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080550B4: .4byte 0x02022A60
_080550B8: .4byte _080550BC
_080550BC: @ jump table
	.4byte _080550F0 @ case 0
	.4byte _080550D0 @ case 1
	.4byte _080550D8 @ case 2
	.4byte _080550E0 @ case 3
	.4byte _080550E8 @ case 4
_080550D0:
	movs r0, #1
	bl EnableBgSync
	b _080552CA
_080550D8:
	movs r0, #2
	bl EnableBgSync
	b _080552CA
_080550E0:
	movs r0, #4
	bl EnableBgSync
	b _080552CA
_080550E8:
	movs r0, #8
	bl EnableBgSync
	b _080552CA
_080550F0:
	movs r0, #0
	str r0, [r6, #0x14]
	str r0, [r6, #0x18]
	movs r2, #0
	ldrsh r1, [r6, r2]
	subs r0, #1
	cmp r1, r0
	beq _080551DE
	movs r1, #0xc
	ldrsh r0, [r6, r1]
	cmp r0, #4
	bhi _080551DE
	lsls r0, r0, #2
	ldr r1, _08055114 @ =_08055118
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08055114: .4byte _08055118
_08055118: @ jump table
	.4byte _0805512C @ case 0
	.4byte _08055158 @ case 1
	.4byte _08055184 @ case 2
	.4byte _080551B0 @ case 3
	.4byte _0805512C @ case 4
_0805512C:
	movs r2, #2
	ldrsh r0, [r6, r2]
	lsls r0, r0, #0xc
	ldrh r1, [r6, #4]
	orrs r0, r1
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _08055154 @ =0x08B9CC84
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0x48
	b _080551D4
	.align 2, 0
_08055154: .4byte 0x08B9CC84
_08055158:
	movs r1, #2
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r2, [r6, #4]
	orrs r0, r2
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _08055180 @ =0x08B9CB84
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0x20
	b _080551D4
	.align 2, 0
_08055180: .4byte 0x08B9CB84
_08055184:
	movs r1, #2
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r2, [r6, #4]
	orrs r0, r2
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _080551AC @ =0x08B9CB84
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0x40
	b _080551D4
	.align 2, 0
_080551AC: .4byte 0x08B9CB84
_080551B0:
	movs r1, #2
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r2, [r6, #4]
	orrs r0, r2
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _080551FC @ =0x08B9CC84
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0x78
_080551D4:
	movs r1, #0x68
	movs r3, #2
	bl sub_08067300
	str r0, [r6, #0x14]
_080551DE:
	movs r0, #6
	ldrsh r1, [r6, r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080552CA
	movs r1, #0xc
	ldrsh r0, [r6, r1]
	cmp r0, #4
	bhi _080552CA
	lsls r0, r0, #2
	ldr r1, _08055200 @ =_08055204
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080551FC: .4byte 0x08B9CC84
_08055200: .4byte _08055204
_08055204: @ jump table
	.4byte _08055218 @ case 0
	.4byte _08055244 @ case 1
	.4byte _08055270 @ case 2
	.4byte _0805529C @ case 3
	.4byte _08055218 @ case 4
_08055218:
	movs r2, #8
	ldrsh r0, [r6, r2]
	lsls r0, r0, #0xc
	ldrh r1, [r6, #0xa]
	orrs r0, r1
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _08055240 @ =0x08B9CC04
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xa8
	b _080552C0
	.align 2, 0
_08055240: .4byte 0x08B9CC04
_08055244:
	movs r1, #8
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r2, [r6, #0xa]
	orrs r0, r2
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _0805526C @ =0x08B9CAF8
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xb0
	b _080552C0
	.align 2, 0
_0805526C: .4byte 0x08B9CAF8
_08055270:
	movs r1, #8
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r2, [r6, #0xa]
	orrs r0, r2
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _08055298 @ =0x08B9CAF8
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xb0
	b _080552C0
	.align 2, 0
_08055298: .4byte 0x08B9CAF8
_0805529C:
	movs r1, #8
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r2, [r6, #0xa]
	orrs r0, r2
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _080552D8 @ =0x08B9CAF8
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0x80
_080552C0:
	movs r1, #0x68
	movs r3, #2
	bl sub_08067300
	str r0, [r6, #0x18]
_080552CA:
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080552D8: .4byte 0x08B9CAF8

	thumb_func_start sub_080552DC
sub_080552DC: @ 0x080552DC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xe
	ldrsh r1, [r4, r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08055300
	ldr r0, [r4, #0x14]
	cmp r0, #0
	beq _080552F6
	bl Proc_End
_080552F6:
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _08055300
	bl Proc_End
_08055300:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08055308
sub_08055308: @ 0x08055308
	push {r4, r5, lr}
	ldr r4, [sp, #0xc]
	ldr r5, [r0, #0x14]
	strh r1, [r5, #0x32]
	strh r2, [r5, #0x3a]
	ldr r5, [r0, #0x18]
	strh r3, [r5, #0x32]
	strh r4, [r5, #0x3a]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08055320
sub_08055320: @ 0x08055320
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	adds r7, r0, #0
	movs r4, #0
	mov sl, r4
	ldr r0, _08055364 @ =0x08B9B29C
	movs r2, #0xc
	ldrsh r1, [r7, r2]
	lsls r2, r1, #3
	adds r2, r2, r0
	ldr r2, [r2]
	str r2, [sp, #0x10]
	lsls r1, r1, #1
	adds r1, #1
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r1, [r1]
	str r1, [sp, #0x14]
	movs r0, #0
	bl sub_08050798
	movs r1, #0xc
	ldrsh r0, [r7, r1]
	cmp r0, #4
	bhi _080553B4
	lsls r0, r0, #2
	ldr r1, _08055368 @ =_0805536C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08055364: .4byte 0x08B9B29C
_08055368: .4byte _0805536C
_0805536C: @ jump table
	.4byte _08055380 @ case 0
	.4byte _08055388 @ case 1
	.4byte _080553A0 @ case 2
	.4byte _080553B4 @ case 3
	.4byte _08055380 @ case 4
_08055380:
	movs r4, #0x21
	movs r2, #0x30
	mov sl, r2
	b _080553D4
_08055388:
	movs r4, #0x1d
	movs r0, #0x30
	mov sl, r0
	ldr r0, _0805539C @ =0x02017744
	ldr r0, [r0]
	movs r5, #4
	rsbs r5, r5, #0
_08055396:
	cmp r0, #1
	bne _080553D6
	b _080553D4
	.align 2, 0
_0805539C: .4byte 0x02017744
_080553A0:
	movs r4, #3
	movs r1, #0x30
	mov sl, r1
	ldr r0, _080553B0 @ =0x02017744
	ldr r0, [r0]
	movs r5, #0x1e
	rsbs r5, r5, #0
	b _08055396
	.align 2, 0
_080553B0: .4byte 0x02017744
_080553B4:
	movs r2, #0
	ldrsh r0, [r7, r2]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080553C6
	movs r4, #0x27
	movs r0, #3
	mov sl, r0
_080553C6:
	movs r2, #6
	ldrsh r0, [r7, r2]
	cmp r0, r1
	beq _080553D4
	movs r4, #3
	movs r0, #0x2a
	mov sl, r0
_080553D4:
	movs r5, #0
_080553D6:
	movs r1, #1
	rsbs r1, r1, #0
	mov sb, r1
	lsls r2, r4, #1
	ldr r4, _0805545C @ =0x0201CF78
	adds r2, r2, r4
	movs r0, #0xf
	mov r8, r0
	str r0, [sp]
	movs r6, #5
	str r6, [sp, #4]
	movs r1, #2
	ldrsh r0, [r7, r1]
	str r0, [sp, #8]
	movs r1, #4
	ldrsh r0, [r7, r1]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	mov r1, sb
	movs r3, #0x42
	bl sub_08066B2C
	mov r0, sl
	lsls r2, r0, #1
	adds r2, r2, r4
	mov r1, r8
	str r1, [sp]
	str r6, [sp, #4]
	movs r1, #8
	ldrsh r0, [r7, r1]
	str r0, [sp, #8]
	movs r1, #0xa
	ldrsh r0, [r7, r1]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x14]
	mov r1, sb
	movs r3, #0x42
	bl sub_08066B2C
	lsls r0, r5, #1
	adds r4, r4, r0
	ldr r2, _08055460 @ =0xFFFFFA96
	adds r4, r4, r2
	ldr r2, _08055464 @ =0x02023C60
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x14
	str r0, [sp, #4]
	mov r0, sb
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0x42
	movs r3, #0x20
	bl sub_08066B2C
	movs r0, #4
	bl EnableBgSync
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805545C: .4byte 0x0201CF78
_08055460: .4byte 0xFFFFFA96
_08055464: .4byte 0x02023C60

	thumb_func_start sub_08055468
sub_08055468: @ 0x08055468
	push {lr}
	sub sp, #0x10
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bhi _080554B0
	lsls r0, r0, #2
	ldr r1, _08055484 @ =_08055488
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08055484: .4byte _08055488
_08055488: @ jump table
	.4byte _0805549C @ case 0
	.4byte _080554A6 @ case 1
	.4byte _080554B0 @ case 2
	.4byte _080554B0 @ case 3
	.4byte _0805549C @ case 4
_0805549C:
	movs r2, #0x30
	cmp r3, #0
	bne _080554B8
	movs r2, #0x21
	b _080554B8
_080554A6:
	movs r2, #0x30
	cmp r3, #0
	bne _080554B8
	movs r2, #0x1d
	b _080554B8
_080554B0:
	movs r2, #0x30
	cmp r3, #0
	bne _080554B8
	movs r2, #3
_080554B8:
	ldr r0, _080554DC @ =0x081D85AE
	movs r1, #1
	rsbs r1, r1, #0
	lsls r2, r2, #1
	ldr r3, _080554E0 @ =0x0201CF78
	adds r2, r2, r3
	movs r3, #0xf
	str r3, [sp]
	movs r3, #5
	str r3, [sp, #4]
	str r1, [sp, #8]
	str r1, [sp, #0xc]
	movs r3, #0x42
	bl sub_08066B2C
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_080554DC: .4byte 0x081D85AE
_080554E0: .4byte 0x0201CF78

	thumb_func_start sub_080554E4
sub_080554E4: @ 0x080554E4
	ldr r1, _080554EC @ =0x0203E0F0
	str r0, [r1]
	bx lr
	.align 2, 0
_080554EC: .4byte 0x0203E0F0

	thumb_func_start sub_080554F0
sub_080554F0: @ 0x080554F0
	ldr r0, _080554F8 @ =0x0203E0F0
	ldr r0, [r0]
	bx lr
	.align 2, 0
_080554F8: .4byte 0x0203E0F0

	thumb_func_start sub_080554FC
sub_080554FC: @ 0x080554FC
	push {r4, lr}
	sub sp, #0x10
	asrs r4, r0, #3
	movs r1, #7
	ands r1, r0
	movs r0, #3
	movs r2, #0
	bl SetBgOffset
	lsls r4, r4, #1
	ldr r0, _0805553C @ =0x0201D42C
	adds r4, r4, r0
	ldr r2, _08055540 @ =0x02024460
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x16
	str r0, [sp, #4]
	subs r0, #0x17
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0x42
	movs r3, #0x20
	bl sub_08066B2C
	movs r0, #8
	bl EnableBgSync
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805553C: .4byte 0x0201D42C
_08055540: .4byte 0x02024460

	thumb_func_start sub_08055544
sub_08055544: @ 0x08055544
	push {lr}
	bl sub_080554F0
	cmp r0, #0
	beq _08055558
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x8f
	bl sub_080675C8
_08055558:
	pop {r0}
	bx r0

	thumb_func_start sub_0805555C
sub_0805555C: @ 0x0805555C
	push {lr}
	bl sub_080554F0
	cmp r0, #0
	beq _0805556C
	movs r0, #0x8e
	bl sub_0806767C
_0805556C:
	pop {r0}
	bx r0

	thumb_func_start sub_08055570
sub_08055570: @ 0x08055570
	push {lr}
	bl sub_0804B1AC
	bl sub_08006508
	bl sub_0804D43C
	ldr r1, _08055590 @ =0x02017744
	str r0, [r1]
	bl sub_080555AC
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0
	.align 2, 0
_08055590: .4byte 0x02017744

	thumb_func_start sub_08055594
sub_08055594: @ 0x08055594
	push {lr}
	bl sub_08006508
	bl sub_08055734
	ldr r0, _080555A8 @ =sub_08050A38
	bl sub_080019B8
	pop {r0}
	bx r0
	.align 2, 0
_080555A8: .4byte sub_08050A38

	thumb_func_start sub_080555AC
sub_080555AC: @ 0x080555AC
	push {lr}
	ldr r0, _080555BC @ =0x08B9B30C
	movs r1, #3
	bl SpawnProc
	pop {r0}
	bx r0
	.align 2, 0
_080555BC: .4byte 0x08B9B30C

	thumb_func_start sub_080555C0
sub_080555C0: @ 0x080555C0
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	movs r0, #0
	bl sub_0800322C
	ldr r1, _08055634 @ =0x02017744
	ldr r0, _08055638 @ =0x0203E00C
	movs r2, #0
	ldrsh r0, [r0, r2]
	str r0, [r1]
	bl sub_0804CF5C
	bl sub_08054024
	bl sub_0804C1D0
	bl sub_0804CD64
	bl sub_0804B218
	ldr r0, _0805563C @ =0x081DE59C
	ldr r4, _08055640 @ =0x02022920
	adds r1, r4, #0
	movs r2, #0x20
	bl CpuFastSet
	subs r4, #0xc0
	ldr r5, _08055644 @ =0x020165C8
	movs r6, #0x80
	lsls r6, r6, #1
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl CpuFastSet
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	movs r3, #0x10
	bl sub_08066EE8
	bl EnablePalSync
	mov r0, r8
	bl Proc_Break
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08055634: .4byte 0x02017744
_08055638: .4byte 0x0203E00C
_0805563C: .4byte 0x081DE59C
_08055640: .4byte 0x02022920
_08055644: .4byte 0x020165C8

	thumb_func_start sub_08055648
sub_08055648: @ 0x08055648
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, _080556A8 @ =0x081DB790
	ldr r1, _080556AC @ =0x06008000
	bl sub_080BFA24
	ldr r0, _080556B0 @ =0x081DDDFC
	ldr r6, _080556B4 @ =0x02019784
	adds r1, r6, #0
	bl sub_080BFA28
	movs r1, #1
	rsbs r1, r1, #0
	ldr r2, _080556B8 @ =0x0201D41C
	movs r0, #0x2e
	str r0, [sp]
	movs r0, #0x14
	str r0, [sp, #4]
	movs r0, #6
	str r0, [sp, #8]
	movs r4, #0
	str r4, [sp, #0xc]
	adds r0, r6, #0
	movs r3, #0x42
	bl sub_08066B2C
	movs r0, #0
	bl sub_080554FC
	movs r0, #8
	bl EnableBgSync
	strh r4, [r5, #0x2c]
	movs r0, #0x10
	strh r0, [r5, #0x2e]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x8e
	bl sub_080675C8
	adds r0, r5, #0
	bl Proc_Break
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080556A8: .4byte 0x081DB790
_080556AC: .4byte 0x06008000
_080556B0: .4byte 0x081DDDFC
_080556B4: .4byte 0x02019784
_080556B8: .4byte 0x0201D41C

	thumb_func_start sub_080556BC
sub_080556BC: @ 0x080556BC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r1, #0x2e
	ldrsh r0, [r6, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl sub_08012FE8
	adds r5, r0, #0
	ldr r0, _08055718 @ =0x020165C8
	ldr r4, _0805571C @ =0x02022860
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r4, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r5, #0
	bl sub_08066EE8
	bl EnablePalSync
	ldrh r1, [r6, #0x2c]
	adds r1, #1
	strh r1, [r6, #0x2c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x2e
	ldrsh r0, [r6, r2]
	adds r0, #1
	cmp r1, r0
	bne _08055710
	adds r0, r6, #0
	bl Proc_Break
_08055710:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08055718: .4byte 0x020165C8
_0805571C: .4byte 0x02022860

	thumb_func_start sub_08055720
sub_08055720: @ 0x08055720
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08055808
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08055734
sub_08055734: @ 0x08055734
	push {lr}
	ldr r0, _08055748 @ =0x08B9B33C
	movs r1, #3
	bl SpawnProc
	bl sub_0805583C
	pop {r0}
	bx r0
	.align 2, 0
_08055748: .4byte 0x08B9B33C

	thumb_func_start sub_0805574C
sub_0805574C: @ 0x0805574C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08055770 @ =0x02022860
	ldr r1, _08055774 @ =0x020165C8
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuFastSet
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x10
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08055770: .4byte 0x02022860
_08055774: .4byte 0x020165C8

	thumb_func_start sub_08055778
sub_08055778: @ 0x08055778
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r1, #0x2e
	ldrsh r0, [r6, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl sub_08012FE8
	adds r5, r0, #0
	ldr r0, _080557D4 @ =0x020165C8
	ldr r4, _080557D8 @ =0x02022860
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r4, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r5, #0
	bl sub_08066EE8
	bl EnablePalSync
	ldrh r1, [r6, #0x2c]
	adds r1, #1
	strh r1, [r6, #0x2c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x2e
	ldrsh r0, [r6, r2]
	adds r0, #1
	cmp r1, r0
	bne _080557CC
	adds r0, r6, #0
	bl Proc_Break
_080557CC:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080557D4: .4byte 0x020165C8
_080557D8: .4byte 0x02022860

	thumb_func_start sub_080557DC
sub_080557DC: @ 0x080557DC
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0804B1D8
	bl sub_0804C438
	ldr r0, _08055800 @ =sub_0801529C
	bl sub_080019B8
	ldr r0, _08055804 @ =OnVBlank
	bl SetOnVBlank
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08055800: .4byte sub_0801529C
_08055804: .4byte OnVBlank

	thumb_func_start sub_08055808
sub_08055808: @ 0x08055808
	push {r4, lr}
	ldr r4, _0805582C @ =0x0201FB18
	ldr r0, _08055830 @ =0x08B9B364
	movs r1, #3
	bl SpawnProc
	str r0, [r4]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _08055834 @ =0x081D8644
	str r1, [r0, #0x48]
	ldr r1, _08055838 @ =0x08B9B37C
	str r1, [r0, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805582C: .4byte 0x0201FB18
_08055830: .4byte 0x08B9B364
_08055834: .4byte 0x081D8644
_08055838: .4byte 0x08B9B37C

	thumb_func_start sub_0805583C
sub_0805583C: @ 0x0805583C
	push {lr}
	ldr r0, _0805584C @ =0x0201FB18
	ldr r0, [r0]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_0805584C: .4byte 0x0201FB18

	thumb_func_start sub_08055850
sub_08055850: @ 0x08055850
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_080506E4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	blt _0805587C
	ldr r1, [r4, #0x4c]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _08055884 @ =0x02022920
	movs r2, #0x20
	bl CpuFastSet
	bl EnablePalSync
_0805587C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08055884: .4byte 0x02022920

	thumb_func_start sub_08055888
sub_08055888: @ 0x08055888
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _080558B0 @ =0x0203E024
	bl sub_08054678
	lsls r0, r0, #1
	adds r0, r0, r4
	ldr r1, _080558B4 @ =0x08BA13D0
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r5, #0
	bl _call_via_r1
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080558B0: .4byte 0x0203E024
_080558B4: .4byte 0x08BA13D0

	thumb_func_start sub_080558B8
sub_080558B8: @ 0x080558B8
	bx lr
	.align 2, 0

	thumb_func_start sub_080558BC
sub_080558BC: @ 0x080558BC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r7, [sp, #0x18]
	ldr r1, _080558F8 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080558FC @ =0x08BA14E4
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r5, [r0, #0x44]
	str r6, [r0, #0x48]
	mov r1, r8
	str r1, [r0, #0x4c]
	str r7, [r0, #0x50]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080558F8: .4byte 0x0201774C
_080558FC: .4byte 0x08BA14E4

	thumb_func_start sub_08055900
sub_08055900: @ 0x08055900
	ldr r1, _0805590C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_0805590C: .4byte 0x0201774C

	thumb_func_start sub_08055910
sub_08055910: @ 0x08055910
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r2, r0, #0
	ldr r0, _08055990 @ =0x0201FDAC
	ldr r0, [r0]
	ldr r4, _08055994 @ =0x0201FDB8
	cmp r0, #0
	bne _08055928
	ldr r4, _08055998 @ =0x0201FEF8
_08055928:
	ldrh r0, [r2, #0x2e]
	lsls r1, r0, #0x18
	lsrs r3, r1, #0x18
	ldr r1, [r2, #0x50]
	adds r0, r0, r1
	strh r0, [r2, #0x2e]
	movs r1, #0
	ldr r0, [r2, #0x44]
	mov r8, r0
	ldr r6, [r2, #0x48]
	mov sl, r6
	ldr r7, _0805599C @ =0x08BDACBC
	mov ip, r7
	ldr r5, [r2, #0x4c]
	ldr r0, _080559A0 @ =0x03002870
	mov sb, r0
_08055948:
	mov r6, sl
	adds r0, r3, r6
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r0, r3, #1
	add r0, ip
	movs r7, #0
	ldrsh r0, [r0, r7]
	muls r0, r5, r0
	lsls r0, r0, #8
	lsrs r0, r0, #0x10
	mov r6, sb
	ldrh r6, [r6, #0x20]
	adds r0, r6, r0
	strh r0, [r4]
	adds r4, #2
	adds r1, #1
	cmp r1, #0x77
	bls _08055948
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r8
	bne _08055982
	adds r0, r2, #0
	bl Proc_End
_08055982:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08055990: .4byte 0x0201FDAC
_08055994: .4byte 0x0201FDB8
_08055998: .4byte 0x0201FEF8
_0805599C: .4byte 0x08BDACBC
_080559A0: .4byte 0x03002870

	thumb_func_start sub_080559A4
sub_080559A4: @ 0x080559A4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _080559E4 @ =0x08BA1504
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r5, [r0, #0x44]
	ldr r2, _080559E8 @ =0x0201FDB8
_080559BE:
	lsrs r0, r1, #1
	rsbs r0, r0, #0
	strh r0, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0x77
	bls _080559BE
	ldr r2, _080559EC @ =0x0201FEF8
	movs r1, #0
_080559D0:
	lsrs r0, r1, #1
	rsbs r0, r0, #0
	strh r0, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0x77
	bls _080559D0
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080559E4: .4byte 0x08BA1504
_080559E8: .4byte 0x0201FDB8
_080559EC: .4byte 0x0201FEF8

	thumb_func_start sub_080559F0
sub_080559F0: @ 0x080559F0
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r2, #0x44]
	cmp r0, r1
	bne _08055A0A
	adds r0, r2, #0
	bl Proc_Break
_08055A0A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08055A10
sub_08055A10: @ 0x08055A10
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _08055A38 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08055A3C @ =0x08BA151C
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r5, [r0, #0x44]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08055A38: .4byte 0x0201774C
_08055A3C: .4byte 0x08BA151C

	thumb_func_start sub_08055A40
sub_08055A40: @ 0x08055A40
	ldr r1, _08055A4C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_08055A4C: .4byte 0x0201774C

	thumb_func_start sub_08055A50
sub_08055A50: @ 0x08055A50
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r0, _08055A8C @ =0x0201FDAC
	ldr r0, [r0]
	ldr r1, _08055A90 @ =0x0201FDB8
	cmp r0, #0
	bne _08055A60
	ldr r1, _08055A94 @ =0x0201FEF8
_08055A60:
	movs r2, #0
	ldr r5, [r3, #0x44]
	ldr r4, _08055A98 @ =0x03002870
_08055A66:
	ldrh r0, [r4, #0x20]
	strh r0, [r1]
	adds r1, #2
	adds r2, #1
	cmp r2, #0x77
	bls _08055A66
	ldrh r0, [r3, #0x2c]
	adds r0, #1
	strh r0, [r3, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r5
	bne _08055A86
	adds r0, r3, #0
	bl Proc_End
_08055A86:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08055A8C: .4byte 0x0201FDAC
_08055A90: .4byte 0x0201FDB8
_08055A94: .4byte 0x0201FEF8
_08055A98: .4byte 0x03002870

	thumb_func_start sub_08055A9C
sub_08055A9C: @ 0x08055A9C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	ldr r1, _08055AE4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08055AE8 @ =0x08BA153C
	movs r1, #3
	bl SpawnProc
	adds r7, r0, #0
	mov r0, r8
	str r0, [r7, #0x5c]
	movs r1, #0
	mov sb, r1
	movs r0, #0
	strh r0, [r7, #0x2c]
	strh r0, [r7, #0x2e]
	str r4, [r7, #0x44]
	str r5, [r7, #0x54]
	str r6, [r7, #0x58]
	mov r0, r8
	bl sub_080547A8
	bl sub_08054678
	cmp r0, #0
	bne _08055AF0
	ldr r0, _08055AEC @ =0x0000FFB8
	b _08055AF2
	.align 2, 0
_08055AE4: .4byte 0x0201774C
_08055AE8: .4byte 0x08BA153C
_08055AEC: .4byte 0x0000FFB8
_08055AF0:
	ldr r0, _08055B10 @ =0x0000FFF8
_08055AF2:
	strh r0, [r7, #0x32]
	ldr r0, _08055B14 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08055B1E
	mov r0, r8
	bl sub_08054678
	cmp r0, #0
	bne _08055B18
	ldrh r0, [r7, #0x32]
	adds r0, #0x18
	b _08055B1C
	.align 2, 0
_08055B10: .4byte 0x0000FFF8
_08055B14: .4byte 0x0203E02C
_08055B18:
	ldrh r0, [r7, #0x32]
	subs r0, #0x18
_08055B1C:
	strh r0, [r7, #0x32]
_08055B1E:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08055B2C
sub_08055B2C: @ 0x08055B2C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, _08055B74 @ =0x0201FB20
	ldr r0, [r0]
	ldr r5, _08055B78 @ =0x0201FB2C
	cmp r0, #0
	bne _08055B3C
	ldr r5, _08055B7C @ =0x0201FC6C
_08055B3C:
	ldr r1, [r4, #0x54]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r2, [r0]
	ldr r1, [r4, #0x58]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r3, [r0]
	ldr r0, _08055B80 @ =0x0000FFFF
	cmp r2, r0
	beq _08055BA8
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	movs r2, #0
	ldr r6, [r4, #0x44]
	ldr r7, _08055B84 @ =0x00007FFF
	mov ip, r7
_08055B64:
	ldrh r1, [r3]
	movs r7, #0
	ldrsh r0, [r3, r7]
	cmp r0, ip
	bne _08055B88
	movs r0, #0
	b _08055B9A
	.align 2, 0
_08055B74: .4byte 0x0201FB20
_08055B78: .4byte 0x0201FB2C
_08055B7C: .4byte 0x0201FC6C
_08055B80: .4byte 0x0000FFFF
_08055B84: .4byte 0x00007FFF
_08055B88:
	ldrh r0, [r4, #0x32]
	adds r1, r1, r0
	ldrh r7, [r3, #2]
	adds r0, r0, r7
	lsls r1, r1, #0x10
	asrs r1, r1, #8
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	orrs r0, r1
_08055B9A:
	strh r0, [r5]
	adds r3, #4
	adds r5, #2
	adds r2, #1
	cmp r2, #0x77
	bls _08055B64
	b _08055BB8
_08055BA8:
	movs r2, #0
	ldr r6, [r4, #0x44]
	movs r0, #0
_08055BAE:
	strh r0, [r5]
	adds r5, #2
	adds r2, #1
	cmp r2, #0x77
	bls _08055BAE
_08055BB8:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, r6
	bne _08055BD4
	ldr r1, _08055BDC @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08055BD4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08055BDC: .4byte 0x0201774C

	thumb_func_start sub_08055BE0
sub_08055BE0: @ 0x08055BE0
	ldr r0, _08055BFC @ =0x04000004
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08055BFA
	ldr r3, _08055C00 @ =0x04000014
	ldr r2, _08055C04 @ =0x0201FDB4
	ldr r0, [r2]
	ldrh r1, [r0]
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
_08055BFA:
	bx lr
	.align 2, 0
_08055BFC: .4byte 0x04000004
_08055C00: .4byte 0x04000014
_08055C04: .4byte 0x0201FDB4

	thumb_func_start sub_08055C08
sub_08055C08: @ 0x08055C08
	ldr r0, _08055C24 @ =0x04000004
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08055C22
	ldr r3, _08055C28 @ =0x04000016
	ldr r2, _08055C2C @ =0x0201FDB4
	ldr r0, [r2]
	ldrh r1, [r0]
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
_08055C22:
	bx lr
	.align 2, 0
_08055C24: .4byte 0x04000004
_08055C28: .4byte 0x04000016
_08055C2C: .4byte 0x0201FDB4

	thumb_func_start sub_08055C30
sub_08055C30: @ 0x08055C30
	ldr r0, _08055C5C @ =0x04000004
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08055C58
	ldr r3, _08055C60 @ =0x0400001A
	ldr r2, _08055C64 @ =0x0201FB28
	ldr r0, [r2]
	ldrh r1, [r0]
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
	subs r3, #6
	ldr r2, _08055C68 @ =0x0201FDB4
	ldr r0, [r2]
	ldrh r1, [r0]
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
_08055C58:
	bx lr
	.align 2, 0
_08055C5C: .4byte 0x04000004
_08055C60: .4byte 0x0400001A
_08055C64: .4byte 0x0201FB28
_08055C68: .4byte 0x0201FDB4

	thumb_func_start sub_08055C6C
sub_08055C6C: @ 0x08055C6C
	ldr r0, _08055C98 @ =0x04000004
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08055C94
	ldr r3, _08055C9C @ =0x0400001A
	ldr r2, _08055CA0 @ =0x0201FB28
	ldr r0, [r2]
	ldrh r1, [r0]
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
	subs r3, #4
	ldr r2, _08055CA4 @ =0x0201FDB4
	ldr r0, [r2]
	ldrh r1, [r0]
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
_08055C94:
	bx lr
	.align 2, 0
_08055C98: .4byte 0x04000004
_08055C9C: .4byte 0x0400001A
_08055CA0: .4byte 0x0201FB28
_08055CA4: .4byte 0x0201FDB4

	thumb_func_start sub_08055CA8
sub_08055CA8: @ 0x08055CA8
	ldr r0, _08055CC4 @ =0x04000004
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08055CC2
	ldr r3, _08055CC8 @ =0x0400001A
	ldr r2, _08055CCC @ =0x0201FB28
	ldr r0, [r2]
	ldrh r1, [r0]
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
_08055CC2:
	bx lr
	.align 2, 0
_08055CC4: .4byte 0x04000004
_08055CC8: .4byte 0x0400001A
_08055CCC: .4byte 0x0201FB28

	thumb_func_start sub_08055CD0
sub_08055CD0: @ 0x08055CD0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp]
	str r1, [sp, #4]
	adds r4, r3, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r1, _08055D6C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r6, _08055D70 @ =0x0201FDB8
	ldr r7, _08055D74 @ =0x0201FEF8
	ldr r0, _08055D78 @ =0x0201FDAC
	mov sl, r0
	cmp r4, #2
	bne _08055D32
	ldr r1, _08055D7C @ =0x0201FB2C
	movs r0, #0
	adds r5, r1, #0
	ldr r3, _08055D80 @ =0x0201FB20
	mov ip, r3
	ldr r3, _08055D84 @ =0x0201FB24
	mov r8, r3
	ldr r3, _08055D88 @ =0x0201FB28
	mov sb, r3
_08055D0C:
	strh r2, [r1]
	adds r1, #2
	adds r0, #1
	cmp r0, #0x9f
	bls _08055D0C
	ldr r1, _08055D8C @ =0x0201FC6C
	movs r0, #0
_08055D1A:
	strh r2, [r1]
	adds r1, #2
	adds r0, #1
	cmp r0, #0x9f
	bls _08055D1A
	movs r0, #0
	mov r1, ip
	str r0, [r1]
	mov r3, r8
	str r5, [r3]
	mov r0, sb
	str r5, [r0]
_08055D32:
	adds r1, r6, #0
	movs r0, #0
_08055D36:
	strh r2, [r1]
	adds r1, #2
	adds r0, #1
	cmp r0, #0x9f
	bls _08055D36
	adds r1, r7, #0
	movs r0, #0
_08055D44:
	strh r2, [r1]
	adds r1, #2
	adds r0, #1
	cmp r0, #0x9f
	bls _08055D44
	movs r0, #0
	mov r1, sl
	str r0, [r1]
	ldr r3, _08055D90 @ =0x0201FDB0
	str r6, [r3]
	ldr r0, _08055D94 @ =0x0201FDB4
	str r6, [r0]
	cmp r4, #1
	beq _08055DB8
	cmp r4, #1
	blo _08055D98
	cmp r4, #2
	beq _08055DD8
	b _08055DE6
	.align 2, 0
_08055D6C: .4byte 0x0201774C
_08055D70: .4byte 0x0201FDB8
_08055D74: .4byte 0x0201FEF8
_08055D78: .4byte 0x0201FDAC
_08055D7C: .4byte 0x0201FB2C
_08055D80: .4byte 0x0201FB20
_08055D84: .4byte 0x0201FB24
_08055D88: .4byte 0x0201FB28
_08055D8C: .4byte 0x0201FC6C
_08055D90: .4byte 0x0201FDB0
_08055D94: .4byte 0x0201FDB4
_08055D98:
	bl sub_08064AE0
	cmp r0, #0
	bne _08055DAC
	ldr r0, _08055DA8 @ =sub_08055BE0
	bl SetOnHBlankA
	b _08055DE6
	.align 2, 0
_08055DA8: .4byte sub_08055BE0
_08055DAC:
	ldr r0, _08055DB4 @ =sub_08055C30
	bl SetOnHBlankA
	b _08055DE6
	.align 2, 0
_08055DB4: .4byte sub_08055C30
_08055DB8:
	bl sub_08064AE0
	cmp r0, #0
	bne _08055DCC
	ldr r0, _08055DC8 @ =sub_08055C08
	bl SetOnHBlankA
	b _08055DE6
	.align 2, 0
_08055DC8: .4byte sub_08055C08
_08055DCC:
	ldr r0, _08055DD4 @ =sub_08055C6C
	bl SetOnHBlankA
	b _08055DE6
	.align 2, 0
_08055DD4: .4byte sub_08055C6C
_08055DD8:
	bl sub_08064AE0
	cmp r0, #0
	bne _08055DE6
	ldr r0, _08055E0C @ =sub_08055C08
	bl SetOnHBlankA
_08055DE6:
	ldr r0, _08055E10 @ =0x08BA1554
	movs r1, #0
	bl SpawnProc
	ldr r1, [sp]
	str r1, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	ldr r3, [sp, #4]
	str r3, [r0, #0x44]
	str r4, [r0, #0x48]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08055E0C: .4byte sub_08055C08
_08055E10: .4byte 0x08BA1554

	thumb_func_start sub_08055E14
sub_08055E14: @ 0x08055E14
	push {lr}
	adds r3, r2, #0
	movs r2, #0
	bl sub_08055CD0
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08055E24
sub_08055E24: @ 0x08055E24
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08055E30
sub_08055E30: @ 0x08055E30
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08055E5C @ =0x0202BBB8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r3, _08055E60 @ =0x0201FB24
	ldr r2, _08055E64 @ =0x0201FDB0
	cmp r0, #0
	beq _08055EA8
	ldr r0, [r4, #0x48]
	cmp r0, #2
	bne _08055E78
	ldr r1, _08055E68 @ =0x0201FB20
	ldr r0, [r1]
	cmp r0, #1
	bne _08055E70
	movs r0, #0
	str r0, [r1]
	ldr r0, _08055E6C @ =0x0201FB2C
	b _08055E76
	.align 2, 0
_08055E5C: .4byte 0x0202BBB8
_08055E60: .4byte 0x0201FB24
_08055E64: .4byte 0x0201FDB0
_08055E68: .4byte 0x0201FB20
_08055E6C: .4byte 0x0201FB2C
_08055E70:
	movs r0, #1
	str r0, [r1]
	ldr r0, _08055E8C @ =0x0201FC6C
_08055E76:
	str r0, [r3]
_08055E78:
	ldr r1, _08055E90 @ =0x0201FDAC
	ldr r0, [r1]
	cmp r0, #1
	bne _08055E9C
	movs r0, #0
	str r0, [r1]
	ldr r1, _08055E94 @ =0x0201FDB0
	ldr r0, _08055E98 @ =0x0201FDB8
	b _08055EA4
	.align 2, 0
_08055E8C: .4byte 0x0201FC6C
_08055E90: .4byte 0x0201FDAC
_08055E94: .4byte 0x0201FDB0
_08055E98: .4byte 0x0201FDB8
_08055E9C:
	movs r0, #1
	str r0, [r1]
	ldr r1, _08055EDC @ =0x0201FDB0
	ldr r0, _08055EE0 @ =0x0201FEF8
_08055EA4:
	str r0, [r1]
	adds r2, r1, #0
_08055EA8:
	ldr r1, _08055EE4 @ =0x0201FB28
	ldr r0, [r3]
	str r0, [r1]
	ldr r1, _08055EE8 @ =0x0201FDB4
	ldr r0, [r2]
	str r0, [r1]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r4, #0x44]
	cmp r0, r1
	bne _08055EFC
	ldr r0, _08055EEC @ =0x0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	bl sub_08064AE0
	cmp r0, #0
	bne _08055EF0
	movs r0, #0
	bl SetOnHBlankA
	b _08055EF6
	.align 2, 0
_08055EDC: .4byte 0x0201FDB0
_08055EE0: .4byte 0x0201FEF8
_08055EE4: .4byte 0x0201FB28
_08055EE8: .4byte 0x0201FDB4
_08055EEC: .4byte 0x0201774C
_08055EF0:
	ldr r0, _08055F04 @ =sub_08055CA8
	bl SetOnHBlankA
_08055EF6:
	adds r0, r4, #0
	bl Proc_Break
_08055EFC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08055F04: .4byte sub_08055CA8

	thumb_func_start sub_08055F08
sub_08055F08: @ 0x08055F08
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r7, [sp, #0x18]
	ldr r1, _08055F48 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08055F4C @ =0x08BA1574
	movs r1, #3
	bl SpawnProc
	str r5, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r4, [r0, #0x2e]
	adds r4, r4, r6
	strh r4, [r0, #0x30]
	mov r1, r8
	str r1, [r0, #0x44]
	str r7, [r0, #0x48]
	ldr r1, [sp, #0x1c]
	str r1, [r0, #0x4c]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08055F48: .4byte 0x0201774C
_08055F4C: .4byte 0x08BA1574

	thumb_func_start sub_08055F50
sub_08055F50: @ 0x08055F50
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r5, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	blt _08056044
	ldr r1, [r5, #0x44]
	ldr r2, [r5, #0x48]
	movs r6, #0x2c
	ldrsh r3, [r5, r6]
	movs r0, #0x2e
	ldrsh r4, [r5, r0]
	subs r3, r3, r4
	movs r6, #0x30
	ldrsh r0, [r5, r6]
	subs r0, r0, r4
	str r0, [sp]
	movs r0, #0
	bl sub_08012FE8
	adds r6, r0, #0
	ldr r0, [r5, #0x4c]
	cmp r0, #1
	beq _08055FC4
	cmp r0, #1
	bgt _08055F96
	cmp r0, #0
	beq _08055F9C
	b _0805602A
_08055F96:
	cmp r0, #2
	beq _08055FEC
	b _0805602A
_08055F9C:
	ldr r3, _08055FC0 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	strb r6, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	b _08056026
	.align 2, 0
_08055FC0: .4byte 0x03002870
_08055FC4:
	ldr r3, _08055FE8 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	strb r7, [r0]
	adds r0, #1
	strb r7, [r0]
	adds r0, #1
	strb r6, [r0]
	b _0805602A
	.align 2, 0
_08055FE8: .4byte 0x03002870
_08055FEC:
	movs r2, #0x2c
	ldrsh r3, [r5, r2]
	movs r0, #0x2e
	ldrsh r1, [r5, r0]
	subs r3, r3, r1
	movs r2, #0x30
	ldrsh r0, [r5, r2]
	subs r0, r0, r1
	str r0, [sp]
	movs r0, #0
	movs r1, #8
	movs r2, #0x10
	bl sub_08012FE8
	ldr r4, _0805604C @ =0x03002870
	adds r3, r4, #0
	adds r3, #0x3c
	movs r1, #0x3f
	ldrb r2, [r3]
	ands r1, r2
	movs r2, #0x40
	orrs r1, r2
	strb r1, [r3]
	adds r1, r4, #0
	adds r1, #0x44
	strb r6, [r1]
	adds r1, #1
	strb r0, [r1]
	adds r0, r4, #0
_08056026:
	adds r0, #0x46
	strb r7, [r0]
_0805602A:
	movs r6, #0x2c
	ldrsh r1, [r5, r6]
	movs r2, #0x30
	ldrsh r0, [r5, r2]
	cmp r1, r0
	blt _08056044
	ldr r1, _08056050 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
_08056044:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805604C: .4byte 0x03002870
_08056050: .4byte 0x0201774C

	thumb_func_start sub_08056054
sub_08056054: @ 0x08056054
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	mov r8, r0
	mov sb, r1
	mov sl, r2
	adds r5, r3, #0
	ldr r6, [sp, #0x1c]
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	ldr r1, _080560AC @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080560B0 @ =0x08BA158C
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	mov r0, r8
	str r0, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r0, [r4, #0x2e]
	mov r0, sb
	str r0, [r4, #0x44]
	mov r0, sl
	str r0, [r4, #0x54]
	mov r0, r8
	bl sub_080547A8
	strh r5, [r4, #0x32]
	strh r6, [r4, #0x3a]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080560AC: .4byte 0x0201774C
_080560B0: .4byte 0x08BA158C

	thumb_func_start sub_080560B4
sub_080560B4: @ 0x080560B4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	ldr r0, _08056134 @ =0x0201FB20
	ldr r0, [r0]
	ldr r1, _08056138 @ =0x0201FB2C
	mov r8, r1
	cmp r0, #0
	bne _080560CE
	ldr r2, _0805613C @ =0x0201FC6C
	mov r8, r2
_080560CE:
	ldr r4, [r5, #0x54]
	movs r7, #0x2e
	ldrsh r0, [r5, r7]
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r7, [r0]
	adds r0, r7, #0
	bl sub_08013450
	adds r6, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	lsls r0, r0, #1
	adds r0, r0, r4
	ldr r1, _08056140 @ =0x0000FFFF
	ldrh r0, [r0, #2]
	cmp r0, r1
	beq _080560F8
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
_080560F8:
	ldrh r1, [r5, #0x3a]
	subs r0, r1, r7
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge _08056106
	movs r2, #0
_08056106:
	adds r0, r7, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa0
	ble _08056114
	movs r1, #0xa0
_08056114:
	movs r3, #0
	lsls r0, r2, #0x10
	ldr r2, [r5, #0x44]
	mov ip, r2
	asrs r0, r0, #0x10
	mov sb, r0
	lsls r0, r1, #0x10
	asrs r4, r0, #0x10
_08056124:
	cmp sb, r3
	bhi _0805612C
	cmp r4, r3
	bhs _08056144
_0805612C:
	movs r0, #0
	mov r7, r8
	strh r0, [r7]
	b _08056174
	.align 2, 0
_08056134: .4byte 0x0201FB20
_08056138: .4byte 0x0201FB2C
_0805613C: .4byte 0x0201FC6C
_08056140: .4byte 0x0000FFFF
_08056144:
	ldrh r2, [r5, #0x32]
	ldrh r1, [r6]
	adds r0, r2, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r0, #0
	bge _08056154
	movs r1, #0
_08056154:
	ldrh r7, [r6, #2]
	adds r0, r2, r7
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf0
	ble _08056164
	movs r2, #0xf0
_08056164:
	lsls r1, r1, #0x10
	asrs r1, r1, #8
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	orrs r0, r1
	mov r1, r8
	strh r0, [r1]
	adds r6, #4
_08056174:
	movs r2, #2
	add r8, r2
	adds r3, #1
	cmp r3, #0x9f
	bls _08056124
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	movs r3, #0
	strh r0, [r5, #0x2c]
	movs r4, #0x2c
	ldrsh r0, [r5, r4]
	cmp r0, ip
	bne _080561BA
	ldr r1, _080561C8 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	ldr r2, _080561CC @ =0x03002870
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r7, [r1]
	ands r0, r7
	strb r0, [r1]
	adds r1, #8
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x45
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r0, r5, #0
	bl Proc_Break
_080561BA:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080561C8: .4byte 0x0201774C
_080561CC: .4byte 0x03002870

	thumb_func_start sub_080561D0
sub_080561D0: @ 0x080561D0
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	mov r8, r1
	adds r5, r2, #0
	ldr r1, _0805620C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08056210 @ =0x08BA15A4
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r6, [r4, #0x5c]
	adds r0, r5, #0
	movs r1, #0
	bl sub_0804E73C
	str r0, [r4, #0x60]
	movs r0, #0
	strh r0, [r4, #0x2c]
	mov r0, r8
	strh r0, [r4, #0x2e]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805620C: .4byte 0x0201774C
_08056210: .4byte 0x08BA15A4

	thumb_func_start sub_08056214
sub_08056214: @ 0x08056214
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	ldr r5, _080562A4 @ =0x02017760
	ldrh r1, [r5]
	ldrh r2, [r5, #2]
	movs r0, #2
	bl SetBgOffset
	ldr r4, _080562A8 @ =0x02000038
	ldrh r0, [r5]
	ldrh r2, [r4]
	adds r1, r0, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r3, [r5, #2]
	ldrh r0, [r4, #2]
	adds r2, r3, r0
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
	ldrh r2, [r4, #2]
	adds r1, r3, r2
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_0804C4B0
	ldrh r3, [r5]
	ldrh r1, [r4]
	adds r0, r3, r1
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r2, [r5, #2]
	ldrh r4, [r4, #2]
	adds r1, r2, r4
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl sub_0804CDFC
	bl sub_08064AE0
	cmp r0, #0
	beq _08056292
	ldrh r1, [r5]
	ldrh r2, [r5, #2]
	movs r0, #3
	bl SetBgOffset
_08056292:
	bl sub_08064AE0
	cmp r0, #0
	beq _080562B0
	ldr r3, _080562AC @ =0x02000028
	ldrh r4, [r3]
	ldrh r1, [r5]
	subs r0, r4, r1
	b _080562B8
	.align 2, 0
_080562A4: .4byte 0x02017760
_080562A8: .4byte 0x02000038
_080562AC: .4byte 0x02000028
_080562B0:
	ldr r3, _080563C8 @ =0x02000028
	ldrh r1, [r3]
	ldrh r2, [r5]
	adds r0, r1, r2
_080562B8:
	ldr r2, _080563CC @ =0x0201FB00
	ldr r1, [r2]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r1, _080563D0 @ =0x0200002C
	ldrh r4, [r1]
	ldrh r5, [r5, #2]
	subs r0, r4, r5
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	mov sb, r3
	mov sl, r1
	ldr r2, _080563D4 @ =0x02017760
	mov r1, sb
	ldrh r1, [r1, #2]
	ldrh r3, [r2]
	adds r0, r1, r3
	ldr r4, _080563CC @ =0x0201FB00
	ldr r1, [r4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	mov r1, sl
	ldrh r1, [r1, #2]
	ldrh r2, [r2, #2]
	subs r0, r1, r2
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	lsls r2, r6, #0x10
	asrs r2, r2, #0x10
	movs r0, #0
	bl sub_080507D8
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	lsls r2, r4, #0x10
	asrs r2, r2, #0x10
	movs r0, #1
	bl sub_080507D8
	mov r2, r8
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	ldrh r3, [r2, #0x2e]
	lsls r1, r3, #0x10
	cmp r0, r1
	ble _080563BA
	ldr r1, _080563D8 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r4, _080563DC @ =0x02000038
	ldrh r1, [r4]
	ldrh r2, [r4, #2]
	movs r0, #0
	bl SetBgOffset
	ldrh r1, [r4]
	rsbs r0, r1, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r2, [r4, #2]
	rsbs r1, r2, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_0804C4B0
	ldrh r3, [r4]
	rsbs r0, r3, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r4, [r4, #2]
	rsbs r1, r4, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl sub_0804CDFC
	bl sub_08064AE0
	cmp r0, #0
	beq _08056378
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
_08056378:
	ldr r4, _080563CC @ =0x0201FB00
	ldr r0, [r4]
	mov r2, sb
	ldrh r2, [r2]
	subs r1, r2, r0
	mov r3, sb
	ldrh r3, [r3, #2]
	subs r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	mov r0, sl
	ldrh r4, [r0, #2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r3, #0
	ldrsh r2, [r0, r3]
	movs r0, #0
	bl sub_080507D8
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	lsls r2, r4, #0x10
	asrs r2, r2, #0x10
	movs r0, #1
	bl sub_080507D8
	mov r4, r8
	ldr r0, [r4, #0x60]
	bl Proc_End
	mov r0, r8
	bl Proc_Break
_080563BA:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080563C8: .4byte 0x02000028
_080563CC: .4byte 0x0201FB00
_080563D0: .4byte 0x0200002C
_080563D4: .4byte 0x02017760
_080563D8: .4byte 0x0201774C
_080563DC: .4byte 0x02000038

	thumb_func_start sub_080563E0
sub_080563E0: @ 0x080563E0
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0804FFF0
	bl sub_08050008
	ldr r0, _08056400 @ =0x08BA15BC
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08056400: .4byte 0x08BA15BC

	thumb_func_start sub_08056404
sub_08056404: @ 0x08056404
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl sub_080547A8
	adds r4, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	movs r6, #0
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805642A
	movs r0, #9
	ldrh r1, [r4, #0x10]
	orrs r0, r1
	strh r0, [r4, #0x10]
	b _08056452
_0805642A:
	cmp r0, #0xa
	bne _08056452
	adds r0, r4, #0
	bl sub_080547E4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _08056448
	movs r0, #2
	ldrh r1, [r4, #0x10]
	orrs r0, r1
	strh r0, [r4, #0x10]
_08056448:
	bl sub_0804FFFC
	adds r0, r5, #0
	bl Proc_Break
_08056452:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_08056458
sub_08056458: @ 0x08056458
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_0804FFF0
	bl sub_08050008
	ldr r0, _0805648C @ =0x08BA15D4
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl sub_08054804
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_0805468C
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805648C: .4byte 0x08BA15D4

	thumb_func_start sub_08056490
sub_08056490: @ 0x08056490
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl sub_080547A8
	adds r6, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805650E
	ldr r0, [r5, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804E498
	ldr r0, [r5, #0x5c]
	bl sub_0805652C
	ldrh r0, [r5, #0x2c]
	cmp r0, #1
	bne _0805650E
	movs r0, #9
	ldrh r1, [r6, #0x10]
	orrs r0, r1
	strh r0, [r6, #0x10]
	adds r4, r5, #0
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r6, #0
	bl sub_08050140
	adds r0, r6, #0
	bl sub_08067CC4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	beq _08056500
	ldr r0, [r5, #0x5c]
	bl sub_08054764
	cmp r0, #1
	bne _080564F4
	adds r0, r6, #0
	bl sub_08062580
	b _08056500
_080564F4:
	ldrb r0, [r4]
	cmp r0, #0
	bne _08056524
	ldr r0, [r5, #0x5c]
	bl sub_080626B4
_08056500:
	ldrb r0, [r4]
	cmp r0, #0
	bne _08056524
	adds r0, r6, #0
	bl sub_08067D14
	b _08056524
_0805650E:
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0x46
	beq _08056524
	cmp r0, #0x50
	bne _08056524
	bl sub_0804FFFC
	adds r0, r5, #0
	bl Proc_Break
_08056524:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0805652C
sub_0805652C: @ 0x0805652C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _08056570 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08056574 @ =0x08BA15EC
	movs r1, #3
	bl SpawnProc
	adds r6, r0, #0
	str r4, [r6, #0x5c]
	movs r0, #0
	strh r0, [r6, #0x2c]
	ldr r1, _08056578 @ =0x08BA51E8
	ldr r2, _0805657C @ =0x08BA4E50
	ldr r3, _08056580 @ =0x08BA5244
	ldr r0, _08056584 @ =0x08BA4EAC
	str r0, [sp]
	adds r0, r4, #0
	bl sub_0805041C
	adds r5, r0, #0
	str r5, [r6, #0x60]
	adds r0, r4, #0
	bl sub_08054678
	cmp r0, #0
	bne _08056588
	ldrh r0, [r5, #2]
	adds r0, #0x48
	b _0805658C
	.align 2, 0
_08056570: .4byte 0x0201774C
_08056574: .4byte 0x08BA15EC
_08056578: .4byte 0x08BA51E8
_0805657C: .4byte 0x08BA4E50
_08056580: .4byte 0x08BA5244
_08056584: .4byte 0x08BA4EAC
_08056588:
	ldrh r0, [r5, #2]
	subs r0, #0x48
_0805658C:
	strh r0, [r5, #2]
	ldr r0, _0805659C @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _080565A0
	movs r0, #0x23
	b _080565A2
	.align 2, 0
_0805659C: .4byte 0x0203E02C
_080565A0:
	movs r0, #0xa
_080565A2:
	strh r0, [r6, #0x2e]
	ldr r0, [r6, #0x5c]
	ldr r1, [r6, #0x60]
	bl sub_08056714
	str r0, [r6, #0x64]
	ldr r0, _080565C8 @ =0x081E9D84
	movs r1, #0x20
	bl sub_080505F0
	ldr r0, _080565CC @ =0x081E9984
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_080505C8
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080565C8: .4byte 0x081E9D84
_080565CC: .4byte 0x081E9984

	thumb_func_start sub_080565D0
sub_080565D0: @ 0x080565D0
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne _08056622
	ldr r1, _08056610 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	ldr r0, [r4, #0x60]
	bl sub_08006650
	ldr r0, _08056614 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0805661C
	ldr r0, _08056618 @ =0x02017758
	movs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x64]
	bl Proc_End
	adds r0, r4, #0
	bl Proc_End
	b _08056622
	.align 2, 0
_08056610: .4byte 0x0201774C
_08056614: .4byte 0x0203E02C
_08056618: .4byte 0x02017758
_0805661C:
	adds r0, r4, #0
	bl Proc_Break
_08056622:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08056628
sub_08056628: @ 0x08056628
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805664C @ =0x02017754
	movs r0, #0
	str r0, [r1]
	ldr r0, [r4, #0x64]
	bl Proc_End
	ldr r0, [r4, #0x5c]
	bl sub_08056650
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805664C: .4byte 0x02017754

	thumb_func_start sub_08056650
sub_08056650: @ 0x08056650
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _08056690 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08056694 @ =0x08BA160C
	movs r1, #3
	bl SpawnProc
	adds r6, r0, #0
	str r4, [r6, #0x5c]
	movs r0, #0
	strh r0, [r6, #0x2c]
	ldr r3, _08056698 @ =0x08BA5264
	ldr r2, _0805669C @ =0x08BA4ECC
	str r2, [sp]
	adds r0, r4, #0
	adds r1, r3, #0
	bl sub_0805041C
	adds r5, r0, #0
	str r5, [r6, #0x60]
	adds r0, r4, #0
	bl sub_08054678
	cmp r0, #0
	bne _080566A0
	ldrh r0, [r5, #2]
	adds r0, #0x48
	b _080566A4
	.align 2, 0
_08056690: .4byte 0x0201774C
_08056694: .4byte 0x08BA160C
_08056698: .4byte 0x08BA5264
_0805669C: .4byte 0x08BA4ECC
_080566A0:
	ldrh r0, [r5, #2]
	subs r0, #0x48
_080566A4:
	strh r0, [r5, #2]
	ldr r0, _080566CC @ =0x081E9D84
	movs r1, #0x20
	bl sub_080505F0
	ldr r0, _080566D0 @ =0x081E9984
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_080505C8
	ldr r0, [r6, #0x5c]
	ldr r1, [r6, #0x60]
	bl sub_08056714
	str r0, [r6, #0x64]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080566CC: .4byte 0x081E9D84
_080566D0: .4byte 0x081E9984

	thumb_func_start sub_080566D4
sub_080566D4: @ 0x080566D4
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x11
	bne _08056706
	ldr r1, _0805670C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	ldr r1, _08056710 @ =0x02017758
	movs r0, #1
	str r0, [r1]
	ldr r0, [r4, #0x64]
	bl Proc_End
	ldr r0, [r4, #0x60]
	bl sub_08006650
	adds r0, r4, #0
	bl Proc_Break
_08056706:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805670C: .4byte 0x0201774C
_08056710: .4byte 0x02017758

	thumb_func_start sub_08056714
sub_08056714: @ 0x08056714
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r1, _08056750 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08056754 @ =0x08BA1624
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r6, [r4, #0x5c]
	str r5, [r4, #0x60]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #1
	strh r0, [r4, #0x2e]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #2
	ldrsh r2, [r6, r0]
	movs r0, #0xcd
	movs r3, #1
	bl sub_080681E4
	adds r0, r4, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08056750: .4byte 0x0201774C
_08056754: .4byte 0x08BA1624

	thumb_func_start sub_08056758
sub_08056758: @ 0x08056758
	ldr r1, _08056764 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_08056764: .4byte 0x0201774C

	thumb_func_start sub_08056768
sub_08056768: @ 0x08056768
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bne _080567AA
	ldr r0, [r4, #0x60]
	bl sub_0806814C
	adds r2, r0, #0
	ldr r0, [r4, #0x60]
	ldrh r0, [r0, #2]
	adds r2, r0, r2
	movs r1, #0x80
	lsls r1, r1, #1
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r0, #0xcd
	movs r3, #1
	bl sub_080681E4
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldrh r1, [r4, #0x2e]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r0, #8
	bgt _080567AA
	adds r0, r1, #1
	strh r0, [r4, #0x2e]
_080567AA:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080567B0
sub_080567B0: @ 0x080567B0
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_0804FFF0
	bl sub_08050008
	ldr r0, _080567E4 @ =0x08BA1644
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl sub_08054804
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_0805468C
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080567E4: .4byte 0x08BA1644

	thumb_func_start sub_080567E8
sub_080567E8: @ 0x080567E8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl sub_080547A8
	adds r6, r0, #0
	bl sub_08050778
	adds r4, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805687E
	ldr r0, [r5, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804E498
	ldr r0, [r5, #0x5c]
	bl sub_080568A0
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r5, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xcc
	movs r3, #1
	bl sub_080681E4
	ldrh r0, [r5, #0x2c]
	cmp r0, #1
	bne _0805687E
	movs r0, #9
	ldrh r1, [r6, #0x10]
	orrs r0, r1
	strh r0, [r6, #0x10]
	adds r4, r5, #0
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r6, #0
	bl sub_08050140
	adds r0, r6, #0
	bl sub_08067CC4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	beq _08056870
	ldr r0, [r5, #0x5c]
	bl sub_08054764
	cmp r0, #1
	bne _08056864
	adds r0, r6, #0
	bl sub_08062580
	b _08056870
_08056864:
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805689A
	ldr r0, [r5, #0x5c]
	bl sub_080626B4
_08056870:
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805689A
	adds r0, r6, #0
	bl sub_08067D14
	b _0805689A
_0805687E:
	movs r3, #0x2c
	ldrsh r1, [r5, r3]
	adds r0, r4, #0
	adds r0, #9
	cmp r1, r0
	beq _0805689A
	adds r0, #1
	cmp r1, r0
	bne _0805689A
	bl sub_0804FFFC
	adds r0, r5, #0
	bl Proc_Break
_0805689A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_080568A0
sub_080568A0: @ 0x080568A0
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _080568E8 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080568EC @ =0x08BA165C
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r1, _080568F0 @ =0x08BA5390
	ldr r2, _080568F4 @ =0x08BA5304
	ldr r3, _080568F8 @ =0x08BA53A0
	ldr r0, _080568FC @ =0x08BA5314
	str r0, [sp]
	adds r0, r5, #0
	bl sub_0805041C
	str r0, [r4, #0x60]
	ldr r0, _08056900 @ =0x081E9D84
	movs r1, #0x20
	bl sub_080505F0
	ldr r0, _08056904 @ =0x081E9DA4
	movs r1, #0x60
	bl sub_080505C8
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080568E8: .4byte 0x0201774C
_080568EC: .4byte 0x08BA165C
_080568F0: .4byte 0x08BA5390
_080568F4: .4byte 0x08BA5304
_080568F8: .4byte 0x08BA53A0
_080568FC: .4byte 0x08BA5314
_08056900: .4byte 0x081E9D84
_08056904: .4byte 0x081E9DA4

	thumb_func_start sub_08056908
sub_08056908: @ 0x08056908
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bne _0805692E
	ldr r0, _08056934 @ =0x0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl sub_08006650
	adds r0, r4, #0
	bl Proc_Break
_0805692E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08056934: .4byte 0x0201774C

	thumb_func_start sub_08056938
sub_08056938: @ 0x08056938
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_0804FFF0
	bl sub_08050008
	ldr r0, _08056988 @ =0x08BA1674
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl sub_08054804
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_0805468C
	adds r4, #0x29
	strb r0, [r4]
	adds r0, r5, #0
	movs r1, #0
	bl sub_08056DD4
	ldr r0, _0805698C @ =0x081EA010
	movs r1, #0x20
	bl sub_080505F0
	ldr r0, _08056990 @ =0x081E9DE0
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_080505C8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08056988: .4byte 0x08BA1674
_0805698C: .4byte 0x081EA010
_08056990: .4byte 0x081E9DE0

	thumb_func_start sub_08056994
sub_08056994: @ 0x08056994
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_0804FFF0
	bl sub_08050008
	ldr r0, _080569E4 @ =0x08BA1674
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl sub_08054804
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_0805468C
	adds r4, #0x29
	strb r0, [r4]
	adds r0, r5, #0
	movs r1, #1
	bl sub_08056DD4
	ldr r0, _080569E8 @ =0x081EA24C
	movs r1, #0x20
	bl sub_080505F0
	ldr r0, _080569EC @ =0x081EA030
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_080505C8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080569E4: .4byte 0x08BA1674
_080569E8: .4byte 0x081EA24C
_080569EC: .4byte 0x081EA030

	thumb_func_start sub_080569F0
sub_080569F0: @ 0x080569F0
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_0804FFF0
	bl sub_08050008
	ldr r0, _08056A40 @ =0x08BA1674
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl sub_08054804
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_0805468C
	adds r4, #0x29
	strb r0, [r4]
	adds r0, r5, #0
	movs r1, #0
	bl sub_08056DD4
	ldr r0, _08056A44 @ =0x081EA484
	movs r1, #0x20
	bl sub_080505F0
	ldr r0, _08056A48 @ =0x081EA26C
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_080505C8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08056A40: .4byte 0x08BA1674
_08056A44: .4byte 0x081EA484
_08056A48: .4byte 0x081EA26C

	thumb_func_start sub_08056A4C
sub_08056A4C: @ 0x08056A4C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_0804FFF0
	bl sub_08050008
	ldr r0, _08056A9C @ =0x08BA1674
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl sub_08054804
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_0805468C
	adds r4, #0x29
	strb r0, [r4]
	adds r0, r5, #0
	movs r1, #1
	bl sub_08056DD4
	ldr r0, _08056AA0 @ =0x081EA6C0
	movs r1, #0x20
	bl sub_080505F0
	ldr r0, _08056AA4 @ =0x081EA4A4
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_080505C8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08056A9C: .4byte 0x08BA1674
_08056AA0: .4byte 0x081EA6C0
_08056AA4: .4byte 0x081EA4A4

	thumb_func_start sub_08056AA8
sub_08056AA8: @ 0x08056AA8
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_0804FFF0
	bl sub_08050008
	ldr r0, _08056AF8 @ =0x08BA1674
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl sub_08054804
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_0805468C
	adds r4, #0x29
	strb r0, [r4]
	adds r0, r5, #0
	movs r1, #1
	bl sub_08056DD4
	ldr r0, _08056AFC @ =0x081EA90C
	movs r1, #0x20
	bl sub_080505F0
	ldr r0, _08056B00 @ =0x081EA6E0
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_080505C8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08056AF8: .4byte 0x08BA1674
_08056AFC: .4byte 0x081EA90C
_08056B00: .4byte 0x081EA6E0

	thumb_func_start sub_08056B04
sub_08056B04: @ 0x08056B04
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_0804FFF0
	bl sub_08050008
	ldr r0, _08056B54 @ =0x08BA1674
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl sub_08054804
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_0805468C
	adds r4, #0x29
	strb r0, [r4]
	adds r0, r5, #0
	movs r1, #1
	bl sub_08056DD4
	ldr r0, _08056B58 @ =0x081EAB74
	movs r1, #0x20
	bl sub_080505F0
	ldr r0, _08056B5C @ =0x081EA92C
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_080505C8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08056B54: .4byte 0x08BA1674
_08056B58: .4byte 0x081EAB74
_08056B5C: .4byte 0x081EA92C

	thumb_func_start sub_08056B60
sub_08056B60: @ 0x08056B60
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_0804FFF0
	bl sub_08050008
	ldr r0, _08056BB0 @ =0x08BA1674
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl sub_08054804
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_0805468C
	adds r4, #0x29
	strb r0, [r4]
	adds r0, r5, #0
	movs r1, #1
	bl sub_08056DD4
	ldr r0, _08056BB4 @ =0x081EADCC
	movs r1, #0x20
	bl sub_080505F0
	ldr r0, _08056BB8 @ =0x081EAB94
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_080505C8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08056BB0: .4byte 0x08BA1674
_08056BB4: .4byte 0x081EADCC
_08056BB8: .4byte 0x081EAB94

	thumb_func_start sub_08056BBC
sub_08056BBC: @ 0x08056BBC
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_0804FFF0
	bl sub_08050008
	ldr r0, _08056C0C @ =0x08BA1674
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl sub_08054804
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_0805468C
	adds r4, #0x29
	strb r0, [r4]
	adds r0, r5, #0
	movs r1, #1
	bl sub_08056DD4
	ldr r0, _08056C10 @ =0x081EB050
	movs r1, #0x20
	bl sub_080505F0
	ldr r0, _08056C14 @ =0x081EADEC
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_080505C8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08056C0C: .4byte 0x08BA1674
_08056C10: .4byte 0x081EB050
_08056C14: .4byte 0x081EADEC

	thumb_func_start sub_08056C18
sub_08056C18: @ 0x08056C18
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_0804FFF0
	bl sub_08050008
	ldr r0, _08056C68 @ =0x08BA1674
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl sub_08054804
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_0805468C
	adds r4, #0x29
	strb r0, [r4]
	adds r0, r5, #0
	movs r1, #1
	bl sub_08056DD4
	ldr r0, _08056C6C @ =0x081EB2E0
	movs r1, #0x20
	bl sub_080505F0
	ldr r0, _08056C70 @ =0x081EB070
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_080505C8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08056C68: .4byte 0x08BA1674
_08056C6C: .4byte 0x081EB2E0
_08056C70: .4byte 0x081EB070

	thumb_func_start sub_08056C74
sub_08056C74: @ 0x08056C74
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_0804FFF0
	bl sub_08050008
	ldr r0, _08056CC4 @ =0x08BA1674
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl sub_08054804
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_0805468C
	adds r4, #0x29
	strb r0, [r4]
	adds r0, r5, #0
	movs r1, #1
	bl sub_08056DD4
	ldr r0, _08056CC8 @ =0x081EB530
	movs r1, #0x20
	bl sub_080505F0
	ldr r0, _08056CCC @ =0x081EB300
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_080505C8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08056CC4: .4byte 0x08BA1674
_08056CC8: .4byte 0x081EB530
_08056CCC: .4byte 0x081EB300

	thumb_func_start sub_08056CD0
sub_08056CD0: @ 0x08056CD0
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_0804FFF0
	bl sub_08050008
	ldr r0, _08056D20 @ =0x08BA1674
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl sub_08054804
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_0805468C
	adds r4, #0x29
	strb r0, [r4]
	adds r0, r5, #0
	movs r1, #1
	bl sub_08056DD4
	ldr r0, _08056D24 @ =0x081EB76C
	movs r1, #0x20
	bl sub_080505F0
	ldr r0, _08056D28 @ =0x081EB550
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_080505C8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08056D20: .4byte 0x08BA1674
_08056D24: .4byte 0x081EB76C
_08056D28: .4byte 0x081EB550

	thumb_func_start sub_08056D2C
sub_08056D2C: @ 0x08056D2C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08056DB6
	ldr r0, [r5, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804E498
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r5, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xca
	movs r3, #1
	bl sub_080681E4
	ldrh r0, [r5, #0x2c]
	cmp r0, #1
	bne _08056DB6
	ldr r0, [r5, #0x5c]
	bl sub_080547A8
	adds r6, r0, #0
	movs r0, #9
	ldrh r1, [r6, #0x10]
	orrs r0, r1
	strh r0, [r6, #0x10]
	adds r4, r5, #0
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r6, #0
	bl sub_08050140
	adds r0, r6, #0
	bl sub_08067CC4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	beq _08056DA8
	ldr r0, [r5, #0x5c]
	bl sub_08054764
	cmp r0, #1
	bne _08056D9C
	adds r0, r6, #0
	bl sub_08062580
	b _08056DA8
_08056D9C:
	ldrb r0, [r4]
	cmp r0, #0
	bne _08056DCC
	ldr r0, [r5, #0x5c]
	bl sub_080626B4
_08056DA8:
	ldrb r0, [r4]
	cmp r0, #0
	bne _08056DCC
	adds r0, r6, #0
	bl sub_08067D14
	b _08056DCC
_08056DB6:
	movs r3, #0x2c
	ldrsh r0, [r5, r3]
	cmp r0, #0xe
	beq _08056DCC
	cmp r0, #0x10
	bne _08056DCC
	bl sub_0804FFFC
	adds r0, r5, #0
	bl Proc_Break
_08056DCC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08056DD4
sub_08056DD4: @ 0x08056DD4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r1, _08056E00 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08056E04 @ =0x08BA168C
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r6, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	cmp r4, #0
	bne _08056E10
	ldr r2, _08056E08 @ =0x08BA5584
	ldr r3, _08056E0C @ =0x08BA57D8
	b _08056E14
	.align 2, 0
_08056E00: .4byte 0x0201774C
_08056E04: .4byte 0x08BA168C
_08056E08: .4byte 0x08BA5584
_08056E0C: .4byte 0x08BA57D8
_08056E10:
	ldr r2, _08056E34 @ =0x08BA5A38
	ldr r3, _08056E38 @ =0x08BA5C98
_08056E14:
	str r2, [sp]
	adds r0, r6, #0
	adds r1, r3, #0
	bl sub_0805041C
	adds r4, r0, #0
	str r4, [r5, #0x60]
	adds r0, r6, #0
	bl sub_08054678
	cmp r0, #0
	bne _08056E3C
	ldrh r0, [r4, #2]
	adds r0, #0x38
	b _08056E40
	.align 2, 0
_08056E34: .4byte 0x08BA5A38
_08056E38: .4byte 0x08BA5C98
_08056E3C:
	ldrh r0, [r4, #2]
	subs r0, #0x38
_08056E40:
	strh r0, [r4, #2]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08056E4C
sub_08056E4C: @ 0x08056E4C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc
	bne _08056E72
	ldr r0, _08056E78 @ =0x0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl sub_08006650
	adds r0, r4, #0
	bl Proc_Break
_08056E72:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08056E78: .4byte 0x0201774C

	thumb_func_start sub_08056E7C
sub_08056E7C: @ 0x08056E7C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_0804FFF0
	bl sub_08050008
	ldr r0, _08056EB0 @ =0x08BA16A4
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl sub_08054804
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_0805468C
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08056EB0: .4byte 0x08BA16A4

	thumb_func_start sub_08056EB4
sub_08056EB4: @ 0x08056EB4
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl sub_080547A8
	adds r4, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	movs r7, #0
	movs r6, #0
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x27
	bne _08056F48
	adds r0, r4, #0
	movs r1, #0
	bl sub_08056FC4
	adds r0, r4, #0
	movs r1, #0
	bl sub_080570A0
	adds r0, r4, #0
	movs r1, #0x82
	movs r2, #1
	bl sub_08055E14
	adds r0, r4, #0
	movs r1, #0x64
	bl sub_080559A4
	ldr r3, _08056F7C @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	strb r7, [r0]
	adds r0, #1
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r7, [r0]
	str r1, [sp]
	str r6, [sp, #4]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #8
	movs r3, #0
	bl sub_08055F08
	str r6, [sp]
	str r6, [sp, #4]
	adds r0, r4, #0
	movs r1, #0x3c
	movs r2, #0x28
	movs r3, #0x10
	bl sub_08055F08
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #2
	ldrsh r2, [r4, r0]
	movs r0, #0xef
	movs r3, #1
	bl sub_080681E4
_08056F48:
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0x8b
	bne _08056FA4
	movs r0, #9
	ldrh r1, [r4, #0x10]
	orrs r0, r1
	strh r0, [r4, #0x10]
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r0, r4, #0
	bl sub_080503E0
	adds r0, r4, #0
	bl sub_08054678
	cmp r0, #0
	bne _08056F88
	ldr r0, _08056F80 @ =0x02000054
	ldr r0, [r0]
	ldr r1, _08056F84 @ =0x02022B40
	movs r2, #8
	bl CpuFastSet
	b _08056F94
	.align 2, 0
_08056F7C: .4byte 0x03002870
_08056F80: .4byte 0x02000054
_08056F84: .4byte 0x02022B40
_08056F88:
	ldr r0, _08056F9C @ =0x02000054
	ldr r0, [r0, #4]
	ldr r1, _08056FA0 @ =0x02022B80
	movs r2, #8
	bl CpuFastSet
_08056F94:
	adds r0, r4, #0
	bl sub_0804F7F0
	b _08056FBA
	.align 2, 0
_08056F9C: .4byte 0x02000054
_08056FA0: .4byte 0x02022B80
_08056FA4:
	cmp r0, #0xb3
	bne _08056FBA
	movs r0, #2
	ldrh r1, [r4, #0x10]
	orrs r0, r1
	strh r0, [r4, #0x10]
	bl sub_0804FFFC
	adds r0, r5, #0
	bl Proc_Break
_08056FBA:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08056FC4
sub_08056FC4: @ 0x08056FC4
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, _0805700C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08057010 @ =0x08BA16BC
	movs r1, #3
	bl SpawnProc
	str r5, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	str r2, [r0, #0x44]
	ldr r1, _08057014 @ =0x081E7FFC
	str r1, [r0, #0x48]
	ldr r1, _08057018 @ =0x08BA16D4
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _0805701C @ =0x08BA1740
	str r1, [r0, #0x54]
	str r2, [r0, #0x58]
	lsls r4, r4, #5
	ldr r0, _08057020 @ =0x082DCA8C
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x20
	bl sub_08050634
	bl sub_08050040
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805700C: .4byte 0x0201774C
_08057010: .4byte 0x08BA16BC
_08057014: .4byte 0x081E7FFC
_08057018: .4byte 0x08BA16D4
_0805701C: .4byte 0x08BA1740
_08057020: .4byte 0x082DCA8C

	thumb_func_start sub_08057024
sub_08057024: @ 0x08057024
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_080506E4
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _08057074
	ldr r7, [r4, #0x4c]
	ldr r0, [r4, #0x50]
	mov r8, r0
	ldr r0, [r4, #0x54]
	lsls r5, r1, #2
	adds r6, r5, r0
	ldr r0, [r4, #0x58]
	ldr r2, [r6]
	cmp r0, r2
	beq _0805705E
	movs r1, #0x80
	lsls r1, r1, #6
	adds r0, r2, #0
	bl sub_0805060C
_0805705E:
	ldr r0, [r6]
	str r0, [r4, #0x58]
	ldr r0, [r4, #0x5c]
	adds r1, r5, r7
	ldr r1, [r1]
	mov r3, r8
	adds r2, r5, r3
	ldr r2, [r2]
	bl sub_080504DC
	b _08057092
_08057074:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08057092
	bl sub_08050018
	ldr r1, _0805709C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl sub_08050118
	adds r0, r4, #0
	bl Proc_Break
_08057092:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805709C: .4byte 0x0201774C

	thumb_func_start sub_080570A0
sub_080570A0: @ 0x080570A0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r1, _080570F4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080570F8 @ =0x08BA17AC
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r6, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x38
	strh r0, [r4, #0x2e]
	ldr r3, _080570FC @ =0x08BD8FEC
	str r3, [sp]
	adds r0, r6, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_0805041C
	str r0, [r4, #0x60]
	lsls r5, r5, #5
	ldr r0, _08057100 @ =0x082DCA8C
	adds r5, r5, r0
	adds r0, r5, #0
	movs r1, #0x20
	bl sub_080505F0
	ldr r0, _08057104 @ =0x082DE1F0
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_080505C8
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080570F4: .4byte 0x0201774C
_080570F8: .4byte 0x08BA17AC
_080570FC: .4byte 0x08BD8FEC
_08057100: .4byte 0x082DCA8C
_08057104: .4byte 0x082DE1F0

	thumb_func_start sub_08057108
sub_08057108: @ 0x08057108
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _08057130
	ldr r0, [r4, #0x60]
	bl sub_08006650
	ldr r1, _08057138 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08057130:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08057138: .4byte 0x0201774C

	thumb_func_start sub_0805713C
sub_0805713C: @ 0x0805713C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_0804FFF0
	bl sub_08050008
	ldr r0, _08057170 @ =0x08BA17C4
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl sub_08054804
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_0805468C
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08057170: .4byte 0x08BA17C4

	thumb_func_start sub_08057174
sub_08057174: @ 0x08057174
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl sub_080547A8
	adds r4, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	movs r7, #0
	movs r6, #0
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x19
	bne _08057208
	adds r0, r4, #0
	movs r1, #0
	bl sub_08056FC4
	adds r0, r4, #0
	movs r1, #0
	bl sub_080570A0
	adds r0, r4, #0
	movs r1, #0x82
	movs r2, #1
	bl sub_08055E14
	adds r0, r4, #0
	movs r1, #0x64
	bl sub_080559A4
	ldr r3, _0805723C @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	strb r7, [r0]
	adds r0, #1
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r7, [r0]
	str r1, [sp]
	str r6, [sp, #4]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #8
	movs r3, #0
	bl sub_08055F08
	str r6, [sp]
	str r6, [sp, #4]
	adds r0, r4, #0
	movs r1, #0x3c
	movs r2, #0x28
	movs r3, #0x10
	bl sub_08055F08
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #2
	ldrsh r2, [r4, r0]
	movs r0, #0xef
	movs r3, #1
	bl sub_080681E4
_08057208:
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0x7d
	bne _08057264
	movs r0, #9
	ldrh r1, [r4, #0x10]
	orrs r0, r1
	strh r0, [r4, #0x10]
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r0, r4, #0
	bl sub_080503E0
	adds r0, r4, #0
	bl sub_08054678
	cmp r0, #0
	bne _08057248
	ldr r0, _08057240 @ =0x02000054
	ldr r0, [r0]
	ldr r1, _08057244 @ =0x02022B40
	movs r2, #8
	bl CpuFastSet
	b _08057254
	.align 2, 0
_0805723C: .4byte 0x03002870
_08057240: .4byte 0x02000054
_08057244: .4byte 0x02022B40
_08057248:
	ldr r0, _0805725C @ =0x02000054
	ldr r0, [r0, #4]
	ldr r1, _08057260 @ =0x02022B80
	movs r2, #8
	bl CpuFastSet
_08057254:
	adds r0, r4, #0
	bl sub_0804F7F0
	b _0805727A
	.align 2, 0
_0805725C: .4byte 0x02000054
_08057260: .4byte 0x02022B80
_08057264:
	cmp r0, #0xa5
	bne _0805727A
	movs r0, #2
	ldrh r1, [r4, #0x10]
	orrs r0, r1
	strh r0, [r4, #0x10]
	bl sub_0804FFFC
	adds r0, r5, #0
	bl Proc_Break
_0805727A:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08057284
sub_08057284: @ 0x08057284
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_0804FFF0
	bl sub_08050008
	ldr r0, _080572D0 @ =0x08BA17DC
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl sub_08054804
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_0805468C
	adds r1, r4, #0
	adds r1, #0x29
	strb r0, [r1]
	movs r0, #0x9b
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl sub_080681E4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080572D0: .4byte 0x08BA17DC

	thumb_func_start sub_080572D4
sub_080572D4: @ 0x080572D4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl sub_080547A8
	adds r6, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	bne _080572FA
	ldr r0, [r5, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804E498
	b _0805738C
_080572FA:
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0x22
	bne _0805731C
	ldr r0, _08057318 @ =0x00000137
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r5, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl sub_080681E4
	b _0805738C
	.align 2, 0
_08057318: .4byte 0x00000137
_0805731C:
	cmp r0, #0x2a
	bne _08057328
	adds r0, r6, #0
	bl sub_08057394
	b _0805738C
_08057328:
	cmp r0, #0x2d
	bne _0805737A
	movs r0, #9
	ldrh r1, [r6, #0x10]
	orrs r0, r1
	strh r0, [r6, #0x10]
	adds r4, r5, #0
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r6, #0
	bl sub_08050140
	adds r0, r6, #0
	bl sub_08067CC4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	beq _0805736C
	ldr r0, [r5, #0x5c]
	bl sub_08054764
	cmp r0, #1
	bne _08057360
	adds r0, r6, #0
	bl sub_08062580
	b _0805736C
_08057360:
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805738C
	ldr r0, [r5, #0x5c]
	bl sub_080626B4
_0805736C:
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805738C
	adds r0, r6, #0
	bl sub_08067D14
	b _0805738C
_0805737A:
	cmp r0, #0x3e
	beq _0805738C
	cmp r0, #0x40
	bne _0805738C
	bl sub_0804FFFC
	adds r0, r5, #0
	bl Proc_Break
_0805738C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08057394
sub_08057394: @ 0x08057394
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _080573E8 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080573EC @ =0x08BA17F4
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r7, #0
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r3, _080573F0 @ =0x08BA5D9C
	ldr r2, _080573F4 @ =0x08BA5E38
	str r2, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	bl sub_0805041C
	adds r6, r0, #0
	str r6, [r4, #0x60]
	ldrh r0, [r6, #4]
	adds r0, #0x10
	strh r0, [r6, #4]
	movs r0, #0xc0
	lsls r0, r0, #4
	ldrh r1, [r6, #8]
	ands r0, r1
	strh r0, [r6, #8]
	adds r0, r5, #0
	bl sub_08054678
	cmp r0, #1
	bne _080573F8
	movs r1, #0xe4
	lsls r1, r1, #7
	b _080573FC
	.align 2, 0
_080573E8: .4byte 0x0201774C
_080573EC: .4byte 0x08BA17F4
_080573F0: .4byte 0x08BA5D9C
_080573F4: .4byte 0x08BA5E38
_080573F8:
	movs r1, #0x93
	lsls r1, r1, #8
_080573FC:
	adds r0, r1, #0
	ldrh r1, [r6, #8]
	orrs r0, r1
	strh r0, [r6, #8]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0805740C
sub_0805740C: @ 0x0805740C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	ble _08057432
	ldr r0, [r4, #0x60]
	bl sub_08006650
	ldr r1, _08057438 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08057432:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08057438: .4byte 0x0201774C

	thumb_func_start sub_0805743C
sub_0805743C: @ 0x0805743C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_0804FFF0
	bl sub_0804FB6C
	bl sub_08050008
	ldr r0, _08057474 @ =0x08BA180C
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl sub_08054804
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_0805468C
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08057474: .4byte 0x08BA180C

	thumb_func_start sub_08057478
sub_08057478: @ 0x08057478
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl sub_080547A8
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805749C
	ldr r0, [r4, #0x5c]
	movs r1, #6
	bl sub_0804EFDC
	b _0805750E
_0805749C:
	cmp r0, #6
	bne _080574D4
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804E498
	adds r0, r5, #0
	movs r1, #9
	bl sub_08057514
	adds r0, r5, #0
	movs r1, #9
	bl sub_08057608
	adds r0, r5, #0
	bl sub_08057714
	movs r0, #0x86
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl sub_080681E4
	b _0805750E
_080574D4:
	cmp r0, #0xa
	bne _080574F8
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl sub_08050140
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805750E
	adds r0, r5, #0
	bl sub_08067D14
	b _0805750E
_080574F8:
	cmp r0, #0x19
	beq _0805750E
	cmp r0, #0x1e
	bne _0805750E
	bl sub_0804FFFC
	bl sub_0804FBC4
	adds r0, r4, #0
	bl Proc_Break
_0805750E:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08057514
sub_08057514: @ 0x08057514
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r1, _08057574 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08057578 @ =0x08BA1824
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r6, [r4, #0x2e]
	ldr r0, _0805757C @ =0x081EE054
	movs r1, #0x20
	bl sub_08050634
	ldr r0, _08057580 @ =0x081ED194
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_0805060C
	ldr r0, _08057584 @ =0x081EE154
	ldr r5, _08057588 @ =0x02019784
	adds r1, r5, #0
	bl sub_080BFA28
	ldr r0, [r4, #0x5c]
	bl sub_08054678
	cmp r0, #0
	bne _08057590
	ldr r1, _0805758C @ =0x02023460
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #0x20
	movs r3, #0x14
	bl sub_08066ACC
	b _080575A4
	.align 2, 0
_08057574: .4byte 0x0201774C
_08057578: .4byte 0x08BA1824
_0805757C: .4byte 0x081EE054
_08057580: .4byte 0x081ED194
_08057584: .4byte 0x081EE154
_08057588: .4byte 0x02019784
_0805758C: .4byte 0x02023460
_08057590:
	ldr r1, _080575CC @ =0x02023460
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #0x20
	movs r3, #0x14
	bl sub_08066AFC
_080575A4:
	movs r0, #2
	bl EnableBgSync
	bl sub_08050040
	ldr r2, _080575D0 @ =0x03002870
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080575CC: .4byte 0x02023460
_080575D0: .4byte 0x03002870

	thumb_func_start sub_080575D4
sub_080575D4: @ 0x080575D4
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne _080575FE
	bl sub_08050018
	ldr r1, _08057604 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl sub_08050118
	adds r0, r4, #0
	bl Proc_Break
_080575FE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08057604: .4byte 0x0201774C

	thumb_func_start sub_08057608
sub_08057608: @ 0x08057608
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _08057638 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805763C @ =0x08BA183C
	movs r1, #3
	bl SpawnProc
	adds r6, r0, #0
	str r4, [r6, #0x5c]
	movs r0, #0
	strh r0, [r6, #0x2c]
	strh r5, [r6, #0x2e]
	adds r0, r4, #0
	bl sub_08054678
	cmp r0, #0
	bne _08057640
	movs r0, #0xd8
	b _08057644
	.align 2, 0
_08057638: .4byte 0x0201774C
_0805763C: .4byte 0x08BA183C
_08057640:
	movs r0, #0xd8
	rsbs r0, r0, #0
_08057644:
	str r0, [r6, #0x44]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_0805764C
sub_0805764C: @ 0x0805764C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r2, [r6, #0x44]
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r1, #0x2e
	ldrsh r0, [r6, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl sub_08012FE8
	ldr r4, _08057684 @ =0x03002870
	strh r0, [r4, #0x20]
	ldr r0, [r6, #0x5c]
	bl sub_08054678
	cmp r0, #0
	bne _08057688
	ldrh r4, [r4, #0x20]
	lsrs r0, r4, #3
	adds r7, r0, #0
	adds r7, #0x1e
	b _0805768E
	.align 2, 0
_08057684: .4byte 0x03002870
_08057688:
	ldrh r4, [r4, #0x20]
	lsrs r0, r4, #3
	subs r7, r0, #1
_0805768E:
	movs r2, #0x1f
	mov r8, r2
	adds r0, r7, #0
	ands r0, r2
	lsls r0, r0, #1
	ldr r5, _0805770C @ =0x02023460
	adds r0, r0, r5
	movs r4, #0x80
	lsls r4, r4, #1
	str r4, [sp]
	movs r1, #1
	movs r2, #0x14
	movs r3, #1
	bl sub_080669B4
	adds r0, r7, #1
	mov r1, r8
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r5
	str r4, [sp]
	movs r1, #1
	movs r2, #0x14
	movs r3, #1
	bl sub_080669B4
	adds r0, r7, #2
	mov r2, r8
	ands r0, r2
	lsls r0, r0, #1
	adds r0, r0, r5
	str r4, [sp]
	movs r1, #1
	movs r2, #0x14
	movs r3, #1
	bl sub_080669B4
	movs r0, #2
	bl EnableBgSync
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r6, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _08057700
	ldr r1, _08057710 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl sub_08050018
	adds r0, r6, #0
	bl Proc_Break
_08057700:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805770C: .4byte 0x02023460
_08057710: .4byte 0x0201774C

	thumb_func_start sub_08057714
sub_08057714: @ 0x08057714
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08057740 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08057744 @ =0x08BA1854
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _08057748 @ =0x081E806A
	str r1, [r0, #0x48]
	ldr r1, _0805774C @ =0x081EE054
	str r1, [r0, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08057740: .4byte 0x0201774C
_08057744: .4byte 0x08BA1854
_08057748: .4byte 0x081E806A
_0805774C: .4byte 0x081EE054

	thumb_func_start sub_08057750
sub_08057750: @ 0x08057750
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_080506E4
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _08057776
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl sub_08050634
	b _08057790
_08057776:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08057790
	bl sub_08050118
	ldr r1, _08057798 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08057790:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08057798: .4byte 0x0201774C

	thumb_func_start sub_0805779C
sub_0805779C: @ 0x0805779C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_0804FFF0
	bl sub_0804FB6C
	bl sub_08050008
	ldr r0, _080577D4 @ =0x08BA1874
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl sub_08054804
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_0805468C
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080577D4: .4byte 0x08BA1874

	thumb_func_start sub_080577D8
sub_080577D8: @ 0x080577D8
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl sub_080547A8
	adds r5, r0, #0
	bl sub_08050778
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08057806
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804E498
_08057806:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #1
	cmp r1, r0
	bne _08057854
	ldr r0, _08057850 @ =0x0000010D
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl sub_080681E4
	adds r0, r5, #0
	bl sub_08057894
	ldr r0, [r4, #0x5c]
	movs r1, #6
	bl sub_0804EFDC
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl sub_08050140
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805788A
	adds r0, r5, #0
	bl sub_08067D14
	b _0805788A
	.align 2, 0
_08057850: .4byte 0x0000010D
_08057854:
	adds r0, r6, #0
	adds r0, #0x1c
	cmp r1, r0
	bne _0805786E
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0xe
	movs r3, #0x10
	bl sub_08055F08
	b _0805788A
_0805786E:
	adds r0, r6, #0
	adds r0, #0x32
	cmp r1, r0
	beq _0805788A
	adds r0, #5
	cmp r1, r0
	bne _0805788A
	bl sub_0804FFFC
	bl sub_0804FBC4
	adds r0, r4, #0
	bl Proc_Break
_0805788A:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08057894
sub_08057894: @ 0x08057894
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _080578EC @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080578F0 @ =0x08BA188C
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x34
	strh r0, [r4, #0x2e]
	adds r0, r5, #0
	bl sub_08054678
	ldr r3, _080578F4 @ =0x08BA7F18
	cmp r0, #0
	bne _080578C4
	ldr r3, _080578F8 @ =0x08BA72B8
_080578C4:
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_0805041C
	str r0, [r4, #0x60]
	ldr r0, _080578FC @ =0x081EF21C
	movs r1, #0x20
	bl sub_080505F0
	ldr r0, _08057900 @ =0x081EE51C
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_080505C8
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080578EC: .4byte 0x0201774C
_080578F0: .4byte 0x08BA188C
_080578F4: .4byte 0x08BA7F18
_080578F8: .4byte 0x08BA72B8
_080578FC: .4byte 0x081EF21C
_08057900: .4byte 0x081EE51C

	thumb_func_start sub_08057904
sub_08057904: @ 0x08057904
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0805792C
	ldr r0, [r4, #0x60]
	bl sub_08006650
	ldr r1, _08057934 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0805792C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08057934: .4byte 0x0201774C

	thumb_func_start sub_08057938
sub_08057938: @ 0x08057938
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_0804FFF0
	bl sub_08050008
	ldr r0, _0805796C @ =0x08BA18A4
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl sub_08054804
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_0805468C
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805796C: .4byte 0x08BA18A4

	thumb_func_start sub_08057970
sub_08057970: @ 0x08057970
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl sub_080547A8
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r6, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08057998
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804E498
_08057998:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #1
	bne _080579E4
	ldr r0, [r4, #0x5c]
	movs r1, #0x5a
	movs r2, #0xa
	bl sub_080561D0
	adds r0, r5, #0
	bl sub_08057A20
	adds r0, r5, #0
	bl sub_08057B30
	adds r0, r5, #0
	bl sub_08057BB8
	str r6, [sp]
	str r6, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x28
	movs r2, #0xf
	movs r3, #0x10
	bl sub_08055F08
	ldr r0, _080579E0 @ =0x0000011D
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl sub_080681E4
	b _08057A16
	.align 2, 0
_080579E0: .4byte 0x0000011D
_080579E4:
	cmp r0, #0xf
	bne _08057A08
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl sub_08050140
	ldrb r0, [r4]
	cmp r0, #0
	bne _08057A16
	adds r0, r5, #0
	bl sub_08067D14
	b _08057A16
_08057A08:
	cmp r0, #0x82
	bne _08057A16
	bl sub_0804FFFC
	adds r0, r4, #0
	bl Proc_Break
_08057A16:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08057A20
sub_08057A20: @ 0x08057A20
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r1, _08057A7C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08057A80 @ =0x08BA18BC
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r6, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #0x34
	strh r0, [r5, #0x2e]
	adds r0, r6, #0
	bl sub_08054678
	ldr r3, _08057A84 @ =0x08BAA2A8
	cmp r0, #0
	bne _08057A50
	ldr r3, _08057A88 @ =0x08BA96A8
_08057A50:
	str r3, [sp]
	adds r0, r6, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_0805041C
	adds r4, r0, #0
	str r4, [r5, #0x60]
	ldr r0, _08057A8C @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08057A96
	adds r0, r6, #0
	bl sub_08054678
	cmp r0, #0
	bne _08057A90
	ldrh r0, [r4, #2]
	adds r0, #0x10
	b _08057AAA
	.align 2, 0
_08057A7C: .4byte 0x0201774C
_08057A80: .4byte 0x08BA18BC
_08057A84: .4byte 0x08BAA2A8
_08057A88: .4byte 0x08BA96A8
_08057A8C: .4byte 0x0203E02C
_08057A90:
	ldrh r0, [r4, #2]
	subs r0, #0x10
	b _08057AAA
_08057A96:
	adds r0, r6, #0
	bl sub_08054678
	cmp r0, #0
	bne _08057AA6
	ldrh r0, [r4, #2]
	adds r0, #0x48
	b _08057AAA
_08057AA6:
	ldrh r0, [r4, #2]
	subs r0, #0x48
_08057AAA:
	strh r0, [r4, #2]
	ldr r0, _08057AC8 @ =0x081EF21C
	movs r1, #0x20
	bl sub_080505F0
	ldr r0, _08057ACC @ =0x081EE51C
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_080505C8
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08057AC8: .4byte 0x081EF21C
_08057ACC: .4byte 0x081EE51C

	thumb_func_start sub_08057AD0
sub_08057AD0: @ 0x08057AD0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08057AF4 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08057B02
	ldr r0, [r4, #0x5c]
	bl sub_08054678
	cmp r0, #0
	bne _08057AF8
	ldr r0, [r4, #0x60]
	ldr r1, [r4, #0x5c]
	ldrh r1, [r1, #2]
	adds r1, #0x48
	b _08057B00
	.align 2, 0
_08057AF4: .4byte 0x0203E02C
_08057AF8:
	ldr r0, [r4, #0x60]
	ldr r1, [r4, #0x5c]
	ldrh r1, [r1, #2]
	subs r1, #0x48
_08057B00:
	strh r1, [r0, #2]
_08057B02:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _08057B26
	ldr r0, [r4, #0x60]
	bl sub_08006650
	ldr r1, _08057B2C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08057B26:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08057B2C: .4byte 0x0201774C

	thumb_func_start sub_08057B30
sub_08057B30: @ 0x08057B30
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, _08057B74 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08057B78 @ =0x08BA18D4
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x70
	strh r0, [r4, #0x2e]
	ldr r0, _08057B7C @ =0x0827AC10
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_0805060C
	ldr r2, _08057B80 @ =0x0827C028
	ldr r0, [r4, #0x5c]
	adds r1, r2, #0
	bl sub_080504DC
	bl sub_08050008
	bl sub_08050040
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08057B74: .4byte 0x0201774C
_08057B78: .4byte 0x08BA18D4
_08057B7C: .4byte 0x0827AC10
_08057B80: .4byte 0x0827C028

	thumb_func_start sub_08057B84
sub_08057B84: @ 0x08057B84
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne _08057BAE
	bl sub_08050018
	bl sub_08050118
	ldr r1, _08057BB4 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08057BAE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08057BB4: .4byte 0x0201774C

	thumb_func_start sub_08057BB8
sub_08057BB8: @ 0x08057BB8
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08057BE4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08057BE8 @ =0x08BA18EC
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _08057BEC @ =0x081E808C
	str r1, [r0, #0x48]
	ldr r1, _08057BF0 @ =0x0827C008
	str r1, [r0, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08057BE4: .4byte 0x0201774C
_08057BE8: .4byte 0x08BA18EC
_08057BEC: .4byte 0x081E808C
_08057BF0: .4byte 0x0827C008

	thumb_func_start sub_08057BF4
sub_08057BF4: @ 0x08057BF4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_080506E4
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	cmp r5, #0
	blt _08057C34
	ldr r0, [r4, #0x4c]
	ldr r4, _08057C30 @ =0x020165C8
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #1
	adds r3, r5, #0
	bl sub_08066F64
	adds r0, r4, #0
	movs r1, #0x20
	bl sub_08050634
	b _08057C4A
	.align 2, 0
_08057C30: .4byte 0x020165C8
_08057C34:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	bne _08057C4A
	ldr r1, _08057C50 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08057C4A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08057C50: .4byte 0x0201774C

	thumb_func_start sub_08057C54
sub_08057C54: @ 0x08057C54
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_0804FFF0
	bl sub_0804FB6C
	bl sub_08050008
	ldr r0, _08057C8C @ =0x08BA190C
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl sub_08054804
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_0805468C
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08057C8C: .4byte 0x08BA190C

	thumb_func_start sub_08057C90
sub_08057C90: @ 0x08057C90
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl sub_080547A8
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08057CCC
	ldr r0, [r4, #0x5c]
	movs r1, #0x5a
	movs r2, #0xa
	bl sub_080561D0
	ldr r0, [r4, #0x5c]
	bl sub_08057D10
	movs r0, #0x8f
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl sub_080681E4
_08057CCC:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #4
	bne _08057CF4
	movs r0, #9
	ldrh r3, [r5, #0x10]
	orrs r0, r3
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl sub_08050140
	ldrb r0, [r4]
	cmp r0, #0
	bne _08057D0A
	adds r0, r5, #0
	bl sub_08067D14
	b _08057D0A
_08057CF4:
	cmp r0, #0x32
	beq _08057D0A
	cmp r0, #0x3c
	bne _08057D0A
	bl sub_0804FFFC
	bl sub_0804FBC4
	adds r0, r4, #0
	bl Proc_Break
_08057D0A:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08057D10
sub_08057D10: @ 0x08057D10
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _08057D4C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08057D50 @ =0x08BA1924
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	ldr r2, _08057D54 @ =0x08BAAED8
	ldr r3, _08057D58 @ =0x08BABB08
	str r2, [sp]
	adds r0, r4, #0
	adds r1, r3, #0
	bl sub_0805041C
	adds r6, r0, #0
	str r6, [r5, #0x60]
	adds r0, r4, #0
	bl sub_08054678
	cmp r0, #0
	bne _08057D5C
	ldrh r0, [r6, #2]
	adds r0, #0x20
	b _08057D60
	.align 2, 0
_08057D4C: .4byte 0x0201774C
_08057D50: .4byte 0x08BA1924
_08057D54: .4byte 0x08BAAED8
_08057D58: .4byte 0x08BABB08
_08057D5C:
	ldrh r0, [r6, #2]
	subs r0, #0x20
_08057D60:
	strh r0, [r6, #2]
	ldr r0, _08057D7C @ =0x081F02E0
	movs r1, #0x20
	bl sub_080505F0
	ldr r0, _08057D80 @ =0x081EE51C
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_080505C8
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08057D7C: .4byte 0x081F02E0
_08057D80: .4byte 0x081EE51C

	thumb_func_start sub_08057D84
sub_08057D84: @ 0x08057D84
	push {lr}
	ldr r2, _08057D98 @ =0x0201774C
	ldr r1, [r2]
	subs r1, #1
	str r1, [r2]
	ldr r0, [r0, #0x60]
	bl sub_08006650
	pop {r0}
	bx r0
	.align 2, 0
_08057D98: .4byte 0x0201774C

	thumb_func_start sub_08057D9C
sub_08057D9C: @ 0x08057D9C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_0804FFF0
	bl sub_08050008
	ldr r0, _08057DD0 @ =0x08BA1944
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl sub_08054804
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_0805468C
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08057DD0: .4byte 0x08BA1944

	thumb_func_start sub_08057DD4
sub_08057DD4: @ 0x08057DD4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl sub_080547A8
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08057E1A
	ldr r0, [r4, #0x5c]
	movs r1, #0x5a
	movs r2, #0xa
	bl sub_080561D0
	ldr r0, [r4, #0x5c]
	bl sub_08057E60
	ldr r0, [r4, #0x5c]
	bl sub_08057F08
	ldr r0, [r4, #0x5c]
	bl sub_08057F90
	ldr r0, _08057E44 @ =0x0000011F
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl sub_080681E4
_08057E1A:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #4
	bne _08057E48
	movs r0, #9
	ldrh r3, [r5, #0x10]
	orrs r0, r3
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl sub_08050140
	ldrb r0, [r4]
	cmp r0, #0
	bne _08057E5A
	adds r0, r5, #0
	bl sub_08067D14
	b _08057E5A
	.align 2, 0
_08057E44: .4byte 0x0000011F
_08057E48:
	cmp r0, #0x20
	beq _08057E5A
	cmp r0, #0x30
	bne _08057E5A
	bl sub_0804FFFC
	adds r0, r4, #0
	bl Proc_Break
_08057E5A:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08057E60
sub_08057E60: @ 0x08057E60
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08057E9C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08057EA0 @ =0x08BA195C
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _08057EA4 @ =0x081E8166
	str r1, [r0, #0x48]
	ldr r1, _08057EA8 @ =0x08BA1974
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, _08057EAC @ =0x081F0320
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_0805060C
	bl sub_08050040
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08057E9C: .4byte 0x0201774C
_08057EA0: .4byte 0x08BA195C
_08057EA4: .4byte 0x081E8166
_08057EA8: .4byte 0x08BA1974
_08057EAC: .4byte 0x081F0320

	thumb_func_start sub_08057EB0
sub_08057EB0: @ 0x08057EB0
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_080506E4
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _08057EDE
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl sub_080504DC
	b _08057EFC
_08057EDE:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _08057EFC
	bl sub_08050018
	ldr r1, _08057F04 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl sub_08050118
	adds r0, r4, #0
	bl Proc_Break
_08057EFC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08057F04: .4byte 0x0201774C

	thumb_func_start sub_08057F08
sub_08057F08: @ 0x08057F08
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08057F34 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08057F38 @ =0x08BA19A4
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _08057F3C @ =0x081E81AC
	str r1, [r0, #0x48]
	ldr r1, _08057F40 @ =0x0820D584
	str r1, [r0, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08057F34: .4byte 0x0201774C
_08057F38: .4byte 0x08BA19A4
_08057F3C: .4byte 0x081E81AC
_08057F40: .4byte 0x0820D584

	thumb_func_start sub_08057F44
sub_08057F44: @ 0x08057F44
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_080506E4
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _08057F6A
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl sub_08050634
	b _08057F84
_08057F6A:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08057F84
	bl sub_08050118
	ldr r1, _08057F8C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08057F84:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08057F8C: .4byte 0x0201774C

	thumb_func_start sub_08057F90
sub_08057F90: @ 0x08057F90
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _08057FD4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08057FD8 @ =0x08BA19C4
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x37
	strh r0, [r4, #0x2e]
	ldr r3, _08057FDC @ =0x08BAC744
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_0805041C
	adds r6, r0, #0
	str r6, [r4, #0x60]
	adds r0, r5, #0
	bl sub_08054678
	cmp r0, #0
	bne _08057FE0
	ldrh r0, [r6, #2]
	adds r0, #0x24
	b _08057FE4
	.align 2, 0
_08057FD4: .4byte 0x0201774C
_08057FD8: .4byte 0x08BA19C4
_08057FDC: .4byte 0x08BAC744
_08057FE0:
	ldrh r0, [r6, #2]
	subs r0, #0x24
_08057FE4:
	strh r0, [r6, #2]
	ldrh r0, [r6, #4]
	adds r0, #0xc
	strh r0, [r6, #4]
	ldr r0, _08058008 @ =0x081F0300
	movs r1, #0x20
	bl sub_080505F0
	ldr r0, _0805800C @ =0x081EE51C
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_080505C8
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08058008: .4byte 0x081F0300
_0805800C: .4byte 0x081EE51C

	thumb_func_start sub_08058010
sub_08058010: @ 0x08058010
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne _08058038
	ldr r0, _08058040 @ =0x0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl sub_08006650
	adds r0, r4, #0
	bl Proc_Break
_08058038:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08058040: .4byte 0x0201774C

	thumb_func_start sub_08058044
sub_08058044: @ 0x08058044
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_0804FFF0
	bl sub_0804FB6C
	bl sub_08050008
	ldr r0, _0805807C @ =0x08BA19DC
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl sub_08054804
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_0805468C
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805807C: .4byte 0x08BA19DC

	thumb_func_start sub_08058080
sub_08058080: @ 0x08058080
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl sub_080547A8
	adds r5, r0, #0
	bl sub_08050778
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _080580AA
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804E498
_080580AA:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #1
	cmp r1, r0
	bne _080580C8
	adds r0, r5, #0
	bl sub_08058120
	adds r0, r5, #0
	bl sub_08058228
	adds r0, r5, #0
	bl sub_080582B0
	b _0805811A
_080580C8:
	adds r0, r6, #4
	cmp r1, r0
	bne _080580FE
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl sub_08050140
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #2
	ldrsh r2, [r5, r0]
	movs r0, #0xf5
	movs r3, #1
	bl sub_080681E4
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805811A
	adds r0, r5, #0
	bl sub_08067D14
	b _0805811A
_080580FE:
	adds r0, r6, #0
	adds r0, #0x50
	cmp r1, r0
	beq _0805811A
	adds r0, #0x10
	cmp r1, r0
	bne _0805811A
	bl sub_0804FFFC
	bl sub_0804FBC4
	adds r0, r4, #0
	bl Proc_Break
_0805811A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_08058120
sub_08058120: @ 0x08058120
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _08058178 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805817C @ =0x08BA19F4
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _08058180 @ =0x081E824E
	str r0, [r5, #0x48]
	ldr r0, _08058184 @ =0x08BA1A0C
	str r0, [r5, #0x4c]
	ldr r0, _08058188 @ =0x08BA1A14
	str r0, [r5, #0x50]
	ldr r0, _0805818C @ =0x081FB4B4
	movs r1, #0x86
	lsls r1, r1, #5
	bl sub_0805060C
	bl sub_08050040
	ldr r0, _08058190 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805819E
	ldr r0, [r5, #0x5c]
	bl sub_08054678
	cmp r0, #0
	bne _08058194
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b _0805819E
	.align 2, 0
_08058178: .4byte 0x0201774C
_0805817C: .4byte 0x08BA19F4
_08058180: .4byte 0x081E824E
_08058184: .4byte 0x08BA1A0C
_08058188: .4byte 0x08BA1A14
_0805818C: .4byte 0x081FB4B4
_08058190: .4byte 0x0203E02C
_08058194:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
_0805819E:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_080581A4
sub_080581A4: @ 0x080581A4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r6, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_080506E4
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	cmp r5, #0
	blt _080581FC
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r5, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl sub_080504DC
	cmp r5, #0
	bne _080581DA
	ldr r6, _080581F4 @ =0x0000011F
_080581DA:
	cmp r5, #1
	bne _080581E2
	movs r6, #0xa8
	lsls r6, r6, #1
_080581E2:
	ldr r0, _080581F8 @ =0x0202349C
	str r6, [sp]
	movs r1, #2
	movs r2, #0x14
	movs r3, #1
	bl sub_080669B4
	b _0805821A
	.align 2, 0
_080581F4: .4byte 0x0000011F
_080581F8: .4byte 0x0202349C
_080581FC:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	bne _0805821A
	bl sub_08050018
	ldr r1, _08058224 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl sub_08050118
	adds r0, r4, #0
	bl Proc_Break
_0805821A:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08058224: .4byte 0x0201774C

	thumb_func_start sub_08058228
sub_08058228: @ 0x08058228
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08058254 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08058258 @ =0x08BA1A1C
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0805825C @ =0x081E8258
	str r1, [r0, #0x48]
	ldr r1, _08058260 @ =0x081FBD70
	str r1, [r0, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08058254: .4byte 0x0201774C
_08058258: .4byte 0x08BA1A1C
_0805825C: .4byte 0x081E8258
_08058260: .4byte 0x081FBD70

	thumb_func_start sub_08058264
sub_08058264: @ 0x08058264
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_080506E4
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _0805828A
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl sub_08050634
	b _080582A4
_0805828A:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080582A4
	bl sub_08050118
	ldr r1, _080582AC @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_080582A4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080582AC: .4byte 0x0201774C

	thumb_func_start sub_080582B0
sub_080582B0: @ 0x080582B0
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _080582F8 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080582FC @ =0x08BA1A3C
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r3, _08058300 @ =0x08BB3F30
	ldr r2, _08058304 @ =0x08BB3404
	str r2, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	bl sub_0805041C
	str r0, [r4, #0x60]
	ldr r0, _08058308 @ =0x081FC634
	movs r1, #0x20
	bl sub_080505F0
	ldr r0, _0805830C @ =0x081FC19C
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_080505C8
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080582F8: .4byte 0x0201774C
_080582FC: .4byte 0x08BA1A3C
_08058300: .4byte 0x08BB3F30
_08058304: .4byte 0x08BB3404
_08058308: .4byte 0x081FC634
_0805830C: .4byte 0x081FC19C

	thumb_func_start sub_08058310
sub_08058310: @ 0x08058310
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x32
	ble _08058336
	ldr r0, [r4, #0x60]
	bl sub_08006650
	ldr r1, _0805833C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08058336:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805833C: .4byte 0x0201774C

	thumb_func_start sub_08058340
sub_08058340: @ 0x08058340
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_0804FFF0
	bl sub_0804FB6C
	bl sub_08050008
	ldr r0, _08058380 @ =0x08BA1A54
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r1, #0
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x2a
	strb r1, [r0]
	adds r0, r5, #0
	bl sub_08054804
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_0805468C
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08058380: .4byte 0x08BA1A54

	thumb_func_start sub_08058384
sub_08058384: @ 0x08058384
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_0804FFF0
	bl sub_0804FB6C
	bl sub_08050008
	ldr r0, _080583C4 @ =0x08BA1A54
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x2a
	movs r0, #1
	strb r0, [r1]
	adds r0, r5, #0
	bl sub_08054804
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_0805468C
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080583C4: .4byte 0x08BA1A54

	thumb_func_start sub_080583C8
sub_080583C8: @ 0x080583C8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl sub_080547A8
	adds r6, r0, #0
	ldr r0, _080583F4 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _080583F8
	movs r5, #0x20
	movs r7, #0x34
	movs r3, #0x36
	mov r8, r3
	movs r0, #0x55
	mov sb, r0
	b _08058404
	.align 2, 0
_080583F4: .4byte 0x0203E02C
_080583F8:
	movs r5, #0x28
	movs r7, #0x3c
	movs r1, #0x41
	mov r8, r1
	movs r3, #0x60
	mov sb, r3
_08058404:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08058430
	ldr r0, [r4, #0x5c]
	bl sub_080584D0
	ldr r0, [r4, #0x5c]
	bl sub_08058588
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xf1
	movs r3, #1
	bl sub_080681E4
_08058430:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, r5
	bne _08058444
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804E498
	b _080584C4
_08058444:
	cmp r0, r7
	bne _080584AE
	movs r0, #9
	ldrh r3, [r6, #0x10]
	orrs r0, r3
	strh r0, [r6, #0x10]
	adds r5, r4, #0
	adds r5, #0x29
	ldrb r1, [r5]
	adds r0, r6, #0
	bl sub_08050140
	ldrb r0, [r5]
	cmp r0, #0
	bne _080584C4
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	bne _08058484
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #2
	ldrsh r2, [r6, r0]
	movs r0, #0xf7
	movs r3, #1
	bl sub_080681E4
	adds r0, r6, #0
	bl sub_0805865C
	b _080584A6
_08058484:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r6, r3]
	movs r0, #0xf8
	movs r3, #1
	bl sub_080681E4
	adds r0, r6, #0
	bl sub_08058744
	adds r0, r6, #0
	bl sub_08058810
	adds r0, r6, #0
	bl sub_0805889C
_080584A6:
	adds r0, r6, #0
	bl sub_08067D14
	b _080584C4
_080584AE:
	cmp r0, r8
	beq _080584C4
	cmp r0, sb
	bne _080584C4
	bl sub_0804FFFC
	bl sub_0804FBC4
	adds r0, r4, #0
	bl Proc_Break
_080584C4:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080584D0
sub_080584D0: @ 0x080584D0
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08058514 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08058518 @ =0x08BA1A6C
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0805851C @ =0x081E829A
	str r1, [r0, #0x48]
	ldr r1, _08058520 @ =0x08BA1A84
	str r1, [r0, #0x4c]
	ldr r1, _08058524 @ =0x08BA1AB4
	str r1, [r0, #0x50]
	ldr r0, _08058528 @ =0x081FD2CC
	movs r1, #0x20
	bl sub_08050634
	ldr r0, _0805852C @ =0x081FC6D4
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_0805060C
	bl sub_08050040
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08058514: .4byte 0x0201774C
_08058518: .4byte 0x08BA1A6C
_0805851C: .4byte 0x081E829A
_08058520: .4byte 0x08BA1A84
_08058524: .4byte 0x08BA1AB4
_08058528: .4byte 0x081FD2CC
_0805852C: .4byte 0x081FC6D4

	thumb_func_start sub_08058530
sub_08058530: @ 0x08058530
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_080506E4
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _0805855E
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl sub_080504DC
	b _0805857C
_0805855E:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _0805857C
	bl sub_08050018
	ldr r1, _08058584 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl sub_08050118
	adds r0, r4, #0
	bl Proc_Break
_0805857C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08058584: .4byte 0x0201774C

	thumb_func_start sub_08058588
sub_08058588: @ 0x08058588
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r1, _080585CC @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080585D0 @ =0x08BA1AE4
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r6, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r1, _080585D4 @ =0x08BB46D0
	ldr r2, _080585D8 @ =0x08BB4348
	ldr r3, _080585DC @ =0x08BB46FC
	ldr r0, _080585E0 @ =0x08BB4374
	str r0, [sp]
	adds r0, r6, #0
	bl sub_0805041C
	adds r5, r0, #0
	str r5, [r4, #0x60]
	adds r0, r6, #0
	bl sub_08054678
	cmp r0, #0
	bne _080585E4
	ldrh r0, [r6, #2]
	subs r0, #8
	b _080585E8
	.align 2, 0
_080585CC: .4byte 0x0201774C
_080585D0: .4byte 0x08BA1AE4
_080585D4: .4byte 0x08BB46D0
_080585D8: .4byte 0x08BB4348
_080585DC: .4byte 0x08BB46FC
_080585E0: .4byte 0x08BB4374
_080585E4:
	ldrh r0, [r6, #2]
	adds r0, #8
_080585E8:
	strh r0, [r5, #2]
	ldrh r0, [r6, #4]
	adds r0, #8
	strh r0, [r5, #4]
	ldr r0, _0805860C @ =0x081FEE00
	movs r1, #0x20
	bl sub_080505F0
	ldr r0, _08058610 @ =0x081FE804
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_080505C8
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805860C: .4byte 0x081FEE00
_08058610: .4byte 0x081FE804

	thumb_func_start sub_08058614
sub_08058614: @ 0x08058614
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x25
	bne _0805863A
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xf2
	movs r3, #1
	bl sub_080681E4
	b _08058652
_0805863A:
	cmp r0, #0x32
	ble _08058652
	ldr r0, [r4, #0x60]
	bl sub_08006650
	ldr r1, _08058658 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08058652:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08058658: .4byte 0x0201774C

	thumb_func_start sub_0805865C
sub_0805865C: @ 0x0805865C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _080586B4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080586B8 @ =0x08BA1AFC
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _080586BC @ =0x081E82CC
	str r0, [r5, #0x48]
	ldr r0, _080586C0 @ =0x08BA1B68
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _080586C4 @ =0x08BA1B14
	str r0, [r5, #0x54]
	ldr r0, _080586C8 @ =0x08207A18
	movs r1, #0x20
	bl sub_08050634
	bl sub_08050040
	ldr r0, _080586CC @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _080586DA
	ldr r0, [r5, #0x5c]
	bl sub_08054678
	cmp r0, #0
	bne _080586D0
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b _080586DA
	.align 2, 0
_080586B4: .4byte 0x0201774C
_080586B8: .4byte 0x08BA1AFC
_080586BC: .4byte 0x081E82CC
_080586C0: .4byte 0x08BA1B68
_080586C4: .4byte 0x08BA1B14
_080586C8: .4byte 0x08207A18
_080586CC: .4byte 0x0203E02C
_080586D0:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
_080586DA:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_080586E0
sub_080586E0: @ 0x080586E0
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl sub_080506E4
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _0805871C
	ldr r5, [r7, #0x4c]
	ldr r6, [r7, #0x50]
	ldr r0, [r7, #0x54]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_0805060C
	ldr r0, [r7, #0x5c]
	adds r5, r4, r5
	ldr r1, [r5]
	adds r4, r4, r6
	ldr r2, [r4]
	bl sub_080504DC
	b _0805873A
_0805871C:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne _0805873A
	bl sub_08050018
	ldr r1, _08058740 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl sub_08050118
	adds r0, r7, #0
	bl Proc_End
_0805873A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08058740: .4byte 0x0201774C

	thumb_func_start sub_08058744
sub_08058744: @ 0x08058744
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _080587A0 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080587A4 @ =0x08BA1BBC
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	ldr r0, _080587A8 @ =0x08209520
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_0805060C
	ldr r0, [r5, #0x5c]
	ldr r2, _080587AC @ =0x0820A6DC
	adds r1, r2, #0
	bl sub_080504DC
	bl sub_08050008
	bl sub_08050040
	ldr r0, _080587B0 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _080587D0
	ldr r0, [r5, #0x5c]
	bl sub_08054678
	cmp r0, #0
	bne _080587B4
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b _080587BE
	.align 2, 0
_080587A0: .4byte 0x0201774C
_080587A4: .4byte 0x08BA1BBC
_080587A8: .4byte 0x08209520
_080587AC: .4byte 0x0820A6DC
_080587B0: .4byte 0x0203E02C
_080587B4:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
_080587BE:
	ldr r0, _080587D8 @ =0x0202349C
	movs r1, #0x80
	lsls r1, r1, #1
	str r1, [sp]
	movs r1, #2
	movs r2, #0x14
	movs r3, #1
	bl sub_080669F4
_080587D0:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080587D8: .4byte 0x0202349C

	thumb_func_start sub_080587DC
sub_080587DC: @ 0x080587DC
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	bne _08058804
	bl sub_08050018
	bl sub_08050118
	ldr r1, _0805880C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08058804:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805880C: .4byte 0x0201774C

	thumb_func_start sub_08058810
sub_08058810: @ 0x08058810
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08058844 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08058848 @ =0x08BA1BD4
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0805884C @ =0x081E8322
	str r1, [r0, #0x48]
	ldr r1, _08058850 @ =0x0820A4DC
	str r1, [r0, #0x4c]
	adds r0, r1, #0
	movs r1, #0x20
	bl sub_08050634
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08058844: .4byte 0x0201774C
_08058848: .4byte 0x08BA1BD4
_0805884C: .4byte 0x081E8322
_08058850: .4byte 0x0820A4DC

	thumb_func_start sub_08058854
sub_08058854: @ 0x08058854
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_080506E4
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _0805887A
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl sub_08050634
	b _08058890
_0805887A:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08058890
	ldr r1, _08058898 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08058890:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08058898: .4byte 0x0201774C

	thumb_func_start sub_0805889C
sub_0805889C: @ 0x0805889C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _080588DC @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080588E0 @ =0x08BA1BF4
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r3, _080588E4 @ =0x08BB62EC
	ldr r2, _080588E8 @ =0x08BB54CC
	str r2, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	bl sub_0805041C
	adds r6, r0, #0
	str r6, [r4, #0x60]
	adds r0, r5, #0
	bl sub_08054678
	cmp r0, #0
	bne _080588EC
	ldrh r0, [r6, #2]
	subs r0, #8
	b _080588F0
	.align 2, 0
_080588DC: .4byte 0x0201774C
_080588E0: .4byte 0x08BA1BF4
_080588E4: .4byte 0x08BB62EC
_080588E8: .4byte 0x08BB54CC
_080588EC:
	ldrh r0, [r6, #2]
	adds r0, #8
_080588F0:
	strh r0, [r6, #2]
	ldr r0, [r6, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r6, #0x1c]
	ldr r0, _08058918 @ =0x0820AB9C
	movs r1, #0x20
	bl sub_080505F0
	ldr r0, _0805891C @ =0x0820A924
	movs r1, #0x80
	lsls r1, r1, #4
	bl sub_080505C8
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08058918: .4byte 0x0820AB9C
_0805891C: .4byte 0x0820A924

	thumb_func_start sub_08058920
sub_08058920: @ 0x08058920
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble _08058946
	ldr r0, [r4, #0x60]
	bl sub_08006650
	ldr r1, _0805894C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08058946:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805894C: .4byte 0x0201774C

	thumb_func_start sub_08058950
sub_08058950: @ 0x08058950
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_0804FFF0
	bl sub_0804FB6C
	bl sub_08050008
	ldr r0, _08058988 @ =0x08BA1C0C
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl sub_08054804
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_0805468C
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08058988: .4byte 0x08BA1C0C

	thumb_func_start sub_0805898C
sub_0805898C: @ 0x0805898C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl sub_080547A8
	adds r5, r0, #0
	bl sub_08050778
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r1, #0
	mov r8, r1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _080589C2
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804E498
_080589C2:
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	adds r0, r6, #1
	cmp r1, r0
	bne _08058A1E
	adds r0, r5, #0
	bl sub_08058AC4
	adds r0, r5, #0
	bl sub_08058D28
	ldr r3, _08058A34 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	mov r2, r8
	strb r2, [r0]
	adds r0, #1
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r2, [r0]
	str r1, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl sub_08055F08
	movs r0, #0x91
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl sub_080681E4
_08058A1E:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #0
	adds r0, #0x52
	cmp r1, r0
	bne _08058A38
	ldr r0, [r4, #0x5c]
	movs r1, #4
	bl sub_0804EFDC
	b _08058AB8
	.align 2, 0
_08058A34: .4byte 0x03002870
_08058A38:
	adds r0, r6, #0
	adds r0, #0x55
	cmp r1, r0
	bne _08058A74
	adds r0, r5, #0
	bl sub_08058BAC
	adds r0, r5, #0
	bl sub_08058C94
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x18
	movs r2, #0x10
	movs r3, #0x10
	bl sub_08055F08
	ldr r0, _08058A70 @ =0x00000123
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl sub_080681E4
	b _08058AB8
	.align 2, 0
_08058A70: .4byte 0x00000123
_08058A74:
	adds r0, r6, #0
	adds r0, #0x58
	cmp r1, r0
	bne _08058A9C
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl sub_08050140
	ldrb r0, [r4]
	cmp r0, #0
	bne _08058AB8
	adds r0, r5, #0
	bl sub_08067D14
	b _08058AB8
_08058A9C:
	adds r0, r6, #0
	adds r0, #0x88
	cmp r1, r0
	beq _08058AB8
	adds r0, #0x19
	cmp r1, r0
	bne _08058AB8
	bl sub_0804FFFC
	bl sub_0804FBC4
	adds r0, r4, #0
	bl Proc_Break
_08058AB8:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08058AC4
sub_08058AC4: @ 0x08058AC4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _08058B18 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08058B1C @ =0x08BA1C24
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _08058B20 @ =0x081E8378
	str r0, [r5, #0x48]
	ldr r0, _08058B24 @ =0x08BA1C3C
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _08058B28 @ =0x08BA1C54
	str r0, [r5, #0x54]
	ldr r0, _08058B2C @ =0x0821BBA8
	movs r1, #0x20
	bl sub_08050634
	ldr r0, _08058B30 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08058B3E
	ldr r0, [r5, #0x5c]
	bl sub_08054678
	cmp r0, #0
	bne _08058B34
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b _08058B3E
	.align 2, 0
_08058B18: .4byte 0x0201774C
_08058B1C: .4byte 0x08BA1C24
_08058B20: .4byte 0x081E8378
_08058B24: .4byte 0x08BA1C3C
_08058B28: .4byte 0x08BA1C54
_08058B2C: .4byte 0x0821BBA8
_08058B30: .4byte 0x0203E02C
_08058B34:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
_08058B3E:
	bl sub_08050040
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08058B48
sub_08058B48: @ 0x08058B48
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_080506E4
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt _08058B84
	ldr r1, [r4, #0x4c]
	ldr r2, [r4, #0x50]
	ldr r5, [r4, #0x54]
	ldr r0, [r4, #0x5c]
	lsls r4, r3, #2
	adds r1, r4, r1
	ldr r1, [r1]
	adds r2, r4, r2
	ldr r2, [r2]
	bl sub_080504DC
	adds r4, r4, r5
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_0805060C
	b _08058BA2
_08058B84:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, r0
	bne _08058BA2
	bl sub_08050018
	ldr r1, _08058BA8 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl sub_08050118
	adds r0, r4, #0
	bl Proc_Break
_08058BA2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08058BA8: .4byte 0x0201774C

	thumb_func_start sub_08058BAC
sub_08058BAC: @ 0x08058BAC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _08058C00 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08058C04 @ =0x08BA1C6C
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _08058C08 @ =0x081E83E6
	str r0, [r5, #0x48]
	ldr r0, _08058C0C @ =0x08BA1C84
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _08058C10 @ =0x08BA1CB0
	str r0, [r5, #0x54]
	ldr r0, _08058C14 @ =0x08213E80
	movs r1, #0x20
	bl sub_08050634
	ldr r0, _08058C18 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08058C26
	ldr r0, [r5, #0x5c]
	bl sub_08054678
	cmp r0, #0
	bne _08058C1C
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b _08058C26
	.align 2, 0
_08058C00: .4byte 0x0201774C
_08058C04: .4byte 0x08BA1C6C
_08058C08: .4byte 0x081E83E6
_08058C0C: .4byte 0x08BA1C84
_08058C10: .4byte 0x08BA1CB0
_08058C14: .4byte 0x08213E80
_08058C18: .4byte 0x0203E02C
_08058C1C:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
_08058C26:
	bl sub_08050040
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08058C30
sub_08058C30: @ 0x08058C30
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_080506E4
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt _08058C6C
	ldr r1, [r4, #0x4c]
	ldr r2, [r4, #0x50]
	ldr r5, [r4, #0x54]
	ldr r0, [r4, #0x5c]
	lsls r4, r3, #2
	adds r1, r4, r1
	ldr r1, [r1]
	adds r2, r4, r2
	ldr r2, [r2]
	bl sub_080504DC
	adds r4, r4, r5
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_0805060C
	b _08058C8A
_08058C6C:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, r0
	bne _08058C8A
	bl sub_08050018
	ldr r1, _08058C90 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl sub_08050118
	adds r0, r4, #0
	bl Proc_Break
_08058C8A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08058C90: .4byte 0x0201774C

	thumb_func_start sub_08058C94
sub_08058C94: @ 0x08058C94
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _08058CE4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08058CE8 @ =0x08BA1CDC
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r3, _08058CEC @ =0x08BB91BC
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_0805041C
	str r0, [r4, #0x60]
	ldrh r1, [r0, #2]
	adds r1, #0x18
	strh r1, [r0, #2]
	ldr r0, _08058CF0 @ =0x0826AC3C
	movs r1, #0x20
	bl sub_080505F0
	ldr r0, _08058CF4 @ =0x0821C860
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_080505C8
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08058CE4: .4byte 0x0201774C
_08058CE8: .4byte 0x08BA1CDC
_08058CEC: .4byte 0x08BB91BC
_08058CF0: .4byte 0x0826AC3C
_08058CF4: .4byte 0x0821C860

	thumb_func_start sub_08058CF8
sub_08058CF8: @ 0x08058CF8
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x33
	ble _08058D1E
	ldr r0, [r4, #0x60]
	bl sub_08006650
	ldr r1, _08058D24 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08058D1E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08058D24: .4byte 0x0201774C

	thumb_func_start sub_08058D28
sub_08058D28: @ 0x08058D28
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08058D64 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08058D68 @ =0x08BA1CF4
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	strh r2, [r0, #0x2e]
	movs r1, #1
	str r1, [r0, #0x44]
	str r2, [r0, #0x48]
	ldr r0, _08058D6C @ =0x0826AC3C
	movs r1, #0x20
	bl sub_080505F0
	ldr r0, _08058D70 @ =0x0821C860
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_080505C8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08058D64: .4byte 0x0201774C
_08058D68: .4byte 0x08BA1CF4
_08058D6C: .4byte 0x0826AC3C
_08058D70: .4byte 0x0821C860

	thumb_func_start sub_08058D74
sub_08058D74: @ 0x08058D74
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_08058D7A:
	ldr r0, [r5, #0x5c]
	adds r1, r4, #0
	bl sub_08058DA0
	adds r4, #1
	cmp r4, #0x1b
	ble _08058D7A
	ldr r1, _08058D9C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08058D9C: .4byte 0x0201774C

	thumb_func_start sub_08058DA0
sub_08058DA0: @ 0x08058DA0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r6, r0, #0
	mov r8, r1
	mov r4, sp
	mov r0, sp
	movs r1, #0
	movs r2, #8
	bl memset
	movs r5, #0
	movs r0, #1
	strb r0, [r4, #6]
	strb r0, [r4, #7]
	ldr r1, _08058E30 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08058E34 @ =0x08BA1D0C
	movs r1, #3
	bl SpawnProc
	adds r7, r0, #0
	str r6, [r7, #0x5c]
	strh r5, [r7, #0x2c]
	movs r0, #0x64
	strh r0, [r7, #0x2e]
	movs r0, #7
	mov r1, r8
	ands r0, r1
	mov r2, sp
	adds r4, r2, r0
	ldrb r0, [r4]
	adds r1, r7, #0
	adds r1, #0x29
	strb r0, [r1]
	ldr r0, _08058E38 @ =0x08BB9228
	movs r1, #0x78
	bl sub_08006594
	str r0, [r7, #0x60]
	movs r1, #0xa1
	lsls r1, r1, #6
	strh r1, [r0, #8]
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	ldr r5, _08058E3C @ =0x0000FFFF
	adds r0, r5, #0
	bl sub_080672E8
	strh r0, [r7, #0x32]
	adds r0, r5, #0
	bl sub_080672E8
	strh r0, [r7, #0x3a]
	ldrb r0, [r4]
	cmp r0, #0
	bne _08058E44
	adds r0, r5, #0
	bl sub_080672E8
	ldr r2, _08058E40 @ =0x000001FF
	adds r1, r2, #0
	ands r0, r1
	movs r1, #0xe0
	lsls r1, r1, #3
	b _08058E56
	.align 2, 0
_08058E30: .4byte 0x0201774C
_08058E34: .4byte 0x08BA1D0C
_08058E38: .4byte 0x08BB9228
_08058E3C: .4byte 0x0000FFFF
_08058E40: .4byte 0x000001FF
_08058E44:
	adds r0, r5, #0
	bl sub_080672E8
	ldr r2, _08058EA0 @ =0x000001FF
	adds r1, r2, #0
	ands r0, r1
	movs r2, #0xa0
	lsls r2, r2, #4
	adds r1, r2, #0
_08058E56:
	adds r0, r0, r1
	strh r0, [r7, #0x34]
	ldr r4, _08058EA4 @ =0x0000FF0F
	adds r0, r4, #0
	bl sub_080672E8
	ldr r2, _08058EA8 @ =0x000003FF
	adds r1, r2, #0
	ands r0, r1
	ldr r1, _08058EAC @ =0xFFFFFF00
	adds r0, r0, r1
	strh r0, [r7, #0x3c]
	adds r0, r4, #0
	bl sub_080672E8
	strh r0, [r7, #0x36]
	adds r0, r4, #0
	bl sub_080672E8
	strh r0, [r7, #0x3e]
	movs r0, #7
	mov r2, r8
	ands r0, r2
	add r0, sp
	ldrb r0, [r0]
	cmp r0, #0
	bne _08058EB0
	adds r0, r4, #0
	bl sub_080672E8
	ldr r2, _08058EA0 @ =0x000001FF
	adds r1, r2, #0
	ands r0, r1
	movs r1, #0xe0
	lsls r1, r1, #3
	b _08058EC2
	.align 2, 0
_08058EA0: .4byte 0x000001FF
_08058EA4: .4byte 0x0000FF0F
_08058EA8: .4byte 0x000003FF
_08058EAC: .4byte 0xFFFFFF00
_08058EB0:
	adds r0, r4, #0
	bl sub_080672E8
	ldr r2, _08058EE8 @ =0x000001FF
	adds r1, r2, #0
	ands r0, r1
	movs r2, #0xa0
	lsls r2, r2, #4
	adds r1, r2, #0
_08058EC2:
	adds r0, r0, r1
	strh r0, [r7, #0x38]
	ldr r0, _08058EEC @ =0x0000FF0F
	bl sub_080672E8
	ldr r2, _08058EF0 @ =0x000003FF
	adds r1, r2, #0
	ands r0, r1
	ldr r1, _08058EF4 @ =0xFFFFFF00
	adds r0, r0, r1
	adds r1, r7, #0
	adds r1, #0x40
	strh r0, [r1]
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08058EE8: .4byte 0x000001FF
_08058EEC: .4byte 0x0000FF0F
_08058EF0: .4byte 0x000003FF
_08058EF4: .4byte 0xFFFFFF00

	thumb_func_start sub_08058EF8
sub_08058EF8: @ 0x08058EF8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r3, [r4, #0x60]
	ldrh r2, [r4, #0x2c]
	adds r2, #1
	strh r2, [r4, #0x2c]
	lsls r1, r2, #0x10
	ldrh r5, [r4, #0x2e]
	lsls r0, r5, #0x10
	cmp r1, r0
	ble _08058F28
	ldr r1, _08058F24 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r3, #0
	bl sub_08006650
	adds r0, r4, #0
	bl Proc_Break
	b _08058FA8
	.align 2, 0
_08058F24: .4byte 0x0201774C
_08058F28:
	movs r0, #1
	ands r2, r0
	cmp r2, #0
	bne _08058F6C
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _08058F44
	ldr r0, _08058F40 @ =0x08BB9288
	b _08058F46
	.align 2, 0
_08058F40: .4byte 0x08BB9288
_08058F44:
	ldr r0, _08058F68 @ =0x08BB9290
_08058F46:
	str r0, [r3, #0x24]
	str r0, [r3, #0x20]
	movs r0, #0
	strh r0, [r3, #6]
	ldrh r1, [r4, #0x32]
	ldrh r2, [r4, #0x34]
	adds r0, r1, r2
	strh r0, [r4, #0x32]
	ldrh r5, [r4, #0x3a]
	ldrh r2, [r4, #0x3c]
	adds r1, r5, r2
	strh r1, [r4, #0x3a]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x18
	strh r0, [r3, #2]
	ldrh r4, [r4, #0x3a]
	b _08058FA4
	.align 2, 0
_08058F68: .4byte 0x08BB9290
_08058F6C:
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _08058F80
	ldr r0, _08058F7C @ =0x08BB9288
	b _08058F82
	.align 2, 0
_08058F7C: .4byte 0x08BB9288
_08058F80:
	ldr r0, _08058FB0 @ =0x08BB9290
_08058F82:
	str r0, [r3, #0x24]
	str r0, [r3, #0x20]
	movs r0, #0
	strh r0, [r3, #6]
	ldrh r5, [r4, #0x3e]
	ldrh r1, [r4, #0x38]
	adds r0, r5, r1
	strh r0, [r4, #0x3e]
	adds r1, r4, #0
	adds r1, #0x40
	ldrh r1, [r1]
	adds r0, r1, r0
	strh r0, [r4, #0x3e]
	ldrh r2, [r4, #0x36]
	lsrs r0, r2, #8
	strh r0, [r3, #2]
	ldrh r4, [r4, #0x3e]
_08058FA4:
	lsrs r0, r4, #8
	strh r0, [r3, #4]
_08058FA8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08058FB0: .4byte 0x08BB9290

	thumb_func_start sub_08058FB4
sub_08058FB4: @ 0x08058FB4
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_0804FFF0
	bl sub_0804FB6C
	bl sub_08050008
	ldr r0, _08058FEC @ =0x08BA1D24
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl sub_08054804
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_0805468C
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08058FEC: .4byte 0x08BA1D24

	thumb_func_start sub_08058FF0
sub_08058FF0: @ 0x08058FF0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl sub_080547A8
	adds r5, r0, #0
	bl sub_08050778
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805901A
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804E498
_0805901A:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #1
	cmp r1, r0
	bne _08059040
	ldr r0, _08059088 @ =0x00000119
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl sub_080681E4
	adds r0, r5, #0
	bl sub_080590B0
	adds r0, r5, #0
	bl sub_080591EC
_08059040:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #0
	adds r0, #0x59
	cmp r1, r0
	bne _08059056
	adds r0, r5, #0
	movs r1, #2
	movs r2, #3
	bl sub_08059320
_08059056:
	movs r3, #0x2c
	ldrsh r1, [r4, r3]
	adds r0, r6, #0
	adds r0, #0x5e
	cmp r1, r0
	bne _0805908C
	adds r0, r5, #0
	bl sub_08059160
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl sub_08050140
	ldrb r0, [r4]
	cmp r0, #0
	bne _080590A8
	adds r0, r5, #0
	bl sub_08067D14
	b _080590A8
	.align 2, 0
_08059088: .4byte 0x00000119
_0805908C:
	adds r0, r6, #0
	adds r0, #0xc3
	cmp r1, r0
	beq _080590A8
	adds r0, #5
	cmp r1, r0
	bne _080590A8
	bl sub_0804FFFC
	bl sub_0804FBC4
	adds r0, r4, #0
	bl Proc_Break
_080590A8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080590B0
sub_080590B0: @ 0x080590B0
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _080590EC @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080590F0 @ =0x08BA1D3C
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _080590F4 @ =0x081E8414
	str r1, [r0, #0x48]
	ldr r1, _080590F8 @ =0x08BA1D80
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _080590FC @ =0x08BA1D54
	str r1, [r0, #0x54]
	ldr r0, _08059100 @ =0x0820D584
	movs r1, #0x20
	bl sub_08050634
	bl sub_08050040
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080590EC: .4byte 0x0201774C
_080590F0: .4byte 0x08BA1D3C
_080590F4: .4byte 0x081E8414
_080590F8: .4byte 0x08BA1D80
_080590FC: .4byte 0x08BA1D54
_08059100: .4byte 0x0820D584

	thumb_func_start sub_08059104
sub_08059104: @ 0x08059104
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl sub_080506E4
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _08059140
	ldr r5, [r7, #0x4c]
	ldr r6, [r7, #0x50]
	ldr r0, [r7, #0x54]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_0805060C
	ldr r0, [r7, #0x5c]
	adds r5, r4, r5
	ldr r1, [r5]
	adds r4, r4, r6
	ldr r2, [r4]
	bl sub_080504DC
	b _08059156
_08059140:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne _08059156
	ldr r1, _0805915C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r7, #0
	bl Proc_End
_08059156:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805915C: .4byte 0x0201774C

	thumb_func_start sub_08059160
sub_08059160: @ 0x08059160
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805917C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08059180 @ =0x08BA1DAC
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805917C: .4byte 0x0201774C
_08059180: .4byte 0x08BA1DAC

	thumb_func_start sub_08059184
sub_08059184: @ 0x08059184
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	ldr r3, _080591BC @ =0x08BB7280
	str r3, [sp]
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_0805041C
	str r0, [r4, #0x60]
	ldr r0, _080591C0 @ =0x081FC634
	movs r1, #0x20
	bl sub_080505F0
	ldr r0, _080591C4 @ =0x081FC19C
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_080505C8
	adds r0, r4, #0
	bl Proc_Break
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080591BC: .4byte 0x08BB7280
_080591C0: .4byte 0x081FC634
_080591C4: .4byte 0x081FC19C

	thumb_func_start sub_080591C8
sub_080591C8: @ 0x080591C8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x60]
	bl sub_08006650
	ldr r1, _080591E8 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080591E8: .4byte 0x0201774C

	thumb_func_start sub_080591EC
sub_080591EC: @ 0x080591EC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08059208 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805920C @ =0x08BA1DD4
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08059208: .4byte 0x0201774C
_0805920C: .4byte 0x08BA1DD4

	thumb_func_start sub_08059210
sub_08059210: @ 0x08059210
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x8d
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl sub_080681E4
	ldr r0, [r4, #0x5c]
	movs r1, #0x26
	bl sub_0804EFDC
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #5
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08059244
sub_08059244: @ 0x08059244
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r1, #0x2e
	ldrsh r0, [r6, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl sub_08012FE8
	adds r5, r0, #0
	ldr r0, _080592A0 @ =0x02022860
	ldr r4, _080592A4 @ =0x020165C8
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r4, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r5, #0
	bl sub_08066F64
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r6, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _08059298
	movs r0, #0
	strh r0, [r6, #0x2c]
	movs r0, #0xa
	strh r0, [r6, #0x2e]
	adds r0, r6, #0
	bl Proc_Break
_08059298:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080592A0: .4byte 0x02022860
_080592A4: .4byte 0x020165C8

	thumb_func_start sub_080592A8
sub_080592A8: @ 0x080592A8
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl sub_08012FE8
	ldr r2, _08059318 @ =0x03002870
	mov ip, r2
	mov r3, ip
	adds r3, #0x3c
	movs r1, #0x3f
	ldrb r2, [r3]
	ands r1, r2
	movs r2, #0x40
	orrs r1, r2
	strb r1, [r3]
	mov r1, ip
	adds r1, #0x44
	movs r2, #0
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r2, [r0]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _08059310
	bl sub_08050018
	bl sub_08050118
	ldr r1, _0805931C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08059310:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08059318: .4byte 0x03002870
_0805931C: .4byte 0x0201774C

	thumb_func_start sub_08059320
sub_08059320: @ 0x08059320
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r1, _08059354 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08059358 @ =0x02022860
	ldr r1, _0805935C @ =0x020165C8
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuFastSet
	ldr r0, _08059360 @ =0x08BA1E14
	movs r1, #0
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	strh r6, [r0, #0x30]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08059354: .4byte 0x0201774C
_08059358: .4byte 0x02022860
_0805935C: .4byte 0x020165C8
_08059360: .4byte 0x08BA1E14

	thumb_func_start sub_08059364
sub_08059364: @ 0x08059364
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl sub_08012FE8
	adds r3, r0, #0
	ldr r4, _080593C0 @ =0x020165C8
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	bl sub_08066EE8
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r4, #0
	bl CpuFastSet
	bl sub_08001070
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r5, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _080593B8
	movs r0, #0
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	bl Proc_Break
_080593B8:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080593C0: .4byte 0x020165C8

	thumb_func_start sub_080593C4
sub_080593C4: @ 0x080593C4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08059400 @ =0x020165C8
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuFastSet
	bl sub_08001070
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _080593F8
	ldr r1, _08059404 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_080593F8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08059400: .4byte 0x020165C8
_08059404: .4byte 0x0201774C

	thumb_func_start sub_08059408
sub_08059408: @ 0x08059408
	bx lr
	.align 2, 0

	thumb_func_start sub_0805940C
sub_0805940C: @ 0x0805940C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_0804FFF0
	bl sub_0804FB6C
	bl sub_08050008
	ldr r0, _08059444 @ =0x08BA1E34
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl sub_08054804
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_0805468C
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08059444: .4byte 0x08BA1E34

	thumb_func_start sub_08059448
sub_08059448: @ 0x08059448
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl sub_080547A8
	adds r5, r0, #0
	bl sub_08050778
	adds r2, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08059484
	movs r0, #0x85
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl sub_080681E4
	adds r0, r5, #0
	bl sub_08059538
	b _08059532
_08059484:
	cmp r0, #0x10
	bne _08059490
	ldr r0, [r4, #0x5c]
	bl sub_080596FC
	b _08059532
_08059490:
	cmp r0, #0x4a
	bne _080594A0
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804E498
	b _08059532
_080594A0:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r2, #0
	adds r0, #0x4b
	cmp r1, r0
	bne _080594B6
	adds r0, r5, #0
	bl sub_08059740
	str r0, [r4, #0x64]
	b _08059532
_080594B6:
	adds r0, r2, #0
	adds r0, #0x5e
	cmp r1, r0
	bne _080594DC
	ldr r0, _080594D8 @ =0x000002E1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl sub_080681E4
	ldr r0, [r4, #0x5c]
	bl sub_080595E8
	b _08059532
	.align 2, 0
_080594D8: .4byte 0x000002E1
_080594DC:
	adds r0, r2, #0
	adds r0, #0x72
	cmp r1, r0
	bne _080594EC
	ldr r0, [r4, #0x64]
	bl Proc_End
	b _08059532
_080594EC:
	adds r0, r2, #0
	adds r0, #0x83
	cmp r1, r0
	bne _0805951C
	ldr r0, [r4, #0x5c]
	movs r1, #6
	bl sub_0804EFDC
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl sub_08050140
	ldrb r0, [r4]
	cmp r0, #0
	bne _08059532
	adds r0, r5, #0
	bl sub_08067D14
	b _08059532
_0805951C:
	adds r0, r2, #0
	adds r0, #0xa4
	cmp r1, r0
	bne _08059532
	bl sub_0804FFFC
	bl sub_0804FBC4
	adds r0, r4, #0
	bl Proc_Break
_08059532:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08059538
sub_08059538: @ 0x08059538
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _08059590 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08059594 @ =0x08BA1E4C
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _08059598 @ =0x081E845A
	str r0, [r5, #0x48]
	ldr r0, _0805959C @ =0x08BA1E64
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _080595A0 @ =0x08BA1F08
	str r0, [r5, #0x54]
	ldr r0, _080595A4 @ =0x08227108
	movs r1, #0x20
	bl sub_08050634
	bl sub_08050040
	ldr r0, _080595A8 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _080595B6
	ldr r0, [r5, #0x5c]
	bl sub_08054678
	cmp r0, #0
	bne _080595AC
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
	b _080595B6
	.align 2, 0
_08059590: .4byte 0x0201774C
_08059594: .4byte 0x08BA1E4C
_08059598: .4byte 0x081E845A
_0805959C: .4byte 0x08BA1E64
_080595A0: .4byte 0x08BA1F08
_080595A4: .4byte 0x08227108
_080595A8: .4byte 0x0203E02C
_080595AC:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
_080595B6:
	ldr r0, [r5, #0x5c]
	bl sub_08054678
	cmp r0, #0
	bne _080595CC
	ldr r0, _080595C8 @ =0x03002870
	ldrh r1, [r0, #0x20]
	adds r1, #4
	b _080595D2
	.align 2, 0
_080595C8: .4byte 0x03002870
_080595CC:
	ldr r0, _080595E4 @ =0x03002870
	ldrh r1, [r0, #0x20]
	subs r1, #4
_080595D2:
	strh r1, [r0, #0x20]
	adds r1, r0, #0
	ldrh r0, [r1, #0x22]
	adds r0, #8
	strh r0, [r1, #0x22]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080595E4: .4byte 0x03002870

	thumb_func_start sub_080595E8
sub_080595E8: @ 0x080595E8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _08059668 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805966C @ =0x08BA1E4C
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r4, #0
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _08059670 @ =0x081E848C
	str r0, [r5, #0x48]
	ldr r0, _08059674 @ =0x08BA1E64
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _08059678 @ =0x08BA1F08
	str r0, [r5, #0x54]
	ldr r0, _0805967C @ =0x08227128
	movs r1, #0x20
	bl sub_08050634
	bl sub_08050040
	ldr r3, _08059680 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x44
	movs r0, #0xa
	strb r0, [r1]
	adds r1, #1
	movs r0, #7
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r4, [r0]
	ldr r0, _08059684 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08059692
	ldr r0, [r5, #0x5c]
	bl sub_08054678
	cmp r0, #0
	bne _08059688
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
	b _08059692
	.align 2, 0
_08059668: .4byte 0x0201774C
_0805966C: .4byte 0x08BA1E4C
_08059670: .4byte 0x081E848C
_08059674: .4byte 0x08BA1E64
_08059678: .4byte 0x08BA1F08
_0805967C: .4byte 0x08227128
_08059680: .4byte 0x03002870
_08059684: .4byte 0x0203E02C
_08059688:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
_08059692:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08059698
sub_08059698: @ 0x08059698
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl sub_080506E4
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _080596D4
	ldr r5, [r7, #0x4c]
	ldr r6, [r7, #0x50]
	ldr r0, [r7, #0x54]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_0805060C
	ldr r0, [r7, #0x5c]
	adds r5, r4, r5
	ldr r1, [r5]
	adds r4, r4, r6
	ldr r2, [r4]
	bl sub_080504DC
	b _080596F2
_080596D4:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne _080596F2
	bl sub_08050018
	ldr r1, _080596F8 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl sub_08050118
	adds r0, r7, #0
	bl Proc_End
_080596F2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080596F8: .4byte 0x0201774C

	thumb_func_start sub_080596FC
sub_080596FC: @ 0x080596FC
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _08059734 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08059738 @ =0x08BA1FAC
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	adds r0, r5, #0
	bl sub_080547A8
	ldr r3, _0805973C @ =0x08BA14DC
	ldr r0, [r4, #0x5c]
	str r3, [sp]
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_0805041C
	str r0, [r4, #0x60]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08059734: .4byte 0x0201774C
_08059738: .4byte 0x08BA1FAC
_0805973C: .4byte 0x08BA14DC

	thumb_func_start sub_08059740
sub_08059740: @ 0x08059740
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _08059780 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08059784 @ =0x08BA1FF4
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	adds r0, r5, #0
	bl sub_080547A8
	ldr r3, _08059788 @ =0x08BA14DC
	ldr r0, [r4, #0x5c]
	str r3, [sp]
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_0805041C
	str r0, [r4, #0x60]
	ldrh r1, [r0, #4]
	subs r1, #4
	strh r1, [r0, #4]
	adds r0, r4, #0
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08059780: .4byte 0x0201774C
_08059784: .4byte 0x08BA1FF4
_08059788: .4byte 0x08BA14DC

	thumb_func_start sub_0805978C
sub_0805978C: @ 0x0805978C
	push {lr}
	ldr r2, _080597A0 @ =0x0201774C
	ldr r1, [r2]
	subs r1, #1
	str r1, [r2]
	ldr r0, [r0, #0x60]
	bl sub_08006650
	pop {r0}
	bx r0
	.align 2, 0
_080597A0: .4byte 0x0201774C

	thumb_func_start sub_080597A4
sub_080597A4: @ 0x080597A4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, _080597D4 @ =0x08BB94FC
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, _080597D8 @ =0x0822A25C
	movs r1, #0x20
	bl sub_080505F0
	ldr r0, _080597DC @ =0x08229664
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_080505C8
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080597D4: .4byte 0x08BB94FC
_080597D8: .4byte 0x0822A25C
_080597DC: .4byte 0x08229664

	thumb_func_start sub_080597E0
sub_080597E0: @ 0x080597E0
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, _08059810 @ =0x08BB9680
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, _08059814 @ =0x0822A25C
	movs r1, #0x20
	bl sub_080505F0
	ldr r0, _08059818 @ =0x08229A64
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_080505C8
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08059810: .4byte 0x08BB9680
_08059814: .4byte 0x0822A25C
_08059818: .4byte 0x08229A64

	thumb_func_start sub_0805981C
sub_0805981C: @ 0x0805981C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, _0805984C @ =0x08BB9B34
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, _08059850 @ =0x0822A25C
	movs r1, #0x20
	bl sub_080505F0
	ldr r0, _08059854 @ =0x08229EA4
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_080505C8
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805984C: .4byte 0x08BB9B34
_08059850: .4byte 0x0822A25C
_08059854: .4byte 0x08229EA4

	thumb_func_start sub_08059858
sub_08059858: @ 0x08059858
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, _08059880 @ =0x08BB9A78
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	movs r0, #0x14
	strh r0, [r1, #0xa]
	bl sub_080065F8
	movs r0, #0x27
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08059880: .4byte 0x08BB9A78

	thumb_func_start sub_08059884
sub_08059884: @ 0x08059884
	adds r1, r0, #0
	ldr r2, [r1, #0x60]
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	movs r3, #0
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	bne _080598A2
	ldr r0, _080598A4 @ =0x08BB9AAC
	str r0, [r2, #0x24]
	str r0, [r2, #0x20]
	strh r3, [r2, #6]
	strh r3, [r1, #0x2c]
_080598A2:
	bx lr
	.align 2, 0
_080598A4: .4byte 0x08BB9AAC

	thumb_func_start sub_080598A8
sub_080598A8: @ 0x080598A8
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_0804FFF0
	bl sub_0804FB6C
	bl sub_08050008
	ldr r0, _080598E0 @ =0x08BA2024
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl sub_08054804
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_0805468C
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080598E0: .4byte 0x08BA2024

	thumb_func_start sub_080598E4
sub_080598E4: @ 0x080598E4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl sub_080547A8
	adds r6, r0, #0
	bl sub_08050778
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r1, #0
	mov r8, r1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805991A
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804E498
_0805991A:
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	adds r0, r5, #1
	cmp r1, r0
	bne _08059978
	ldr r3, _08059974 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	mov r2, r8
	strb r2, [r0]
	adds r0, #1
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r2, [r0]
	str r1, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0xa
	movs r3, #0
	bl sub_08055F08
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x23
	movs r2, #0x14
	movs r3, #0x10
	bl sub_08055F08
	adds r0, r6, #0
	bl sub_08059AB4
	movs r0, #0x92
	lsls r0, r0, #1
	b _080599C6
	.align 2, 0
_08059974: .4byte 0x03002870
_08059978:
	adds r0, r5, #0
	adds r0, #0xf
	cmp r1, r0
	bne _080599B0
	movs r0, #2
	str r0, [sp]
	adds r0, r6, #0
	movs r1, #0x2a
	movs r2, #0xf
	movs r3, #0
	bl sub_080558BC
	adds r1, r0, #0
	adds r0, r6, #0
	movs r2, #0x1e
	bl sub_08059DAC
	ldr r0, _080599AC @ =0x03002870
	movs r1, #0x20
	ldrsh r2, [r0, r1]
	adds r0, r6, #0
	movs r1, #0x2b
	movs r3, #0
	bl sub_08055CD0
	b _08059A1C
	.align 2, 0
_080599AC: .4byte 0x03002870
_080599B0:
	adds r0, r5, #0
	adds r0, #0x3c
	cmp r1, r0
	bne _080599DC
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r0, r6, #0
	bl sub_08059A28
	ldr r0, _080599D8 @ =0x00000125
_080599C6:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r6, r3]
	movs r3, #1
	bl sub_080681E4
	b _08059A1C
	.align 2, 0
_080599D8: .4byte 0x00000125
_080599DC:
	adds r0, r5, #0
	adds r0, #0x41
	cmp r1, r0
	bne _08059A04
	movs r0, #9
	ldrh r1, [r6, #0x10]
	orrs r0, r1
	strh r0, [r6, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r6, #0
	bl sub_080502EC
	ldrb r0, [r4]
	cmp r0, #0
	bne _08059A1C
	adds r0, r6, #0
	bl sub_08067D14
	b _08059A1C
_08059A04:
	adds r0, r5, #0
	adds r0, #0x6e
	cmp r1, r0
	beq _08059A1C
	adds r0, #0x14
	cmp r1, r0
	bne _08059A1C
	bl sub_0804FFFC
	adds r0, r4, #0
	bl Proc_Break
_08059A1C:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08059A28
sub_08059A28: @ 0x08059A28
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _08059A88 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08059A8C @ =0x08BA203C
	movs r1, #3
	bl SpawnProc
	adds r6, r0, #0
	str r4, [r6, #0x5c]
	adds r1, r6, #0
	adds r1, #0x29
	movs r0, #0
	strb r5, [r1]
	strh r0, [r6, #0x2c]
	str r0, [r6, #0x44]
	ldr r0, _08059A90 @ =0x081E8502
	str r0, [r6, #0x48]
	ldr r0, _08059A94 @ =0x08BA2150
	str r0, [r6, #0x4c]
	str r0, [r6, #0x50]
	ldr r0, _08059A98 @ =0x08BA2084
	str r0, [r6, #0x54]
	ldr r0, _08059A9C @ =0x08232BB0
	movs r1, #0x20
	bl sub_08050634
	bl sub_08050040
	ldr r0, _08059AA0 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08059AAE
	ldr r0, [r6, #0x5c]
	bl sub_08054678
	cmp r0, #0
	bne _08059AA4
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b _08059AAE
	.align 2, 0
_08059A88: .4byte 0x0201774C
_08059A8C: .4byte 0x08BA203C
_08059A90: .4byte 0x081E8502
_08059A94: .4byte 0x08BA2150
_08059A98: .4byte 0x08BA2084
_08059A9C: .4byte 0x08232BB0
_08059AA0: .4byte 0x0203E02C
_08059AA4:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
_08059AAE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_08059AB4
sub_08059AB4: @ 0x08059AB4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _08059B24 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08059B28 @ =0x08BA206C
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _08059B2C @ =0x081E85CE
	str r0, [r5, #0x48]
	ldr r0, _08059B30 @ =0x08BA2150
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _08059B34 @ =0x08BA2084
	str r0, [r5, #0x54]
	ldr r0, _08059B38 @ =0x08232BB0
	movs r1, #0x20
	bl sub_08050634
	bl sub_08050040
	ldr r2, _08059B3C @ =0x03002870
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	ldr r0, _08059B40 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08059B4E
	ldr r0, [r5, #0x5c]
	bl sub_08054678
	cmp r0, #0
	bne _08059B44
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b _08059B4E
	.align 2, 0
_08059B24: .4byte 0x0201774C
_08059B28: .4byte 0x08BA206C
_08059B2C: .4byte 0x081E85CE
_08059B30: .4byte 0x08BA2150
_08059B34: .4byte 0x08BA2084
_08059B38: .4byte 0x08232BB0
_08059B3C: .4byte 0x03002870
_08059B40: .4byte 0x0203E02C
_08059B44:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
_08059B4E:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08059B54
sub_08059B54: @ 0x08059B54
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl sub_080506E4
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _08059B90
	ldr r5, [r7, #0x4c]
	ldr r6, [r7, #0x50]
	ldr r0, [r7, #0x54]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_0805060C
	ldr r0, [r7, #0x5c]
	adds r5, r4, r5
	ldr r1, [r5]
	adds r4, r4, r6
	ldr r2, [r4]
	bl sub_080504DC
	b _08059BD2
_08059B90:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne _08059BD2
	bl sub_08050018
	adds r0, r7, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne _08059BC4
	ldr r1, _08059BC0 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl sub_08050118
	bl sub_0804FBC4
	adds r0, r7, #0
	bl Proc_End
	b _08059BD2
	.align 2, 0
_08059BC0: .4byte 0x0201774C
_08059BC4:
	movs r0, #0
	strh r0, [r7, #0x2c]
	movs r0, #1
	strh r0, [r7, #0x2e]
	adds r0, r7, #0
	bl Proc_Break
_08059BD2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08059BD8
sub_08059BD8: @ 0x08059BD8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _08059BFC @ =0x02017750
	ldr r0, [r5]
	cmp r0, #2
	bne _08059C04
	ldr r1, _08059C00 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl sub_08050118
	bl sub_0804FBC4
	adds r0, r4, #0
	bl Proc_End
	b _08059C5E
	.align 2, 0
_08059BFC: .4byte 0x02017750
_08059C00: .4byte 0x0201774C
_08059C04:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r3, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x2e
	ldrsh r2, [r4, r1]
	ldrh r1, [r4, #0x2e]
	cmp r0, r2
	ble _08059C1C
	strh r1, [r4, #0x2c]
_08059C1C:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, r2
	bne _08059C5E
	ldr r0, [r5]
	cmp r0, #1
	bne _08059C5E
	strh r3, [r4, #0x2c]
	strh r3, [r4, #0x2e]
	str r3, [r4, #0x44]
	ldr r0, _08059C64 @ =0x081E8570
	str r0, [r4, #0x48]
	ldr r0, _08059C68 @ =0x08BA2150
	str r0, [r4, #0x4c]
	str r0, [r4, #0x50]
	ldr r0, _08059C6C @ =0x08BA2084
	str r0, [r4, #0x54]
	ldr r0, _08059C70 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08059C58
	bl sub_08050778
	strh r0, [r4, #0x2e]
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804E498
_08059C58:
	adds r0, r4, #0
	bl Proc_Break
_08059C5E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08059C64: .4byte 0x081E8570
_08059C68: .4byte 0x08BA2150
_08059C6C: .4byte 0x08BA2084
_08059C70: .4byte 0x0203E02C

	thumb_func_start sub_08059C74
sub_08059C74: @ 0x08059C74
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl sub_080547A8
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _08059CDA
	ldr r0, _08059CB0 @ =0x0203E02C
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0
	beq _08059CBE
	ldr r0, [r4, #0x5c]
	bl sub_08054678
	cmp r0, #0
	bne _08059CB4
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
	b _08059CBE
	.align 2, 0
_08059CB0: .4byte 0x0203E02C
_08059CB4:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
_08059CBE:
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x93
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl sub_080681E4
	adds r0, r4, #0
	bl Proc_Break
_08059CDA:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08059CE0
sub_08059CE0: @ 0x08059CE0
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl sub_080506E4
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _08059D1C
	ldr r5, [r7, #0x4c]
	ldr r6, [r7, #0x50]
	ldr r0, [r7, #0x54]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_0805060C
	ldr r0, [r7, #0x5c]
	adds r5, r4, r5
	ldr r1, [r5]
	adds r4, r4, r6
	ldr r2, [r4]
	bl sub_080504DC
	b _08059D3E
_08059D1C:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne _08059D3E
	bl sub_08050018
	ldr r1, _08059D44 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl sub_08050118
	bl sub_0804FBC4
	adds r0, r7, #0
	bl Proc_Break
_08059D3E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08059D44: .4byte 0x0201774C

	thumb_func_start sub_08059D48
sub_08059D48: @ 0x08059D48
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl sub_080506E4
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _08059D84
	ldr r5, [r7, #0x4c]
	ldr r6, [r7, #0x50]
	ldr r0, [r7, #0x54]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_0805060C
	ldr r0, [r7, #0x5c]
	adds r5, r4, r5
	ldr r1, [r5]
	adds r4, r4, r6
	ldr r2, [r4]
	bl sub_080504DC
	b _08059DA2
_08059D84:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne _08059DA2
	bl sub_08050018
	ldr r1, _08059DA8 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl sub_08050118
	adds r0, r7, #0
	bl Proc_Break
_08059DA2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08059DA8: .4byte 0x0201774C

	thumb_func_start sub_08059DAC
sub_08059DAC: @ 0x08059DAC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	ldr r1, _08059DD4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08059DD8 @ =0x08BA221C
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	str r6, [r0, #0x64]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08059DD4: .4byte 0x0201774C
_08059DD8: .4byte 0x08BA221C

	thumb_func_start sub_08059DDC
sub_08059DDC: @ 0x08059DDC
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, [r5, #0x64]
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #0x80
	bl sub_08012FE8
	str r0, [r4, #0x4c]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r5, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _08059E18
	ldr r1, _08059E20 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
_08059E18:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08059E20: .4byte 0x0201774C

	thumb_func_start sub_08059E24
sub_08059E24: @ 0x08059E24
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_0804FFF0
	bl sub_0804FB6C
	bl sub_08050008
	ldr r0, _08059E5C @ =0x08BA2234
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl sub_08054804
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_0805468C
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08059E5C: .4byte 0x08BA2234

	thumb_func_start sub_08059E60
sub_08059E60: @ 0x08059E60
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl sub_080547A8
	adds r5, r0, #0
	bl sub_08050778
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08059E8A
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804E498
_08059E8A:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #1
	cmp r1, r0
	bne _08059EAE
	movs r0, #0x90
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl sub_080681E4
	adds r0, r5, #0
	bl sub_08059F18
	b _08059F10
_08059EAE:
	adds r0, r6, #0
	adds r0, #0x1a
	cmp r1, r0
	bne _08059EF4
	ldr r0, _08059EF0 @ =0x00000121
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl sub_080681E4
	ldr r0, [r4, #0x5c]
	movs r1, #4
	bl sub_0804EFDC
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl sub_08050140
	ldrb r0, [r4]
	cmp r0, #0
	bne _08059F10
	adds r0, r5, #0
	bl sub_08067D14
	b _08059F10
	.align 2, 0
_08059EF0: .4byte 0x00000121
_08059EF4:
	adds r0, r6, #0
	adds r0, #0x2f
	cmp r1, r0
	beq _08059F10
	adds r0, #1
	cmp r1, r0
	bne _08059F10
	bl sub_0804FFFC
	bl sub_0804FBC4
	adds r0, r4, #0
	bl Proc_Break
_08059F10:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08059F18
sub_08059F18: @ 0x08059F18
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _08059F6C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08059F70 @ =0x08BA224C
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _08059F74 @ =0x081E85D4
	str r0, [r5, #0x48]
	ldr r0, _08059F78 @ =0x08BA236C
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _08059F7C @ =0x08BA2264
	str r0, [r5, #0x54]
	ldr r0, _08059F80 @ =0x08BA22E8
	str r0, [r5, #0x58]
	bl sub_08050040
	ldr r0, _08059F84 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08059F92
	ldr r0, [r5, #0x5c]
	bl sub_08054678
	cmp r0, #0
	bne _08059F88
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b _08059F92
	.align 2, 0
_08059F6C: .4byte 0x0201774C
_08059F70: .4byte 0x08BA224C
_08059F74: .4byte 0x081E85D4
_08059F78: .4byte 0x08BA236C
_08059F7C: .4byte 0x08BA2264
_08059F80: .4byte 0x08BA22E8
_08059F84: .4byte 0x0203E02C
_08059F88:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
_08059F92:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08059F98
sub_08059F98: @ 0x08059F98
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl sub_080506E4
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	cmp r5, #0
	blt _0805A020
	ldr r6, [r7, #0x4c]
	ldr r0, [r7, #0x50]
	mov r8, r0
	ldr r0, [r7, #0x54]
	ldr r4, [r7, #0x58]
	lsls r5, r5, #2
	adds r0, r5, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_0805060C
	adds r4, r5, r4
	ldr r0, [r4]
	movs r1, #0x20
	bl sub_08050634
	ldr r0, [r7, #0x5c]
	adds r6, r5, r6
	ldr r1, [r6]
	add r5, r8
	ldr r2, [r5]
	bl sub_080504DC
	ldr r0, _0805A000 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805A03E
	ldr r0, [r7, #0x5c]
	bl sub_08054678
	adds r1, r0, #0
	cmp r1, #0
	bne _0805A008
	ldr r0, _0805A004 @ =0x02023460
	b _0805A00C
	.align 2, 0
_0805A000: .4byte 0x0203E02C
_0805A004: .4byte 0x02023460
_0805A008:
	ldr r0, _0805A01C @ =0x0202349A
	movs r1, #0
_0805A00C:
	str r1, [sp]
	movs r1, #3
	movs r2, #0x14
	movs r3, #0
	bl sub_080669B4
	b _0805A03E
	.align 2, 0
_0805A01C: .4byte 0x0202349A
_0805A020:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	bne _0805A03E
	bl sub_08050018
	ldr r1, _0805A04C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl sub_08050118
	adds r0, r7, #0
	bl Proc_End
_0805A03E:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805A04C: .4byte 0x0201774C

	thumb_func_start sub_0805A050
sub_0805A050: @ 0x0805A050
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl sub_0804FFF0
	bl sub_0804FB6C
	bl sub_08050008
	ldr r0, _0805A08C @ =0x08BA23F0
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r6, #0
	strh r6, [r4, #0x2c]
	adds r0, r5, #0
	bl sub_08054804
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_0805468C
	adds r4, #0x29
	strb r0, [r4]
	ldr r0, _0805A090 @ =0x02020038
	str r6, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805A08C: .4byte 0x08BA23F0
_0805A090: .4byte 0x02020038

	thumb_func_start sub_0805A094
sub_0805A094: @ 0x0805A094
	push {lr}
	adds r2, r0, #0
	adds r3, r1, #0
	ldr r0, _0805A0B0 @ =0x02020038
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0805A0B4
	adds r1, #0xff
	movs r0, #0xfe
	bl sub_080681E4
	b _0805A0BE
	.align 2, 0
_0805A0B0: .4byte 0x02020038
_0805A0B4:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xff
	bl sub_080681E4
_0805A0BE:
	ldr r1, _0805A0CC @ =0x02020038
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0805A0CC: .4byte 0x02020038

	thumb_func_start sub_0805A0D0
sub_0805A0D0: @ 0x0805A0D0
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r0, [r6, #0x5c]
	bl sub_080547A8
	adds r5, r0, #0
	bl sub_08050778
	adds r4, r0, #0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805A0FE
	ldr r0, [r6, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804E498
_0805A0FE:
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	adds r0, r4, #1
	cmp r1, r0
	bne _0805A120
	adds r0, r5, #0
	movs r1, #4
	bl sub_0804EFDC
	adds r0, r5, #0
	bl sub_0805A200
	adds r0, r5, #0
	bl sub_0805A2CC
	movs r0, #0x30
	b _0805A146
_0805A120:
	adds r0, r4, #0
	adds r0, #0x15
	cmp r1, r0
	bne _0805A134
	adds r0, r5, #0
	movs r1, #4
	bl sub_0804EFDC
	movs r0, #0xa0
	b _0805A146
_0805A134:
	adds r0, r4, #0
	adds r0, #0x29
	cmp r1, r0
	bne _0805A14E
	adds r0, r5, #0
	movs r1, #4
	bl sub_0804EFDC
	movs r0, #0x70
_0805A146:
	movs r1, #0
	bl sub_0805A094
	b _0805A1F8
_0805A14E:
	adds r0, r4, #0
	adds r0, #0x3d
	cmp r1, r0
	bne _0805A182
	adds r0, r5, #0
	movs r1, #4
	bl sub_0804EFDC
	movs r0, #0x10
	str r0, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #3
	movs r2, #0xa
	movs r3, #0
	bl sub_08055F08
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	adds r0, r1, #0
	movs r3, #1
	bl sub_080681E4
	b _0805A1F8
_0805A182:
	adds r0, r4, #0
	adds r0, #0x5e
	cmp r1, r0
	bne _0805A1C8
	adds r0, r5, #0
	movs r1, #4
	bl sub_0804EFDC
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, r6, #0
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl sub_08050140
	ldr r0, _0805A1C4 @ =0x00000101
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl sub_080681E4
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805A1F8
	adds r0, r5, #0
	bl sub_08067D14
	b _0805A1F8
	.align 2, 0
_0805A1C4: .4byte 0x00000101
_0805A1C8:
	adds r0, r4, #0
	adds r0, #0x69
	cmp r1, r0
	bne _0805A1E2
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x14
	movs r3, #8
	bl sub_08055F08
	b _0805A1F8
_0805A1E2:
	adds r0, r4, #0
	adds r0, #0x71
	cmp r1, r0
	bne _0805A1F8
	bl sub_0804FFFC
	bl sub_0804FBC4
	adds r0, r6, #0
	bl Proc_Break
_0805A1F8:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0805A200
sub_0805A200: @ 0x0805A200
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805A238 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805A23C @ =0x08BA2408
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0805A240 @ =0x081E865A
	str r1, [r0, #0x48]
	ldr r1, _0805A244 @ =0x08BA2690
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _0805A248 @ =0x08BA2420
	str r1, [r0, #0x54]
	ldr r1, _0805A24C @ =0x08BA2558
	str r1, [r0, #0x58]
	bl sub_08050040
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805A238: .4byte 0x0201774C
_0805A23C: .4byte 0x08BA2408
_0805A240: .4byte 0x081E865A
_0805A244: .4byte 0x08BA2690
_0805A248: .4byte 0x08BA2420
_0805A24C: .4byte 0x08BA2558

	thumb_func_start sub_0805A250
sub_0805A250: @ 0x0805A250
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl sub_080506E4
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	cmp r5, #0
	blt _0805A29E
	ldr r6, [r7, #0x4c]
	ldr r0, [r7, #0x50]
	mov r8, r0
	ldr r0, [r7, #0x54]
	ldr r4, [r7, #0x58]
	lsls r5, r5, #2
	adds r0, r5, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_0805060C
	adds r4, r5, r4
	ldr r0, [r4]
	movs r1, #0x20
	bl sub_08050634
	ldr r0, [r7, #0x5c]
	adds r6, r5, r6
	ldr r1, [r6]
	add r5, r8
	ldr r2, [r5]
	bl sub_080504DC
	b _0805A2BC
_0805A29E:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	bne _0805A2BC
	bl sub_08050018
	ldr r1, _0805A2C8 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl sub_08050118
	adds r0, r7, #0
	bl Proc_End
_0805A2BC:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805A2C8: .4byte 0x0201774C

	thumb_func_start sub_0805A2CC
sub_0805A2CC: @ 0x0805A2CC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805A2F8 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805A2FC @ =0x08BA27C8
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	movs r1, #7
	str r1, [r0, #0x44]
	strh r2, [r0, #0x2e]
	movs r1, #6
	str r1, [r0, #0x48]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805A2F8: .4byte 0x0201774C
_0805A2FC: .4byte 0x08BA27C8

	thumb_func_start sub_0805A300
sub_0805A300: @ 0x0805A300
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r5, #0x44]
	cmp r0, r1
	ble _0805A35C
	movs r0, #0
	strh r0, [r5, #0x2c]
	ldr r2, _0805A364 @ =0x08BA27E8
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	lsls r1, r0, #3
	adds r1, r1, r2
	ldr r4, [r1]
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r2, [r0]
	ldr r0, [r5, #0x60]
	adds r1, r4, #0
	bl sub_0805A36C
	adds r0, r4, #0
	movs r1, #1
	bl sub_0805A094
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r5, #0x48]
	cmp r0, r1
	ble _0805A35C
	ldr r1, _0805A368 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
_0805A35C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805A364: .4byte 0x08BA27E8
_0805A368: .4byte 0x0201774C

	thumb_func_start sub_0805A36C
sub_0805A36C: @ 0x0805A36C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	ldr r1, _0805A3C4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805A3C8 @ =0x08BA2820
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, _0805A3CC @ =0x08BBB964
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_0805041C
	str r0, [r4, #0x60]
	strh r6, [r0, #2]
	mov r1, r8
	strh r1, [r0, #4]
	ldr r0, _0805A3D0 @ =0x08269CD8
	movs r1, #0x20
	bl sub_080505F0
	ldr r0, _0805A3D4 @ =0x08269A14
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_080505C8
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805A3C4: .4byte 0x0201774C
_0805A3C8: .4byte 0x08BA2820
_0805A3CC: .4byte 0x08BBB964
_0805A3D0: .4byte 0x08269CD8
_0805A3D4: .4byte 0x08269A14

	thumb_func_start sub_0805A3D8
sub_0805A3D8: @ 0x0805A3D8
	push {lr}
	ldr r0, [r0, #0x60]
	bl sub_08006650
	ldr r1, _0805A3EC @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0805A3EC: .4byte 0x0201774C

	thumb_func_start sub_0805A3F0
sub_0805A3F0: @ 0x0805A3F0
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_0804FFF0
	bl sub_0804FB6C
	bl sub_08050008
	ldr r0, _0805A428 @ =0x08BA2840
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl sub_08054804
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_0805468C
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805A428: .4byte 0x08BA2840

	thumb_func_start sub_0805A42C
sub_0805A42C: @ 0x0805A42C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r6, r0, #0
	ldr r0, [r6, #0x5c]
	bl sub_080547A8
	adds r5, r0, #0
	bl sub_08050778
	mov r8, r0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805A45E
	ldr r0, [r6, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804E498
_0805A45E:
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	mov r0, r8
	adds r0, #1
	cmp r1, r0
	bne _0805A480
	adds r0, r5, #0
	movs r1, #0x82
	bl sub_0805AB44
	ldr r0, _0805A4A4 @ =0x000002CA
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl sub_080681E4
_0805A480:
	movs r2, #0x2c
	ldrsh r1, [r6, r2]
	mov r0, r8
	adds r0, #0x32
	movs r2, #0x29
	adds r2, r2, r6
	mov sb, r2
	cmp r1, r0
	bne _0805A4FE
	ldrb r0, [r2]
	cmp r0, #0
	bne _0805A4A8
	adds r0, r5, #0
	movs r1, #0xcd
	movs r2, #0xa
	bl sub_080561D0
	b _0805A4B2
	.align 2, 0
_0805A4A4: .4byte 0x000002CA
_0805A4A8:
	adds r0, r5, #0
	movs r1, #0x69
	movs r2, #0xa
	bl sub_080561D0
_0805A4B2:
	adds r0, r5, #0
	movs r1, #0x28
	bl sub_0805AA7C
	ldr r3, _0805A5DC @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r4, #0
	strb r4, [r0]
	adds r0, #1
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r4, [r0]
	str r1, [sp]
	str r4, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #8
	movs r3, #0
	bl sub_08055F08
	str r4, [sp]
	str r4, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x20
	movs r2, #8
	movs r3, #0x10
	bl sub_08055F08
_0805A4FE:
	movs r2, #0x2c
	ldrsh r1, [r6, r2]
	mov r0, r8
	adds r0, #0x64
	cmp r1, r0
	bne _0805A51A
	adds r0, r5, #0
	movs r1, #0x34
	bl sub_0805A62C
	adds r0, r5, #0
	movs r1, #0x34
	bl sub_0805A6F8
_0805A51A:
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	mov r0, r8
	adds r0, #0x78
	cmp r1, r0
	bne _0805A530
	adds r0, r5, #0
	movs r1, #0x23
	movs r2, #0x19
	bl sub_0805ADF0
_0805A530:
	mov r2, sb
	ldrb r7, [r2]
	cmp r7, #0
	bne _0805A5E4
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	mov r0, r8
	adds r0, #0x9b
	cmp r1, r0
	bne _0805A5C0
	movs r0, #9
	movs r4, #0
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	ldrb r1, [r2]
	adds r0, r5, #0
	bl sub_08050140
	adds r0, r5, #0
	bl sub_08067D14
	adds r0, r5, #0
	movs r1, #0x3c
	bl sub_0805A864
	ldr r3, _0805A5DC @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	strb r4, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r4, [r0]
	movs r0, #0xc
	str r0, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #5
	movs r3, #0
	bl sub_08055F08
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x3c
	movs r2, #0x1e
	movs r3, #0xc
	bl sub_08055F08
	adds r0, r5, #0
	bl sub_0805A78C
	ldr r0, _0805A5E0 @ =0x000002CB
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl sub_080681E4
_0805A5C0:
	movs r2, #0x2c
	ldrsh r1, [r6, r2]
	mov r0, r8
	adds r0, #0xff
	cmp r1, r0
	bne _0805A61C
	bl sub_0804FFFC
	bl sub_0804FBC4
	adds r0, r6, #0
	bl Proc_Break
	b _0805A61C
	.align 2, 0
_0805A5DC: .4byte 0x03002870
_0805A5E0: .4byte 0x000002CB
_0805A5E4:
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	mov r0, r8
	adds r0, #0x9b
	cmp r1, r0
	bne _0805A602
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	mov r2, sb
	ldrb r1, [r2]
	adds r0, r5, #0
	bl sub_08050140
_0805A602:
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	mov r0, r8
	adds r0, #0xa0
	cmp r1, r0
	bne _0805A61C
	bl sub_0804FFFC
	bl sub_0804FBC4
	adds r0, r6, #0
	bl Proc_Break
_0805A61C:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0805A62C
sub_0805A62C: @ 0x0805A62C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0805A66C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805A670 @ =0x08BA2858
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	strh r5, [r0, #0x30]
	str r1, [r0, #0x44]
	ldr r1, _0805A674 @ =0x081E87D0
	str r1, [r0, #0x48]
	ldr r1, _0805A678 @ =0x08BA2870
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, _0805A67C @ =0x0827C2E4
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_0805060C
	bl sub_08050040
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805A66C: .4byte 0x0201774C
_0805A670: .4byte 0x08BA2858
_0805A674: .4byte 0x081E87D0
_0805A678: .4byte 0x08BA2870
_0805A67C: .4byte 0x0827C2E4

	thumb_func_start sub_0805A680
sub_0805A680: @ 0x0805A680
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_080506E4
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _0805A6BE
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl sub_080504DC
	ldr r0, _0805A6EC @ =0x0202349C
	ldr r1, _0805A6F0 @ =0x0000011F
	str r1, [sp]
	movs r1, #2
	movs r2, #0x14
	movs r3, #1
	bl sub_080669B4
_0805A6BE:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0805A6E4
	bl sub_08050018
	ldr r1, _0805A6F4 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl sub_08050118
	adds r0, r4, #0
	bl Proc_Break
_0805A6E4:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805A6EC: .4byte 0x0202349C
_0805A6F0: .4byte 0x0000011F
_0805A6F4: .4byte 0x0201774C

	thumb_func_start sub_0805A6F8
sub_0805A6F8: @ 0x0805A6F8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0805A730 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805A734 @ =0x08BA28A0
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	strh r5, [r0, #0x30]
	str r1, [r0, #0x44]
	ldr r1, _0805A738 @ =0x081E8802
	str r1, [r0, #0x48]
	ldr r1, _0805A73C @ =0x0827DC34
	str r1, [r0, #0x4c]
	adds r0, r1, #0
	movs r1, #0x20
	bl sub_08050634
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805A730: .4byte 0x0201774C
_0805A734: .4byte 0x08BA28A0
_0805A738: .4byte 0x081E8802
_0805A73C: .4byte 0x0827DC34

	thumb_func_start sub_0805A740
sub_0805A740: @ 0x0805A740
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_080506E4
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _0805A764
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl sub_08050634
_0805A764:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne _0805A782
	ldr r1, _0805A788 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0805A782:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805A788: .4byte 0x0201774C

	thumb_func_start sub_0805A78C
sub_0805A78C: @ 0x0805A78C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805A7C8 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805A7CC @ =0x08BA28C0
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0805A7D0 @ =0x081E8814
	str r1, [r0, #0x48]
	ldr r1, _0805A7D4 @ =0x08BA28D8
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _0805A7D8 @ =0x08BA28EC
	str r1, [r0, #0x54]
	ldr r0, _0805A7DC @ =0x082871D8
	movs r1, #0x20
	bl sub_08050634
	bl sub_08050040
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805A7C8: .4byte 0x0201774C
_0805A7CC: .4byte 0x08BA28C0
_0805A7D0: .4byte 0x081E8814
_0805A7D4: .4byte 0x08BA28D8
_0805A7D8: .4byte 0x08BA28EC
_0805A7DC: .4byte 0x082871D8

	thumb_func_start sub_0805A7E0
sub_0805A7E0: @ 0x0805A7E0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl sub_080506E4
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _0805A838
	ldr r5, [r7, #0x4c]
	ldr r6, [r7, #0x50]
	ldr r0, [r7, #0x54]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_0805060C
	ldr r0, [r7, #0x5c]
	adds r5, r4, r5
	ldr r1, [r5]
	adds r4, r4, r6
	ldr r2, [r4]
	bl sub_080504DC
	ldr r0, _0805A830 @ =0x0202349C
	ldr r1, _0805A834 @ =0x0000011F
	str r1, [sp]
	movs r1, #2
	movs r2, #0x14
	movs r3, #1
	bl sub_080669B4
	b _0805A856
	.align 2, 0
_0805A830: .4byte 0x0202349C
_0805A834: .4byte 0x0000011F
_0805A838:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne _0805A856
	bl sub_08050018
	ldr r1, _0805A860 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl sub_08050118
	adds r0, r7, #0
	bl Proc_Break
_0805A856:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805A860: .4byte 0x0201774C

	thumb_func_start sub_0805A864
sub_0805A864: @ 0x0805A864
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0805A8A4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805A8A8 @ =0x08BA2900
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	strh r2, [r0, #0x2e]
	strh r5, [r0, #0x30]
	movs r1, #2
	str r1, [r0, #0x44]
	str r2, [r0, #0x48]
	ldr r0, _0805A8AC @ =0x0828E1DC
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_080505C8
	ldr r0, _0805A8B0 @ =0x0828EA64
	movs r1, #0x20
	bl sub_080505F0
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805A8A4: .4byte 0x0201774C
_0805A8A8: .4byte 0x08BA2900
_0805A8AC: .4byte 0x0828E1DC
_0805A8B0: .4byte 0x0828EA64

	thumb_func_start sub_0805A8B4
sub_0805A8B4: @ 0x0805A8B4
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne _0805A8DC
	ldr r1, _0805A8D8 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
	b _0805A920
	.align 2, 0
_0805A8D8: .4byte 0x0201774C
_0805A8DC:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r4, #0x44]
	cmp r0, r1
	bne _0805A920
	movs r0, #0
	strh r0, [r4, #0x2e]
	movs r0, #2
	str r0, [r4, #0x44]
	bl sub_08004CC4
	cmp r0, #4
	ble _0805A90A
	ldr r0, [r4, #0x5c]
	ldr r2, [r4, #0x48]
	adds r1, r2, #0
	adds r2, #1
	str r2, [r4, #0x48]
	bl sub_0805A928
_0805A90A:
	bl sub_08004CC4
	cmp r0, #4
	ble _0805A920
	ldr r0, [r4, #0x5c]
	ldr r2, [r4, #0x48]
	adds r1, r2, #0
	adds r2, #1
	str r2, [r4, #0x48]
	bl sub_0805A928
_0805A920:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0805A928
sub_0805A928: @ 0x0805A928
	push {r4, r5, r6, r7, lr}
	sub sp, #0x90
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r1, _0805A994 @ =0x081E88CA
	mov r0, sp
	movs r2, #0x10
	bl memcpy
	add r4, sp, #0x10
	ldr r1, _0805A998 @ =0x081E88DA
	adds r0, r4, #0
	movs r2, #0x80
	bl memcpy
	ldr r1, _0805A99C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805A9A0 @ =0x08BA2918
	movs r1, #3
	bl SpawnProc
	adds r7, r0, #0
	str r5, [r7, #0x5c]
	movs r5, #0
	strh r5, [r7, #0x2c]
	movs r0, #7
	ands r0, r6
	lsls r0, r0, #1
	add r0, sp
	ldrh r0, [r0]
	strh r0, [r7, #0x2e]
	movs r0, #0xe0
	bl sub_080672E8
	adds r0, #8
	strh r0, [r7, #0x32]
	strh r5, [r7, #0x3a]
	movs r1, #0
	movs r0, #0x3f
	ands r0, r6
	lsls r0, r0, #1
	adds r4, r4, r0
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r0, #5
	bhi _0805A9F4
	lsls r0, r0, #2
	ldr r1, _0805A9A4 @ =_0805A9A8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805A994: .4byte 0x081E88CA
_0805A998: .4byte 0x081E88DA
_0805A99C: .4byte 0x0201774C
_0805A9A0: .4byte 0x08BA2918
_0805A9A4: .4byte _0805A9A8
_0805A9A8: @ jump table
	.4byte _0805A9C0 @ case 0
	.4byte _0805A9C8 @ case 1
	.4byte _0805A9D0 @ case 2
	.4byte _0805A9D8 @ case 3
	.4byte _0805A9E0 @ case 4
	.4byte _0805A9E8 @ case 5
_0805A9C0:
	ldr r0, _0805A9C4 @ =0x08BD2478
	b _0805A9EA
	.align 2, 0
_0805A9C4: .4byte 0x08BD2478
_0805A9C8:
	ldr r0, _0805A9CC @ =0x08BD2470
	b _0805A9EA
	.align 2, 0
_0805A9CC: .4byte 0x08BD2470
_0805A9D0:
	ldr r0, _0805A9D4 @ =0x08BD2468
	b _0805A9EA
	.align 2, 0
_0805A9D4: .4byte 0x08BD2468
_0805A9D8:
	ldr r0, _0805A9DC @ =0x08BD2460
	b _0805A9EA
	.align 2, 0
_0805A9DC: .4byte 0x08BD2460
_0805A9E0:
	ldr r0, _0805A9E4 @ =0x08BD2480
	b _0805A9EA
	.align 2, 0
_0805A9E4: .4byte 0x08BD2480
_0805A9E8:
	ldr r0, _0805AA08 @ =0x08BD2458
_0805A9EA:
	movs r1, #0x78
	bl sub_08006594
	adds r1, r0, #0
	str r1, [r7, #0x60]
_0805A9F4:
	cmp r1, #0
	bne _0805AA10
	ldr r1, _0805AA0C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r7, #0
	bl Proc_End
	b _0805AA1E
	.align 2, 0
_0805AA08: .4byte 0x08BD2458
_0805AA0C: .4byte 0x0201774C
_0805AA10:
	movs r0, #0x91
	lsls r0, r0, #6
	strh r0, [r1, #8]
	ldrh r0, [r7, #0x32]
	strh r0, [r1, #2]
	ldrh r0, [r7, #0x3a]
	strh r0, [r1, #4]
_0805AA1E:
	add sp, #0x90
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0805AA28
sub_0805AA28: @ 0x0805AA28
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, [r4, #0x60]
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r1, r0
	ble _0805AA58
	ldr r1, _0805AA54 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl sub_08006650
	adds r0, r4, #0
	bl Proc_Break
	b _0805AA74
	.align 2, 0
_0805AA54: .4byte 0x0201774C
_0805AA58:
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #1
	movs r1, #0x78
	movs r2, #8
	bl sub_08012FE8
	strh r0, [r5, #4]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
_0805AA74:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0805AA7C
sub_0805AA7C: @ 0x0805AA7C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0805AAC0 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805AAC4 @ =0x08BA2930
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	strh r5, [r0, #0x30]
	str r1, [r0, #0x44]
	ldr r1, _0805AAC8 @ =0x081E895A
	str r1, [r0, #0x48]
	ldr r1, _0805AACC @ =0x08BA2948
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _0805AAD0 @ =0x08BA2954
	str r1, [r0, #0x54]
	ldr r0, _0805AAD4 @ =0x0828D4A8
	movs r1, #0x20
	bl sub_08050634
	bl sub_08050040
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805AAC0: .4byte 0x0201774C
_0805AAC4: .4byte 0x08BA2930
_0805AAC8: .4byte 0x081E895A
_0805AACC: .4byte 0x08BA2948
_0805AAD0: .4byte 0x08BA2954
_0805AAD4: .4byte 0x0828D4A8

	thumb_func_start sub_0805AAD8
sub_0805AAD8: @ 0x0805AAD8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r0, #0x2c
	adds r1, r6, #0
	adds r1, #0x44
	ldr r2, [r6, #0x48]
	bl sub_080506E4
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _0805AB12
	ldr r1, [r6, #0x4c]
	ldr r2, [r6, #0x50]
	ldr r5, [r6, #0x54]
	ldr r0, [r6, #0x5c]
	lsls r4, r4, #2
	adds r1, r4, r1
	ldr r1, [r1]
	adds r2, r4, r2
	ldr r2, [r2]
	bl sub_080504DC
	adds r4, r4, r5
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_0805060C
_0805AB12:
	ldrh r0, [r6, #0x2e]
	adds r0, #1
	strh r0, [r6, #0x2e]
	lsls r0, r0, #0x10
	ldrh r2, [r6, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0805AB38
	bl sub_08050018
	ldr r1, _0805AB40 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl sub_08050118
	adds r0, r6, #0
	bl Proc_Break
_0805AB38:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805AB40: .4byte 0x0201774C

	thumb_func_start sub_0805AB44
sub_0805AB44: @ 0x0805AB44
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0805AB88 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805AB8C @ =0x08BA2960
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r4, #0
	strh r4, [r0, #0x2c]
	strh r4, [r0, #0x2e]
	strh r5, [r0, #0x30]
	movs r1, #2
	str r1, [r0, #0x44]
	str r4, [r0, #0x48]
	ldr r0, _0805AB90 @ =0x0828EA84
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_080505C8
	ldr r0, _0805AB94 @ =0x0828EAB8
	movs r1, #0x20
	bl sub_080505F0
	ldr r0, _0805AB98 @ =0x0202003C
	str r4, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805AB88: .4byte 0x0201774C
_0805AB8C: .4byte 0x08BA2960
_0805AB90: .4byte 0x0828EA84
_0805AB94: .4byte 0x0828EAB8
_0805AB98: .4byte 0x0202003C

	thumb_func_start sub_0805AB9C
sub_0805AB9C: @ 0x0805AB9C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne _0805ABD0
	ldr r1, _0805ABC8 @ =0x0202003C
	movs r0, #1
	str r0, [r1]
	ldr r1, _0805ABCC @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
	b _0805AC14
	.align 2, 0
_0805ABC8: .4byte 0x0202003C
_0805ABCC: .4byte 0x0201774C
_0805ABD0:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r4, #0x44]
	cmp r0, r1
	bne _0805AC14
	movs r0, #0
	strh r0, [r4, #0x2e]
	movs r0, #2
	str r0, [r4, #0x44]
	bl sub_08004CC4
	cmp r0, #4
	ble _0805ABFE
	ldr r0, [r4, #0x5c]
	ldr r2, [r4, #0x48]
	adds r1, r2, #0
	adds r2, #1
	str r2, [r4, #0x48]
	bl sub_0805AC1C
_0805ABFE:
	bl sub_08004CC4
	cmp r0, #4
	ble _0805AC14
	ldr r0, [r4, #0x5c]
	ldr r2, [r4, #0x48]
	adds r1, r2, #0
	adds r2, #1
	str r2, [r4, #0x48]
	bl sub_0805AC1C
_0805AC14:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0805AC1C
sub_0805AC1C: @ 0x0805AC1C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x40
	mov r8, r0
	mov sl, r1
	ldr r1, _0805ACB8 @ =0x081E8968
	mov r0, sp
	movs r2, #0x10
	bl memcpy
	add r5, sp, #0x10
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x10
	bl memset
	movs r6, #0
	movs r0, #1
	strh r0, [r5, #4]
	strh r0, [r5, #0xa]
	add r0, sp, #0x20
	mov sb, r0
	ldr r1, _0805ACBC @ =0x081E8978
	movs r2, #0x10
	bl memcpy
	add r4, sp, #0x30
	ldr r1, _0805ACC0 @ =0x081E8988
	adds r0, r4, #0
	movs r2, #0x10
	bl memcpy
	ldr r1, _0805ACC4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805ACC8 @ =0x08BA2978
	movs r1, #3
	bl SpawnProc
	adds r7, r0, #0
	mov r1, r8
	str r1, [r7, #0x5c]
	strh r6, [r7, #0x2c]
	movs r0, #7
	mov r2, sl
	ands r0, r2
	lsls r6, r0, #1
	mov r1, sp
	adds r0, r1, r6
	ldrh r0, [r0]
	strh r0, [r7, #0x2e]
	movs r0, #0xff
	bl sub_080672E8
	strh r0, [r7, #0x30]
	movs r0, #0x10
	bl sub_080672E8
	adds r4, r4, r6
	ldrh r4, [r4]
	adds r0, r4, r0
	strh r0, [r7, #0x32]
	movs r0, #0x70
	strh r0, [r7, #0x3a]
	ldr r0, [r7, #0x5c]
	bl sub_08054678
	cmp r0, #0
	bne _0805ACCC
	mov r2, sb
	adds r0, r2, r6
	movs r1, #0
	ldrsh r0, [r0, r1]
	b _0805ACD6
	.align 2, 0
_0805ACB8: .4byte 0x081E8968
_0805ACBC: .4byte 0x081E8978
_0805ACC0: .4byte 0x081E8988
_0805ACC4: .4byte 0x0201774C
_0805ACC8: .4byte 0x08BA2978
_0805ACCC:
	mov r2, sb
	adds r0, r2, r6
	movs r1, #0
	ldrsh r0, [r0, r1]
	rsbs r0, r0, #0
_0805ACD6:
	str r0, [r7, #0x44]
	movs r1, #0
	movs r0, #7
	mov r2, sl
	ands r0, r2
	lsls r0, r0, #1
	adds r0, r5, r0
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	beq _0805ACF2
	cmp r0, #1
	beq _0805ACFC
	b _0805AD08
_0805ACF2:
	ldr r0, _0805ACF8 @ =0x08BD24DC
	b _0805ACFE
	.align 2, 0
_0805ACF8: .4byte 0x08BD24DC
_0805ACFC:
	ldr r0, _0805AD1C @ =0x08BD24D0
_0805ACFE:
	movs r1, #0x78
	bl sub_08006594
	adds r1, r0, #0
	str r1, [r7, #0x60]
_0805AD08:
	cmp r1, #0
	bne _0805AD24
	ldr r1, _0805AD20 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r7, #0
	bl Proc_End
	b _0805AD32
	.align 2, 0
_0805AD1C: .4byte 0x08BD24D0
_0805AD20: .4byte 0x0201774C
_0805AD24:
	movs r0, #0x91
	lsls r0, r0, #6
	strh r0, [r1, #8]
	ldrh r0, [r7, #0x32]
	strh r0, [r1, #2]
	ldrh r0, [r7, #0x3a]
	strh r0, [r1, #4]
_0805AD32:
	add sp, #0x40
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0805AD44
sub_0805AD44: @ 0x0805AD44
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r6, [r5, #0x60]
	ldr r0, _0805AD78 @ =0x0202003C
	ldr r0, [r0]
	cmp r0, #1
	beq _0805AD60
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	cmp r1, r0
	ble _0805AD80
_0805AD60:
	ldr r1, _0805AD7C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r6, #0
	bl sub_08006650
	adds r0, r5, #0
	bl Proc_Break
	b _0805ADE4
	.align 2, 0
_0805AD78: .4byte 0x0202003C
_0805AD7C: .4byte 0x0201774C
_0805AD80:
	movs r4, #0x2c
	ldrsh r3, [r5, r4]
	movs r7, #0x2e
	ldrsh r0, [r5, r7]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x70
	bl sub_08012FE8
	ldrh r1, [r5, #0x2c]
	adds r1, #1
	strh r1, [r5, #0x2c]
	ldr r4, _0805ADEC @ =0x080C5A48
	movs r2, #0x30
	ldrsh r1, [r5, r2]
	adds r1, #0x40
	lsls r1, r1, #1
	adds r1, r1, r4
	ldrh r1, [r1]
	lsls r3, r1, #0x10
	asrs r3, r3, #0x1a
	ldrh r1, [r5, #0x30]
	adds r1, #6
	movs r2, #0xff
	ands r1, r2
	strh r1, [r5, #0x30]
	ldr r2, [r5, #0x44]
	movs r1, #0xff
	ands r2, r1
	lsls r1, r2, #1
	adds r1, r1, r4
	movs r7, #0
	ldrsh r1, [r1, r7]
	adds r2, #0x40
	lsls r2, r2, #1
	adds r2, r2, r4
	movs r4, #0
	ldrsh r2, [r2, r4]
	muls r1, r0, r1
	muls r0, r2, r0
	asrs r1, r1, #0xc
	asrs r0, r0, #0xc
	ldrh r7, [r5, #0x32]
	adds r3, r7, r3
	subs r3, r3, r1
	strh r3, [r6, #2]
	ldrh r5, [r5, #0x3a]
	subs r0, r5, r0
	strh r0, [r6, #4]
_0805ADE4:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805ADEC: .4byte 0x080C5A48

	thumb_func_start sub_0805ADF0
sub_0805ADF0: @ 0x0805ADF0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	ldr r1, _0805AE20 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805AE24 @ =0x08BA2990
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_0804EFDC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805AE20: .4byte 0x0201774C
_0805AE24: .4byte 0x08BA2990

	thumb_func_start sub_0805AE28
sub_0805AE28: @ 0x0805AE28
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r1, #0x2e
	ldrsh r0, [r6, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl sub_08012FE8
	adds r5, r0, #0
	ldr r0, _0805AE84 @ =0x02022860
	ldr r4, _0805AE88 @ =0x020165C8
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r4, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r5, #0
	bl sub_08066F64
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r6, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0805AE7C
	ldr r1, _0805AE8C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
_0805AE7C:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805AE84: .4byte 0x02022860
_0805AE88: .4byte 0x020165C8
_0805AE8C: .4byte 0x0201774C

	thumb_func_start sub_0805AE90
sub_0805AE90: @ 0x0805AE90
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_0804FFF0
	bl sub_0804FB6C
	bl sub_08050008
	ldr r0, _0805AEC8 @ =0x08BA29A8
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl sub_08054804
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_0805468C
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805AEC8: .4byte 0x08BA29A8

	thumb_func_start sub_0805AECC
sub_0805AECC: @ 0x0805AECC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl sub_080547A8
	adds r5, r0, #0
	bl sub_08050778
	adds r3, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #1
	bne _0805AF10
	ldr r0, _0805AF0C @ =0x00000127
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl sub_080681E4
	adds r0, r5, #0
	bl sub_0805AFBC
	ldr r0, [r4, #0x5c]
	bl sub_0805B1EC
	b _0805AFB6
	.align 2, 0
_0805AF0C: .4byte 0x00000127
_0805AF10:
	cmp r2, #0x14
	bne _0805AF24
	movs r0, #0x94
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b _0805AF50
_0805AF24:
	cmp r2, #0x32
	bne _0805AF34
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804E498
	b _0805AFB6
_0805AF34:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r3, #0
	adds r0, #0x46
	cmp r1, r0
	bne _0805AF5C
	adds r0, r5, #0
	bl sub_0805B040
	ldr r0, _0805AF58 @ =0x00000129
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
_0805AF50:
	movs r3, #1
	bl sub_080681E4
	b _0805AFB6
	.align 2, 0
_0805AF58: .4byte 0x00000129
_0805AF5C:
	adds r0, r3, #0
	adds r0, #0x49
	cmp r1, r0
	bne _0805AF6E
	ldr r0, [r4, #0x5c]
	movs r1, #0xa
	bl sub_0804EFDC
	b _0805AFB6
_0805AF6E:
	adds r0, r3, #0
	adds r0, #0x4b
	cmp r1, r0
	bne _0805AF9C
	adds r0, r5, #0
	bl sub_0805B0C4
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl sub_08050140
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805AFB6
	adds r0, r5, #0
	bl sub_08067D14
	b _0805AFB6
_0805AF9C:
	adds r0, r3, #0
	adds r0, #0x5a
	cmp r1, r0
	beq _0805AFB6
	cmp r2, #0x64
	bne _0805AFB6
	bl sub_0804FFFC
	bl sub_0804FBC4
	adds r0, r4, #0
	bl Proc_Break
_0805AFB6:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0805AFBC
sub_0805AFBC: @ 0x0805AFBC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _0805B010 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805B014 @ =0x08BA29C0
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _0805B018 @ =0x081E8998
	str r0, [r5, #0x48]
	ldr r0, _0805B01C @ =0x08BA2A28
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _0805B020 @ =0x08BA29D8
	str r0, [r5, #0x54]
	ldr r0, _0805B024 @ =0x0823E2F4
	movs r1, #0x20
	bl sub_08050634
	ldr r0, _0805B028 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805B036
	ldr r0, [r5, #0x5c]
	bl sub_08054678
	cmp r0, #0
	bne _0805B02C
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
	b _0805B036
	.align 2, 0
_0805B010: .4byte 0x0201774C
_0805B014: .4byte 0x08BA29C0
_0805B018: .4byte 0x081E8998
_0805B01C: .4byte 0x08BA2A28
_0805B020: .4byte 0x08BA29D8
_0805B024: .4byte 0x0823E2F4
_0805B028: .4byte 0x0203E02C
_0805B02C:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
_0805B036:
	bl sub_08050040
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0805B040
sub_0805B040: @ 0x0805B040
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _0805B094 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805B098 @ =0x08BA29C0
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _0805B09C @ =0x081E8A06
	str r0, [r5, #0x48]
	ldr r0, _0805B0A0 @ =0x08BA2A84
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _0805B0A4 @ =0x08BA2A78
	str r0, [r5, #0x54]
	ldr r0, _0805B0A8 @ =0x0823E2F4
	movs r1, #0x20
	bl sub_08050634
	ldr r0, _0805B0AC @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805B0BA
	ldr r0, [r5, #0x5c]
	bl sub_08054678
	cmp r0, #0
	bne _0805B0B0
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b _0805B0BA
	.align 2, 0
_0805B094: .4byte 0x0201774C
_0805B098: .4byte 0x08BA29C0
_0805B09C: .4byte 0x081E8A06
_0805B0A0: .4byte 0x08BA2A84
_0805B0A4: .4byte 0x08BA2A78
_0805B0A8: .4byte 0x0823E2F4
_0805B0AC: .4byte 0x0203E02C
_0805B0B0:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
_0805B0BA:
	bl sub_08050040
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0805B0C4
sub_0805B0C4: @ 0x0805B0C4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _0805B118 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805B11C @ =0x08BA29C0
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _0805B120 @ =0x081E8A14
	str r0, [r5, #0x48]
	ldr r0, _0805B124 @ =0x08BA2AE4
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _0805B128 @ =0x08BA2A90
	str r0, [r5, #0x54]
	ldr r0, _0805B12C @ =0x0823E2D4
	movs r1, #0x20
	bl sub_08050634
	ldr r0, _0805B130 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805B13E
	ldr r0, [r5, #0x5c]
	bl sub_08054678
	cmp r0, #0
	bne _0805B134
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b _0805B13E
	.align 2, 0
_0805B118: .4byte 0x0201774C
_0805B11C: .4byte 0x08BA29C0
_0805B120: .4byte 0x081E8A14
_0805B124: .4byte 0x08BA2AE4
_0805B128: .4byte 0x08BA2A90
_0805B12C: .4byte 0x0823E2D4
_0805B130: .4byte 0x0203E02C
_0805B134:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
_0805B13E:
	bl sub_08050040
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0805B148
sub_0805B148: @ 0x0805B148
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl sub_080506E4
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _0805B1C0
	ldr r5, [r7, #0x4c]
	ldr r6, [r7, #0x50]
	ldr r0, [r7, #0x54]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_0805060C
	ldr r0, [r7, #0x5c]
	adds r5, r4, r5
	ldr r1, [r5]
	adds r4, r4, r6
	ldr r2, [r4]
	bl sub_080504DC
	ldr r0, _0805B1A0 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805B1DE
	ldr r0, [r7, #0x5c]
	bl sub_08054678
	adds r1, r0, #0
	cmp r1, #0
	bne _0805B1A8
	ldr r0, _0805B1A4 @ =0x02023460
	b _0805B1AC
	.align 2, 0
_0805B1A0: .4byte 0x0203E02C
_0805B1A4: .4byte 0x02023460
_0805B1A8:
	ldr r0, _0805B1BC @ =0x0202349A
	movs r1, #0
_0805B1AC:
	str r1, [sp]
	movs r1, #3
	movs r2, #0x14
	movs r3, #0
	bl sub_080669B4
	b _0805B1DE
	.align 2, 0
_0805B1BC: .4byte 0x0202349A
_0805B1C0:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne _0805B1DE
	bl sub_08050018
	ldr r1, _0805B1E8 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl sub_08050118
	adds r0, r7, #0
	bl Proc_Break
_0805B1DE:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805B1E8: .4byte 0x0201774C

	thumb_func_start sub_0805B1EC
sub_0805B1EC: @ 0x0805B1EC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _0805B22C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805B230 @ =0x08BA2B38
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r3, _0805B234 @ =0x08BBA10C
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_0805041C
	adds r6, r0, #0
	str r6, [r4, #0x60]
	adds r0, r5, #0
	bl sub_08054678
	cmp r0, #0
	bne _0805B238
	ldrh r0, [r6, #2]
	subs r0, #6
	b _0805B23C
	.align 2, 0
_0805B22C: .4byte 0x0201774C
_0805B230: .4byte 0x08BA2B38
_0805B234: .4byte 0x08BBA10C
_0805B238:
	ldrh r0, [r6, #2]
	adds r0, #6
_0805B23C:
	strh r0, [r6, #2]
	ldr r0, _0805B258 @ =0x082424B4
	movs r1, #0x20
	bl sub_080505F0
	ldr r0, _0805B25C @ =0x08242348
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_080505C8
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805B258: .4byte 0x082424B4
_0805B25C: .4byte 0x08242348

	thumb_func_start sub_0805B260
sub_0805B260: @ 0x0805B260
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x2c
	bne _0805B286
	ldr r0, [r4, #0x60]
	bl sub_08006650
	ldr r1, _0805B28C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0805B286:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805B28C: .4byte 0x0201774C

	thumb_func_start sub_0805B290
sub_0805B290: @ 0x0805B290
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_0804FFF0
	bl sub_0804FB6C
	bl sub_08050008
	ldr r0, _0805B2C8 @ =0x08BA2B50
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl sub_08054804
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_0805468C
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805B2C8: .4byte 0x08BA2B50

	thumb_func_start sub_0805B2CC
sub_0805B2CC: @ 0x0805B2CC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl sub_080547A8
	adds r5, r0, #0
	bl sub_08050778
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r7, #0
	movs r1, #0
	mov r8, r1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805B300
	ldr r0, [r4, #0x5c]
	subs r1, #1
	bl sub_0804E498
_0805B300:
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	adds r0, r6, #1
	cmp r1, r0
	bne _0805B358
	adds r0, r5, #0
	bl sub_0805B438
	ldr r3, _0805B354 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	strb r7, [r0]
	adds r0, #1
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r7, [r0]
	str r1, [sp]
	mov r2, r8
	str r2, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x20
	movs r3, #0
	bl sub_08055F08
	adds r0, r5, #0
	movs r1, #0xaa
	bl sub_0805B6F4
	movs r0, #0x95
	lsls r0, r0, #1
	b _0805B362
	.align 2, 0
_0805B354: .4byte 0x03002870
_0805B358:
	ldr r2, _0805B374 @ =0x0000011B
	adds r0, r6, r2
	cmp r1, r0
	bne _0805B37C
	ldr r0, _0805B378 @ =0x0000012B
_0805B362:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl sub_080681E4
	b _0805B42C
	.align 2, 0
_0805B374: .4byte 0x0000011B
_0805B378: .4byte 0x0000012B
_0805B37C:
	ldr r2, _0805B390 @ =0x0000013B
	adds r0, r6, r2
	cmp r1, r0
	bne _0805B394
	adds r0, r5, #0
	movs r1, #0x19
	bl sub_0805B8F4
	b _0805B42C
	.align 2, 0
_0805B390: .4byte 0x0000013B
_0805B394:
	movs r3, #0xaa
	lsls r3, r3, #1
	adds r0, r6, r3
	cmp r1, r0
	bne _0805B3C6
	adds r0, r5, #0
	movs r1, #0xc
	bl sub_0804EFDC
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl sub_08050150
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805B42C
	adds r0, r5, #0
	bl sub_08067D14
	b _0805B42C
_0805B3C6:
	movs r2, #0xad
	lsls r2, r2, #1
	adds r0, r6, r2
	cmp r1, r0
	bne _0805B414
	movs r0, #0x96
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl sub_080681E4
	adds r0, r5, #0
	movs r1, #0x64
	movs r2, #0xa
	bl sub_080561D0
	adds r0, r5, #0
	movs r1, #0x64
	bl sub_0805B534
	adds r0, r5, #0
	movs r1, #0x64
	bl sub_0805B660
	mov r3, r8
	str r3, [sp]
	str r3, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x46
	movs r2, #0x1e
	movs r3, #0x10
	bl sub_08055F08
	adds r0, r5, #0
	bl sub_0805BA48
	b _0805B42C
_0805B414:
	movs r2, #0xf5
	lsls r2, r2, #1
	adds r0, r6, r2
	cmp r1, r0
	bne _0805B42C
	bl sub_0804FFFC
	bl sub_0804FBC4
	adds r0, r4, #0
	bl Proc_Break
_0805B42C:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0805B438
sub_0805B438: @ 0x0805B438
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _0805B48C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805B490 @ =0x08BA2B68
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _0805B494 @ =0x081E8A6A
	str r0, [r5, #0x48]
	ldr r0, _0805B498 @ =0x08BA2B94
	str r0, [r5, #0x4c]
	ldr r0, _0805B49C @ =0x08BA2B80
	str r0, [r5, #0x54]
	ldr r0, _0805B4A0 @ =0x08279EA4
	movs r1, #0x20
	bl sub_08050634
	bl sub_08050008
	bl sub_08050040
	ldr r0, _0805B4A4 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0805B4B4
	ldr r0, [r5, #0x5c]
	bl sub_08054678
	cmp r0, #0
	bne _0805B4A8
	movs r0, #1
	movs r1, #0xf8
	b _0805B4AC
	.align 2, 0
_0805B48C: .4byte 0x0201774C
_0805B490: .4byte 0x08BA2B68
_0805B494: .4byte 0x081E8A6A
_0805B498: .4byte 0x08BA2B94
_0805B49C: .4byte 0x08BA2B80
_0805B4A0: .4byte 0x08279EA4
_0805B4A4: .4byte 0x0203E02C
_0805B4A8:
	movs r0, #1
	movs r1, #0x18
_0805B4AC:
	movs r2, #0
	bl SetBgOffset
	b _0805B4C8
_0805B4B4:
	ldr r0, [r5, #0x5c]
	bl sub_08054678
	cmp r0, #0
	bne _0805B4C8
	movs r0, #1
	movs r1, #0x10
	movs r2, #0
	bl SetBgOffset
_0805B4C8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0805B4D0
sub_0805B4D0: @ 0x0805B4D0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r0, #0x2c
	adds r1, r6, #0
	adds r1, #0x44
	ldr r2, [r6, #0x48]
	bl sub_080506E4
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _0805B50A
	ldr r5, [r6, #0x4c]
	ldr r0, [r6, #0x54]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_0805060C
	ldr r0, [r6, #0x5c]
	adds r4, r4, r5
	ldr r1, [r4]
	movs r2, #0x20
	movs r3, #0x14
	bl sub_0805055C
	b _0805B528
_0805B50A:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne _0805B528
	bl sub_08050018
	ldr r1, _0805B530 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl sub_08050118
	adds r0, r6, #0
	bl Proc_Break
_0805B528:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805B530: .4byte 0x0201774C

	thumb_func_start sub_0805B534
sub_0805B534: @ 0x0805B534
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0805B57C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805B580 @ =0x08BA2BA8
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	strh r1, [r0, #0x32]
	strh r1, [r0, #0x3a]
	strh r1, [r0, #0x34]
	strh r1, [r0, #0x3c]
	ldr r0, _0805B584 @ =0x082779AC
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_0805060C
	ldr r0, _0805B588 @ =0x08279EC4
	movs r1, #0x20
	bl sub_08050634
	bl sub_08050008
	bl sub_08050040
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805B57C: .4byte 0x0201774C
_0805B580: .4byte 0x08BA2BA8
_0805B584: .4byte 0x082779AC
_0805B588: .4byte 0x08279EC4

	thumb_func_start sub_0805B58C
sub_0805B58C: @ 0x0805B58C
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r6, #1
	adds r0, r6, #0
	ldrh r1, [r5, #0x2c]
	ands r0, r1
	cmp r0, #0
	beq _0805B5E8
	ldrh r2, [r5, #0x32]
	subs r2, #0xc
	strh r2, [r5, #0x32]
	ldrh r1, [r5, #0x3a]
	adds r1, #0xc
	strh r1, [r5, #0x3a]
	ldr r0, _0805B5D8 @ =0x03002870
	strh r2, [r0, #0x20]
	strh r1, [r0, #0x22]
	ldr r0, _0805B5DC @ =0x0827A12C
	ldr r4, _0805B5E0 @ =0x02019784
	adds r1, r4, #0
	bl sub_080BFA28
	ldr r1, _0805B5E4 @ =0x02023460
	str r6, [sp]
	movs r0, #0x80
	lsls r0, r0, #1
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x20
	movs r3, #0x20
	bl sub_08066ACC
	movs r0, #2
	bl EnableBgSync
	b _0805B61E
	.align 2, 0
_0805B5D8: .4byte 0x03002870
_0805B5DC: .4byte 0x0827A12C
_0805B5E0: .4byte 0x02019784
_0805B5E4: .4byte 0x02023460
_0805B5E8:
	ldrh r2, [r5, #0x34]
	adds r2, #8
	strh r2, [r5, #0x34]
	ldrh r1, [r5, #0x3c]
	adds r1, #8
	strh r1, [r5, #0x3c]
	ldr r0, _0805B64C @ =0x03002870
	strh r2, [r0, #0x20]
	strh r1, [r0, #0x22]
	ldr r0, _0805B650 @ =0x0827A12C
	ldr r4, _0805B654 @ =0x02019784
	adds r1, r4, #0
	bl sub_080BFA28
	ldr r1, _0805B658 @ =0x02023460
	str r6, [sp]
	movs r0, #0x80
	lsls r0, r0, #1
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x20
	movs r3, #0x20
	bl sub_08066AFC
	movs r0, #2
	bl EnableBgSync
_0805B61E:
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r5, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne _0805B644
	bl sub_08050018
	bl sub_08050118
	ldr r1, _0805B65C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
_0805B644:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805B64C: .4byte 0x03002870
_0805B650: .4byte 0x0827A12C
_0805B654: .4byte 0x02019784
_0805B658: .4byte 0x02023460
_0805B65C: .4byte 0x0201774C

	thumb_func_start sub_0805B660
sub_0805B660: @ 0x0805B660
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0805B698 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805B69C @ =0x08BA2BC0
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	strh r5, [r0, #0x30]
	str r1, [r0, #0x44]
	ldr r1, _0805B6A0 @ =0x081E8A80
	str r1, [r0, #0x48]
	ldr r1, _0805B6A4 @ =0x08279EC4
	str r1, [r0, #0x4c]
	adds r0, r1, #0
	movs r1, #0x20
	bl sub_08050634
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805B698: .4byte 0x0201774C
_0805B69C: .4byte 0x08BA2BC0
_0805B6A0: .4byte 0x081E8A80
_0805B6A4: .4byte 0x08279EC4

	thumb_func_start sub_0805B6A8
sub_0805B6A8: @ 0x0805B6A8
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_080506E4
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _0805B6CC
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl sub_08050634
_0805B6CC:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne _0805B6EA
	ldr r1, _0805B6F0 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0805B6EA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805B6F0: .4byte 0x0201774C

	thumb_func_start sub_0805B6F4
sub_0805B6F4: @ 0x0805B6F4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0805B734 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805B738 @ =0x08BA2BE0
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	strh r2, [r0, #0x30]
	movs r1, #0xa
	str r1, [r0, #0x44]
	str r2, [r0, #0x48]
	ldr r0, _0805B73C @ =0x0827ABF0
	movs r1, #0x20
	bl sub_080505F0
	ldr r0, _0805B740 @ =0x0827A6FC
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_080505C8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805B734: .4byte 0x0201774C
_0805B738: .4byte 0x08BA2BE0
_0805B73C: .4byte 0x0827ABF0
_0805B740: .4byte 0x0827A6FC

	thumb_func_start sub_0805B744
sub_0805B744: @ 0x0805B744
	push {lr}
	adds r3, r0, #0
	ldrh r0, [r3, #0x2c]
	adds r0, #1
	strh r0, [r3, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r3, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne _0805B76C
	ldr r1, _0805B768 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r3, #0
	bl Proc_Break
	b _0805B792
	.align 2, 0
_0805B768: .4byte 0x0201774C
_0805B76C:
	ldrh r0, [r3, #0x30]
	adds r0, #1
	strh r0, [r3, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r3, #0x44]
	cmp r0, r1
	bne _0805B792
	movs r0, #0
	strh r0, [r3, #0x30]
	movs r0, #0xa
	str r0, [r3, #0x44]
	ldr r0, [r3, #0x5c]
	ldr r2, [r3, #0x48]
	adds r1, r2, #0
	adds r2, #1
	str r2, [r3, #0x48]
	bl sub_0805B798
_0805B792:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0805B798
sub_0805B798: @ 0x0805B798
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, _0805B824 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805B828 @ =0x08BA2BF8
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r6, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x1e
	bl sub_080672E8
	adds r0, #0x8c
	strh r0, [r4, #0x2e]
	movs r0, #0x1e
	bl sub_080672E8
	adds r5, r0, #0
	movs r0, #0x1e
	bl sub_080672E8
	adds r1, r0, #0
	adds r0, r5, #0
	adds r0, #0x46
	strh r0, [r4, #0x32]
	adds r0, r1, #0
	adds r0, #0x28
	strh r0, [r4, #0x34]
	ldr r0, _0805B82C @ =0x0000FFEC
	strh r0, [r4, #0x3a]
	movs r0, #0xa0
	strh r0, [r4, #0x3c]
	ldr r0, _0805B830 @ =0x0203E02C
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _0805B7F8
	adds r0, r5, #0
	adds r0, #0x5e
	strh r0, [r4, #0x32]
	adds r0, r1, #0
	adds r0, #0x40
	strh r0, [r4, #0x34]
_0805B7F8:
	adds r0, r6, #0
	bl sub_08054678
	cmp r0, #1
	bne _0805B810
	movs r0, #0xf0
	ldrh r2, [r4, #0x32]
	subs r1, r0, r2
	strh r1, [r4, #0x32]
	ldrh r1, [r4, #0x34]
	subs r0, r0, r1
	strh r0, [r4, #0x34]
_0805B810:
	movs r0, #2
	bl sub_080672E8
	cmp r0, #0
	beq _0805B838
	cmp r0, #1
	beq _0805B840
	ldr r0, _0805B834 @ =0x08BD17C8
	b _0805B842
	.align 2, 0
_0805B824: .4byte 0x0201774C
_0805B828: .4byte 0x08BA2BF8
_0805B82C: .4byte 0x0000FFEC
_0805B830: .4byte 0x0203E02C
_0805B834: .4byte 0x08BD17C8
_0805B838:
	ldr r0, _0805B83C @ =0x08BD17B8
	b _0805B842
	.align 2, 0
_0805B83C: .4byte 0x08BD17B8
_0805B840:
	ldr r0, _0805B860 @ =0x08BD17C0
_0805B842:
	movs r1, #0x78
	bl sub_08006594
	adds r1, r0, #0
	str r1, [r4, #0x60]
	cmp r1, #0
	bne _0805B868
	ldr r1, _0805B864 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_End
	b _0805B876
	.align 2, 0
_0805B860: .4byte 0x08BD17C0
_0805B864: .4byte 0x0201774C
_0805B868:
	movs r0, #0x91
	lsls r0, r0, #6
	strh r0, [r1, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1, #2]
	strh r0, [r1, #4]
_0805B876:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_0805B87C
sub_0805B87C: @ 0x0805B87C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r6, [r5, #0x60]
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	cmp r1, r0
	ble _0805B8AC
	ldr r1, _0805B8A8 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r6, #0
	bl sub_08006650
	adds r0, r5, #0
	bl Proc_Break
	b _0805B8EC
	.align 2, 0
_0805B8A8: .4byte 0x0201774C
_0805B8AC:
	movs r4, #0x32
	ldrsh r1, [r5, r4]
	movs r7, #0x34
	ldrsh r2, [r5, r7]
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r4, #0x2e
	ldrsh r0, [r5, r4]
	str r0, [sp]
	movs r0, #0
	bl sub_08012FE8
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r7, #0x3a
	ldrsh r1, [r5, r7]
	movs r0, #0x3c
	ldrsh r2, [r5, r0]
	movs r7, #0x2c
	ldrsh r3, [r5, r7]
	movs r7, #0x2e
	ldrsh r0, [r5, r7]
	str r0, [sp]
	movs r0, #0
	bl sub_08012FE8
	strh r4, [r6, #2]
	strh r0, [r6, #4]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
_0805B8EC:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0805B8F4
sub_0805B8F4: @ 0x0805B8F4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r1, _0805B98C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805B990 @ =0x08BA2C10
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r6, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	strh r0, [r5, #0x2e]
	strh r4, [r5, #0x30]
	movs r0, #0x5b
	strh r0, [r5, #0x32]
	movs r0, #0x3f
	strh r0, [r5, #0x34]
	ldr r0, _0805B994 @ =0x0000FFF6
	strh r0, [r5, #0x3a]
	movs r0, #0x64
	strh r0, [r5, #0x3c]
	ldr r0, _0805B998 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0805B93A
	movs r0, #0x73
	strh r0, [r5, #0x32]
	movs r0, #0x57
	strh r0, [r5, #0x34]
_0805B93A:
	adds r0, r6, #0
	bl sub_08054678
	cmp r0, #1
	bne _0805B952
	movs r0, #0xf0
	ldrh r2, [r5, #0x32]
	subs r1, r0, r2
	strh r1, [r5, #0x32]
	ldrh r1, [r5, #0x34]
	subs r0, r0, r1
	strh r0, [r5, #0x34]
_0805B952:
	ldr r3, _0805B99C @ =0x08BD17D0
	str r3, [sp]
	adds r0, r6, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_0805041C
	str r0, [r5, #0x60]
	ldrh r1, [r5, #0x32]
	strh r1, [r0, #2]
	ldrh r1, [r5, #0x3a]
	strh r1, [r0, #4]
	ldr r3, _0805B9A0 @ =0x08BD17F4
	str r3, [sp]
	adds r0, r6, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_0805041C
	str r0, [r5, #0x64]
	ldrh r1, [r5, #0x32]
	strh r1, [r0, #2]
	ldrh r1, [r5, #0x3a]
	strh r1, [r0, #4]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805B98C: .4byte 0x0201774C
_0805B990: .4byte 0x08BA2C10
_0805B994: .4byte 0x0000FFF6
_0805B998: .4byte 0x0203E02C
_0805B99C: .4byte 0x08BD17D0
_0805B9A0: .4byte 0x08BD17F4

	thumb_func_start sub_0805B9A4
sub_0805B9A4: @ 0x0805B9A4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	ldr r6, [r4, #0x60]
	ldr r5, [r4, #0x64]
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	movs r7, #0x34
	ldrsh r2, [r4, r7]
	movs r0, #0x2e
	ldrsh r3, [r4, r0]
	movs r7, #0x30
	ldrsh r0, [r4, r7]
	str r0, [sp]
	movs r0, #0
	bl sub_08012FE8
	movs r1, #0
	mov r8, r1
	strh r0, [r5, #2]
	strh r0, [r6, #2]
	movs r2, #0x3a
	ldrsh r1, [r4, r2]
	movs r7, #0x3c
	ldrsh r2, [r4, r7]
	movs r0, #0x2e
	ldrsh r3, [r4, r0]
	movs r7, #0x30
	ldrsh r0, [r4, r7]
	str r0, [sp]
	movs r0, #0
	bl sub_08012FE8
	strh r0, [r5, #4]
	strh r0, [r6, #4]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x11
	bne _0805BA0A
	mov r0, r8
	strh r0, [r4, #0x2c]
	ldr r0, _0805BA40 @ =0x08BD17F4
	str r0, [r5, #0x24]
	str r0, [r5, #0x20]
	mov r1, r8
	strh r1, [r6, #6]
_0805BA0A:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0805BA34
	adds r0, r6, #0
	bl sub_08006650
	adds r0, r5, #0
	bl sub_08006650
	ldr r1, _0805BA44 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0805BA34:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805BA40: .4byte 0x08BD17F4
_0805BA44: .4byte 0x0201774C

	thumb_func_start sub_0805BA48
sub_0805BA48: @ 0x0805BA48
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805BA70 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805BA74 @ =0x08BA2C28
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	strh r2, [r0, #0x2e]
	movs r1, #1
	str r1, [r0, #0x44]
	str r2, [r0, #0x48]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805BA70: .4byte 0x0201774C
_0805BA74: .4byte 0x08BA2C28

	thumb_func_start sub_0805BA78
sub_0805BA78: @ 0x0805BA78
	push {lr}
	adds r3, r0, #0
	ldrh r0, [r3, #0x2c]
	adds r0, #1
	strh r0, [r3, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x2f
	bne _0805BAA0
	ldr r1, _0805BA9C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r3, #0
	bl Proc_Break
	b _0805BAC6
	.align 2, 0
_0805BA9C: .4byte 0x0201774C
_0805BAA0:
	ldrh r0, [r3, #0x2e]
	adds r0, #1
	strh r0, [r3, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r3, #0x44]
	cmp r0, r1
	bne _0805BAC6
	movs r0, #0
	strh r0, [r3, #0x2e]
	movs r0, #1
	str r0, [r3, #0x44]
	ldr r0, [r3, #0x5c]
	ldr r2, [r3, #0x48]
	adds r1, r2, #0
	adds r2, #1
	str r2, [r3, #0x48]
	bl sub_0805BACC
_0805BAC6:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0805BACC
sub_0805BACC: @ 0x0805BACC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _0805BB28 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805BB2C @ =0x08BA2C40
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #0x14
	strh r0, [r5, #0x2e]
	movs r0, #0x78
	bl sub_080672E8
	adds r1, r0, #0
	subs r1, #0x3c
	strh r1, [r5, #0x32]
	adds r0, #0xb4
	strh r0, [r5, #0x34]
	movs r1, #0x32
	ldrsh r0, [r5, r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	asrs r1, r1, #1
	movs r0, #0x34
	ldrsh r2, [r5, r0]
	lsls r0, r2, #1
	adds r0, r0, r2
	asrs r0, r0, #1
	adds r1, #0xc0
	strh r1, [r5, #0x3a]
	ldr r1, _0805BB30 @ =0xFFFFFEB8
	adds r0, r0, r1
	strh r0, [r5, #0x3c]
	movs r0, #2
	bl sub_080672E8
	cmp r0, #1
	bne _0805BB38
	ldr r0, _0805BB34 @ =0x08BD1840
	b _0805BB3A
	.align 2, 0
_0805BB28: .4byte 0x0201774C
_0805BB2C: .4byte 0x08BA2C40
_0805BB30: .4byte 0xFFFFFEB8
_0805BB34: .4byte 0x08BD1840
_0805BB38:
	ldr r0, _0805BB58 @ =0x08BD185C
_0805BB3A:
	movs r1, #0x78
	bl sub_08006594
	adds r1, r0, #0
	str r1, [r5, #0x60]
	cmp r1, #0
	bne _0805BB60
	ldr r1, _0805BB5C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_End
	b _0805BB6E
	.align 2, 0
_0805BB58: .4byte 0x08BD185C
_0805BB5C: .4byte 0x0201774C
_0805BB60:
	movs r0, #0x91
	lsls r0, r0, #6
	strh r0, [r1, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1, #2]
	strh r0, [r1, #4]
_0805BB6E:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0805BB74
sub_0805BB74: @ 0x0805BB74
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r6, [r5, #0x60]
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	cmp r1, r0
	ble _0805BBA4
	ldr r1, _0805BBA0 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r6, #0
	bl sub_08006650
	adds r0, r5, #0
	bl Proc_Break
	b _0805BBE4
	.align 2, 0
_0805BBA0: .4byte 0x0201774C
_0805BBA4:
	movs r4, #0x32
	ldrsh r1, [r5, r4]
	movs r7, #0x34
	ldrsh r2, [r5, r7]
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r4, #0x2e
	ldrsh r0, [r5, r4]
	str r0, [sp]
	movs r0, #0
	bl sub_08012FE8
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r7, #0x3a
	ldrsh r1, [r5, r7]
	movs r0, #0x3c
	ldrsh r2, [r5, r0]
	movs r7, #0x2c
	ldrsh r3, [r5, r7]
	movs r7, #0x2e
	ldrsh r0, [r5, r7]
	str r0, [sp]
	movs r0, #0
	bl sub_08012FE8
	strh r4, [r6, #2]
	strh r0, [r6, #4]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
_0805BBE4:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0805BBEC
sub_0805BBEC: @ 0x0805BBEC
	bx lr
	.align 2, 0

	thumb_func_start sub_0805BBF0
sub_0805BBF0: @ 0x0805BBF0
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_0804FFF0
	bl sub_0804FB6C
	bl sub_08050008
	ldr r0, _0805BC28 @ =0x08BA2C58
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl sub_08054804
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_0805468C
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805BC28: .4byte 0x08BA2C58

	thumb_func_start sub_0805BC2C
sub_0805BC2C: @ 0x0805BC2C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r6, r0, #0
	ldr r0, [r6, #0x5c]
	bl sub_080547A8
	adds r5, r0, #0
	bl sub_08050778
	adds r4, r0, #0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	movs r1, #0
	mov r8, r1
	movs r7, #0
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805BC62
	ldr r0, [r6, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804E498
_0805BC62:
	movs r2, #0x2c
	ldrsh r1, [r6, r2]
	adds r0, r4, #1
	cmp r1, r0
	bne _0805BCD4
	ldr r3, _0805BCD0 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	mov r2, r8
	strb r2, [r0]
	adds r0, #1
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r2, [r0]
	str r1, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0xf
	movs r3, #0
	bl sub_08055F08
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x50
	movs r2, #0xf
	movs r3, #0x10
	bl sub_08055F08
	ldr r0, [r6, #0x5c]
	bl sub_0805BDCC
	ldr r0, [r6, #0x5c]
	bl sub_0805C13C
	movs r0, #0x9c
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl sub_080681E4
	b _0805BDC0
	.align 2, 0
_0805BCD0: .4byte 0x03002870
_0805BCD4:
	adds r0, r4, #0
	adds r0, #0x46
	cmp r1, r0
	bne _0805BD02
	movs r0, #2
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x2a
	movs r2, #0xf
	movs r3, #0
	bl sub_080558BC
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #0x1e
	bl sub_08059DAC
	adds r0, r5, #0
	movs r1, #0x2b
	movs r2, #0
	bl sub_08055E14
	b _0805BDC0
_0805BD02:
	adds r0, r4, #0
	adds r0, #0x78
	cmp r1, r0
	bne _0805BD12
	adds r0, r5, #0
	bl sub_0805BE3C
	b _0805BDC0
_0805BD12:
	adds r0, r4, #0
	adds r0, #0x7d
	cmp r1, r0
	bne _0805BD30
	ldr r0, _0805BD2C @ =0x00000139
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl sub_080681E4
	b _0805BDC0
	.align 2, 0
_0805BD2C: .4byte 0x00000139
_0805BD30:
	adds r0, r4, #0
	adds r0, #0x97
	cmp r1, r0
	bne _0805BD40
	ldr r0, [r6, #0x5c]
	bl sub_0805BF94
	b _0805BDC0
_0805BD40:
	adds r0, r4, #0
	adds r0, #0xe2
	cmp r1, r0
	bne _0805BD88
	ldr r0, _0805BD84 @ =0x000002E2
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl sub_080681E4
	adds r0, r5, #0
	movs r1, #0xa
	bl sub_0804EFDC
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, r6, #0
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl sub_08050140
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805BDC0
	adds r0, r5, #0
	bl sub_08067D14
	b _0805BDC0
	.align 2, 0
_0805BD84: .4byte 0x000002E2
_0805BD88:
	adds r0, r4, #0
	adds r0, #0xec
	cmp r1, r0
	bne _0805BDA8
	adds r0, r5, #0
	bl sub_0805BEC0
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x10
	movs r2, #0xa
	movs r3, #0x10
	bl sub_08055F08
	b _0805BDC0
_0805BDA8:
	movs r2, #0x87
	lsls r2, r2, #1
	adds r0, r4, r2
	cmp r1, r0
	bne _0805BDC0
	bl sub_0804FFFC
	bl sub_0804FBC4
	adds r0, r6, #0
	bl Proc_Break
_0805BDC0:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0805BDCC
sub_0805BDCC: @ 0x0805BDCC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805BE20 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805BE24 @ =0x08BA2C70
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	str r2, [r0, #0x44]
	ldr r1, _0805BE28 @ =0x081E8A92
	str r1, [r0, #0x48]
	ldr r1, _0805BE2C @ =0x08BA2C88
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _0805BE30 @ =0x08BA2CF4
	str r1, [r0, #0x54]
	str r2, [r0, #0x58]
	ldr r0, _0805BE34 @ =0x08232BB0
	movs r1, #0x20
	bl sub_08050634
	bl sub_08050040
	ldr r2, _0805BE38 @ =0x03002870
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805BE20: .4byte 0x0201774C
_0805BE24: .4byte 0x08BA2C70
_0805BE28: .4byte 0x081E8A92
_0805BE2C: .4byte 0x08BA2C88
_0805BE30: .4byte 0x08BA2CF4
_0805BE34: .4byte 0x08232BB0
_0805BE38: .4byte 0x03002870

	thumb_func_start sub_0805BE3C
sub_0805BE3C: @ 0x0805BE3C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805BEA4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805BEA8 @ =0x08BA2C70
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r4, #0
	movs r2, #0
	strh r2, [r0, #0x2c]
	str r2, [r0, #0x44]
	ldr r1, _0805BEAC @ =0x081E8A98
	str r1, [r0, #0x48]
	ldr r1, _0805BEB0 @ =0x08BA2C88
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _0805BEB4 @ =0x08BA2CF4
	str r1, [r0, #0x54]
	str r2, [r0, #0x58]
	ldr r0, _0805BEB8 @ =0x0824A714
	movs r1, #0x20
	bl sub_08050634
	bl sub_08050040
	ldr r3, _0805BEBC @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x44
	movs r0, #0xc
	strb r0, [r1]
	adds r1, #1
	movs r0, #6
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805BEA4: .4byte 0x0201774C
_0805BEA8: .4byte 0x08BA2C70
_0805BEAC: .4byte 0x081E8A98
_0805BEB0: .4byte 0x08BA2C88
_0805BEB4: .4byte 0x08BA2CF4
_0805BEB8: .4byte 0x0824A714
_0805BEBC: .4byte 0x03002870

	thumb_func_start sub_0805BEC0
sub_0805BEC0: @ 0x0805BEC0
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805BF00 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805BF04 @ =0x08BA2C70
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	str r2, [r0, #0x44]
	ldr r1, _0805BF08 @ =0x081E8B3A
	str r1, [r0, #0x48]
	ldr r1, _0805BF0C @ =0x08BA2C88
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _0805BF10 @ =0x08BA2CF4
	str r1, [r0, #0x54]
	str r2, [r0, #0x58]
	ldr r0, _0805BF14 @ =0x0824A734
	movs r1, #0x20
	bl sub_08050634
	bl sub_08050040
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805BF00: .4byte 0x0201774C
_0805BF04: .4byte 0x08BA2C70
_0805BF08: .4byte 0x081E8B3A
_0805BF0C: .4byte 0x08BA2C88
_0805BF10: .4byte 0x08BA2CF4
_0805BF14: .4byte 0x0824A734

	thumb_func_start sub_0805BF18
sub_0805BF18: @ 0x0805BF18
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_080506E4
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _0805BF68
	ldr r7, [r4, #0x4c]
	ldr r0, [r4, #0x50]
	mov r8, r0
	ldr r0, [r4, #0x54]
	lsls r5, r1, #2
	adds r6, r5, r0
	ldr r0, [r4, #0x58]
	ldr r2, [r6]
	cmp r0, r2
	beq _0805BF52
	movs r1, #0x80
	lsls r1, r1, #6
	adds r0, r2, #0
	bl sub_0805060C
_0805BF52:
	ldr r0, [r6]
	str r0, [r4, #0x58]
	ldr r0, [r4, #0x5c]
	adds r1, r5, r7
	ldr r1, [r1]
	mov r3, r8
	adds r2, r5, r3
	ldr r2, [r2]
	bl sub_080504DC
	b _0805BF86
_0805BF68:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0805BF86
	bl sub_08050018
	ldr r1, _0805BF90 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl sub_08050118
	adds r0, r4, #0
	bl Proc_Break
_0805BF86:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805BF90: .4byte 0x0201774C

	thumb_func_start sub_0805BF94
sub_0805BF94: @ 0x0805BF94
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _0805BFEC @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805BFF0 @ =0x08BA2D60
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	adds r0, r5, #0
	bl sub_080547A8
	adds r5, r0, #0
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r3, _0805BFF4 @ =0x08BA14DC
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_0805041C
	adds r6, r0, #0
	str r6, [r4, #0x60]
	ldr r0, _0805BFF8 @ =0x0000F3FF
	ldrh r1, [r6, #8]
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r6, #8]
	adds r0, r5, #0
	bl sub_08054678
	cmp r0, #0
	bne _0805BFFC
	ldrh r0, [r6, #2]
	subs r0, #8
	b _0805C000
	.align 2, 0
_0805BFEC: .4byte 0x0201774C
_0805BFF0: .4byte 0x08BA2D60
_0805BFF4: .4byte 0x08BA14DC
_0805BFF8: .4byte 0x0000F3FF
_0805BFFC:
	ldrh r0, [r6, #2]
	adds r0, #8
_0805C000:
	strh r0, [r6, #2]
	ldrh r0, [r6, #4]
	subs r0, #0x10
	strh r0, [r6, #4]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_0805C010
sub_0805C010: @ 0x0805C010
	push {lr}
	ldr r2, _0805C024 @ =0x0201774C
	ldr r1, [r2]
	subs r1, #1
	str r1, [r2]
	ldr r0, [r0, #0x60]
	bl sub_08006650
	pop {r0}
	bx r0
	.align 2, 0
_0805C024: .4byte 0x0201774C

	thumb_func_start sub_0805C028
sub_0805C028: @ 0x0805C028
	push {r4, lr}
	adds r1, r0, #0
	ldr r2, [r1, #0x60]
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	movs r4, #0
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #1
	bne _0805C06C
	ldr r0, _0805C060 @ =0x08BBA2CC
	str r0, [r2, #0x24]
	str r0, [r2, #0x20]
	strh r4, [r2, #6]
	movs r0, #0xa
	strh r0, [r1, #0x2e]
	ldr r0, _0805C064 @ =0x0824D5C0
	movs r1, #0x20
	bl sub_080505F0
	ldr r0, _0805C068 @ =0x0824C860
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_080505C8
	b _0805C07C
	.align 2, 0
_0805C060: .4byte 0x08BBA2CC
_0805C064: .4byte 0x0824D5C0
_0805C068: .4byte 0x0824C860
_0805C06C:
	movs r2, #0x2e
	ldrsh r0, [r1, r2]
	cmp r3, r0
	bne _0805C07C
	strh r4, [r1, #0x2c]
	adds r0, r1, #0
	bl Proc_Break
_0805C07C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0805C084
sub_0805C084: @ 0x0805C084
	push {r4, lr}
	adds r1, r0, #0
	ldr r2, [r1, #0x60]
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	movs r4, #0
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #1
	bne _0805C0C8
	ldr r0, _0805C0BC @ =0x08BBA5D4
	str r0, [r2, #0x24]
	str r0, [r2, #0x20]
	strh r4, [r2, #6]
	movs r0, #0xa
	strh r0, [r1, #0x2e]
	ldr r0, _0805C0C0 @ =0x0824D5C0
	movs r1, #0x20
	bl sub_080505F0
	ldr r0, _0805C0C4 @ =0x0824CD2C
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_080505C8
	b _0805C0D8
	.align 2, 0
_0805C0BC: .4byte 0x08BBA5D4
_0805C0C0: .4byte 0x0824D5C0
_0805C0C4: .4byte 0x0824CD2C
_0805C0C8:
	movs r2, #0x2e
	ldrsh r0, [r1, r2]
	cmp r3, r0
	bne _0805C0D8
	strh r4, [r1, #0x2c]
	adds r0, r1, #0
	bl Proc_Break
_0805C0D8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0805C0E0
sub_0805C0E0: @ 0x0805C0E0
	push {r4, lr}
	adds r1, r0, #0
	ldr r2, [r1, #0x60]
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	movs r4, #0
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #1
	bne _0805C124
	ldr r0, _0805C118 @ =0x08BBA8D0
	str r0, [r2, #0x24]
	str r0, [r2, #0x20]
	strh r4, [r2, #6]
	movs r0, #0xa
	strh r0, [r1, #0x2e]
	ldr r0, _0805C11C @ =0x0824D5C0
	movs r1, #0x20
	bl sub_080505F0
	ldr r0, _0805C120 @ =0x0824D1C4
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_080505C8
	b _0805C134
	.align 2, 0
_0805C118: .4byte 0x08BBA8D0
_0805C11C: .4byte 0x0824D5C0
_0805C120: .4byte 0x0824D1C4
_0805C124:
	movs r2, #0x2e
	ldrsh r0, [r1, r2]
	cmp r3, r0
	bne _0805C134
	strh r4, [r1, #0x2c]
	adds r0, r1, #0
	bl Proc_Break
_0805C134:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0805C13C
sub_0805C13C: @ 0x0805C13C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805C174 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805C178 @ =0x08BA2DA8
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	movs r1, #0x2c
	strh r1, [r0, #0x30]
	ldr r0, _0805C17C @ =0x0822A25C
	movs r1, #0x20
	bl sub_080505F0
	ldr r0, _0805C180 @ =0x08229664
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_080505C8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805C174: .4byte 0x0201774C
_0805C178: .4byte 0x08BA2DA8
_0805C17C: .4byte 0x0822A25C
_0805C180: .4byte 0x08229664

	thumb_func_start sub_0805C184
sub_0805C184: @ 0x0805C184
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bne _0805C1D6
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, _0805C1DC @ =0x08BA2DC0
	movs r1, #0x2e
	ldrsh r2, [r4, r1]
	lsls r1, r2, #2
	adds r1, r1, r0
	lsls r2, r2, #1
	adds r2, #1
	lsls r2, r2, #1
	adds r2, r2, r0
	ldr r0, [r4, #0x5c]
	movs r3, #0
	ldrsh r1, [r1, r3]
	movs r3, #0
	ldrsh r2, [r2, r3]
	bl sub_0805C1E4
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #6
	bne _0805C1D6
	ldr r1, _0805C1E0 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0805C1D6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805C1DC: .4byte 0x08BA2DC0
_0805C1E0: .4byte 0x0201774C

	thumb_func_start sub_0805C1E4
sub_0805C1E4: @ 0x0805C1E4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	ldr r1, _0805C22C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805C230 @ =0x08BA2DD8
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r3, _0805C234 @ =0x08BB9534
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_0805041C
	str r0, [r4, #0x60]
	strh r6, [r0, #2]
	mov r1, r8
	strh r1, [r0, #4]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805C22C: .4byte 0x0201774C
_0805C230: .4byte 0x08BA2DD8
_0805C234: .4byte 0x08BB9534

	thumb_func_start sub_0805C238
sub_0805C238: @ 0x0805C238
	push {lr}
	ldr r2, _0805C24C @ =0x0201774C
	ldr r1, [r2]
	subs r1, #1
	str r1, [r2]
	ldr r0, [r0, #0x60]
	bl sub_08006650
	pop {r0}
	bx r0
	.align 2, 0
_0805C24C: .4byte 0x0201774C

	thumb_func_start sub_0805C250
sub_0805C250: @ 0x0805C250
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_0804FFF0
	bl sub_0804FB6C
	bl sub_08050008
	ldr r0, _0805C288 @ =0x08BA2DF8
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl sub_08054804
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_0805468C
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805C288: .4byte 0x08BA2DF8

	thumb_func_start sub_0805C28C
sub_0805C28C: @ 0x0805C28C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r6, r0, #0
	ldr r0, [r6, #0x5c]
	bl sub_080547A8
	adds r5, r0, #0
	bl sub_08050778
	adds r4, r0, #0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	movs r1, #0
	mov r8, r1
	movs r7, #0
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805C2C2
	ldr r0, [r6, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804E498
_0805C2C2:
	movs r2, #0x2c
	ldrsh r1, [r6, r2]
	adds r0, r4, #1
	cmp r1, r0
	bne _0805C354
	adds r0, r5, #0
	movs r1, #0x64
	bl sub_0805C470
	adds r0, r5, #0
	movs r1, #0x64
	bl sub_0805C54C
	movs r4, #0x80
	lsls r4, r4, #1
	movs r0, #1
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x64
	movs r2, #2
	adds r3, r4, #0
	bl sub_080558BC
	adds r0, r5, #0
	movs r1, #0x69
	movs r2, #0
	bl sub_08055E14
	ldr r3, _0805C350 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	mov r2, r8
	strb r2, [r0]
	adds r0, #1
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r2, [r0]
	str r1, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0xf
	movs r3, #0
	bl sub_08055F08
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x46
	movs r2, #0xf
	movs r3, #0x10
	bl sub_08055F08
	movs r0, #0x98
	lsls r0, r0, #1
	adds r1, r4, #0
	movs r2, #0x78
	movs r3, #0
	bl sub_080681E4
	b _0805C464
	.align 2, 0
_0805C350: .4byte 0x03002870
_0805C354:
	adds r0, r4, #0
	adds r0, #0x28
	cmp r1, r0
	bne _0805C36C
	adds r0, r5, #0
	movs r1, #0x4a
	bl sub_0805C5E4
	ldr r0, _0805C368 @ =0x00000131
	b _0805C3C4
	.align 2, 0
_0805C368: .4byte 0x00000131
_0805C36C:
	adds r0, r4, #0
	adds r0, #0x6e
	cmp r1, r0
	bne _0805C37C
	adds r0, r5, #0
	bl sub_0805C678
	b _0805C464
_0805C37C:
	adds r0, r4, #0
	adds r0, #0x6f
	cmp r1, r0
	beq _0805C3C0
	adds r0, r4, #0
	adds r0, #0x7d
	cmp r1, r0
	beq _0805C3C0
	adds r0, r4, #0
	adds r0, #0x8b
	cmp r1, r0
	beq _0805C3C0
	adds r0, r4, #0
	adds r0, #0x99
	cmp r1, r0
	beq _0805C3C0
	adds r0, r4, #0
	adds r0, #0xa7
	cmp r1, r0
	beq _0805C3C0
	adds r0, r4, #0
	adds r0, #0xb5
	cmp r1, r0
	beq _0805C3C0
	adds r0, r4, #0
	adds r0, #0xc3
	cmp r1, r0
	beq _0805C3C0
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	adds r0, r4, #0
	adds r0, #0xd1
	cmp r1, r0
	bne _0805C3D4
_0805C3C0:
	movs r0, #0x99
	lsls r0, r0, #1
_0805C3C4:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl sub_080681E4
	b _0805C464
_0805C3D4:
	adds r0, r4, #0
	adds r0, #0xee
	cmp r1, r0
	bne _0805C420
	adds r0, r5, #0
	movs r1, #0xa
	bl sub_0804EFDC
	adds r0, r5, #0
	bl sub_0805C85C
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, r6, #0
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl sub_08050140
	ldr r0, _0805C41C @ =0x00000133
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl sub_080681E4
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805C464
	adds r0, r5, #0
	bl sub_08067D14
	b _0805C464
	.align 2, 0
_0805C41C: .4byte 0x00000133
_0805C420:
	adds r0, r4, #0
	adds r0, #0xf8
	cmp r1, r0
	bne _0805C442
	adds r0, r5, #0
	bl sub_0805C708
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x12
	movs r2, #8
	movs r3, #0x10
	bl sub_08055F08
	b _0805C464
_0805C442:
	movs r2, #0x91
	lsls r2, r2, #1
	adds r0, r4, r2
	cmp r1, r0
	beq _0805C464
	movs r3, #0x96
	lsls r3, r3, #1
	adds r0, r4, r3
	cmp r1, r0
	bne _0805C464
	bl sub_0804FFFC
	bl sub_0804FBC4
	adds r0, r6, #0
	bl Proc_Break
_0805C464:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0805C470
sub_0805C470: @ 0x0805C470
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0805C4E4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805C4E8 @ =0x08BA2E10
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	ldr r0, _0805C4EC @ =0x0824D5E0
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_0805060C
	bl sub_08050018
	ldr r0, _0805C4F0 @ =0x0824DF20
	ldr r4, _0805C4F4 @ =0x02019784
	adds r1, r4, #0
	bl sub_080BFA28
	ldr r1, _0805C4F8 @ =0x02023460
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x20
	movs r3, #0x20
	bl sub_08066ACC
	movs r0, #2
	bl EnableBgSync
	bl sub_08050040
	ldr r2, _0805C4FC @ =0x03002870
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805C4E4: .4byte 0x0201774C
_0805C4E8: .4byte 0x08BA2E10
_0805C4EC: .4byte 0x0824D5E0
_0805C4F0: .4byte 0x0824DF20
_0805C4F4: .4byte 0x02019784
_0805C4F8: .4byte 0x02023460
_0805C4FC: .4byte 0x03002870

	thumb_func_start sub_0805C500
sub_0805C500: @ 0x0805C500
	push {lr}
	bl sub_08050018
	ldr r1, _0805C518 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl sub_08050118
	pop {r0}
	bx r0
	.align 2, 0
_0805C518: .4byte 0x0201774C

	thumb_func_start sub_0805C51C
sub_0805C51C: @ 0x0805C51C
	push {lr}
	adds r2, r0, #0
	ldr r0, _0805C548 @ =0x03002870
	ldrh r1, [r0, #0x22]
	adds r1, #1
	strh r1, [r0, #0x22]
	ldrh r1, [r0, #0x20]
	subs r1, #1
	strh r1, [r0, #0x20]
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	ldrh r3, [r2, #0x2e]
	lsls r1, r3, #0x10
	cmp r0, r1
	ble _0805C544
	adds r0, r2, #0
	bl Proc_Break
_0805C544:
	pop {r0}
	bx r0
	.align 2, 0
_0805C548: .4byte 0x03002870

	thumb_func_start sub_0805C54C
sub_0805C54C: @ 0x0805C54C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0805C584 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805C588 @ =0x08BA2E30
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	strh r5, [r0, #0x30]
	str r1, [r0, #0x44]
	ldr r1, _0805C58C @ =0x081E8B70
	str r1, [r0, #0x48]
	ldr r1, _0805C590 @ =0x0824DD40
	str r1, [r0, #0x4c]
	adds r0, r1, #0
	movs r1, #0x20
	bl sub_08050634
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805C584: .4byte 0x0201774C
_0805C588: .4byte 0x08BA2E30
_0805C58C: .4byte 0x081E8B70
_0805C590: .4byte 0x0824DD40

	thumb_func_start sub_0805C594
sub_0805C594: @ 0x0805C594
	ldr r1, _0805C5A0 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_0805C5A0: .4byte 0x0201774C

	thumb_func_start sub_0805C5A4
sub_0805C5A4: @ 0x0805C5A4
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_080506E4
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _0805C5C8
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl sub_08050634
_0805C5C8:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0805C5DE
	adds r0, r4, #0
	bl Proc_Break
_0805C5DE:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0805C5E4
sub_0805C5E4: @ 0x0805C5E4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r1, _0805C630 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805C634 @ =0x08BA2E58
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r6, [r4, #0x2e]
	ldr r3, _0805C638 @ =0x08BBB5C0
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_0805041C
	str r0, [r4, #0x60]
	ldr r0, _0805C63C @ =0x082572A4
	movs r1, #0x20
	bl sub_080505F0
	ldr r0, _0805C640 @ =0x08256728
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_080505C8
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805C630: .4byte 0x0201774C
_0805C634: .4byte 0x08BA2E58
_0805C638: .4byte 0x08BBB5C0
_0805C63C: .4byte 0x082572A4
_0805C640: .4byte 0x08256728

	thumb_func_start sub_0805C644
sub_0805C644: @ 0x0805C644
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0805C66C
	ldr r0, _0805C674 @ =0x0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl sub_08006650
	adds r0, r4, #0
	bl Proc_Break
_0805C66C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805C674: .4byte 0x0201774C

	thumb_func_start sub_0805C678
sub_0805C678: @ 0x0805C678
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _0805C6DC @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805C6E0 @ =0x08BA2E70
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r1, #0
	strh r1, [r5, #0x2c]
	str r1, [r5, #0x44]
	ldr r0, _0805C6E4 @ =0x081E8BAE
	str r0, [r5, #0x48]
	ldr r0, _0805C6E8 @ =0x08BA2F54
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _0805C6EC @ =0x08BA2E88
	str r0, [r5, #0x54]
	str r1, [r5, #0x58]
	ldr r0, _0805C6F0 @ =0x082520E0
	movs r1, #0x20
	bl sub_08050634
	bl sub_08050040
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _0805C6F4 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805C702
	ldr r0, [r5, #0x5c]
	bl sub_08054678
	cmp r0, #0
	bne _0805C6F8
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b _0805C702
	.align 2, 0
_0805C6DC: .4byte 0x0201774C
_0805C6E0: .4byte 0x08BA2E70
_0805C6E4: .4byte 0x081E8BAE
_0805C6E8: .4byte 0x08BA2F54
_0805C6EC: .4byte 0x08BA2E88
_0805C6F0: .4byte 0x082520E0
_0805C6F4: .4byte 0x0203E02C
_0805C6F8:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
_0805C702:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0805C708
sub_0805C708: @ 0x0805C708
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _0805C764 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805C768 @ =0x08BA2E70
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r1, #0
	strh r1, [r5, #0x2c]
	str r1, [r5, #0x44]
	ldr r0, _0805C76C @ =0x081E82CC
	str r0, [r5, #0x48]
	ldr r0, _0805C770 @ =0x08BA1B68
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _0805C774 @ =0x08BA1B14
	str r0, [r5, #0x54]
	str r1, [r5, #0x58]
	ldr r0, _0805C778 @ =0x08252100
	movs r1, #0x20
	bl sub_08050634
	bl sub_08050040
	ldr r0, _0805C77C @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805C78A
	ldr r0, [r5, #0x5c]
	bl sub_08054678
	cmp r0, #0
	bne _0805C780
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b _0805C78A
	.align 2, 0
_0805C764: .4byte 0x0201774C
_0805C768: .4byte 0x08BA2E70
_0805C76C: .4byte 0x081E82CC
_0805C770: .4byte 0x08BA1B68
_0805C774: .4byte 0x08BA1B14
_0805C778: .4byte 0x08252100
_0805C77C: .4byte 0x0203E02C
_0805C780:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
_0805C78A:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0805C790
sub_0805C790: @ 0x0805C790
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_080506E4
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _0805C82C
	ldr r7, [r4, #0x4c]
	ldr r0, [r4, #0x50]
	mov r8, r0
	ldr r0, [r4, #0x54]
	lsls r5, r1, #2
	adds r6, r5, r0
	ldr r0, [r4, #0x58]
	ldr r2, [r6]
	cmp r0, r2
	beq _0805C7CC
	movs r1, #0x80
	lsls r1, r1, #6
	adds r0, r2, #0
	bl sub_0805060C
_0805C7CC:
	ldr r0, [r6]
	str r0, [r4, #0x58]
	ldr r0, [r4, #0x5c]
	adds r1, r5, r7
	ldr r1, [r1]
	mov r3, r8
	adds r2, r5, r3
	ldr r2, [r2]
	bl sub_080504DC
	ldr r0, _0805C808 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805C84A
	ldr r0, [r4, #0x5c]
	bl sub_08054678
	adds r1, r0, #0
	cmp r1, #0
	bne _0805C810
	ldr r0, _0805C80C @ =0x02023460
	str r1, [sp]
	movs r1, #3
	movs r2, #0x14
	movs r3, #0
	bl sub_080669B4
	b _0805C820
	.align 2, 0
_0805C808: .4byte 0x0203E02C
_0805C80C: .4byte 0x02023460
_0805C810:
	ldr r0, _0805C828 @ =0x0202349A
	movs r1, #0
	str r1, [sp]
	movs r1, #3
	movs r2, #0x14
	movs r3, #0
	bl sub_080669B4
_0805C820:
	movs r0, #2
	bl EnableBgSync
	b _0805C84A
	.align 2, 0
_0805C828: .4byte 0x0202349A
_0805C82C:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0805C84A
	bl sub_08050018
	ldr r1, _0805C858 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl sub_08050118
	adds r0, r4, #0
	bl Proc_Break
_0805C84A:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805C858: .4byte 0x0201774C

	thumb_func_start sub_0805C85C
sub_0805C85C: @ 0x0805C85C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805C894 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805C898 @ =0x08BA3020
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	ldr r0, _0805C89C @ =0x082572C4
	movs r1, #0x20
	bl sub_080505F0
	ldr r0, _0805C8A0 @ =0x08256728
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_080505C8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805C894: .4byte 0x0201774C
_0805C898: .4byte 0x08BA3020
_0805C89C: .4byte 0x082572C4
_0805C8A0: .4byte 0x08256728

	thumb_func_start sub_0805C8A4
sub_0805C8A4: @ 0x0805C8A4
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	bne _0805C8E4
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x5c]
	ldr r2, [r4, #0x44]
	adds r1, r2, #0
	adds r2, #1
	str r2, [r4, #0x44]
	bl sub_0805C8F0
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bne _0805C8E4
	ldr r1, _0805C8EC @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0805C8E4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805C8EC: .4byte 0x0201774C

	thumb_func_start sub_0805C8F0
sub_0805C8F0: @ 0x0805C8F0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r1, _0805C930 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805C934 @ =0x08BA3038
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r6, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #0x1e
	strh r0, [r5, #0x2e]
	ldr r1, _0805C938 @ =0x08BA3050
	movs r0, #7
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r5, #0x44]
	movs r1, #0
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _0805C93C
	cmp r0, #1
	beq _0805C944
	b _0805C950
	.align 2, 0
_0805C930: .4byte 0x0201774C
_0805C934: .4byte 0x08BA3038
_0805C938: .4byte 0x08BA3050
_0805C93C:
	ldr r0, _0805C940 @ =0x08BBB568
	b _0805C946
	.align 2, 0
_0805C940: .4byte 0x08BBB568
_0805C944:
	ldr r0, _0805C96C @ =0x08BBB594
_0805C946:
	movs r1, #0x78
	bl sub_08006594
	adds r1, r0, #0
	str r1, [r5, #0x60]
_0805C950:
	movs r0, #0xa1
	lsls r0, r0, #6
	strh r0, [r1, #8]
	ldrh r0, [r6, #2]
	strh r0, [r1, #2]
	ldrh r0, [r6, #2]
	strh r0, [r5, #0x32]
	ldrh r0, [r6, #4]
	strh r0, [r1, #4]
	ldrh r0, [r6, #4]
	strh r0, [r5, #0x3a]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805C96C: .4byte 0x08BBB594

	thumb_func_start sub_0805C970
sub_0805C970: @ 0x0805C970
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r5, [r6, #0x60]
	movs r2, #0x96
	lsls r2, r2, #1
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r1, #0x2e
	ldrsh r0, [r6, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl sub_08012FE8
	ldr r4, _0805C9E8 @ =0x080C5A48
	ldr r2, [r6, #0x44]
	lsls r1, r2, #1
	adds r1, r1, r4
	movs r3, #0
	ldrsh r1, [r1, r3]
	adds r3, r0, #0
	muls r3, r1, r3
	adds r2, #0x40
	lsls r2, r2, #1
	adds r2, r2, r4
	movs r4, #0
	ldrsh r1, [r2, r4]
	muls r0, r1, r0
	asrs r3, r3, #0xc
	ldrh r1, [r6, #0x32]
	adds r3, r1, r3
	strh r3, [r5, #2]
	asrs r0, r0, #0xc
	ldrh r2, [r6, #0x3a]
	adds r0, r2, r0
	strh r0, [r5, #4]
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	ldrh r3, [r6, #0x2e]
	lsls r1, r3, #0x10
	cmp r0, r1
	ble _0805C9DE
	ldr r0, _0805C9EC @ =0x0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r6, #0x60]
	bl sub_08006650
	adds r0, r6, #0
	bl Proc_Break
_0805C9DE:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805C9E8: .4byte 0x080C5A48
_0805C9EC: .4byte 0x0201774C

	thumb_func_start sub_0805C9F0
sub_0805C9F0: @ 0x0805C9F0
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0804FFF0
	bl sub_0804FB6C
	bl sub_08050008
	ldr r0, _0805CA14 @ =0x08BA3070
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805CA14: .4byte 0x08BA3070

	thumb_func_start sub_0805CA18
sub_0805CA18: @ 0x0805CA18
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl sub_080547A8
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r6, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805CA4A
	ldr r0, [r4, #0x5c]
	bl sub_0805D430
	movs r0, #0xb3
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b _0805CAF4
_0805CA4A:
	cmp r0, #0x34
	bne _0805CAB0
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl sub_0805D03C
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl sub_0805D21C
	ldr r3, _0805CAAC @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	strb r6, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r6, [r0]
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0xc
	movs r3, #0
	bl sub_0805D344
	ldr r0, [r4, #0x5c]
	movs r1, #0x23
	movs r2, #0x19
	movs r3, #1
	bl sub_0805D344
	movs r0, #0x87
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b _0805CAF4
	.align 2, 0
_0805CAAC: .4byte 0x03002870
_0805CAB0:
	cmp r0, #0x37
	bne _0805CABE
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	b _0805CB38
_0805CABE:
	cmp r0, #0x71
	bne _0805CB00
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl sub_0805D0F8
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl sub_0805D28C
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0xc
	movs r3, #0
	bl sub_0805D344
	ldr r0, [r4, #0x5c]
	movs r1, #0x1d
	movs r2, #0x19
	movs r3, #1
	bl sub_0805D344
	ldr r0, _0805CAFC @ =0x0000010F
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
_0805CAF4:
	movs r3, #1
	bl sub_080681E4
	b _0805CB38
	.align 2, 0
_0805CAFC: .4byte 0x0000010F
_0805CB00:
	cmp r0, #0xa6
	bne _0805CB0C
	adds r0, r5, #0
	bl sub_0804DC98
	b _0805CB38
_0805CB0C:
	cmp r0, #0xb5
	bne _0805CB38
	bl sub_0804FFFC
	bl sub_0804FBC4
	adds r0, r5, #0
	bl sub_080547E4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _0805CB32
	movs r0, #2
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
_0805CB32:
	adds r0, r4, #0
	bl Proc_Break
_0805CB38:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0805CB40
sub_0805CB40: @ 0x0805CB40
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0804FFF0
	bl sub_0804FB6C
	bl sub_08050008
	ldr r0, _0805CB64 @ =0x08BA3088
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805CB64: .4byte 0x08BA3088

	thumb_func_start sub_0805CB68
sub_0805CB68: @ 0x0805CB68
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl sub_080547A8
	adds r5, r0, #0
	bl sub_08050778
	adds r2, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r6, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805CBA0
	ldr r0, [r4, #0x5c]
	bl sub_0805D430
	movs r0, #0xb3
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b _0805CC8A
_0805CBA0:
	cmp r0, #0x34
	bne _0805CC08
	ldr r0, [r4, #0x5c]
	movs r1, #1
	bl sub_0805D03C
	ldr r0, [r4, #0x5c]
	movs r1, #1
	bl sub_0805D21C
	ldr r3, _0805CC04 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	strb r6, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r6, [r0]
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0xc
	movs r3, #0
	bl sub_0805D344
	ldr r0, [r4, #0x5c]
	movs r1, #0x23
	movs r2, #0x19
	movs r3, #1
	bl sub_0805D344
	movs r0, #0x88
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b _0805CC8A
	.align 2, 0
_0805CC04: .4byte 0x03002870
_0805CC08:
	cmp r0, #0x37
	bne _0805CC16
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	b _0805CCDC
_0805CC16:
	cmp r0, #0x71
	bne _0805CC26
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804E498
	b _0805CCDC
_0805CC26:
	movs r3, #0x2c
	ldrsh r1, [r4, r3]
	adds r0, r2, #0
	adds r0, #0x72
	cmp r1, r0
	bne _0805CC9C
	ldr r0, [r4, #0x5c]
	movs r1, #1
	bl sub_0805D0F8
	ldr r0, [r4, #0x5c]
	movs r1, #1
	bl sub_0805D28C
	ldr r3, _0805CC94 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	strb r6, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r6, [r0]
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0xc
	movs r3, #0
	bl sub_0805D344
	ldr r0, [r4, #0x5c]
	movs r1, #0x1d
	movs r2, #0x19
	movs r3, #1
	bl sub_0805D344
	ldr r0, _0805CC98 @ =0x00000111
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
_0805CC8A:
	movs r3, #1
	bl sub_080681E4
	b _0805CCDC
	.align 2, 0
_0805CC94: .4byte 0x03002870
_0805CC98: .4byte 0x00000111
_0805CC9C:
	adds r0, r2, #0
	adds r0, #0xa6
	cmp r1, r0
	bne _0805CCAC
	adds r0, r5, #0
	bl sub_0804DC98
	b _0805CCDC
_0805CCAC:
	adds r0, r2, #0
	adds r0, #0xb5
	cmp r1, r0
	bne _0805CCDC
	bl sub_0804FFFC
	bl sub_0804FBC4
	adds r0, r5, #0
	bl sub_080547E4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _0805CCD6
	movs r0, #2
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
_0805CCD6:
	adds r0, r4, #0
	bl Proc_Break
_0805CCDC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0805CCE4
sub_0805CCE4: @ 0x0805CCE4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0804FFF0
	bl sub_0804FB6C
	bl sub_08050008
	ldr r0, _0805CD08 @ =0x08BA30A0
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805CD08: .4byte 0x08BA30A0

	thumb_func_start sub_0805CD0C
sub_0805CD0C: @ 0x0805CD0C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl sub_080547A8
	adds r5, r0, #0
	bl sub_08050778
	adds r2, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r6, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805CD44
	ldr r0, [r4, #0x5c]
	bl sub_0805D430
	movs r0, #0xb3
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b _0805CE2E
_0805CD44:
	cmp r0, #0x34
	bne _0805CDAC
	ldr r0, [r4, #0x5c]
	movs r1, #2
	bl sub_0805D03C
	ldr r0, [r4, #0x5c]
	movs r1, #2
	bl sub_0805D21C
	ldr r3, _0805CDA8 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	strb r6, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r6, [r0]
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0xc
	movs r3, #0
	bl sub_0805D344
	ldr r0, [r4, #0x5c]
	movs r1, #0x23
	movs r2, #0x19
	movs r3, #1
	bl sub_0805D344
	movs r0, #0x89
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b _0805CE2E
	.align 2, 0
_0805CDA8: .4byte 0x03002870
_0805CDAC:
	cmp r0, #0x37
	bne _0805CDBA
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	b _0805CE80
_0805CDBA:
	cmp r0, #0x71
	bne _0805CDCA
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804E498
	b _0805CE80
_0805CDCA:
	movs r3, #0x2c
	ldrsh r1, [r4, r3]
	adds r0, r2, #0
	adds r0, #0x72
	cmp r1, r0
	bne _0805CE40
	ldr r0, [r4, #0x5c]
	movs r1, #2
	bl sub_0805D0F8
	ldr r0, [r4, #0x5c]
	movs r1, #2
	bl sub_0805D28C
	ldr r3, _0805CE38 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	strb r6, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r6, [r0]
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0xc
	movs r3, #0
	bl sub_0805D344
	ldr r0, [r4, #0x5c]
	movs r1, #0x1d
	movs r2, #0x19
	movs r3, #1
	bl sub_0805D344
	ldr r0, _0805CE3C @ =0x00000113
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
_0805CE2E:
	movs r3, #1
	bl sub_080681E4
	b _0805CE80
	.align 2, 0
_0805CE38: .4byte 0x03002870
_0805CE3C: .4byte 0x00000113
_0805CE40:
	adds r0, r2, #0
	adds r0, #0xa6
	cmp r1, r0
	bne _0805CE50
	adds r0, r5, #0
	bl sub_0804DC98
	b _0805CE80
_0805CE50:
	adds r0, r2, #0
	adds r0, #0xb5
	cmp r1, r0
	bne _0805CE80
	bl sub_0804FFFC
	bl sub_0804FBC4
	adds r0, r5, #0
	bl sub_080547E4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _0805CE7A
	movs r0, #2
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
_0805CE7A:
	adds r0, r4, #0
	bl Proc_Break
_0805CE80:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0805CE88
sub_0805CE88: @ 0x0805CE88
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0804FFF0
	bl sub_0804FB6C
	bl sub_08050008
	ldr r0, _0805CEAC @ =0x08BA30B8
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805CEAC: .4byte 0x08BA30B8

	thumb_func_start sub_0805CEB0
sub_0805CEB0: @ 0x0805CEB0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl sub_080547A8
	adds r5, r0, #0
	bl sub_08050778
	adds r2, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r6, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805CEF0
	ldr r0, [r4, #0x5c]
	bl sub_0805D430
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl sub_0805D590
	movs r0, #0xb3
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b _0805CFE2
_0805CEF0:
	cmp r0, #0x34
	bne _0805CF58
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl sub_0805D03C
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl sub_0805D21C
	ldr r3, _0805CF54 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	strb r6, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r6, [r0]
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0xc
	movs r3, #0
	bl sub_0805D344
	ldr r0, [r4, #0x5c]
	movs r1, #0x23
	movs r2, #0x19
	movs r3, #1
	bl sub_0805D344
	movs r0, #0x87
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b _0805CFE2
	.align 2, 0
_0805CF54: .4byte 0x03002870
_0805CF58:
	cmp r0, #0x37
	bne _0805CF66
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	b _0805D034
_0805CF66:
	cmp r0, #0x97
	bne _0805CF7E
	ldr r0, [r4, #0x5c]
	movs r1, #1
	bl sub_0805D590
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804E498
	b _0805D034
_0805CF7E:
	movs r3, #0x2c
	ldrsh r1, [r4, r3]
	adds r0, r2, #0
	adds r0, #0xa1
	cmp r1, r0
	bne _0805CFF4
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl sub_0805D0F8
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl sub_0805D28C
	ldr r3, _0805CFEC @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	strb r6, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r6, [r0]
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0xc
	movs r3, #0
	bl sub_0805D344
	ldr r0, [r4, #0x5c]
	movs r1, #0x1d
	movs r2, #0x19
	movs r3, #1
	bl sub_0805D344
	ldr r0, _0805CFF0 @ =0x0000010F
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
_0805CFE2:
	movs r3, #1
	bl sub_080681E4
	b _0805D034
	.align 2, 0
_0805CFEC: .4byte 0x03002870
_0805CFF0: .4byte 0x0000010F
_0805CFF4:
	adds r0, r2, #0
	adds r0, #0xd3
	cmp r1, r0
	bne _0805D004
	adds r0, r5, #0
	bl sub_0804DC98
	b _0805D034
_0805D004:
	adds r0, r2, #0
	adds r0, #0xdd
	cmp r1, r0
	bne _0805D034
	bl sub_0804FFFC
	bl sub_0804FBC4
	adds r0, r5, #0
	bl sub_080547E4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _0805D02E
	movs r0, #2
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
_0805D02E:
	adds r0, r4, #0
	bl Proc_Break
_0805D034:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0805D03C
sub_0805D03C: @ 0x0805D03C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r1, _0805D084 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805D088 @ =0x08BA30D0
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	cmp r6, #0
	beq _0805D09C
	cmp r6, #2
	bhi _0805D0EE
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
	ldr r0, _0805D08C @ =0x081E8CBC
	str r0, [r5, #0x48]
	ldr r0, _0805D090 @ =0x0826B454
	str r0, [r5, #0x4c]
	ldr r0, _0805D094 @ =0x0826BDB4
	str r0, [r5, #0x50]
	ldr r0, _0805D098 @ =0x0826AC5C
	movs r1, #0xa8
	lsls r1, r1, #5
	bl sub_0805060C
	b _0805D0EE
	.align 2, 0
_0805D084: .4byte 0x0201774C
_0805D088: .4byte 0x08BA30D0
_0805D08C: .4byte 0x081E8CBC
_0805D090: .4byte 0x0826B454
_0805D094: .4byte 0x0826BDB4
_0805D098: .4byte 0x0826AC5C
_0805D09C:
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
	ldr r0, _0805D0D4 @ =0x081E8CB0
	str r0, [r5, #0x48]
	ldr r0, _0805D0D8 @ =0x08269E88
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _0805D0DC @ =0x08269CF8
	movs r1, #0x80
	lsls r1, r1, #3
	bl sub_0805060C
	ldr r0, _0805D0E0 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805D0EE
	ldr r0, [r5, #0x5c]
	bl sub_08054678
	cmp r0, #0
	bne _0805D0E4
	movs r0, #1
	movs r1, #0x18
	b _0805D0E8
	.align 2, 0
_0805D0D4: .4byte 0x081E8CB0
_0805D0D8: .4byte 0x08269E88
_0805D0DC: .4byte 0x08269CF8
_0805D0E0: .4byte 0x0203E02C
_0805D0E4:
	movs r0, #1
	movs r1, #0xe8
_0805D0E8:
	movs r2, #0
	bl SetBgOffset
_0805D0EE:
	bl sub_08050040
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_0805D0F8
sub_0805D0F8: @ 0x0805D0F8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r1, _0805D140 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805D144 @ =0x08BA30D0
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r1, #0
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	adds r0, r5, #0
	adds r0, #0x29
	strb r1, [r0]
	cmp r6, #0
	beq _0805D158
	cmp r6, #2
	bhi _0805D1A2
	ldr r0, _0805D148 @ =0x081E8CC2
	str r0, [r5, #0x48]
	ldr r0, _0805D14C @ =0x0826B454
	str r0, [r5, #0x4c]
	ldr r0, _0805D150 @ =0x0826BDB4
	str r0, [r5, #0x50]
	ldr r0, _0805D154 @ =0x0826AC5C
	movs r1, #0xa8
	lsls r1, r1, #5
	bl sub_0805060C
	b _0805D1A2
	.align 2, 0
_0805D140: .4byte 0x0201774C
_0805D144: .4byte 0x08BA30D0
_0805D148: .4byte 0x081E8CC2
_0805D14C: .4byte 0x0826B454
_0805D150: .4byte 0x0826BDB4
_0805D154: .4byte 0x0826AC5C
_0805D158:
	ldr r0, _0805D188 @ =0x081E8CB6
	str r0, [r5, #0x48]
	ldr r0, _0805D18C @ =0x08269E88
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _0805D190 @ =0x08269CF8
	movs r1, #0x80
	lsls r1, r1, #3
	bl sub_0805060C
	ldr r0, _0805D194 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805D1A2
	ldr r0, [r5, #0x5c]
	bl sub_08054678
	cmp r0, #0
	bne _0805D198
	movs r0, #1
	movs r1, #0xe8
	b _0805D19C
	.align 2, 0
_0805D188: .4byte 0x081E8CB6
_0805D18C: .4byte 0x08269E88
_0805D190: .4byte 0x08269CF8
_0805D194: .4byte 0x0203E02C
_0805D198:
	movs r0, #1
	movs r1, #0x18
_0805D19C:
	movs r2, #0
	bl SetBgOffset
_0805D1A2:
	bl sub_08050040
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_0805D1AC
sub_0805D1AC: @ 0x0805D1AC
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_080506E4
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt _0805D1DE
	ldr r1, [r4, #0x4c]
	ldr r2, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r4, r3, #2
	adds r4, r4, r3
	lsls r3, r4, #4
	subs r3, r3, r4
	lsls r3, r3, #4
	adds r1, r1, r3
	adds r2, r2, r3
	bl sub_08050478
	b _0805D210
_0805D1DE:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, r0
	bne _0805D210
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805D1F8
	bl sub_08050018
	bl sub_08050118
_0805D1F8:
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r1, _0805D218 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0805D210:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805D218: .4byte 0x0201774C

	thumb_func_start sub_0805D21C
sub_0805D21C: @ 0x0805D21C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0805D244 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805D248 @ =0x08BA30E8
	movs r1, #3
	bl SpawnProc
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	str r0, [r1, #0x44]
	cmp r5, #0
	bne _0805D250
	ldr r0, _0805D24C @ =0x081E8CC8
	b _0805D25E
	.align 2, 0
_0805D244: .4byte 0x0201774C
_0805D248: .4byte 0x08BA30E8
_0805D24C: .4byte 0x081E8CC8
_0805D250:
	cmp r5, #1
	bne _0805D25C
	ldr r0, _0805D258 @ =0x081E8D4C
	b _0805D25E
	.align 2, 0
_0805D258: .4byte 0x081E8D4C
_0805D25C:
	ldr r0, _0805D268 @ =0x081E8D7E
_0805D25E:
	str r0, [r1, #0x48]
	cmp r5, #0
	bne _0805D270
	ldr r0, _0805D26C @ =0x0826A7E8
	b _0805D27E
	.align 2, 0
_0805D268: .4byte 0x081E8D7E
_0805D26C: .4byte 0x0826A7E8
_0805D270:
	cmp r5, #1
	bne _0805D27C
	ldr r0, _0805D278 @ =0x0826C934
	b _0805D27E
	.align 2, 0
_0805D278: .4byte 0x0826C934
_0805D27C:
	ldr r0, _0805D288 @ =0x0826C714
_0805D27E:
	str r0, [r1, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805D288: .4byte 0x0826C714

	thumb_func_start sub_0805D28C
sub_0805D28C: @ 0x0805D28C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0805D2B4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805D2B8 @ =0x08BA30E8
	movs r1, #3
	bl SpawnProc
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	str r0, [r1, #0x44]
	cmp r5, #0
	bne _0805D2C0
	ldr r0, _0805D2BC @ =0x081E8D0A
	b _0805D2CE
	.align 2, 0
_0805D2B4: .4byte 0x0201774C
_0805D2B8: .4byte 0x08BA30E8
_0805D2BC: .4byte 0x081E8D0A
_0805D2C0:
	cmp r5, #1
	bne _0805D2CC
	ldr r0, _0805D2C8 @ =0x081E8D4C
	b _0805D2CE
	.align 2, 0
_0805D2C8: .4byte 0x081E8D4C
_0805D2CC:
	ldr r0, _0805D2D8 @ =0x081E8D7E
_0805D2CE:
	str r0, [r1, #0x48]
	cmp r5, #0
	bne _0805D2E0
	ldr r0, _0805D2DC @ =0x0826A7E8
	b _0805D2EE
	.align 2, 0
_0805D2D8: .4byte 0x081E8D7E
_0805D2DC: .4byte 0x0826A7E8
_0805D2E0:
	cmp r5, #1
	bne _0805D2EC
	ldr r0, _0805D2E8 @ =0x0826C934
	b _0805D2EE
	.align 2, 0
_0805D2E8: .4byte 0x0826C934
_0805D2EC:
	ldr r0, _0805D2F8 @ =0x0826C714
_0805D2EE:
	str r0, [r1, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805D2F8: .4byte 0x0826C714

	thumb_func_start sub_0805D2FC
sub_0805D2FC: @ 0x0805D2FC
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_080506E4
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _0805D322
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl sub_08050634
	b _0805D338
_0805D322:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0805D338
	ldr r1, _0805D340 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0805D338:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805D340: .4byte 0x0201774C

	thumb_func_start sub_0805D344
sub_0805D344: @ 0x0805D344
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r1, _0805D378 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805D37C @ =0x08BA3108
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	strh r5, [r0, #0x2c]
	strh r6, [r0, #0x2e]
	adds r0, #0x29
	mov r1, r8
	strb r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805D378: .4byte 0x0201774C
_0805D37C: .4byte 0x08BA3108

	thumb_func_start sub_0805D380
sub_0805D380: @ 0x0805D380
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	subs r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0805D396
	adds r0, r1, #0
	bl Proc_Break
_0805D396:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0805D39C
sub_0805D39C: @ 0x0805D39C
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r1, r0
	ble _0805D3C4
	ldr r1, _0805D3C0 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
	b _0805D422
	.align 2, 0
_0805D3C0: .4byte 0x0201774C
_0805D3C4:
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805D3E0
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	b _0805D3F0
_0805D3E0:
	movs r2, #0x2c
	ldrsh r3, [r4, r2]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
_0805D3F0:
	bl sub_08012FE8
	adds r5, r0, #0
	ldr r3, _0805D42C @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r5, [r0]
	adds r2, #9
	movs r0, #0x10
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x46
	strb r1, [r0]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
_0805D422:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805D42C: .4byte 0x03002870

	thumb_func_start sub_0805D430
sub_0805D430: @ 0x0805D430
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _0805D47C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805D480 @ =0x08BA3128
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x33
	strh r0, [r4, #0x2e]
	ldr r3, _0805D484 @ =0x08BBE6B0
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_0805041C
	str r0, [r4, #0x60]
	ldr r0, _0805D488 @ =0x0826AC3C
	movs r1, #0x20
	bl sub_080505F0
	ldr r0, _0805D48C @ =0x0826A9E8
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_080505C8
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805D47C: .4byte 0x0201774C
_0805D480: .4byte 0x08BA3128
_0805D484: .4byte 0x08BBE6B0
_0805D488: .4byte 0x0826AC3C
_0805D48C: .4byte 0x0826A9E8

	thumb_func_start sub_0805D490
sub_0805D490: @ 0x0805D490
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _0805D4E0 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805D4E4 @ =0x08BA3140
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x33
	strh r0, [r4, #0x2e]
	movs r0, #0x34
	strh r0, [r4, #0x30]
	ldr r3, _0805D4E8 @ =0x08BBE6B0
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_0805041C
	str r0, [r4, #0x60]
	ldr r0, _0805D4EC @ =0x0826AC3C
	movs r1, #0x20
	bl sub_080505F0
	ldr r0, _0805D4F0 @ =0x0826A9E8
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_080505C8
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805D4E0: .4byte 0x0201774C
_0805D4E4: .4byte 0x08BA3140
_0805D4E8: .4byte 0x08BBE6B0
_0805D4EC: .4byte 0x0826AC3C
_0805D4F0: .4byte 0x0826A9E8

	thumb_func_start sub_0805D4F4
sub_0805D4F4: @ 0x0805D4F4
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne _0805D51C
	ldr r0, _0805D524 @ =0x0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl sub_08006650
	adds r0, r4, #0
	bl Proc_Break
_0805D51C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805D524: .4byte 0x0201774C

	thumb_func_start sub_0805D528
sub_0805D528: @ 0x0805D528
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r3, [r2, #0x60]
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	movs r4, #0
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	ldrh r5, [r2, #0x2e]
	lsls r1, r5, #0x10
	cmp r0, r1
	bne _0805D550
	ldr r0, _0805D558 @ =0x08BBE740
	str r0, [r3, #0x24]
	str r0, [r3, #0x20]
	strh r4, [r3, #6]
	strh r4, [r2, #0x2c]
	adds r0, r2, #0
	bl Proc_Break
_0805D550:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805D558: .4byte 0x08BBE740

	thumb_func_start sub_0805D55C
sub_0805D55C: @ 0x0805D55C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne _0805D584
	ldr r0, _0805D58C @ =0x0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl sub_08006650
	adds r0, r4, #0
	bl Proc_Break
_0805D584:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805D58C: .4byte 0x0201774C

	thumb_func_start sub_0805D590
sub_0805D590: @ 0x0805D590
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, _0805D5C0 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805D5C4 @ =0x08BA3160
	movs r1, #3
	bl SpawnProc
	adds r1, r0, #0
	str r5, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	adds r0, r1, #0
	adds r0, #0x29
	strb r4, [r0]
	cmp r4, #0
	bne _0805D5C8
	movs r0, #0x2b
	strh r0, [r1, #0x2e]
	movs r0, #0x44
	b _0805D5CE
	.align 2, 0
_0805D5C0: .4byte 0x0201774C
_0805D5C4: .4byte 0x08BA3160
_0805D5C8:
	movs r0, #0x1f
	strh r0, [r1, #0x2e]
	movs r0, #0x3d
_0805D5CE:
	strh r0, [r1, #0x30]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0805D5D8
sub_0805D5D8: @ 0x0805D5D8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne _0805D696
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805D63E
	ldr r0, _0805D620 @ =0x08BBFC5C
	mov r8, r0
	ldr r7, _0805D624 @ =0x08BC125C
	ldr r0, _0805D628 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805D62C
	ldr r0, [r4, #0x5c]
	bl sub_08054678
	movs r5, #0x88
	cmp r0, #0
	bne _0805D63A
	movs r5, #0x68
	b _0805D63A
	.align 2, 0
_0805D620: .4byte 0x08BBFC5C
_0805D624: .4byte 0x08BC125C
_0805D628: .4byte 0x0203E02C
_0805D62C:
	ldr r0, [r4, #0x5c]
	bl sub_08054678
	movs r5, #0x70
	cmp r0, #0
	bne _0805D63A
	movs r5, #0x80
_0805D63A:
	movs r6, #0x4e
	b _0805D67C
_0805D63E:
	ldr r2, _0805D660 @ =0x08BBFCD0
	mov r8, r2
	ldr r7, _0805D664 @ =0x08BC12D0
	ldr r0, _0805D668 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805D66C
	ldr r0, [r4, #0x5c]
	bl sub_08054678
	movs r5, #0x4c
	cmp r0, #0
	bne _0805D67A
	movs r5, #0xa4
	b _0805D67A
	.align 2, 0
_0805D660: .4byte 0x08BBFCD0
_0805D664: .4byte 0x08BC12D0
_0805D668: .4byte 0x0203E02C
_0805D66C:
	ldr r0, [r4, #0x5c]
	bl sub_08054678
	movs r5, #0x64
	cmp r0, #0
	bne _0805D67A
	movs r5, #0x8c
_0805D67A:
	movs r6, #0x40
_0805D67C:
	ldr r0, [r4, #0x5c]
	mov r2, r8
	str r2, [sp]
	adds r1, r7, #0
	adds r3, r7, #0
	bl sub_0805041C
	str r0, [r4, #0x60]
	strh r5, [r0, #2]
	strh r6, [r0, #4]
	adds r0, r4, #0
	bl Proc_Break
_0805D696:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0805D6A4
sub_0805D6A4: @ 0x0805D6A4
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne _0805D6CC
	ldr r0, _0805D6D4 @ =0x0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl sub_08006650
	adds r0, r4, #0
	bl Proc_Break
_0805D6CC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805D6D4: .4byte 0x0201774C

	thumb_func_start sub_0805D6D8
sub_0805D6D8: @ 0x0805D6D8
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0804FFF0
	bl sub_0804FB6C
	bl sub_08050008
	ldr r0, _0805D704 @ =0x08BA3180
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r2, #0
	movs r1, #0
	strh r1, [r0, #0x2c]
	adds r0, #0x29
	strb r2, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805D704: .4byte 0x08BA3180

	thumb_func_start sub_0805D708
sub_0805D708: @ 0x0805D708
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0804FFF0
	bl sub_0804FB6C
	bl sub_08050008
	ldr r0, _0805D734 @ =0x08BA3180
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	adds r0, #0x29
	movs r1, #1
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805D734: .4byte 0x08BA3180

	thumb_func_start sub_0805D738
sub_0805D738: @ 0x0805D738
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r5, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #1
	bne _0805D768
	ldr r0, [r4, #0x5c]
	bl sub_0805D490
	movs r0, #0xb3
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl sub_080681E4
	b _0805D800
_0805D768:
	cmp r1, #0x34
	bne _0805D780
	ldr r0, [r4, #0x5c]
	bl sub_0805D80C
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	adds r1, #0x29
	ldrb r1, [r1]
	bl sub_0805D8DC
	b _0805D800
_0805D780:
	cmp r1, #0xb7
	bne _0805D7EC
	movs r0, #0x8a
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl sub_080681E4
	ldr r0, [r4, #0x5c]
	bl sub_0805D970
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	adds r1, #0x29
	ldrb r1, [r1]
	bl sub_0805DB34
	ldr r3, _0805D7E8 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	strb r5, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r5, [r0]
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0x14
	movs r3, #0
	bl sub_0805D344
	ldr r0, [r4, #0x5c]
	movs r1, #0xb4
	movs r2, #0x28
	movs r3, #1
	bl sub_0805D344
	b _0805D800
	.align 2, 0
_0805D7E8: .4byte 0x03002870
_0805D7EC:
	ldr r0, _0805D808 @ =0x000001C5
	cmp r1, r0
	bne _0805D800
	bl sub_0804FFFC
	bl sub_0804FBC4
	adds r0, r4, #0
	bl Proc_Break
_0805D800:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805D808: .4byte 0x000001C5

	thumb_func_start sub_0805D80C
sub_0805D80C: @ 0x0805D80C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805D848 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805D84C @ =0x08BA3198
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0805D850 @ =0x081E8DC0
	str r1, [r0, #0x48]
	ldr r1, _0805D854 @ =0x08BA31B0
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, _0805D858 @ =0x08269CF8
	movs r1, #0x80
	lsls r1, r1, #3
	bl sub_0805060C
	bl sub_08050040
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805D848: .4byte 0x0201774C
_0805D84C: .4byte 0x08BA3198
_0805D850: .4byte 0x081E8DC0
_0805D854: .4byte 0x08BA31B0
_0805D858: .4byte 0x08269CF8

	thumb_func_start sub_0805D85C
sub_0805D85C: @ 0x0805D85C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl sub_080547A8
	adds r6, r0, #0
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_080506E4
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	cmp r5, #0
	blt _0805D8B4
	ldr r1, [r4, #0x4c]
	ldr r2, [r4, #0x50]
	lsls r0, r5, #2
	adds r1, r0, r1
	ldr r1, [r1]
	adds r0, r0, r2
	ldr r2, [r0]
	adds r0, r6, #0
	bl sub_080504DC
	ldr r0, _0805D8AC @ =0x081E8DD2
	lsls r1, r5, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	ldr r2, _0805D8B0 @ =0x081E8DDA
	adds r1, r1, r2
	ldrh r2, [r1]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #0
	bl sub_080681E4
	b _0805D8D2
	.align 2, 0
_0805D8AC: .4byte 0x081E8DD2
_0805D8B0: .4byte 0x081E8DDA
_0805D8B4:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	bne _0805D8D2
	bl sub_08050018
	ldr r1, _0805D8D8 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl sub_08050118
	adds r0, r4, #0
	bl Proc_Break
_0805D8D2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805D8D8: .4byte 0x0201774C

	thumb_func_start sub_0805D8DC
sub_0805D8DC: @ 0x0805D8DC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0805D908 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805D90C @ =0x08BA31C0
	movs r1, #3
	bl SpawnProc
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	str r0, [r1, #0x44]
	ldr r0, _0805D910 @ =0x081E8DE2
	str r0, [r1, #0x48]
	cmp r5, #0
	bne _0805D918
	ldr r0, _0805D914 @ =0x0826D3D4
	b _0805D91A
	.align 2, 0
_0805D908: .4byte 0x0201774C
_0805D90C: .4byte 0x08BA31C0
_0805D910: .4byte 0x081E8DE2
_0805D914: .4byte 0x0826D3D4
_0805D918:
	ldr r0, _0805D924 @ =0x0826D5D4
_0805D91A:
	str r0, [r1, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805D924: .4byte 0x0826D5D4

	thumb_func_start sub_0805D928
sub_0805D928: @ 0x0805D928
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_080506E4
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _0805D94E
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl sub_08050634
	b _0805D964
_0805D94E:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0805D964
	ldr r1, _0805D96C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0805D964:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805D96C: .4byte 0x0201774C

	thumb_func_start sub_0805D970
sub_0805D970: @ 0x0805D970
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	ldr r1, _0805DA2C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805DA30 @ =0x08BA31E0
	movs r1, #3
	bl SpawnProc
	str r5, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0805DA34 @ =0x081E8EE4
	str r1, [r0, #0x48]
	ldr r1, _0805DA38 @ =0x08BA31F8
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, _0805DA3C @ =0x0826AC5C
	movs r1, #0xa8
	lsls r1, r1, #5
	bl sub_0805060C
	ldr r6, _0805DA40 @ =0x03002870
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r6, #0xc]
	ands r0, r2
	strb r0, [r6, #0xc]
	adds r0, r1, #0
	ldrb r2, [r6, #0x14]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r6, #0x14]
	ldrb r0, [r6, #0x10]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r6, #0x10]
	movs r0, #3
	ldrb r1, [r6, #0x18]
	orrs r0, r1
	strb r0, [r6, #0x18]
	bl sub_0805076C
	ldr r2, _0805DA44 @ =0x0000F3FF
	mov r8, r2
	mov r0, r8
	ldrh r1, [r5, #8]
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r7, r2, #0
	orrs r0, r7
	strh r0, [r5, #8]
	ldr r4, _0805DA48 @ =0x02000010
	adds r0, r5, #0
	bl sub_08054678
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, [r0]
	cmp r1, #0
	beq _0805DA04
	mov r0, r8
	ldrh r2, [r1, #8]
	ands r0, r2
	orrs r0, r7
	strh r0, [r1, #8]
_0805DA04:
	bl sub_08050040
	ldr r0, _0805DA4C @ =0x0000FFE0
	ldrh r1, [r6, #0x3c]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	ldr r1, _0805DA50 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r6, #0x3c]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805DA2C: .4byte 0x0201774C
_0805DA30: .4byte 0x08BA31E0
_0805DA34: .4byte 0x081E8EE4
_0805DA38: .4byte 0x08BA31F8
_0805DA3C: .4byte 0x0826AC5C
_0805DA40: .4byte 0x03002870
_0805DA44: .4byte 0x0000F3FF
_0805DA48: .4byte 0x02000010
_0805DA4C: .4byte 0x0000FFE0
_0805DA50: .4byte 0x0000E0FF

	thumb_func_start sub_0805DA54
sub_0805DA54: @ 0x0805DA54
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r6, [r5, #0x5c]
	adds r0, r6, #0
	bl sub_080547A8
	adds r7, r0, #0
	ldr r4, _0805DAB0 @ =0x02000010
	adds r0, r6, #0
	bl sub_08054678
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r4, [r0]
	cmp r4, #0
	beq _0805DA84
	ldr r0, _0805DAB4 @ =0x0000F3FF
	ldrh r1, [r4, #8]
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4, #8]
_0805DA84:
	adds r0, r5, #0
	adds r0, #0x2c
	adds r1, r5, #0
	adds r1, #0x44
	ldr r2, [r5, #0x48]
	bl sub_080506E4
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt _0805DAB8
	ldr r1, [r5, #0x4c]
	ldr r2, [r5, #0x50]
	lsls r0, r3, #2
	adds r1, r0, r1
	ldr r1, [r1]
	adds r0, r0, r2
	ldr r2, [r0]
	adds r0, r7, #0
	bl sub_080504DC
	b _0805DB22
	.align 2, 0
_0805DAB0: .4byte 0x02000010
_0805DAB4: .4byte 0x0000F3FF
_0805DAB8:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, r0
	bne _0805DB22
	bl sub_08050018
	ldr r1, _0805DB28 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	ldr r3, _0805DB2C @ =0x03002870
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r2, [r3, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
	ldr r2, _0805DB30 @ =0x0000F3FF
	adds r0, r2, #0
	ldrh r3, [r6, #8]
	ands r0, r3
	movs r3, #0x80
	lsls r3, r3, #4
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r6, #8]
	cmp r4, #0
	beq _0805DB18
	adds r0, r2, #0
	ldrh r2, [r4, #8]
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, #8]
_0805DB18:
	bl sub_08050118
	adds r0, r5, #0
	bl Proc_Break
_0805DB22:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805DB28: .4byte 0x0201774C
_0805DB2C: .4byte 0x03002870
_0805DB30: .4byte 0x0000F3FF

	thumb_func_start sub_0805DB34
sub_0805DB34: @ 0x0805DB34
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0805DB60 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805DB64 @ =0x08BA31FC
	movs r1, #3
	bl SpawnProc
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	str r0, [r1, #0x44]
	ldr r0, _0805DB68 @ =0x081E8EEA
	str r0, [r1, #0x48]
	cmp r5, #0
	bne _0805DB70
	ldr r0, _0805DB6C @ =0x0826A7E8
	b _0805DB72
	.align 2, 0
_0805DB60: .4byte 0x0201774C
_0805DB64: .4byte 0x08BA31FC
_0805DB68: .4byte 0x081E8EEA
_0805DB6C: .4byte 0x0826A7E8
_0805DB70:
	ldr r0, _0805DB7C @ =0x0826D7D4
_0805DB72:
	str r0, [r1, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805DB7C: .4byte 0x0826D7D4

	thumb_func_start sub_0805DB80
sub_0805DB80: @ 0x0805DB80
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_080506E4
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _0805DBA6
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl sub_08050634
	b _0805DBBC
_0805DBA6:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0805DBBC
	ldr r1, _0805DBC4 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0805DBBC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805DBC4: .4byte 0x0201774C

	thumb_func_start sub_0805DBC8
sub_0805DBC8: @ 0x0805DBC8
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_0804FFF0
	bl sub_0804FB6C
	bl sub_08050008
	ldr r0, _0805DC00 @ =0x08BA321C
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl sub_08054804
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_0805468C
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805DC00: .4byte 0x08BA321C

	thumb_func_start sub_0805DC04
sub_0805DC04: @ 0x0805DC04
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl sub_080547A8
	adds r6, r0, #0
	bl sub_08050778
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r1, #0
	mov r8, r1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805DC3A
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804E498
_0805DC3A:
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	adds r0, r5, #1
	cmp r1, r0
	bne _0805DCB0
	adds r0, r6, #0
	bl sub_0805DD28
	movs r5, #8
	str r5, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x28
	movs r2, #0x1e
	movs r3, #0x10
	bl sub_08055F08
	movs r4, #0x10
	str r4, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x47
	movs r2, #0x1e
	movs r3, #8
	bl sub_08055F08
	str r5, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x66
	movs r2, #0x1e
	movs r3, #0x10
	bl sub_08055F08
	str r4, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x85
	movs r2, #0x1e
	movs r3, #8
	bl sub_08055F08
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0xa4
	movs r2, #0x3c
	movs r3, #0x10
	bl sub_08055F08
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #2
	ldrsh r2, [r6, r0]
	movs r0, #0xfd
	movs r3, #1
	bl sub_080681E4
	b _0805DD1C
_0805DCB0:
	adds r0, r5, #0
	adds r0, #0x50
	cmp r1, r0
	bne _0805DCC0
	adds r0, r6, #0
	bl sub_0805DDE0
	b _0805DD1C
_0805DCC0:
	adds r0, r5, #0
	adds r0, #0xa4
	cmp r1, r0
	bne _0805DCD6
	adds r0, r6, #0
	movs r1, #1
	movs r2, #5
	movs r3, #0
	bl sub_0804F598
	b _0805DD1C
_0805DCD6:
	adds r0, r5, #0
	adds r0, #0xc8
	cmp r1, r0
	bne _0805DCFC
	movs r0, #9
	ldrh r1, [r6, #0x10]
	orrs r0, r1
	strh r0, [r6, #0x10]
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r0, r6, #0
	bl sub_080503E0
	adds r0, r6, #0
	movs r1, #0
	bl sub_0804F810
	b _0805DD1C
_0805DCFC:
	movs r2, #0x96
	lsls r2, r2, #1
	adds r0, r5, r2
	cmp r1, r0
	bne _0805DD1C
	movs r0, #2
	ldrh r1, [r6, #0x10]
	orrs r0, r1
	strh r0, [r6, #0x10]
	bl sub_0804FFFC
	bl sub_0804FBC4
	adds r0, r4, #0
	bl Proc_Break
_0805DD1C:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0805DD28
sub_0805DD28: @ 0x0805DD28
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805DD64 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805DD68 @ =0x08BA3234
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0805DD6C @ =0x081E8FC8
	str r1, [r0, #0x48]
	ldr r1, _0805DD70 @ =0x08BA324C
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _0805DD74 @ =0x08BA3280
	str r1, [r0, #0x54]
	ldr r0, _0805DD78 @ =0x08270258
	movs r1, #0x20
	bl sub_08050634
	bl sub_08050040
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805DD64: .4byte 0x0201774C
_0805DD68: .4byte 0x08BA3234
_0805DD6C: .4byte 0x081E8FC8
_0805DD70: .4byte 0x08BA324C
_0805DD74: .4byte 0x08BA3280
_0805DD78: .4byte 0x08270258

	thumb_func_start sub_0805DD7C
sub_0805DD7C: @ 0x0805DD7C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_080506E4
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt _0805DDB8
	ldr r1, [r4, #0x4c]
	ldr r2, [r4, #0x50]
	ldr r5, [r4, #0x54]
	ldr r0, [r4, #0x5c]
	lsls r4, r3, #2
	adds r1, r4, r1
	ldr r1, [r1]
	adds r2, r4, r2
	ldr r2, [r2]
	bl sub_080504DC
	adds r4, r4, r5
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_0805060C
	b _0805DDD6
_0805DDB8:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, r0
	bne _0805DDD6
	bl sub_08050018
	ldr r1, _0805DDDC @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl sub_08050118
	adds r0, r4, #0
	bl Proc_Break
_0805DDD6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805DDDC: .4byte 0x0201774C

	thumb_func_start sub_0805DDE0
sub_0805DDE0: @ 0x0805DDE0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _0805DE1C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805DE20 @ =0x08BA32B4
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	ldr r3, _0805DE24 @ =0x08BC4044
	str r3, [sp]
	adds r0, r4, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_0805041C
	adds r6, r0, #0
	str r6, [r5, #0x60]
	adds r0, r4, #0
	bl sub_08054678
	cmp r0, #0
	bne _0805DE28
	ldrh r0, [r6, #2]
	subs r0, #8
	b _0805DE2C
	.align 2, 0
_0805DE1C: .4byte 0x0201774C
_0805DE20: .4byte 0x08BA32B4
_0805DE24: .4byte 0x08BC4044
_0805DE28:
	ldrh r0, [r6, #2]
	adds r0, #8
_0805DE2C:
	strh r0, [r6, #2]
	ldrh r0, [r6, #4]
	subs r0, #8
	strh r0, [r6, #4]
	ldr r0, _0805DE50 @ =0x08276198
	movs r1, #0x20
	bl sub_080505F0
	ldr r0, _0805DE54 @ =0x08275FB0
	movs r1, #0x80
	lsls r1, r1, #4
	bl sub_080505C8
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805DE50: .4byte 0x08276198
_0805DE54: .4byte 0x08275FB0

	thumb_func_start sub_0805DE58
sub_0805DE58: @ 0x0805DE58
	ldr r1, _0805DE64 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_0805DE64: .4byte 0x0201774C

	thumb_func_start sub_0805DE68
sub_0805DE68: @ 0x0805DE68
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_0804FFF0
	bl sub_0804FB6C
	bl sub_08050008
	ldr r0, _0805DEA0 @ =0x08BA32D4
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl sub_08054804
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_0805468C
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805DEA0: .4byte 0x08BA32D4

	thumb_func_start sub_0805DEA4
sub_0805DEA4: @ 0x0805DEA4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl sub_080547A8
	adds r5, r0, #0
	bl sub_08050778
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r1, #0
	mov r8, r1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805DEE8
	ldr r0, [r4, #0x5c]
	bl sub_0805E090
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xfa
	movs r3, #1
	bl sub_080681E4
_0805DEE8:
	ldrh r0, [r4, #0x2c]
	cmp r0, #0x29
	bne _0805DEFA
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0804E498
	b _0805DF9E
_0805DEFA:
	movs r3, #0x2c
	ldrsh r1, [r4, r3]
	adds r0, r6, #0
	adds r0, #0x44
	cmp r1, r0
	bne _0805DF2E
	ldr r0, [r4, #0x5c]
	bl sub_0805DFAC
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #2
	ldrsh r2, [r5, r0]
	movs r0, #0xfb
	movs r3, #1
	bl sub_080681E4
	ldr r0, [r4, #0x5c]
	str r7, [sp]
	str r7, [sp, #4]
	movs r1, #0x42
	movs r2, #0x14
	movs r3, #0x10
	bl sub_08055F08
	b _0805DF9E
_0805DF2E:
	adds r0, r6, #0
	adds r0, #0x86
	cmp r1, r0
	bne _0805DF80
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r0, #0xfc
	movs r3, #1
	bl sub_080681E4
	bl sub_080676B4
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r6, r4, #0
	adds r6, #0x29
	ldrb r1, [r6]
	adds r0, r5, #0
	bl sub_080503E0
	ldr r0, [r4, #0x5c]
	movs r1, #0xa
	bl sub_0804EFDC
	ldrb r0, [r6]
	cmp r0, #0
	bne _0805DF9E
	adds r0, r5, #0
	bl sub_0804F840
	cmp r0, #0
	bne _0805DF9E
	adds r0, r5, #0
	movs r1, #3
	bl sub_0804F810
	b _0805DF9E
_0805DF80:
	adds r0, r6, #0
	adds r0, #0x9e
	cmp r1, r0
	bne _0805DF9E
	movs r0, #2
	ldrh r3, [r5, #0x10]
	orrs r0, r3
	strh r0, [r5, #0x10]
	bl sub_0804FFFC
	bl sub_0804FBC4
	adds r0, r4, #0
	bl Proc_Break
_0805DF9E:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0805DFAC
sub_0805DFAC: @ 0x0805DFAC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _0805E00C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805E010 @ =0x08BA32EC
	movs r1, #3
	bl SpawnProc
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _0805E014 @ =0x081E8FFE
	str r0, [r5, #0x48]
	ldr r0, _0805E018 @ =0x08BA3304
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _0805E01C @ =0x08272D9C
	movs r1, #0x20
	bl sub_08050634
	ldr r0, _0805E020 @ =0x08270E90
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_0805060C
	bl sub_08050040
	ldr r0, _0805E024 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805E032
	ldr r0, [r5, #0x5c]
	bl sub_08054678
	cmp r0, #0
	bne _0805E028
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
	b _0805E032
	.align 2, 0
_0805E00C: .4byte 0x0201774C
_0805E010: .4byte 0x08BA32EC
_0805E014: .4byte 0x081E8FFE
_0805E018: .4byte 0x08BA3304
_0805E01C: .4byte 0x08272D9C
_0805E020: .4byte 0x08270E90
_0805E024: .4byte 0x0203E02C
_0805E028:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
_0805E032:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0805E038
sub_0805E038: @ 0x0805E038
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_080506E4
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _0805E066
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl sub_080504DC
	b _0805E084
_0805E066:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _0805E084
	bl sub_08050018
	ldr r1, _0805E08C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl sub_08050118
	adds r0, r4, #0
	bl Proc_Break
_0805E084:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805E08C: .4byte 0x0201774C

	thumb_func_start sub_0805E090
sub_0805E090: @ 0x0805E090
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _0805E0D4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805E0D8 @ =0x08BA334C
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, _0805E0DC @ =0x08BC4310
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_0805041C
	str r0, [r4, #0x60]
	ldr r0, _0805E0E0 @ =0x08272D9C
	movs r1, #0x20
	bl sub_080505F0
	ldr r0, _0805E0E4 @ =0x0827287C
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_080505C8
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805E0D4: .4byte 0x0201774C
_0805E0D8: .4byte 0x08BA334C
_0805E0DC: .4byte 0x08BC4310
_0805E0E0: .4byte 0x08272D9C
_0805E0E4: .4byte 0x0827287C

	thumb_func_start sub_0805E0E8
sub_0805E0E8: @ 0x0805E0E8
	push {lr}
	ldr r0, [r0, #0x60]
	bl sub_08006650
	ldr r1, _0805E0FC @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0805E0FC: .4byte 0x0201774C

	thumb_func_start sub_0805E100
sub_0805E100: @ 0x0805E100
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_0804FFF0
	bl sub_0804FB6C
	bl sub_08050008
	ldr r0, _0805E138 @ =0x08BA336C
	movs r1, #3
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl sub_08054804
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_0805468C
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805E138: .4byte 0x08BA336C

