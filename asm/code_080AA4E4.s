	.include "macro.inc"

	.syntax unified

	thumb_func_start BmBgfx_Loop
BmBgfx_Loop: @ 0x080AA4E4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	ldr r6, [r5, #0x2c]
	ldr r0, [r5, #0x58]
	cmp r0, #0
	beq _080AA518
	adds r1, r5, #0
	adds r1, #0x39
	movs r0, #0
	strb r0, [r1]
	ldr r1, [r5, #0x58]
	adds r0, r5, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AA50E
	b _080AA6D8
_080AA50E:
	b _080AA51A
_080AA510:
	adds r0, r5, #0
	bl Proc_Break
	b _080AA6D0
_080AA518:
	str r0, [r5, #0x58]
_080AA51A:
	movs r0, #0x37
	adds r0, r0, r5
	mov sb, r0
_080AA520:
	ldrb r1, [r6]
	cmp r1, #4
	bne _080AA528
	adds r6, #0xc
_080AA528:
	ldrb r2, [r6]
	cmp r2, #5
	bne _080AA57A
	adds r0, r5, #0
	adds r0, #0x3a
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	beq _080AA572
	subs r0, #4
	ldrb r3, [r0]
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r2, r0, #0
	cmp r1, #0
	bne _080AA54C
	ldrb r0, [r6, #0xa]
	b _080AA552
_080AA54C:
	cmp r1, #0
	ble _080AA554
	subs r0, r3, #1
_080AA552:
	strb r0, [r2]
_080AA554:
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	beq _080AA578
	adds r0, r6, #0
	subs r0, #0xc
	ldrb r3, [r0]
	cmp r3, #4
	beq _080AA57A
_080AA566:
	adds r6, r0, #0
	subs r0, #0xc
	ldrb r4, [r0]
	cmp r4, #4
	bne _080AA566
	b _080AA57A
_080AA572:
	adds r0, r5, #0
	adds r0, #0x36
	strb r1, [r0]
_080AA578:
	adds r6, #0xc
_080AA57A:
	ldrb r0, [r6]
	cmp r0, #8
	bne _080AA59E
	ldr r0, [r5, #0x58]
	cmp r0, #0
	beq _080AA59C
	ldr r0, [r5, #0x54]
	adds r0, #1
	str r0, [r5, #0x54]
	adds r1, r5, #0
	adds r1, #0x39
	movs r0, #1
	strb r0, [r1]
	ldr r1, [r5, #0x58]
	adds r0, r5, #0
	bl _call_via_r1
_080AA59C:
	adds r6, #0xc
_080AA59E:
	ldrb r0, [r6]
	cmp r0, #6
	bne _080AA5A6
	b _080AA6D0
_080AA5A6:
	subs r0, #9
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _080AA510
	adds r0, r5, #0
	adds r0, #0x38
	ldrb r1, [r0]
	mov r8, r0
	cmp r1, #0
	bne _080AA6B6
	ldrb r0, [r6]
	cmp r0, #1
	bgt _080AA5D8
	cmp r0, #0
	blt _080AA5D8
	ldr r0, [r5, #0x44]
	cmp r0, #0
	bne _080AA5D8
	movs r0, #1
	mov r1, sb
	ldrb r1, [r1]
	subs r0, r0, r1
	mov r2, sb
	strb r0, [r2]
_080AA5D8:
	ldrb r0, [r6]
	cmp r0, #1
	beq _080AA618
	cmp r0, #1
	bgt _080AA5E8
	cmp r0, #0
	beq _080AA5F2
	b _080AA6B6
_080AA5E8:
	cmp r0, #2
	beq _080AA642
	cmp r0, #3
	beq _080AA6A4
	b _080AA6B6
_080AA5F2:
	ldr r0, [r6, #4]
	ldr r2, [r5, #0x40]
	movs r3, #0xc0
	lsls r3, r3, #0x13
	adds r2, r2, r3
	ldr r1, [r5, #0x3c]
	adds r1, r1, r2
	ldr r2, [r5, #0x44]
	adds r1, r1, r2
	ldr r2, [r5, #0x48]
	mov r4, sb
	ldrb r4, [r4]
	muls r2, r4, r2
	adds r1, r1, r2
	ldrh r3, [r6, #8]
	lsrs r2, r3, #2
	bl CpuFastSet
	b _080AA638
_080AA618:
	ldr r0, [r6, #4]
	ldr r2, [r5, #0x40]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r2, r2, r1
	ldr r1, [r5, #0x3c]
	adds r1, r1, r2
	ldr r2, [r5, #0x44]
	adds r1, r1, r2
	ldr r2, [r5, #0x48]
	mov r3, sb
	ldrb r3, [r3]
	muls r2, r3, r2
	adds r1, r1, r2
	bl Decompress
_080AA638:
	ldr r0, [r5, #0x44]
	ldrh r4, [r6, #8]
	adds r0, r4, r0
	str r0, [r5, #0x44]
	b _080AA6B6
_080AA642:
	ldr r1, [r5, #0x48]
	movs r0, #0x80
	lsls r0, r0, #8
	adds r4, r5, #0
	adds r4, #0x37
	adds r7, r5, #0
	adds r7, #0x34
	cmp r1, r0
	bne _080AA668
	ldrb r0, [r7]
	mov r1, sb
	ldrb r1, [r1]
	lsls r2, r1, #0xf
	ldr r1, [r5, #0x3c]
	adds r1, r1, r2
	ldr r2, _080AA6A0 @ =0x0000FFFF
	ands r1, r2
	bl SetBgChrOffset
_080AA668:
	ldrb r0, [r7]
	bl GetBgTilemap
	ldr r1, [r6, #4]
	adds r2, r5, #0
	adds r2, #0x35
	ldrb r2, [r2]
	lsls r2, r2, #0xc
	ldr r3, [r5, #0x48]
	ldrb r4, [r4]
	muls r4, r3, r4
	ldr r3, [r5, #0x40]
	adds r3, r3, r4
	lsls r3, r3, #0x11
	lsrs r3, r3, #0x16
	adds r2, r2, r3
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	bl sub_080AACD8
	movs r0, #0
	str r0, [r5, #0x44]
	movs r0, #1
	ldrb r7, [r7]
	lsls r0, r7
	bl EnableBgSync
	b _080AA6B6
	.align 2, 0
_080AA6A0: .4byte 0x0000FFFF
_080AA6A4:
	ldr r0, [r6, #4]
	adds r1, r5, #0
	adds r1, #0x35
	ldrb r1, [r1]
	lsls r1, r1, #5
	ldrh r3, [r6, #8]
	lsls r2, r3, #5
	bl ApplyPaletteExt
_080AA6B6:
	mov r4, r8
	ldrb r0, [r4]
	adds r0, #1
	movs r1, #0
	strb r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r2, [r6, #0xa]
	cmp r0, r2
	bls _080AA6D0
	adds r6, #0xc
	strb r1, [r4]
	b _080AA520
_080AA6D0:
	str r6, [r5, #0x2c]
	ldr r0, [r5, #0x50]
	adds r0, #1
	str r0, [r5, #0x50]
_080AA6D8:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
