	.include "macro.inc"

	.syntax unified

	thumb_func_start StartLockingPaletteFadeToBlack
StartLockingPaletteFadeToBlack: @ 0x080AA308
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AA328 @ =0x08CE4C80
	bl SpawnProcLocking
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #0
	strb r1, [r2]
	str r4, [r0, #0x30]
	subs r1, #1
	str r1, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AA328: .4byte 0x08CE4C80

	thumb_func_start sub_080AA32C
sub_080AA32C: @ 0x080AA32C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AA34C @ =0x08CE4C50
	movs r1, #4
	bl SpawnProc
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #0
	strb r1, [r2]
	str r4, [r0, #0x30]
	ldr r1, _080AA350 @ =0x0000FFFF
	str r1, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AA34C: .4byte 0x08CE4C50
_080AA350: .4byte 0x0000FFFF

	thumb_func_start sub_080AA354
sub_080AA354: @ 0x080AA354
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AA374 @ =0x08CE4C80
	movs r1, #4
	bl SpawnProc
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #0
	strb r1, [r2]
	str r4, [r0, #0x30]
	ldr r1, _080AA378 @ =0x0000FFFF
	str r1, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AA374: .4byte 0x08CE4C80
_080AA378: .4byte 0x0000FFFF

	thumb_func_start sub_080AA37C
sub_080AA37C: @ 0x080AA37C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AA39C @ =0x08CE4C50
	movs r1, #4
	bl SpawnProc
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #1
	strb r1, [r2]
	str r4, [r0, #0x30]
	subs r1, #2
	str r1, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AA39C: .4byte 0x08CE4C50

	thumb_func_start sub_080AA3A0
sub_080AA3A0: @ 0x080AA3A0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AA3C0 @ =0x08CE4C80
	movs r1, #4
	bl SpawnProc
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #1
	strb r1, [r2]
	str r4, [r0, #0x30]
	subs r1, #2
	str r1, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AA3C0: .4byte 0x08CE4C80

	thumb_func_start sub_080AA3C4
sub_080AA3C4: @ 0x080AA3C4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AA3E4 @ =0x08CE4C50
	bl SpawnProcLocking
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #1
	strb r1, [r2]
	str r4, [r0, #0x30]
	subs r1, #2
	str r1, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AA3E4: .4byte 0x08CE4C50

	thumb_func_start sub_080AA3E8
sub_080AA3E8: @ 0x080AA3E8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AA408 @ =0x08CE4C80
	bl SpawnProcLocking
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #1
	strb r1, [r2]
	str r4, [r0, #0x30]
	subs r1, #2
	str r1, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AA408: .4byte 0x08CE4C80

	thumb_func_start sub_080AA40C
sub_080AA40C: @ 0x080AA40C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AA42C @ =0x08CE4C50
	movs r1, #4
	bl SpawnProc
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #1
	strb r1, [r2]
	str r4, [r0, #0x30]
	ldr r1, _080AA430 @ =0x0000FFFF
	str r1, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AA42C: .4byte 0x08CE4C50
_080AA430: .4byte 0x0000FFFF

	thumb_func_start sub_080AA434
sub_080AA434: @ 0x080AA434
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AA454 @ =0x08CE4C80
	movs r1, #4
	bl SpawnProc
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #1
	strb r1, [r2]
	str r4, [r0, #0x30]
	ldr r1, _080AA458 @ =0x0000FFFF
	str r1, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AA454: .4byte 0x08CE4C80
_080AA458: .4byte 0x0000FFFF

	thumb_func_start sub_080AA45C
sub_080AA45C: @ 0x080AA45C
	push {lr}
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	ldr r1, _080AA478 @ =0x02022860
	ldr r2, _080AA47C @ =0x01000100
	mov r0, sp
	bl CpuFastSet
	bl EnablePalSync
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080AA478: .4byte 0x02022860
_080AA47C: .4byte 0x01000100

	thumb_func_start sub_080AA480
sub_080AA480: @ 0x080AA480
	push {lr}
	ldr r0, _080AA49C @ =0x08CE4C50
	bl Proc_Find
	bl Proc_End
	ldr r0, _080AA4A0 @ =0x08CE4C80
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080AA49C: .4byte 0x08CE4C50
_080AA4A0: .4byte 0x08CE4C80

	thumb_func_start sub_080AA4A4
sub_080AA4A4: @ 0x080AA4A4
	adds r2, r0, #0
	movs r0, #0
	str r0, [r2, #0x2c]
	adds r1, r2, #0
	adds r1, #0x34
	strb r0, [r1]
	str r0, [r2, #0x3c]
	str r0, [r2, #0x44]
	str r0, [r2, #0x40]
	str r0, [r2, #0x48]
	adds r1, #3
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	str r0, [r2, #0x4c]
	str r0, [r2, #0x50]
	str r0, [r2, #0x58]
	adds r1, #1
	strb r0, [r1]
	str r0, [r2, #0x54]
	movs r1, #0
	strh r0, [r2, #0x30]
	strh r0, [r2, #0x32]
	adds r3, r2, #0
	adds r3, #0x3a
	movs r0, #1
	strb r0, [r3]
	adds r0, r2, #0
	adds r0, #0x36
	strb r1, [r0]
	bx lr
	.align 2, 0

	thumb_func_start sub_080AA4E4
sub_080AA4E4: @ 0x080AA4E4
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
	bl sub_08001434
_080AA668:
	ldrb r0, [r7]
	bl sub_08002BE8
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

	thumb_func_start sub_080AA6E4
sub_080AA6E4: @ 0x080AA6E4
	push {r4, lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x2c]
	ldrb r0, [r0]
	cmp r0, #0xa
	bne _080AA712
	adds r4, r1, #0
	adds r4, #0x34
	ldrb r0, [r4]
	ldr r1, [r1, #0x3c]
	bl sub_08001434
	ldrb r0, [r4]
	bl sub_08002BE8
	movs r1, #0
	bl TmFill
	movs r0, #1
	ldrb r4, [r4]
	lsls r0, r4
	bl EnableBgSync
_080AA712:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080AA718
sub_080AA718: @ 0x080AA718
	push {lr}
	ldr r0, _080AA728 @ =0x08CE4CB0
	bl Proc_Find
	cmp r0, #0
	bne _080AA72C
	movs r0, #0
	b _080AA72E
	.align 2, 0
_080AA728: .4byte 0x08CE4CB0
_080AA72C:
	movs r0, #1
_080AA72E:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080AA734
sub_080AA734: @ 0x080AA734
	push {lr}
	ldr r0, _080AA754 @ =0x08CE4CB0
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080AA74E
	ldr r0, [r1, #0x2c]
	ldrb r2, [r0]
	cmp r2, #6
	bne _080AA74E
	adds r0, #0xc
	str r0, [r1, #0x2c]
_080AA74E:
	pop {r0}
	bx r0
	.align 2, 0
_080AA754: .4byte 0x08CE4CB0

	thumb_func_start sub_080AA758
sub_080AA758: @ 0x080AA758
	push {lr}
	ldr r0, _080AA768 @ =0x08CE4CB0
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080AA768: .4byte 0x08CE4CB0

	thumb_func_start sub_080AA76C
sub_080AA76C: @ 0x080AA76C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080AA788 @ =0x08CE4CB0
	bl Proc_Find
	cmp r0, #0
	beq _080AA780
	adds r0, #0x3a
	strb r4, [r0]
_080AA780:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AA788: .4byte 0x08CE4CB0

	thumb_func_start sub_080AA78C
sub_080AA78C: @ 0x080AA78C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	mov r8, r1
	mov sb, r2
	mov sl, r3
	ldr r6, [sp, #0x20]
	ldr r7, [sp, #0x24]
	ldr r1, [sp, #0x30]
	cmp r1, #0
	bne _080AA7B4
	ldr r0, _080AA7B0 @ =0x08CE4CB0
	movs r1, #3
	b _080AA7B6
	.align 2, 0
_080AA7B0: .4byte 0x08CE4CB0
_080AA7B4:
	ldr r0, _080AA830 @ =0x08CE4CB0
_080AA7B6:
	bl SpawnProc
	adds r4, r0, #0
	str r5, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x34
	mov r1, r8
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x35
	ldr r0, [sp, #0x28]
	strb r0, [r1]
	cmp r7, #0
	bge _080AA7D6
	movs r7, #0x80
	lsls r7, r7, #7
_080AA7D6:
	cmp r6, #0
	bge _080AA7DC
	movs r6, #0
_080AA7DC:
	mov r0, r8
	bl GetBgChrOffset
	str r0, [r4, #0x3c]
	str r6, [r4, #0x40]
	str r7, [r4, #0x48]
	mov r2, sb
	strh r2, [r4, #0x30]
	mov r6, sl
	strh r6, [r4, #0x32]
	ldr r0, [sp, #0x2c]
	str r0, [r4, #0x58]
	mov r1, r8
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	mov r2, sb
	rsbs r1, r2, #0
	movs r3, #0xff
	ands r1, r3
	mov r6, sl
	rsbs r2, r6, #0
	ands r2, r3
	bl SetBgOffset
	ldrb r0, [r5]
	cmp r0, #9
	bhi _080AA822
_080AA812:
	ldr r0, [r4, #0x4c]
	ldrb r1, [r5, #0xa]
	adds r0, r1, r0
	str r0, [r4, #0x4c]
	adds r5, #0xc
	ldrb r2, [r5]
	cmp r2, #9
	bls _080AA812
_080AA822:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AA830: .4byte 0x08CE4CB0

	thumb_func_start sub_080AA834
sub_080AA834: @ 0x080AA834
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r1, #0
	ldr r1, [r0, #0x30]
	lsls r1, r1, #5
	ldr r2, _080AA8F4 @ =0x02022860
	adds r1, r1, r2
	mov r8, r1
	ldr r1, [r0, #0x3c]
	mov ip, r1
	ldr r7, [r0, #0x40]
	movs r1, #0
	ldr r0, [r0, #0x34]
	cmp r1, r0
	bge _080AA8E0
	str r0, [sp, #4]
	movs r0, #0x80
	subs r5, r0, r6
	movs r0, #0xf8
	lsls r0, r0, #7
	mov sl, r0
_080AA866:
	adds r1, #1
	str r1, [sp]
	movs r1, #0xf
	mov sb, r1
_080AA86E:
	mov r0, ip
	ldrh r4, [r0]
	movs r0, #0x1f
	ands r0, r4
	adds r2, r0, #0
	muls r2, r5, r2
	ldrh r3, [r7]
	movs r0, #0x1f
	ands r0, r3
	muls r0, r6, r0
	adds r2, r2, r0
	asrs r2, r2, #7
	movs r1, #0x1f
	ands r2, r1
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r0, r4
	adds r1, r0, #0
	muls r1, r5, r1
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r0, r3
	muls r0, r6, r0
	adds r1, r1, r0
	asrs r1, r1, #7
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r1, r0
	adds r2, r2, r1
	mov r0, sl
	ands r0, r4
	adds r1, r0, #0
	muls r1, r5, r1
	mov r0, sl
	ands r0, r3
	muls r0, r6, r0
	adds r1, r1, r0
	asrs r1, r1, #7
	mov r0, sl
	ands r1, r0
	adds r2, r2, r1
	mov r1, r8
	strh r2, [r1]
	movs r0, #2
	add r8, r0
	add ip, r0
	adds r7, #2
	movs r1, #1
	rsbs r1, r1, #0
	add sb, r1
	mov r0, sb
	cmp r0, #0
	bge _080AA86E
	ldr r1, [sp]
	ldr r0, [sp, #4]
	cmp r1, r0
	blt _080AA866
_080AA8E0:
	bl EnablePalSync
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AA8F4: .4byte 0x02022860

	thumb_func_start sub_080AA8F8
sub_080AA8F8: @ 0x080AA8F8
	movs r1, #0
	str r1, [r0, #0x38]
	bx lr
	.align 2, 0

	thumb_func_start sub_080AA900
sub_080AA900: @ 0x080AA900
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x38]
	ldr r1, [r2, #0x2c]
	adds r0, r0, r1
	str r0, [r2, #0x38]
	movs r1, #0x80
	lsls r1, r1, #1
	cmp r0, r1
	ble _080AA918
	movs r0, #0
	str r0, [r2, #0x38]
_080AA918:
	ldr r0, [r2, #0x38]
	subs r1, r1, r0
	cmp r0, #0x7f
	bgt _080AA922
	adds r1, r0, #0
_080AA922:
	adds r0, r2, #0
	bl sub_080AA834
	pop {r0}
	bx r0

	thumb_func_start sub_080AA92C
sub_080AA92C: @ 0x080AA92C
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	mov r8, r0
	mov sb, r1
	adds r4, r2, #0
	adds r5, r3, #0
	ldr r6, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	ldr r0, _080AA960 @ =0x08CE4CD8
	bl SpawnProc
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	str r6, [r0, #0x34]
	mov r1, r8
	str r1, [r0, #0x3c]
	mov r1, sb
	str r1, [r0, #0x40]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AA960: .4byte 0x08CE4CD8

	thumb_func_start sub_080AA964
sub_080AA964: @ 0x080AA964
	push {lr}
	ldr r0, _080AA974 @ =0x08CE4CD8
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080AA974: .4byte 0x08CE4CD8

	thumb_func_start sub_080AA978
sub_080AA978: @ 0x080AA978
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	mov sb, r3
	ldr r4, [sp, #0x2c]
	ldr r0, [sp, #0x34]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r7, r0, #0
	cmp r5, #0
	beq _080AA9A8
	ldr r1, _080AA9E4 @ =0x000003FF
	ands r1, r0
	lsls r1, r1, #5
	ldr r0, _080AA9E8 @ =0x06010000
	adds r1, r1, r0
	adds r0, r5, #0
	bl Decompress
_080AA9A8:
	cmp r6, #0
	beq _080AA9BC
	adds r1, r4, #0
	adds r1, #0x10
	lsls r1, r1, #5
	ldr r2, [sp, #0x30]
	lsls r2, r2, #5
	adds r0, r6, #0
	bl ApplyPaletteExt
_080AA9BC:
	movs r0, #0xf
	ands r4, r0
	lsls r3, r4, #0xc
	adds r3, r3, r7
	ldr r0, [sp, #0x28]
	str r0, [sp]
	ldr r0, [sp, #0x38]
	str r0, [sp, #4]
	mov r0, r8
	mov r1, sb
	ldr r2, [sp, #0x24]
	bl sub_0801245C
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080AA9E4: .4byte 0x000003FF
_080AA9E8: .4byte 0x06010000

	thumb_func_start sub_080AA9EC
sub_080AA9EC: @ 0x080AA9EC
	cmp r0, #1
	beq _080AAA10
	cmp r0, #1
	bgt _080AA9FA
	cmp r0, #0
	beq _080AAA04
	b _080AAA2C
_080AA9FA:
	cmp r0, #2
	beq _080AAA1C
	cmp r0, #3
	beq _080AAA28
	b _080AAA2C
_080AAA04:
	ldr r0, _080AAA0C @ =0x03002870
	ldrh r0, [r0, #0x1c]
	b _080AAA2C
	.align 2, 0
_080AAA0C: .4byte 0x03002870
_080AAA10:
	ldr r0, _080AAA18 @ =0x03002870
	ldrh r0, [r0, #0x20]
	b _080AAA2C
	.align 2, 0
_080AAA18: .4byte 0x03002870
_080AAA1C:
	ldr r0, _080AAA24 @ =0x03002870
	ldrh r0, [r0, #0x24]
	b _080AAA2C
	.align 2, 0
_080AAA24: .4byte 0x03002870
_080AAA28:
	ldr r0, _080AAA30 @ =0x03002870
	ldrh r0, [r0, #0x28]
_080AAA2C:
	bx lr
	.align 2, 0
_080AAA30: .4byte 0x03002870

	thumb_func_start sub_080AAA34
sub_080AAA34: @ 0x080AAA34
	cmp r0, #1
	beq _080AAA58
	cmp r0, #1
	bgt _080AAA42
	cmp r0, #0
	beq _080AAA4C
	b _080AAA74
_080AAA42:
	cmp r0, #2
	beq _080AAA64
	cmp r0, #3
	beq _080AAA70
	b _080AAA74
_080AAA4C:
	ldr r0, _080AAA54 @ =0x03002870
	ldrh r0, [r0, #0x1e]
	b _080AAA74
	.align 2, 0
_080AAA54: .4byte 0x03002870
_080AAA58:
	ldr r0, _080AAA60 @ =0x03002870
	ldrh r0, [r0, #0x22]
	b _080AAA74
	.align 2, 0
_080AAA60: .4byte 0x03002870
_080AAA64:
	ldr r0, _080AAA6C @ =0x03002870
	ldrh r0, [r0, #0x26]
	b _080AAA74
	.align 2, 0
_080AAA6C: .4byte 0x03002870
_080AAA70:
	ldr r0, _080AAA78 @ =0x03002870
	ldrh r0, [r0, #0x2a]
_080AAA74:
	bx lr
	.align 2, 0
_080AAA78: .4byte 0x03002870

	thumb_func_start sub_080AAA7C
sub_080AAA7C: @ 0x080AAA7C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl strcpy
	adds r0, r5, #0
	bl strlen
	adds r4, r4, r0
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080AAA9C
sub_080AAA9C: @ 0x080AAA9C
	strb r0, [r1]
	adds r1, #1
	movs r0, #0
	strb r0, [r1]
	adds r0, r1, #0
	bx lr

	thumb_func_start sub_080AAAA8
sub_080AAAA8: @ 0x080AAAA8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x48
	adds r7, r0, #0
	adds r5, r1, #0
	mov r1, sp
	ldr r0, _080AAB04 @ =0x08418E18
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	adds r0, r7, #0
	bl GetChapterInfo
	adds r1, r0, #0
	movs r2, #0
	ldr r0, _080AAB08 @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _080AAAD8
	movs r2, #1
_080AAAD8:
	adds r0, r1, #0
	adds r0, #0x84
	adds r0, r0, r2
	ldrb r0, [r0]
	lsrs r4, r0, #1
	cmp r7, #0x2f
	bgt _080AAB14
	cmp r7, #0x2e
	blt _080AAB14
	ldr r0, _080AAB0C @ =0x00001186
	add r4, sp, #0x28
	adds r1, r4, #0
	bl GetMsgTo
	adds r1, r5, #0
	bl sub_080AAA7C
	adds r5, r0, #0
	ldr r0, _080AAB10 @ =0x0000118B
	adds r1, r4, #0
	b _080AABAA
	.align 2, 0
_080AAB04: .4byte 0x08418E18
_080AAB08: .4byte 0x0202BBF8
_080AAB0C: .4byte 0x00001186
_080AAB10: .4byte 0x0000118B
_080AAB14:
	ldr r0, _080AABC0 @ =0x00001185
	add r6, sp, #0x28
	adds r1, r6, #0
	bl GetMsgTo
	adds r1, r5, #0
	bl sub_080AAA7C
	adds r5, r0, #0
	cmp r4, #9
	ble _080AAB46
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	adds r1, r6, #0
	bl GetMsgTo
	adds r1, r5, #0
	bl sub_080AAA7C
	adds r5, r0, #0
_080AAB46:
	adds r0, r4, #0
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	adds r1, r6, #0
	bl GetMsgTo
	adds r1, r5, #0
	bl sub_080AAA7C
	adds r5, r0, #0
	adds r0, r7, #0
	bl GetChapterInfo
	adds r1, r0, #0
	movs r2, #0
	ldr r0, _080AABC4 @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _080AAB76
	movs r2, #1
_080AAB76:
	adds r1, #0x84
	adds r1, r1, r2
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080AAB94
	ldr r0, _080AABC8 @ =0x00001188
	adds r1, r6, #0
	bl GetMsgTo
	adds r1, r5, #0
	bl sub_080AAA7C
	adds r5, r0, #0
_080AAB94:
	ldr r4, _080AABCC @ =0x0000118B
	adds r0, r4, #0
	adds r1, r6, #0
	bl GetMsgTo
	adds r1, r5, #0
	bl sub_080AAA7C
	adds r5, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
_080AABAA:
	bl GetMsgTo
	adds r1, r5, #0
	bl sub_080AAA7C
	adds r5, r0, #0
	add sp, #0x48
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080AABC0: .4byte 0x00001185
_080AABC4: .4byte 0x0202BBF8
_080AABC8: .4byte 0x00001188
_080AABCC: .4byte 0x0000118B

	thumb_func_start sub_080AABD0
sub_080AABD0: @ 0x080AABD0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, [r5]
	mov r1, sp
	bl sub_08005658
	adds r4, r0, #0
	ldr r1, [r5]
	subs r4, r4, r1
	ldr r0, [r6]
	adds r2, r4, #0
	bl memcpy
	ldr r0, [r5]
	adds r0, r0, r4
	str r0, [r5]
	ldr r0, [r6]
	adds r0, r0, r4
	str r0, [r6]
	adds r0, r4, #0
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_080AAC04
sub_080AAC04: @ 0x080AAC04
	push {lr}
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0

	thumb_func_start sub_080AAC10
sub_080AAC10: @ 0x080AAC10
	push {lr}
	sub sp, #4
	adds r3, r0, #0
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0
	str r0, [sp]
	movs r2, #0
	bl sub_080040F8
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080AAC2C
sub_080AAC2C: @ 0x080AAC2C
	push {lr}
	sub sp, #4
	movs r2, #0x80
	lsls r2, r2, #1
	movs r1, #0
	str r1, [sp]
	adds r1, r2, #0
	movs r3, #0x20
	bl sub_080040F8
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080AAC48
sub_080AAC48: @ 0x080AAC48
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AAC70 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AAC60
	movs r0, #0xe4
	lsls r0, r0, #2
	bl sub_080BE594
_080AAC60:
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	ldr r2, [r4, #0x58]
	bl sub_08081940
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AAC70: .4byte 0x0202BBF8

	thumb_func_start sub_080AAC74
sub_080AAC74: @ 0x080AAC74
	push {lr}
	adds r2, r0, #0
	ldr r0, _080AACA8 @ =0x08B857F8
	ldr r1, [r0]
	ldr r0, _080AACAC @ =0x0000030B
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080AACA2
	adds r0, r2, #0
	bl Proc_Break
	ldr r0, _080AACB0 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AAC9E
	ldr r0, _080AACB4 @ =0x00000391
	bl sub_080BE594
_080AAC9E:
	bl sub_08081B44
_080AACA2:
	pop {r0}
	bx r0
	.align 2, 0
_080AACA8: .4byte 0x08B857F8
_080AACAC: .4byte 0x0000030B
_080AACB0: .4byte 0x0202BBF8
_080AACB4: .4byte 0x00000391

	thumb_func_start sub_080AACB8
sub_080AACB8: @ 0x080AACB8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r3, #0
	ldr r0, _080AACD4 @ =0x08CE4CF8
	bl SpawnProcLocking
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	str r6, [r0, #0x58]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AACD4: .4byte 0x08CE4CF8

	thumb_func_start sub_080AACD8
sub_080AACD8: @ 0x080AACD8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r0, r1, #0
	lsls r4, r2, #0x10
	lsrs r4, r4, #0x10
	ldr r5, _080AACFC @ =0x02020140
	adds r1, r5, #0
	bl Decompress
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl TmApplyTsa_t
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AACFC: .4byte 0x02020140

	thumb_func_start sub_080AAD00
sub_080AAD00: @ 0x080AAD00
	push {r4, lr}
	movs r4, #0
_080AAD04:
	adds r4, #1
	movs r1, #0xa
	bl __divsi3
	cmp r0, #0
	bne _080AAD04
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_080AAD18
sub_080AAD18: @ 0x080AAD18
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r4, [sp, #0x14]
	ldr r0, [sp, #0x18]
	subs r7, r2, r6
	subs r2, r0, r5
	adds r1, r7, #0
	muls r1, r2, r1
	subs r3, r3, r5
	subs r4, r4, r6
	adds r0, r3, #0
	muls r0, r4, r0
	subs r1, r1, r0
	cmp r1, #0
	blt _080AAD60
	ldr r0, [sp, #0x20]
	subs r5, r0, r5
	adds r1, r4, #0
	muls r1, r5, r1
	ldr r0, [sp, #0x1c]
	subs r4, r0, r6
	adds r0, r2, #0
	muls r0, r4, r0
	subs r1, r1, r0
	cmp r1, #0
	blt _080AAD60
	adds r0, r4, #0
	muls r0, r3, r0
	adds r1, r5, #0
	muls r1, r7, r1
	subs r0, r0, r1
	cmp r0, #0
	blt _080AAD60
	movs r0, #1
	b _080AAD62
_080AAD60:
	movs r0, #0
_080AAD62:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_080AAD68
sub_080AAD68: @ 0x080AAD68
	adds r0, #0x34
	ldrb r0, [r0]
	cmp r0, #0x64
	beq _080AAD74
	movs r0, #0
	b _080AAD76
_080AAD74:
	movs r0, #1
_080AAD76:
	bx lr

	thumb_func_start sub_080AAD78
sub_080AAD78: @ 0x080AAD78
	movs r0, #0
	bx lr

	thumb_func_start sub_080AAD7C
sub_080AAD7C: @ 0x080AAD7C
	movs r2, #0
	ldr r1, _080AAD8C @ =0x08CE4D28
_080AAD80:
	ldr r0, [r1]
	cmp r0, #0
	blt _080AAD90
	adds r1, #0x10
	adds r2, #1
	b _080AAD80
	.align 2, 0
_080AAD8C: .4byte 0x08CE4D28
_080AAD90:
	adds r0, r2, #0
	bx lr

	thumb_func_start sub_080AAD94
sub_080AAD94: @ 0x080AAD94
	push {r4, r5, lr}
	movs r3, #0
	movs r4, #0
	ldr r0, _080AADB0 @ =0x08CE4D28
	adds r5, r0, #0
	adds r5, #8
	adds r2, r0, #0
_080AADA2:
	lsls r1, r3, #4
	ldr r0, [r2]
	cmp r0, #0
	bge _080AADB4
	adds r0, r4, #0
	b _080AADC4
	.align 2, 0
_080AADB0: .4byte 0x08CE4D28
_080AADB4:
	adds r0, r1, r5
	ldr r0, [r0]
	cmp r0, #0
	beq _080AADBE
	adds r4, #1
_080AADBE:
	adds r2, #0x10
	adds r3, #1
	b _080AADA2
_080AADC4:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080AADCC
sub_080AADCC: @ 0x080AADCC
	asrs r3, r1, #5
	lsls r3, r3, #2
	adds r3, r3, r0
	movs r2, #0x1f
	ands r2, r1
	ldr r0, [r3, #0x40]
	lsrs r0, r2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080AADE6
	movs r0, #0
	b _080AADE8
_080AADE6:
	movs r0, #1
_080AADE8:
	bx lr
	.align 2, 0

	thumb_func_start sub_080AADEC
sub_080AADEC: @ 0x080AADEC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r2, #0
	movs r4, #0
	ldr r3, _080AAE08 @ =0x08CE4D28
	adds r5, r3, #0
_080AADF8:
	lsls r1, r2, #4
	adds r0, r1, r5
	ldr r0, [r0]
	cmp r0, #0
	bge _080AAE0C
	adds r0, r4, #0
	b _080AAE3A
	.align 2, 0
_080AAE08: .4byte 0x08CE4D28
_080AAE0C:
	adds r0, r3, #0
	adds r0, #8
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, #0
	beq _080AAE32
	asrs r1, r2, #5
	lsls r1, r1, #2
	adds r1, r1, r6
	movs r0, #0x1f
	ands r0, r2
	ldr r1, [r1, #0x40]
	lsrs r1, r0
	movs r0, #1
	ands r1, r0
	adds r0, r2, #1
	cmp r1, #0
	beq _080AAE36
	b _080AAE34
_080AAE32:
	adds r0, r2, #1
_080AAE34:
	adds r4, r0, #0
_080AAE36:
	adds r2, r0, #0
	b _080AADF8
_080AAE3A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_080AAE40
sub_080AAE40: @ 0x080AAE40
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	adds r7, r0, #0
	bl sub_080AAD7C
	movs r1, #0x36
	adds r1, r1, r7
	mov r8, r1
	movs r1, #0
	mov r2, r8
	strb r0, [r2]
	add r0, sp, #0x24
	movs r4, #0
	strh r1, [r0]
	adds r1, r7, #0
	adds r1, #0x40
	ldr r2, _080AAF94 @ =0x01000008
	bl CpuSet
	adds r5, r7, #0
	adds r5, #0x33
	strb r4, [r5]
	mov r0, sp
	bl sub_0809F68C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AAF76
	movs r6, #0
	ldr r1, _080AAF98 @ =0x08CE4D28
	ldr r0, [r1]
	mov sb, r8
	mov r8, r5
	movs r3, #0x34
	adds r3, r3, r7
	mov sl, r3
	cmp r0, #0
	blt _080AAEE8
	movs r4, #0
	movs r0, #8
	adds r0, r0, r1
	mov ip, r0
_080AAE9C:
	mov r2, ip
	ldr r0, [r2]
	cmp r0, #0
	bne _080AAED6
	adds r0, r4, r1
	ldr r1, [r0]
	asrs r0, r1, #5
	lsls r0, r0, #2
	add r0, sp
	movs r3, #0x1f
	ands r1, r3
	ldr r0, [r0]
	lsrs r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080AAED6
	asrs r2, r6, #5
	lsls r2, r2, #2
	adds r2, r2, r7
	adds r0, r6, #0
	ands r0, r3
	lsls r1, r0
	ldr r0, [r2, #0x40]
	orrs r0, r1
	str r0, [r2, #0x40]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
_080AAED6:
	adds r4, #0x10
	movs r3, #0x10
	add ip, r3
	adds r6, #1
	ldr r1, _080AAF98 @ =0x08CE4D28
	adds r0, r4, r1
	ldr r0, [r0]
	cmp r0, #0
	bge _080AAE9C
_080AAEE8:
	bl sub_080AAD94
	adds r1, r0, #0
	movs r0, #0x64
	mov r2, r8
	ldrb r2, [r2]
	muls r0, r2, r0
	mov r3, sb
	ldrb r3, [r3]
	subs r1, r3, r1
	bl __divsi3
	mov r1, sl
	strb r0, [r1]
	movs r6, #0
	ldr r1, _080AAF98 @ =0x08CE4D28
	ldr r0, [r1]
	cmp r0, #0
	blt _080AAF76
	movs r5, #0
_080AAF10:
	adds r0, r1, #0
	adds r0, #8
	adds r0, r5, r0
	ldr r2, [r0]
	cmp r2, #0
	beq _080AAF68
	adds r0, r5, r1
	ldr r1, [r0]
	asrs r0, r1, #5
	lsls r0, r0, #2
	add r0, sp
	movs r3, #0x1f
	ands r1, r3
	ldr r0, [r0]
	lsrs r0, r1
	movs r4, #1
	ands r0, r4
	cmp r0, #0
	bne _080AAF46
	adds r0, r7, #0
	str r3, [sp, #0x28]
	bl _call_via_r2
	lsls r0, r0, #0x18
	ldr r3, [sp, #0x28]
	cmp r0, #0
	beq _080AAF68
_080AAF46:
	asrs r2, r6, #5
	lsls r2, r2, #2
	adds r2, r2, r7
	adds r0, r6, #0
	ands r0, r3
	adds r1, r4, #0
	lsls r1, r0
	ldr r0, [r2, #0x40]
	orrs r0, r1
	str r0, [r2, #0x40]
	mov r2, r8
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	adds r0, r7, #0
	adds r0, #0x2e
	strb r4, [r0]
_080AAF68:
	adds r5, #0x10
	adds r6, #1
	ldr r1, _080AAF98 @ =0x08CE4D28
	adds r0, r5, r1
	ldr r0, [r0]
	cmp r0, #0
	bge _080AAF10
_080AAF76:
	adds r0, r7, #0
	bl sub_080AADEC
	adds r1, r7, #0
	adds r1, #0x36
	strb r0, [r1]
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AAF94: .4byte 0x01000008
_080AAF98: .4byte 0x08CE4D28

	thumb_func_start sub_080AAF9C
sub_080AAF9C: @ 0x080AAF9C
	bx lr
	.align 2, 0

	thumb_func_start sub_080AAFA0
sub_080AAFA0: @ 0x080AAFA0
	push {r4, lr}
	sub sp, #4
	ldr r4, [r0, #0x14]
	movs r1, #0x80
	lsls r1, r1, #1
	str r0, [sp]
	movs r0, #0
	movs r2, #0
	movs r3, #0x78
	bl sub_080040F8
	adds r4, #0x3f
	movs r0, #1
	strb r0, [r4]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080AAFC4
sub_080AAFC4: @ 0x080AAFC4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x14]
	adds r1, r4, #0
	adds r1, #0x31
	ldr r0, _080AB008 @ =0x08CE548C
	ldr r0, [r0]
	ldrb r1, [r1]
	adds r0, r1, r0
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r4, #0
	movs r2, #0
	bl sub_080ABAB4
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_080AC384
	ldr r0, [r5, #0x14]
	bl sub_080AB4EC
	ldr r1, [r5, #0x14]
	bl sub_080AC87C
	adds r4, #0x3f
	movs r0, #0
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AB008: .4byte 0x08CE548C

	thumb_func_start sub_080AB00C
sub_080AB00C: @ 0x080AB00C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AB044 @ =0x08CE5490
	adds r1, r4, #0
	bl SpawnProc
	adds r4, #0x31
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldrb r2, [r4]
	ldr r0, _080AB048 @ =0x08CE548C
	ldr r0, [r0]
	adds r0, r0, r2
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080AB038
	cmp r2, #0x80
	bne _080AB03C
_080AB038:
	movs r0, #0
	strb r0, [r4]
_080AB03C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AB044: .4byte 0x08CE5490
_080AB048: .4byte 0x08CE548C

	thumb_func_start sub_080AB04C
sub_080AB04C: @ 0x080AB04C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sb, r0
	movs r6, #0
	ldr r2, _080AB194 @ =0x08CE548C
	movs r0, #1
	rsbs r0, r0, #0
	adds r1, r0, #0
_080AB064:
	ldr r0, [r2]
	adds r0, r0, r6
	strb r1, [r0]
	adds r6, #1
	cmp r6, #0x7f
	ble _080AB064
	bl GetGameTime
	adds r3, r0, #0
	movs r0, #0x7f
	ands r3, r0
	adds r2, r3, #0
	movs r6, #0
	mov r7, sb
	adds r7, #0x31
	mov r1, sb
	adds r1, #0x35
	str r1, [sp, #4]
	mov r5, sb
	adds r5, #0x30
	str r5, [sp]
_080AB08E:
	asrs r0, r2, #5
	lsls r0, r0, #2
	add r0, sb
	movs r1, #0x1f
	ands r1, r2
	ldr r0, [r0, #0x40]
	lsrs r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080AB0AE
	ldr r0, _080AB194 @ =0x08CE548C
	ldr r0, [r0]
	adds r0, r0, r6
	strb r2, [r0]
	adds r6, #1
_080AB0AE:
	adds r1, r2, #1
	adds r0, r1, #0
	cmp r1, #0
	bge _080AB0BA
	adds r0, r2, #0
	adds r0, #0x80
_080AB0BA:
	asrs r2, r0, #7
	lsls r0, r2, #7
	subs r2, r1, r0
	cmp r2, r3
	bne _080AB08E
	mov r8, r6
	bl GetGameTime
	adds r4, r0, #0
	adds r4, #0x7b
	ldr r0, _080AB194 @ =0x08CE548C
	mov sl, r0
	movs r6, #0xff
_080AB0D4:
	movs r1, #0xd
	adds r2, r4, #0
	muls r2, r1, r2
	adds r1, r2, #1
	adds r0, r1, #0
	cmp r1, #0
	bge _080AB0E8
	movs r3, #0x80
	lsls r3, r3, #8
	adds r0, r2, r3
_080AB0E8:
	asrs r4, r0, #0xf
	lsls r0, r4, #0xf
	subs r4, r1, r0
	asrs r0, r4, #8
	mov r1, r8
	bl __modsi3
	adds r5, r0, #0
	movs r0, #0xd
	adds r2, r4, #0
	muls r2, r0, r2
	adds r1, r2, #1
	adds r0, r1, #0
	cmp r1, #0
	bge _080AB10C
	movs r3, #0x80
	lsls r3, r3, #8
	adds r0, r2, r3
_080AB10C:
	asrs r4, r0, #0xf
	lsls r0, r4, #0xf
	subs r4, r1, r0
	asrs r0, r4, #8
	mov r1, r8
	bl __modsi3
	adds r2, r0, #0
	cmp r5, r2
	beq _080AB150
	mov r1, sl
	ldr r0, [r1]
	adds r1, r0, r5
	adds r0, r0, r2
	ldrb r3, [r1]
	ldrb r0, [r0]
	adds r0, r3, r0
	strb r0, [r1]
	mov r1, sl
	ldr r0, [r1]
	adds r1, r0, r2
	adds r0, r0, r5
	ldrb r0, [r0]
	ldrb r3, [r1]
	subs r0, r0, r3
	strb r0, [r1]
	mov r1, sl
	ldr r0, [r1]
	adds r1, r0, r5
	adds r0, r0, r2
	ldrb r2, [r1]
	ldrb r0, [r0]
	subs r0, r2, r0
	strb r0, [r1]
_080AB150:
	subs r6, #1
	cmp r6, #0
	bge _080AB0D4
	movs r0, #0
	strb r0, [r7]
	ldr r3, [sp, #4]
	ldrb r2, [r3]
	lsrs r0, r2, #5
	lsls r0, r0, #2
	add r0, sb
	movs r1, #0x1f
	ands r1, r2
	ldr r0, [r0, #0x40]
	lsrs r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080AB1AA
	ldr r0, _080AB194 @ =0x08CE548C
	ldr r1, [r0]
	movs r0, #0
	ldrsb r0, [r1, r0]
	adds r5, r2, #0
	cmp r0, r5
	beq _080AB1AA
	adds r3, r7, #0
	movs r4, #0
	ldr r2, [sp, #4]
_080AB188:
	ldrb r0, [r3]
	cmp r0, #0x80
	bne _080AB198
	strb r4, [r7]
	b _080AB1AA
	.align 2, 0
_080AB194: .4byte 0x08CE548C
_080AB198:
	adds r0, #1
	strb r0, [r7]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r5, [r2]
	cmp r0, r5
	bne _080AB188
_080AB1AA:
	movs r0, #1
	ldr r1, [sp]
	strb r0, [r1]
	mov r0, sb
	bl sub_080AB00C
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080AB1C8
sub_080AB1C8: @ 0x080AB1C8
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x32
	ldrb r2, [r0]
	adds r2, #1
	movs r0, #0x7f
	ands r2, r0
_080AB1D6:
	lsrs r0, r2, #5
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0x1f
	ands r1, r2
	ldr r0, [r0, #0x40]
	lsrs r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080AB212
	adds r0, r4, #0
	adds r1, r2, #0
	movs r2, #0x20
	bl sub_080ABAB4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AB20E
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_080AC384
	movs r0, #1
	b _080AB220
_080AB20E:
	movs r0, #0
	b _080AB220
_080AB212:
	adds r1, r2, #1
	lsls r1, r1, #0x18
	movs r0, #0xfe
	lsls r0, r0, #0x17
	ands r0, r1
	lsrs r2, r0, #0x18
	b _080AB1D6
_080AB220:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080AB228
sub_080AB228: @ 0x080AB228
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x32
	ldrb r2, [r0]
	subs r2, #1
	movs r0, #0x7f
	ands r2, r0
_080AB236:
	lsrs r0, r2, #5
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0x1f
	ands r1, r2
	ldr r0, [r0, #0x40]
	lsrs r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080AB272
	adds r0, r4, #0
	adds r1, r2, #0
	movs r2, #0x20
	bl sub_080ABAB4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AB26E
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_080AC384
	movs r0, #1
	b _080AB280
_080AB26E:
	movs r0, #0
	b _080AB280
_080AB272:
	subs r1, r2, #1
	lsls r1, r1, #0x18
	movs r0, #0xfe
	lsls r0, r0, #0x17
	ands r0, r1
	lsrs r2, r0, #0x18
	b _080AB236
_080AB280:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080AB288
sub_080AB288: @ 0x080AB288
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r6, _080AB2BC @ =0x0201EA9C
	lsls r1, r4, #1
	adds r0, r1, r4
	lsls r0, r0, #4
	adds r0, r0, r4
	adds r2, r0, r6
	movs r3, #0x2f
_080AB29C:
	ldrb r0, [r2, #1]
	strb r0, [r2]
	adds r2, #1
	subs r3, #1
	cmp r3, #0
	bge _080AB29C
	adds r0, r1, r4
	lsls r0, r0, #4
	adds r0, r0, r4
	adds r1, r6, #0
	adds r1, #0x30
	adds r0, r0, r1
	strb r5, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AB2BC: .4byte 0x0201EA9C

	thumb_func_start sub_080AB2C0
sub_080AB2C0: @ 0x080AB2C0
	push {r4, r5, lr}
	movs r1, #0
	ldr r5, _080AB2F8 @ =0x08413C9C
	ldr r3, _080AB2FC @ =0x0201EA9C
	movs r2, #0
	adds r4, r3, #0
	adds r4, #0x31
_080AB2CE:
	adds r0, r1, r3
	strb r2, [r0]
	adds r0, r1, r4
	strb r2, [r0]
	adds r1, #1
	cmp r1, #0x30
	ble _080AB2CE
	ldr r1, _080AB300 @ =0x06010800
	adds r0, r5, #0
	bl Decompress
	ldr r0, _080AB304 @ =0x08413D0C
	movs r1, #0xe8
	lsls r1, r1, #2
	movs r2, #0x60
	bl ApplyPaletteExt
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AB2F8: .4byte 0x08413C9C
_080AB2FC: .4byte 0x0201EA9C
_080AB300: .4byte 0x06010800
_080AB304: .4byte 0x08413D0C

	thumb_func_start sub_080AB308
sub_080AB308: @ 0x080AB308
	movs r1, #0
	str r1, [r0, #0x2c]
	bx lr
	.align 2, 0

	thumb_func_start sub_080AB310
sub_080AB310: @ 0x080AB310
	bx lr
	.align 2, 0

	thumb_func_start sub_080AB314
sub_080AB314: @ 0x080AB314
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	movs r7, #0
	movs r5, #0
	movs r0, #0xff
	mov r8, r0
	mov ip, r0
	movs r6, #0
	ldr r1, _080AB414 @ =0x08CE5488
	mov sb, r1
	movs r2, #0xd4
	lsls r2, r2, #2
	mov sl, r2
_080AB338:
	mov r0, sb
	ldr r2, [r0]
	lsls r3, r6, #1
	adds r2, r3, r2
	str r2, [sp]
	ldr r2, _080AB418 @ =0x08CE54B0
	ldr r1, [r2]
	ldr r0, [r4, #0x2c]
	movs r2, #0xc6
	lsls r2, r2, #3
	adds r0, r0, r2
	add r1, sl
	adds r1, r1, r0
	ldrb r0, [r1]
	subs r0, #0x80
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x19
	ldr r1, [sp]
	strb r0, [r1]
	mov r0, sb
	ldr r2, [r0]
	adds r2, r3, r2
	ldr r1, _080AB418 @ =0x08CE54B0
	ldr r0, [r1]
	add r0, sl
	ldr r1, [r4, #0x2c]
	adds r0, r0, r1
	ldrb r1, [r0]
	subs r1, #0x80
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x19
	movs r0, #0xf0
	subs r0, r0, r1
	strb r0, [r2, #1]
	mov r2, sb
	ldr r0, [r2]
	adds r3, r3, r0
	ldrb r0, [r3]
	cmp r0, r5
	bhs _080AB38A
	adds r0, r5, #0
_080AB38A:
	adds r5, r0, #0
	ldrb r0, [r3]
	cmp r0, ip
	bls _080AB394
	mov r0, ip
_080AB394:
	mov ip, r0
	ldrb r3, [r3, #1]
	adds r0, r3, #0
	cmp r3, r7
	bhs _080AB3A0
	adds r3, r7, #0
_080AB3A0:
	adds r7, r3, #0
	adds r1, r0, #0
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	cmp r0, r8
	bls _080AB3AE
	mov r1, r8
_080AB3AE:
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, [r4, #0x2c]
	adds r1, r0, #1
	str r1, [r4, #0x2c]
	ldr r0, _080AB41C @ =0x0000062F
	cmp r1, r0
	ble _080AB3C8
	movs r2, #0xc6
	lsls r2, r2, #3
	subs r0, r1, r2
	str r0, [r4, #0x2c]
_080AB3C8:
	adds r6, #1
	cmp r6, #0xdf
	ble _080AB338
	mov r1, ip
	subs r0, r5, r1
	cmp r0, #0x3f
	ble _080AB3D8
	movs r0, #0x3f
_080AB3D8:
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	mov r2, r8
	subs r0, r7, r2
	cmp r0, #0x3f
	ble _080AB3E6
	movs r0, #0x3f
_080AB3E6:
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r0, r5, #1
	adds r0, r0, r5
	asrs r1, r0, #2
	movs r0, #0
	bl sub_080AB288
	lsls r0, r7, #1
	adds r0, r0, r7
	asrs r1, r0, #2
	movs r0, #1
	bl sub_080AB288
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AB414: .4byte 0x08CE5488
_080AB418: .4byte 0x08CE54B0
_080AB41C: .4byte 0x0000062F

	thumb_func_start sub_080AB420
sub_080AB420: @ 0x080AB420
	asrs r3, r1, #5
	lsls r3, r3, #2
	adds r3, r3, r0
	movs r2, #0x1f
	ands r2, r1
	ldr r0, [r3, #0x50]
	lsrs r0, r2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080AB43A
	movs r0, #0
	b _080AB43C
_080AB43A:
	movs r0, #1
_080AB43C:
	bx lr
	.align 2, 0

	thumb_func_start sub_080AB440
sub_080AB440: @ 0x080AB440
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x18
	adds r7, r0, #0
	add r0, sp, #0x14
	movs r1, #0
	strh r1, [r0]
	adds r1, r7, #0
	adds r1, #0x50
	ldr r2, _080AB4BC @ =0x01000008
	bl CpuSet
	mov r0, sp
	bl sub_0809F7B0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AB4D6
	movs r4, #0
	movs r0, #1
	mov ip, r0
	ldr r1, _080AB4C0 @ =0x08CE538C
	mov r8, r1
_080AB470:
	asrs r1, r4, #5
	lsls r1, r1, #2
	add r1, sp
	movs r0, #0x1f
	ands r0, r4
	ldr r1, [r1]
	lsrs r1, r0
	mov r0, ip
	ands r1, r0
	cmp r4, #0xa
	bgt _080AB488
	movs r1, #1
_080AB488:
	adds r6, r4, #1
	cmp r1, #0
	beq _080AB4D0
	movs r3, #0
	mov r1, r8
	ldr r0, [r1]
	ldr r1, _080AB4C0 @ =0x08CE538C
	cmp r0, #0
	blt _080AB4D0
	movs r5, #0x1f
	adds r2, r1, #0
	mov r1, r8
_080AB4A0:
	ldr r0, [r1]
	cmp r0, r4
	bne _080AB4C4
	asrs r2, r3, #5
	lsls r2, r2, #2
	adds r2, r2, r7
	ands r3, r5
	mov r1, ip
	lsls r1, r3
	ldr r0, [r2, #0x50]
	orrs r0, r1
	str r0, [r2, #0x50]
	b _080AB4D0
	.align 2, 0
_080AB4BC: .4byte 0x01000008
_080AB4C0: .4byte 0x08CE538C
_080AB4C4:
	adds r2, #4
	adds r1, #4
	adds r3, #1
	ldr r0, [r2]
	cmp r0, #0
	bge _080AB4A0
_080AB4D0:
	adds r4, r6, #0
	cmp r4, #0x7f
	ble _080AB470
_080AB4D6:
	adds r1, r7, #0
	adds r1, #0x39
	movs r0, #0xff
	strb r0, [r1]
	add sp, #0x18
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080AB4EC
sub_080AB4EC: @ 0x080AB4EC
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x39
	ldrb r1, [r4]
	adds r3, r1, #1
	adds r0, r3, #0
	asrs r2, r0, #7
	lsls r0, r2, #7
	subs r2, r3, r0
	adds r3, r4, #0
	ldr r4, _080AB534 @ =0x08CE538C
_080AB504:
	asrs r0, r2, #5
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #0x1f
	ands r1, r2
	ldr r0, [r0, #0x50]
	lsrs r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080AB520
	ldrb r0, [r3]
	cmp r0, r2
	bne _080AB538
_080AB520:
	adds r2, #1
	adds r0, r2, #0
	cmp r2, #0
	bge _080AB52A
	adds r0, #0x7f
_080AB52A:
	asrs r0, r0, #7
	lsls r0, r0, #7
	subs r2, r2, r0
	b _080AB504
	.align 2, 0
_080AB534: .4byte 0x08CE538C
_080AB538:
	strb r2, [r3]
	lsls r0, r2, #2
	adds r0, r0, r4
	ldr r0, [r0]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080AB548
sub_080AB548: @ 0x080AB548
	push {r4, r5, lr}
	adds r4, r0, #0
	bl GetGameTime
	movs r1, #0xd
	muls r0, r1, r0
	adds r2, r0, #1
	movs r0, #0x7f
	ands r2, r0
	ldr r5, _080AB598 @ =0x08CE538C
_080AB55C:
	asrs r0, r2, #5
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0x1f
	ands r1, r2
	ldr r0, [r0, #0x50]
	lsrs r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080AB57C
	adds r1, r4, #0
	adds r1, #0x39
	ldrb r0, [r1]
	cmp r0, r2
	bne _080AB59C
_080AB57C:
	movs r0, #0xd
	adds r1, r2, #0
	muls r1, r0, r1
	adds r3, r1, #1
	adds r0, r3, #0
	cmp r3, #0
	bge _080AB58E
	adds r0, r1, #0
	adds r0, #0x80
_080AB58E:
	asrs r2, r0, #7
	lsls r0, r2, #7
	subs r2, r3, r0
	b _080AB55C
	.align 2, 0
_080AB598: .4byte 0x08CE538C
_080AB59C:
	strb r2, [r1]
	lsls r0, r2, #2
	adds r0, r0, r5
	ldr r0, [r0]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080AB5AC
sub_080AB5AC: @ 0x080AB5AC
	push {lr}
	ldrh r2, [r0, #0x2a]
	rsbs r1, r2, #0
	orrs r1, r2
	lsrs r3, r1, #0x1f
	lsrs r1, r2, #4
	adds r1, #5
	adds r0, #0x36
	ldrb r2, [r0]
	subs r0, r2, #1
	cmp r0, #0
	bge _080AB5C6
	adds r0, r2, #2
_080AB5C6:
	asrs r0, r0, #2
	cmp r1, r0
	bgt _080AB5D0
	movs r0, #2
	orrs r3, r0
_080AB5D0:
	adds r0, r3, #0
	bl sub_080A8D54
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080AB5DC
sub_080AB5DC: @ 0x080AB5DC
	push {lr}
	adds r2, r0, #0
	adds r0, #0x35
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	lsls r0, r0, #5
	adds r0, #0x60
	lsrs r1, r1, #2
	lsls r1, r1, #4
	ldrh r2, [r2, #0x2a]
	subs r2, #0x40
	subs r1, r1, r2
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #2
	bl sub_080A951C
	pop {r0}
	bx r0

	thumb_func_start sub_080AB604
sub_080AB604: @ 0x080AB604
	push {r4, lr}
	adds r2, r0, #0
	adds r0, #0x35
	ldrb r0, [r0]
	lsrs r0, r0, #2
	lsls r0, r0, #4
	ldrh r1, [r2, #0x2a]
	subs r0, r0, r1
	cmp r0, #0
	bge _080AB61A
	adds r0, #0xf
_080AB61A:
	asrs r4, r0, #4
	cmp r1, #0
	beq _080AB62A
	cmp r4, #0
	bgt _080AB62A
	movs r0, #1
	rsbs r0, r0, #0
	b _080AB64E
_080AB62A:
	ldrh r1, [r2, #0x2a]
	lsrs r0, r1, #4
	adds r3, r0, #5
	adds r0, r2, #0
	adds r0, #0x36
	ldrb r1, [r0]
	subs r0, r1, #1
	cmp r0, #0
	bge _080AB63E
	adds r0, r1, #2
_080AB63E:
	asrs r0, r0, #2
	cmp r3, r0
	bgt _080AB64C
	cmp r4, #3
	ble _080AB64C
	movs r0, #1
	b _080AB64E
_080AB64C:
	movs r0, #0
_080AB64E:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_080AB654
sub_080AB654: @ 0x080AB654
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldrh r1, [r6, #0x2a]
	lsrs r0, r1, #4
	subs r0, #1
	lsls r7, r0, #2
	ldr r0, _080AB670 @ =0x02023C60
	movs r1, #0
	bl TmFill
	adds r4, r7, #0
	adds r0, r4, #0
	b _080AB734
	.align 2, 0
_080AB670: .4byte 0x02023C60
_080AB674:
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_080AADCC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AB686
	movs r5, #0
	b _080AB6CC
_080AB686:
	ldr r0, _080AB6C4 @ =0x08CE4D28
	lsls r1, r4, #4
	adds r0, #8
	adds r1, r1, r0
	ldr r0, [r1]
	cmp r0, #0
	beq _080AB6CC
	adds r2, r4, #0
	cmp r4, #0
	bge _080AB69C
	adds r2, r4, #3
_080AB69C:
	asrs r2, r2, #2
	lsls r0, r2, #1
	adds r0, #8
	movs r1, #0x1f
	ands r0, r1
	lsls r0, r0, #5
	adds r0, #0xc
	lsls r2, r2, #2
	subs r2, r4, r2
	lsls r2, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #1
	ldr r1, _080AB6C8 @ =0x02023C60
	adds r0, r0, r1
	movs r1, #1
	movs r2, #0x14
	movs r3, #0x14
	bl sub_080063AC
	b _080AB730
	.align 2, 0
_080AB6C4: .4byte 0x08CE4D28
_080AB6C8: .4byte 0x02023C60
_080AB6CC:
	cmp r4, #0x62
	ble _080AB704
	adds r2, r4, #0
	cmp r4, #0
	bge _080AB6D8
	adds r2, r4, #3
_080AB6D8:
	asrs r2, r2, #2
	lsls r0, r2, #1
	adds r0, #8
	movs r1, #0x1f
	ands r0, r1
	lsls r0, r0, #5
	adds r0, #0xd
	lsls r2, r2, #2
	subs r2, r4, r2
	lsls r2, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #1
	ldr r1, _080AB700 @ =0x02023C60
	adds r0, r0, r1
	adds r2, r4, #1
	adds r1, r5, #0
	bl sub_080061D8
	b _080AB730
	.align 2, 0
_080AB700: .4byte 0x02023C60
_080AB704:
	adds r2, r4, #0
	cmp r4, #0
	bge _080AB70C
	adds r2, r4, #3
_080AB70C:
	asrs r2, r2, #2
	lsls r0, r2, #1
	adds r0, #8
	movs r1, #0x1f
	ands r0, r1
	lsls r0, r0, #5
	adds r0, #0xd
	lsls r2, r2, #2
	subs r2, r4, r2
	lsls r2, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #1
	ldr r1, _080AB758 @ =0x02023C60
	adds r0, r0, r1
	adds r2, r4, #1
	adds r1, r5, #0
	bl sub_080063CC
_080AB730:
	adds r4, #1
	adds r0, r7, #0
_080AB734:
	adds r0, #0x1c
	cmp r4, r0
	bge _080AB74A
	movs r5, #1
	cmp r4, #0
	blt _080AB730
	adds r0, r6, #0
	adds r0, #0x36
	ldrb r0, [r0]
	cmp r4, r0
	blt _080AB674
_080AB74A:
	movs r0, #4
	bl EnableBgSync
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AB758: .4byte 0x02023C60

	thumb_func_start sub_080AB75C
sub_080AB75C: @ 0x080AB75C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r4, #6
	adds r1, #0x34
	movs r3, #2
	ldrb r2, [r1]
	cmp r2, #0x64
	bne _080AB76E
	movs r3, #4
_080AB76E:
	ldrb r2, [r1]
	adds r1, r3, #0
	bl sub_080061D8
	ldr r0, _080AB788 @ =0x0201EA90
	adds r1, r4, #0
	adds r1, #8
	bl sub_08005590
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AB788: .4byte 0x0201EA90

	thumb_func_start sub_080AB78C
sub_080AB78C: @ 0x080AB78C
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	cmp r0, #0
	beq _080AB798
	adds r0, #1
	strh r0, [r1, #0x2c]
_080AB798:
	bx lr
	.align 2, 0

	thumb_func_start sub_080AB79C
sub_080AB79C: @ 0x080AB79C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0
	bl InitBgs
	bl ResetTextFont
	bl ResetText
	bl ApplySystemObjectsGraphics
	bl LoadUiFrameGraphics
	bl InitSystemTextFont
	ldr r7, _080ABA64 @ =0x03002870
	movs r6, #1
	ldrb r2, [r7, #1]
	orrs r2, r6
	movs r0, #2
	orrs r2, r0
	movs r1, #4
	orrs r2, r1
	movs r3, #8
	orrs r2, r3
	movs r0, #0x10
	orrs r2, r0
	subs r1, #8
	adds r0, r1, #0
	ldrb r3, [r7, #0xc]
	ands r0, r3
	strb r0, [r7, #0xc]
	adds r0, r1, #0
	ldrb r3, [r7, #0x10]
	ands r0, r3
	movs r3, #2
	orrs r0, r3
	strb r0, [r7, #0x10]
	ldrb r0, [r7, #0x14]
	ands r1, r0
	orrs r1, r6
	strb r1, [r7, #0x14]
	movs r0, #3
	ldrb r1, [r7, #0x18]
	orrs r0, r1
	strb r0, [r7, #0x18]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r2, r0
	subs r3, #0x43
	ands r2, r3
	movs r0, #0x7f
	ands r2, r0
	strb r2, [r7, #1]
	movs r0, #0
	bl sub_08001840
	ldr r0, _080ABA68 @ =0x02022C60
	movs r1, #0
	bl TmFill
	ldr r1, _080ABA6C @ =0x02023460
	mov sl, r1
	mov r0, sl
	movs r1, #0
	bl TmFill
	ldr r0, _080ABA70 @ =0x02023C60
	movs r1, #0
	bl TmFill
	ldr r0, _080ABA74 @ =0x02024460
	movs r1, #0
	bl TmFill
	movs r0, #0xf
	bl EnableBgSync
	adds r0, r4, #0
	adds r0, #0x35
	movs r5, #0
	strb r5, [r0]
	adds r0, #2
	strb r5, [r0]
	movs r2, #0
	mov sb, r2
	strh r5, [r4, #0x2a]
	adds r0, #4
	mov r3, sb
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	subs r0, #0xf
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r1, r4, #0
	adds r1, #0x32
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x2e
	strb r3, [r0]
	strh r5, [r4, #0x2c]
	adds r0, #0x11
	strb r3, [r0]
	adds r0, r4, #0
	bl sub_080AAE40
	adds r0, r4, #0
	bl sub_080AB440
	bl sub_080AC2C0
	adds r0, r4, #0
	bl sub_080ABB38
	adds r0, r4, #0
	bl sub_080A947C
	movs r0, #0xa0
	lsls r0, r0, #2
	movs r1, #2
	bl sub_080A94A0
	adds r0, r4, #0
	bl sub_080A8CD4
	movs r1, #0xd0
	lsls r1, r1, #3
	movs r0, #1
	movs r2, #3
	bl sub_080A8CE8
	movs r0, #0x90
	movs r1, #0x38
	movs r2, #0x90
	movs r3, #0x90
	bl sub_080A8D70
	adds r0, r4, #0
	bl sub_080AB5AC
	adds r0, r4, #0
	bl sub_080AB5DC
	adds r0, r4, #0
	bl sub_080AB654
	ldr r0, _080ABA78 @ =0x08413D6C
	ldr r1, _080ABA7C @ =0x06004000
	bl Decompress
	ldr r0, _080ABA80 @ =0x083FCBAC
	movs r1, #0x80
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080ABA84 @ =0x083FCBCC
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
	str r5, [sp]
	movs r0, #2
	movs r1, #1
	movs r2, #0x1a
	movs r3, #6
	bl sub_08049CE4
	str r5, [sp]
	movs r0, #0xb
	movs r1, #7
	movs r2, #0x11
	movs r3, #0xc
	bl sub_08049CE4
	str r5, [sp]
	movs r0, #2
	movs r1, #0xb
	movs r2, #9
	movs r3, #8
	bl sub_08049CE4
	movs r0, #0xb1
	lsls r0, r0, #2
	add r0, sl
	ldr r1, _080ABA88 @ =0x08414884
	movs r2, #0x80
	lsls r2, r2, #5
	mov r8, r2
	bl TmApplyTsa_t
	str r5, [sp]
	movs r0, #2
	movs r1, #7
	movs r2, #9
	movs r3, #4
	bl sub_08049CE4
	movs r3, #0xb6
	lsls r3, r3, #1
	add sl, r3
	ldr r1, _080ABA8C @ =0x08414918
	mov r0, sl
	mov r2, r8
	bl TmApplyTsa_t
	ldr r1, _080ABA68 @ =0x02022C60
	movs r2, #0xb6
	lsls r2, r2, #1
	adds r0, r1, r2
	adds r1, r4, #0
	bl sub_080AB75C
	ldr r2, _080ABA90 @ =0x0000FFFE
	movs r0, #0
	movs r1, #0
	bl SetBgOffset
	ldr r1, _080ABA94 @ =0x0000FFFC
	movs r0, #2
	movs r2, #0
	bl SetBgOffset
	movs r0, #0x20
	ldrb r3, [r7, #1]
	orrs r0, r3
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r2, #0x7f
	ands r0, r2
	strb r0, [r7, #1]
	adds r1, r7, #0
	adds r1, #0x34
	ldrb r0, [r1]
	orrs r0, r6
	movs r3, #2
	orrs r0, r3
	movs r2, #4
	orrs r0, r2
	movs r3, #8
	orrs r0, r3
	movs r2, #0x10
	orrs r0, r2
	strb r0, [r1]
	subs r1, #7
	movs r0, #4
	strb r0, [r1]
	adds r1, #4
	movs r5, #0x40
	movs r0, #0x40
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x90
	strb r0, [r1]
	adds r1, #6
	ldrb r3, [r1]
	orrs r6, r3
	movs r0, #2
	orrs r6, r0
	subs r0, #7
	ands r6, r0
	movs r2, #8
	orrs r6, r2
	movs r3, #0x10
	orrs r6, r3
	strb r6, [r1]
	adds r0, r4, #0
	bl sub_080AB548
	movs r1, #0x80
	lsls r1, r1, #8
	str r0, [sp]
	ldr r0, _080ABA74 @ =0x02024460
	movs r2, #8
	movs r3, #8
	bl PutCgBackground
	ldr r0, _080ABA98 @ =0x08413F00
	ldr r1, _080ABA9C @ =0x06012000
	bl Decompress
	ldr r0, _080ABAA0 @ =0x08414844
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x40
	bl ApplyPaletteExt
	adds r0, r4, #0
	bl sub_080AC78C
	adds r1, r7, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	orrs r0, r5
	strb r0, [r1]
	adds r1, #8
	movs r0, #0xf
	strb r0, [r1]
	adds r1, #1
	movs r0, #3
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x46
	mov r3, sb
	strb r3, [r0]
	ldr r0, _080ABAA4 @ =0x0000FFE0
	ldrh r1, [r7, #0x3c]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	ldr r1, _080ABAA8 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x3c]
	adds r0, r4, #0
	bl StartGreenText
	bl sub_080AB2C0
	ldr r0, _080ABAAC @ =sub_080AB78C
	adds r1, r4, #0
	bl sub_080A92F8
	ldr r0, _080ABAB0 @ =0x08CE54B4
	adds r1, r4, #0
	bl SpawnProc
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080ABA64: .4byte 0x03002870
_080ABA68: .4byte 0x02022C60
_080ABA6C: .4byte 0x02023460
_080ABA70: .4byte 0x02023C60
_080ABA74: .4byte 0x02024460
_080ABA78: .4byte 0x08413D6C
_080ABA7C: .4byte 0x06004000
_080ABA80: .4byte 0x083FCBAC
_080ABA84: .4byte 0x083FCBCC
_080ABA88: .4byte 0x08414884
_080ABA8C: .4byte 0x08414918
_080ABA90: .4byte 0x0000FFFE
_080ABA94: .4byte 0x0000FFFC
_080ABA98: .4byte 0x08413F00
_080ABA9C: .4byte 0x06012000
_080ABAA0: .4byte 0x08414844
_080ABAA4: .4byte 0x0000FFE0
_080ABAA8: .4byte 0x0000E0FF
_080ABAAC: .4byte sub_080AB78C
_080ABAB0: .4byte 0x08CE54B4

	thumb_func_start sub_080ABAB4
sub_080ABAB4: @ 0x080ABAB4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl sub_080041C0
	lsls r0, r0, #0x18
	asrs r3, r0, #0x18
	cmp r3, #0
	bne _080ABAF4
	adds r0, r4, #0
	adds r0, #0x32
	strb r5, [r0]
	movs r0, #1
	strh r0, [r4, #0x2c]
	ldr r1, _080ABAF0 @ =0x08CE4D28
	lsls r0, r5, #4
	adds r0, r0, r1
	ldr r0, [r0]
	movs r2, #0x80
	lsls r2, r2, #1
	str r3, [sp]
	adds r1, r2, #0
	adds r3, r6, #0
	bl sub_080040F8
	movs r0, #1
	b _080ABAF6
	.align 2, 0
_080ABAF0: .4byte 0x08CE4D28
_080ABAF4:
	movs r0, #0
_080ABAF6:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080ABB00
sub_080ABB00: @ 0x080ABB00
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	bl sub_080041C0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080ABB30
	movs r4, #0
	strh r0, [r5, #0x2c]
	movs r1, #0x80
	lsls r1, r1, #1
	str r0, [sp]
	movs r0, #0
	movs r2, #0
	movs r3, #0x18
	bl sub_080040F8
	adds r0, r5, #0
	adds r0, #0x2f
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
_080ABB30:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_080ABB38
sub_080ABB38: @ 0x080ABB38
	push {r4, lr}
	adds r4, r0, #0
	adds r4, #0x35
	ldrb r1, [r4]
	bl sub_080AADCC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080ABB52
	ldrb r0, [r4]
	bl sub_080AC384
	b _080ABB5A
_080ABB52:
	movs r0, #1
	rsbs r0, r0, #0
	bl sub_080AC384
_080ABB5A:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080ABB60
sub_080ABB60: @ 0x080ABB60
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r5, #0
	adds r0, #0x37
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080ABC54
	ldr r0, _080ABC3C @ =0x08B857F8
	ldr r1, [r0]
	ldrh r2, [r1, #6]
	adds r3, r4, #0
	adds r3, #0x38
	movs r0, #4
	strb r0, [r3]
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r6, [r1, #4]
	ands r0, r6
	cmp r0, #0
	beq _080ABB92
	ldrh r2, [r1, #4]
	movs r0, #8
	strb r0, [r3]
_080ABB92:
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _080ABB9E
	movs r5, #4
	rsbs r5, r5, #0
_080ABB9E:
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _080ABBA8
	movs r5, #4
_080ABBA8:
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _080ABBC2
	adds r1, r4, #0
	adds r1, #0x35
	movs r0, #3
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080ABBC2
	movs r5, #1
	rsbs r5, r5, #0
_080ABBC2:
	movs r0, #0x10
	ands r2, r0
	cmp r2, #0
	beq _080ABBDA
	adds r1, r4, #0
	adds r1, #0x35
	movs r0, #3
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #2
	bhi _080ABBDA
	movs r5, #1
_080ABBDA:
	cmp r5, #0
	beq _080ABC46
	adds r2, r4, #0
	adds r2, #0x35
	ldrb r1, [r2]
	adds r0, r1, r5
	cmp r0, #0
	bge _080ABBEC
	b _080ABD44
_080ABBEC:
	adds r1, r4, #0
	adds r1, #0x36
	ldrb r1, [r1]
	cmp r0, r1
	blt _080ABBF8
	b _080ABD44
_080ABBF8:
	strb r0, [r2]
	adds r0, r4, #0
	bl sub_080ABB38
	adds r0, r4, #0
	bl sub_080AB604
	adds r5, r4, #0
	adds r5, #0x37
	strb r0, [r5]
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _080ABC40
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080ABC24
	adds r0, r4, #0
	movs r1, #0xa
	bl Proc_Goto
_080ABC24:
	ldrb r5, [r5]
	cmp r5, #1
	bne _080ABC32
	adds r0, r4, #0
	movs r1, #0xb
	bl Proc_Goto
_080ABC32:
	adds r0, r4, #0
	bl sub_080AB654
	b _080ABC46
	.align 2, 0
_080ABC3C: .4byte 0x08B857F8
_080ABC40:
	adds r0, r4, #0
	bl sub_080AB5DC
_080ABC46:
	adds r0, r4, #0
	adds r0, #0x37
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080ABC94
_080ABC54:
	adds r5, r4, #0
	adds r5, #0x37
	movs r1, #0
	ldrsb r1, [r5, r1]
	adds r0, r4, #0
	adds r0, #0x38
	ldrb r0, [r0]
	adds r2, r0, #0
	muls r2, r1, r2
	ldrh r6, [r4, #0x2a]
	adds r2, r6, r2
	strh r2, [r4, #0x2a]
	ldr r1, _080ABC90 @ =0x0000FFFC
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl SetBgOffset
	movs r0, #0xf
	ldrh r1, [r4, #0x2a]
	ands r0, r1
	cmp r0, #0
	bne _080ABC86
	movs r0, #0
	strb r0, [r5]
_080ABC86:
	adds r0, r4, #0
	bl sub_080AB5AC
	b _080ABD44
	.align 2, 0
_080ABC90: .4byte 0x0000FFFC
_080ABC94:
	ldr r0, _080ABCB0 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080ABCB4
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	b _080ABD44
	.align 2, 0
_080ABCB0: .4byte 0x08B857F8
_080ABCB4:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080ABCC4
	adds r0, r4, #0
	bl sub_080ABB00
	b _080ABD44
_080ABCC4:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080ABD18
	adds r5, r4, #0
	adds r5, #0x35
	ldrb r1, [r5]
	adds r0, r4, #0
	bl sub_080AADCC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080ABCFC
	ldrb r1, [r5]
	adds r0, r4, #0
	movs r2, #0x20
	bl sub_080ABAB4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080ABD44
	adds r0, r4, #0
	bl sub_080AB4EC
	adds r1, r4, #0
	bl sub_080AC87C
	b _080ABD44
_080ABCFC:
	ldr r0, _080ABD14 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080ABD44
	movs r0, #0xe3
	lsls r0, r0, #2
	bl sub_080BE594
	b _080ABD44
	.align 2, 0
_080ABD14: .4byte 0x0202BBF8
_080ABD18:
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080ABD34
	bl sub_080041C0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080ABD44
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
	b _080ABD44
_080ABD34:
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080ABD44
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
_080ABD44:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080ABD4C
sub_080ABD4C: @ 0x080ABD4C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl sub_080041C0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080ABD72
	str r0, [sp]
	movs r0, #0x5a
	movs r1, #0
	movs r2, #0xc0
	movs r3, #0x18
	bl sub_080040F8
	adds r0, r4, #0
	bl Proc_Break
_080ABD72:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080ABD7C
sub_080ABD7C: @ 0x080ABD7C
	push {lr}
	bl sub_080A9DC0
	ldr r0, _080ABD8C @ =0x08CE54B4
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080ABD8C: .4byte 0x08CE54B4

	thumb_func_start sub_080ABD90
sub_080ABD90: @ 0x080ABD90
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r4, r0, #0
	adds r6, r4, #0
	adds r6, #0x3b
	ldrb r1, [r6]
	rsbs r0, r1, #0
	movs r1, #3
	bl __divsi3
	adds r5, r4, #0
	adds r5, #0x3c
	strb r0, [r5]
	ldrb r1, [r6]
	rsbs r0, r1, #0
	lsls r0, r0, #1
	movs r1, #3
	bl __divsi3
	adds r7, r4, #0
	adds r7, #0x3d
	strb r0, [r7]
	ldrb r0, [r6]
	adds r6, #3
	strb r0, [r6]
	ldr r0, _080ABEE0 @ =0x02022C60
	movs r1, #0
	bl TmFill
	ldr r0, _080ABEE4 @ =0x02023460
	movs r1, #0
	bl TmFill
	ldr r0, _080ABEE8 @ =0x02023C60
	movs r1, #0
	bl TmFill
	ldr r4, _080ABEEC @ =0x08CE5480
	ldr r0, [r4]
	movs r1, #2
	mov sl, r1
	str r1, [sp]
	movs r1, #0
	ldrsb r1, [r5, r1]
	adds r1, #1
	str r1, [sp, #4]
	movs r1, #0x1a
	str r1, [sp, #8]
	movs r1, #6
	mov sb, r1
	str r1, [sp, #0xc]
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl sub_080A8838
	ldr r0, [r4]
	movs r1, #0
	ldrsb r1, [r7, r1]
	adds r1, #2
	str r1, [sp]
	movs r1, #7
	mov r8, r1
	str r1, [sp, #4]
	movs r5, #9
	str r5, [sp, #8]
	movs r1, #4
	str r1, [sp, #0xc]
	movs r1, #0
	movs r2, #7
	movs r3, #1
	bl sub_080A8838
	ldr r0, [r4]
	movs r1, #0
	ldrsb r1, [r7, r1]
	adds r1, #2
	str r1, [sp]
	movs r1, #0xb
	str r1, [sp, #4]
	str r5, [sp, #8]
	movs r1, #8
	str r1, [sp, #0xc]
	movs r1, #0
	movs r2, #0xb
	movs r3, #1
	bl sub_080A8838
	ldr r0, [r4]
	movs r1, #0
	ldrsb r1, [r6, r1]
	adds r1, #0xb
	str r1, [sp]
	mov r1, r8
	str r1, [sp, #4]
	movs r1, #0x11
	str r1, [sp, #8]
	movs r1, #0xc
	str r1, [sp, #0xc]
	movs r1, #0xa
	movs r2, #7
	movs r3, #1
	bl sub_080A8838
	ldr r0, [r4]
	movs r1, #0
	ldrsb r1, [r6, r1]
	adds r1, #0x16
	str r1, [sp]
	movs r5, #5
	str r5, [sp, #4]
	mov r1, sb
	str r1, [sp, #8]
	movs r1, #3
	str r1, [sp, #0xc]
	movs r1, #0xa
	movs r2, #0x13
	movs r3, #1
	bl sub_080A8838
	ldr r4, _080ABEF0 @ =0x08CE5484
	ldr r0, [r4]
	movs r1, #0
	ldrsb r1, [r6, r1]
	adds r1, #0xc
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	movs r1, #0x10
	str r1, [sp, #8]
	movs r1, #0x20
	str r1, [sp, #0xc]
	movs r1, #0xc
	movs r2, #0
	movs r3, #2
	bl sub_080A8838
	ldr r0, [r4]
	movs r1, #0
	ldrsb r1, [r6, r1]
	adds r1, #0x16
	str r1, [sp]
	str r5, [sp, #4]
	mov r1, sb
	str r1, [sp, #8]
	mov r1, sl
	str r1, [sp, #0xc]
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_080A8838
	movs r0, #7
	bl EnableBgSync
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080ABEE0: .4byte 0x02022C60
_080ABEE4: .4byte 0x02023460
_080ABEE8: .4byte 0x02023C60
_080ABEEC: .4byte 0x08CE5480
_080ABEF0: .4byte 0x08CE5484

	thumb_func_start sub_080ABEF4
sub_080ABEF4: @ 0x080ABEF4
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #0xc
	mov sb, r0
	adds r0, #0x3b
	movs r5, #0
	strb r5, [r0]
	ldr r6, _080ABFAC @ =0x08CE5480
	ldr r0, [r6]
	movs r1, #6
	str r1, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	movs r1, #0
	movs r2, #0
	movs r3, #0x1a
	bl sub_08049B78
	ldr r0, [r6]
	movs r1, #4
	str r1, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	movs r1, #0
	movs r2, #7
	movs r3, #9
	bl sub_08049B78
	ldr r0, [r6]
	movs r1, #0xb0
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r1, _080ABFB0 @ =0x08414884
	movs r2, #0x80
	lsls r2, r2, #5
	mov r8, r2
	bl TmApplyTsa_t
	ldr r0, [r6]
	movs r1, #0xc
	str r1, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	movs r1, #0xa
	movs r2, #7
	movs r3, #0x11
	bl sub_08049B78
	ldr r0, [r6]
	ldr r1, _080ABFB4 @ =0x000004D4
	adds r0, r0, r1
	ldr r1, _080ABFB8 @ =0x08414918
	mov r2, r8
	bl TmApplyTsa_t
	ldr r0, _080ABFBC @ =0x02023C60
	ldr r4, _080ABFC0 @ =0x08CE5484
	ldr r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #2
	bl CpuFastSet
	ldr r0, [r4]
	mov r1, sb
	bl sub_080AB75C
	ldr r0, [r6]
	movs r2, #0xc8
	lsls r2, r2, #3
	adds r0, r0, r2
	ldr r1, _080ABFC4 @ =0x08413D90
	mov r2, r8
	bl TmApplyTsa_t
	bl sub_080A9564
	movs r0, #0
	bl sub_080A8D54
	movs r0, #0x3a
	add sb, r0
	mov r1, sb
	strb r5, [r1]
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080ABFAC: .4byte 0x08CE5480
_080ABFB0: .4byte 0x08414884
_080ABFB4: .4byte 0x000004D4
_080ABFB8: .4byte 0x08414918
_080ABFBC: .4byte 0x02023C60
_080ABFC0: .4byte 0x08CE5484
_080ABFC4: .4byte 0x08413D90

	thumb_func_start sub_080ABFC8
sub_080ABFC8: @ 0x080ABFC8
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x3a
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r1, [r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	muls r0, r1, r0
	asrs r0, r0, #6
	adds r4, r5, #0
	adds r4, #0x3b
	strb r0, [r4]
	adds r0, r5, #0
	bl sub_080ABD90
	ldrb r4, [r4]
	cmp r4, #0x18
	bne _080ABFFA
	adds r0, r5, #0
	bl Proc_Break
_080ABFFA:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_080AC000
sub_080AC000: @ 0x080AC000
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AC020 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #5
	ands r0, r1
	cmp r0, #0
	beq _080AC024
	adds r0, r4, #0
	bl sub_080AB4EC
	adds r1, r4, #0
	bl sub_080AC87C
	b _080AC068
	.align 2, 0
_080AC020: .4byte 0x08B857F8
_080AC024:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080AC034
	adds r0, r4, #0
	bl sub_080AB1C8
	b _080AC068
_080AC034:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080AC044
	adds r0, r4, #0
	bl sub_080AB228
	b _080AC068
_080AC044:
	ldr r0, _080AC054 @ =0x00000302
	ands r0, r1
	cmp r0, #0
	beq _080AC058
	adds r0, r4, #0
	bl Proc_Break
	b _080AC068
	.align 2, 0
_080AC054: .4byte 0x00000302
_080AC058:
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080AC068
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
_080AC068:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080AC070
sub_080AC070: @ 0x080AC070
	push {r4, lr}
	adds r4, r0, #0
	bl sub_080ABB38
	adds r4, #0x3a
	movs r0, #0
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080AC084
sub_080AC084: @ 0x080AC084
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r2, r5, #0
	adds r2, #0x3a
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	movs r1, #8
	subs r1, r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	muls r0, r1, r0
	cmp r0, #0
	bge _080AC0A4
	adds r0, #0x3f
_080AC0A4:
	asrs r0, r0, #6
	adds r4, r5, #0
	adds r4, #0x3b
	strb r0, [r4]
	adds r0, r5, #0
	bl sub_080ABD90
	ldrb r0, [r4]
	cmp r0, #0
	bne _080AC0CA
	adds r0, r5, #0
	bl sub_080AB5DC
	adds r0, r5, #0
	bl sub_080AB5AC
	adds r0, r5, #0
	bl Proc_Break
_080AC0CA:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_080AC0D0
sub_080AC0D0: @ 0x080AC0D0
	push {lr}
	adds r2, r0, #0
	adds r2, #0x3a
	movs r1, #0
	strb r1, [r2]
	strh r1, [r0, #0x2c]
	bl sub_080AB04C
	pop {r0}
	bx r0

	thumb_func_start sub_080AC0E4
sub_080AC0E4: @ 0x080AC0E4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r7, r0, #0
	adds r6, r7, #0
	adds r6, #0x3a
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	movs r1, #8
	subs r1, r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	muls r1, r0, r1
	cmp r1, #0
	bge _080AC106
	adds r1, #0x3f
_080AC106:
	asrs r1, r1, #6
	movs r0, #0x18
	subs r0, r0, r1
	adds r5, r7, #0
	adds r5, #0x3b
	strb r0, [r5]
	ldrb r0, [r5]
	movs r1, #3
	bl __udivsi3
	movs r1, #0x14
	subs r1, r1, r0
	adds r4, r7, #0
	adds r4, #0x3c
	strb r1, [r4]
	ldr r0, _080AC16C @ =0x02023460
	movs r1, #0
	bl TmFill
	ldr r0, _080AC170 @ =0x08CE5480
	ldr r0, [r0]
	movs r1, #2
	str r1, [sp]
	movs r1, #0
	ldrsb r1, [r4, r1]
	adds r1, #1
	str r1, [sp, #4]
	movs r1, #0x1a
	str r1, [sp, #8]
	movs r1, #7
	str r1, [sp, #0xc]
	movs r1, #0
	movs r2, #0x19
	movs r3, #1
	bl sub_080A8838
	movs r0, #2
	bl EnableBgSync
	ldrb r5, [r5]
	cmp r5, #0x18
	bne _080AC164
	movs r0, #0
	strb r0, [r6]
	adds r0, r7, #0
	bl Proc_Break
_080AC164:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AC16C: .4byte 0x02023460
_080AC170: .4byte 0x08CE5480

	thumb_func_start sub_080AC174
sub_080AC174: @ 0x080AC174
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0
	bne _080AC216
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080AC1B4
	ldr r0, _080AC1B0 @ =0x08CE4D28
	adds r1, r4, #0
	adds r1, #0x32
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #4
	adds r0, #4
	adds r1, r1, r0
	ldr r0, [r1]
	ldrh r1, [r4, #0x2c]
	cmp r1, r0
	blt _080AC1B4
	adds r0, r4, #0
	bl sub_080AB00C
	b _080AC216
	.align 2, 0
_080AC1B0: .4byte 0x08CE4D28
_080AC1B4:
	ldr r0, _080AC1CC @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080AC1D0
	adds r0, r4, #0
	bl sub_080AB1C8
	b _080AC216
	.align 2, 0
_080AC1CC: .4byte 0x08B857F8
_080AC1D0:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080AC1E0
	adds r0, r4, #0
	bl sub_080AB228
	b _080AC216
_080AC1E0:
	movs r0, #6
	ands r0, r1
	cmp r0, #0
	beq _080AC1F0
	adds r0, r4, #0
	bl Proc_Break
	b _080AC216
_080AC1F0:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080AC206
	adds r0, r4, #0
	bl sub_080AB4EC
	adds r1, r4, #0
	bl sub_080AC87C
	b _080AC216
_080AC206:
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080AC216
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
_080AC216:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080AC21C
sub_080AC21C: @ 0x080AC21C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	adds r2, r6, #0
	adds r2, #0x3a
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	movs r1, #8
	subs r1, r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	muls r0, r1, r0
	cmp r0, #0
	bge _080AC23E
	adds r0, #0x3f
_080AC23E:
	asrs r0, r0, #6
	adds r5, r6, #0
	adds r5, #0x3b
	strb r0, [r5]
	ldrb r0, [r5]
	movs r1, #3
	bl __udivsi3
	movs r1, #0x14
	subs r1, r1, r0
	adds r4, r6, #0
	adds r4, #0x3c
	strb r1, [r4]
	ldr r0, _080AC2A4 @ =0x02023460
	movs r1, #0
	bl TmFill
	ldr r0, _080AC2A8 @ =0x08CE5480
	ldr r0, [r0]
	movs r1, #2
	str r1, [sp]
	movs r1, #0
	ldrsb r1, [r4, r1]
	adds r1, #1
	str r1, [sp, #4]
	movs r1, #0x1a
	str r1, [sp, #8]
	movs r1, #7
	str r1, [sp, #0xc]
	movs r1, #0
	movs r2, #0x19
	movs r3, #1
	bl sub_080A8838
	movs r0, #2
	bl EnableBgSync
	ldrb r1, [r5]
	cmp r1, #0
	bne _080AC29A
	adds r0, r6, #0
	adds r0, #0x30
	strb r1, [r0]
	adds r0, r6, #0
	bl Proc_Break
_080AC29A:
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AC2A4: .4byte 0x02023460
_080AC2A8: .4byte 0x08CE5480

	thumb_func_start sub_080AC2AC
sub_080AC2AC: @ 0x080AC2AC
	push {lr}
	adds r1, r0, #0
	ldr r0, _080AC2BC @ =0x08CE54E4
	bl SpawnProcLocking
	pop {r1}
	bx r1
	.align 2, 0
_080AC2BC: .4byte 0x08CE54E4

	thumb_func_start sub_080AC2C0
sub_080AC2C0: @ 0x080AC2C0
	push {r4, r5, r6, lr}
	ldr r6, _080AC368 @ =0x06014000
	ldr r4, _080AC36C @ =0x0201EA50
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #5
	bl InitSpriteTextFont
	ldr r0, _080AC370 @ =0x08194674
	movs r5, #0xd0
	lsls r5, r5, #2
	adds r1, r5, #0
	movs r2, #0x40
	bl ApplyPaletteExt
	ldr r0, _080AC374 @ =0x02022860
	adds r0, r0, r5
	movs r1, #0
	strh r1, [r0]
	bl EnablePalSync
	adds r0, r4, #0
	bl SetTextFont
	adds r0, r4, #0
	adds r0, #0x18
	bl InitSpriteText
	adds r0, r4, #0
	adds r0, #0x20
	bl InitSpriteText
	adds r4, #0x28
	movs r5, #2
_080AC304:
	adds r0, r4, #0
	bl InitSpriteText
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _080AC304
	movs r0, #0
	bl SetTextFont
	ldr r4, _080AC36C @ =0x0201EA50
	ldr r0, _080AC378 @ =0x0001FFFF
	ands r0, r6
	lsrs r0, r0, #5
	ldr r2, _080AC37C @ =0x000003FF
	adds r1, r2, #0
	ands r0, r1
	movs r2, #0xa0
	lsls r2, r2, #8
	adds r1, r2, #0
	adds r0, r0, r1
	adds r1, r4, #0
	adds r1, #0x48
	strh r0, [r1]
	movs r0, #0
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	adds r4, #0x40
	adds r0, r4, #0
	movs r1, #2
	bl InitText
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	movs r1, #1
	bl Text_SetCursor
	ldr r1, _080AC380 @ =0x08418E40
	adds r0, r4, #0
	bl Text_DrawString
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AC368: .4byte 0x06014000
_080AC36C: .4byte 0x0201EA50
_080AC370: .4byte 0x08194674
_080AC374: .4byte 0x02022860
_080AC378: .4byte 0x0001FFFF
_080AC37C: .4byte 0x000003FF
_080AC380: .4byte 0x08418E40

	thumb_func_start sub_080AC384
sub_080AC384: @ 0x080AC384
	push {r4, r5, lr}
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080AC39C
	ldr r0, _080AC398 @ =0x08CE5388
	ldr r0, [r0]
	b _080AC3A6
	.align 2, 0
_080AC398: .4byte 0x08CE5388
_080AC39C:
	ldr r0, _080AC3F0 @ =0x08CE4D28
	lsls r1, r1, #4
	adds r0, #0xc
	adds r1, r1, r0
	ldr r0, [r1]
_080AC3A6:
	bl GetMsg
	adds r5, r0, #0
	ldr r4, _080AC3F4 @ =0x0201EA50
	adds r0, r4, #0
	bl SetTextFont
	movs r0, #1
	bl SetTextFontGlyphs
	adds r4, #0x18
	adds r0, r4, #0
	movs r1, #0
	bl sub_08005CF8
	movs r0, #0xa0
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_SetCursor
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColor
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_DrawString
	movs r0, #0
	bl SetTextFont
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AC3F0: .4byte 0x08CE4D28
_080AC3F4: .4byte 0x0201EA50

	thumb_func_start sub_080AC3F8
sub_080AC3F8: @ 0x080AC3F8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	cmp r7, #0x20
	bls _080AC4A8
	movs r0, #0xff
	mov r1, sl
	ands r1, r0
	mov sl, r1
	ldr r4, _080AC4B8 @ =0x080C5A48
	movs r2, #0x80
	adds r2, r2, r4
	mov sb, r2
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	mov r1, r8
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, sb
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_08003388
	movs r4, #0
	ldr r6, _080AC4BC @ =0x0201EA98
	movs r5, #0x28
_080AC482:
	lsls r0, r4, #2
	ldrh r1, [r6]
	adds r0, r1, r0
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r0, r2
	str r0, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x80
	lsls r2, r2, #1
	add r2, sl
	ldr r3, _080AC4C0 @ =0x08B905F8
	bl sub_08006A34
	adds r5, #0x20
	adds r4, #1
	cmp r4, #4
	ble _080AC482
_080AC4A8:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AC4B8: .4byte 0x080C5A48
_080AC4BC: .4byte 0x0201EA98
_080AC4C0: .4byte 0x08B905F8

	thumb_func_start sub_080AC4C4
sub_080AC4C4: @ 0x080AC4C4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov sb, r0
	mov r8, r1
	adds r4, r2, #0
	movs r6, #0
	movs r7, #0xd
	cmp r3, #0
	beq _080AC532
	movs r0, #0xff
	ands r1, r0
	mov r8, r1
	cmp r4, #7
	ble _080AC514
	mov r5, sb
_080AC4E8:
	subs r4, #8
	ldr r1, _080AC540 @ =0x000001FF
	ands r1, r5
	lsls r0, r7, #0xc
	ldr r2, _080AC544 @ =0x00000847
	adds r0, r0, r2
	str r0, [sp]
	movs r0, #0
	mov r2, r8
	ldr r3, _080AC548 @ =0x08B905B0
	bl sub_08006A34
	adds r5, #8
	adds r6, #1
	cmp r6, #2
	ble _080AC50A
	movs r7, #0xe
_080AC50A:
	cmp r6, #4
	ble _080AC510
	movs r7, #0xf
_080AC510:
	cmp r4, #7
	bgt _080AC4E8
_080AC514:
	lsls r1, r6, #3
	add r1, sb
	ldr r0, _080AC540 @ =0x000001FF
	ands r1, r0
	ldr r3, _080AC548 @ =0x08B905B0
	lsls r0, r7, #0xc
	adds r0, r4, r0
	movs r2, #0x84
	lsls r2, r2, #4
	adds r0, r0, r2
	str r0, [sp]
	movs r0, #0
	mov r2, r8
	bl sub_08006A34
_080AC532:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AC540: .4byte 0x000001FF
_080AC544: .4byte 0x00000847
_080AC548: .4byte 0x08B905B0

	thumb_func_start sub_080AC54C
sub_080AC54C: @ 0x080AC54C
	push {r4, r5, r6, r7, lr}
	ldr r7, [r0, #0x14]
	ldr r0, _080AC584 @ =0x0201EA9C
	movs r6, #0x40
	adds r5, r0, #0
	adds r5, #0x30
	movs r4, #1
_080AC55A:
	ldrb r3, [r5]
	adds r0, r7, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r0, #0x18
	adds r1, r6, #0
	adds r2, r3, #0
	bl sub_080AC4C4
	adds r6, #8
	adds r5, #0x31
	subs r4, #1
	cmp r4, #0
	bge _080AC55A
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AC584: .4byte 0x0201EA9C

	thumb_func_start sub_080AC588
sub_080AC588: @ 0x080AC588
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	adds r7, r1, #0
	adds r0, r2, #0
	movs r1, #0x3c
	bl __divsi3
	adds r5, r0, #0
	movs r1, #0x3c
	bl __divsi3
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #0x3c
	bl __modsi3
	mov r8, r0
	ldr r3, _080AC610 @ =0x08CE5654
	movs r5, #0x80
	lsls r5, r5, #7
	str r5, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r7, #0
	bl sub_08006A34
	adds r1, r6, #0
	adds r1, #0x28
	ldr r0, _080AC614 @ =0x08CE56BC
	mov sb, r0
	lsls r4, r4, #2
	add r4, sb
	ldr r3, [r4]
	str r5, [sp]
	movs r0, #0
	adds r2, r7, #0
	bl sub_08006A34
	adds r1, r6, #0
	adds r1, #0x30
	ldr r3, _080AC618 @ =0x08CE5662
	str r5, [sp]
	movs r0, #0
	adds r2, r7, #0
	bl sub_08006A34
	mov r0, r8
	cmp r0, #9
	ble _080AC61C
	adds r4, r6, #0
	adds r4, #0x38
	movs r1, #0xa
	bl __divsi3
	lsls r0, r0, #2
	add r0, sb
	ldr r3, [r0]
	str r5, [sp]
	movs r0, #0
	adds r1, r4, #0
	adds r2, r7, #0
	bl sub_08006A34
	b _080AC62E
	.align 2, 0
_080AC610: .4byte 0x08CE5654
_080AC614: .4byte 0x08CE56BC
_080AC618: .4byte 0x08CE5662
_080AC61C:
	adds r1, r6, #0
	adds r1, #0x38
	mov r0, sb
	ldr r3, [r0]
	str r5, [sp]
	movs r0, #0
	adds r2, r7, #0
	bl sub_08006A34
_080AC62E:
	adds r5, r6, #0
	adds r5, #0x40
	ldr r4, _080AC660 @ =0x08CE56BC
	mov r0, r8
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r3, [r0]
	movs r0, #0x80
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #0
	adds r1, r5, #0
	adds r2, r7, #0
	bl sub_08006A34
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AC660: .4byte 0x08CE56BC

	thumb_func_start sub_080AC664
sub_080AC664: @ 0x080AC664
	movs r1, #0
	str r1, [r0, #0x2c]
	bx lr
	.align 2, 0

	thumb_func_start sub_080AC66C
sub_080AC66C: @ 0x080AC66C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldr r6, [r7, #0x14]
	adds r4, r6, #0
	adds r4, #0x3c
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r0, r0, #3
	adds r0, #0x18
	movs r1, #0x80
	lsls r1, r1, #1
	bl sub_080AC3F8
	adds r0, r6, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080AC712
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r4, r0, #3
	adds r4, #0x30
	movs r5, #0xff
	ands r4, r5
	movs r2, #0xc
	subs r2, r2, r0
	lsls r2, r2, #3
	adds r2, #4
	ands r2, r5
	movs r0, #0x80
	lsls r0, r0, #3
	adds r2, r2, r0
	ldr r3, _080AC76C @ =0x08CE560C
	movs r0, #0xa0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #0
	movs r1, #4
	bl sub_08006A34
	adds r2, r4, #1
	ands r2, r5
	ldr r3, _080AC770 @ =0x08CE562C
	movs r5, #0x80
	lsls r5, r5, #7
	str r5, [sp]
	movs r0, #0
	movs r1, #0x88
	bl sub_08006A34
	ldrh r1, [r6, #0x2c]
	lsls r0, r1, #5
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r2, _080AC774 @ =0x08CE4D28
	adds r1, r6, #0
	adds r1, #0x32
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #4
	adds r2, #4
	adds r1, r1, r2
	ldr r1, [r1]
	adds r1, #0x78
	bl __divsi3
	adds r1, r0, #0
	adds r1, #0x88
	ldr r3, _080AC778 @ =0x08CE564C
	str r5, [sp]
	movs r0, #0
	adds r2, r4, #0
	bl sub_08006A34
	ldrh r2, [r6, #0x2c]
	movs r0, #0x3c
	adds r1, r4, #0
	bl sub_080AC588
_080AC712:
	adds r6, #0x3d
	movs r1, #0
	ldrsb r1, [r6, r1]
	lsls r1, r1, #3
	adds r1, #0x16
	ldr r5, _080AC77C @ =0x000001FF
	ands r1, r5
	ldr r3, _080AC780 @ =0x08CE55F4
	movs r4, #0x80
	lsls r4, r4, #7
	str r4, [sp]
	movs r0, #0xb
	movs r2, #0x58
	bl sub_080069F4
	movs r1, #0
	ldrsb r1, [r6, r1]
	lsls r1, r1, #3
	adds r1, #0x16
	ands r1, r5
	ldr r3, _080AC784 @ =0x08CE55FC
	str r4, [sp]
	movs r0, #0xb
	movs r2, #0x68
	bl sub_080069F4
	movs r1, #0
	ldrsb r1, [r6, r1]
	lsls r1, r1, #3
	adds r1, #0x16
	ands r1, r5
	ldr r3, _080AC788 @ =0x08CE5604
	str r4, [sp]
	movs r0, #0xb
	movs r2, #0x78
	bl sub_080069F4
	adds r0, r7, #0
	bl sub_080AC54C
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AC76C: .4byte 0x08CE560C
_080AC770: .4byte 0x08CE562C
_080AC774: .4byte 0x08CE4D28
_080AC778: .4byte 0x08CE564C
_080AC77C: .4byte 0x000001FF
_080AC780: .4byte 0x08CE55F4
_080AC784: .4byte 0x08CE55FC
_080AC788: .4byte 0x08CE5604

	thumb_func_start sub_080AC78C
sub_080AC78C: @ 0x080AC78C
	push {lr}
	adds r1, r0, #0
	ldr r0, _080AC79C @ =0x08CE56E4
	bl SpawnProc
	pop {r1}
	bx r1
	.align 2, 0
_080AC79C: .4byte 0x08CE56E4

	thumb_func_start sub_080AC7A0
sub_080AC7A0: @ 0x080AC7A0
	push {lr}
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	bl sub_080136AC
	pop {r0}
	bx r0

	thumb_func_start sub_080AC7B0
sub_080AC7B0: @ 0x080AC7B0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r2, r5, #0
	adds r2, #0x4c
	ldrh r0, [r2]
	adds r1, r0, #1
	strh r1, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0xc
	movs r4, #0x80
	lsls r4, r4, #1
	subs r4, r4, r0
	movs r3, #0xff
	lsls r3, r3, #8
	adds r0, r4, #0
	adds r1, r4, #0
	adds r2, r4, #0
	bl sub_08013728
	cmp r4, #0
	bne _080AC7E0
	adds r0, r5, #0
	bl Proc_Break
_080AC7E0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080AC7E8
sub_080AC7E8: @ 0x080AC7E8
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _080AC828 @ =0x02024460
	movs r1, #0x80
	lsls r1, r1, #8
	ldr r2, [r4, #0x58]
	str r2, [sp]
	movs r2, #8
	movs r3, #8
	bl PutCgBackground
	bl sub_080136AC
	movs r3, #0xff
	lsls r3, r3, #8
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_08013728
	movs r0, #8
	bl EnableBgSync
	adds r4, #0x4c
	movs r0, #0
	strh r0, [r4]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AC828: .4byte 0x02024460

	thumb_func_start sub_080AC82C
sub_080AC82C: @ 0x080AC82C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x4c
	ldrh r4, [r1]
	adds r0, r4, #1
	strh r0, [r1]
	lsls r4, r4, #0x10
	asrs r4, r4, #0xc
	movs r3, #0xff
	lsls r3, r3, #8
	adds r0, r4, #0
	adds r1, r4, #0
	adds r2, r4, #0
	bl sub_08013728
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r4, r0
	bne _080AC85A
	adds r0, r5, #0
	bl Proc_Break
_080AC85A:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_080AC860
sub_080AC860: @ 0x080AC860
	push {lr}
	ldr r0, _080AC870 @ =0x08CE5704
	bl Proc_Find
	cmp r0, #0
	bne _080AC874
	movs r0, #0
	b _080AC876
	.align 2, 0
_080AC870: .4byte 0x08CE5704
_080AC874:
	movs r0, #1
_080AC876:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080AC87C
sub_080AC87C: @ 0x080AC87C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl sub_080AC860
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080AC896
	ldr r0, _080AC89C @ =0x08CE5704
	adds r1, r4, #0
	bl SpawnProc
	str r5, [r0, #0x58]
_080AC896:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AC89C: .4byte 0x08CE5704

	thumb_func_start sub_080AC8A0
sub_080AC8A0: @ 0x080AC8A0
	push {r4, lr}
	ldr r0, _080AC8D8 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0xa0
	bls _080AC8B2
	movs r2, #0
_080AC8B2:
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	bne _080AC8F6
	cmp r2, #0x63
	bhi _080AC8E4
	ldr r1, _080AC8DC @ =0x04000050
	movs r0, #0xc1
	strh r0, [r1]
	ldr r4, _080AC8E0 @ =0x04000054
	movs r0, #0x64
	subs r0, r0, r2
	lsls r0, r0, #4
	movs r1, #0x64
	bl __divsi3
	strh r0, [r4]
	b _080AC8F6
	.align 2, 0
_080AC8D8: .4byte 0x04000006
_080AC8DC: .4byte 0x04000050
_080AC8E0: .4byte 0x04000054
_080AC8E4:
	ldr r1, _080AC8FC @ =0x04000050
	movs r2, #0xa2
	lsls r2, r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	ldr r2, _080AC900 @ =0x0000100A
	adds r0, r2, #0
	strh r0, [r1]
_080AC8F6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AC8FC: .4byte 0x04000050
_080AC900: .4byte 0x0000100A

	thumb_func_start sub_080AC904
sub_080AC904: @ 0x080AC904
	push {lr}
	movs r1, #4
	str r1, [r0, #0x58]
	ldr r0, _080AC938 @ =0x08CE5734
	bl InitBgs
	ldr r2, _080AC93C @ =0x03002870
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0x3f
	ldrb r1, [r2, #0x15]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r2, #0x15]
	pop {r0}
	bx r0
	.align 2, 0
_080AC938: .4byte 0x08CE5734
_080AC93C: .4byte 0x03002870

	thumb_func_start sub_080AC940
sub_080AC940: @ 0x080AC940
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _080ACA00 @ =0x0840F9A0
	movs r1, #0
	movs r2, #0x60
	bl ApplyPaletteExt
	ldr r0, _080ACA04 @ =0x08418E44
	ldr r1, _080ACA08 @ =0x06001000
	bl Decompress
	ldr r0, _080ACA0C @ =0x02022C60
	ldr r1, _080ACA10 @ =0x0840FA00
	movs r2, #0x80
	bl TmApplyTsa_t
	movs r0, #1
	bl EnableBgSync
	ldr r0, _080ACA14 @ =0x084138F0
	movs r1, #0x88
	lsls r1, r1, #2
	movs r2, #0x80
	lsls r2, r2, #1
	bl ApplyPaletteExt
	ldr r0, _080ACA18 @ =0x084120A0
	ldr r1, _080ACA1C @ =0x06010800
	bl Decompress
	ldr r0, _080ACA20 @ =0x084130A4
	ldr r1, _080ACA24 @ =0x06013800
	bl Decompress
	ldr r0, _080ACA28 @ =sub_080AC8A0
	bl SetOnHBlankA
	ldr r4, _080ACA2C @ =0x0840FEB4
	movs r0, #2
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080ACA30 @ =0x02024460
	ldr r1, _080ACA34 @ =0x08411F34
	movs r2, #0
	movs r3, #5
	bl sub_08001F3C
	movs r0, #8
	bl EnableBgSync
	ldr r4, _080ACA38 @ =0x03002870
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r4, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #1]
	adds r0, r5, #0
	bl sub_080A5CE0
	str r0, [r5, #0x54]
	movs r0, #3
	ldrb r2, [r4, #0xc]
	orrs r0, r2
	strb r0, [r4, #0xc]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r4, #0x10]
	ands r0, r2
	strb r0, [r4, #0x10]
	adds r0, r1, #0
	ldrb r2, [r4, #0x14]
	ands r0, r2
	movs r2, #2
	orrs r0, r2
	strb r0, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	ands r1, r0
	orrs r1, r2
	strb r1, [r4, #0x18]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080ACA00: .4byte 0x0840F9A0
_080ACA04: .4byte 0x08418E44
_080ACA08: .4byte 0x06001000
_080ACA0C: .4byte 0x02022C60
_080ACA10: .4byte 0x0840FA00
_080ACA14: .4byte 0x084138F0
_080ACA18: .4byte 0x084120A0
_080ACA1C: .4byte 0x06010800
_080ACA20: .4byte 0x084130A4
_080ACA24: .4byte 0x06013800
_080ACA28: .4byte sub_080AC8A0
_080ACA2C: .4byte 0x0840FEB4
_080ACA30: .4byte 0x02024460
_080ACA34: .4byte 0x08411F34
_080ACA38: .4byte 0x03002870

	thumb_func_start sub_080ACA3C
sub_080ACA3C: @ 0x080ACA3C
	push {lr}
	ldr r0, [r0, #0x54]
	bl Proc_End
	pop {r0}
	bx r0

	thumb_func_start sub_080ACA48
sub_080ACA48: @ 0x080ACA48
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x58]
	cmp r0, #0
	blt _080ACA80
	ldr r3, _080ACA88 @ =0x08CE4158
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #0x38
	movs r2, #8
	bl sub_08006A34
	ldr r1, _080ACA8C @ =0x08CE456C
	ldr r0, [r4, #0x58]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r3, [r0]
	movs r0, #0xc0
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #0x40
	movs r2, #0x10
	bl sub_08006A34
_080ACA80:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ACA88: .4byte 0x08CE4158
_080ACA8C: .4byte 0x08CE456C

	thumb_func_start sub_080ACA90
sub_080ACA90: @ 0x080ACA90
	push {lr}
	adds r1, r0, #0
	ldr r0, _080ACAA0 @ =0x08CE574C
	bl SpawnProc
	pop {r0}
	bx r0
	.align 2, 0
_080ACAA0: .4byte 0x08CE574C

	thumb_func_start sub_080ACAA4
sub_080ACAA4: @ 0x080ACAA4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080ACAB8 @ =0x08CE574C
	bl Proc_Find
	str r4, [r0, #0x58]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ACAB8: .4byte 0x08CE574C

	thumb_func_start sub_080ACABC
sub_080ACABC: @ 0x080ACABC
	push {lr}
	sub sp, #4
	ldr r0, _080ACAF0 @ =0x08CE45B4
	ldr r3, [r0]
	movs r0, #0x80
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #4
	movs r1, #0xc
	movs r2, #8
	bl sub_08006A34
	ldr r0, _080ACAF4 @ =0x08CE45A8
	ldr r3, [r0]
	movs r0, #0x90
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #4
	movs r1, #0x18
	movs r2, #0x10
	bl sub_08006A34
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080ACAF0: .4byte 0x08CE45B4
_080ACAF4: .4byte 0x08CE45A8

	thumb_func_start sub_080ACAF8
sub_080ACAF8: @ 0x080ACAF8
	push {r4, r5, lr}
	ldr r5, _080ACB60 @ =0x0202BBF8
	movs r2, #0x40
	adds r0, r2, #0
	ldrb r1, [r5, #0x14]
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	rsbs r0, r0, #0
	asrs r4, r0, #0x1f
	movs r0, #4
	ands r4, r0
	ldrb r1, [r5, #0x1b]
	cmp r1, #1
	bne _080ACB1A
	movs r0, #0x10
	orrs r4, r0
_080ACB1A:
	cmp r1, #2
	bne _080ACB22
	movs r0, #0x20
	orrs r4, r0
_080ACB22:
	cmp r1, #3
	bne _080ACB28
	orrs r4, r2
_080ACB28:
	movs r0, #1
	orrs r0, r4
	movs r1, #0x18
	bl sub_08082058
	adds r0, r4, #0
	movs r1, #0x19
	bl sub_08082058
	bl EnablePalSync
	movs r0, #0xac
	lsls r0, r0, #4
	bl sub_080823E0
	movs r4, #0xb4
	lsls r4, r4, #4
	adds r0, r5, #0
	bl sub_080824A4
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_08082308
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080ACB60: .4byte 0x0202BBF8

	thumb_func_start sub_080ACB64
sub_080ACB64: @ 0x080ACB64
	push {r4, r5, lr}
	ldr r0, _080ACBB4 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0xa0
	bls _080ACB76
	movs r5, #0
_080ACB76:
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	bne _080ACBAE
	cmp r5, #0x63
	bhi _080ACB98
	ldr r1, _080ACBB8 @ =0x04000050
	movs r0, #0xc8
	strh r0, [r1]
	ldr r4, _080ACBBC @ =0x04000054
	movs r0, #0x64
	subs r0, r0, r5
	lsls r0, r0, #4
	movs r1, #0x64
	bl __divsi3
	strh r0, [r4]
_080ACB98:
	cmp r5, #0
	bne _080ACBA4
	ldr r0, _080ACBC0 @ =0x04000012
	ldr r1, _080ACBC4 @ =0x03002870
	ldrh r1, [r1, #0x1e]
	strh r1, [r0]
_080ACBA4:
	cmp r5, #0x78
	bne _080ACBAE
	ldr r1, _080ACBC0 @ =0x04000012
	movs r0, #4
	strh r0, [r1]
_080ACBAE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080ACBB4: .4byte 0x04000006
_080ACBB8: .4byte 0x04000050
_080ACBBC: .4byte 0x04000054
_080ACBC0: .4byte 0x04000012
_080ACBC4: .4byte 0x03002870

	thumb_func_start sub_080ACBC8
sub_080ACBC8: @ 0x080ACBC8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	movs r0, #0
	mov r8, r0
	mov r0, sp
	mov r1, r8
	strh r1, [r0]
	ldr r0, _080ACC34 @ =0x08CE577C
	ldr r1, [r0]
	ldr r2, _080ACC38 @ =0x01000040
	mov r0, sp
	bl CpuSet
	mov r0, sp
	adds r0, #2
	mov r2, r8
	strh r2, [r0]
	ldr r4, _080ACC3C @ =0x08CE5774
	ldr r1, [r4]
	ldr r2, _080ACC40 @ =0x01000142
	bl CpuSet
	ldr r0, [r4]
	bl sub_0809F134
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080ACCCE
	ldr r0, [r4]
	ldr r1, _080ACC44 @ =0x08CE5778
	ldr r1, [r1]
	movs r2, #0xa1
	bl CpuFastSet
	movs r3, #0
	movs r7, #0
_080ACC14:
	ldr r0, _080ACC3C @ =0x08CE5774
	ldr r1, [r0]
	adds r2, r1, r7
	movs r1, #3
	ldrb r4, [r2]
	ands r1, r4
	cmp r1, #0
	beq _080ACCB6
	ldrb r1, [r2, #1]
	cmp r1, #1
	beq _080ACC4E
	cmp r1, #1
	bgt _080ACC48
	cmp r1, #0
	beq _080ACC5A
	b _080ACC98
	.align 2, 0
_080ACC34: .4byte 0x08CE577C
_080ACC38: .4byte 0x01000040
_080ACC3C: .4byte 0x08CE5774
_080ACC40: .4byte 0x01000142
_080ACC44: .4byte 0x08CE5778
_080ACC48:
	cmp r1, #2
	beq _080ACC5A
	b _080ACC98
_080ACC4E:
	ldr r0, _080ACC84 @ =0x0202BBF8
	adds r0, #0x2b
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _080ACCB6
_080ACC5A:
	ldr r5, _080ACC88 @ =0x08CE577C
	ldr r0, [r5]
	mov r1, r8
	lsls r4, r1, #2
	adds r0, r4, r0
	movs r6, #0
	strb r3, [r0]
	str r3, [sp, #4]
	bl sub_080A057C
	movs r2, #1
	adds r1, r2, #0
	ldr r3, [sp, #4]
	lsls r1, r3
	ands r1, r0
	cmp r1, #0
	beq _080ACC8C
	ldr r0, [r5]
	adds r0, r4, r0
	strb r6, [r0, #1]
	b _080ACC92
	.align 2, 0
_080ACC84: .4byte 0x0202BBF8
_080ACC88: .4byte 0x08CE577C
_080ACC8C:
	ldr r0, [r5]
	adds r0, r4, r0
	strb r2, [r0, #1]
_080ACC92:
	movs r2, #1
	add r8, r2
	ldr r0, _080ACCD8 @ =0x08CE5774
_080ACC98:
	ldr r1, [r0]
	adds r1, r1, r7
	movs r0, #3
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #1
	bne _080ACCB6
	ldr r0, _080ACCDC @ =0x08CE5778
	ldr r1, [r0]
	adds r1, r1, r7
	movs r0, #0xfc
	ldrb r4, [r1]
	ands r0, r4
	adds r0, #2
	strb r0, [r1]
_080ACCB6:
	adds r7, #0x14
	adds r3, #1
	cmp r3, #0x1f
	ble _080ACC14
	ldr r0, _080ACCE0 @ =0x08CE5780
	ldr r0, [r0]
	mov r1, r8
	str r1, [r0]
	ldr r0, _080ACCDC @ =0x08CE5778
	ldr r0, [r0]
	bl sub_0809F190
_080ACCCE:
	mov r2, r8
	cmp r2, #0
	beq _080ACCE4
	movs r0, #1
	b _080ACCE6
	.align 2, 0
_080ACCD8: .4byte 0x08CE5774
_080ACCDC: .4byte 0x08CE5778
_080ACCE0: .4byte 0x08CE5780
_080ACCE4:
	movs r0, #0
_080ACCE6:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080ACCF4
sub_080ACCF4: @ 0x080ACCF4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r4, _080ACD90 @ =0x08CE5784
	movs r1, #6
	bl __modsi3
	lsls r0, r0, #4
	ldr r1, [r4]
	adds r1, r1, r0
	mov r8, r1
	lsls r3, r5, #1
	movs r0, #0x1f
	ands r3, r0
	ldr r0, _080ACD94 @ =0x08CE577C
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldrb r1, [r0, #1]
	str r1, [sp, #8]
	movs r2, #0
	ldrsb r2, [r0, r2]
	ldr r0, _080ACD98 @ =0x08CE5774
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r6, r0, #2
	adds r1, r1, r6
	ldrb r7, [r1, #2]
	movs r1, #0
	str r1, [sp, #0xc]
	lsls r4, r3, #6
	ldr r0, _080ACD9C @ =0x02023C60
	mov sl, r0
	adds r1, r4, #0
	add r1, sl
	mov sb, r1
	mov r0, sb
	movs r1, #0x14
	movs r2, #1
	movs r3, #0
	bl TmFillRect_t
	mov r0, r8
	bl ClearText
	cmp r5, #0x1f
	bgt _080ACE22
	ldr r1, _080ACD98 @ =0x08CE5774
	ldr r0, [r1]
	adds r0, r0, r6
	movs r2, #3
	ldrb r1, [r0]
	ands r2, r1
	cmp r2, #0
	beq _080ACE22
	cmp r2, #1
	bne _080ACD74
	movs r1, #4
	str r1, [sp, #0xc]
_080ACD74:
	ldr r1, [sp, #8]
	cmp r1, #0
	bne _080ACD7E
	movs r1, #1
	str r1, [sp, #0xc]
_080ACD7E:
	ldrb r0, [r0, #1]
	cmp r0, #0
	blt _080ACE1C
	cmp r0, #1
	ble _080ACDA0
	cmp r0, #2
	beq _080ACDEE
	b _080ACE1C
	.align 2, 0
_080ACD90: .4byte 0x08CE5784
_080ACD94: .4byte 0x08CE577C
_080ACD98: .4byte 0x08CE5774
_080ACD9C: .4byte 0x02023C60
_080ACDA0:
	adds r0, r7, #0
	bl GetItemName
	mov r1, sl
	adds r1, #4
	adds r1, r4, r1
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	mov r0, r8
	ldr r2, [sp, #0xc]
	movs r3, #0
	bl sub_08005AD4
	mov r0, sl
	adds r0, #0x16
	adds r5, r4, r0
	ldr r4, [sp, #0xc]
	cmp r4, #0
	bne _080ACDCA
	movs r4, #2
_080ACDCA:
	adds r0, r7, #0
	bl GetItemMaxUses
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_080061E4
	adds r0, r7, #0
	bl GetItemIcon
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	mov r0, sb
	bl sub_08004E28
	b _080ACE1C
_080ACDEE:
	adds r0, r7, #0
	bl GetItemName
	mov r1, sl
	adds r1, #4
	adds r1, r4, r1
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	mov r0, r8
	ldr r2, [sp, #0xc]
	movs r3, #0
	bl sub_08005AD4
	adds r0, r7, #0
	bl GetItemIcon
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	mov r0, sb
	bl sub_08004E28
_080ACE1C:
	movs r0, #4
	bl EnableBgSync
_080ACE22:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080ACE34
sub_080ACE34: @ 0x080ACE34
	push {r4, r5, lr}
	ldr r1, _080ACE5C @ =0x08CE577C
	lsls r0, r0, #2
	ldr r4, [r1]
	adds r4, r4, r0
	movs r5, #0
	ldrsb r5, [r4, r5]
	bl sub_080A057C
	adds r1, r0, #0
	movs r0, #1
	lsls r0, r5
	orrs r0, r1
	bl sub_080A0588
	movs r0, #0
	strb r0, [r4, #1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080ACE5C: .4byte 0x08CE577C

	thumb_func_start sub_080ACE60
sub_080ACE60: @ 0x080ACE60
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	movs r4, #0
	movs r7, #0
	ldr r0, _080ACEC4 @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	bne _080ACE76
	movs r7, #1
_080ACE76:
	cmp r0, #3
	bne _080ACE7C
	movs r7, #2
_080ACE7C:
	bl ResetUnitSprites
	movs r5, #1
	adds r6, #0x2b
	mov r8, r6
	ldr r6, _080ACEC8 @ =0x08CE5788
_080ACE88:
	adds r0, r5, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _080ACEEA
	ldr r3, [r2]
	cmp r3, #0
	beq _080ACEEA
	ldr r0, [r2, #0xc]
	ldr r1, _080ACECC @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _080ACEEA
	cmp r7, #0
	beq _080ACED0
	ldrb r0, [r3, #4]
	cmp r0, r7
	bne _080ACED0
	ldr r0, [r6]
	lsls r1, r4, #3
	adds r1, r1, r0
	str r2, [r1, #4]
	adds r4, #1
	adds r0, r2, #0
	bl sub_08017610
	bl sub_08024DEC
	b _080ACEEA
	.align 2, 0
_080ACEC4: .4byte 0x0202BBF8
_080ACEC8: .4byte 0x08CE5788
_080ACECC: .4byte 0x00010004
_080ACED0:
	ldrb r3, [r3, #4]
	cmp r3, #0x28
	bne _080ACEEA
	ldr r0, [r6]
	lsls r1, r4, #3
	adds r1, r1, r0
	str r2, [r1, #4]
	adds r4, #1
	adds r0, r2, #0
	bl sub_08017610
	bl sub_08024DEC
_080ACEEA:
	adds r5, #1
	cmp r5, #0x3f
	ble _080ACE88
	mov r0, r8
	strb r4, [r0]
	bl ApplyUnitSpritePalettes
	bl ForceSyncUnitSpriteSheet
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080ACF08
sub_080ACF08: @ 0x080ACF08
	push {r4, lr}
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	movs r0, #6
	movs r1, #6
	movs r2, #0x12
	movs r3, #0xc
	bl sub_08049CE4
	movs r0, #1
	str r0, [sp]
	movs r0, #0x12
	movs r1, #0x11
	movs r2, #0xa
	movs r3, #3
	bl sub_08049CE4
	ldr r4, _080ACF58 @ =0x02023112
	bl GetGold
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #2
	bl sub_080061D8
	adds r4, #2
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0x1e
	bl sub_0800615C
	movs r0, #3
	bl EnableBgSync
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ACF58: .4byte 0x02023112

	thumb_func_start sub_080ACF5C
sub_080ACF5C: @ 0x080ACF5C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0
	bl InitBgs
	ldr r0, _080AD17C @ =0x0840F9A0
	movs r1, #0xc0
	lsls r1, r1, #1
	movs r2, #0x60
	bl ApplyPaletteExt
	ldr r0, _080AD180 @ =0x08418E44
	ldr r1, _080AD184 @ =0x06008000
	bl Decompress
	ldr r0, _080AD188 @ =0x02024460
	ldr r1, _080AD18C @ =0x0840FA00
	movs r2, #0xc0
	lsls r2, r2, #8
	bl TmApplyTsa_t
	movs r0, #8
	bl EnableBgSync
	bl LoadUiFrameGraphics
	bl ResetText
	bl InitIcons
	movs r0, #4
	bl ApplyIconPalettes
	bl ApplySystemObjectsGraphics
	bl sub_080ACAF8
	bl sub_080ACF08
	ldr r0, _080AD190 @ =0x03002870
	mov ip, r0
	movs r0, #0x21
	rsbs r0, r0, #0
	mov r1, ip
	ldrb r1, [r1, #1]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r2, ip
	strb r0, [r2, #1]
	mov r5, ip
	adds r5, #0x35
	movs r1, #1
	ldrb r0, [r5]
	orrs r0, r1
	movs r4, #2
	orrs r0, r4
	movs r2, #4
	orrs r0, r2
	movs r3, #8
	orrs r0, r3
	movs r2, #0x10
	orrs r0, r2
	strb r0, [r5]
	adds r5, #1
	ldrb r0, [r5]
	orrs r1, r0
	orrs r1, r4
	movs r0, #5
	rsbs r0, r0, #0
	ands r1, r0
	orrs r1, r3
	orrs r1, r2
	strb r1, [r5]
	mov r1, ip
	adds r1, #0x2f
	movs r0, #0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x38
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x88
	strb r0, [r1]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	mov r2, ip
	ldrb r2, [r2, #0xc]
	ands r0, r2
	mov r3, ip
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r2, [r3, #0x10]
	ands r0, r2
	orrs r0, r4
	strb r0, [r3, #0x10]
	ldrb r3, [r3, #0x14]
	ands r1, r3
	mov r0, ip
	strb r1, [r0, #0x14]
	movs r0, #3
	mov r1, ip
	ldrb r1, [r1, #0x18]
	orrs r0, r1
	mov r2, ip
	strb r0, [r2, #0x18]
	bl sub_080ACBC8
	movs r5, #0
	ldr r0, _080AD194 @ =0x08CE5780
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r5, r0
	bge _080AD086
	ldr r7, _080AD198 @ =0x08CE5784
_080AD058:
	lsls r0, r5, #4
	ldr r4, [r7]
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #7
	bl InitText
	adds r4, #8
	adds r0, r4, #0
	movs r1, #0xa
	bl InitText
	adds r0, r5, #0
	bl sub_080ACCF4
	adds r5, #1
	cmp r5, #5
	bgt _080AD086
	ldr r0, _080AD194 @ =0x08CE5780
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r5, r0
	blt _080AD058
_080AD086:
	adds r3, r6, #0
	adds r3, #0x29
	str r3, [sp]
	movs r0, #0x2e
	adds r0, r0, r6
	mov sl, r0
	movs r1, #0x2a
	adds r1, r1, r6
	mov r8, r1
	movs r2, #0x2b
	adds r2, r2, r6
	mov sb, r2
	ldr r7, _080AD198 @ =0x08CE5784
	movs r4, #0x60
	movs r5, #1
_080AD0A4:
	ldr r0, [r7]
	adds r0, r0, r4
	movs r1, #6
	bl InitText
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _080AD0A4
	movs r5, #2
	ldr r0, _080AD198 @ =0x08CE5784
	ldr r0, [r0]
	adds r0, #0x70
	movs r1, #0xf
	bl InitText
	ldr r0, _080AD19C @ =sub_080ACABC
	adds r1, r6, #0
	bl sub_080A92F8
	movs r0, #2
	bl EnableBgSync
	ldr r0, _080AD1A0 @ =sub_080ACB64
	bl SetOnHBlankA
	movs r0, #0
	ldr r3, [sp]
	strb r0, [r3]
	movs r1, #0
	strh r0, [r6, #0x2c]
	mov r2, sl
	strb r1, [r2]
	mov r3, r8
	strb r1, [r3]
	mov r1, sb
	strb r5, [r1]
	str r0, [r6, #0x34]
	ldr r1, _080AD1A4 @ =0x0000FFC0
	ldrh r2, [r6, #0x2c]
	subs r2, #0x38
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl SetBgOffset
	adds r0, r6, #0
	bl sub_080A947C
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl sub_080A94A0
	ldr r2, [sp]
	ldrb r2, [r2]
	lsls r1, r2, #4
	movs r3, #0x2c
	ldrsh r0, [r6, r3]
	subs r0, #0x38
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x40
	movs r2, #0xd
	bl sub_080A951C
	adds r0, r6, #0
	bl StartGreenText
	adds r0, r6, #0
	bl sub_08090490
	movs r0, #0xb0
	movs r1, #0x44
	bl sub_080904A4
	movs r0, #0x80
	lsls r0, r0, #2
	movs r1, #2
	bl sub_080904F8
	ldrh r1, [r6, #0x2c]
	ldr r0, _080AD194 @ =0x08CE5780
	ldr r0, [r0]
	ldrh r2, [r0]
	movs r0, #7
	movs r3, #5
	bl sub_080904C4
	adds r0, r6, #0
	bl sub_080A89B4
	adds r0, r6, #0
	bl sub_080ACE60
	ldr r0, _080AD1A8 @ =0x06013800
	movs r1, #5
	bl sub_08082528
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AD17C: .4byte 0x0840F9A0
_080AD180: .4byte 0x08418E44
_080AD184: .4byte 0x06008000
_080AD188: .4byte 0x02024460
_080AD18C: .4byte 0x0840FA00
_080AD190: .4byte 0x03002870
_080AD194: .4byte 0x08CE5780
_080AD198: .4byte 0x08CE5784
_080AD19C: .4byte sub_080ACABC
_080AD1A0: .4byte sub_080ACB64
_080AD1A4: .4byte 0x0000FFC0
_080AD1A8: .4byte 0x06013800

	thumb_func_start sub_080AD1AC
sub_080AD1AC: @ 0x080AD1AC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r6, r5, #0
	adds r6, #0x29
	ldrb r4, [r6]
	movs r0, #0x2e
	adds r0, r0, r5
	mov r8, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080AD1CC
	b _080AD3B6
_080AD1CC:
	ldr r0, _080AD208 @ =0x08B857F8
	ldr r2, [r0]
	ldrh r1, [r2, #8]
	movs r7, #1
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _080AD2C0
	ldr r0, _080AD20C @ =0x08CE577C
	ldr r1, [r0]
	lsls r0, r4, #2
	adds r0, r0, r1
	movs r4, #0
	ldrsb r4, [r0, r4]
	bl sub_080A057C
	adds r1, r7, #0
	lsls r1, r4
	ands r1, r0
	cmp r1, #0
	beq _080AD214
	movs r1, #1
	rsbs r1, r1, #0
	ldr r2, _080AD210 @ =0x00000763
	adds r0, r1, #0
	adds r3, r5, #0
	bl sub_080AACB8
	b _080AD402
	.align 2, 0
_080AD208: .4byte 0x08B857F8
_080AD20C: .4byte 0x08CE577C
_080AD210: .4byte 0x00000763
_080AD214:
	adds r0, r5, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r0, #0
	beq _080AD2A4
	ldr r7, _080AD23C @ =0x08CE5774
	ldr r1, [r7]
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r4, r0, #2
	adds r1, r1, r4
	ldrb r0, [r1, #1]
	cmp r0, #0
	bge _080AD232
	b _080AD402
_080AD232:
	cmp r0, #1
	ble _080AD240
	cmp r0, #2
	beq _080AD268
	b _080AD402
	.align 2, 0
_080AD23C: .4byte 0x08CE5774
_080AD240:
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _080AD260 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080AD256
	b _080AD402
_080AD256:
	ldr r0, _080AD264 @ =0x0000038A
	bl sub_080BE594
	b _080AD402
	.align 2, 0
_080AD260: .4byte 0x0202BBF8
_080AD264: .4byte 0x0000038A
_080AD268:
	ldrb r1, [r1, #2]
	cmp r1, #0x97
	bne _080AD274
	ldr r0, _080AD29C @ =0x00000BB8
	bl sub_08023928
_080AD274:
	ldr r0, [r7]
	adds r0, r0, r4
	ldrb r0, [r0, #2]
	cmp r0, #0x98
	bne _080AD284
	ldr r0, _080AD2A0 @ =0x00001388
	bl sub_08023928
_080AD284:
	ldrb r0, [r6]
	bl sub_080ACE34
	ldrb r0, [r6]
	bl sub_080ACCF4
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
	b _080AD402
	.align 2, 0
_080AD29C: .4byte 0x00000BB8
_080AD2A0: .4byte 0x00001388
_080AD2A4:
	ldr r0, _080AD2BC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080AD2B2
	b _080AD402
_080AD2B2:
	movs r0, #0xe3
	lsls r0, r0, #2
	bl sub_080BE594
	b _080AD402
	.align 2, 0
_080AD2BC: .4byte 0x0202BBF8
_080AD2C0:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080AD2EC
	adds r0, r5, #0
	bl Proc_Break
	ldr r0, _080AD2E4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080AD2DC
	b _080AD402
_080AD2DC:
	ldr r0, _080AD2E8 @ =0x0000038B
	bl sub_080BE594
	b _080AD402
	.align 2, 0
_080AD2E4: .4byte 0x0202BBF8
_080AD2E8: .4byte 0x0000038B
_080AD2EC:
	ldrh r1, [r2, #6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080AD2F8
	subs r4, #1
_080AD2F8:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080AD302
	adds r4, #1
_080AD302:
	ldrb r0, [r6]
	cmp r0, r4
	beq _080AD3A8
	cmp r4, #0
	blt _080AD402
	ldr r0, _080AD34C @ =0x08CE5780
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r4, r0
	bge _080AD402
	ldr r0, _080AD350 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AD328
	ldr r0, _080AD354 @ =0x00000386
	bl sub_080BE594
_080AD328:
	strb r4, [r6]
	ldrb r2, [r6]
	lsls r1, r2, #4
	movs r3, #0x2c
	ldrsh r0, [r5, r3]
	cmp r1, r0
	bne _080AD358
	cmp r2, #0
	beq _080AD358
	movs r0, #0xff
	mov r4, r8
	strb r0, [r4]
	ldrb r0, [r6]
	subs r0, #1
	bl sub_080ACCF4
	b _080AD3A8
	.align 2, 0
_080AD34C: .4byte 0x08CE5780
_080AD350: .4byte 0x0202BBF8
_080AD354: .4byte 0x00000386
_080AD358:
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r3, [r0]
	lsls r1, r3, #4
	movs r4, #0x2c
	ldrsh r2, [r5, r4]
	subs r1, r1, r2
	adds r2, r0, #0
	cmp r1, #0x40
	bne _080AD390
	ldr r0, _080AD38C @ =0x08CE5780
	ldr r0, [r0]
	ldr r0, [r0]
	subs r0, #1
	cmp r3, r0
	bge _080AD390
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #1
	strb r0, [r1]
	ldrb r0, [r2]
	adds r0, #1
	bl sub_080ACCF4
	b _080AD3A8
	.align 2, 0
_080AD38C: .4byte 0x08CE5780
_080AD390:
	ldrb r2, [r2]
	lsls r1, r2, #4
	movs r2, #0x2c
	ldrsh r0, [r5, r2]
	subs r0, #0x38
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x40
	movs r2, #0xd
	bl sub_080A951C
_080AD3A8:
	adds r0, r5, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080AD402
_080AD3B6:
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _080AD3C8
	ldrh r0, [r5, #0x2c]
	subs r0, #4
	strh r0, [r5, #0x2c]
_080AD3C8:
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _080AD3D6
	ldrh r0, [r5, #0x2c]
	adds r0, #4
	strh r0, [r5, #0x2c]
_080AD3D6:
	movs r0, #0xf
	ldrh r3, [r5, #0x2c]
	ands r0, r3
	cmp r0, #0
	bne _080AD3E2
	strb r0, [r1]
_080AD3E2:
	ldr r1, _080AD40C @ =0x0000FFC0
	ldrh r2, [r5, #0x2c]
	subs r2, #0x38
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl SetBgOffset
	ldrh r1, [r5, #0x2c]
	ldr r0, _080AD410 @ =0x08CE5780
	ldr r0, [r0]
	ldrh r2, [r0]
	movs r0, #7
	movs r3, #5
	bl sub_080904C4
_080AD402:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AD40C: .4byte 0x0000FFC0
_080AD410: .4byte 0x08CE5780

	thumb_func_start sub_080AD414
sub_080AD414: @ 0x080AD414
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r5, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r5, r0
	bge _080AD476
	movs r4, #0x30
_080AD426:
	ldr r0, _080AD450 @ =0x08CE5788
	ldr r1, [r0]
	lsls r0, r5, #3
	adds r0, r0, r1
	ldr r1, [r0, #4]
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080AD454
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x58
	adds r2, r4, #0
	movs r3, #0xc4
	lsls r3, r3, #8
	bl sub_0802619C
	b _080AD468
	.align 2, 0
_080AD450: .4byte 0x08CE5788
_080AD454:
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x58
	adds r2, r4, #0
	movs r3, #0xf4
	lsls r3, r3, #8
	bl sub_0802619C
_080AD468:
	adds r4, #0x10
	adds r5, #1
	adds r0, r6, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r5, r0
	blt _080AD426
_080AD476:
	bl sub_08025518
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080AD484
sub_080AD484: @ 0x080AD484
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	cmp r0, #0
	beq _080AD496
	bl Proc_End
	movs r0, #0
	str r0, [r4, #0x34]
_080AD496:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080AD49C
sub_080AD49C: @ 0x080AD49C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp, #4]
	ldr r0, _080AD5AC @ =0x08CE5784
	ldr r0, [r0]
	adds r6, r0, #0
	adds r6, #0x60
	ldr r0, [sp, #4]
	adds r0, #0x2b
	ldrb r5, [r0]
	lsls r4, r5, #1
	adds r3, r4, #2
	movs r0, #1
	str r0, [sp]
	movs r0, #0xa
	movs r1, #5
	movs r2, #0xb
	bl sub_08049CE4
	ldr r3, _080AD5B0 @ =0x03002870
	movs r0, #0x20
	ldrb r1, [r3, #1]
	orrs r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
	adds r2, r3, #0
	adds r2, #0x34
	movs r0, #1
	ldrb r1, [r2]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x2d
	movs r0, #0x50
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x28
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xa8
	strb r0, [r1]
	adds r4, #7
	lsls r4, r4, #3
	adds r0, r3, #0
	adds r0, #0x30
	strb r4, [r0]
	ldr r0, [sp, #4]
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r2, r0, #4
	ldr r3, [sp, #4]
	movs r1, #0x2c
	ldrsh r0, [r3, r1]
	subs r0, #0x38
	subs r2, r2, r0
	movs r0, #0
	movs r1, #0x40
	movs r3, #1
	bl sub_080A89C8
	ldr r0, [sp, #4]
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, #0x30
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x58
	movs r2, #8
	bl sub_080A951C
	cmp r5, #0
	beq _080AD63A
	ldr r0, _080AD5B4 @ =0x02022C7A
	movs r3, #0xc6
	lsls r3, r3, #1
	adds r3, r0, r3
	str r3, [sp, #8]
	movs r1, #0xc0
	lsls r1, r1, #1
	adds r1, r1, r0
	mov sl, r1
	movs r3, #0
	mov r8, r3
	mov sb, r5
_080AD566:
	movs r7, #0
	ldr r1, _080AD5B8 @ =0x08CE5788
	ldr r0, [r1]
	add r0, r8
	ldr r4, [r0, #4]
	adds r0, r6, #0
	bl ClearText
	adds r0, r6, #0
	movs r1, #0
	bl Text_SetCursor
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	cmp r0, #0x28
	bne _080AD5C0
	bl sub_0802E770
	adds r5, r0, #0
	cmp r5, #0x64
	bne _080AD592
	movs r7, #1
_080AD592:
	adds r0, r6, #0
	movs r1, #0
	adds r2, r7, #0
	bl sub_08005588
	ldr r0, _080AD5BC @ =0x0000125A
	bl GetMsg
	adds r1, r0, #0
	adds r0, r6, #0
	bl Text_DrawString
	b _080AD5E8
	.align 2, 0
_080AD5AC: .4byte 0x08CE5784
_080AD5B0: .4byte 0x03002870
_080AD5B4: .4byte 0x02022C7A
_080AD5B8: .4byte 0x08CE5788
_080AD5BC: .4byte 0x0000125A
_080AD5C0:
	adds r0, r4, #0
	bl sub_080176DC
	adds r5, r0, #0
	cmp r5, #5
	bne _080AD5CE
	movs r7, #1
_080AD5CE:
	adds r0, r6, #0
	movs r1, #0
	adds r2, r7, #0
	bl sub_08005588
	ldr r0, [r4]
	ldrh r0, [r0]
	bl GetMsg
	adds r1, r0, #0
	adds r0, r6, #0
	bl Text_DrawString
_080AD5E8:
	cmp r7, #0
	bne _080AD5FC
	ldr r3, _080AD5F8 @ =0x08CE5788
	ldr r0, [r3]
	add r0, r8
	movs r1, #1
	b _080AD604
	.align 2, 0
_080AD5F8: .4byte 0x08CE5788
_080AD5FC:
	ldr r1, _080AD658 @ =0x08CE5788
	ldr r0, [r1]
	add r0, r8
	movs r1, #0
_080AD604:
	strb r1, [r0]
	adds r0, r6, #0
	mov r1, sl
	bl sub_08005590
	movs r1, #1
	cmp r7, #0
	bne _080AD616
	movs r1, #2
_080AD616:
	ldr r0, [sp, #8]
	adds r2, r5, #0
	bl sub_080061D8
	adds r6, #8
	ldr r3, [sp, #8]
	adds r3, #0x80
	str r3, [sp, #8]
	movs r0, #0x80
	add sl, r0
	movs r1, #8
	add r8, r1
	movs r3, #1
	rsbs r3, r3, #0
	add sb, r3
	mov r0, sb
	cmp r0, #0
	bne _080AD566
_080AD63A:
	ldr r0, _080AD65C @ =sub_080AD414
	ldr r1, [sp, #4]
	bl sub_080A92F8
	ldr r1, [sp, #4]
	str r0, [r1, #0x34]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AD658: .4byte 0x08CE5788
_080AD65C: .4byte sub_080AD414

	thumb_func_start sub_080AD660
sub_080AD660: @ 0x080AD660
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	adds r2, #0x2a
	ldr r1, _080AD6A0 @ =0x08CE5788
	ldr r1, [r1]
	ldrb r2, [r2]
	lsls r3, r2, #3
	adds r3, r3, r1
	ldr r7, [r3, #4]
	ldr r2, _080AD6A4 @ =0x08CE577C
	adds r6, r0, #0
	adds r6, #0x29
	ldrb r4, [r6]
	lsls r1, r4, #2
	ldr r0, [r2]
	adds r0, r0, r1
	movs r2, #0
	ldrsb r2, [r0, r2]
	ldr r0, _080AD6A8 @ =0x08CE5774
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, r1, r0
	ldrb r5, [r1, #2]
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r0, #0
	bne _080AD6AC
	movs r0, #0
	b _080AD6DC
	.align 2, 0
_080AD6A0: .4byte 0x08CE5788
_080AD6A4: .4byte 0x08CE577C
_080AD6A8: .4byte 0x08CE5774
_080AD6AC:
	adds r0, r4, #0
	bl sub_080ACE34
	ldrb r0, [r6]
	bl sub_080ACCF4
	ldr r0, [r7]
	ldrb r0, [r0, #4]
	cmp r0, #0x28
	bne _080AD6CC
	adds r0, r5, #0
	bl CreateItem
	bl sub_0802E790
	b _080AD6DA
_080AD6CC:
	adds r0, r5, #0
	bl CreateItem
	adds r1, r0, #0
	adds r0, r7, #0
	bl sub_08017654
_080AD6DA:
	movs r0, #1
_080AD6DC:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080AD6E4
sub_080AD6E4: @ 0x080AD6E4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r5, #0
	adds r6, #0x2a
	ldrb r4, [r6]
	ldr r0, _080AD714 @ =0x08B857F8
	ldr r2, [r0]
	ldrh r1, [r2, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080AD72C
	adds r0, r5, #0
	bl sub_080AD660
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AD718
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
	b _080AD7A6
	.align 2, 0
_080AD714: .4byte 0x08B857F8
_080AD718:
	movs r1, #1
	rsbs r1, r1, #0
	ldr r2, _080AD728 @ =0x00000764
	adds r0, r1, #0
	adds r3, r5, #0
	bl sub_080AACB8
	b _080AD7A6
	.align 2, 0
_080AD728: .4byte 0x00000764
_080AD72C:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080AD758
	adds r0, r5, #0
	bl Proc_Break
	ldr r0, _080AD750 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AD7A6
	ldr r0, _080AD754 @ =0x0000038B
	bl sub_080BE594
	b _080AD7A6
	.align 2, 0
_080AD750: .4byte 0x0202BBF8
_080AD754: .4byte 0x0000038B
_080AD758:
	ldrh r1, [r2, #6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080AD764
	subs r4, #1
_080AD764:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080AD76E
	adds r4, #1
_080AD76E:
	ldrb r0, [r6]
	cmp r4, r0
	beq _080AD7A6
	cmp r4, #0
	blt _080AD7A6
	adds r0, r5, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r4, r0
	bge _080AD7A6
	ldr r0, _080AD7AC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AD794
	ldr r0, _080AD7B0 @ =0x00000386
	bl sub_080BE594
_080AD794:
	strb r4, [r6]
	lsls r1, r4, #4
	adds r1, #0x30
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x58
	movs r2, #8
	bl sub_080A951C
_080AD7A6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AD7AC: .4byte 0x0202BBF8
_080AD7B0: .4byte 0x00000386

	thumb_func_start sub_080AD7B4
sub_080AD7B4: @ 0x080AD7B4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_080AD484
	ldr r2, _080AD814 @ =0x03002870
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	ldr r0, _080AD818 @ =0x02023460
	movs r1, #0
	bl TmFill
	ldr r0, _080AD81C @ =0x02022C60
	movs r1, #0
	bl TmFill
	bl sub_080ACF08
	movs r0, #3
	bl EnableBgSync
	movs r0, #0
	bl sub_080A8A78
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r1, r0, #4
	movs r2, #0x2c
	ldrsh r0, [r4, r2]
	subs r0, #0x38
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x40
	movs r2, #0xd
	bl sub_080A951C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AD814: .4byte 0x03002870
_080AD818: .4byte 0x02023460
_080AD81C: .4byte 0x02022C60

	thumb_func_start sub_080AD820
sub_080AD820: @ 0x080AD820
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x34
	adds r4, r0, #0
	adds r6, r4, #0
	adds r6, #0x29
	ldr r0, _080AD96C @ =0x08CE577C
	ldr r1, [r0]
	ldrb r2, [r6]
	lsls r0, r2, #2
	adds r0, r0, r1
	movs r2, #0
	ldrsb r2, [r0, r2]
	ldr r0, _080AD970 @ =0x08CE5774
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #2
	str r0, [sp, #0x30]
	adds r1, r1, r0
	ldrb r1, [r1, #2]
	str r1, [sp, #0x2c]
	ldr r0, _080AD974 @ =0x08CE5784
	ldr r0, [r0]
	adds r5, r0, #0
	adds r5, #0x70
	ldr r2, _080AD978 @ =0x03002870
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	ldr r2, _080AD97C @ =0x02022C60
	mov sl, r2
	mov r0, sl
	movs r1, #0
	bl TmFill
	ldr r0, _080AD980 @ =0x02023460
	movs r1, #0
	bl TmFill
	bl sub_080ACF08
	movs r0, #3
	bl EnableBgSync
	adds r0, r4, #0
	bl sub_080AD484
	bl sub_080A05F4
	bl sub_080A0810
	movs r0, #0
	str r0, [r4, #0x30]
	bl sub_080A8A78
	ldrb r6, [r6]
	lsls r1, r6, #4
	movs r2, #0x2c
	ldrsh r0, [r4, r2]
	subs r0, #0x38
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x40
	movs r2, #0xd
	bl sub_080A951C
	adds r0, r5, #0
	bl ClearText
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0
	bl sub_08005588
	adds r0, r5, #0
	movs r1, #0
	bl Text_SetCursor
	ldr r0, _080AD984 @ =0x000010B3
	add r1, sp, #0xc
	bl GetMsgTo
	adds r7, r0, #0
	ldr r0, [sp, #0x2c]
	movs r1, #0
	bl GetItemNameWithArticle
	mov r8, r0
	adds r0, r7, #0
	bl sub_080055FC
	adds r4, r0, #0
	mov r0, r8
	bl sub_080055FC
	adds r0, r4, r0
	adds r4, r0, #7
	cmp r4, #0
	bge _080AD8FE
	adds r4, #7
_080AD8FE:
	asrs r4, r4, #3
	adds r0, r4, #4
	mov sb, r0
	lsrs r0, r0, #0x1f
	add r0, sb
	asrs r0, r0, #1
	movs r1, #0xf
	subs r6, r1, r0
	adds r0, r5, #0
	adds r1, r7, #0
	bl Text_DrawString
	adds r0, r5, #0
	movs r1, #2
	bl Text_SetColor
	adds r0, r5, #0
	mov r1, r8
	bl Text_DrawString
	lsls r1, r6, #1
	ldr r0, _080AD988 @ =0x00000282
	add r0, sl
	adds r1, r1, r0
	adds r0, r5, #0
	bl sub_08005590
	adds r4, #5
	adds r4, r6, r4
	lsls r4, r4, #1
	movs r0, #0x9e
	lsls r0, r0, #2
	add r0, sl
	adds r4, r4, r0
	ldr r0, [sp, #0x2c]
	bl GetItemIcon
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r4, #0
	bl sub_08004E28
	ldr r1, _080AD970 @ =0x08CE5774
	ldr r0, [r1]
	ldr r2, [sp, #0x30]
	adds r0, r0, r2
	ldrb r0, [r0, #1]
	cmp r0, #0
	blt _080AD9BA
	cmp r0, #1
	ble _080AD98C
	cmp r0, #2
	beq _080AD9A8
	b _080AD9BA
	.align 2, 0
_080AD96C: .4byte 0x08CE577C
_080AD970: .4byte 0x08CE5774
_080AD974: .4byte 0x08CE5784
_080AD978: .4byte 0x03002870
_080AD97C: .4byte 0x02022C60
_080AD980: .4byte 0x02023460
_080AD984: .4byte 0x000010B3
_080AD988: .4byte 0x00000282
_080AD98C:
	ldr r0, _080AD9A0 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AD9BA
	ldr r0, _080AD9A4 @ =0x0000037A
	bl sub_080BE594
	b _080AD9BA
	.align 2, 0
_080AD9A0: .4byte 0x0202BBF8
_080AD9A4: .4byte 0x0000037A
_080AD9A8:
	ldr r0, _080ADA48 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AD9BA
	movs r0, #0xb9
	bl sub_080BE594
_080AD9BA:
	ldr r0, _080ADA4C @ =0x02023460
	movs r1, #3
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	adds r1, r6, #0
	movs r2, #0xa
	mov r3, sb
	bl sub_08049B78
	ldr r0, _080ADA50 @ =0x03002870
	mov ip, r0
	movs r0, #0x20
	mov r1, ip
	ldrb r1, [r1, #1]
	orrs r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r2, ip
	strb r0, [r2, #1]
	adds r2, #0x34
	movs r0, #1
	ldrb r1, [r2]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r2]
	lsls r0, r6, #3
	mov r1, ip
	adds r1, #0x2d
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x50
	strb r0, [r1]
	mov r2, sb
	adds r0, r6, r2
	lsls r0, r0, #3
	subs r1, #5
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x68
	strb r0, [r1]
	movs r0, #3
	bl EnableBgSync
	ldr r2, _080ADA54 @ =0x0000FFFC
	movs r0, #0
	movs r1, #0
	bl SetBgOffset
	add sp, #0x34
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080ADA48: .4byte 0x0202BBF8
_080ADA4C: .4byte 0x02023460
_080ADA50: .4byte 0x03002870
_080ADA54: .4byte 0x0000FFFC

	thumb_func_start sub_080ADA58
sub_080ADA58: @ 0x080ADA58
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	adds r0, #1
	str r0, [r2, #0x30]
	cmp r0, #0x1e
	ble _080ADA80
	ldr r0, _080ADA7C @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #3
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080ADA80
	adds r0, r2, #0
	bl Proc_Break
	b _080ADA8C
	.align 2, 0
_080ADA7C: .4byte 0x08B857F8
_080ADA80:
	ldr r0, [r2, #0x30]
	cmp r0, #0x78
	ble _080ADA8C
	adds r0, r2, #0
	bl Proc_Break
_080ADA8C:
	pop {r0}
	bx r0

	thumb_func_start sub_080ADA90
sub_080ADA90: @ 0x080ADA90
	push {lr}
	ldr r0, _080ADAD0 @ =0x02022C60
	movs r1, #0
	bl TmFill
	ldr r0, _080ADAD4 @ =0x02023460
	movs r1, #0
	bl TmFill
	bl sub_080ACF08
	movs r0, #3
	bl EnableBgSync
	ldr r2, _080ADAD8 @ =0x03002870
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	pop {r0}
	bx r0
	.align 2, 0
_080ADAD0: .4byte 0x02022C60
_080ADAD4: .4byte 0x02023460
_080ADAD8: .4byte 0x03002870

	thumb_func_start sub_080ADADC
sub_080ADADC: @ 0x080ADADC
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08006018
	adds r0, r4, #0
	bl sub_080A9DC0
	movs r0, #0
	bl SetOnHBlankA
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080ADAF8
sub_080ADAF8: @ 0x080ADAF8
	push {lr}
	adds r1, r0, #0
	ldr r0, _080ADB08 @ =0x08CE578C
	bl SpawnProcLocking
	pop {r0}
	bx r0
	.align 2, 0
_080ADB08: .4byte 0x08CE578C

	thumb_func_start GetOptionMenuLayoutId
GetOptionMenuLayoutId: @ 0x080ADB0C
	ldr r3, _080ADB2C @ =0x020144F4
	ldr r0, _080ADB30 @ =0x08CE583C
	ldr r0, [r0]
	movs r1, #0x32
	ldrsh r2, [r0, r1]
	ldr r1, _080ADB34 @ =0x0202BBF8
	movs r0, #0x40
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	beq _080ADB24
	adds r2, #3
_080ADB24:
	strh r2, [r3]
	movs r1, #0
	ldrsh r0, [r3, r1]
	bx lr
	.align 2, 0
_080ADB2C: .4byte 0x020144F4
_080ADB30: .4byte 0x08CE583C
_080ADB34: .4byte 0x0202BBF8

	thumb_func_start sub_080ADB38
sub_080ADB38: @ 0x080ADB38
	ldr r0, _080ADB44 @ =0x08CE583C
	ldr r0, [r0]
	ldrh r0, [r0, #0x2a]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bx lr
	.align 2, 0
_080ADB44: .4byte 0x08CE583C

	thumb_func_start sub_080ADB48
sub_080ADB48: @ 0x080ADB48
	push {lr}
	bl GetOptionMenuLayoutId
	ldr r1, _080ADB74 @ =0x08CE5868
	lsls r0, r0, #0x10
	asrs r0, r0, #0xd
	adds r1, #4
	adds r0, r0, r1
	ldr r1, _080ADB78 @ =0x08CE583C
	ldr r1, [r1]
	movs r2, #0x2a
	ldrsh r1, [r1, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl sub_080AE360
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_080ADB74: .4byte 0x08CE5868
_080ADB78: .4byte 0x08CE583C

	thumb_func_start sub_080ADB7C
sub_080ADB7C: @ 0x080ADB7C
	push {lr}
	ldr r0, _080ADB88 @ =0x08CE58BE
	bl InitBgs
	pop {r0}
	bx r0
	.align 2, 0
_080ADB88: .4byte 0x08CE58BE

	thumb_func_start sub_080ADB8C
sub_080ADB8C: @ 0x080ADB8C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r4, _080ADC0C @ =0x02024460
	cmp r5, #0
	bne _080ADBA6
	movs r0, #3
	bl GetBgChrOffset
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r5, r0, r1
_080ADBA6:
	cmp r6, #0
	bge _080ADBAC
	movs r6, #0xe
_080ADBAC:
	ldr r0, _080ADC10 @ =0x08418E44
	adds r1, r5, #0
	bl Decompress
	ldr r0, _080ADC14 @ =0x0841E2D8
	lsls r1, r6, #5
	movs r2, #0x40
	bl ApplyPaletteExt
	movs r0, #3
	bl GetBgChrOffset
	subs r0, r5, r0
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x14
	movs r1, #0xf
	ands r1, r6
	lsls r1, r1, #0xc
	adds r1, r0, r1
	movs r2, #0
	ldr r3, _080ADC18 @ =0x0000027F
_080ADBD6:
	adds r0, r2, r1
	strh r0, [r4]
	adds r4, #2
	adds r2, #1
	cmp r2, r3
	ble _080ADBD6
	ldr r4, _080ADC1C @ =0x02024520
	ldr r3, _080ADC20 @ =0x08CC1C5C
	movs r5, #0x80
	lsls r5, r5, #5
	adds r1, r5, #0
	movs r2, #0xe0
	lsls r2, r2, #1
_080ADBF0:
	ldrh r5, [r4]
	adds r0, r1, r5
	strh r0, [r4]
	adds r4, #2
	subs r2, #1
	cmp r2, #0
	bne _080ADBF0
	adds r0, r3, #0
	adds r1, r7, #0
	bl SpawnProc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080ADC0C: .4byte 0x02024460
_080ADC10: .4byte 0x08418E44
_080ADC14: .4byte 0x0841E2D8
_080ADC18: .4byte 0x0000027F
_080ADC1C: .4byte 0x02024520
_080ADC20: .4byte 0x08CC1C5C

	thumb_func_start sub_080ADC24
sub_080ADC24: @ 0x080ADC24
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	lsls r4, r5, #1
	adds r4, r4, r1
	movs r0, #0x1f
	mov r8, r0
	ands r4, r0
	lsls r4, r4, #5
	ldr r6, _080ADCAC @ =0x08CE58D8
	bl GetOptionMenuLayoutId
	ldr r1, _080ADCB0 @ =0x08CE5868
	lsls r0, r0, #0x10
	asrs r0, r0, #0xd
	adds r1, #4
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r5
	movs r1, #0x2c
	ldrb r0, [r0]
	muls r0, r1, r0
	adds r0, r0, r6
	adds r0, #0x24
	ldrb r1, [r0]
	adds r2, r1, #0
	mov r5, r8
	ands r2, r5
	lsls r0, r1, #1
	ldr r1, _080ADCB4 @ =0x0000FFC0
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	adds r2, r2, r0
	movs r0, #0x80
	lsls r0, r0, #7
	adds r1, r2, r0
	ldr r3, _080ADCB8 @ =0x02023C60
	adds r0, r4, #2
	lsls r0, r0, #1
	adds r0, r0, r3
	strh r1, [r0]
	adds r0, r4, #3
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r5, _080ADCBC @ =0x00004001
	adds r1, r2, r5
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x22
	lsls r0, r0, #1
	adds r0, r0, r3
	adds r5, #0x1f
	adds r1, r2, r5
	strh r1, [r0]
	adds r4, #0x23
	lsls r4, r4, #1
	adds r4, r4, r3
	ldr r0, _080ADCC0 @ =0x00004021
	adds r2, r2, r0
	strh r2, [r4]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080ADCAC: .4byte 0x08CE58D8
_080ADCB0: .4byte 0x08CE5868
_080ADCB4: .4byte 0x0000FFC0
_080ADCB8: .4byte 0x02023C60
_080ADCBC: .4byte 0x00004001
_080ADCC0: .4byte 0x00004021

	thumb_func_start sub_080ADCC4
sub_080ADCC4: @ 0x080ADCC4
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r5, _080ADD24 @ =0x08CE583C
	ldr r0, [r5]
	adds r0, #0xa8
	bl ClearText
	ldr r6, _080ADD28 @ =0x08CE58D8
	bl sub_080ADB48
	adds r4, r0, #0
	bl GetOptionMenuLayoutId
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x15
	ldr r1, _080ADD2C @ =0x08CE5868
	lsls r0, r0, #0x10
	asrs r0, r0, #0xd
	adds r1, #4
	adds r0, r0, r1
	ldr r1, [r5]
	movs r2, #0x2a
	ldrsh r1, [r1, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0x2c
	ldrb r0, [r0]
	muls r0, r1, r0
	adds r4, r4, r0
	adds r4, r4, r6
	ldrh r0, [r4, #4]
	bl GetMsg
	adds r3, r0, #0
	ldr r0, [r5]
	adds r0, #0xa8
	ldr r1, _080ADD30 @ =0x020230A8
	movs r2, #0x16
	str r2, [sp]
	str r3, [sp, #4]
	movs r2, #0
	movs r3, #0
	bl sub_08005AD4
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080ADD24: .4byte 0x08CE583C
_080ADD28: .4byte 0x08CE58D8
_080ADD2C: .4byte 0x08CE5868
_080ADD30: .4byte 0x020230A8

	thumb_func_start sub_080ADD34
sub_080ADD34: @ 0x080ADD34
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #8
	mov sb, r0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r0, _080ADDA4 @ =0x08CE583C
	mov r8, r0
	lsls r4, r4, #3
	adds r4, #0x38
	ldr r0, [r0]
	adds r0, r0, r4
	bl ClearText
	ldr r6, _080ADDA8 @ =0x08CE58D8
	bl GetOptionMenuLayoutId
	ldr r1, _080ADDAC @ =0x08CE5868
	lsls r0, r0, #0x10
	asrs r0, r0, #0xd
	adds r1, #4
	adds r0, r0, r1
	ldr r0, [r0]
	add r0, sb
	movs r1, #0x2c
	ldrb r0, [r0]
	muls r0, r1, r0
	adds r0, r0, r6
	ldrh r0, [r0]
	bl GetMsg
	adds r2, r0, #0
	mov r1, r8
	ldr r0, [r1]
	adds r0, r0, r4
	lsls r5, r5, #6
	ldr r1, _080ADDB0 @ =0x02023C68
	adds r5, r5, r1
	movs r1, #9
	str r1, [sp]
	str r2, [sp, #4]
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl sub_08005AD4
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080ADDA4: .4byte 0x08CE583C
_080ADDA8: .4byte 0x08CE58D8
_080ADDAC: .4byte 0x08CE5868
_080ADDB0: .4byte 0x02023C68

	thumb_func_start sub_080ADDB4
sub_080ADDB4: @ 0x080ADDB4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r4, r0, #0
	str r1, [sp]
	str r2, [sp, #4]
	bl GetOptionMenuLayoutId
	ldr r1, _080ADE80 @ =0x08CE5868
	lsls r0, r0, #0x10
	asrs r0, r0, #0xd
	adds r1, #4
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	mov sb, r0
	ldr r1, _080ADE84 @ =0x08CE58D8
	movs r0, #0x2c
	mov r2, sb
	muls r2, r0, r2
	adds r0, r2, #0
	adds r4, r0, r1
	ldrb r0, [r4, #8]
	lsrs r0, r0, #3
	str r0, [sp, #8]
	ldr r1, _080ADE88 @ =0x08CE583C
	ldr r2, [sp]
	lsls r0, r2, #3
	adds r5, r0, #0
	adds r5, #0x70
	ldr r0, [r1]
	adds r0, r0, r5
	bl ClearText
	movs r0, #0
	mov r8, r0
	ldrh r0, [r4, #6]
	cmp r0, #0
	beq _080ADE52
	mov sl, r5
_080ADE0C:
	ldr r0, _080ADE88 @ =0x08CE583C
	ldr r0, [r0]
	mov r1, sl
	adds r7, r0, r1
	ldrb r6, [r4, #8]
	subs r6, #0x78
	mov r2, sb
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	bl sub_080AE360
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r5, #1
	cmp r8, r0
	bne _080ADE2E
	movs r5, #2
_080ADE2E:
	ldrh r0, [r4, #6]
	bl GetMsg
	adds r3, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r5, #0
	bl Text_InsertDrawString
	adds r4, #8
	movs r0, #1
	add r8, r0
	mov r1, r8
	cmp r1, #3
	bgt _080ADE52
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _080ADE0C
_080ADE52:
	ldr r0, _080ADE88 @ =0x08CE583C
	ldr r2, [sp]
	lsls r1, r2, #3
	adds r1, #0x70
	ldr r0, [r0]
	adds r0, r0, r1
	ldr r2, [sp, #4]
	lsls r1, r2, #5
	ldr r2, [sp, #8]
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080ADE8C @ =0x02023C60
	adds r1, r1, r2
	bl sub_08005590
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080ADE80: .4byte 0x08CE5868
_080ADE84: .4byte 0x08CE58D8
_080ADE88: .4byte 0x08CE583C
_080ADE8C: .4byte 0x02023C60

	thumb_func_start sub_080ADE90
sub_080ADE90: @ 0x080ADE90
	push {lr}
	movs r0, #1
	movs r1, #0x12
	bl sub_08004D44
	movs r0, #0x80
	movs r1, #3
	bl sub_080B1F6C
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080ADEA8
sub_080ADEA8: @ 0x080ADEA8
	push {r4, r5, r6, r7, lr}
	bl GetOptionMenuLayoutId
	ldr r1, _080ADF88 @ =0x08CE5868
	lsls r0, r0, #0x10
	asrs r0, r0, #0xd
	adds r1, #4
	adds r0, r0, r1
	ldr r6, _080ADF8C @ =0x08CE583C
	ldr r1, [r6]
	movs r2, #0x2a
	ldrsh r1, [r1, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r5, [r0]
	bl GetGameTime
	movs r1, #0xf
	ands r0, r1
	movs r1, #8
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r2, _080ADF90 @ =0x08CE5898
	movs r3, #0x83
	lsls r3, r3, #6
	movs r0, #0x22
	movs r1, #8
	bl PutOamHiRam
	ldr r0, [r6]
	movs r1, #0x2a
	ldrsh r4, [r0, r1]
	movs r2, #0x2c
	ldrsh r0, [r0, r2]
	subs r4, r4, r0
	lsls r4, r4, #4
	adds r4, #0x20
	movs r0, #0x10
	adds r1, r4, #0
	bl sub_0804A004
	adds r0, r5, #0
	bl sub_080AE360
	ldr r2, _080ADF94 @ =0x08CE58D8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x15
	movs r1, #0x2c
	muls r1, r5, r1
	adds r0, r0, r1
	adds r0, r0, r2
	ldrb r0, [r0, #8]
	subs r0, #2
	adds r1, r4, #0
	bl sub_08049F58
	ldr r1, [r6]
	movs r2, #0x34
	ldrsh r0, [r1, r2]
	cmp r0, #6
	ble _080ADF58
	movs r2, #0x2c
	ldrsh r0, [r1, r2]
	cmp r0, #0
	beq _080ADF3A
	movs r2, #0xc2
	lsls r2, r2, #6
	movs r0, #0x64
	movs r1, #0x1d
	movs r3, #1
	bl sub_080B1FB0
_080ADF3A:
	ldr r0, [r6]
	movs r2, #0x2c
	ldrsh r1, [r0, r2]
	movs r2, #0x34
	ldrsh r0, [r0, r2]
	subs r0, #6
	cmp r1, r0
	bge _080ADF58
	movs r2, #0xc2
	lsls r2, r2, #6
	movs r0, #0x64
	movs r1, #0x7d
	movs r3, #0
	bl sub_080B1FB0
_080ADF58:
	bl sub_080ADB38
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080ADF80
	bl sub_080ADB48
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bne _080ADF80
	ldr r2, _080ADF98 @ =0x08B905B8
	ldr r3, _080ADF9C @ =0x000020CC
	cmp r7, #0
	beq _080ADF78
	adds r3, #2
_080ADF78:
	movs r0, #0xc0
	movs r1, #0x20
	bl PutOamHiRam
_080ADF80:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080ADF88: .4byte 0x08CE5868
_080ADF8C: .4byte 0x08CE583C
_080ADF90: .4byte 0x08CE5898
_080ADF94: .4byte 0x08CE58D8
_080ADF98: .4byte 0x08B905B8
_080ADF9C: .4byte 0x000020CC

	thumb_func_start sub_080ADFA0
sub_080ADFA0: @ 0x080ADFA0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sl, r0
	movs r5, #0
	ldr r0, _080AE1B0 @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #1
	beq _080ADFBE
	movs r5, #1
	cmp r0, #2
	beq _080ADFBE
	movs r5, #2
_080ADFBE:
	ldr r1, _080AE1B4 @ =0x08CE583C
	ldr r0, [r1]
	movs r2, #0
	mov sb, r2
	movs r4, #0
	strh r5, [r0, #0x32]
	bl GetOptionMenuLayoutId
	ldr r2, _080AE1B4 @ =0x08CE583C
	ldr r1, [r2]
	ldr r2, _080AE1B8 @ =0x08CE5868
	lsls r0, r0, #0x10
	asrs r0, r0, #0xd
	adds r0, r0, r2
	ldrb r0, [r0]
	strh r0, [r1, #0x34]
	strh r4, [r1, #0x2a]
	strh r4, [r1, #0x2c]
	mov r0, sl
	strh r4, [r0, #0x2e]
	strh r4, [r0, #0x30]
	adds r0, #0x36
	mov r1, sb
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	bl LoadUiFrameGraphics
	ldr r7, _080AE1BC @ =0x03002870
	movs r4, #1
	ldrb r0, [r7, #1]
	orrs r0, r4
	movs r2, #2
	mov r8, r2
	mov r1, r8
	orrs r0, r1
	movs r2, #4
	orrs r0, r2
	movs r6, #8
	orrs r0, r6
	movs r5, #0x10
	orrs r0, r5
	strb r0, [r7, #1]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	mov r0, sl
	ldrh r2, [r0, #0x2e]
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #0x20
	ldrb r1, [r7, #1]
	orrs r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	adds r0, r7, #0
	adds r0, #0x2d
	mov r2, sb
	strb r2, [r0]
	adds r1, r7, #0
	adds r1, #0x31
	movs r0, #0x20
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x80
	strb r0, [r1]
	adds r1, #4
	ldrb r0, [r1]
	orrs r0, r4
	mov r2, r8
	orrs r0, r2
	movs r2, #4
	orrs r0, r2
	orrs r0, r6
	orrs r0, r5
	strb r0, [r1]
	adds r1, #2
	ldrb r0, [r1]
	orrs r4, r0
	mov r2, r8
	orrs r4, r2
	movs r0, #5
	rsbs r0, r0, #0
	ands r4, r0
	orrs r4, r6
	orrs r4, r5
	strb r4, [r1]
	ldr r0, _080AE1C0 @ =0x02022C60
	movs r1, #0
	bl TmFill
	ldr r5, _080AE1C4 @ =0x02023460
	adds r0, r5, #0
	movs r1, #0
	bl TmFill
	ldr r0, _080AE1C8 @ =0x02023C60
	movs r1, #0
	bl TmFill
	ldr r0, _080AE1CC @ =0x02024460
	movs r1, #0
	bl TmFill
	ldr r4, _080AE1D0 @ =0x0841E338
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r1, #0x90
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080AE1D4 @ =0x0841DA40
	ldr r1, _080AE1D8 @ =0x06011800
	bl Decompress
	ldr r0, _080AE1DC @ =0x0841DCA4
	ldr r1, _080AE1E0 @ =0x06004000
	bl Decompress
	ldr r4, _080AE1E4 @ =0x0841DC90
	movs r0, #2
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r0, _080AE1E8 @ =0x06005000
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r1, _080AE1EC @ =0x0841E180
	movs r4, #0x80
	lsls r4, r4, #5
	adds r0, r5, #0
	adds r2, r4, #0
	bl TmApplyTsa_t
	ldr r1, _080AE1F0 @ =0x00000404
	adds r5, r5, r1
	ldr r1, _080AE1F4 @ =0x0841E204
	adds r0, r5, #0
	adds r2, r4, #0
	bl TmApplyTsa_t
	bl ResetTextFont
	ldr r2, _080AE1B4 @ =0x08CE583C
	ldr r0, [r2]
	adds r0, #0xa8
	movs r1, #0x16
	bl InitText
	bl sub_080ADCC4
	ldr r1, _080AE1B4 @ =0x08CE583C
	ldr r0, [r1]
	adds r0, #0x68
	movs r1, #9
	bl InitText
	ldr r2, _080AE1B4 @ =0x08CE583C
	ldr r0, [r2]
	adds r0, #0xa0
	movs r1, #0xe
	bl InitText
	movs r5, #0
	ldr r0, _080AE1B4 @ =0x08CE583C
	mov r8, r0
	movs r7, #0x70
	movs r6, #0x38
	movs r4, #4
_080AE148:
	adds r0, r5, #0
	movs r1, #4
	bl sub_080ADC24
	mov r1, r8
	ldr r0, [r1]
	adds r0, r0, r6
	movs r1, #9
	bl InitText
	mov r2, r8
	ldr r0, [r2]
	adds r0, r0, r7
	movs r1, #0xe
	bl InitText
	adds r0, r5, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl sub_080ADD34
	adds r0, r5, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl sub_080ADDB4
	adds r7, #8
	adds r6, #8
	adds r4, #2
	adds r5, #1
	cmp r5, #5
	ble _080AE148
	movs r2, #1
	rsbs r2, r2, #0
	mov r0, sl
	movs r1, #0
	bl sub_080ADB8C
	ldr r0, _080AE1F8 @ =0x08CE5BB8
	mov r1, sl
	bl SpawnProc
	movs r0, #0xf
	bl EnableBgSync
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AE1B0: .4byte 0x0202BBF8
_080AE1B4: .4byte 0x08CE583C
_080AE1B8: .4byte 0x08CE5868
_080AE1BC: .4byte 0x03002870
_080AE1C0: .4byte 0x02022C60
_080AE1C4: .4byte 0x02023460
_080AE1C8: .4byte 0x02023C60
_080AE1CC: .4byte 0x02024460
_080AE1D0: .4byte 0x0841E338
_080AE1D4: .4byte 0x0841DA40
_080AE1D8: .4byte 0x06011800
_080AE1DC: .4byte 0x0841DCA4
_080AE1E0: .4byte 0x06004000
_080AE1E4: .4byte 0x0841DC90
_080AE1E8: .4byte 0x06005000
_080AE1EC: .4byte 0x0841E180
_080AE1F0: .4byte 0x00000404
_080AE1F4: .4byte 0x0841E204
_080AE1F8: .4byte 0x08CE5BB8

	thumb_func_start sub_080AE1FC
sub_080AE1FC: @ 0x080AE1FC
	push {lr}
	bl sub_080AE27C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AE210
	movs r0, #1
	rsbs r0, r0, #0
	bl sub_08049B24
_080AE210:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080AE218
sub_080AE218: @ 0x080AE218
	push {r4, lr}
	adds r4, r0, #0
	bl sub_080AE27C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AE274
	bl GetOptionMenuLayoutId
	ldr r1, _080AE254 @ =0x08CE5868
	lsls r0, r0, #0x10
	asrs r0, r0, #0xd
	adds r1, #4
	adds r0, r0, r1
	ldr r1, _080AE258 @ =0x08CE583C
	ldr r1, [r1]
	movs r2, #0x2a
	ldrsh r1, [r1, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl sub_080AE360
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AE25C
	movs r0, #1
	bl FadeBgmOut
	b _080AE274
	.align 2, 0
_080AE254: .4byte 0x08CE5868
_080AE258: .4byte 0x08CE583C
_080AE25C:
	adds r0, r4, #0
	adds r0, #0x37
	ldrb r0, [r0]
	cmp r0, #0
	beq _080AE270
	movs r0, #0x49
	movs r1, #0
	bl StartBgm
	b _080AE274
_080AE270:
	bl StartMapSongBgm
_080AE274:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_080AE27C
sub_080AE27C: @ 0x080AE27C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	movs r7, #0
	ldr r0, _080AE2D8 @ =0x08CE583C
	ldr r0, [r0]
	movs r1, #0x2a
	ldrsh r5, [r0, r1]
	bl GetOptionMenuLayoutId
	ldr r1, _080AE2DC @ =0x08CE5868
	lsls r0, r0, #0x10
	asrs r0, r0, #0xd
	adds r1, #4
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r4, [r0]
	adds r6, r4, #0
	bl sub_080ADB48
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, _080AE2E0 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	beq _080AE342
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080AE2E4
	cmp r3, #0
	beq _080AE30A
	subs r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	adds r0, r4, #0
	adds r1, r3, #0
	bl sub_080AE4CC
	movs r7, #1
	b _080AE30E
	.align 2, 0
_080AE2D8: .4byte 0x08CE583C
_080AE2DC: .4byte 0x08CE5868
_080AE2E0: .4byte 0x08B857F8
_080AE2E4:
	ldr r2, _080AE350 @ =0x08CE58D8
	adds r4, r3, #1
	lsls r0, r4, #3
	movs r1, #0x2c
	muls r1, r6, r1
	adds r0, r0, r1
	adds r0, r0, r2
	ldrh r0, [r0, #6]
	cmp r0, #0
	beq _080AE30A
	cmp r3, #2
	bhi _080AE30A
	lsls r0, r4, #0x18
	lsrs r3, r0, #0x18
	adds r0, r6, #0
	adds r1, r3, #0
	bl sub_080AE4CC
	movs r7, #1
_080AE30A:
	cmp r7, #0
	beq _080AE342
_080AE30E:
	ldr r0, _080AE354 @ =0x08CE5B98
	mov r1, r8
	bl SpawnProc
	adds r0, r5, #0
	movs r1, #7
	bl __modsi3
	adds r1, r0, #0
	lsls r2, r5, #1
	adds r2, #4
	adds r0, r5, #0
	bl sub_080ADDB4
	movs r0, #5
	bl EnableBgSync
	ldr r0, _080AE358 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AE342
	ldr r0, _080AE35C @ =0x00000387
	bl sub_080BE594
_080AE342:
	adds r0, r7, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080AE350: .4byte 0x08CE58D8
_080AE354: .4byte 0x08CE5B98
_080AE358: .4byte 0x0202BBF8
_080AE35C: .4byte 0x00000387

	thumb_func_start sub_080AE360
sub_080AE360: @ 0x080AE360
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #0
	cmp r0, #0xf
	bls _080AE36C
	b _080AE4C2
_080AE36C:
	lsls r0, r0, #2
	ldr r1, _080AE378 @ =_080AE37C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080AE378: .4byte _080AE37C
_080AE37C: @ jump table
	.4byte _080AE3BC @ case 0
	.4byte _080AE3F2 @ case 1
	.4byte _080AE400 @ case 2
	.4byte _080AE40C @ case 3
	.4byte _080AE41C @ case 4
	.4byte _080AE42C @ case 5
	.4byte _080AE438 @ case 6
	.4byte _080AE448 @ case 7
	.4byte _080AE458 @ case 8
	.4byte _080AE4C2 @ case 9
	.4byte _080AE468 @ case 10
	.4byte _080AE478 @ case 11
	.4byte _080AE488 @ case 12
	.4byte _080AE498 @ case 13
	.4byte _080AE4A8 @ case 14
	.4byte _080AE4B8 @ case 15
_080AE3BC:
	ldr r0, _080AE3D4 @ =0x0202BBF8
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1e
	cmp r0, #1
	beq _080AE3EA
	cmp r0, #1
	bgt _080AE3D8
	cmp r0, #0
	beq _080AE3E2
	b _080AE3F2
	.align 2, 0
_080AE3D4: .4byte 0x0202BBF8
_080AE3D8:
	cmp r0, #2
	beq _080AE3EE
	cmp r0, #3
	beq _080AE3E6
	b _080AE3F2
_080AE3E2:
	movs r0, #0
	b _080AE4C4
_080AE3E6:
	movs r0, #1
	b _080AE4C4
_080AE3EA:
	movs r0, #2
	b _080AE4C4
_080AE3EE:
	movs r0, #3
	b _080AE4C4
_080AE3F2:
	ldr r0, _080AE3FC @ =0x0202BBF8
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	b _080AE4C0
	.align 2, 0
_080AE3FC: .4byte 0x0202BBF8
_080AE400:
	ldr r0, _080AE408 @ =0x0202BBF8
	adds r0, #0x40
	b _080AE45C
	.align 2, 0
_080AE408: .4byte 0x0202BBF8
_080AE40C:
	ldr r0, _080AE418 @ =0x0202BBF8
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	b _080AE4C0
	.align 2, 0
_080AE418: .4byte 0x0202BBF8
_080AE41C:
	ldr r0, _080AE428 @ =0x0202BBF8
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	lsrs r2, r0, #0x1e
	b _080AE4C2
	.align 2, 0
_080AE428: .4byte 0x0202BBF8
_080AE42C:
	ldr r0, _080AE434 @ =0x0202BBF8
	adds r0, #0x40
	b _080AE47C
	.align 2, 0
_080AE434: .4byte 0x0202BBF8
_080AE438:
	ldr r0, _080AE444 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	b _080AE4C0
	.align 2, 0
_080AE444: .4byte 0x0202BBF8
_080AE448:
	ldr r0, _080AE454 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	b _080AE4C0
	.align 2, 0
_080AE454: .4byte 0x0202BBF8
_080AE458:
	ldr r0, _080AE464 @ =0x0202BBF8
	adds r0, #0x41
_080AE45C:
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r2, r0, #0x1e
	b _080AE4C2
	.align 2, 0
_080AE464: .4byte 0x0202BBF8
_080AE468:
	ldr r0, _080AE474 @ =0x0202BBF8
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	lsrs r2, r0, #0x1e
	b _080AE4C2
	.align 2, 0
_080AE474: .4byte 0x0202BBF8
_080AE478:
	ldr r0, _080AE484 @ =0x0202BBF8
	adds r0, #0x41
_080AE47C:
	ldrb r0, [r0]
	lsrs r2, r0, #7
	b _080AE4C2
	.align 2, 0
_080AE484: .4byte 0x0202BBF8
_080AE488:
	ldr r0, _080AE494 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	b _080AE4C0
	.align 2, 0
_080AE494: .4byte 0x0202BBF8
_080AE498:
	ldr r0, _080AE4A4 @ =0x0202BBF8
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	b _080AE4C0
	.align 2, 0
_080AE4A4: .4byte 0x0202BBF8
_080AE4A8:
	ldr r0, _080AE4B4 @ =0x0202BBF8
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	b _080AE4C0
	.align 2, 0
_080AE4B4: .4byte 0x0202BBF8
_080AE4B8:
	ldr r0, _080AE4C8 @ =0x0202BBF8
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
_080AE4C0:
	lsrs r2, r0, #0x1f
_080AE4C2:
	adds r0, r2, #0
_080AE4C4:
	bx lr
	.align 2, 0
_080AE4C8: .4byte 0x0202BBF8

	thumb_func_start sub_080AE4CC
sub_080AE4CC: @ 0x080AE4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	cmp r0, #0xf
	bls _080AE4DA
	b _080AE6C8
_080AE4DA:
	lsls r0, r0, #2
	ldr r1, _080AE4E4 @ =_080AE4E8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080AE4E4: .4byte _080AE4E8
_080AE4E8: @ jump table
	.4byte _080AE528 @ case 0
	.4byte _080AE590 @ case 1
	.4byte _080AE5A8 @ case 2
	.4byte _080AE5C0 @ case 3
	.4byte _080AE5D8 @ case 4
	.4byte _080AE5F0 @ case 5
	.4byte _080AE5FC @ case 6
	.4byte _080AE610 @ case 7
	.4byte _080AE628 @ case 8
	.4byte _080AE6C8 @ case 9
	.4byte _080AE640 @ case 10
	.4byte _080AE658 @ case 11
	.4byte _080AE670 @ case 12
	.4byte _080AE688 @ case 13
	.4byte _080AE69C @ case 14
	.4byte _080AE6B0 @ case 15
_080AE528:
	cmp r3, #1
	beq _080AE554
	cmp r3, #1
	bgt _080AE536
	cmp r3, #0
	beq _080AE540
	b _080AE590
_080AE536:
	cmp r3, #2
	beq _080AE568
	cmp r3, #3
	beq _080AE57C
	b _080AE590
_080AE540:
	ldr r1, _080AE550 @ =0x0202BBF8
	adds r1, #0x42
	movs r0, #7
	rsbs r0, r0, #0
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	b _080AE6C8
	.align 2, 0
_080AE550: .4byte 0x0202BBF8
_080AE554:
	ldr r1, _080AE564 @ =0x0202BBF8
	adds r1, #0x42
	movs r0, #6
	ldrb r3, [r1]
	orrs r0, r3
	strb r0, [r1]
	b _080AE6C8
	.align 2, 0
_080AE564: .4byte 0x0202BBF8
_080AE568:
	ldr r0, _080AE578 @ =0x0202BBF8
	adds r0, #0x42
	movs r1, #7
	rsbs r1, r1, #0
	ldrb r2, [r0]
	ands r1, r2
	movs r2, #2
	b _080AE664
	.align 2, 0
_080AE578: .4byte 0x0202BBF8
_080AE57C:
	ldr r0, _080AE58C @ =0x0202BBF8
	adds r0, #0x42
	movs r1, #7
	rsbs r1, r1, #0
	ldrb r3, [r0]
	ands r1, r3
	movs r2, #4
	b _080AE664
	.align 2, 0
_080AE58C: .4byte 0x0202BBF8
_080AE590:
	ldr r2, _080AE5A4 @ =0x0202BBF8
	adds r2, #0x40
	movs r0, #1
	adds r1, r3, #0
	ands r1, r0
	lsls r1, r1, #1
	movs r0, #3
	rsbs r0, r0, #0
	b _080AE6C0
	.align 2, 0
_080AE5A4: .4byte 0x0202BBF8
_080AE5A8:
	ldr r2, _080AE5BC @ =0x0202BBF8
	adds r2, #0x40
	movs r0, #3
	adds r1, r3, #0
	ands r1, r0
	lsls r1, r1, #2
	movs r0, #0xd
	rsbs r0, r0, #0
	b _080AE6C0
	.align 2, 0
_080AE5BC: .4byte 0x0202BBF8
_080AE5C0:
	ldr r2, _080AE5D4 @ =0x0202BBF8
	adds r2, #0x40
	movs r0, #1
	adds r1, r3, #0
	ands r1, r0
	lsls r1, r1, #4
	movs r0, #0x11
	rsbs r0, r0, #0
	b _080AE6C0
	.align 2, 0
_080AE5D4: .4byte 0x0202BBF8
_080AE5D8:
	ldr r2, _080AE5EC @ =0x0202BBF8
	adds r2, #0x40
	movs r0, #3
	adds r1, r3, #0
	ands r1, r0
	lsls r1, r1, #5
	movs r0, #0x61
	rsbs r0, r0, #0
	b _080AE6C0
	.align 2, 0
_080AE5EC: .4byte 0x0202BBF8
_080AE5F0:
	ldr r0, _080AE5F8 @ =0x0202BBF8
	adds r0, #0x40
	b _080AE65C
	.align 2, 0
_080AE5F8: .4byte 0x0202BBF8
_080AE5FC:
	ldr r2, _080AE60C @ =0x0202BBF8
	adds r2, #0x41
	movs r0, #1
	adds r1, r3, #0
	ands r1, r0
	movs r0, #2
	rsbs r0, r0, #0
	b _080AE6C0
	.align 2, 0
_080AE60C: .4byte 0x0202BBF8
_080AE610:
	ldr r2, _080AE624 @ =0x0202BBF8
	adds r2, #0x41
	movs r0, #1
	adds r1, r3, #0
	ands r1, r0
	lsls r1, r1, #1
	movs r0, #3
	rsbs r0, r0, #0
	b _080AE6C0
	.align 2, 0
_080AE624: .4byte 0x0202BBF8
_080AE628:
	ldr r2, _080AE63C @ =0x0202BBF8
	adds r2, #0x41
	movs r0, #3
	adds r1, r3, #0
	ands r1, r0
	lsls r1, r1, #2
	movs r0, #0xd
	rsbs r0, r0, #0
	b _080AE6C0
	.align 2, 0
_080AE63C: .4byte 0x0202BBF8
_080AE640:
	ldr r2, _080AE654 @ =0x0202BBF8
	adds r2, #0x42
	movs r0, #3
	adds r1, r3, #0
	ands r1, r0
	lsls r1, r1, #3
	movs r0, #0x19
	rsbs r0, r0, #0
	b _080AE6C0
	.align 2, 0
_080AE654: .4byte 0x0202BBF8
_080AE658:
	ldr r0, _080AE66C @ =0x0202BBF8
	adds r0, #0x41
_080AE65C:
	lsls r2, r3, #7
	movs r1, #0x7f
	ldrb r3, [r0]
	ands r1, r3
_080AE664:
	orrs r1, r2
	strb r1, [r0]
	b _080AE6C8
	.align 2, 0
_080AE66C: .4byte 0x0202BBF8
_080AE670:
	ldr r2, _080AE684 @ =0x0202BBF8
	adds r2, #0x41
	movs r0, #1
	adds r1, r3, #0
	ands r1, r0
	lsls r1, r1, #6
	movs r0, #0x41
	rsbs r0, r0, #0
	b _080AE6C0
	.align 2, 0
_080AE684: .4byte 0x0202BBF8
_080AE688:
	ldr r2, _080AE698 @ =0x0202BBF8
	adds r2, #0x40
	movs r0, #1
	adds r1, r3, #0
	ands r1, r0
	movs r0, #2
	rsbs r0, r0, #0
	b _080AE6C0
	.align 2, 0
_080AE698: .4byte 0x0202BBF8
_080AE69C:
	ldr r2, _080AE6AC @ =0x0202BBF8
	adds r2, #0x42
	movs r0, #1
	adds r1, r3, #0
	ands r1, r0
	movs r0, #2
	rsbs r0, r0, #0
	b _080AE6C0
	.align 2, 0
_080AE6AC: .4byte 0x0202BBF8
_080AE6B0:
	ldr r2, _080AE6CC @ =0x0202BBF8
	adds r2, #0x42
	movs r0, #1
	adds r1, r3, #0
	ands r1, r0
	lsls r1, r1, #5
	movs r0, #0x21
	rsbs r0, r0, #0
_080AE6C0:
	ldrb r3, [r2]
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
_080AE6C8:
	bx lr
	.align 2, 0
_080AE6CC: .4byte 0x0202BBF8

	thumb_func_start sub_080AE6D0
sub_080AE6D0: @ 0x080AE6D0
	push {r4, r5, r6, r7, lr}
	adds r6, r1, #0
	adds r7, r2, #0
	lsls r0, r6, #1
	adds r5, r0, #4
	movs r0, #0x1f
	ands r5, r0
	lsls r0, r5, #5
	ldr r2, _080AE74C @ =0x02023C60
	movs r4, #0
	adds r1, r0, #0
	adds r1, #0x22
	adds r0, #2
	movs r3, #0x1a
	lsls r0, r0, #1
	adds r0, r0, r2
	lsls r1, r1, #1
	adds r1, r1, r2
_080AE6F4:
	strh r4, [r0]
	strh r4, [r1]
	adds r1, #2
	adds r0, #2
	subs r3, #1
	cmp r3, #0
	bge _080AE6F4
	adds r0, r6, #0
	movs r1, #7
	bl __modsi3
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #4
	bl sub_080ADC24
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_080ADD34
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_080ADDB4
	ldr r1, _080AE750 @ =0x02022C60
	movs r2, #0
	adds r0, r7, #0
	adds r0, #0x62
	movs r3, #0x1a
	lsls r0, r0, #1
	adds r0, r0, r1
_080AE736:
	strh r2, [r0]
	adds r0, #2
	subs r3, #1
	cmp r3, #0
	bge _080AE736
	movs r0, #5
	bl EnableBgSync
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AE74C: .4byte 0x02023C60
_080AE750: .4byte 0x02022C60

	thumb_func_start sub_080AE754
sub_080AE754: @ 0x080AE754
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	movs r3, #0
	movs r1, #0x30
	ldrsh r0, [r5, r1]
	cmp r0, #6
	bls _080AE768
	b _080AE9AC
_080AE768:
	lsls r0, r0, #2
	ldr r1, _080AE774 @ =_080AE778
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080AE774: .4byte _080AE778
_080AE778: @ jump table
	.4byte _080AE794 @ case 0
	.4byte _080AE988 @ case 1
	.4byte _080AE988 @ case 2
	.4byte _080AE988 @ case 3
	.4byte _080AE998 @ case 4
	.4byte _080AE998 @ case 5
	.4byte _080AE998 @ case 6
_080AE794:
	ldr r0, _080AE7B8 @ =0x08B857F8
	ldr r2, [r0]
	ldrh r1, [r2, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080AE7C4
	ldr r0, _080AE7BC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AE81A
	ldr r0, _080AE7C0 @ =0x0000038B
	bl sub_080BE594
	b _080AE81A
	.align 2, 0
_080AE7B8: .4byte 0x08B857F8
_080AE7BC: .4byte 0x0202BBF8
_080AE7C0: .4byte 0x0000038B
_080AE7C4:
	movs r4, #1
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _080AE834
	bl GetOptionMenuLayoutId
	ldr r1, _080AE824 @ =0x08CE5868
	lsls r0, r0, #0x10
	asrs r0, r0, #0xd
	adds r1, #4
	adds r0, r0, r1
	ldr r1, _080AE828 @ =0x08CE583C
	ldr r1, [r1]
	movs r2, #0x2a
	ldrsh r1, [r1, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _080AE7F0
	b _080AE9AC
_080AE7F0:
	movs r0, #0
	bl sub_080AE360
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	beq _080AE800
	b _080AE9AC
_080AE800:
	ldr r0, _080AE82C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AE812
	ldr r0, _080AE830 @ =0x0000038A
	bl sub_080BE594
_080AE812:
	adds r1, r5, #0
	adds r1, #0x36
	movs r0, #1
	strb r0, [r1]
_080AE81A:
	adds r0, r5, #0
	bl Proc_Break
	b _080AE9AC
	.align 2, 0
_080AE824: .4byte 0x08CE5868
_080AE828: .4byte 0x08CE583C
_080AE82C: .4byte 0x0202BBF8
_080AE830: .4byte 0x0000038A
_080AE834:
	ldrh r1, [r2, #6]
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _080AE918
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080AE894
	ldr r0, _080AE890 @ =0x08CE583C
	ldr r2, [r0]
	ldrh r1, [r2, #0x2a]
	movs r6, #0x2a
	ldrsh r0, [r2, r6]
	cmp r0, #0
	beq _080AE8E2
	subs r0, r1, #1
	strh r0, [r2, #0x2a]
	movs r1, #0x2a
	ldrsh r0, [r2, r1]
	movs r3, #0x2c
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	cmp r0, #0
	bgt _080AE88A
	ldrh r1, [r2, #0x2c]
	movs r6, #0x2c
	ldrsh r0, [r2, r6]
	cmp r0, #0
	beq _080AE88A
	subs r0, r1, #1
	strh r0, [r2, #0x2c]
	movs r0, #0x2a
	ldrsh r1, [r2, r0]
	subs r1, #1
	adds r0, r5, #0
	movs r2, #0
	bl sub_080AE6D0
	ldrh r0, [r5, #0x2e]
	subs r0, #4
	strh r0, [r5, #0x2e]
	strh r4, [r5, #0x30]
_080AE88A:
	movs r3, #1
	b _080AE8E6
	.align 2, 0
_080AE890: .4byte 0x08CE583C
_080AE894:
	ldr r0, _080AE908 @ =0x08CE583C
	ldr r2, [r0]
	movs r4, #0x2a
	ldrsh r1, [r2, r4]
	movs r6, #0x34
	ldrsh r0, [r2, r6]
	subs r0, #1
	cmp r1, r0
	bge _080AE8E2
	ldrh r0, [r2, #0x2a]
	adds r0, #1
	strh r0, [r2, #0x2a]
	movs r0, #0x2a
	ldrsh r1, [r2, r0]
	movs r3, #0x2c
	ldrsh r0, [r2, r3]
	subs r0, r1, r0
	cmp r0, #4
	ble _080AE8E0
	movs r4, #0x34
	ldrsh r0, [r2, r4]
	subs r0, #1
	cmp r1, r0
	bge _080AE8E0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	adds r1, #1
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r0, r5, #0
	bl sub_080AE6D0
	ldrh r0, [r5, #0x2e]
	adds r0, #4
	strh r0, [r5, #0x2e]
	movs r0, #4
	strh r0, [r5, #0x30]
_080AE8E0:
	movs r3, #1
_080AE8E2:
	cmp r3, #0
	beq _080AE918
_080AE8E6:
	ldr r0, _080AE90C @ =0x08CE5B98
	adds r1, r5, #0
	bl SpawnProc
	movs r0, #5
	bl EnableBgSync
	ldr r0, _080AE910 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AE9AC
	ldr r0, _080AE914 @ =0x00000386
	bl sub_080BE594
	b _080AE9AC
	.align 2, 0
_080AE908: .4byte 0x08CE583C
_080AE90C: .4byte 0x08CE5B98
_080AE910: .4byte 0x0202BBF8
_080AE914: .4byte 0x00000386
_080AE918:
	ldr r0, _080AE978 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x30
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080AE9AC
	ldr r4, _080AE97C @ =0x08CE58D8
	bl GetOptionMenuLayoutId
	ldr r1, _080AE980 @ =0x08CE5868
	lsls r0, r0, #0x10
	asrs r0, r0, #0xd
	adds r1, #4
	mov r8, r1
	add r0, r8
	ldr r7, _080AE984 @ =0x08CE583C
	ldr r1, [r7]
	movs r2, #0x2a
	ldrsh r1, [r1, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r6, #0x2c
	ldrb r0, [r0]
	muls r0, r6, r0
	adds r4, #0x28
	adds r0, r0, r4
	ldr r0, [r0]
	cmp r0, #0
	beq _080AE9AC
	bl GetOptionMenuLayoutId
	lsls r0, r0, #0x10
	asrs r0, r0, #0xd
	add r0, r8
	ldr r1, [r7]
	movs r3, #0x2a
	ldrsh r1, [r1, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	muls r0, r6, r0
	adds r0, r0, r4
	ldr r1, [r0]
	adds r0, r5, #0
	bl _call_via_r1
	b _080AE9AC
	.align 2, 0
_080AE978: .4byte 0x08B857F8
_080AE97C: .4byte 0x08CE58D8
_080AE980: .4byte 0x08CE5868
_080AE984: .4byte 0x08CE583C
_080AE988:
	ldrh r0, [r5, #0x2e]
	subs r0, #4
	strh r0, [r5, #0x2e]
	ldrh r0, [r5, #0x30]
	cmp r0, #3
	bne _080AE9A8
	movs r0, #0
	b _080AE9AA
_080AE998:
	ldrh r0, [r5, #0x2e]
	adds r0, #4
	strh r0, [r5, #0x2e]
	ldrh r0, [r5, #0x30]
	cmp r0, #6
	bne _080AE9A8
	movs r0, #0
	b _080AE9AA
_080AE9A8:
	adds r0, #1
_080AE9AA:
	strh r0, [r5, #0x30]
_080AE9AC:
	ldrh r2, [r5, #0x2e]
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080AE9C0
sub_080AE9C0: @ 0x080AE9C0
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0807FA04
	ldr r0, _080AE9E4 @ =0x08CE5BB8
	bl Proc_EndEach
	ldr r0, _080AE9E8 @ =0x08CE5B98
	bl Proc_EndEach
	adds r0, r4, #0
	adds r0, #0x36
	ldrb r0, [r0]
	cmp r0, #0
	bne _080AE9EC
	movs r0, #1
	b _080AE9FC
	.align 2, 0
_080AE9E4: .4byte 0x08CE5BB8
_080AE9E8: .4byte 0x08CE5B98
_080AE9EC:
	adds r0, r4, #0
	bl sub_0808AB64
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	movs r0, #0
_080AE9FC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080AEA04
sub_080AEA04: @ 0x080AEA04
	adds r0, #0x37
	movs r1, #1
	strb r1, [r0]
	bx lr

	thumb_func_start sub_080AEA0C
sub_080AEA0C: @ 0x080AEA0C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r3, [r5, #0x5c]
	ldr r0, [r5, #0x60]
	adds r0, r3, r0
	cmp r3, r0
	bge _080AEA38
	ldr r2, _080AEA40 @ =0x020144F8
	ldr r1, _080AEA44 @ =0x02022860
	lsls r0, r3, #1
	adds r4, r0, r1
	adds r2, r0, r2
_080AEA24:
	ldrh r0, [r4]
	strh r0, [r2]
	adds r4, #2
	adds r2, #2
	adds r3, #1
	ldr r0, [r5, #0x5c]
	ldr r1, [r5, #0x60]
	adds r0, r0, r1
	cmp r3, r0
	blt _080AEA24
_080AEA38:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AEA40: .4byte 0x020144F8
_080AEA44: .4byte 0x02022860

	thumb_func_start sub_080AEA48
sub_080AEA48: @ 0x080AEA48
	bx lr
	.align 2, 0

	thumb_func_start sub_080AEA4C
sub_080AEA4C: @ 0x080AEA4C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	mov r1, r8
	adds r1, #0x4e
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	ldrh r1, [r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	mov r0, r8
	ldr r7, [r0, #0x5c]
	ldr r0, [r0, #0x60]
	adds r0, r7, r0
	cmp r7, r0
	bge _080AEB02
	movs r1, #0xf8
	lsls r1, r1, #7
	mov sl, r1
_080AEA7E:
	lsls r2, r7, #1
	mov ip, r2
	ldr r0, _080AEB30 @ =0x020144F8
	add r0, ip
	ldrh r6, [r0]
	mov r1, sl
	ands r1, r6
	mov r0, r8
	ldr r4, [r0, #0x58]
	adds r0, r4, #0
	mov r2, sl
	ands r0, r2
	subs r0, r1, r0
	mov r1, sb
	muls r1, r0, r1
	adds r0, r1, #0
	cmp r0, #0
	bge _080AEAA4
	adds r0, #0xff
_080AEAA4:
	asrs r0, r0, #8
	adds r2, r0, r4
	mov r0, sl
	ands r2, r0
	movs r5, #0xf8
	lsls r5, r5, #2
	adds r1, r5, #0
	ands r1, r6
	adds r0, r4, #0
	ands r0, r5
	subs r0, r1, r0
	mov r1, sb
	muls r1, r0, r1
	adds r0, r1, #0
	cmp r0, #0
	bge _080AEAC6
	adds r0, #0xff
_080AEAC6:
	asrs r0, r0, #8
	adds r3, r0, r4
	ands r3, r5
	movs r5, #0x1f
	adds r1, r5, #0
	ands r1, r6
	adds r0, r4, #0
	ands r0, r5
	subs r0, r1, r0
	mov r1, sb
	muls r1, r0, r1
	adds r0, r1, #0
	cmp r0, #0
	bge _080AEAE4
	adds r0, #0xff
_080AEAE4:
	asrs r0, r0, #8
	adds r0, r0, r4
	ands r0, r5
	ldr r1, _080AEB34 @ =0x02022860
	add r1, ip
	orrs r2, r3
	orrs r2, r0
	strh r2, [r1]
	adds r7, #1
	mov r2, r8
	ldr r0, [r2, #0x5c]
	ldr r1, [r2, #0x60]
	adds r0, r0, r1
	cmp r7, r0
	blt _080AEA7E
_080AEB02:
	bl EnablePalSync
	mov r1, r8
	adds r1, #0x4e
	mov r0, r8
	adds r0, #0x64
	ldrh r2, [r1]
	ldrh r0, [r0]
	adds r0, r2, r0
	strh r0, [r1]
	mov r0, sb
	cmp r0, #0
	bne _080AEB22
	mov r0, r8
	bl Proc_Break
_080AEB22:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AEB30: .4byte 0x020144F8
_080AEB34: .4byte 0x02022860

	thumb_func_start sub_080AEB38
sub_080AEB38: @ 0x080AEB38
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	mov r1, r8
	adds r1, #0x4e
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	ldrh r1, [r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	cmp r0, #0
	beq _080AEBF2
	mov r3, r8
	ldr r6, [r3, #0x5c]
	ldr r0, [r3, #0x60]
	adds r0, r6, r0
	cmp r6, r0
	bge _080AEBF2
	movs r4, #0xf8
	lsls r4, r4, #7
	mov sl, r4
_080AEB6E:
	mov r0, r8
	ldr r5, [r0, #0x58]
	adds r1, r5, #0
	mov r2, sl
	ands r1, r2
	lsls r3, r6, #1
	mov ip, r3
	ldr r2, _080AEC54 @ =0x020144F8
	add r2, ip
	mov r0, sl
	ldrh r4, [r2]
	ands r0, r4
	subs r0, r1, r0
	mov r1, sb
	muls r1, r0, r1
	adds r0, r1, #0
	cmp r0, #0
	bge _080AEB94
	adds r0, #0xff
_080AEB94:
	asrs r0, r0, #8
	ldrh r4, [r2]
	adds r2, r0, r4
	mov r3, sl
	ands r2, r3
	movs r7, #0xf8
	lsls r7, r7, #2
	adds r1, r5, #0
	ands r1, r7
	adds r0, r4, #0
	ands r0, r7
	subs r0, r1, r0
	mov r1, sb
	muls r1, r0, r1
	adds r0, r1, #0
	cmp r0, #0
	bge _080AEBB8
	adds r0, #0xff
_080AEBB8:
	asrs r0, r0, #8
	adds r3, r0, r4
	ands r3, r7
	movs r1, #0x1f
	ands r5, r1
	adds r0, r4, #0
	ands r0, r1
	subs r0, r5, r0
	mov r5, sb
	muls r5, r0, r5
	adds r0, r5, #0
	cmp r0, #0
	bge _080AEBD4
	adds r0, #0xff
_080AEBD4:
	asrs r0, r0, #8
	adds r0, r0, r4
	ands r0, r1
	ldr r1, _080AEC58 @ =0x02022860
	add r1, ip
	orrs r2, r3
	orrs r2, r0
	strh r2, [r1]
	adds r6, #1
	mov r1, r8
	ldr r0, [r1, #0x5c]
	ldr r1, [r1, #0x60]
	adds r0, r0, r1
	cmp r6, r0
	blt _080AEB6E
_080AEBF2:
	bl EnablePalSync
	mov r1, r8
	adds r1, #0x4e
	mov r0, r8
	adds r0, #0x64
	ldrh r2, [r1]
	ldrh r0, [r0]
	adds r0, r2, r0
	strh r0, [r1]
	mov r3, sb
	cmp r3, #0
	bne _080AEC46
	mov r4, r8
	ldr r6, [r4, #0x5c]
	ldr r0, [r4, #0x60]
	adds r0, r6, r0
	cmp r6, r0
	bge _080AEC40
	ldr r0, _080AEC58 @ =0x02022860
	ldr r2, _080AEC54 @ =0x020144F8
	lsls r1, r6, #1
	adds r3, r1, r0
	adds r2, r1, r2
_080AEC22:
	ldrh r0, [r2]
	strh r0, [r3]
	ldrh r0, [r2]
	strh r0, [r3]
	ldrh r0, [r2]
	strh r0, [r3]
	adds r3, #2
	adds r2, #2
	adds r6, #1
	mov r5, r8
	ldr r0, [r5, #0x5c]
	ldr r1, [r5, #0x60]
	adds r0, r0, r1
	cmp r6, r0
	blt _080AEC22
_080AEC40:
	mov r0, r8
	bl Proc_Break
_080AEC46:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AEC54: .4byte 0x020144F8
_080AEC58: .4byte 0x02022860

	thumb_func_start sub_080AEC5C
sub_080AEC5C: @ 0x080AEC5C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	adds r1, r3, #0
	ldr r0, _080AEC88 @ =0x08CE5DE4
	bl SpawnProcLocking
	adds r1, r0, #0
	adds r0, #0x64
	movs r2, #0
	strh r5, [r0]
	str r4, [r1, #0x58]
	subs r0, #0x16
	strh r2, [r0]
	cmp r6, #1
	beq _080AEC98
	cmp r6, #1
	bgt _080AEC8C
	cmp r6, #0
	beq _080AEC92
	b _080AECA8
	.align 2, 0
_080AEC88: .4byte 0x08CE5DE4
_080AEC8C:
	cmp r6, #2
	beq _080AECA0
	b _080AECA8
_080AEC92:
	movs r0, #0x80
	str r0, [r1, #0x5c]
	b _080AECA6
_080AEC98:
	str r2, [r1, #0x5c]
	movs r0, #0x80
	lsls r0, r0, #2
	b _080AECA6
_080AECA0:
	str r2, [r1, #0x5c]
	movs r0, #0x80
	lsls r0, r0, #3
_080AECA6:
	str r0, [r1, #0x60]
_080AECA8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080AECB0
sub_080AECB0: @ 0x080AECB0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	adds r1, r3, #0
	ldr r0, _080AECDC @ =0x08CE5E14
	bl SpawnProcLocking
	adds r1, r0, #0
	adds r0, #0x64
	movs r2, #0
	strh r5, [r0]
	str r4, [r1, #0x58]
	subs r0, #0x16
	strh r2, [r0]
	cmp r6, #1
	beq _080AECEC
	cmp r6, #1
	bgt _080AECE0
	cmp r6, #0
	beq _080AECE6
	b _080AECFC
	.align 2, 0
_080AECDC: .4byte 0x08CE5E14
_080AECE0:
	cmp r6, #2
	beq _080AECF4
	b _080AECFC
_080AECE6:
	movs r0, #0x80
	str r0, [r1, #0x5c]
	b _080AECFA
_080AECEC:
	str r2, [r1, #0x5c]
	movs r0, #0x80
	lsls r0, r0, #2
	b _080AECFA
_080AECF4:
	str r2, [r1, #0x5c]
	movs r0, #0x80
	lsls r0, r0, #3
_080AECFA:
	str r0, [r1, #0x60]
_080AECFC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080AED04
sub_080AED04: @ 0x080AED04
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _080AED88 @ =0x03002870
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r1, [r4]
	ands r0, r1
	strb r0, [r4]
	movs r0, #0
	bl InitBgs
	bl sub_08054E88
	bl sub_08063FE0
	movs r5, #0
	str r5, [r6, #0x38]
	str r5, [r6, #0x3c]
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r4, #1]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r4, #1]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	adds r0, r6, #0
	adds r0, #0x34
	strb r5, [r0]
	adds r1, r6, #0
	adds r1, #0x2c
	movs r0, #2
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x32
	strb r5, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AED88: .4byte 0x03002870

	thumb_func_start sub_080AED8C
sub_080AED8C: @ 0x080AED8C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AEDE4 @ =0x08CE4C50
	bl Proc_Find
	bl Proc_End
	ldr r0, _080AEDE8 @ =0x08CE4C80
	bl Proc_Find
	bl Proc_End
	adds r0, r4, #0
	bl sub_080A9DC0
	movs r0, #1
	bl FadeBgmOut
	ldr r2, _080AEDEC @ =0x03002870
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	movs r0, #0
	bl SetNextGameAction
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AEDE4: .4byte 0x08CE4C50
_080AEDE8: .4byte 0x08CE4C80
_080AEDEC: .4byte 0x03002870

	thumb_func_start sub_080AEDF0
sub_080AEDF0: @ 0x080AEDF0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r4, #0
	adds r6, #0x2c
	ldrb r0, [r6]
	cmp r0, #2
	beq _080AEE0E
	cmp r0, #2
	bgt _080AEE08
	cmp r0, #1
	beq _080AEE56
	b _080AEE6A
_080AEE08:
	cmp r0, #3
	beq _080AEE48
	b _080AEE6A
_080AEE0E:
	adds r0, r4, #0
	adds r0, #0x33
	ldrb r0, [r0]
	adds r5, r4, #0
	adds r5, #0x34
	ldrb r1, [r5]
	bl sub_080B02B0
	str r0, [r4, #0x4c]
	cmp r0, #0
	bne _080AEE34
	movs r0, #1
	bl SetNextGameAction
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
	b _080AEE6A
_080AEE34:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	movs r0, #1
	strb r0, [r6]
	ldr r1, [r4, #0x4c]
	adds r0, r4, #0
	bl sub_080AF344
	b _080AEE6A
_080AEE48:
	ldr r1, [r4, #0x4c]
	adds r0, r4, #0
	bl sub_080B0088
	movs r0, #1
	strb r0, [r6]
	b _080AEE6A
_080AEE56:
	ldr r0, _080AEE70 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0xb
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _080AEE6A
	adds r0, r4, #0
	bl sub_080AED8C
_080AEE6A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AEE70: .4byte 0x08B857F8

	thumb_func_start sub_080AEE74
sub_080AEE74: @ 0x080AEE74
	push {lr}
	ldr r0, _080AEE98 @ =0x08CE5E44
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080AEE9C
	adds r0, #0x33
	ldrb r0, [r0]
	adds r1, #0x34
	ldrb r1, [r1]
	bl sub_080B02B0
	cmp r0, #0
	bne _080AEE9C
	movs r0, #1
	b _080AEE9E
	.align 2, 0
_080AEE98: .4byte 0x08CE5E44
_080AEE9C:
	movs r0, #0
_080AEE9E:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080AEEA4
sub_080AEEA4: @ 0x080AEEA4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AEEBC @ =0x08CE5E44
	bl Proc_Find
	cmp r0, #0
	beq _080AEEB6
	adds r0, #0x2c
	strb r4, [r0]
_080AEEB6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AEEBC: .4byte 0x08CE5E44

	thumb_func_start sub_080AEEC0
sub_080AEEC0: @ 0x080AEEC0
	push {lr}
	movs r0, #3
	bl FadeBgmOut
	pop {r0}
	bx r0

	thumb_func_start sub_080AEECC
sub_080AEECC: @ 0x080AEECC
	push {lr}
	bl sub_080A9DC0
	bl sub_08054EA8
	movs r0, #0
	bl sub_080126E4
	bl sub_08064010
	pop {r0}
	bx r0

	thumb_func_start sub_080AEEE4
sub_080AEEE4: @ 0x080AEEE4
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080AEEFC @ =0x08CE5E44
	bl SpawnProcLocking
	adds r0, #0x33
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AEEFC: .4byte 0x08CE5E44

	thumb_func_start sub_080AEF00
sub_080AEF00: @ 0x080AEF00
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	adds r3, r1, #0
	movs r2, #0
	cmp r1, #0x20
	bne _080AEF14
	ldr r0, _080AEF10 @ =0x0000FFFF
	b _080AEF46
	.align 2, 0
_080AEF10: .4byte 0x0000FFFF
_080AEF14:
	adds r0, r1, #0
	subs r0, #0x61
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x19
	bhi _080AEF24
	adds r2, r1, #0
	subs r2, #0x47
_080AEF24:
	adds r1, r3, #0
	subs r1, #0x41
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x19
	bhi _080AEF32
	adds r2, r1, #0
_080AEF32:
	adds r1, r2, #0
	cmp r2, #0
	bge _080AEF3A
	adds r1, #0xf
_080AEF3A:
	asrs r1, r1, #4
	lsls r0, r1, #7
	lsls r1, r1, #4
	subs r1, r2, r1
	lsls r1, r1, #1
	adds r0, r0, r1
_080AEF46:
	bx lr

	thumb_func_start sub_080AEF48
sub_080AEF48: @ 0x080AEF48
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x20
	bne _080AEF54
	movs r0, #8
	b _080AEF80
_080AEF54:
	adds r2, r1, #0
	subs r2, #0x61
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x19
	bhi _080AEF6C
	ldr r0, _080AEF68 @ =0x08CE5E9C
	adds r0, r2, r0
	b _080AEF7E
	.align 2, 0
_080AEF68: .4byte 0x08CE5E9C
_080AEF6C:
	subs r1, #0x41
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x19
	bls _080AEF7A
	movs r0, #0
	b _080AEF80
_080AEF7A:
	ldr r0, _080AEF84 @ =0x08CE5E9C
	adds r0, r1, r0
_080AEF7E:
	ldrb r0, [r0]
_080AEF80:
	bx lr
	.align 2, 0
_080AEF84: .4byte 0x08CE5E9C

	thumb_func_start sub_080AEF88
sub_080AEF88: @ 0x080AEF88
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r5, #0
	b _080AEF9A
_080AEF90:
	ldrb r0, [r4]
	bl sub_080AEF48
	adds r5, r5, r0
	adds r4, #1
_080AEF9A:
	ldrb r0, [r4]
	cmp r0, #0
	bne _080AEF90
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_080AEFA8
sub_080AEFA8: @ 0x080AEFA8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	str r2, [sp, #0xc]
	str r3, [sp, #0x10]
	ldr r2, [sp, #0x38]
	ldr r3, [sp, #0x3c]
	ldr r4, [sp, #0x40]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #8]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sb, r2
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov sl, r3
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r1, #0
	movs r1, #0xd
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r7, r0, #1
	ldr r0, _080AF020 @ =0x0000FFFF
	ldr r1, [sp, #4]
	cmp r1, r0
	beq _080AF0E0
	cmp r4, #0
	beq _080AF040
	movs r3, #1
	ldr r2, [sp, #8]
	lsls r2, r2, #9
	str r2, [sp, #0x14]
	ldr r0, _080AF024 @ =0x02022860
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r6, _080AF028 @ =0x0000021E
	adds r5, r0, r6
	adds r1, r4, r1
	lsls r2, r7, #5
	lsls r1, r1, #1
	adds r1, r1, r0
	adds r1, #2
	subs r6, #0x1c
	adds r2, r2, r6
	adds r2, r2, r0
_080AF016:
	adds r0, r3, r4
	cmp r0, #0xf
	ble _080AF02C
	ldrh r0, [r5]
	b _080AF02E
	.align 2, 0
_080AF020: .4byte 0x0000FFFF
_080AF024: .4byte 0x02022860
_080AF028: .4byte 0x0000021E
_080AF02C:
	ldrh r0, [r1]
_080AF02E:
	strh r0, [r2]
	adds r2, #2
	adds r1, #2
	adds r3, #1
	cmp r3, #0xf
	ble _080AF016
	bl EnablePalSync
	b _080AF048
_080AF040:
	movs r7, #0xe
	ldr r0, [sp, #8]
	lsls r0, r0, #9
	str r0, [sp, #0x14]
_080AF048:
	mov r1, sb
	cmp r1, #7
	bhi _080AF052
	movs r2, #8
	mov sb, r2
_080AF052:
	mov r3, sl
	cmp r3, #7
	bhi _080AF05C
	movs r6, #8
	mov sl, r6
_080AF05C:
	ldr r4, _080AF0F0 @ =0x080C5A48
	movs r0, #0x80
	adds r0, r0, r4
	mov r8, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	mov r1, sl
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r3, #0
	ldrsh r0, [r4, r3]
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, r8
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, sl
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	ldr r0, [sp, #8]
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_08003388
	ldr r0, _080AF0F4 @ =0x000001FF
	ldr r3, [sp, #0xc]
	ands r3, r0
	ldr r6, [sp, #0x14]
	adds r1, r3, r6
	ldr r2, [sp, #0x10]
	ands r2, r0
	str r2, [sp, #0x10]
	ldr r3, _080AF0F8 @ =0x08CE5EB6
	movs r0, #0xf
	ands r7, r0
	lsls r0, r7, #0xc
	ldr r6, [sp, #4]
	adds r0, r6, r0
	str r0, [sp]
	movs r0, #4
	bl sub_08006A34
_080AF0E0:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AF0F0: .4byte 0x080C5A48
_080AF0F4: .4byte 0x000001FF
_080AF0F8: .4byte 0x08CE5EB6

	thumb_func_start sub_080AF0FC
sub_080AF0FC: @ 0x080AF0FC
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r1, [r7, #0x30]
	ldrb r0, [r1]
	cmp r0, #0
	beq _080AF148
	adds r4, r7, #0
	adds r4, #0x34
	ldrb r5, [r4]
	movs r0, #0x2c
	ldrsh r6, [r7, r0]
	ldrb r0, [r1]
	bl sub_080AEF00
	adds r3, r0, #0
	adds r0, r7, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_080AF554
	ldr r2, _080AF150 @ =0x02000000
	ldrb r3, [r4]
	lsls r1, r3, #2
	adds r1, r1, r2
	str r0, [r1]
	ldr r0, [r7, #0x30]
	ldrb r0, [r0]
	bl sub_080AEF48
	ldrh r1, [r7, #0x2c]
	adds r0, r1, r0
	strh r0, [r7, #0x2c]
	ldr r0, [r7, #0x30]
	adds r0, #1
	str r0, [r7, #0x30]
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
_080AF148:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AF150: .4byte 0x02000000

	thumb_func_start sub_080AF154
sub_080AF154: @ 0x080AF154
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r3, _080AF214 @ =0x03002870
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r3, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r2, r3, #0
	adds r2, #0x44
	movs r1, #0
	movs r0, #0x10
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x45
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	strh r1, [r6, #0x2a]
	ldr r0, _080AF218 @ =0x08420608
	ldr r2, _080AF21C @ =0x02000000
	movs r3, #0
	adds r1, r2, #0
	adds r1, #0x3c
_080AF19A:
	str r3, [r1]
	subs r1, #4
	cmp r1, r2
	bge _080AF19A
	movs r5, #0
	str r5, [r6, #0x3c]
	ldr r1, _080AF220 @ =0x06010000
	bl Decompress
	ldr r0, _080AF224 @ =0x084205E8
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r4, _080AF228 @ =0x0841ED84
	movs r1, #0xf0
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r1, #0xf8
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080AF22C @ =0x0841E3F8
	ldr r1, _080AF230 @ =0x06016000
	bl Decompress
	ldr r0, [r6, #0x44]
	ldr r0, [r0]
	str r0, [r6, #0x30]
	adds r0, r6, #0
	adds r0, #0x34
	strb r5, [r0]
	ldr r0, [r6, #0x30]
	bl sub_080AEF88
	movs r1, #0xf0
	subs r1, r1, r0
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	subs r1, #8
	strh r1, [r6, #0x2c]
	adds r0, r6, #0
	bl sub_080AF0FC
	ldr r0, [r6, #0x44]
	ldrb r1, [r0, #0xb]
	adds r0, r6, #0
	bl sub_080AF844
	str r0, [r6, #0x3c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AF214: .4byte 0x03002870
_080AF218: .4byte 0x08420608
_080AF21C: .4byte 0x02000000
_080AF220: .4byte 0x06010000
_080AF224: .4byte 0x084205E8
_080AF228: .4byte 0x0841ED84
_080AF22C: .4byte 0x0841E3F8
_080AF230: .4byte 0x06016000

	thumb_func_start sub_080AF234
sub_080AF234: @ 0x080AF234
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080AF288 @ =0x03002870
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r2, #0x3f
	ldrb r0, [r3]
	ands r2, r0
	movs r0, #0x80
	orrs r2, r0
	mov r0, ip
	adds r0, #0x44
	movs r5, #0
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	ldrh r0, [r4, #0x2a]
	lsrs r1, r0, #1
	movs r0, #0x10
	subs r0, r0, r1
	mov r1, ip
	adds r1, #0x46
	strb r0, [r1]
	movs r0, #0x20
	orrs r2, r0
	strb r2, [r3]
	ldrh r0, [r4, #0x2a]
	adds r0, #1
	strh r0, [r4, #0x2a]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x20
	bne _080AF280
	strh r5, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
_080AF280:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AF288: .4byte 0x03002870

	thumb_func_start sub_080AF28C
sub_080AF28C: @ 0x080AF28C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x5f
	bls _080AF2A8
	adds r0, r4, #0
	bl Proc_Break
	movs r0, #0
	strh r0, [r4, #0x2a]
	ldr r0, [r4, #0x44]
	ldr r0, [r0]
	str r0, [r4, #0x30]
	b _080AF2C4
_080AF2A8:
	cmp r0, #0xf
	bls _080AF2BE
	ldrh r0, [r4, #0x2a]
	subs r0, #0x10
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080AF2BE
	adds r0, r4, #0
	bl sub_080AF0FC
_080AF2BE:
	ldrh r0, [r4, #0x2a]
	adds r0, #1
	strh r0, [r4, #0x2a]
_080AF2C4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080AF2CC
sub_080AF2CC: @ 0x080AF2CC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2a]
	cmp r0, #0x14
	bne _080AF2DE
	ldr r0, [r5, #0x3c]
	movs r1, #4
	bl Proc_Goto
_080AF2DE:
	ldrh r0, [r5, #0x2a]
	cmp r0, #0x4f
	bls _080AF2EE
	adds r0, r5, #0
	bl Proc_Break
	movs r0, #0
	b _080AF326
_080AF2EE:
	ldrh r6, [r5, #0x2a]
	adds r0, r6, #0
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080AF322
	ldr r0, [r5, #0x30]
	ldrb r0, [r0]
	cmp r0, #0
	beq _080AF322
	ldr r4, _080AF330 @ =0x02000000
	adds r0, r6, #0
	movs r1, #3
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r4
	ldr r0, [r0]
	bl Proc_Break
	ldr r0, [r5, #0x30]
	adds r0, #1
	str r0, [r5, #0x30]
_080AF322:
	ldrh r0, [r5, #0x2a]
	adds r0, #1
_080AF326:
	strh r0, [r5, #0x2a]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AF330: .4byte 0x02000000

	thumb_func_start sub_080AF334
sub_080AF334: @ 0x080AF334
	push {lr}
	bl sub_080A9DC0
	movs r0, #3
	bl sub_080AEEA4
	pop {r0}
	bx r0

	thumb_func_start sub_080AF344
sub_080AF344: @ 0x080AF344
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _080AF35C @ =0x08CE5EC0
	adds r1, r4, #0
	bl SpawnProc
	str r4, [r0, #0x40]
	str r5, [r0, #0x44]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080AF35C: .4byte 0x08CE5EC0

	thumb_func_start sub_080AF360
sub_080AF360: @ 0x080AF360
	movs r1, #0
	strh r1, [r0, #0x2a]
	bx lr
	.align 2, 0

	thumb_func_start sub_080AF368
sub_080AF368: @ 0x080AF368
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	adds r7, r0, #0
	movs r0, #0x2e
	adds r0, r0, r7
	mov sb, r0
	ldrb r1, [r0]
	str r1, [sp, #0xc]
	cmp r1, #0
	bne _080AF444
	ldr r3, _080AF43C @ =0x080C5A48
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r0, r3, r2
	movs r1, #0
	ldrsh r4, [r0, r1]
	asrs r4, r4, #6
	mov sl, r4
	adds r0, r3, #0
	adds r0, #0xc0
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r5, r0, #1
	adds r5, r5, r0
	asrs r5, r5, #9
	ldrh r0, [r7, #0x2a]
	movs r2, #0xc0
	subs r2, r2, r0
	movs r1, #0xff
	ands r2, r1
	adds r1, r2, #0
	adds r1, #0x40
	lsls r1, r1, #1
	adds r1, r1, r3
	movs r4, #0
	ldrsh r1, [r1, r4]
	asrs r6, r1, #6
	lsls r2, r2, #1
	adds r2, r2, r3
	movs r1, #0
	ldrsh r2, [r2, r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	asrs r3, r1, #9
	lsls r0, r0, #8
	movs r1, #0x60
	str r3, [sp, #0x14]
	bl __divsi3
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r4, [r7, #0x2c]
	mov r8, r4
	mov r0, sb
	ldrb r0, [r0]
	mov sb, r0
	movs r2, #0x30
	ldrsh r4, [r7, r2]
	adds r4, r4, r6
	mov r0, sl
	subs r4, r4, r0
	ldr r0, _080AF440 @ =0x000001FF
	ands r4, r0
	subs r5, #0x18
	ldr r3, [sp, #0x14]
	subs r5, r3, r5
	ands r5, r0
	str r1, [sp]
	str r1, [sp, #4]
	ldrh r0, [r7, #0x2a]
	movs r1, #0xc
	bl __divsi3
	movs r1, #8
	subs r1, r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #8]
	mov r0, r8
	mov r1, sb
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_080AEFA8
	ldrh r0, [r7, #0x2a]
	adds r0, #4
	strh r0, [r7, #0x2a]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x60
	bne _080AF494
	mov r1, sp
	ldrh r1, [r1, #0xc]
	strh r1, [r7, #0x2a]
	adds r0, r7, #0
	bl Proc_Break
	b _080AF494
	.align 2, 0
_080AF43C: .4byte 0x080C5A48
_080AF440: .4byte 0x000001FF
_080AF444:
	ldrh r1, [r7, #0x2a]
	adds r0, r1, #0
	adds r2, r1, #0
	asrs r4, r0, #4
	movs r0, #0x10
	subs r6, r0, r4
	adds r3, r6, #0
	ldrh r5, [r7, #0x2c]
	mov r2, sb
	ldrb r6, [r2]
	movs r2, #0x30
	ldrsh r0, [r7, r2]
	subs r2, r0, r3
	movs r0, #0x18
	subs r3, r0, r3
	str r1, [sp]
	adds r0, #0xe8
	mov r8, r0
	str r0, [sp, #4]
	movs r0, #0x10
	subs r0, r0, r4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_080AEFA8
	ldrh r0, [r7, #0x2a]
	adds r0, #0x10
	strh r0, [r7, #0x2a]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r8
	bne _080AF494
	movs r0, #0
	strh r0, [r7, #0x2a]
	adds r0, r7, #0
	bl Proc_Break
_080AF494:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080AF4A4
sub_080AF4A4: @ 0x080AF4A4
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r1, [r1]
	movs r3, #0x30
	ldrsh r2, [r4, r3]
	movs r3, #0x80
	lsls r3, r3, #1
	str r3, [sp]
	str r3, [sp, #4]
	movs r5, #0
	str r5, [sp, #8]
	movs r3, #0x18
	bl sub_080AEFA8
	strh r5, [r4, #0x2a]
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080AF4D4
sub_080AF4D4: @ 0x080AF4D4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	adds r5, r0, #0
	ldrh r1, [r5, #0x2a]
	movs r6, #0x80
	lsls r6, r6, #1
	adds r2, r1, r6
	subs r3, r6, r1
	movs r0, #0x30
	ldrsh r4, [r5, r0]
	adds r0, r4, #0
	subs r0, #0x58
	muls r0, r1, r0
	muls r0, r1, r0
	asrs r0, r0, #0xf
	ldrh r1, [r5, #0x2c]
	mov ip, r1
	movs r7, #0x2e
	adds r7, r7, r5
	mov r8, r7
	ldrb r1, [r7]
	adds r4, r4, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	str r3, [sp, #4]
	ldrh r0, [r5, #0x2a]
	asrs r0, r0, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	mov r0, ip
	adds r2, r4, #0
	movs r3, #0x18
	bl sub_080AEFA8
	ldrh r0, [r5, #0x2a]
	cmp r0, r6
	bne _080AF53E
	ldr r0, _080AF550 @ =0x02000000
	mov r2, r8
	ldrb r2, [r2]
	lsls r1, r2, #2
	adds r1, r1, r0
	movs r0, #0
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
_080AF53E:
	ldrh r0, [r5, #0x2a]
	adds r0, #8
	strh r0, [r5, #0x2a]
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AF550: .4byte 0x02000000

	thumb_func_start sub_080AF554
sub_080AF554: @ 0x080AF554
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r0, _080AF580 @ =0x08CE5F10
	adds r1, r4, #0
	bl SpawnProc
	adds r1, r0, #0
	adds r1, #0x2e
	strb r5, [r1]
	strh r6, [r0, #0x30]
	mov r1, r8
	strh r1, [r0, #0x2c]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080AF580: .4byte 0x08CE5F10

	thumb_func_start sub_080AF584
sub_080AF584: @ 0x080AF584
	push {lr}
	bl EnablePalSync
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080AF590
sub_080AF590: @ 0x080AF590
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	movs r0, #0
	strh r0, [r3, #0x2a]
	ldr r0, _080AF5F4 @ =0x02022860
	movs r1, #0
	movs r4, #0xf
	ldr r2, _080AF5F8 @ =0x000003FE
	adds r0, r0, r2
_080AF5A2:
	strh r1, [r0]
	subs r0, #2
	subs r4, #1
	cmp r4, #0
	bge _080AF5A2
	adds r0, r3, #0
	adds r0, #0x2e
	movs r1, #0
	strb r1, [r0]
	adds r2, r3, #0
	adds r2, #0x2d
	strb r1, [r2]
	movs r4, #0
	adds r7, r3, #0
	adds r7, #0x2c
	adds r6, r0, #0
	adds r5, r2, #0
_080AF5C4:
	ldrb r0, [r7]
	bl GetJobInfo
	adds r0, #0x2c
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _080AF5E4
	movs r0, #1
	lsls r0, r4
	ldrb r1, [r6]
	orrs r0, r1
	strb r0, [r6]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
_080AF5E4:
	adds r4, #1
	cmp r4, #7
	ble _080AF5C4
	bl EnablePalSync
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AF5F4: .4byte 0x02022860
_080AF5F8: .4byte 0x000003FE

	thumb_func_start sub_080AF5FC
sub_080AF5FC: @ 0x080AF5FC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r1, r1, #0x18
	movs r7, #0xe0
	lsls r7, r7, #8
	cmp r1, #0
	beq _080AF61A
	movs r7, #0xf0
	lsls r7, r7, #8
_080AF61A:
	ldr r4, _080AF65C @ =0x08CE6104
	str r7, [sp]
	movs r0, #4
	movs r1, #0x74
	movs r2, #0x48
	adds r3, r4, #0
	bl sub_08006A34
	movs r5, #0
	cmp r5, r8
	bge _080AF686
	mov sb, r4
	movs r6, #0x74
	movs r4, #0x74
_080AF636:
	mov r0, r8
	subs r0, #1
	cmp r5, r0
	bge _080AF660
	str r7, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x48
	mov r3, sb
	bl sub_08006A34
	str r7, [sp]
	movs r0, #4
	adds r1, r6, #0
	movs r2, #0x48
	mov r3, sb
	bl sub_08006A34
	b _080AF67C
	.align 2, 0
_080AF65C: .4byte 0x08CE6104
_080AF660:
	str r7, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x48
	ldr r3, _080AF694 @ =0x08CE60FC
	bl sub_08006A34
	str r7, [sp]
	movs r0, #4
	adds r1, r6, #0
	movs r2, #0x48
	ldr r3, _080AF698 @ =0x08CE610C
	bl sub_08006A34
_080AF67C:
	adds r6, #8
	subs r4, #8
	adds r5, #1
	cmp r5, r8
	blt _080AF636
_080AF686:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AF694: .4byte 0x08CE60FC
_080AF698: .4byte 0x08CE610C

	thumb_func_start sub_080AF69C
sub_080AF69C: @ 0x080AF69C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sb, r2
	movs r0, #0xe0
	lsls r0, r0, #8
	mov sl, r0
	cmp r5, #0
	beq _080AF6C8
	movs r1, #0xf0
	lsls r1, r1, #8
	mov sl, r1
_080AF6C8:
	movs r4, #0
	ldr r6, _080AF758 @ =0x02022860
	movs r7, #0xf8
	lsls r7, r7, #2
	adds r3, r6, r7
	lsls r2, r5, #0x10
	movs r0, #0xf0
	lsls r0, r0, #1
	mov ip, r0
_080AF6DA:
	adds r0, r5, r4
	movs r1, #0xf
	cmp r0, #0xf
	bgt _080AF6E4
	lsrs r1, r2, #0x10
_080AF6E4:
	mov r7, ip
	adds r0, r1, r7
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	strh r0, [r3]
	adds r3, #2
	movs r0, #0x80
	lsls r0, r0, #9
	adds r2, r2, r0
	adds r4, #1
	cmp r4, #0xf
	ble _080AF6DA
	bl EnablePalSync
	movs r4, #0
	mov r1, r8
	lsls r0, r1, #5
	subs r0, #0x88
	ldr r6, _080AF75C @ =0x08CE60C8
	rsbs r5, r0, #0
_080AF70E:
	mov r0, sb
	asrs r0, r4
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080AF730
	ldr r1, _080AF760 @ =0x000001FF
	ands r1, r5
	ldr r3, [r6]
	movs r0, #0xf0
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #4
	movs r2, #0x50
	bl sub_08006A34
	adds r5, #0x20
_080AF730:
	adds r6, #4
	adds r4, #1
	cmp r4, #7
	ble _080AF70E
	ldr r3, _080AF764 @ =0x08CE60E8
	mov r7, sl
	str r7, [sp]
	movs r0, #4
	movs r1, #0x90
	movs r2, #0x50
	bl sub_08006A34
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AF758: .4byte 0x02022860
_080AF75C: .4byte 0x08CE60C8
_080AF760: .4byte 0x000001FF
_080AF764: .4byte 0x08CE60E8

	thumb_func_start sub_080AF768
sub_080AF768: @ 0x080AF768
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2a]
	adds r0, #1
	adds r1, r0, #0
	strh r0, [r4, #0x2a]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xd
	bhi _080AF788
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	bl sub_080AF5FC
	b _080AF79A
_080AF788:
	movs r0, #0xe
	movs r1, #0
	bl sub_080AF5FC
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
_080AF79A:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080AF7A0
sub_080AF7A0: @ 0x080AF7A0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2a]
	adds r0, #1
	adds r1, r0, #0
	strh r0, [r4, #0x2a]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x10
	bls _080AF7BE
	movs r5, #0
	adds r0, r4, #0
	bl Proc_Break
	b _080AF7C6
_080AF7BE:
	movs r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_080AF7C6:
	movs r0, #0xe
	movs r1, #0
	bl sub_080AF5FC
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	adds r0, #1
	ldrb r2, [r0]
	adds r0, r5, #0
	bl sub_080AF69C
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_080AF7E4
sub_080AF7E4: @ 0x080AF7E4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xe
	movs r1, #0
	bl sub_080AF5FC
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	adds r0, #1
	ldrb r2, [r0]
	movs r0, #0
	bl sub_080AF69C
	movs r0, #0
	strh r0, [r4, #0x2a]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080AF80C
sub_080AF80C: @ 0x080AF80C
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2a]
	adds r0, #1
	strh r0, [r2, #0x2a]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x11
	cmp r0, #0x10
	bls _080AF826
	adds r0, r2, #0
	bl Proc_Break
	b _080AF840
_080AF826:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r2, #0
	adds r1, #0x2d
	ldrb r1, [r1]
	adds r2, #0x2e
	ldrb r2, [r2]
	bl sub_080AF69C
	movs r0, #0xe
	movs r1, #1
	bl sub_080AF5FC
_080AF840:
	pop {r0}
	bx r0

	thumb_func_start sub_080AF844
sub_080AF844: @ 0x080AF844
	push {r4, lr}
	adds r2, r0, #0
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080AF860 @ =0x08CE5F48
	adds r1, r2, #0
	bl SpawnProc
	adds r1, r0, #0
	adds r1, #0x2c
	strb r4, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080AF860: .4byte 0x08CE5F48

	thumb_func_start sub_080AF864
sub_080AF864: @ 0x080AF864
	ldr r0, _080AF88C @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x6d
	bhi _080AF89C
	ldr r3, _080AF890 @ =0x04000008
	ldrh r2, [r3]
	ldr r1, _080AF894 @ =0x0000FFFC
	adds r0, r1, #0
	ands r0, r2
	adds r0, #2
	strh r0, [r3]
	ldr r2, _080AF898 @ =0x0400000C
	ldrh r0, [r2]
	ands r1, r0
	adds r1, #2
	b _080AF8B2
	.align 2, 0
_080AF88C: .4byte 0x04000006
_080AF890: .4byte 0x04000008
_080AF894: .4byte 0x0000FFFC
_080AF898: .4byte 0x0400000C
_080AF89C:
	ldr r3, _080AF8B8 @ =0x04000008
	ldrh r2, [r3]
	ldr r1, _080AF8BC @ =0x0000FFFC
	adds r0, r1, #0
	ands r0, r2
	adds r0, #1
	strh r0, [r3]
	ldr r2, _080AF8C0 @ =0x0400000C
	ldrh r0, [r2]
	ands r1, r0
	adds r1, #1
_080AF8B2:
	strh r1, [r2]
	bx lr
	.align 2, 0
_080AF8B8: .4byte 0x04000008
_080AF8BC: .4byte 0x0000FFFC
_080AF8C0: .4byte 0x0400000C

	thumb_func_start sub_080AF8C4
sub_080AF8C4: @ 0x080AF8C4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _080AF990 @ =0x03002870
	mov ip, r0
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	mov r1, ip
	adds r1, #0x44
	movs r2, #0
	movs r3, #0x10
	mov r8, r3
	movs r0, #0x10
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r2, [r0]
	ldr r0, _080AF994 @ =0x0000FFE0
	mov r1, ip
	ldrh r1, [r1, #0x3c]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	ldr r1, _080AF998 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xe0
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	mov r1, ip
	strh r0, [r1, #0x3c]
	movs r5, #0x20
	ldrb r0, [r1, #1]
	orrs r0, r5
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r3, ip
	strb r0, [r3, #1]
	mov r0, ip
	adds r0, #0x2d
	strb r2, [r0]
	adds r0, #4
	strb r2, [r0]
	mov r1, ip
	adds r1, #0x2c
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	mov r6, ip
	adds r6, #0x34
	movs r0, #1
	ldrb r1, [r6]
	orrs r1, r0
	movs r2, #2
	orrs r1, r2
	movs r4, #4
	orrs r1, r4
	movs r3, #8
	orrs r1, r3
	mov r2, r8
	orrs r1, r2
	mov r7, ip
	adds r7, #0x36
	ldrb r2, [r7]
	orrs r0, r2
	movs r2, #3
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r4
	orrs r0, r3
	mov r3, r8
	orrs r0, r3
	orrs r1, r5
	strb r1, [r6]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r7]
	mov r0, ip
	adds r0, #0x3d
	ldrb r1, [r0]
	orrs r5, r1
	strb r5, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AF990: .4byte 0x03002870
_080AF994: .4byte 0x0000FFE0
_080AF998: .4byte 0x0000E0FF

	thumb_func_start sub_080AF99C
sub_080AF99C: @ 0x080AF99C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x3c
	mov sb, r0
	movs r0, #0
	str r0, [sp, #0x34]
	add r1, sp, #4
	ldr r0, _080AF9D0 @ =0x084218A8
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	mov r1, sb
	ldr r0, [r1, #0x34]
	ldr r0, [r0, #0x18]
	str r0, [r1, #0x38]
	movs r7, #4
	b _080AF9D6
	.align 2, 0
_080AF9D0: .4byte 0x084218A8
_080AF9D4:
	adds r7, #1
_080AF9D6:
	cmp r7, #7
	bgt _080AF9F2
	mov r2, sb
	ldr r0, [r2, #0x34]
	ldrb r0, [r0, #0xb]
	bl GetJobInfo
	adds r0, #0x2c
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	beq _080AF9D4
	movs r3, #1
	str r3, [sp, #0x34]
_080AF9F2:
	movs r4, #0
	movs r0, #0
	mov r1, sb
	strh r0, [r1, #0x2a]
	strh r0, [r1, #0x2c]
	adds r1, #0x46
	movs r0, #0xfa
	strb r0, [r1]
	ldr r6, _080AFBD4 @ =0x02022C60
	adds r0, r6, #0
	movs r1, #0
	bl TmFill
	ldr r0, _080AFBD8 @ =0x02023460
	movs r1, #0
	bl TmFill
	ldr r2, _080AFBDC @ =0x02023C60
	mov r8, r2
	mov r0, r8
	movs r1, #0
	bl TmFill
	ldr r5, _080AFBE0 @ =0x03002870
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r3, [r5, #1]
	ands r0, r3
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
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
	bl ResetTextFont
	bl ResetText
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r3, [r5, #0xc]
	ands r0, r3
	movs r2, #2
	orrs r0, r2
	strb r0, [r5, #0xc]
	adds r0, r1, #0
	ldrb r4, [r5, #0x10]
	ands r0, r4
	orrs r0, r2
	strb r0, [r5, #0x10]
	ldrb r0, [r5, #0x14]
	ands r1, r0
	orrs r1, r2
	strb r1, [r5, #0x14]
	movs r0, #3
	ldrb r1, [r5, #0x18]
	orrs r0, r1
	strb r0, [r5, #0x18]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r4, _080AFBE4 @ =0x08407440
	movs r0, #3
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r5, #0xc0
	lsls r5, r5, #0x13
	adds r1, r1, r5
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080AFBE8 @ =0x0841F524
	movs r1, #0xa0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080AFBEC @ =0x02024460
	ldr r1, _080AFBF0 @ =0x0841F544
	movs r2, #0xa0
	lsls r2, r2, #8
	bl TmApplyTsa_t
	ldr r4, _080AFBF4 @ =0x0841EE04
	movs r0, #2
	bl GetBgChrOffset
	adds r1, r0, #0
	adds r1, r1, r5
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080AFBF8 @ =0x0841EFEC
	movs r1, #0x90
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r1, _080AFBFC @ =0x0841F00C
	movs r2, #0x90
	lsls r2, r2, #8
	mov r0, r8
	bl TmApplyTsa_t
	movs r0, #0xf
	bl EnableBgSync
	adds r0, r6, #0
	movs r1, #0
	bl TmFill
	mov r2, sb
	ldr r0, [r2, #0x34]
	ldrb r0, [r0, #0xb]
	bl GetJobInfo
	ldrb r0, [r0, #0xb]
	mov r4, sb
	adds r4, #0x40
	strb r0, [r4]
	mov r3, sb
	ldr r0, [r3, #0x34]
	ldrb r0, [r0, #0xb]
	bl GetJobInfo
	ldrb r0, [r0, #0xc]
	mov r1, sb
	adds r1, #0x41
	strb r0, [r1]
	mov r1, sb
	ldr r0, [r1, #0x34]
	ldrb r0, [r0, #0xb]
	bl GetJobInfo
	ldrb r0, [r0, #0xd]
	mov r1, sb
	adds r1, #0x42
	strb r0, [r1]
	mov r2, sb
	ldr r0, [r2, #0x34]
	ldrb r0, [r0, #0xb]
	bl GetJobInfo
	ldrb r0, [r0, #0xe]
	mov r1, sb
	adds r1, #0x43
	strb r0, [r1]
	mov r3, sb
	ldr r0, [r3, #0x34]
	ldrb r0, [r0, #0xb]
	bl GetJobInfo
	ldrb r1, [r0, #0xf]
	mov r0, sb
	adds r0, #0x44
	strb r1, [r0]
	mov r1, sb
	ldr r0, [r1, #0x34]
	ldrb r0, [r0, #0xb]
	bl GetJobInfo
	ldrb r0, [r0, #0x10]
	mov r1, sb
	adds r1, #0x45
	strb r0, [r1]
	movs r7, #0
	str r4, [sp, #0x38]
	movs r2, #0x4a
	adds r2, r2, r6
	mov sl, r2
	adds r6, #0x42
	mov r8, r6
	movs r6, #0
	movs r4, #0
_080AFB98:
	ldr r0, _080AFC00 @ =0x0200FB68
	adds r5, r4, r0
	adds r0, r5, #0
	movs r1, #3
	bl InitText
	adds r0, r5, #0
	bl ClearText
	adds r0, r5, #0
	movs r1, #3
	bl Text_SetColor
	adds r0, r5, #0
	movs r1, #0
	bl Text_SetCursor
	ldr r3, [sp, #0x34]
	cmp r3, #0
	beq _080AFC04
	add r0, sp, #0x1c
	adds r0, r0, r6
	ldr r0, [r0]
	bl GetMsg
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawString
	b _080AFC18
	.align 2, 0
_080AFBD4: .4byte 0x02022C60
_080AFBD8: .4byte 0x02023460
_080AFBDC: .4byte 0x02023C60
_080AFBE0: .4byte 0x03002870
_080AFBE4: .4byte 0x08407440
_080AFBE8: .4byte 0x0841F524
_080AFBEC: .4byte 0x02024460
_080AFBF0: .4byte 0x0841F544
_080AFBF4: .4byte 0x0841EE04
_080AFBF8: .4byte 0x0841EFEC
_080AFBFC: .4byte 0x0841F00C
_080AFC00: .4byte 0x0200FB68
_080AFC04:
	mov r0, sp
	adds r0, r0, r6
	adds r0, #4
	ldr r0, [r0]
	bl GetMsg
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawString
_080AFC18:
	ldr r0, _080AFD7C @ =0x0200FB68
	adds r0, r4, r0
	mov r1, r8
	bl sub_08005590
	ldr r1, [sp, #0x38]
	adds r0, r1, r7
	ldrb r2, [r0]
	mov r0, sl
	movs r1, #0
	bl sub_080061D8
	movs r2, #0x80
	add sl, r2
	add r8, r2
	adds r6, #4
	adds r4, #8
	adds r7, #1
	cmp r7, #5
	ble _080AFB98
	movs r5, #0
	mov r0, sb
	bl sub_080B0294
	mov r3, sb
	str r0, [r3, #0x3c]
	movs r0, #0x80
	lsls r0, r0, #1
	movs r1, #2
	movs r2, #0
	bl InitTalk
	bl sub_08007F64
	bl sub_080097FC
	bl EndTalk
	mov r4, sb
	ldr r0, [r4, #0x34]
	ldr r2, [r0, #4]
	movs r0, #2
	movs r1, #0xf
	bl StartTalkMsg
	movs r0, #0
	bl sub_080080F4
	movs r0, #1
	bl SetTalkFlag
	movs r0, #2
	bl SetTalkFlag
	movs r0, #4
	bl SetTalkFlag
	movs r0, #8
	bl SetTalkFlag
	movs r0, #0x40
	bl SetTalkFlag
	movs r0, #4
	bl sub_080080D8
	ldr r0, _080AFD80 @ =0x02000040
	ldr r3, [r4, #0x34]
	movs r1, #0xa
	ldrsb r1, [r3, r1]
	strh r1, [r0, #8]
	movs r1, #0x82
	lsls r1, r1, #1
	strh r1, [r0, #2]
	movs r1, #0x58
	strh r1, [r0, #4]
	ldrb r1, [r3, #0xd]
	strh r1, [r0, #6]
	movs r1, #6
	strh r1, [r0, #0xa]
	ldrb r1, [r3, #0xc]
	strb r1, [r0, #1]
	movs r4, #1
	strh r4, [r0, #0xc]
	movs r1, #0xc0
	lsls r1, r1, #1
	strh r1, [r0, #0xe]
	movs r1, #2
	strh r1, [r0, #0x10]
	ldr r1, _080AFD84 @ =0x02000078
	str r1, [r0, #0x1c]
	ldr r1, _080AFD88 @ =0x02002078
	str r1, [r0, #0x24]
	ldr r1, _080AFD8C @ =0x02007878
	str r1, [r0, #0x20]
	ldr r1, _080AFD90 @ =0x02007918
	str r1, [r0, #0x28]
	ldr r1, _080AFD94 @ =0x0200A318
	str r1, [r0, #0x30]
	ldrb r2, [r3, #0xe]
	strh r2, [r1]
	ldrb r2, [r3, #0xf]
	strh r2, [r1, #2]
	ldrb r2, [r3, #0x10]
	strh r2, [r1, #4]
	ldrb r2, [r3, #0x11]
	strh r2, [r1, #6]
	ldrb r2, [r3, #0x12]
	strh r2, [r1, #8]
	movs r2, #0xa0
	lsls r2, r2, #2
	strh r2, [r1, #0xe]
	movs r3, #0xf
	strh r3, [r1, #0x10]
	subs r2, #0x80
	strh r2, [r1, #0xa]
	strh r3, [r1, #0xc]
	strh r4, [r1, #0x12]
	ldr r2, _080AFD98 @ =0x02023460
	str r2, [r1, #0x14]
	ldr r2, _080AFD9C @ =0x0200A340
	str r2, [r1, #0x18]
	ldr r2, _080AFDA0 @ =0x0200C340
	str r2, [r1, #0x1c]
	ldr r2, _080AFDA4 @ =0x0200CB40
	str r2, [r1, #0x20]
	ldr r2, _080AFDA8 @ =sub_080AF8C4
	str r2, [r1, #0x24]
	bl sub_08054EC8
	ldr r4, _080AFDAC @ =0x0200DB40
	mov r0, sb
	ldr r1, [r0, #0x34]
	ldrb r0, [r1, #0x13]
	strh r0, [r4]
	movs r0, #0xa
	strh r0, [r4, #2]
	movs r0, #0xe0
	lsls r0, r0, #2
	strh r0, [r4, #4]
	ldrb r0, [r1, #0x14]
	strh r0, [r4, #6]
	movs r0, #0xb
	strh r0, [r4, #8]
	movs r0, #0xf0
	lsls r0, r0, #2
	strh r0, [r4, #0xa]
	strh r5, [r4, #0xc]
	ldr r0, _080AFDB0 @ =0x0000FFFF
	strh r0, [r4, #0xe]
	ldr r0, _080AFDB4 @ =0x06010000
	str r0, [r4, #0x1c]
	ldr r0, _080AFDB8 @ =0x0200DB68
	str r0, [r4, #0x20]
	adds r0, r4, #0
	bl sub_08054F30
	movs r3, #0x98
	lsls r3, r3, #1
	movs r0, #0x68
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0xd0
	movs r2, #0x68
	bl sub_08055308
	ldr r0, _080AFDBC @ =sub_080AF864
	bl SetOnHBlankA
	add sp, #0x3c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AFD7C: .4byte 0x0200FB68
_080AFD80: .4byte 0x02000040
_080AFD84: .4byte 0x02000078
_080AFD88: .4byte 0x02002078
_080AFD8C: .4byte 0x02007878
_080AFD90: .4byte 0x02007918
_080AFD94: .4byte 0x0200A318
_080AFD98: .4byte 0x02023460
_080AFD9C: .4byte 0x0200A340
_080AFDA0: .4byte 0x0200C340
_080AFDA4: .4byte 0x0200CB40
_080AFDA8: .4byte sub_080AF8C4
_080AFDAC: .4byte 0x0200DB40
_080AFDB0: .4byte 0x0000FFFF
_080AFDB4: .4byte 0x06010000
_080AFDB8: .4byte 0x0200DB68
_080AFDBC: .4byte sub_080AF864

	thumb_func_start sub_080AFDC0
sub_080AFDC0: @ 0x080AFDC0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xc8
	lsls r0, r0, #1
	ldrh r1, [r4, #0x2c]
	cmp r1, r0
	bne _080AFDF0
	bl sub_080AEE74
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AFDE8
	movs r0, #0x3c
	bl FadeBgmOut
	adds r0, r4, #0
	movs r1, #7
	bl Proc_Goto
	b _080AFDF0
_080AFDE8:
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
_080AFDF0:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080AFDFC
sub_080AFDFC: @ 0x080AFDFC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #0x46
	adds r0, r0, r7
	mov sb, r0
	movs r0, #0x50
	ldrh r1, [r7, #0x2a]
	subs r0, r0, r1
	movs r1, #0xe
	bl __divsi3
	adds r0, #1
	mov r2, sb
	ldrb r2, [r2]
	subs r0, r2, r0
	mov r1, sb
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb3
	bhi _080AFE34
	movs r0, #0xb4
	strb r0, [r1]
_080AFE34:
	ldr r2, _080AFEE4 @ =0x03002870
	mov ip, r2
	movs r2, #1
	mov r1, ip
	ldrb r0, [r1, #1]
	orrs r0, r2
	movs r1, #2
	mov r8, r1
	mov r1, r8
	orrs r0, r1
	movs r1, #4
	mov sl, r1
	mov r1, sl
	orrs r0, r1
	movs r5, #8
	orrs r0, r5
	movs r4, #0x10
	orrs r0, r4
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r1, ip
	strb r0, [r1, #1]
	mov r0, ip
	adds r0, #0x2d
	movs r1, #0
	strb r1, [r0]
	ldrh r6, [r7, #0x2a]
	adds r1, r6, #0
	movs r0, #0x50
	subs r0, r0, r1
	mov r3, ip
	adds r3, #0x31
	strb r0, [r3]
	subs r3, #5
	movs r0, #0xf0
	strb r0, [r3]
	adds r1, #0x50
	mov r0, ip
	adds r0, #0x30
	strb r1, [r0]
	adds r0, #4
	ldrb r1, [r0]
	orrs r2, r1
	mov r1, r8
	orrs r2, r1
	mov r1, sl
	orrs r2, r1
	orrs r2, r5
	orrs r2, r4
	strb r2, [r0]
	mov r2, ip
	adds r2, #0x36
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2]
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x50
	bne _080AFEEC
	movs r0, #0xb4
	mov r2, sb
	strb r0, [r2]
	movs r0, #0
	strh r0, [r7, #0x2a]
	adds r0, r7, #0
	bl Proc_Break
	ldr r0, _080AFEE8 @ =sub_080AFDC0
	adds r1, r7, #0
	bl sub_080A92F8
	b _080AFEF0
	.align 2, 0
_080AFEE4: .4byte 0x03002870
_080AFEE8: .4byte sub_080AFDC0
_080AFEEC:
	adds r0, r6, #4
	strh r0, [r7, #0x2a]
_080AFEF0:
	ldr r0, _080AFF28 @ =0x02000040
	adds r4, r7, #0
	adds r4, #0x46
	ldrb r1, [r4]
	movs r2, #0x58
	bl sub_08054E10
	ldr r0, _080AFF2C @ =0x0200DB40
	ldrb r3, [r4]
	adds r1, r3, #0
	subs r1, #0x30
	adds r3, #0x30
	movs r2, #0x68
	str r2, [sp]
	bl sub_08055308
	ldr r0, [r7, #0x3c]
	movs r1, #0x78
	bl sub_080B02A8
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AFF28: .4byte 0x02000040
_080AFF2C: .4byte 0x0200DB40

	thumb_func_start sub_080AFF30
sub_080AFF30: @ 0x080AFF30
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	ldrb r0, [r0]
	cmp r0, #8
	bhi _080AFFB6
	lsls r0, r0, #2
	ldr r1, _080AFF48 @ =_080AFF4C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080AFF48: .4byte _080AFF4C
_080AFF4C: @ jump table
	.4byte _080AFF70 @ case 0
	.4byte _080AFF7A @ case 1
	.4byte _080AFF84 @ case 2
	.4byte _080AFF90 @ case 3
	.4byte _080AFF9C @ case 4
	.4byte _080AFFB6 @ case 5
	.4byte _080AFFAC @ case 6
	.4byte _080AFF90 @ case 7
	.4byte _080AFFB6 @ case 8
_080AFF70:
	adds r0, r4, #0
	movs r1, #0xa
	bl Proc_Goto
	b _080AFFB6
_080AFF7A:
	ldr r0, _080AFF80 @ =0x02000040
	movs r1, #0
	b _080AFFA0
	.align 2, 0
_080AFF80: .4byte 0x02000040
_080AFF84:
	ldr r0, _080AFF8C @ =0x02000040
	movs r1, #1
	b _080AFFA0
	.align 2, 0
_080AFF8C: .4byte 0x02000040
_080AFF90:
	ldr r0, _080AFF98 @ =0x02000040
	bl sub_08054E5C
	b _080AFFB6
	.align 2, 0
_080AFF98: .4byte 0x02000040
_080AFF9C:
	ldr r0, _080AFFA8 @ =0x02000040
	movs r1, #2
_080AFFA0:
	strh r1, [r0, #0xa]
	bl sub_08054C8C
	b _080AFFB6
	.align 2, 0
_080AFFA8: .4byte 0x02000040
_080AFFAC:
	ldr r0, _080AFFC0 @ =0x02000040
	movs r1, #4
	strh r1, [r0, #0xa]
	bl sub_08054C8C
_080AFFB6:
	movs r0, #0
	strh r0, [r4, #0x2a]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AFFC0: .4byte 0x02000040

	thumb_func_start sub_080AFFC4
sub_080AFFC4: @ 0x080AFFC4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #7
	bhi _080B003C
	lsls r0, r0, #2
	ldr r1, _080AFFDC @ =_080AFFE0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080AFFDC: .4byte _080AFFE0
_080AFFE0: @ jump table
	.4byte _080B0000 @ case 0
	.4byte _080B0000 @ case 1
	.4byte _080B0000 @ case 2
	.4byte _080B0000 @ case 3
	.4byte _080B0006 @ case 4
	.4byte _080B0000 @ case 5
	.4byte _080B0000 @ case 6
	.4byte _080B0024 @ case 7
_080B0000:
	ldr r0, [r4, #0x38]
	adds r0, #2
	b _080B001A
_080B0006:
	ldrh r0, [r4, #0x2a]
	adds r0, #1
	strh r0, [r4, #0x2a]
	ldr r1, [r4, #0x38]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r2, [r1, #1]
	cmp r0, r2
	blo _080B003C
	adds r0, r1, #2
_080B001A:
	str r0, [r4, #0x38]
	adds r0, r4, #0
	bl Proc_Break
	b _080B003C
_080B0024:
	ldr r0, _080B0044 @ =0x02000040
	bl sub_08054E3C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B003C
	ldr r0, [r4, #0x38]
	adds r0, #2
	str r0, [r4, #0x38]
	adds r0, r4, #0
	bl Proc_Break
_080B003C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B0044: .4byte 0x02000040

	thumb_func_start sub_080B0048
sub_080B0048: @ 0x080B0048
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl SetOnHBlankA
	bl EndTalk
	bl sub_08064010
	ldr r0, _080B0080 @ =0x0200DB40
	bl sub_080552DC
	bl sub_08063FF4
	ldr r0, _080B0084 @ =0x02000040
	bl sub_08054EF0
	ldr r0, [r4, #0x3c]
	cmp r0, #0
	beq _080B0074
	bl Proc_End
_080B0074:
	movs r0, #2
	bl sub_080AEEA4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B0080: .4byte 0x0200DB40
_080B0084: .4byte 0x02000040

	thumb_func_start sub_080B0088
sub_080B0088: @ 0x080B0088
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _080B00A4 @ =0x08CE5F90
	adds r1, r4, #0
	bl SpawnProc
	str r4, [r0, #0x30]
	str r5, [r0, #0x34]
	movs r1, #0
	str r1, [r0, #0x3c]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B00A4: .4byte 0x08CE5F90

	thumb_func_start sub_080B00A8
sub_080B00A8: @ 0x080B00A8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x14]
	str r0, [r5, #0x30]
	movs r1, #0
	movs r0, #0
	strh r0, [r5, #0x2a]
	adds r2, r5, #0
	adds r2, #0x34
	strb r1, [r2]
	adds r1, r5, #0
	adds r1, #0x35
	movs r0, #0xfa
	strb r0, [r1]
	movs r6, #0
	ldr r0, [r5, #0x30]
	ldr r0, [r0, #0x34]
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0
	beq _080B010C
	adds r4, r2, #0
_080B00D4:
	ldr r0, [r5, #0x30]
	ldr r0, [r0, #0x34]
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	bl sub_080B02E4
	cmp r0, #0
	beq _080B00F2
	ldrb r1, [r0, #5]
	ldrb r2, [r0, #4]
	subs r0, r1, r2
	ldrb r1, [r4]
	adds r0, r1, r0
	b _080B00F6
_080B00F2:
	ldrb r0, [r4]
	adds r0, #4
_080B00F6:
	strb r0, [r4]
	adds r6, #1
	cmp r6, #0xe
	bgt _080B010C
	ldr r0, [r5, #0x30]
	ldr r0, [r0, #0x34]
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0
	bne _080B00D4
_080B010C:
	ldr r0, _080B0128 @ =0x0841FA5C
	ldr r1, _080B012C @ =0x06010000
	bl Decompress
	ldr r0, _080B0130 @ =0x084205A8
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x40
	bl ApplyPaletteExt
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B0128: .4byte 0x0841FA5C
_080B012C: .4byte 0x06010000
_080B0130: .4byte 0x084205A8

	thumb_func_start sub_080B0134
sub_080B0134: @ 0x080B0134
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov sl, r0
	movs r0, #0
	mov sb, r0
_080B0146:
	mov r1, sl
	ldr r0, [r1, #0x30]
	adds r0, #0x40
	add r0, sb
	ldrb r5, [r0]
	cmp r5, #0x1d
	bls _080B0156
	movs r5, #0x1e
_080B0156:
	movs r6, #0
	lsrs r0, r5, #2
	mov r3, sb
	adds r3, #1
	str r3, [sp, #0xc]
	mov r1, sl
	adds r1, #0x34
	str r1, [sp, #4]
	mov r3, sl
	adds r3, #0x35
	str r3, [sp, #8]
	cmp r6, r0
	bge _080B019A
	mov r8, r0
	movs r4, #0x31
	mov r0, sb
	lsls r7, r0, #4
	mov r6, r8
_080B017A:
	ldr r1, _080B01F8 @ =0x08CE6078
	ldr r3, [r1, #0xc]
	movs r0, #0xa0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #0xd
	adds r1, r4, #0
	adds r2, r7, #0
	adds r2, #0xf
	bl sub_08006A34
	adds r4, #8
	subs r6, #1
	cmp r6, #0
	bne _080B017A
	mov r6, r8
_080B019A:
	movs r0, #3
	ands r0, r5
	cmp r0, #0
	beq _080B01C2
	lsls r1, r6, #3
	adds r1, #0x31
	mov r3, sb
	lsls r2, r3, #4
	adds r2, #0xf
	subs r0, #1
	lsls r0, r0, #2
	ldr r3, _080B01F8 @ =0x08CE6078
	adds r0, r0, r3
	ldr r3, [r0]
	movs r0, #0xa0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #0xd
	bl sub_08006A34
_080B01C2:
	ldr r0, [sp, #0xc]
	mov sb, r0
	cmp r0, #5
	ble _080B0146
	ldr r1, [sp, #4]
	ldrb r2, [r1]
	movs r0, #0x78
	subs r0, r0, r2
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldr r3, [sp, #8]
	ldrb r3, [r3]
	adds r6, r3, r0
	adds r0, r6, r2
	cmp r0, #0xe8
	ble _080B01E8
	movs r0, #0xe8
	subs r6, r0, r2
_080B01E8:
	movs r0, #0
	mov sb, r0
	mov r3, sl
	ldr r1, [r3, #0x30]
	ldr r0, [r1, #0x34]
	ldr r0, [r0]
	b _080B0270
	.align 2, 0
_080B01F8: .4byte 0x08CE6078
_080B01FC:
	ldr r0, [r1, #0x34]
	ldr r0, [r0]
	add r0, sb
	ldrb r0, [r0]
	bl sub_080B02E4
	adds r4, r0, #0
	cmp r4, #0
	beq _080B025A
	ldr r3, [r4]
	cmp r3, #0
	beq _080B025C
	movs r1, #4
	ldrsb r1, [r4, r1]
	subs r1, r6, r1
	movs r0, #6
	ldrsb r0, [r4, r0]
	movs r2, #8
	subs r2, r2, r0
	movs r0, #0xa0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #4
	bl sub_08006A34
	movs r1, #4
	ldrsb r1, [r4, r1]
	subs r1, r6, r1
	subs r1, #2
	movs r0, #6
	ldrsb r0, [r4, r0]
	movs r2, #6
	subs r2, r2, r0
	ldr r3, [r4]
	movs r0, #0x80
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #4
	bl sub_08006A34
	movs r0, #5
	ldrsb r0, [r4, r0]
	movs r1, #4
	ldrsb r1, [r4, r1]
	subs r0, r0, r1
	adds r6, r6, r0
	b _080B025C
_080B025A:
	adds r6, #4
_080B025C:
	movs r0, #1
	add sb, r0
	mov r1, sb
	cmp r1, #0xe
	bgt _080B0276
	mov r3, sl
	ldr r1, [r3, #0x30]
	ldr r0, [r1, #0x34]
	ldr r0, [r0]
	add r0, sb
_080B0270:
	ldrb r0, [r0]
	cmp r0, #0
	bne _080B01FC
_080B0276:
	mov r1, sl
	ldrh r0, [r1, #0x2a]
	cmp r0, #0xfe
	bhi _080B0282
	adds r0, #1
	strh r0, [r1, #0x2a]
_080B0282:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080B0294
sub_080B0294: @ 0x080B0294
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B02A4 @ =0x08CE6030
	bl SpawnProc
	pop {r1}
	bx r1
	.align 2, 0
_080B02A4: .4byte 0x08CE6030

	thumb_func_start sub_080B02A8
sub_080B02A8: @ 0x080B02A8
	adds r0, #0x35
	strb r1, [r0]
	bx lr
	.align 2, 0

	thumb_func_start sub_080B02B0
sub_080B02B0: @ 0x080B02B0
	adds r3, r1, #0
	ldr r1, _080B02C8 @ =0x08CE6BDC
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r2, [r0]
	ldr r1, [r2]
	cmp r1, #0
	beq _080B02E0
_080B02C0:
	cmp r3, #0
	bne _080B02CC
	ldr r0, [r1]
	b _080B02E2
	.align 2, 0
_080B02C8: .4byte 0x08CE6BDC
_080B02CC:
	subs r3, #1
	adds r1, #4
	ldr r0, [r1]
	cmp r0, #0
	bne _080B02DA
	adds r2, #4
	ldr r1, [r2]
_080B02DA:
	ldr r0, [r2]
	cmp r0, #0
	bne _080B02C0
_080B02E0:
	movs r0, #0
_080B02E2:
	bx lr

	thumb_func_start sub_080B02E4
sub_080B02E4: @ 0x080B02E4
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	adds r2, r1, #0
	cmp r1, #0x20
	beq _080B0310
	adds r0, r1, #0
	subs r0, #0x61
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x19
	bhi _080B0304
	lsls r0, r1, #3
	ldr r1, _080B0300 @ =0x08CE6A78
	b _080B0318
	.align 2, 0
_080B0300: .4byte 0x08CE6A78
_080B0304:
	adds r0, r1, #0
	subs r0, #0x41
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x19
	bls _080B0314
_080B0310:
	movs r0, #0
	b _080B031A
_080B0314:
	lsls r0, r2, #3
	ldr r1, _080B031C @ =0x08CE6C48
_080B0318:
	adds r0, r0, r1
_080B031A:
	bx lr
	.align 2, 0
_080B031C: .4byte 0x08CE6C48

	thumb_func_start sub_080B0320
sub_080B0320: @ 0x080B0320
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080B0340 @ =0x08CE6F3C
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x61
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	b _080B0344
	.align 2, 0
_080B0340: .4byte 0x08CE6F3C
_080B0344:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_080B034C
sub_080B034C: @ 0x080B034C
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _080B03B0 @ =0x08CE6F30
	ldr r2, [r7, #4]
	adds r1, r2, #0
	adds r2, #0x61
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r7]
	ldr r0, [r0]
	adds r1, r1, r0
	str r1, [r7, #8]
	bl sub_08007F64
	bl sub_080097FC
	ldr r1, [r7, #8]
	adds r0, r1, #0
	bl GetMsg
	adds r2, r0, #0
	ldr r3, [r7, #4]
	movs r0, #8
	movs r1, #2
	bl sub_08007F78
	movs r0, #0
	bl sub_080080F4
	movs r0, #1
	bl SetTalkFlag
	movs r0, #2
	bl SetTalkFlag
	movs r0, #4
	bl SetTalkFlag
	movs r0, #1
	bl sub_08008E28
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B03B0: .4byte 0x08CE6F30

	thumb_func_start sub_080B03B4
sub_080B03B4: @ 0x080B03B4
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r3, [r7, #4]
	ldr r0, [r7]
	movs r1, #0
	movs r2, #0
	bl sub_080B0454
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080B03D4
sub_080B03D4: @ 0x080B03D4
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, [r7, #4]
	ldr r0, [r7]
	movs r2, #0
	movs r3, #0
	bl sub_080B0454
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080B03F4
sub_080B03F4: @ 0x080B03F4
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, [r7, #4]
	ldr r0, [r7]
	movs r2, #1
	movs r3, #0
	bl sub_080B0454
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080B0414
sub_080B0414: @ 0x080B0414
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, [r7, #4]
	ldr r0, [r7]
	movs r2, #2
	movs r3, #0
	bl sub_080B0454
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080B0434
sub_080B0434: @ 0x080B0434
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, [r7, #4]
	ldr r0, [r7]
	movs r2, #0
	movs r3, #0
	bl sub_080B0454
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080B0454
sub_080B0454: @ 0x080B0454
	push {r7, lr}
	sub sp, #0x1c
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	adds r0, r2, #0
	str r3, [r7, #0xc]
	adds r1, r7, #0
	adds r1, #8
	strb r0, [r1]
	bl sub_08085C7C
	ldr r0, [r7, #0xc]
	cmp r0, #0
	beq _080B0484
	ldr r0, _080B0480 @ =0x08CE6FC0
	ldr r1, [r7, #0xc]
	bl SpawnProcLocking
	str r0, [r7, #0x10]
	b _080B0490
	.align 2, 0
_080B0480: .4byte 0x08CE6FC0
_080B0484:
	ldr r1, _080B04C0 @ =0x08CE6FC0
	adds r0, r1, #0
	movs r1, #3
	bl SpawnProc
	str r0, [r7, #0x10]
_080B0490:
	ldr r0, [r7, #0x10]
	adds r1, r7, #0
	adds r1, #8
	adds r2, r0, #0
	adds r0, #0x61
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, [r7, #0x10]
	ldr r1, [r7]
	str r1, [r0, #0x2c]
	ldr r0, [r7, #4]
	cmp r0, #0
	beq _080B04C4
	ldr r0, [r7, #4]
	str r0, [r7, #0x14]
	b _080B04C8
	.align 2, 0
_080B04C0: .4byte 0x08CE6FC0
_080B04C4:
	ldr r0, _080B04D4 @ =0x08CE6F20
	str r0, [r7, #0x14]
_080B04C8:
	movs r0, #0
	str r0, [r7, #0x18]
_080B04CC:
	ldr r0, [r7, #0x18]
	cmp r0, #0x14
	ble _080B04D8
	b _080B0510
	.align 2, 0
_080B04D4: .4byte 0x08CE6F20
_080B04D8:
	adds r0, r7, #0
	adds r0, #0x14
	ldr r1, [r0]
	ldrh r2, [r1]
	adds r1, #2
	str r1, [r0]
	adds r0, r2, #0
	bl CreateItem
	ldr r1, [r7, #0x10]
	ldr r2, [r7, #0x18]
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r3, r1, #0
	adds r3, #0x30
	adds r1, r3, r2
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, [r7, #0x18]
	adds r1, r0, #1
	str r1, [r7, #0x18]
	b _080B04CC
_080B0510:
	ldr r1, [r7, #0x10]
	adds r0, r1, #0
	bl sub_080B0520
	add sp, #0x1c
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080B0520
sub_080B0520: @ 0x080B0520
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	movs r0, #0
	str r0, [r7, #4]
_080B052C:
	ldr r0, [r7]
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r0, #0x30
	adds r1, r0, r1
	ldrh r0, [r1]
	cmp r0, #0
	bne _080B0540
	b _080B0548
_080B0540:
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _080B052C
_080B0548:
	ldr r1, [r7]
	ldr r2, [r7, #4]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x5a
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r0, [r7]
	ldr r1, [r0, #0x2c]
	adds r0, r1, #0
	bl sub_080176DC
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x5b
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strb r0, [r1]
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080B0588
sub_080B0588: @ 0x080B0588
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	ldr r1, _080B05A8 @ =0x08CE6FC0
	adds r0, r1, #0
	bl Proc_Find
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x60
	ldrb r0, [r1]
	cmp r0, #0
	bne _080B05AC
	b _080B05B2
	.align 2, 0
_080B05A8: .4byte 0x08CE6FC0
_080B05AC:
	ldr r0, [r7]
	bl sub_080B18E8
_080B05B2:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080B05BC
sub_080B05BC: @ 0x080B05BC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	ldr r1, _080B05DC @ =0x08CE6FC0
	adds r0, r1, #0
	bl Proc_Find
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x60
	ldrb r0, [r1]
	cmp r0, #1
	bne _080B05E0
	b _080B05E6
	.align 2, 0
_080B05DC: .4byte 0x08CE6FC0
_080B05E0:
	ldr r0, [r7]
	bl sub_080B1AD8
_080B05E6:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080B05F0
sub_080B05F0: @ 0x080B05F0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080B0600
sub_080B0600: @ 0x080B0600
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x2c]
	cmp r1, #0
	bne _080B061A
	ldr r0, [r7]
	movs r1, #0xd
	bl Proc_Goto
	b _080B0622
_080B061A:
	movs r0, #9
	ldr r1, [r7]
	bl sub_080B034C
_080B0622:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080B062C
sub_080B062C: @ 0x080B062C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl GetTalkResult
	cmp r0, #1
	beq _080B0656
	cmp r0, #1
	bgt _080B0646
	cmp r0, #0
	beq _080B064C
	b _080B064C
_080B0646:
	cmp r0, #2
	beq _080B0660
	b _080B064C
_080B064C:
	ldr r0, [r7]
	movs r1, #0xc
	bl Proc_Goto
	b _080B0688
_080B0656:
	ldr r0, [r7]
	movs r1, #1
	bl Proc_Goto
	b _080B0688
_080B0660:
	ldr r0, [r7]
	ldr r1, [r0, #0x2c]
	adds r0, r1, #0
	bl sub_080176DC
	cmp r0, #0
	bne _080B0680
	movs r0, #0x1b
	ldr r1, [r7]
	bl sub_080B034C
	ldr r0, [r7]
	movs r1, #7
	bl Proc_Goto
	b _080B0688
_080B0680:
	ldr r0, [r7]
	movs r1, #4
	bl Proc_Goto
_080B0688:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080B0690
sub_080B0690: @ 0x080B0690
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0x12
	ldr r1, [r7]
	bl sub_080B034C
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080B06A8
sub_080B06A8: @ 0x080B06A8
	push {r4, r5, r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, [r7]
	str r0, [r7, #8]
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #6
	bl DivRem
	str r0, [r7, #0xc]
	movs r0, #0
	bl SetTextFont
	bl InitSystemTextFont
	movs r0, #4
	bl EnableBgSync
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	lsls r0, r1, #3
	ldr r2, _080B06FC @ =0x0203EE58
	adds r1, r0, r2
	adds r0, r1, #0
	bl ClearText
	ldr r0, [r7, #8]
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r0, #0x30
	adds r1, r0, r1
	ldrh r0, [r1]
	str r0, [r7, #0x10]
	ldr r0, [r7, #0x10]
	cmp r0, #0
	bne _080B0700
	b _080B0728
	.align 2, 0
_080B06FC: .4byte 0x0203EE58
_080B0700:
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	lsls r0, r1, #3
	ldr r1, _080B0730 @ =0x0203EE58
	adds r0, r0, r1
	ldr r1, [r7, #0x10]
	ldr r3, [r7, #8]
	ldr r2, [r3, #0x2c]
	ldr r3, [r7, #4]
	adds r4, r3, #0
	lsls r3, r4, #1
	movs r4, #0x1f
	ands r3, r4
	lsls r4, r3, #5
	adds r3, r4, #0
	lsls r4, r3, #1
	ldr r5, _080B0734 @ =0x02023C6E
	adds r3, r4, r5
	bl sub_080B1C70
_080B0728:
	add sp, #0x14
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B0730: .4byte 0x0203EE58
_080B0734: .4byte 0x02023C6E

	thumb_func_start sub_080B0738
sub_080B0738: @ 0x080B0738
	push {r4, r5, r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, [r7]
	str r0, [r7, #8]
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #6
	bl DivRem
	str r0, [r7, #0xc]
	movs r0, #0
	bl SetTextFont
	bl InitSystemTextFont
	movs r0, #4
	bl EnableBgSync
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	lsls r0, r1, #3
	ldr r2, _080B078C @ =0x0203EE58
	adds r1, r0, r2
	adds r0, r1, #0
	bl ClearText
	ldr r0, [r7, #8]
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r0, #0x30
	adds r1, r0, r1
	ldrh r0, [r1]
	str r0, [r7, #0x10]
	ldr r0, [r7, #0x10]
	cmp r0, #0
	bne _080B0790
	b _080B07B8
	.align 2, 0
_080B078C: .4byte 0x0203EE58
_080B0790:
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	lsls r0, r1, #3
	ldr r1, _080B07C0 @ =0x0203EE58
	adds r0, r0, r1
	ldr r1, [r7, #0x10]
	ldr r3, [r7, #8]
	ldr r2, [r3, #0x2c]
	ldr r3, [r7, #4]
	adds r4, r3, #0
	lsls r3, r4, #1
	movs r4, #0x1f
	ands r3, r4
	lsls r4, r3, #5
	adds r3, r4, #0
	lsls r4, r3, #1
	ldr r5, _080B07C4 @ =0x02023C6E
	adds r3, r4, r5
	bl sub_080B1CCC
_080B07B8:
	add sp, #0x14
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B07C0: .4byte 0x0203EE58
_080B07C4: .4byte 0x02023C6E

	thumb_func_start sub_080B07C8
sub_080B07C8: @ 0x080B07C8
	push {r4, r7, lr}
	sub sp, #0x10
	add r7, sp, #0xc
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x5a
	ldrb r1, [r2]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r4, r3, #0
	adds r4, #0x5f
	ldrb r3, [r4]
	movs r2, #0x48
	str r2, [sp]
	ldr r2, _080B0804 @ =sub_080B06A8
	str r2, [sp, #4]
	ldr r2, [r7]
	str r2, [sp, #8]
	movs r2, #5
	bl sub_080B22BC
	add sp, #0x10
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B0804: .4byte sub_080B06A8

	thumb_func_start sub_080B0808
sub_080B0808: @ 0x080B0808
	push {r4, r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	adds r0, r7, #4
	movs r1, #0
	strb r1, [r0]
	bl sub_080B23B8
	bl sub_080B2508
	adds r1, r0, #0
	lsls r0, r1, #0x10
	lsrs r2, r0, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5c
	ldrb r0, [r1]
	adds r4, r0, #0
	bl sub_080B24EC
	lsls r2, r4, #0x10
	lsrs r1, r2, #0x10
	lsls r2, r0, #0x10
	lsrs r0, r2, #0x10
	cmp r1, r0
	beq _080B084C
	adds r0, r7, #4
	movs r1, #1
	strb r1, [r0]
_080B084C:
	bl sub_080B24EC
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x5c
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strb r0, [r1]
	bl sub_080B252C
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x5d
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strb r0, [r1]
	ldr r0, [r7]
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x5c
	adds r2, r0, #0
	adds r0, #0x5e
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, [r7]
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x5d
	adds r2, r0, #0
	adds r0, #0x5f
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5c
	ldrb r0, [r1]
	adds r1, r0, #0
	lsls r0, r1, #4
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x5d
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r1, #0
	subs r2, #0x48
	subs r1, r0, r2
	movs r0, #0x38
	bl sub_08049F58
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x62
	ldrb r0, [r1]
	cmp r0, #0
	beq _080B092E
	adds r0, r7, #4
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	beq _080B092E
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5c
	ldrb r0, [r1]
	adds r1, r0, #0
	lsls r0, r1, #4
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x5d
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r1, #0
	subs r2, #0x48
	subs r1, r0, r2
	ldr r0, [r7]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x5c
	ldrb r2, [r3]
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r0, #0x30
	adds r3, r0, r2
	ldrh r2, [r3]
	movs r0, #0x38
	bl sub_0808198C
_080B092E:
	bl sub_080B1F2C
	bl sub_080B25A0
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _080B0940
	b _080B0AA4
_080B0940:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x62
	ldrb r0, [r1]
	cmp r0, #0
	beq _080B0982
	ldr r1, _080B097C @ =0x08B857F8
	ldr r0, [r1]
	ldrh r1, [r0, #8]
	movs r2, #0x81
	lsls r2, r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080B0978
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x62
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	bl sub_08081B44
_080B0978:
	b _080B0AA4
	.align 2, 0
_080B097C: .4byte 0x08B857F8
_080B0980:
	.byte 0x36, 0xE0
_080B0982:
	ldr r1, _080B09EC @ =0x08B857F8
	ldr r0, [r1]
	ldrh r1, [r0, #8]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080B09F0
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x62
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5c
	ldrb r0, [r1]
	adds r1, r0, #0
	lsls r0, r1, #4
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x5d
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r1, #0
	subs r2, #0x48
	subs r1, r0, r2
	ldr r0, [r7]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x5c
	ldrb r2, [r3]
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r0, #0x30
	adds r3, r0, r2
	ldrh r2, [r3]
	movs r0, #0x38
	bl sub_0808198C
	b _080B0AA4
	.align 2, 0
_080B09EC: .4byte 0x08B857F8
_080B09F0:
	ldr r1, [r7]
	ldr r0, [r1, #0x2c]
	ldr r1, [r7]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x5c
	ldrb r2, [r3]
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r1, #0x30
	adds r2, r1, r2
	ldrh r1, [r2]
	bl sub_080B1D40
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x10
	str r0, [r7, #8]
	ldr r1, _080B0A44 @ =0x08B857F8
	ldr r0, [r1]
	ldrh r1, [r0, #8]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080B0A60
	bl GetGold
	ldr r1, [r7, #8]
	cmp r1, r0
	ble _080B0A48
	movs r0, #0x21
	ldr r1, [r7]
	bl sub_080B034C
	ldr r0, [r7]
	movs r1, #1
	bl Proc_Goto
	b _080B0A5E
	.align 2, 0
_080B0A44: .4byte 0x08B857F8
_080B0A48:
	ldr r1, [r7, #8]
	adds r0, r1, #0
	bl sub_08009FE8
	movs r0, #0x24
	ldr r1, [r7]
	bl sub_080B034C
	ldr r0, [r7]
	bl Proc_Break
_080B0A5E:
	b _080B0AA4
_080B0A60:
	ldr r1, _080B0A98 @ =0x08B857F8
	ldr r0, [r1]
	ldrh r1, [r0, #8]
	movs r2, #2
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080B0AA4
	ldr r1, _080B0A9C @ =0x0202BBF8
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _080B0A8E
	ldr r1, _080B0AA0 @ =0x0000038B
	adds r0, r1, #0
	bl sub_080BE594
_080B0A8E:
	ldr r0, [r7]
	movs r1, #7
	bl Proc_Goto
	b _080B0AA4
	.align 2, 0
_080B0A98: .4byte 0x08B857F8
_080B0A9C: .4byte 0x0202BBF8
_080B0AA0: .4byte 0x0000038B
_080B0AA4:
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080B0AAC
sub_080B0AAC: @ 0x080B0AAC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl GetTalkResult
	cmp r0, #1
	beq _080B0ACC
	cmp r0, #1
	bgt _080B0AC6
	cmp r0, #0
	beq _080B0ACE
	b _080B0ACE
_080B0AC6:
	cmp r0, #2
	beq _080B0ACE
	b _080B0ACE
_080B0ACC:
	b _080B0AD8
_080B0ACE:
	ldr r0, [r7]
	movs r1, #1
	bl Proc_Goto
	b _080B0AD8
_080B0AD8:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080B0AE0
sub_080B0AE0: @ 0x080B0AE0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5b
	ldrb r0, [r1]
	cmp r0, #4
	bls _080B0B1C
	bl sub_0802E818
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _080B0B0A
	movs r0, #0x2d
	ldr r1, [r7]
	bl sub_080B034C
	b _080B0B1A
_080B0B0A:
	movs r0, #0x30
	ldr r1, [r7]
	bl sub_080B034C
	ldr r0, [r7]
	movs r1, #0xb
	bl Proc_Goto
_080B0B1A:
	b _080B0B46
_080B0B1C:
	ldr r1, [r7]
	ldr r0, [r1, #0x2c]
	ldr r1, [r7]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x5c
	ldrb r2, [r3]
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r1, #0x30
	adds r2, r1, r2
	ldrh r1, [r2]
	bl sub_08017654
	ldr r0, [r7]
	bl sub_080B2020
	ldr r0, [r7]
	movs r1, #3
	bl Proc_Goto
_080B0B46:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080B0B50
sub_080B0B50: @ 0x080B0B50
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl GetTalkResult
	cmp r0, #1
	beq _080B0B70
	cmp r0, #1
	bgt _080B0B6A
	cmp r0, #0
	beq _080B0B72
	b _080B0B72
_080B0B6A:
	cmp r0, #2
	beq _080B0B72
	b _080B0B72
_080B0B70:
	b _080B0B7C
_080B0B72:
	ldr r0, [r7]
	movs r1, #0xb
	bl Proc_Goto
	b _080B0B7C
_080B0B7C:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080B0B84
sub_080B0B84: @ 0x080B0B84
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl sub_0802E818
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _080B0BA2
	movs r0, #0x36
	ldr r1, [r7]
	bl sub_080B034C
	b _080B0BAA
_080B0BA2:
	movs r0, #0x39
	ldr r1, [r7]
	bl sub_080B034C
_080B0BAA:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080B0BB4
sub_080B0BB4: @ 0x080B0BB4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x5c
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r0, #0x30
	adds r1, r0, r1
	ldrh r2, [r1]
	adds r0, r2, #0
	bl sub_0802E790
	ldr r0, [r7]
	bl sub_080B2020
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080B0BE4
sub_080B0BE4: @ 0x080B0BE4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0x33
	ldr r1, [r7]
	bl sub_080B034C
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080B0BFC
sub_080B0BFC: @ 0x080B0BFC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl sub_0802E770
	cmp r0, #0x63
	bgt _080B0C14
	ldr r0, [r7]
	movs r1, #0xa
	bl Proc_Goto
_080B0C14:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080B0C1C
sub_080B0C1C: @ 0x080B0C1C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0x3c
	ldr r1, [r7]
	bl sub_080B034C
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080B0C34
sub_080B0C34: @ 0x080B0C34
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0x15
	ldr r1, [r7]
	bl sub_080B034C
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080B0C4C
sub_080B0C4C: @ 0x080B0C4C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0x18
	ldr r1, [r7]
	bl sub_080B034C
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080B0C64
sub_080B0C64: @ 0x080B0C64
	push {r7, lr}
	sub sp, #0x10
	add r7, sp, #0xc
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5c
	ldrb r0, [r1]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x5b
	ldrb r1, [r2]
	movs r2, #0x48
	str r2, [sp]
	ldr r2, _080B0C98 @ =sub_080B0738
	str r2, [sp, #4]
	ldr r2, [r7]
	str r2, [sp, #8]
	movs r2, #5
	movs r3, #0
	bl sub_080B22BC
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B0C98: .4byte sub_080B0738

	thumb_func_start sub_080B0C9C
sub_080B0C9C: @ 0x080B0C9C
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	adds r0, r7, #4
	movs r1, #0
	strb r1, [r0]
	bl sub_080B23B8
	bl sub_080B2508
	adds r1, r0, #0
	lsls r0, r1, #0x10
	lsrs r2, r0, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5c
	ldrb r0, [r1]
	adds r4, r0, #0
	bl sub_080B24EC
	lsls r2, r4, #0x10
	lsrs r1, r2, #0x10
	lsls r2, r0, #0x10
	lsrs r0, r2, #0x10
	cmp r1, r0
	beq _080B0CE0
	adds r0, r7, #4
	movs r1, #1
	strb r1, [r0]
_080B0CE0:
	bl sub_080B24EC
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x5c
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strb r0, [r1]
	bl sub_080B252C
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x5d
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strb r0, [r1]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5c
	ldrb r0, [r1]
	adds r1, r0, #0
	lsls r0, r1, #4
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x5d
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r1, #0
	subs r2, #0x48
	subs r1, r0, r2
	movs r0, #0x38
	bl sub_08049F58
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x62
	ldrb r0, [r1]
	cmp r0, #0
	beq _080B0D88
	adds r0, r7, #4
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	beq _080B0D88
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5c
	ldrb r0, [r1]
	adds r1, r0, #0
	lsls r0, r1, #4
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x5d
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r1, #0
	subs r2, #0x48
	subs r1, r0, r2
	ldr r2, [r7]
	ldr r0, [r2, #0x2c]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x5c
	ldrb r2, [r3]
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r0, #0x1e
	adds r3, r0, r2
	ldrh r2, [r3]
	movs r0, #0x38
	bl sub_0808198C
_080B0D88:
	bl sub_080B25A0
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _080B0D96
	b _080B0F14
_080B0D96:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x62
	ldrb r0, [r1]
	cmp r0, #0
	beq _080B0DD6
	ldr r1, _080B0DD0 @ =0x08B857F8
	ldr r0, [r1]
	ldrh r1, [r0, #8]
	movs r2, #0x81
	lsls r2, r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080B0DCE
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x62
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	bl sub_08081B44
_080B0DCE:
	b _080B0F14
	.align 2, 0
_080B0DD0: .4byte 0x08B857F8
_080B0DD4:
	.byte 0x38, 0xE0
_080B0DD6:
	ldr r1, _080B0E44 @ =0x08B857F8
	ldr r0, [r1]
	ldrh r1, [r0, #8]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080B0E48
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x62
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5c
	ldrb r0, [r1]
	adds r1, r0, #0
	lsls r0, r1, #4
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x5d
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r1, #0
	subs r2, #0x48
	subs r1, r0, r2
	ldr r2, [r7]
	ldr r0, [r2, #0x2c]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x5c
	ldrb r2, [r3]
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r0, #0x1e
	adds r3, r0, r2
	ldrh r2, [r3]
	movs r0, #0x38
	bl sub_0808198C
	b _080B0F14
	.align 2, 0
_080B0E44: .4byte 0x08B857F8
_080B0E48:
	ldr r1, _080B0E94 @ =0x08B857F8
	ldr r0, [r1]
	ldrh r1, [r0, #8]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080B0ECE
	ldr r1, [r7]
	ldr r0, [r1, #0x2c]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x5c
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r0, #0x1e
	adds r1, r0, r1
	ldrh r2, [r1]
	adds r0, r2, #0
	bl sub_080B1DB8
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	bne _080B0E98
	movs r0, #0x2a
	ldr r1, [r7]
	bl sub_080B034C
	ldr r0, [r7]
	movs r1, #4
	bl Proc_Goto
	b _080B0ECC
	.align 2, 0
_080B0E94: .4byte 0x08B857F8
_080B0E98:
	ldr r1, [r7]
	ldr r0, [r1, #0x2c]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x5c
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r0, #0x1e
	adds r1, r0, r1
	ldrh r2, [r1]
	adds r0, r2, #0
	bl sub_080B1D90
	lsls r2, r0, #0x10
	lsrs r1, r2, #0x10
	adds r0, r1, #0
	bl sub_08009FE8
	movs r0, #0x24
	ldr r1, [r7]
	bl sub_080B034C
	ldr r0, [r7]
	bl Proc_Break
_080B0ECC:
	b _080B0F14
_080B0ECE:
	ldr r1, _080B0F08 @ =0x08B857F8
	ldr r0, [r1]
	ldrh r1, [r0, #8]
	movs r2, #2
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080B0F14
	ldr r1, _080B0F0C @ =0x0202BBF8
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _080B0EFC
	ldr r1, _080B0F10 @ =0x0000038B
	adds r0, r1, #0
	bl sub_080BE594
_080B0EFC:
	ldr r0, [r7]
	movs r1, #8
	bl Proc_Goto
	b _080B0F14
	.align 2, 0
_080B0F08: .4byte 0x08B857F8
_080B0F0C: .4byte 0x0202BBF8
_080B0F10: .4byte 0x0000038B
_080B0F14:
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080B0F1C
sub_080B0F1C: @ 0x080B0F1C
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	bl GetTalkResult
	cmp r0, #1
	beq _080B0F3C
	cmp r0, #1
	bgt _080B0F36
	cmp r0, #0
	beq _080B0FD2
	b _080B0FD2
_080B0F36:
	cmp r0, #2
	beq _080B0FD2
	b _080B0FD2
_080B0F3C:
	movs r0, #0xb9
	movs r1, #8
	bl sub_08014DE0
	ldr r0, _080B0FC8 @ =0x0203A85C
	ldrb r1, [r0, #0x11]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x14
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x11]
	bl GetGold
	str r0, [r7, #4]
	ldr r1, [r7]
	ldr r0, [r1, #0x2c]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x5c
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r0, #0x1e
	adds r1, r0, r1
	ldrh r2, [r1]
	adds r0, r2, #0
	bl sub_080B1D90
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x10
	ldr r1, [r7, #4]
	adds r0, r1, r0
	str r0, [r7, #4]
	ldr r1, [r7, #4]
	adds r0, r1, #0
	bl SetGold
	ldr r1, [r7]
	ldr r0, [r1, #0x2c]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x5c
	ldrb r1, [r2]
	bl sub_08018D50
	ldr r0, [r7]
	bl sub_080B0520
	ldr r0, [r7]
	bl sub_080B1AD8
	ldr r1, _080B0FCC @ =0x02022E16
	adds r0, r1, #0
	bl sub_080B18B0
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5b
	ldrb r0, [r1]
	cmp r0, #0
	bne _080B0FD0
	ldr r0, [r7]
	movs r1, #7
	bl Proc_Goto
	b _080B0FDC
	.align 2, 0
_080B0FC8: .4byte 0x0203A85C
_080B0FCC: .4byte 0x02022E16
_080B0FD0:
	b _080B0FDC
_080B0FD2:
	ldr r0, [r7]
	movs r1, #4
	bl Proc_Goto
	b _080B0FDC
_080B0FDC:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080B0FE4
sub_080B0FE4: @ 0x080B0FE4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0x1e
	ldr r1, [r7]
	bl sub_080B034C
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080B0FFC
sub_080B0FFC: @ 0x080B0FFC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x5c
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	movs r0, #0xc
	ldr r1, [r7]
	bl sub_080B034C
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080B1024
sub_080B1024: @ 0x080B1024
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0xf
	ldr r1, [r7]
	bl sub_080B034C
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080B103C
sub_080B103C: @ 0x080B103C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x2c]
	cmp r1, #0
	bne _080B1056
	movs r0, #7
	ldr r1, [r7]
	bl sub_080B034C
	b _080B105E
_080B1056:
	movs r0, #0x27
	ldr r1, [r7]
	bl sub_080B034C
_080B105E:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080B1068
sub_080B1068: @ 0x080B1068
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _080B1088 @ =0x08CE7280
	adds r0, r1, #0
	bl Proc_EndEach
	ldr r0, _080B108C @ =0x08C9D00C
	ldr r1, _080B1090 @ =sub_0806DADC
	bl Proc_ForEach
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B1088: .4byte 0x08CE7280
_080B108C: .4byte 0x08C9D00C
_080B1090: .4byte sub_0806DADC

	thumb_func_start sub_080B1094
sub_080B1094: @ 0x080B1094
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #5
	ldr r1, [r7]
	bl sub_080B034C
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080B10AC
sub_080B10AC: @ 0x080B10AC
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	adds r0, r7, #4
	movs r1, #0
	strb r1, [r0]
	bl sub_080B23B8
	bl sub_080B2508
	adds r1, r0, #0
	lsls r0, r1, #0x10
	lsrs r2, r0, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5c
	ldrb r0, [r1]
	adds r4, r0, #0
	bl sub_080B24EC
	lsls r2, r4, #0x10
	lsrs r1, r2, #0x10
	lsls r2, r0, #0x10
	lsrs r0, r2, #0x10
	cmp r1, r0
	beq _080B10F0
	adds r0, r7, #4
	movs r1, #1
	strb r1, [r0]
_080B10F0:
	bl sub_080B24EC
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x5c
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strb r0, [r1]
	bl sub_080B252C
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x5d
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strb r0, [r1]
	ldr r0, [r7]
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x5c
	adds r2, r0, #0
	adds r0, #0x5e
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, [r7]
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x5d
	adds r2, r0, #0
	adds r0, #0x5f
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5c
	ldrb r0, [r1]
	adds r1, r0, #0
	lsls r0, r1, #4
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x5d
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r1, #0
	subs r2, #0x48
	subs r1, r0, r2
	movs r0, #0x38
	bl sub_08049F58
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x62
	ldrb r0, [r1]
	cmp r0, #0
	beq _080B11D2
	adds r0, r7, #4
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	beq _080B11D2
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5c
	ldrb r0, [r1]
	adds r1, r0, #0
	lsls r0, r1, #4
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x5d
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r1, #0
	subs r2, #0x48
	subs r1, r0, r2
	ldr r0, [r7]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x5c
	ldrb r2, [r3]
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r0, #0x30
	adds r3, r0, r2
	ldrh r2, [r3]
	movs r0, #0x38
	bl sub_0808198C
_080B11D2:
	bl sub_080B1F2C
	bl sub_080B25A0
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _080B11E4
	b _080B12D8
_080B11E4:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x62
	ldrb r0, [r1]
	cmp r0, #0
	beq _080B1226
	ldr r1, _080B1220 @ =0x08B857F8
	ldr r0, [r1]
	ldrh r1, [r0, #8]
	movs r2, #0x81
	lsls r2, r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080B121C
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x62
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	bl sub_08081B44
_080B121C:
	b _080B12D8
	.align 2, 0
_080B1220: .4byte 0x08B857F8
_080B1224:
	.byte 0x36, 0xE0
_080B1226:
	ldr r1, _080B1290 @ =0x08B857F8
	ldr r0, [r1]
	ldrh r1, [r0, #8]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080B1294
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x62
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5c
	ldrb r0, [r1]
	adds r1, r0, #0
	lsls r0, r1, #4
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x5d
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r1, #0
	subs r2, #0x48
	subs r1, r0, r2
	ldr r0, [r7]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x5c
	ldrb r2, [r3]
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r0, #0x30
	adds r3, r0, r2
	ldrh r2, [r3]
	movs r0, #0x38
	bl sub_0808198C
	b _080B12D8
	.align 2, 0
_080B1290: .4byte 0x08B857F8
_080B1294:
	ldr r1, _080B12CC @ =0x08B857F8
	ldr r0, [r1]
	ldrh r1, [r0, #8]
	movs r2, #3
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080B12D8
	ldr r1, _080B12D0 @ =0x0202BBF8
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _080B12C2
	ldr r1, _080B12D4 @ =0x0000038B
	adds r0, r1, #0
	bl sub_080BE594
_080B12C2:
	ldr r0, [r7]
	movs r1, #0xc
	bl Proc_Goto
	b _080B12D8
	.align 2, 0
_080B12CC: .4byte 0x08B857F8
_080B12D0: .4byte 0x0202BBF8
_080B12D4: .4byte 0x0000038B
_080B12D8:
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080B12E0
sub_080B12E0: @ 0x080B12E0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080B1310 @ =0x0202BBB8
	ldrb r1, [r0, #4]
	movs r2, #0x10
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _080B1306
	ldr r1, _080B1314 @ =0x08CE6F48
	adds r0, r1, #0
	ldr r1, [r7]
	bl SpawnProcLocking
_080B1306:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B1310: .4byte 0x0202BBB8
_080B1314: .4byte 0x08CE6F48

	thumb_func_start sub_080B1318
sub_080B1318: @ 0x080B1318
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080B1340 @ =0x0202BBB8
	ldrb r1, [r0, #4]
	movs r2, #0x10
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _080B1348
	ldr r1, _080B1344 @ =0x08CE6F80
	adds r0, r1, #0
	ldr r1, [r7]
	bl SpawnProcLocking
	b _080B134C
	.align 2, 0
_080B1340: .4byte 0x0202BBB8
_080B1344: .4byte 0x08CE6F80
_080B1348:
	bl ClearTalk
_080B134C:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080B1354
sub_080B1354: @ 0x080B1354
	push {r4, r7, lr}
	sub sp, #0xc
	add r7, sp, #4
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x61
	ldrb r0, [r1]
	cmp r0, #0
	bne _080B1372
	movs r0, #0x4d
	movs r1, #0
	bl StartBgm
	b _080B137A
_080B1372:
	movs r0, #0x46
	movs r1, #0
	bl StartBgm
_080B137A:
	ldr r0, _080B148C @ =0x08C9D00C
	ldr r1, _080B1490 @ =sub_0806DAB4
	bl Proc_ForEach
	bl sub_080B1E28
	ldr r0, _080B1494 @ =0x03002870
	ldrb r1, [r0, #0xc]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0xc]
	ldr r0, _080B1494 @ =0x03002870
	ldrb r1, [r0, #0x10]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x10]
	ldr r0, _080B1494 @ =0x03002870
	ldrb r1, [r0, #0x14]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x14]
	ldr r0, _080B1494 @ =0x03002870
	ldrb r1, [r0, #0x18]
	movs r2, #3
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x18]
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r1, #0
	movs r1, #2
	movs r2, #0
	bl InitTalk
	bl InitFaces
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x5c
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x5e
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x5f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x5d
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x60
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x62
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	movs r1, #0x90
	lsls r1, r1, #2
	adds r0, r1, #0
	movs r1, #3
	bl sub_080B1F6C
	ldr r0, [r7]
	bl sub_080B0320
	movs r1, #1
	str r1, [sp]
	movs r1, #0x20
	movs r2, #8
	movs r3, #3
	bl sub_08008F18
	ldr r0, _080B1498 @ =0x083F42D0
	ldr r1, _080B149C @ =0x02020140
	bl Decompress
	ldr r0, _080B14A0 @ =0x02023460
	ldr r1, _080B149C @ =0x02020140
	movs r2, #0x80
	lsls r2, r2, #5
	bl TmApplyTsa_t
	movs r0, #0
	str r0, [sp]
	movs r0, #6
	movs r1, #8
	movs r2, #0x14
	movs r3, #0xc
	bl sub_08049CE4
	movs r0, #2
	bl EnableBgSync
	ldr r0, [r7]
	bl sub_080B17A0
	movs r0, #0
	str r0, [r7, #4]
_080B1484:
	ldr r0, [r7, #4]
	cmp r0, #5
	ble _080B14A4
	b _080B14C4
	.align 2, 0
_080B148C: .4byte 0x08C9D00C
_080B1490: .4byte sub_0806DAB4
_080B1494: .4byte 0x03002870
_080B1498: .4byte 0x083F42D0
_080B149C: .4byte 0x02020140
_080B14A0: .4byte 0x02023460
_080B14A4:
	ldr r0, [r7, #4]
	adds r1, r0, #0
	lsls r0, r1, #3
	ldr r2, _080B14C0 @ =0x0203EE58
	adds r1, r0, r2
	adds r0, r1, #0
	movs r1, #0x14
	bl InitText
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _080B1484
	.align 2, 0
_080B14C0: .4byte 0x0203EE58
_080B14C4:
	ldr r0, [r7]
	bl sub_080B19AC
	ldr r0, _080B1780 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0x20
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080B1780 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080B1780 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080B1780 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B1780 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B1780 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B1780 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B1780 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B1780 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x35
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B1780 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x35
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B1780 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x35
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B1780 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x35
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B1780 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x35
	ldrb r1, [r0]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B1780 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B1780 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B1780 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B1780 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B1780 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B1780 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x38
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B1780 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x31
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x48
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B1780 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xf0
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B1780 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x98
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B1780 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x2f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B1780 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x33
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #8
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B1780 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x2e
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xf0
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B1780 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x32
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x38
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B1780 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B1780 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x35
	ldrb r1, [r0]
	movs r2, #0x20
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B1780 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B1780 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0xc0
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B1780 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B1780 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B1780 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #8
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B1784 @ =0x030028AC
	ldr r1, _080B1784 @ =0x030028AC
	ldrh r2, [r1]
	ldr r3, _080B1788 @ =0x0000FFE0
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _080B1784 @ =0x030028AC
	ldr r1, _080B1784 @ =0x030028AC
	ldrh r2, [r1]
	movs r3, #8
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _080B1784 @ =0x030028AC
	ldr r1, _080B1784 @ =0x030028AC
	ldrh r2, [r1]
	ldr r3, _080B178C @ =0x0000E0FF
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _080B1784 @ =0x030028AC
	ldr r1, _080B1784 @ =0x030028AC
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r4, _080B1790 @ =0x08418E44
	movs r0, #3
	bl GetBgChrOffset
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r0, r2
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080B1794 @ =0x02024460
	ldr r1, _080B1798 @ =0x0840FA00
	movs r2, #0xe0
	lsls r2, r2, #8
	bl TmApplyTsa_t
	ldr r0, _080B179C @ =0x0841E398
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #8
	bl EnableBgSync
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B1780: .4byte 0x03002870
_080B1784: .4byte 0x030028AC
_080B1788: .4byte 0x0000FFE0
_080B178C: .4byte 0x0000E0FF
_080B1790: .4byte 0x08418E44
_080B1794: .4byte 0x02024460
_080B1798: .4byte 0x0840FA00
_080B179C: .4byte 0x0841E398

	thumb_func_start sub_080B17A0
sub_080B17A0: @ 0x080B17A0
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, _080B1828 @ =0x083F43AC
	ldr r1, _080B182C @ =0x06014C00
	bl Decompress
	ldr r1, _080B1830 @ =0x08CE7280
	adds r0, r1, #0
	ldr r1, [r7]
	bl SpawnProc
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xac
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #4]
	adds r1, r0, #0
	adds r0, #0x66
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x2c
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #4]
	adds r1, r0, #0
	adds r0, #0x68
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	ldr r3, _080B1834 @ =0x00004260
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _080B1838 @ =0x081D60F0
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r1, _080B183C @ =0x02022E18
	adds r0, r1, #0
	bl sub_080B1844
	ldr r1, _080B1840 @ =0x02022E16
	adds r0, r1, #0
	bl sub_080B18B0
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B1828: .4byte 0x083F43AC
_080B182C: .4byte 0x06014C00
_080B1830: .4byte 0x08CE7280
_080B1834: .4byte 0x00004260
_080B1838: .4byte 0x081D60F0
_080B183C: .4byte 0x02022E18
_080B1840: .4byte 0x02022E16

	thumb_func_start sub_080B1844
sub_080B1844: @ 0x080B1844
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0
	bl SetTextFont
	bl InitSystemTextFont
	ldr r1, _080B1874 @ =0x03001618
	adds r0, r1, #0
	movs r1, #1
	bl InitText
	ldr r0, [r7]
	movs r1, #3
	movs r2, #0x1e
	bl sub_0800615C
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B1874: .4byte 0x03001618

	thumb_func_start sub_080B1878
sub_080B1878: @ 0x080B1878
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
_080B1882:
	ldr r0, [r7, #4]
	cmp r0, #0
	bgt _080B188A
	b _080B18A8
_080B188A:
	ldr r0, [r7]
	movs r1, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r0, #0x40
	movs r1, #0
	strh r1, [r0]
	ldr r0, [r7]
	subs r1, r0, #2
	str r1, [r7]
	ldr r0, [r7, #4]
	subs r1, r0, #1
	str r1, [r7, #4]
	b _080B1882
_080B18A8:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080B18B0
sub_080B18B0: @ 0x080B18B0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0
	bl SetTextFont
	bl InitSystemTextFont
	ldr r0, [r7]
	movs r1, #6
	bl sub_080B1878
	bl GetGold
	adds r2, r0, #0
	ldr r0, [r7]
	movs r1, #2
	bl sub_080061D8
	movs r0, #1
	bl EnableBgSync
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080B18E8
sub_080B18E8: @ 0x080B18E8
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x60
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _080B1938 @ =0x08CE7228
	adds r0, r1, #0
	movs r1, #3
	bl SpawnProc
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	str r1, [r0, #0x54]
	movs r0, #0
	bl SetTextFont
	bl InitSystemTextFont
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5f
	ldrb r0, [r1]
	str r0, [r7, #4]
_080B1926:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5f
	ldrb r0, [r1]
	adds r1, r0, #5
	ldr r0, [r7, #4]
	cmp r0, r1
	blt _080B193C
	b _080B197C
	.align 2, 0
_080B1938: .4byte 0x08CE7228
_080B193C:
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #6
	bl DivRem
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	adds r1, r0, #0
	lsls r0, r1, #3
	ldr r1, _080B1974 @ =0x0203EE58
	adds r0, r0, r1
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #1
	movs r2, #0x1f
	ands r1, r2
	lsls r2, r1, #5
	adds r1, r2, #0
	lsls r2, r1, #1
	ldr r3, _080B1978 @ =0x02023C6E
	adds r1, r2, r3
	bl sub_080055E0
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _080B1926
	.align 2, 0
_080B1974: .4byte 0x0203EE58
_080B1978: .4byte 0x02023C6E
_080B197C:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5f
	ldrb r0, [r1]
	adds r1, r0, #0
	lsls r0, r1, #4
	adds r1, r0, #0
	adds r0, r1, #0
	subs r0, #0x48
	adds r1, r0, #0
	lsls r0, r1, #0x10
	lsrs r2, r0, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	movs r0, #4
	bl EnableBgSync
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080B19AC
sub_080B19AC: @ 0x080B19AC
	push {r4, r5, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	movs r0, #0
	bl SetTextFont
	bl InitSystemTextFont
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5f
	ldrb r0, [r1]
	str r0, [r7, #4]
_080B19C8:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5f
	ldrb r0, [r1]
	adds r1, r0, #5
	ldr r0, [r7, #4]
	cmp r0, r1
	blt _080B19DA
	b _080B1A04
_080B19DA:
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #6
	bl DivRem
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	lsls r0, r1, #3
	ldr r2, _080B1A00 @ =0x0203EE58
	adds r1, r0, r2
	adds r0, r1, #0
	bl ClearText
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _080B19C8
	.align 2, 0
_080B1A00: .4byte 0x0203EE58
_080B1A04:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5f
	ldrb r0, [r1]
	str r0, [r7, #4]
_080B1A0E:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5f
	ldrb r0, [r1]
	adds r1, r0, #5
	ldr r0, [r7, #4]
	cmp r0, r1
	blt _080B1A20
	b _080B1A7C
_080B1A20:
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #6
	bl DivRem
	str r0, [r7, #0xc]
	ldr r0, [r7]
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r0, #0x30
	adds r1, r0, r1
	ldrh r0, [r1]
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	cmp r0, #0
	bne _080B1A44
	b _080B1A7C
_080B1A44:
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	lsls r0, r1, #3
	ldr r1, _080B1A74 @ =0x0203EE58
	adds r0, r0, r1
	ldr r1, [r7, #8]
	ldr r3, [r7]
	ldr r2, [r3, #0x2c]
	ldr r3, [r7, #4]
	adds r4, r3, #0
	lsls r3, r4, #1
	movs r4, #0x1f
	ands r3, r4
	lsls r4, r3, #5
	adds r3, r4, #0
	lsls r4, r3, #1
	ldr r5, _080B1A78 @ =0x02023C6E
	adds r3, r4, r5
	bl sub_080B1C70
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _080B1A0E
	.align 2, 0
_080B1A74: .4byte 0x0203EE58
_080B1A78: .4byte 0x02023C6E
_080B1A7C:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5f
	ldrb r0, [r1]
	adds r1, r0, #0
	lsls r0, r1, #4
	adds r1, r0, #0
	adds r0, r1, #0
	subs r0, #0x48
	adds r1, r0, #0
	lsls r0, r1, #0x10
	lsrs r2, r0, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	movs r0, #4
	bl EnableBgSync
	add sp, #0x10
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080B1AAC
sub_080B1AAC: @ 0x080B1AAC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x54]
	adds r0, r1, #0
	bl sub_080B07C8
	ldr r0, [r7]
	ldr r1, [r0, #0x54]
	adds r0, r1, #0
	bl sub_080B19AC
	ldr r0, [r7]
	bl Proc_Break
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080B1AD8
sub_080B1AD8: @ 0x080B1AD8
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x60
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _080B1B20 @ =0x08CE7238
	adds r0, r1, #0
	movs r1, #3
	bl SpawnProc
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	str r1, [r0, #0x54]
	movs r0, #0
	bl SetTextFont
	bl InitSystemTextFont
	movs r0, #0
	str r0, [r7, #4]
_080B1B18:
	ldr r0, [r7, #4]
	cmp r0, #4
	ble _080B1B24
	b _080B1B64
	.align 2, 0
_080B1B20: .4byte 0x08CE7238
_080B1B24:
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #6
	bl DivRem
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	adds r1, r0, #0
	lsls r0, r1, #3
	ldr r1, _080B1B5C @ =0x0203EE58
	adds r0, r0, r1
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #1
	movs r2, #0x1f
	ands r1, r2
	lsls r2, r1, #5
	adds r1, r2, #0
	lsls r2, r1, #1
	ldr r3, _080B1B60 @ =0x02023C6E
	adds r1, r2, r3
	bl sub_080055E0
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _080B1B18
	.align 2, 0
_080B1B5C: .4byte 0x0203EE58
_080B1B60: .4byte 0x02023C6E
_080B1B64:
	ldr r2, _080B1B7C @ =0x0000FFB8
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	movs r0, #4
	bl EnableBgSync
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B1B7C: .4byte 0x0000FFB8

	thumb_func_start sub_080B1B80
sub_080B1B80: @ 0x080B1B80
	push {r4, r5, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	movs r0, #0
	bl SetTextFont
	bl InitSystemTextFont
	movs r0, #0
	str r0, [r7, #4]
_080B1B96:
	ldr r0, [r7, #4]
	cmp r0, #4
	ble _080B1B9E
	b _080B1BC8
_080B1B9E:
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #6
	bl DivRem
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	lsls r0, r1, #3
	ldr r2, _080B1BC4 @ =0x0203EE58
	adds r1, r0, r2
	adds r0, r1, #0
	bl ClearText
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _080B1B96
	.align 2, 0
_080B1BC4: .4byte 0x0203EE58
_080B1BC8:
	movs r0, #0
	str r0, [r7, #4]
_080B1BCC:
	ldr r0, [r7, #4]
	cmp r0, #4
	ble _080B1BD4
	b _080B1C34
_080B1BD4:
	ldr r1, [r7, #4]
	adds r0, r1, #0
	movs r1, #6
	bl DivRem
	str r0, [r7, #0xc]
	ldr r1, [r7]
	ldr r0, [r1, #0x2c]
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r0, #0x1e
	adds r1, r0, r1
	ldrh r0, [r1]
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	cmp r0, #0
	bne _080B1BFA
	b _080B1C34
_080B1BFA:
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	lsls r0, r1, #3
	ldr r1, _080B1C2C @ =0x0203EE58
	adds r0, r0, r1
	ldr r1, [r7, #8]
	ldr r3, [r7]
	ldr r2, [r3, #0x2c]
	ldr r3, [r7, #4]
	adds r4, r3, #0
	lsls r3, r4, #1
	movs r4, #0x1f
	ands r3, r4
	lsls r4, r3, #5
	adds r3, r4, #0
	lsls r4, r3, #1
	ldr r5, _080B1C30 @ =0x02023C6E
	adds r3, r4, r5
	bl sub_080B1CCC
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _080B1BCC
	.align 2, 0
_080B1C2C: .4byte 0x0203EE58
_080B1C30: .4byte 0x02023C6E
_080B1C34:
	movs r0, #4
	bl EnableBgSync
	add sp, #0x10
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080B1C44
sub_080B1C44: @ 0x080B1C44
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x54]
	adds r0, r1, #0
	bl sub_080B0C64
	ldr r0, [r7]
	ldr r1, [r0, #0x54]
	adds r0, r1, #0
	bl sub_080B1B80
	ldr r0, [r7]
	bl Proc_Break
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080B1C70
sub_080B1C70: @ 0x080B1C70
	push {r4, r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, [r7, #8]
	ldr r1, [r7, #4]
	bl sub_080B1D40
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x10
	str r0, [r7, #0x10]
	ldr r4, [r7, #4]
	ldr r0, [r7, #8]
	ldr r1, [r7, #4]
	bl IsItemDisplayUseable
	lsls r1, r0, #0x18
	asrs r2, r1, #0x18
	ldr r3, [r7, #0xc]
	ldr r0, [r7]
	adds r1, r4, #0
	bl sub_08016470
	ldr r0, [r7, #0xc]
	adds r4, r0, #0
	adds r4, #0x22
	bl GetGold
	ldr r1, [r7, #0x10]
	cmp r0, r1
	blt _080B1CB8
	movs r1, #2
	b _080B1CBA
_080B1CB8:
	movs r1, #1
_080B1CBA:
	ldr r2, [r7, #0x10]
	adds r0, r4, #0
	bl sub_080061D8
	add sp, #0x14
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080B1CCC
sub_080B1CCC: @ 0x080B1CCC
	push {r4, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r4, [r7, #4]
	ldr r0, [r7, #8]
	ldr r1, [r7, #4]
	bl IsItemDisplayUseable
	lsls r1, r0, #0x18
	asrs r2, r1, #0x18
	ldr r3, [r7, #0xc]
	ldr r0, [r7]
	adds r1, r4, #0
	bl sub_08016470
	ldr r1, [r7, #4]
	adds r0, r1, #0
	bl sub_080B1DB8
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _080B1D1E
	ldr r0, [r7, #0xc]
	adds r4, r0, #0
	adds r4, #0x22
	ldr r1, [r7, #4]
	adds r0, r1, #0
	bl sub_080B1D90
	lsls r1, r0, #0x10
	lsrs r2, r1, #0x10
	adds r0, r4, #0
	movs r1, #2
	bl sub_080061D8
	b _080B1D32
_080B1D1E:
	ldr r1, _080B1D3C @ =0x0000127E
	adds r0, r1, #0
	bl GetMsg
	adds r3, r0, #0
	ldr r0, [r7]
	movs r1, #0x5c
	movs r2, #2
	bl Text_InsertDrawString
_080B1D32:
	add sp, #0x10
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B1D3C: .4byte 0x0000127E

	thumb_func_start sub_080B1D40
sub_080B1D40: @ 0x080B1D40
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, [r7, #4]
	adds r0, r1, #0
	bl sub_08017340
	str r0, [r7, #8]
	ldr r0, [r7]
	movs r1, #0x72
	bl sub_080176F8
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _080B1D7A
	ldr r0, [r7, #8]
	asrs r1, r0, #0x1f
	lsrs r2, r1, #0x1f
	adds r1, r0, r2
	asrs r0, r1, #1
	adds r1, r0, #0
	lsls r0, r1, #0x10
	lsrs r1, r0, #0x10
	adds r0, r1, #0
	b _080B1D86
_080B1D78:
	.byte 0x05, 0xE0
_080B1D7A:
	ldr r1, [r7, #8]
	adds r0, r1, #0
	lsls r2, r0, #0x10
	lsrs r1, r2, #0x10
	adds r0, r1, #0
	b _080B1D86
_080B1D86:
	add sp, #0xc
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080B1D90
sub_080B1D90: @ 0x080B1D90
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	bl sub_08017340
	asrs r1, r0, #0x1f
	lsrs r2, r1, #0x1f
	adds r1, r0, r2
	asrs r0, r1, #1
	adds r1, r0, #0
	lsls r0, r1, #0x10
	lsrs r1, r0, #0x10
	adds r0, r1, #0
	b _080B1DB0
_080B1DB0:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_080B1DB8
sub_080B1DB8: @ 0x080B1DB8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	bl GetItemAttributes
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080B1DD2
	movs r0, #0
	b _080B1DE8
_080B1DD2:
	ldr r0, [r7]
	bl sub_080B1D90
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	bne _080B1DE4
	movs r0, #0
	b _080B1DE8
_080B1DE4:
	movs r0, #1
	b _080B1DE8
_080B1DE8:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_080B1DF0
sub_080B1DF0: @ 0x080B1DF0
	push {r4, r5, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r2, #0
	ldrsh r0, [r1, r2]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x66
	movs r3, #0
	ldrsh r1, [r2, r3]
	ldr r2, _080B1E24 @ =0x08CE7248
	ldr r4, [r7]
	adds r3, r4, #0
	adds r4, #0x68
	movs r5, #0
	ldrsh r3, [r4, r5]
	bl PutOamHiRam
	add sp, #4
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B1E24: .4byte 0x08CE7248

	thumb_func_start sub_080B1E28
sub_080B1E28: @ 0x080B1E28
	push {r7, lr}
	mov r7, sp
	ldr r0, _080B1F04 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080B1F04 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080B1F04 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080B1F04 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080B1F04 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080B1F04 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080B1F04 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0xbf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080B1F04 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r1, _080B1F08 @ =0x02022C60
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	ldr r1, _080B1F0C @ =0x02023460
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	ldr r1, _080B1F10 @ =0x02023C60
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	ldr r1, _080B1F14 @ =0x02024460
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	movs r0, #0xf
	bl EnableBgSync
	bl ResetText
	bl LoadUiFrameGraphics
	bl InitIcons
	movs r0, #4
	bl ApplyIconPalettes
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	bl sub_08082528
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B1F04: .4byte 0x03002870
_080B1F08: .4byte 0x02022C60
_080B1F0C: .4byte 0x02023460
_080B1F10: .4byte 0x02023C60
_080B1F14: .4byte 0x02024460

	thumb_func_start sub_080B1F18
sub_080B1F18: @ 0x080B1F18
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl sub_080B1F2C
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080B1F2C
sub_080B1F2C: @ 0x080B1F2C
	push {r7, lr}
	mov r7, sp
	bl sub_080B25D0
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _080B1F4A
	movs r2, #0xc9
	lsls r2, r2, #6
	movs r0, #0x78
	movs r1, #0x40
	movs r3, #1
	bl sub_080B1FB0
_080B1F4A:
	bl sub_080B25F4
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _080B1F64
	movs r2, #0xc9
	lsls r2, r2, #6
	movs r0, #0x78
	movs r1, #0x98
	movs r3, #0
	bl sub_080B1FB0
_080B1F64:
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080B1F6C
sub_080B1F6C: @ 0x080B1F6C
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _080B1FA4 @ =0x0840D150
	ldr r1, [r7]
	lsls r2, r1, #0x16
	lsrs r1, r2, #0x16
	lsls r2, r1, #5
	ldr r3, _080B1FA8 @ =0x06010000
	adds r1, r2, r3
	bl Decompress
	ldr r0, _080B1FAC @ =0x08405B0C
	ldr r2, [r7, #4]
	adds r1, r2, #0
	adds r1, #0x10
	adds r2, r1, #0
	lsls r1, r2, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B1FA4: .4byte 0x0840D150
_080B1FA8: .4byte 0x06010000
_080B1FAC: .4byte 0x08405B0C

	thumb_func_start sub_080B1FB0
sub_080B1FB0: @ 0x080B1FB0
	push {r4, r7, lr}
	sub sp, #0x1c
	add r7, sp, #4
	str r0, [r7]
	str r1, [r7, #4]
	adds r0, r2, #0
	str r3, [r7, #0xc]
	adds r1, r7, #0
	adds r1, #8
	strh r0, [r1]
	bl GetGameTime
	adds r1, r0, #0
	adds r0, r1, #0
	movs r1, #0x28
	bl DivRem
	str r0, [r7, #0x10]
	ldr r1, [r7, #0x10]
	adds r0, r1, #0
	movs r1, #8
	bl Div
	adds r1, r0, #0
	lsls r0, r1, #1
	str r0, [r7, #0x10]
	ldr r0, [r7, #0xc]
	cmp r0, #0
	bne _080B1FF2
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r7, #0x14]
	b _080B1FF6
_080B1FF2:
	movs r0, #0
	str r0, [r7, #0x14]
_080B1FF6:
	ldr r0, [r7]
	ldr r2, [r7, #0x14]
	adds r1, r0, #0
	orrs r1, r2
	ldr r2, [r7, #4]
	ldr r3, _080B201C @ =0x08B905E8
	adds r0, r7, #0
	adds r0, #8
	ldrh r4, [r0]
	ldr r0, [r7, #0x10]
	adds r4, r4, r0
	str r4, [sp]
	movs r0, #2
	bl sub_08006A34
	add sp, #0x1c
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B201C: .4byte 0x08B905E8

	thumb_func_start sub_080B2020
sub_080B2020: @ 0x080B2020
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	movs r0, #0xb9
	movs r1, #8
	bl sub_08014DE0
	ldr r0, _080B2094 @ =0x0203A85C
	ldrb r1, [r0, #0x11]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x14
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x11]
	bl GetGold
	str r0, [r7, #4]
	ldr r1, [r7]
	ldr r0, [r1, #0x2c]
	ldr r1, [r7]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x5c
	ldrb r2, [r3]
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r1, #0x30
	adds r2, r1, r2
	ldrh r1, [r2]
	bl sub_080B1D40
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x10
	ldr r1, [r7, #4]
	subs r0, r1, r0
	str r0, [r7, #4]
	ldr r1, [r7, #4]
	adds r0, r1, #0
	bl SetGold
	ldr r0, [r7]
	bl sub_080B0520
	ldr r0, [r7]
	bl sub_080B19AC
	ldr r1, _080B2098 @ =0x02022E16
	adds r0, r1, #0
	bl sub_080B18B0
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B2094: .4byte 0x0203A85C
_080B2098: .4byte 0x02022E16

	thumb_func_start sub_080B209C
sub_080B209C: @ 0x080B209C
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	adds r0, r2, #0
	adds r1, r7, #0
	adds r1, #8
	strb r0, [r1]
	ldr r0, [r7]
	cmp r0, #0
	bge _080B20B8
	movs r0, #0
	str r0, [r7]
_080B20B8:
	ldr r0, [r7]
	ldr r1, [r7, #4]
	cmp r0, r1
	blt _080B20C6
	ldr r0, [r7, #4]
	subs r1, r0, #1
	str r1, [r7]
_080B20C6:
	ldr r0, [r7]
	str r0, [r7, #0xc]
	ldr r1, _080B2110 @ =0x08B857F8
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	movs r2, #0x40
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080B211C
	ldr r0, [r7]
	cmp r0, #0
	bne _080B2114
	adds r0, r7, #0
	adds r0, #8
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	beq _080B210E
	ldr r1, _080B2110 @ =0x08B857F8
	ldr r0, [r1]
	ldrh r1, [r0, #8]
	movs r2, #0x40
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080B210E
	ldr r0, [r7, #4]
	subs r1, r0, #1
	str r1, [r7]
_080B210E:
	b _080B211A
	.align 2, 0
_080B2110: .4byte 0x08B857F8
_080B2114:
	ldr r0, [r7]
	subs r1, r0, #1
	str r1, [r7]
_080B211A:
	b _080B216E
_080B211C:
	ldr r1, _080B2164 @ =0x08B857F8
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	movs r2, #0x80
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080B216E
	ldr r1, [r7, #4]
	subs r0, r1, #1
	ldr r1, [r7]
	cmp r1, r0
	bne _080B2168
	adds r0, r7, #0
	adds r0, #8
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	beq _080B2162
	ldr r1, _080B2164 @ =0x08B857F8
	ldr r0, [r1]
	ldrh r1, [r0, #8]
	movs r2, #0x80
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080B2162
	movs r0, #0
	str r0, [r7]
_080B2162:
	b _080B216E
	.align 2, 0
_080B2164: .4byte 0x08B857F8
_080B2168:
	ldr r0, [r7]
	adds r1, r0, #1
	str r1, [r7]
_080B216E:
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	cmp r0, r1
	beq _080B218E
	ldr r1, _080B2194 @ =0x0202BBF8
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _080B218E
	ldr r1, _080B2198 @ =0x00000386
	adds r0, r1, #0
	bl sub_080BE594
_080B218E:
	ldr r1, [r7]
	adds r0, r1, #0
	b _080B219C
	.align 2, 0
_080B2194: .4byte 0x0202BBF8
_080B2198: .4byte 0x00000386
_080B219C:
	add sp, #0x10
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_080B21A4
sub_080B21A4: @ 0x080B21A4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080B21BC @ =0x0203EEA4
	ldr r1, [r7]
	str r1, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B21BC: .4byte 0x0203EEA4

	thumb_func_start sub_080B21C0
sub_080B21C0: @ 0x080B21C0
	push {r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, _080B21E8 @ =0x0203EEA4
	ldr r1, [r0]
	str r1, [r7, #0x10]
	ldr r0, _080B21E8 @ =0x0203EEA4
	ldr r1, [r7]
	str r1, [r0]
	ldr r0, [r7]
	ldr r1, [r7, #0x10]
	cmp r0, r1
	bne _080B21EC
	movs r0, #0
	b _080B2242
	.align 2, 0
_080B21E8: .4byte 0x0203EEA4
_080B21EC:
	ldr r0, [r7, #8]
	ldr r1, [r7, #4]
	cmp r0, r1
	ble _080B21F8
	movs r0, #0
	b _080B2242
_080B21F8:
	ldr r0, [r7]
	ldr r1, [r7, #0x10]
	cmp r0, r1
	bge _080B221C
	ldr r0, [r7, #0xc]
	cmp r0, #0
	bne _080B220A
	movs r0, #0
	b _080B2242
_080B220A:
	ldr r0, [r7]
	ldr r1, [r7, #0xc]
	subs r0, r0, r1
	cmp r0, #0
	bgt _080B221A
	movs r0, #1
	rsbs r0, r0, #0
	b _080B2242
_080B221A:
	b _080B223E
_080B221C:
	ldr r0, [r7, #8]
	ldr r1, [r7, #0xc]
	adds r0, r0, r1
	ldr r1, [r7, #4]
	cmp r0, r1
	bne _080B222C
	movs r0, #0
	b _080B2242
_080B222C:
	ldr r0, [r7]
	ldr r1, [r7, #0xc]
	subs r0, r0, r1
	ldr r2, [r7, #8]
	subs r1, r2, #1
	cmp r0, r1
	blt _080B223E
	movs r0, #1
	b _080B2242
_080B223E:
	movs r0, #0
	b _080B2242
_080B2242:
	add sp, #0x14
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080B224C
sub_080B224C: @ 0x080B224C
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, [r7]
	ldr r1, [r7, #4]
	subs r0, r0, r1
	cmp r0, #0
	blt _080B2270
	ldr r0, [r7]
	ldr r1, [r7, #4]
	subs r0, r0, r1
	ldr r1, [r7, #8]
	cmp r0, r1
	blt _080B227E
	b _080B2284
_080B2270:
	ldr r0, [r7, #4]
	ldr r1, [r7]
	subs r0, r0, r1
	ldr r1, [r7, #8]
	cmp r0, r1
	blt _080B227E
	b _080B2284
_080B227E:
	ldr r1, [r7, #4]
	adds r0, r1, #0
	b _080B22B2
_080B2284:
	ldr r0, [r7, #4]
	ldr r1, [r7]
	subs r0, r0, r1
	cmp r0, #0
	bgt _080B22A4
	ldr r0, [r7]
	ldr r1, [r7, #4]
	ldr r2, [r7]
	subs r1, r1, r2
	cmp r1, #0
	bge _080B22A2
	ldr r1, [r7, #8]
	adds r2, r1, #0
	rsbs r1, r2, #0
	adds r0, r0, r1
_080B22A2:
	b _080B22AA
_080B22A4:
	ldr r1, [r7]
	ldr r2, [r7, #8]
	adds r0, r1, r2
_080B22AA:
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	b _080B22B2
_080B22B2:
	add sp, #0xc
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080B22BC
sub_080B22BC: @ 0x080B22BC
	push {r4, r5, r7, lr}
	sub sp, #8
	mov r7, sp
	adds r5, r0, #0
	adds r4, r1, #0
	adds r1, r2, #0
	adds r0, r3, #0
	adds r2, r7, #0
	adds r3, r5, #0
	strh r3, [r2]
	adds r2, r7, #2
	adds r3, r4, #0
	strh r3, [r2]
	adds r2, r7, #4
	strh r1, [r2]
	adds r1, r7, #6
	strh r0, [r1]
	adds r0, r7, #0
	ldrh r1, [r0]
	adds r0, r1, #0
	bl sub_080B21A4
	ldr r1, _080B23B4 @ =0x08CE7298
	ldr r0, [r1]
	adds r1, r7, #0
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, _080B23B4 @ =0x08CE7298
	ldr r0, [r1]
	adds r1, r7, #2
	ldrh r2, [r0, #2]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #2]
	ldr r1, _080B23B4 @ =0x08CE7298
	ldr r0, [r1]
	adds r1, r7, #4
	ldrh r2, [r0, #4]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #4]
	ldr r1, _080B23B4 @ =0x08CE7298
	ldr r0, [r1]
	adds r1, r7, #6
	ldrh r2, [r0, #6]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #6]
	ldr r1, _080B23B4 @ =0x08CE7298
	ldr r0, [r1]
	ldrh r1, [r0, #8]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #8]
	ldr r1, _080B23B4 @ =0x08CE7298
	ldr r0, [r1]
	ldrh r1, [r0, #0xa]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #4
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0xa]
	ldr r1, _080B23B4 @ =0x08CE7298
	ldr r0, [r1]
	ldr r1, [r7, #0x1c]
	str r1, [r0, #0x14]
	ldr r1, _080B23B4 @ =0x08CE7298
	ldr r0, [r1]
	ldr r1, [r7, #0x20]
	str r1, [r0, #0x18]
	ldr r1, _080B23B4 @ =0x08CE7298
	ldr r0, [r1]
	ldr r1, [r7, #0x18]
	rsbs r2, r1, #0
	str r2, [r0, #0x10]
	ldr r1, _080B23B4 @ =0x08CE7298
	ldr r0, [r1]
	adds r1, r7, #6
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #4
	ldrh r2, [r0, #0xc]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0xc]
	add sp, #8
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B23B4: .4byte 0x08CE7298

	thumb_func_start sub_080B23B8
sub_080B23B8: @ 0x080B23B8
	push {r4, r7, lr}
	mov r7, sp
	ldr r0, _080B2414 @ =0x08CE7298
	ldr r1, [r0]
	ldrh r0, [r1]
	ldr r2, _080B2414 @ =0x08CE7298
	ldr r1, [r2]
	ldrh r2, [r1, #2]
	adds r1, r2, #0
	movs r2, #0
	bl sub_080B209C
	adds r1, r0, #0
	ldr r2, _080B2414 @ =0x08CE7298
	ldr r0, [r2]
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _080B2414 @ =0x08CE7298
	ldr r1, [r0]
	ldrh r0, [r1]
	ldr r1, _080B2414 @ =0x08CE7298
	ldr r2, [r1]
	ldrh r1, [r2, #2]
	ldr r2, _080B2414 @ =0x08CE7298
	ldr r3, [r2]
	ldrh r2, [r3, #4]
	ldr r3, _080B2414 @ =0x08CE7298
	ldr r4, [r3]
	ldrh r3, [r4, #6]
	bl sub_080B21C0
	cmp r0, #0
	beq _080B241E
	cmp r0, #0
	bgt _080B2418
	movs r1, #1
	cmn r0, r1
	beq _080B246C
	b _080B241E
	.align 2, 0
_080B2414: .4byte 0x08CE7298
_080B2418:
	cmp r0, #1
	beq _080B2420
	b _080B241E
_080B241E:
	b _080B24AC
_080B2420:
	ldr r1, _080B2468 @ =0x08CE7298
	ldr r0, [r1]
	ldr r1, _080B2468 @ =0x08CE7298
	ldr r0, [r1]
	ldr r2, _080B2468 @ =0x08CE7298
	ldr r1, [r2]
	ldrh r2, [r1, #6]
	adds r1, r2, #1
	ldrh r2, [r0, #6]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #6]
	ldr r1, _080B2468 @ =0x08CE7298
	ldr r0, [r1]
	ldr r1, _080B2468 @ =0x08CE7298
	ldr r2, [r1]
	ldr r1, [r2, #0x18]
	ldr r2, _080B2468 @ =0x08CE7298
	ldr r3, [r2]
	ldrh r2, [r3, #6]
	ldr r4, _080B2468 @ =0x08CE7298
	ldr r3, [r4]
	ldrh r4, [r3, #4]
	adds r3, r2, r4
	subs r2, r3, #1
	ldr r3, [r0, #0x14]
	adds r0, r1, #0
	adds r1, r2, #0
	bl _call_via_r3
	b _080B24AC
	.align 2, 0
_080B2468: .4byte 0x08CE7298
_080B246C:
	ldr r1, _080B24A8 @ =0x08CE7298
	ldr r0, [r1]
	ldr r1, _080B24A8 @ =0x08CE7298
	ldr r0, [r1]
	ldr r2, _080B24A8 @ =0x08CE7298
	ldr r1, [r2]
	ldrh r2, [r1, #6]
	subs r1, r2, #1
	ldrh r2, [r0, #6]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #6]
	ldr r1, _080B24A8 @ =0x08CE7298
	ldr r0, [r1]
	ldr r1, _080B24A8 @ =0x08CE7298
	ldr r2, [r1]
	ldr r1, [r2, #0x18]
	ldr r2, _080B24A8 @ =0x08CE7298
	ldr r3, [r2]
	ldrh r2, [r3, #6]
	ldr r3, [r0, #0x14]
	adds r0, r1, #0
	adds r1, r2, #0
	bl _call_via_r3
	b _080B24AC
	.align 2, 0
_080B24A8: .4byte 0x08CE7298
_080B24AC:
	ldr r0, _080B24E8 @ =0x08CE7298
	ldr r1, [r0]
	ldrh r0, [r1, #0xc]
	ldr r1, _080B24E8 @ =0x08CE7298
	ldr r2, [r1]
	ldrh r1, [r2, #6]
	ldr r3, _080B24E8 @ =0x08CE7298
	ldr r2, [r3]
	ldrh r3, [r2, #8]
	muls r1, r3, r1
	ldr r2, _080B24E8 @ =0x08CE7298
	ldr r3, [r2]
	ldrh r2, [r3, #0xa]
	bl sub_080B224C
	adds r1, r0, #0
	ldr r2, _080B24E8 @ =0x08CE7298
	ldr r0, [r2]
	ldrh r2, [r0, #0xc]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0xc]
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B24E8: .4byte 0x08CE7298

	thumb_func_start sub_080B24EC
sub_080B24EC: @ 0x080B24EC
	push {r7, lr}
	mov r7, sp
	ldr r1, _080B24FC @ =0x08CE7298
	ldr r0, [r1]
	ldrh r1, [r0]
	adds r0, r1, #0
	b _080B2500
	.align 2, 0
_080B24FC: .4byte 0x08CE7298
_080B2500:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080B2508
sub_080B2508: @ 0x080B2508
	push {r7, lr}
	mov r7, sp
	ldr r1, _080B2520 @ =0x08CE7298
	ldr r0, [r1]
	ldr r2, _080B2520 @ =0x08CE7298
	ldr r1, [r2]
	ldrh r2, [r1, #0xc]
	ldr r0, [r0, #0x10]
	adds r1, r2, r0
	adds r0, r1, #0
	b _080B2524
	.align 2, 0
_080B2520: .4byte 0x08CE7298
_080B2524:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080B252C
sub_080B252C: @ 0x080B252C
	push {r7, lr}
	mov r7, sp
	ldr r1, _080B253C @ =0x08CE7298
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	adds r0, r1, #0
	b _080B2540
	.align 2, 0
_080B253C: .4byte 0x08CE7298
_080B2540:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080B2548
sub_080B2548: @ 0x080B2548
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _080B2570 @ =0x08CE7298
	ldr r0, [r1]
	ldr r2, [r7]
	adds r1, r2, #0
	ldrh r2, [r0, #8]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #8]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B2570: .4byte 0x08CE7298

	thumb_func_start sub_080B2574
sub_080B2574: @ 0x080B2574
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _080B259C @ =0x08CE7298
	ldr r0, [r1]
	ldr r2, [r7]
	adds r1, r2, #0
	ldrh r2, [r0, #0xa]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0xa]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B259C: .4byte 0x08CE7298

	thumb_func_start sub_080B25A0
sub_080B25A0: @ 0x080B25A0
	push {r7, lr}
	mov r7, sp
	ldr r0, _080B25C0 @ =0x08CE7298
	ldr r1, [r0]
	ldrh r0, [r1, #0xc]
	ldr r1, _080B25C0 @ =0x08CE7298
	ldr r2, [r1]
	ldrh r1, [r2, #6]
	ldr r3, _080B25C0 @ =0x08CE7298
	ldr r2, [r3]
	ldrh r3, [r2, #8]
	muls r1, r3, r1
	cmp r0, r1
	beq _080B25C4
	movs r0, #1
	b _080B25C8
	.align 2, 0
_080B25C0: .4byte 0x08CE7298
_080B25C4:
	movs r0, #0
	b _080B25C8
_080B25C8:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080B25D0
sub_080B25D0: @ 0x080B25D0
	push {r7, lr}
	mov r7, sp
	ldr r1, _080B25E4 @ =0x08CE7298
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	cmp r1, #0
	beq _080B25E8
	movs r0, #1
	b _080B25EC
	.align 2, 0
_080B25E4: .4byte 0x08CE7298
_080B25E8:
	movs r0, #0
	b _080B25EC
_080B25EC:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080B25F4
sub_080B25F4: @ 0x080B25F4
	push {r7, lr}
	mov r7, sp
	ldr r0, _080B2614 @ =0x08CE7298
	ldr r1, [r0]
	ldrh r0, [r1, #6]
	ldr r2, _080B2614 @ =0x08CE7298
	ldr r1, [r2]
	ldrh r2, [r1, #4]
	adds r0, r0, r2
	ldr r2, _080B2614 @ =0x08CE7298
	ldr r1, [r2]
	ldrh r2, [r1, #2]
	cmp r0, r2
	bge _080B2618
	movs r0, #1
	b _080B261C
	.align 2, 0
_080B2614: .4byte 0x08CE7298
_080B2618:
	movs r0, #0
	b _080B261C
_080B261C:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080B2624
sub_080B2624: @ 0x080B2624
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, _080B2664 @ =0x0869D668
	ldr r2, _080B2668 @ =0x0869D6E0
	adds r1, r2, #0
	movs r1, #0x8f
	lsls r1, r1, #2
	adds r2, r2, r1
	ldrh r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	str r1, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r0, #4]
	lsls r2, r1, #0x10
	lsrs r0, r2, #0x10
	cmp r0, #0
	bne _080B266E
	ldr r0, [r7, #4]
	ldr r1, [r0, #4]
	lsrs r2, r1, #0x1f
	lsls r0, r2, #0x1f
	cmp r0, #0
	bne _080B266E
	movs r0, #0
	b _080B2672
	.align 2, 0
_080B2664: .4byte 0x0869D668
_080B2668: .4byte 0x0869D6E0
_080B266C:
	.byte 0x01, 0xE0
_080B266E:
	movs r0, #1
	b _080B2672
_080B2672:
	add sp, #8
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080B267C
sub_080B267C: @ 0x080B267C
	push {r7, lr}
	mov r7, sp
	ldr r0, _080B269C @ =0x03004690
	ldr r1, [r0]
	adds r0, r1, #0
	bl ArenaBegin
	ldr r1, _080B26A0 @ =0x08CE729C
	adds r0, r1, #0
	movs r1, #3
	bl SpawnProc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B269C: .4byte 0x03004690
_080B26A0: .4byte 0x08CE729C

	thumb_func_start sub_080B26A4
sub_080B26A4: @ 0x080B26A4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	ldr r1, _080B26C0 @ =0x08CE73FC
	adds r0, r1, #0
	movs r1, #3
	bl SpawnProc
	str r0, [r7]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B26C0: .4byte 0x08CE73FC

	thumb_func_start sub_080B26C4
sub_080B26C4: @ 0x080B26C4
	push {r4, r7, lr}
	sub sp, #8
	add r7, sp, #4
	str r0, [r7]
	ldr r0, _080B2A18 @ =0x08C9D00C
	ldr r1, _080B2A1C @ =sub_0806DAB4
	bl Proc_ForEach
	bl sub_080B1E28
	ldr r0, _080B2A20 @ =0x03002870
	ldrb r1, [r0, #0xc]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0xc]
	ldr r0, _080B2A20 @ =0x03002870
	ldrb r1, [r0, #0x10]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x10]
	ldr r0, _080B2A20 @ =0x03002870
	ldrb r1, [r0, #0x14]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x14]
	ldr r0, _080B2A20 @ =0x03002870
	ldrb r1, [r0, #0x18]
	movs r2, #3
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x18]
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r1, #0
	movs r1, #2
	movs r2, #0
	bl InitTalk
	bl InitFaces
	movs r0, #1
	str r0, [sp]
	movs r0, #0xe2
	movs r1, #0x20
	movs r2, #8
	movs r3, #3
	bl sub_08008F18
	ldr r0, _080B2A24 @ =0x083F42D0
	ldr r1, _080B2A28 @ =0x02020140
	bl Decompress
	ldr r0, _080B2A2C @ =0x02023460
	ldr r1, _080B2A28 @ =0x02020140
	movs r2, #0x80
	lsls r2, r2, #5
	bl TmApplyTsa_t
	ldr r1, _080B2A30 @ =0x02023660
	adds r0, r1, #0
	movs r1, #0x1e
	movs r2, #0xc
	movs r3, #0
	bl TmFillRect_t
	movs r0, #2
	bl EnableBgSync
	ldr r0, [r7]
	bl sub_080B17A0
	ldr r0, _080B2A20 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0x20
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080B2A20 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0x40
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080B2A20 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080B2A20 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B2A20 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B2A20 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B2A20 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B2A20 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B2A20 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x35
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B2A20 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x35
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B2A20 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x35
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B2A20 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x35
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B2A20 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x35
	ldrb r1, [r0]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B2A20 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B2A20 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B2A20 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B2A20 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B2A20 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B2A20 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x58
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B2A20 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x31
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x48
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B2A20 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xf0
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B2A20 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x98
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B2A20 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x2f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B2A20 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x33
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #8
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B2A20 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x2e
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xf0
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B2A20 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x32
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x38
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B2A20 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B2A20 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x35
	ldrb r1, [r0]
	movs r2, #0x20
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B2A20 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B2A20 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0xc0
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B2A20 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B2A20 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B2A20 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #8
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080B2A34 @ =0x030028AC
	ldr r1, _080B2A34 @ =0x030028AC
	ldrh r2, [r1]
	ldr r3, _080B2A38 @ =0x0000FFE0
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _080B2A34 @ =0x030028AC
	ldr r1, _080B2A34 @ =0x030028AC
	ldrh r2, [r1]
	movs r3, #8
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _080B2A34 @ =0x030028AC
	ldr r1, _080B2A34 @ =0x030028AC
	ldrh r2, [r1]
	ldr r3, _080B2A3C @ =0x0000E0FF
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _080B2A34 @ =0x030028AC
	ldr r1, _080B2A34 @ =0x030028AC
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r4, _080B2A40 @ =0x083EFA3C
	movs r0, #3
	bl GetBgChrOffset
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r0, r2
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080B2A44 @ =0x02024460
	ldr r1, _080B2A48 @ =0x083F2618
	movs r2, #0xc0
	lsls r2, r2, #8
	bl TmApplyTsa_t
	ldr r0, _080B2A4C @ =0x083F2ACC
	movs r1, #0xc0
	lsls r1, r1, #1
	movs r2, #0x80
	bl ApplyPaletteExt
	movs r0, #8
	bl EnableBgSync
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B2A18: .4byte 0x08C9D00C
_080B2A1C: .4byte sub_0806DAB4
_080B2A20: .4byte 0x03002870
_080B2A24: .4byte 0x083F42D0
_080B2A28: .4byte 0x02020140
_080B2A2C: .4byte 0x02023460
_080B2A30: .4byte 0x02023660
_080B2A34: .4byte 0x030028AC
_080B2A38: .4byte 0x0000FFE0
_080B2A3C: .4byte 0x0000E0FF
_080B2A40: .4byte 0x083EFA3C
_080B2A44: .4byte 0x02024460
_080B2A48: .4byte 0x083F2618
_080B2A4C: .4byte 0x083F2ACC

	thumb_func_start sub_080B2A50
sub_080B2A50: @ 0x080B2A50
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080B2A7C @ =0x0203A7F4
	ldr r1, [r0]
	ldr r2, _080B2A80 @ =0x0203A3F0
	adds r0, r1, #0
	adds r1, r2, #0
	bl UpdateUnitFromBattle
	ldr r0, _080B2A84 @ =0x03004690
	ldr r1, [r0]
	adds r0, r1, #0
	bl StartMu
	bl SetAutoMuDefaultFacing
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B2A7C: .4byte 0x0203A7F4
_080B2A80: .4byte 0x0203A3F0
_080B2A84: .4byte 0x03004690

	thumb_func_start sub_080B2A88
sub_080B2A88: @ 0x080B2A88
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080B2AAC @ =0x0203A7F4
	ldr r1, [r0]
	ldr r2, [r1, #0xc]
	lsrs r0, r2, #0x11
	movs r1, #7
	ands r0, r1
	cmp r0, #4
	bhi _080B2AB0
	movs r0, #0x3f
	ldr r1, [r7]
	bl sub_080B2DAC
	b _080B2AB8
	.align 2, 0
_080B2AAC: .4byte 0x0203A7F4
_080B2AB0:
	movs r0, #0x40
	ldr r1, [r7]
	bl sub_080B2DAC
_080B2AB8:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080B2AC0
sub_080B2AC0: @ 0x080B2AC0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl ArenaGetMatchupGoldValue
	adds r1, r0, #0
	adds r0, r1, #0
	bl sub_08009FE8
	movs r0, #0x41
	ldr r1, [r7]
	bl sub_080B2DAC
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080B2AE4
sub_080B2AE4: @ 0x080B2AE4
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl GetTalkResult
	cmp r0, #1
	beq _080B2B16
	cmp r0, #1
	bgt _080B2AFE
	cmp r0, #0
	beq _080B2B04
	b _080B2B04
_080B2AFE:
	cmp r0, #2
	beq _080B2B04
	b _080B2B04
_080B2B04:
	movs r0, #0x43
	ldr r1, [r7]
	bl sub_080B2DAC
	ldr r0, [r7]
	movs r1, #2
	bl Proc_Goto
	b _080B2B3A
_080B2B16:
	bl ArenaGetMatchupGoldValue
	adds r4, r0, #0
	bl GetGold
	cmp r4, r0
	bgt _080B2B28
	b _080B2B3A
_080B2B26:
	.byte 0x07, 0xE0
_080B2B28:
	movs r0, #0x49
	ldr r1, [r7]
	bl sub_080B2DAC
	ldr r0, [r7]
	movs r1, #2
	bl Proc_Goto
	b _080B2B3A
_080B2B3A:
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080B2B44
sub_080B2B44: @ 0x080B2B44
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	bl GetGold
	str r0, [r7, #4]
	bl ArenaGetMatchupGoldValue
	ldr r1, [r7, #4]
	subs r0, r1, r0
	str r0, [r7, #4]
	ldr r1, [r7, #4]
	adds r0, r1, #0
	bl SetGold
	ldr r1, _080B2B90 @ =0x0202BBF8
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _080B2B7A
	movs r0, #0xb9
	bl sub_080BE594
_080B2B7A:
	ldr r1, _080B2B94 @ =0x02022E16
	adds r0, r1, #0
	bl sub_080B18B0
	ldr r0, [r7]
	bl sub_080B2DF8
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B2B90: .4byte 0x0202BBF8
_080B2B94: .4byte 0x02022E16

	thumb_func_start sub_080B2B98
sub_080B2B98: @ 0x080B2B98
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0x44
	ldr r1, [r7]
	bl sub_080B2DAC
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080B2BB0
sub_080B2BB0: @ 0x080B2BB0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0x42
	ldr r1, [r7]
	bl sub_080B2DAC
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080B2BC8
sub_080B2BC8: @ 0x080B2BC8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r1, #0
	bl FadeBgmOut
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080B2BE4
sub_080B2BE4: @ 0x080B2BE4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	movs r1, #7
	bl Proc_Mark
	bl ClearTalk
	ldr r1, _080B2C54 @ =0x08CE7280
	adds r0, r1, #0
	bl Proc_EndEach
	ldr r0, _080B2C58 @ =0x0203A85C
	ldrb r1, [r0, #0x11]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x16
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x11]
	ldr r1, _080B2C5C @ =0x03004690
	ldr r0, [r1]
	ldr r2, _080B2C5C @ =0x03004690
	ldr r1, [r2]
	ldr r2, [r1, #0xc]
	movs r1, #0x40
	orrs r2, r1
	str r2, [r0, #0xc]
	ldr r0, _080B2C5C @ =0x03004690
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_0809FD30
	bl EndAllMus
	ldr r0, _080B2C58 @ =0x0203A85C
	ldrb r1, [r0, #0x15]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x15]
	ldr r0, _080B2C5C @ =0x03004690
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_0802A6E0
	bl BeginBattleAnimations
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B2C54: .4byte 0x08CE7280
_080B2C58: .4byte 0x0203A85C
_080B2C5C: .4byte 0x03004690

	thumb_func_start sub_080B2C60
sub_080B2C60: @ 0x080B2C60
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	bl sub_08014BA4
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080B2C78
sub_080B2C78: @ 0x080B2C78
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	bl sub_080B26C4
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080B2C90
sub_080B2C90: @ 0x080B2C90
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	bl GetGold
	str r0, [r7, #4]
	bl ArenaGetResult
	cmp r0, #2
	beq _080B2CE8
	cmp r0, #2
	bgt _080B2CB0
	cmp r0, #1
	beq _080B2CBA
	b _080B2D18
_080B2CB0:
	cmp r0, #3
	beq _080B2CF2
	cmp r0, #4
	beq _080B2D0E
	b _080B2D18
_080B2CBA:
	bl ArenaGetMatchupGoldValue
	adds r1, r0, #0
	lsls r2, r1, #1
	adds r0, r2, #0
	bl sub_08009FE8
	movs r0, #0x45
	ldr r1, [r7]
	bl sub_080B2DAC
	bl ArenaGetMatchupGoldValue
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, [r7, #4]
	adds r0, r1, r0
	str r0, [r7, #4]
	ldr r1, [r7, #4]
	adds r0, r1, #0
	bl SetGold
	b _080B2D18
_080B2CE8:
	movs r0, #0x46
	ldr r1, [r7]
	bl sub_080B2DAC
	b _080B2D18
_080B2CF2:
	movs r0, #0x48
	ldr r1, [r7]
	bl sub_080B2DAC
	bl ArenaGetMatchupGoldValue
	ldr r1, [r7, #4]
	adds r0, r1, r0
	str r0, [r7, #4]
	ldr r1, [r7, #4]
	adds r0, r1, #0
	bl SetGold
	b _080B2D18
_080B2D0E:
	movs r0, #0x47
	ldr r1, [r7]
	bl sub_080B2DAC
	b _080B2D18
_080B2D18:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080B2D20
sub_080B2D20: @ 0x080B2D20
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl ArenaGetResult
	cmp r0, #2
	beq _080B2D74
	cmp r0, #2
	bgt _080B2D3A
	cmp r0, #1
	beq _080B2D44
	b _080B2D78
_080B2D3A:
	cmp r0, #3
	beq _080B2D44
	cmp r0, #4
	beq _080B2D76
	b _080B2D78
_080B2D44:
	ldr r1, _080B2D6C @ =0x02022E16
	adds r0, r1, #0
	bl sub_080B18B0
	ldr r1, _080B2D70 @ =0x0202BBF8
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _080B2D62
	movs r0, #0xb9
	bl sub_080BE594
_080B2D62:
	ldr r0, [r7]
	movs r1, #0x3c
	bl StartTemporaryLock
	b _080B2D78
	.align 2, 0
_080B2D6C: .4byte 0x02022E16
_080B2D70: .4byte 0x0202BBF8
_080B2D74:
	b _080B2D78
_080B2D76:
	b _080B2D78
_080B2D78:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080B2D80
sub_080B2D80: @ 0x080B2D80
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _080B2DA0 @ =0x08CE7280
	adds r0, r1, #0
	bl Proc_EndEach
	ldr r0, _080B2DA4 @ =0x08C9D00C
	ldr r1, _080B2DA8 @ =sub_0806DADC
	bl Proc_ForEach
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B2DA0: .4byte 0x08CE7280
_080B2DA4: .4byte 0x08C9D00C
_080B2DA8: .4byte sub_0806DADC

	thumb_func_start sub_080B2DAC
sub_080B2DAC: @ 0x080B2DAC
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	bl sub_08007F64
	bl sub_080097FC
	ldr r0, [r7]
	bl GetMsg
	adds r2, r0, #0
	ldr r3, [r7, #4]
	movs r0, #8
	movs r1, #2
	bl sub_08007F78
	movs r0, #0
	bl sub_080080F4
	movs r0, #1
	bl SetTalkFlag
	movs r0, #2
	bl SetTalkFlag
	movs r0, #4
	bl SetTalkFlag
	movs r0, #1
	bl sub_08008E28
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080B2DF8
sub_080B2DF8: @ 0x080B2DF8
	push {r4, r7, lr}
	sub sp, #8
	add r7, sp, #4
	str r0, [r7]
	movs r0, #0
	str r0, [sp]
	movs r0, #7
	movs r1, #9
	movs r2, #0x10
	movs r3, #6
	bl sub_08049CE4
	movs r0, #0
	bl SetTextFont
	bl InitSystemTextFont
	ldr r4, _080B2E94 @ =0x02022EF0
	ldr r0, _080B2E98 @ =0x08CC26D4
	ldr r1, [r0]
	adds r0, r1, #0
	bl GetMsg
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl sub_08014698
	ldr r0, _080B2E9C @ =0x02022EF8
	ldr r1, _080B2EA0 @ =0x0203A7F4
	ldr r3, [r1, #4]
	movs r2, #8
	ldrsb r2, [r3, r2]
	movs r1, #2
	bl sub_080061D8
	ldr r4, _080B2EA4 @ =0x02022F70
	ldr r0, _080B2EA0 @ =0x0203A7F4
	ldr r1, [r0, #4]
	ldr r0, [r1]
	ldrh r1, [r0]
	adds r0, r1, #0
	bl GetMsg
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl sub_08014698
	ldr r4, _080B2EA8 @ =0x02022EFE
	ldr r0, _080B2EA0 @ =0x0203A7F4
	ldr r1, [r0, #4]
	ldr r0, [r1, #4]
	ldrh r1, [r0]
	adds r0, r1, #0
	bl GetMsg
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl sub_08014698
	ldr r4, _080B2EAC @ =0x02022F7E
	ldr r0, _080B2EA0 @ =0x0203A7F4
	ldrh r1, [r0, #0x1c]
	adds r0, r1, #0
	bl GetItemName
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl sub_08014698
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B2E94: .4byte 0x02022EF0
_080B2E98: .4byte 0x08CC26D4
_080B2E9C: .4byte 0x02022EF8
_080B2EA0: .4byte 0x0203A7F4
_080B2EA4: .4byte 0x02022F70
_080B2EA8: .4byte 0x02022EFE
_080B2EAC: .4byte 0x02022F7E

	thumb_func_start sub_080B2EB0
sub_080B2EB0: @ 0x080B2EB0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl ArenaGetResult
	cmp r0, #1
	beq _080B2EC2
	b _080B2EE0
_080B2EC2:
	ldr r1, _080B2EDC @ =0x0202BBF8
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1f
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _080B2EDA
	movs r0, #0x2d
	movs r1, #0
	bl StartBgmCore
_080B2EDA:
	b _080B2F04
	.align 2, 0
_080B2EDC: .4byte 0x0202BBF8
_080B2EE0:
	ldr r1, _080B2F00 @ =0x0202BBF8
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1f
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _080B2EF8
	movs r0, #0x47
	movs r1, #0
	bl StartBgmCore
_080B2EF8:
	ldr r0, [r7]
	bl Proc_End
	b _080B2F04
	.align 2, 0
_080B2F00: .4byte 0x0202BBF8
_080B2F04:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080B2F0C
sub_080B2F0C: @ 0x080B2F0C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0x47
	movs r1, #0
	movs r2, #0
	bl StartBgmExt
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080B2F28
sub_080B2F28: @ 0x080B2F28
	push {r7, lr}
	mov r7, sp
	ldr r1, _080B2F3C @ =0x08CE750C
	adds r0, r1, #0
	bl sub_0800AF5C
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B2F3C: .4byte 0x08CE750C

	thumb_func_start sub_080B2F40
sub_080B2F40: @ 0x080B2F40
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl GetTalkResult
	cmp r0, #1
	beq _080B2F60
	cmp r0, #1
	bgt _080B2F5A
	cmp r0, #0
	beq _080B2F68
	b _080B2F68
_080B2F5A:
	cmp r0, #2
	beq _080B2F64
	b _080B2F68
_080B2F60:
	movs r0, #1
	b _080B2F6C
_080B2F64:
	movs r0, #0
	b _080B2F6C
_080B2F68:
	movs r0, #0
	b _080B2F6C
_080B2F6C:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_080B2F74
sub_080B2F74: @ 0x080B2F74
	push {r7, lr}
	mov r7, sp
	ldr r0, _080B2F90 @ =0x0203A85C
	ldrb r1, [r0, #0x16]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x16]
	movs r0, #3
	bl sub_080A1100
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B2F90: .4byte 0x0203A85C

	thumb_func_start sub_080B2F94
sub_080B2F94: @ 0x080B2F94
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0
	bl SetNextGameAction
	ldr r0, [r7]
	bl EventEndBattleMap
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080B2FB0
sub_080B2FB0: @ 0x080B2FB0
	ldr r0, _080B2FBC @ =0x02000000
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bx lr
	.align 2, 0
_080B2FBC: .4byte 0x02000000

	thumb_func_start sub_080B2FC0
sub_080B2FC0: @ 0x080B2FC0
	ldr r1, _080B2FC8 @ =0x02000000
	strb r0, [r1, #2]
	bx lr
	.align 2, 0
_080B2FC8: .4byte 0x02000000

	thumb_func_start sub_080B2FCC
sub_080B2FCC: @ 0x080B2FCC
	push {r4, r5, lr}
	sub sp, #8
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp]
	ldr r4, _080B3024 @ =0x0200000C
	ldr r2, _080B3028 @ =0x01000200
	mov r0, sp
	adds r1, r4, #0
	bl CpuFastSet
	movs r5, #0
	str r5, [sp, #4]
	add r0, sp, #4
	ldr r1, _080B302C @ =0x06001000
	ldr r2, _080B3030 @ =0x01001400
	bl CpuFastSet
	ldr r0, _080B3034 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r4, r1
	strh r5, [r0]
	adds r1, #2
	adds r0, r4, r1
	strh r5, [r0]
	ldr r0, _080B3038 @ =0x00000804
	adds r4, r4, r0
	strh r5, [r4]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #4
	bl EnableBgSync
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B3024: .4byte 0x0200000C
_080B3028: .4byte 0x01000200
_080B302C: .4byte 0x06001000
_080B3030: .4byte 0x01001400
_080B3034: .4byte 0x02023C60
_080B3038: .4byte 0x00000804

	thumb_func_start sub_080B303C
sub_080B303C: @ 0x080B303C
	push {r4, lr}
	ldr r2, _080B3064 @ =0x0200000C
	ldr r4, _080B3068 @ =0x00000802
	adds r3, r2, r4
	ldrh r4, [r3]
	adds r0, r4, r0
	strh r0, [r3]
	ldr r0, _080B306C @ =0x00000804
	adds r2, r2, r0
	ldrh r4, [r2]
	adds r1, r4, r1
	strh r1, [r2]
	ldrh r1, [r3]
	ldrh r2, [r2]
	movs r0, #2
	bl SetBgOffset
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B3064: .4byte 0x0200000C
_080B3068: .4byte 0x00000802
_080B306C: .4byte 0x00000804

	thumb_func_start sub_080B3070
sub_080B3070: @ 0x080B3070
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	adds r7, r1, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sb, r2
	ldr r2, _080B310C @ =0x0200000C
	ldr r1, _080B3110 @ =0x00000802
	adds r0, r2, r1
	movs r3, #0
	ldrsh r0, [r0, r3]
	add r8, r0
	adds r1, #2
	adds r0, r2, r1
	movs r3, #0
	ldrsh r0, [r0, r3]
	adds r7, r7, r0
	mov r0, r8
	asrs r5, r0, #3
	asrs r4, r7, #3
	cmp r5, #0x1f
	bhi _080B3100
	cmp r4, #0x1f
	bhi _080B3100
	lsls r0, r5, #1
	lsls r1, r4, #6
	adds r0, r0, r1
	adds r6, r0, r2
	ldr r0, _080B3114 @ =0x0000FFFF
	ldrh r1, [r6]
	cmp r1, r0
	bne _080B30DC
	movs r3, #0x80
	lsls r3, r3, #4
	adds r2, r2, r3
	ldrh r1, [r2]
	strh r1, [r6]
	ldr r3, _080B3118 @ =0x02023C60
	lsls r0, r4, #5
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r3, _080B311C @ =0x0000A080
	adds r1, r1, r3
	strh r1, [r0]
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	movs r0, #4
	bl EnableBgSync
_080B30DC:
	ldrh r6, [r6]
	lsls r0, r6, #5
	ldr r1, _080B3120 @ =0x06001000
	adds r0, r0, r1
	movs r2, #7
	ands r7, r2
	lsls r1, r7, #2
	adds r1, r1, r0
	movs r0, #0xf
	mov r3, sb
	ands r3, r0
	mov r0, r8
	ands r0, r2
	lsls r0, r0, #2
	lsls r3, r0
	ldr r0, [r1]
	orrs r0, r3
	str r0, [r1]
_080B3100:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B310C: .4byte 0x0200000C
_080B3110: .4byte 0x00000802
_080B3114: .4byte 0x0000FFFF
_080B3118: .4byte 0x02023C60
_080B311C: .4byte 0x0000A080
_080B3120: .4byte 0x06001000

	thumb_func_start sub_080B3124
sub_080B3124: @ 0x080B3124
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	mov sl, r0
	mov sb, r1
	str r2, [sp, #0x10]
	str r3, [sp, #0x14]
	ldr r0, [sp, #0x50]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	cmp sb, r3
	ble _080B3146
	adds r1, r3, #0
_080B3146:
	ldr r0, [sp, #0x44]
	cmp r1, r0
	ble _080B314E
	adds r1, r0, #0
_080B314E:
	ldr r0, [sp, #0x4c]
	cmp r1, r0
	ble _080B3156
	adds r1, r0, #0
_080B3156:
	mov r7, sb
	ldr r0, [sp, #0x14]
	cmp r7, r0
	bge _080B3160
	adds r7, r0, #0
_080B3160:
	ldr r0, [sp, #0x44]
	cmp r7, r0
	bge _080B3168
	adds r7, r0, #0
_080B3168:
	ldr r0, [sp, #0x4c]
	cmp r7, r0
	bge _080B3170
	adds r7, r0, #0
_080B3170:
	mov r8, sl
	ldr r0, [sp, #0x10]
	cmp sl, r0
	ble _080B317A
	mov r8, r0
_080B317A:
	ldr r0, [sp, #0x40]
	cmp r8, r0
	ble _080B3182
	mov r8, r0
_080B3182:
	ldr r0, [sp, #0x48]
	cmp r8, r0
	ble _080B318A
	mov r8, r0
_080B318A:
	mov r6, sl
	ldr r0, [sp, #0x10]
	cmp r6, r0
	bge _080B3194
	adds r6, r0, #0
_080B3194:
	ldr r0, [sp, #0x40]
	cmp r6, r0
	bge _080B319C
	adds r6, r0, #0
_080B319C:
	ldr r0, [sp, #0x48]
	cmp r6, r0
	bge _080B31A4
	adds r6, r0, #0
_080B31A4:
	adds r5, r1, #0
	cmp r5, r7
	bgt _080B321A
_080B31AA:
	mov r4, r8
	adds r0, r5, #1
	str r0, [sp, #0x1c]
	cmp r4, r6
	bgt _080B3214
_080B31B4:
	ldr r0, [sp, #0x10]
	str r0, [sp]
	ldr r0, [sp, #0x14]
	str r0, [sp, #4]
	ldr r0, [sp, #0x40]
	str r0, [sp, #8]
	ldr r0, [sp, #0x44]
	str r0, [sp, #0xc]
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, sl
	mov r3, sb
	bl sub_080AAD18
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B31E2
	adds r0, r4, #0
	adds r1, r5, #0
	ldr r2, [sp, #0x18]
	bl sub_080B3070
	b _080B320E
_080B31E2:
	ldr r0, [sp, #0x40]
	str r0, [sp]
	ldr r0, [sp, #0x44]
	str r0, [sp, #4]
	ldr r0, [sp, #0x48]
	str r0, [sp, #8]
	ldr r0, [sp, #0x4c]
	str r0, [sp, #0xc]
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, sl
	mov r3, sb
	bl sub_080AAD18
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B320E
	adds r0, r4, #0
	adds r1, r5, #0
	ldr r2, [sp, #0x18]
	bl sub_080B3070
_080B320E:
	adds r4, #1
	cmp r4, r6
	ble _080B31B4
_080B3214:
	ldr r5, [sp, #0x1c]
	cmp r5, r7
	ble _080B31AA
_080B321A:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080B322C
sub_080B322C: @ 0x080B322C
	push {r4, r5, lr}
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080B3280 @ =0x02000000
	movs r2, #0
	strb r0, [r1]
	adds r3, r1, #0
	cmp r0, #1
	bne _080B3284
	strh r4, [r3, #8]
	strh r5, [r3, #0xa]
	lsls r0, r4, #0x10
	cmp r0, #0
	bge _080B324E
	strh r2, [r3, #8]
_080B324E:
	movs r1, #8
	ldrsh r0, [r3, r1]
	movs r1, #0xc4
	lsls r1, r1, #2
	cmp r0, r1
	ble _080B325C
	strh r1, [r3, #8]
_080B325C:
	movs r4, #0xa
	ldrsh r0, [r3, r4]
	cmp r0, #0
	bge _080B3266
	strh r2, [r3, #0xa]
_080B3266:
	movs r1, #0xa
	ldrsh r0, [r3, r1]
	movs r1, #0x84
	lsls r1, r1, #2
	cmp r0, r1
	ble _080B3274
	strh r1, [r3, #0xa]
_080B3274:
	ldrh r0, [r3, #8]
	strh r0, [r3, #4]
	ldrh r0, [r3, #0xa]
	strh r0, [r3, #6]
	b _080B328C
	.align 2, 0
_080B3280: .4byte 0x02000000
_080B3284:
	strh r2, [r3, #4]
	strh r2, [r3, #8]
	strh r2, [r3, #6]
	strh r2, [r3, #0xa]
_080B328C:
	ldrb r0, [r3]
	movs r2, #4
	ldrsh r1, [r3, r2]
	movs r4, #6
	ldrsh r2, [r3, r4]
	bl sub_080B5D9C
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_080B32A0
sub_080B32A0: @ 0x080B32A0
	push {lr}
	ldr r2, _080B32C8 @ =0x02000000
	ldrb r0, [r2]
	movs r3, #4
	ldrsh r1, [r2, r3]
	cmp r1, #0
	bge _080B32B0
	adds r1, #7
_080B32B0:
	asrs r1, r1, #3
	movs r3, #6
	ldrsh r2, [r2, r3]
	cmp r2, #0
	bge _080B32BC
	adds r2, #7
_080B32BC:
	asrs r2, r2, #3
	bl sub_080B5E80
	pop {r0}
	bx r0
	.align 2, 0
_080B32C8: .4byte 0x02000000

	thumb_func_start sub_080B32CC
sub_080B32CC: @ 0x080B32CC
	push {r4, r5, lr}
	adds r3, r1, #0
	ldr r2, _080B3334 @ =0x02000000
	ldrb r1, [r2]
	cmp r1, #1
	bne _080B332C
	ldrh r4, [r2, #8]
	adds r1, r4, r0
	movs r4, #0
	strh r1, [r2, #8]
	ldrh r5, [r2, #0xa]
	adds r0, r5, r3
	strh r0, [r2, #0xa]
	lsls r1, r1, #0x10
	cmp r1, #0
	bge _080B32EE
	strh r4, [r2, #8]
_080B32EE:
	movs r1, #8
	ldrsh r0, [r2, r1]
	movs r1, #0xc4
	lsls r1, r1, #2
	cmp r0, r1
	ble _080B32FC
	strh r1, [r2, #8]
_080B32FC:
	movs r3, #0xa
	ldrsh r0, [r2, r3]
	cmp r0, #0
	bge _080B3306
	strh r4, [r2, #0xa]
_080B3306:
	movs r4, #0xa
	ldrsh r0, [r2, r4]
	movs r1, #0x84
	lsls r1, r1, #2
	cmp r0, r1
	ble _080B3314
	strh r1, [r2, #0xa]
_080B3314:
	movs r5, #8
	ldrsh r0, [r2, r5]
	movs r3, #4
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	movs r4, #0xa
	ldrsh r1, [r2, r4]
	movs r5, #6
	ldrsh r2, [r2, r5]
	subs r1, r1, r2
	bl sub_080B303C
_080B332C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B3334: .4byte 0x02000000

	thumb_func_start sub_080B3338
sub_080B3338: @ 0x080B3338
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r0, _080B33B4 @ =0x02000000
	adds r4, r0, #0
	ldrb r0, [r4]
	cmp r0, #1
	bne _080B33AE
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	beq _080B3356
	cmp r1, r0
	beq _080B3356
	strh r2, [r4, #8]
	strh r1, [r4, #0xa]
_080B3356:
	adds r3, r4, #0
	ldr r1, [r3, #8]
	ldr r0, [r3, #4]
	cmp r1, r0
	beq _080B33AE
	movs r1, #4
	ldrsh r0, [r3, r1]
	cmp r0, #0
	bge _080B336A
	adds r0, #7
_080B336A:
	asrs r0, r0, #3
	movs r2, #6
	ldrsh r1, [r3, r2]
	cmp r1, #0
	bge _080B3376
	adds r1, #7
_080B3376:
	asrs r1, r1, #3
	movs r5, #8
	ldrsh r2, [r3, r5]
	cmp r2, #0
	bge _080B3382
	adds r2, #7
_080B3382:
	asrs r2, r2, #3
	movs r5, #0xa
	ldrsh r3, [r3, r5]
	cmp r3, #0
	bge _080B338E
	adds r3, #7
_080B338E:
	asrs r3, r3, #3
	bl sub_080B5BFC
	movs r2, #0xff
	adds r1, r2, #0
	ldrh r0, [r4, #8]
	ands r1, r0
	ldrh r5, [r4, #0xa]
	ands r2, r5
	movs r0, #3
	bl SetBgOffset
	ldrh r0, [r4, #8]
	strh r0, [r4, #4]
	ldrh r0, [r4, #0xa]
	strh r0, [r4, #6]
_080B33AE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B33B4: .4byte 0x02000000

	thumb_func_start sub_080B33B8
sub_080B33B8: @ 0x080B33B8
	ldr r0, _080B33C0 @ =0x02000000
	movs r1, #4
	ldrsh r0, [r0, r1]
	bx lr
	.align 2, 0
_080B33C0: .4byte 0x02000000

	thumb_func_start sub_080B33C4
sub_080B33C4: @ 0x080B33C4
	ldr r0, _080B33CC @ =0x02000000
	movs r1, #6
	ldrsh r0, [r0, r1]
	bx lr
	.align 2, 0
_080B33CC: .4byte 0x02000000

	thumb_func_start sub_080B33D0
sub_080B33D0: @ 0x080B33D0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r0, [sp, #0x38]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0xc]
	cmp r2, #7
	bgt _080B33EE
	b _080B366A
_080B33EE:
	cmp r3, #7
	bgt _080B33F4
	b _080B366A
_080B33F4:
	ldr r5, [sp, #4]
	adds r5, #8
	ldr r0, [sp, #4]
	adds r1, r0, r2
	adds r0, r1, #0
	subs r0, #0x28
	str r1, [sp, #0x14]
	ldr r1, [sp, #8]
	adds r1, r1, r3
	mov sb, r1
	ldr r2, [sp, #8]
	adds r2, #8
	str r2, [sp, #0x10]
	cmp r5, r0
	bge _080B345E
	movs r3, #0xff
	mov r8, r3
	ldr r7, _080B367C @ =0x08B90608
	ldr r0, [sp, #0xc]
	ldr r1, _080B3680 @ =0x00000806
	adds r6, r0, r1
	movs r2, #8
	rsbs r2, r2, #0
	add r2, sb
	mov sl, r2
_080B3426:
	ldr r4, _080B3684 @ =0x000001FF
	ands r4, r5
	str r6, [sp]
	movs r0, #2
	adds r1, r4, #0
	ldr r2, [sp, #8]
	mov r3, r8
	ands r2, r3
	adds r3, r7, #0
	bl sub_08006A34
	movs r0, #0x80
	lsls r0, r0, #6
	adds r4, r4, r0
	str r6, [sp]
	movs r0, #2
	adds r1, r4, #0
	mov r2, sl
	mov r3, r8
	ands r2, r3
	adds r3, r7, #0
	bl sub_08006A34
	adds r5, #0x20
	ldr r0, [sp, #0x14]
	subs r0, #0x28
	cmp r5, r0
	blt _080B3426
_080B345E:
	ldr r0, [sp, #0x14]
	subs r0, #0x18
	cmp r5, r0
	bge _080B34B2
	movs r0, #0xff
	mov r8, r0
	ldr r7, _080B3688 @ =0x08B905E8
	ldr r1, [sp, #0xc]
	ldr r2, _080B3680 @ =0x00000806
	adds r6, r1, r2
	movs r3, #8
	rsbs r3, r3, #0
	add r3, sb
	mov sl, r3
_080B347A:
	ldr r4, _080B3684 @ =0x000001FF
	ands r4, r5
	str r6, [sp]
	movs r0, #2
	adds r1, r4, #0
	ldr r2, [sp, #8]
	mov r3, r8
	ands r2, r3
	adds r3, r7, #0
	bl sub_08006A34
	movs r0, #0x80
	lsls r0, r0, #6
	adds r4, r4, r0
	str r6, [sp]
	movs r0, #2
	adds r1, r4, #0
	mov r2, sl
	mov r3, r8
	ands r2, r3
	adds r3, r7, #0
	bl sub_08006A34
	adds r5, #0x10
	ldr r0, [sp, #0x14]
	subs r0, #0x18
	cmp r5, r0
	blt _080B347A
_080B34B2:
	ldr r0, [sp, #0x14]
	subs r0, #8
	cmp r5, r0
	bge _080B3506
	movs r0, #0xff
	mov r8, r0
	ldr r7, _080B368C @ =0x08B905B0
	ldr r1, [sp, #0xc]
	ldr r2, _080B3680 @ =0x00000806
	adds r6, r1, r2
	movs r3, #8
	rsbs r3, r3, #0
	add r3, sb
	mov sl, r3
_080B34CE:
	ldr r4, _080B3684 @ =0x000001FF
	ands r4, r5
	str r6, [sp]
	movs r0, #2
	adds r1, r4, #0
	ldr r2, [sp, #8]
	mov r3, r8
	ands r2, r3
	adds r3, r7, #0
	bl sub_08006A34
	movs r0, #0x80
	lsls r0, r0, #6
	adds r4, r4, r0
	str r6, [sp]
	movs r0, #2
	adds r1, r4, #0
	mov r2, sl
	mov r3, r8
	ands r2, r3
	adds r3, r7, #0
	bl sub_08006A34
	adds r5, #8
	ldr r0, [sp, #0x14]
	subs r0, #8
	cmp r5, r0
	blt _080B34CE
_080B3506:
	ldr r5, [sp, #0x10]
	mov r0, sb
	subs r0, #0x28
	cmp r5, r0
	bge _080B3556
	ldr r0, _080B3684 @ =0x000001FF
	mov sl, r0
	ldr r1, _080B3690 @ =0x08B90610
	mov r8, r1
	ldr r2, [sp, #0xc]
	ldr r3, _080B3694 @ =0x00000804
	adds r7, r2, r3
	ldr r6, [sp, #0x14]
	subs r6, #8
	ands r6, r0
_080B3524:
	movs r4, #0xff
	ands r4, r5
	str r7, [sp]
	movs r0, #2
	ldr r1, [sp, #4]
	mov r2, sl
	ands r1, r2
	adds r2, r4, #0
	mov r3, r8
	bl sub_08006A34
	str r7, [sp]
	movs r0, #2
	movs r3, #0x80
	lsls r3, r3, #5
	adds r1, r6, r3
	adds r2, r4, #0
	mov r3, r8
	bl sub_08006A34
	adds r5, #0x20
	mov r0, sb
	subs r0, #0x28
	cmp r5, r0
	blt _080B3524
_080B3556:
	mov r0, sb
	subs r0, #0x18
	cmp r5, r0
	bge _080B35A4
	ldr r0, _080B3684 @ =0x000001FF
	mov sl, r0
	ldr r1, _080B3698 @ =0x08B905D0
	mov r8, r1
	ldr r2, [sp, #0xc]
	ldr r3, _080B3694 @ =0x00000804
	adds r7, r2, r3
	ldr r6, [sp, #0x14]
	subs r6, #8
	ands r6, r0
_080B3572:
	movs r4, #0xff
	ands r4, r5
	str r7, [sp]
	movs r0, #2
	ldr r1, [sp, #4]
	mov r2, sl
	ands r1, r2
	adds r2, r4, #0
	mov r3, r8
	bl sub_08006A34
	str r7, [sp]
	movs r0, #2
	movs r3, #0x80
	lsls r3, r3, #5
	adds r1, r6, r3
	adds r2, r4, #0
	mov r3, r8
	bl sub_08006A34
	adds r5, #0x10
	mov r0, sb
	subs r0, #0x18
	cmp r5, r0
	blt _080B3572
_080B35A4:
	mov r0, sb
	subs r0, #8
	cmp r5, r0
	bge _080B35F2
	ldr r0, _080B3684 @ =0x000001FF
	mov sl, r0
	ldr r1, _080B368C @ =0x08B905B0
	mov r8, r1
	ldr r2, [sp, #0xc]
	ldr r3, _080B3694 @ =0x00000804
	adds r7, r2, r3
	ldr r6, [sp, #0x14]
	subs r6, #8
	ands r6, r0
_080B35C0:
	movs r4, #0xff
	ands r4, r5
	str r7, [sp]
	movs r0, #2
	ldr r1, [sp, #4]
	mov r2, sl
	ands r1, r2
	adds r2, r4, #0
	mov r3, r8
	bl sub_08006A34
	str r7, [sp]
	movs r0, #2
	movs r3, #0x80
	lsls r3, r3, #5
	adds r1, r6, r3
	adds r2, r4, #0
	mov r3, r8
	bl sub_08006A34
	adds r5, #8
	mov r0, sb
	subs r0, #8
	cmp r5, r0
	blt _080B35C0
_080B35F2:
	ldr r0, _080B3684 @ =0x000001FF
	mov sl, r0
	mov r6, sl
	ldr r1, [sp, #4]
	ands r6, r1
	movs r4, #0xff
	ldr r2, [sp, #8]
	ands r4, r2
	ldr r7, _080B368C @ =0x08B905B0
	ldr r3, [sp, #0xc]
	ldr r0, _080B369C @ =0x00000805
	adds r3, r3, r0
	mov r8, r3
	str r3, [sp]
	movs r0, #2
	adds r1, r6, #0
	adds r2, r4, #0
	adds r3, r7, #0
	bl sub_08006A34
	ldr r5, [sp, #0x14]
	subs r5, #8
	mov r1, sl
	ands r5, r1
	movs r1, #0x80
	lsls r1, r1, #5
	adds r1, r5, r1
	mov r2, r8
	str r2, [sp]
	movs r0, #2
	adds r2, r4, #0
	adds r3, r7, #0
	bl sub_08006A34
	movs r0, #0x80
	lsls r0, r0, #6
	adds r6, r6, r0
	mov r4, sb
	subs r4, #8
	movs r3, #0xff
	ands r4, r3
	mov r0, r8
	str r0, [sp]
	movs r0, #2
	adds r1, r6, #0
	adds r2, r4, #0
	adds r3, r7, #0
	bl sub_08006A34
	movs r0, #0xc0
	lsls r0, r0, #6
	adds r5, r5, r0
	mov r1, r8
	str r1, [sp]
	movs r0, #2
	adds r1, r5, #0
	adds r2, r4, #0
	adds r3, r7, #0
	bl sub_08006A34
_080B366A:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B367C: .4byte 0x08B90608
_080B3680: .4byte 0x00000806
_080B3684: .4byte 0x000001FF
_080B3688: .4byte 0x08B905E8
_080B368C: .4byte 0x08B905B0
_080B3690: .4byte 0x08B90610
_080B3694: .4byte 0x00000804
_080B3698: .4byte 0x08B905D0
_080B369C: .4byte 0x00000805

	thumb_func_start sub_080B36A0
sub_080B36A0: @ 0x080B36A0
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_080B32A0
	ldr r3, _080B36F0 @ =0x03002870
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
	movs r2, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	ldr r0, _080B36F4 @ =0x0000FFE0
	ldrh r5, [r3, #0x3c]
	ands r0, r5
	movs r1, #4
	orrs r0, r1
	ldr r1, _080B36F8 @ =0x0000E0FF
	ands r0, r1
	movs r5, #0x80
	lsls r5, r5, #4
	adds r1, r5, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	str r2, [r4, #0x2c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B36F0: .4byte 0x03002870
_080B36F4: .4byte 0x0000FFE0
_080B36F8: .4byte 0x0000E0FF

	thumb_func_start sub_080B36FC
sub_080B36FC: @ 0x080B36FC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	bne _080B3714
	ldr r0, [r4, #0x30]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r4, #0x34]
	ldr r2, [r4, #0x38]
	bl sub_080B322C
_080B3714:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080B3720
sub_080B3720: @ 0x080B3720
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r3, r0, #0
	ldr r0, [r3, #0x2c]
	adds r0, #1
	str r0, [r3, #0x2c]
	asrs r4, r0, #2
	ldr r2, _080B37A0 @ =0x03002870
	adds r6, r2, #0
	adds r6, #0x3c
	movs r0, #0x3f
	mov sl, r0
	ldrb r1, [r6]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r6]
	movs r0, #0x10
	subs r0, r0, r4
	movs r1, #0x44
	adds r1, r1, r2
	mov sb, r1
	movs r5, #0
	strb r0, [r1]
	movs r0, #0x45
	adds r0, r0, r2
	mov r8, r0
	strb r4, [r0]
	adds r7, r2, #0
	adds r7, #0x46
	strb r5, [r7]
	cmp r4, #0x10
	bne _080B3792
	adds r0, r3, #0
	bl Proc_Break
	movs r0, #2
	bl sub_08002BE8
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	mov r0, sl
	ldrb r1, [r6]
	ands r0, r1
	strb r0, [r6]
	mov r0, sb
	strb r4, [r0]
	mov r1, r8
	strb r5, [r1]
	strb r5, [r7]
_080B3792:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B37A0: .4byte 0x03002870

	thumb_func_start sub_080B37A4
sub_080B37A4: @ 0x080B37A4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r1, r3, #0
	ldr r0, _080B37C0 @ =0x08CE7568
	bl SpawnProcLocking
	str r4, [r0, #0x34]
	str r5, [r0, #0x38]
	str r6, [r0, #0x30]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B37C0: .4byte 0x08CE7568

	thumb_func_start sub_080B37C4
sub_080B37C4: @ 0x080B37C4
	push {r4, lr}
	ldr r0, _080B3838 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0xa0
	bls _080B37D6
	movs r3, #0
_080B37D6:
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	bne _080B3830
	ldr r1, _080B383C @ =0x02000814
	movs r0, #2
	ldrb r2, [r1]
	ands r0, r2
	adds r4, r1, #0
	cmp r0, #0
	beq _080B3804
	ldr r1, _080B3840 @ =0x0203E668
	cmp r3, #0
	bne _080B37F8
	ldr r0, _080B3844 @ =0x0203E660
	ldr r0, [r0]
	str r0, [r1]
_080B37F8:
	ldr r2, _080B3848 @ =0x04000040
	ldr r1, [r1]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
_080B3804:
	movs r0, #1
	ldrb r4, [r4]
	ands r0, r4
	cmp r0, #0
	beq _080B3830
	ldr r0, _080B384C @ =0x02000815
	ldrb r1, [r0]
	cmp r3, r1
	blo _080B3830
	adds r0, r1, #0
	adds r0, #0x28
	cmp r3, r0
	bge _080B3830
	subs r0, r3, r1
	lsls r0, r0, #1
	ldr r1, _080B3850 @ =0x02022AE0
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r0, _080B3854 @ =0x05000268
	strh r1, [r0]
	subs r0, #0x20
	strh r1, [r0]
_080B3830:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B3838: .4byte 0x04000006
_080B383C: .4byte 0x02000814
_080B3840: .4byte 0x0203E668
_080B3844: .4byte 0x0203E660
_080B3848: .4byte 0x04000040
_080B384C: .4byte 0x02000815
_080B3850: .4byte 0x02022AE0
_080B3854: .4byte 0x05000268

	thumb_func_start sub_080B3858
sub_080B3858: @ 0x080B3858
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r4, r0, #0
	adds r7, r1, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov sl, r3
	movs r2, #0
	cmp r2, r7
	bge _080B3906
	movs r0, #0x1f
	mov r1, sl
	ands r1, r0
	str r1, [sp, #4]
	movs r3, #0
	str r3, [sp, #8]
	mov r8, r4
	ldr r1, [sp]
	mov sb, r1
	mov r3, sb
	ands r3, r0
	mov sb, r3
_080B3892:
	subs r6, r7, r2
	mov r0, sb
	muls r0, r6, r0
	ldr r1, [sp, #8]
	adds r0, r0, r1
	adds r1, r7, #0
	str r2, [sp, #0xc]
	bl __divsi3
	adds r4, r0, #0
	movs r3, #0x1f
	ands r4, r3
	ldr r0, [sp]
	movs r1, #0xf8
	lsls r1, r1, #2
	ands r0, r1
	muls r0, r6, r0
	mov r1, sl
	movs r3, #0xf8
	lsls r3, r3, #2
	ands r1, r3
	ldr r2, [sp, #0xc]
	muls r1, r2, r1
	adds r0, r0, r1
	adds r1, r7, #0
	bl __divsi3
	movs r1, #0xf8
	lsls r1, r1, #2
	ands r0, r1
	adds r4, r4, r0
	movs r5, #0xf8
	lsls r5, r5, #7
	ldr r0, [sp]
	ands r0, r5
	muls r0, r6, r0
	mov r1, sl
	ands r1, r5
	ldr r2, [sp, #0xc]
	muls r1, r2, r1
	adds r0, r0, r1
	adds r1, r7, #0
	bl __divsi3
	ands r0, r5
	adds r4, r4, r0
	mov r3, r8
	strh r4, [r3]
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	adds r0, r0, r1
	str r0, [sp, #8]
	movs r3, #2
	add r8, r3
	ldr r2, [sp, #0xc]
	adds r2, #1
	cmp r2, r7
	blt _080B3892
_080B3906:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080B3918
sub_080B3918: @ 0x080B3918
	adds r2, r0, #0
	adds r0, #0x2b
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	subs r0, #2
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	strh r1, [r2, #0x2e]
	movs r3, #0
	movs r1, #3
	adds r0, #0x1f
_080B3934:
	str r3, [r0]
	subs r0, #8
	subs r1, #1
	cmp r1, #0
	bge _080B3934
	bx lr

	thumb_func_start sub_080B3940
sub_080B3940: @ 0x080B3940
	push {r4, lr}
	adds r2, r0, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r0, #0
	beq _080B39CE
	adds r0, r2, #0
	adds r0, #0x29
	ldrb r3, [r0]
	cmp r3, #0
	beq _080B396C
	adds r0, #1
	ldrb r1, [r0]
	adds r4, r0, #0
	cmp r1, #0
	bne _080B3966
	bl sub_080B3B70
	b _080B39A6
_080B3966:
	subs r0, r1, #1
	strb r0, [r4]
	b _080B39A6
_080B396C:
	adds r1, r2, #0
	adds r1, #0x2c
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1b
	cmp r0, #0x10
	bne _080B3980
	strb r3, [r1]
_080B3980:
	ldrb r1, [r1]
	lsrs r1, r1, #3
	movs r0, #0xf
	ands r0, r1
	cmp r0, #7
	bls _080B3996
	movs r0, #7
	ands r1, r0
	movs r0, #0xa
	subs r0, r0, r1
	b _080B399C
_080B3996:
	movs r0, #7
	ands r1, r0
	adds r0, r1, #2
_080B399C:
	lsls r1, r0, #2
	adds r0, r2, #0
	adds r0, #0x2a
	strb r1, [r0]
	adds r4, r0, #0
_080B39A6:
	ldr r3, _080B39D4 @ =0x03002870
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	ldrb r4, [r4]
	lsrs r1, r4, #2
	adds r0, r3, #0
	adds r0, #0x44
	movs r2, #0
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r2, [r0]
_080B39CE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B39D4: .4byte 0x03002870

	thumb_func_start sub_080B39D8
sub_080B39D8: @ 0x080B39D8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r4, r0, #0
	mov r8, r1
	ldr r0, _080B3ADC @ =0x08CE7630
	bl Proc_Find
	adds r7, r0, #0
	cmp r4, #3
	bhi _080B3ACA
	cmp r7, #0
	beq _080B3ACA
	lsls r4, r4, #3
	mov sl, r4
	adds r0, #0x30
	add r0, sl
	mov sb, r0
	ldr r0, [r0]
	cmp r0, #0
	bne _080B3ACA
	ldr r5, _080B3AE0 @ =0x085E99B4
	mov r0, r8
	lsls r4, r0, #2
	add r4, r8
	lsls r4, r4, #2
	adds r6, r4, r5
	ldr r0, [r6]
	ldr r1, _080B3AE4 @ =0x06010000
	ldrh r2, [r7, #0x2e]
	orrs r1, r2
	bl Decompress
	movs r3, #0xe
	ldrsh r1, [r6, r3]
	ldr r3, _080B3AE8 @ =0x02000000
	movs r2, #4
	ldrsh r0, [r3, r2]
	subs r1, r1, r0
	movs r2, #0x10
	ldrsh r0, [r6, r2]
	mov ip, r0
	movs r2, #6
	ldrsh r0, [r3, r2]
	mov r3, ip
	subs r2, r3, r0
	movs r0, #0x80
	lsls r0, r0, #3
	adds r0, r0, r2
	mov ip, r0
	adds r0, r5, #4
	adds r0, r4, r0
	ldr r0, [r0]
	ldrh r2, [r7, #0x2e]
	lsrs r2, r2, #5
	str r2, [sp, #8]
	movs r3, #0x9c
	lsls r3, r3, #8
	adds r3, r2, r3
	str r3, [sp, #8]
	adds r5, #8
	adds r4, r4, r5
	ldr r4, [r4]
	str r4, [sp]
	movs r4, #0xd
	str r4, [sp, #4]
	mov r2, ip
	bl sub_0801245C
	mov r5, sb
	str r0, [r5]
	mov r1, sl
	adds r0, r7, r1
	ldrh r1, [r7, #0x2e]
	movs r4, #0
	strh r1, [r0, #0x36]
	adds r0, #0x34
	mov r2, r8
	strb r2, [r0]
	ldrh r3, [r7, #0x2e]
	ldrh r6, [r6, #0xc]
	adds r0, r3, r6
	strh r0, [r7, #0x2e]
	adds r3, r7, #0
	adds r3, #0x2b
	ldrb r0, [r3]
	cmp r0, #0
	bne _080B3AAE
	ldr r2, _080B3AEC @ =0x03002870
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r5, [r1]
	ands r0, r5
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	strb r4, [r0]
	adds r1, #9
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x46
	strb r4, [r0]
_080B3AAE:
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	ldr r2, _080B3AF0 @ =0x030028AC
	ldr r0, _080B3AF4 @ =0x0000FFE0
	ldrh r1, [r2]
	ands r0, r1
	ldr r1, _080B3AF8 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0x80
	lsls r3, r3, #4
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
_080B3ACA:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B3ADC: .4byte 0x08CE7630
_080B3AE0: .4byte 0x085E99B4
_080B3AE4: .4byte 0x06010000
_080B3AE8: .4byte 0x02000000
_080B3AEC: .4byte 0x03002870
_080B3AF0: .4byte 0x030028AC
_080B3AF4: .4byte 0x0000FFE0
_080B3AF8: .4byte 0x0000E0FF

	thumb_func_start sub_080B3AFC
sub_080B3AFC: @ 0x080B3AFC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _080B3B44 @ =0x08CE7630
	bl Proc_Find
	adds r4, r0, #0
	cmp r5, #3
	bhi _080B3B66
	cmp r4, #0
	beq _080B3B66
	lsls r6, r5, #3
	adds r0, #0x30
	adds r5, r0, r6
	ldr r0, [r5]
	cmp r0, #0
	beq _080B3B66
	bl sub_080124F8
	movs r0, #0
	str r0, [r5]
	adds r1, r4, #0
	adds r1, #0x2b
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _080B3B48
	movs r1, #0
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	adds r0, #0x2c
	strb r1, [r0]
	b _080B3B66
	.align 2, 0
_080B3B44: .4byte 0x08CE7630
_080B3B48:
	ldrh r3, [r4, #0x2e]
	adds r1, r4, r6
	ldrh r5, [r1, #0x36]
	ldr r2, _080B3B6C @ =0x085E99B4
	adds r1, #0x34
	ldrb r6, [r1]
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r0, [r0, #0xc]
	adds r0, r0, r5
	cmp r3, r0
	bne _080B3B66
	strh r5, [r4, #0x2e]
_080B3B66:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B3B6C: .4byte 0x085E99B4

	thumb_func_start sub_080B3B70
sub_080B3B70: @ 0x080B3B70
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _080B3BE4 @ =0x08CE7630
	bl Proc_Find
	adds r5, r0, #0
	cmp r5, #0
	beq _080B3BD2
	movs r0, #0x2b
	adds r0, r0, r5
	mov sl, r0
	adds r0, r5, #0
	adds r0, #0x2c
	str r0, [sp]
	movs r0, #0x2a
	adds r0, r0, r5
	mov sb, r0
	movs r0, #0x29
	adds r0, r0, r5
	mov r8, r0
	movs r7, #0
	adds r4, r5, #0
	adds r4, #0x30
	movs r6, #3
_080B3BA8:
	ldr r0, [r4]
	cmp r0, #0
	beq _080B3BB4
	bl sub_080124F8
	str r7, [r4]
_080B3BB4:
	adds r4, #8
	subs r6, #1
	cmp r6, #0
	bge _080B3BA8
	movs r1, #0
	movs r0, #0
	strh r0, [r5, #0x2e]
	mov r0, sl
	strb r1, [r0]
	ldr r0, [sp]
	strb r1, [r0]
	mov r0, sb
	strb r1, [r0]
	mov r0, r8
	strb r1, [r0]
_080B3BD2:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B3BE4: .4byte 0x08CE7630

	thumb_func_start sub_080B3BE8
sub_080B3BE8: @ 0x080B3BE8
	push {lr}
	ldr r0, _080B3C00 @ =0x08CE7630
	bl Proc_Find
	cmp r0, #0
	beq _080B3BFC
	adds r1, r0, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
_080B3BFC:
	pop {r0}
	bx r0
	.align 2, 0
_080B3C00: .4byte 0x08CE7630

	thumb_func_start sub_080B3C04
sub_080B3C04: @ 0x080B3C04
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B3C14 @ =0x08CE7630
	bl SpawnProc
	pop {r1}
	bx r1
	.align 2, 0
_080B3C14: .4byte 0x08CE7630

	thumb_func_start sub_080B3C18
sub_080B3C18: @ 0x080B3C18
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _080B3C50 @ =0x08CE7630
	bl Proc_Find
	cmp r0, #0
	beq _080B3C48
	lsls r1, r4, #3
	adds r0, #0x30
	adds r0, r0, r1
	ldr r2, [r0]
	cmp r2, #0
	beq _080B3C48
	ldr r0, _080B3C54 @ =0x02000000
	movs r3, #4
	ldrsh r1, [r0, r3]
	subs r1, r5, r1
	str r1, [r2, #0x54]
	movs r1, #6
	ldrsh r0, [r0, r1]
	subs r0, r6, r0
	str r0, [r2, #0x58]
_080B3C48:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B3C50: .4byte 0x08CE7630
_080B3C54: .4byte 0x02000000

	thumb_func_start sub_080B3C58
sub_080B3C58: @ 0x080B3C58
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r6, _080B3C84 @ =0x44444444
	ldr r5, _080B3C88 @ =0x06014000
	movs r4, #3
_080B3C62:
	str r6, [sp]
	mov r0, sp
	adds r1, r5, #0
	ldr r2, _080B3C8C @ =0x010000D8
	bl CpuFastSet
	movs r0, #0x80
	lsls r0, r0, #3
	adds r5, r5, r0
	subs r4, #1
	cmp r4, #0
	bge _080B3C62
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B3C84: .4byte 0x44444444
_080B3C88: .4byte 0x06014000
_080B3C8C: .4byte 0x010000D8

	thumb_func_start sub_080B3C90
sub_080B3C90: @ 0x080B3C90
	push {r4, lr}
	adds r3, r0, #0
	adds r3, #0x29
	movs r2, #0
	movs r4, #1
	movs r1, #1
	strb r1, [r3]
	adds r0, #0x2a
	strb r2, [r0]
	bl sub_080B3C58
	ldr r0, _080B3CC0 @ =0x02000814
	ldrb r1, [r0]
	eors r4, r1
	strb r4, [r0]
	ldr r0, _080B3CC4 @ =0x02022AE0
	ldr r2, _080B3CC8 @ =0x000044C3
	ldr r3, _080B3CCC @ =0x00007247
	movs r1, #0x28
	bl sub_080B3858
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B3CC0: .4byte 0x02000814
_080B3CC4: .4byte 0x02022AE0
_080B3CC8: .4byte 0x000044C3
_080B3CCC: .4byte 0x00007247

	thumb_func_start sub_080B3CD0
sub_080B3CD0: @ 0x080B3CD0
	push {r4, lr}
	sub sp, #4
	adds r1, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	beq _080B3D10
	movs r4, #0
	adds r0, r1, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne _080B3CEC
	movs r4, #0x70
_080B3CEC:
	ldr r3, _080B3D18 @ =0x08CE75A0
	movs r0, #0xc0
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #2
	movs r1, #0
	adds r2, r4, #0
	bl sub_08006A34
	ldr r3, _080B3D1C @ =0x08CE760E
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #1
	movs r1, #0
	adds r2, r4, #0
	bl sub_08006A34
_080B3D10:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B3D18: .4byte 0x08CE75A0
_080B3D1C: .4byte 0x08CE760E

	thumb_func_start sub_080B3D20
sub_080B3D20: @ 0x080B3D20
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r6, r4, #0
	ldr r0, _080B3D6C @ =0x08CE7650
	bl Proc_Find
	adds r5, r0, #0
	cmp r5, #0
	beq _080B3D64
	bl sub_080B3C58
	cmp r4, #0
	bne _080B3D42
	ldr r1, _080B3D70 @ =0x02000815
	movs r0, #4
	strb r0, [r1]
_080B3D42:
	cmp r4, #1
	bne _080B3D4C
	ldr r1, _080B3D70 @ =0x02000815
	movs r0, #0x74
	strb r0, [r1]
_080B3D4C:
	ldr r1, _080B3D74 @ =0x02000814
	movs r0, #1
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x29
	strb r6, [r0]
	adds r1, r5, #0
	adds r1, #0x2a
	movs r0, #1
	strb r0, [r1]
_080B3D64:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B3D6C: .4byte 0x08CE7650
_080B3D70: .4byte 0x02000815
_080B3D74: .4byte 0x02000814

	thumb_func_start sub_080B3D78
sub_080B3D78: @ 0x080B3D78
	push {lr}
	ldr r0, _080B3D9C @ =0x08CE7650
	bl Proc_Find
	adds r2, r0, #0
	cmp r2, #0
	beq _080B3D98
	ldr r1, _080B3DA0 @ =0x02000814
	movs r0, #1
	ldrb r3, [r1]
	eors r0, r3
	strb r0, [r1]
	adds r1, r2, #0
	adds r1, #0x2a
	movs r0, #0
	strb r0, [r1]
_080B3D98:
	pop {r0}
	bx r0
	.align 2, 0
_080B3D9C: .4byte 0x08CE7650
_080B3DA0: .4byte 0x02000814

	thumb_func_start sub_080B3DA4
sub_080B3DA4: @ 0x080B3DA4
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B3DB4 @ =0x08CE7650
	bl SpawnProc
	pop {r1}
	bx r1
	.align 2, 0
_080B3DB4: .4byte 0x08CE7650

	thumb_func_start sub_080B3DB8
sub_080B3DB8: @ 0x080B3DB8
	push {r4, lr}
	sub sp, #0xc
	movs r2, #0x2a
	ldrsh r1, [r0, r2]
	ldr r3, _080B3DF4 @ =0x02000000
	movs r4, #4
	ldrsh r2, [r3, r4]
	subs r1, r1, r2
	subs r1, #4
	movs r4, #0x2c
	ldrsh r2, [r0, r4]
	movs r4, #6
	ldrsh r0, [r3, r4]
	subs r2, r2, r0
	subs r2, #4
	ldr r3, _080B3DF8 @ =0x08CE7598
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [sp, #8]
	movs r0, #0xb
	bl sub_080B3E20
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B3DF4: .4byte 0x02000000
_080B3DF8: .4byte 0x08CE7598

	thumb_func_start sub_080B3DFC
sub_080B3DFC: @ 0x080B3DFC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r3, #0
	ldr r0, _080B3E1C @ =0x08CE7670
	bl SpawnProc
	strh r4, [r0, #0x2a]
	strh r5, [r0, #0x2c]
	adds r0, #0x29
	strb r6, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B3E1C: .4byte 0x08CE7670

	thumb_func_start sub_080B3E20
sub_080B3E20: @ 0x080B3E20
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r1, #0
	adds r5, r2, #0
	adds r7, r3, #0
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #0x1c]
	ldr r3, [sp, #0x20]
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	movs r1, #0x10
	rsbs r1, r1, #0
	cmp r4, r1
	blt _080B3E6A
	cmp r5, r1
	blt _080B3E6A
	cmp r4, #0xef
	bgt _080B3E6A
	cmp r5, #0x9f
	bgt _080B3E6A
	ldr r1, _080B3E74 @ =0x000001FF
	ands r1, r4
	adds r1, r1, r2
	movs r2, #0xff
	ands r2, r5
	adds r2, r2, r0
	str r3, [sp]
	adds r0, r6, #0
	adds r3, r7, #0
	bl sub_08006A34
_080B3E6A:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B3E74: .4byte 0x000001FF

	thumb_func_start sub_080B3E78
sub_080B3E78: @ 0x080B3E78
	adds r2, r0, #0
	adds r0, #0x2a
	movs r1, #0
	strb r1, [r0]
	str r1, [r2, #0x50]
	adds r0, #0x36
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	str r1, [r2, #0x5c]
	adds r1, r2, #0
	adds r1, #0x62
	movs r0, #1
	strb r0, [r1]
	bx lr
	.align 2, 0

	thumb_func_start sub_080B3E98
sub_080B3E98: @ 0x080B3E98
	push {lr}
	adds r2, r0, #0
	adds r2, #0x29
	ldrb r3, [r2]
	cmp r1, r3
	beq _080B3EAE
	strb r1, [r2]
	ldr r0, [r0, #0x58]
	ldrb r1, [r2]
	bl sub_0806BF4C
_080B3EAE:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080B3EB4
sub_080B3EB4: @ 0x080B3EB4
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
	bl sub_080BFA68
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
	bl sub_080B3DFC
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
	bl sub_080BFA04
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
	bl sub_080B3E98
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
	bl sub_080B32CC
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r1, #0
	bl sub_080B3338
_080B41D6:
	ldr r0, [r6, #0x54]
	movs r1, #0x80
	lsls r1, r1, #0x12
	ands r0, r1
	cmp r0, #0
	beq _080B4278
	movs r0, #1
	bl sub_080B2FC0
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
	bl sub_080B3E98
	b _080B4256
_080B423E:
	ldr r0, [r6, #0x58]
	bl sub_0806DADC
	b _080B4256
_080B4246:
	adds r1, r6, #0
	adds r1, #0x62
	movs r0, #1
	strb r0, [r1]
	adds r0, r6, #0
	movs r1, #0xf
	bl sub_080B3E98
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
	bl sub_080B2FC0
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
	bl sub_0806DAFC
	ldr r0, [r6, #0x58]
	bl sub_0806DADC
	b _080B42BA
	.align 2, 0
_080B42AC: .4byte 0x02000000
_080B42B0:
	ldr r0, [r6, #0x58]
	bl sub_0806DAB4
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

	thumb_func_start sub_080B42D4
sub_080B42D4: @ 0x080B42D4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x58]
	cmp r0, #0
	beq _080B42E2
	bl EndMu
_080B42E2:
	ldr r0, [r4, #0x54]
	movs r1, #0x80
	lsls r1, r1, #0x12
	ands r0, r1
	cmp r0, #0
	beq _080B42F4
	movs r0, #0
	bl sub_080B2FC0
_080B42F4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080B42FC
sub_080B42FC: @ 0x080B42FC
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B430C @ =0x08CE7688
	bl SpawnProc
	pop {r1}
	bx r1
	.align 2, 0
_080B430C: .4byte 0x08CE7688

	thumb_func_start sub_080B4310
sub_080B4310: @ 0x080B4310
	movs r1, #0
	adds r0, #0x2c
	movs r2, #4
_080B4316:
	str r1, [r0, #4]
	strb r1, [r0, #8]
	strh r1, [r0, #2]
	strh r1, [r0]
	adds r0, #0xc
	subs r2, #1
	cmp r2, #0
	bge _080B4316
	bx lr

	thumb_func_start sub_080B4328
sub_080B4328: @ 0x080B4328
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r6, #0
	movs r0, #0
	strh r0, [r4, #0x30]
	ldr r5, _080B4378 @ =0x08CE76B0
	adds r0, r5, #0
	adds r1, r4, #0
	bl SpawnProc
	str r0, [r4, #0x34]
	adds r0, r5, #0
	adds r1, r4, #0
	bl SpawnProc
	str r0, [r4, #0x38]
	adds r0, r5, #0
	adds r1, r4, #0
	bl SpawnProc
	str r0, [r4, #0x3c]
	adds r0, r5, #0
	adds r1, r4, #0
	bl SpawnProc
	str r0, [r4, #0x40]
	ldr r0, [r4, #0x14]
	str r0, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x44
	strb r6, [r0]
	adds r0, #1
	strb r6, [r0]
	adds r0, #2
	strb r6, [r0]
	adds r4, #0x48
	strb r6, [r4]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B4378: .4byte 0x08CE76B0

	thumb_func_start sub_080B437C
sub_080B437C: @ 0x080B437C
	push {r4, r5, lr}
	adds r3, r1, #0
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r0, r3, #0
	adds r0, #0x30
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _080B43E6
	adds r5, r0, #0
	adds r3, r3, r1
	movs r0, #0x2c
	ldrsh r1, [r3, r0]
	ldr r2, _080B43D4 @ =0x02000000
	movs r4, #4
	ldrsh r0, [r2, r4]
	subs r4, r1, r0
	movs r0, #0x2e
	ldrsh r1, [r3, r0]
	movs r3, #6
	ldrsh r0, [r2, r3]
	subs r3, r1, r0
	adds r1, r4, #0
	adds r1, #0x1f
	movs r0, #0x97
	lsls r0, r0, #1
	cmp r1, r0
	bhi _080B43DC
	movs r0, #0x20
	rsbs r0, r0, #0
	cmp r3, r0
	ble _080B43DC
	cmp r3, #0xbf
	bgt _080B43DC
	ldr r0, _080B43D8 @ =0x000001FF
	ands r4, r0
	str r4, [r5, #0x54]
	movs r0, #0xff
	ands r3, r0
	str r3, [r5, #0x58]
	b _080B43E6
	.align 2, 0
_080B43D4: .4byte 0x02000000
_080B43D8: .4byte 0x000001FF
_080B43DC:
	movs r0, #0x80
	lsls r0, r0, #1
	str r0, [r5, #0x54]
	movs r0, #0
	str r0, [r5, #0x58]
_080B43E6:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_080B43EC
sub_080B43EC: @ 0x080B43EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, [r0, #0x40]
	mov sb, r0
	movs r0, #0xff
	mov r8, r0
	movs r1, #0x10
	mov ip, r1
	mov r6, sb
	adds r6, #0x2e
	mov r7, sb
	adds r7, #0x2c
	movs r0, #0
	str r0, [sp]
	movs r1, #3
	mov sl, r1
_080B4414:
	mov r0, sb
	adds r0, #0x30
	ldr r1, [sp]
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _080B44EA
	adds r5, r0, #0
	movs r0, #0
	ldrsh r4, [r7, r0]
	adds r3, r6, #0
	ldrh r2, [r6]
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r2
	cmp r0, #0
	beq _080B4486
	mov r1, r8
	ands r1, r2
	cmp r1, #0xf
	bhi _080B4486
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	cmp r0, #0
	beq _080B445C
	mov r0, ip
	subs r1, r0, r1
	lsls r0, r1, #5
	muls r0, r1, r0
	cmp r0, #0
	bge _080B4456
	adds r0, #0xff
_080B4456:
	asrs r0, r0, #8
	adds r0, r4, r0
	strh r0, [r5, #0x34]
_080B445C:
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080B4480
	mov r0, r8
	ands r0, r1
	mov r1, ip
	subs r0, r1, r0
	lsls r1, r0, #5
	muls r0, r1, r0
	cmp r0, #0
	bge _080B447A
	adds r0, #0xff
_080B447A:
	asrs r0, r0, #8
	subs r0, r4, r0
	strh r0, [r5, #0x34]
_080B4480:
	ldrh r0, [r3]
	adds r0, #1
	strh r0, [r3]
_080B4486:
	ldrh r2, [r3]
	movs r0, #0x80
	lsls r0, r0, #5
	ands r0, r2
	cmp r0, #0
	beq _080B44EA
	mov r1, r8
	ands r1, r2
	cmp r1, #0xf
	bhi _080B44EA
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	cmp r0, #0
	beq _080B44BC
	adds r2, r4, #0
	subs r2, #0x20
	mov r0, ip
	subs r1, r0, r1
	lsls r0, r1, #5
	muls r0, r1, r0
	cmp r0, #0
	bge _080B44B6
	adds r0, #0xff
_080B44B6:
	asrs r0, r0, #8
	adds r0, r2, r0
	strh r0, [r5, #0x34]
_080B44BC:
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080B44E4
	adds r2, r4, #0
	adds r2, #0x20
	mov r0, r8
	ands r0, r1
	mov r1, ip
	subs r0, r1, r0
	lsls r1, r0, #5
	muls r0, r1, r0
	cmp r0, #0
	bge _080B44DE
	adds r0, #0xff
_080B44DE:
	asrs r0, r0, #8
	subs r0, r2, r0
	strh r0, [r5, #0x34]
_080B44E4:
	ldrh r0, [r3]
	adds r0, #1
	strh r0, [r3]
_080B44EA:
	adds r6, #0xc
	adds r7, #0xc
	ldr r0, [sp]
	adds r0, #0xc
	str r0, [sp]
	movs r1, #1
	rsbs r1, r1, #0
	add sl, r1
	mov r0, sl
	cmp r0, #0
	bge _080B4414
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080B4510
sub_080B4510: @ 0x080B4510
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	ldr r4, _080B4608 @ =0x03002870
	adds r1, r4, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r5, r7, #0
	adds r5, #0x45
	ldrb r1, [r5]
	lsrs r2, r1, #1
	adds r0, r4, #0
	adds r0, #0x44
	movs r3, #0
	strb r2, [r0]
	movs r0, #0x10
	subs r0, r0, r2
	adds r2, r4, #0
	adds r2, #0x45
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x46
	strb r3, [r0]
	adds r0, r7, #0
	adds r0, #0x44
	ldrb r2, [r0]
	adds r1, r2, r1
	strb r1, [r5]
	lsls r1, r1, #0x18
	cmp r1, #0
	bne _080B45A6
	movs r6, #0
	mov r8, r0
	movs r0, #1
	rsbs r0, r0, #0
	mov sb, r0
	movs r4, #0
	movs r5, #0
_080B4566:
	ldr r1, [r7, #0x40]
	adds r0, r1, #0
	adds r0, #0x30
	adds r0, r0, r4
	ldr r0, [r0]
	cmp r0, #0
	beq _080B4598
	adds r0, r1, r4
	adds r0, #0x34
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, sb
	bne _080B4598
	adds r0, r6, #0
	bl sub_08006D50
	ldr r0, [r7, #0x40]
	adds r0, r0, r4
	adds r0, #0x34
	strb r5, [r0]
	ldr r0, [r7, #0x40]
	adds r0, #0x30
	adds r0, r0, r4
	str r5, [r0]
_080B4598:
	adds r4, #0xc
	adds r6, #1
	cmp r6, #3
	ble _080B4566
	movs r0, #0
	mov r1, r8
	strb r0, [r1]
_080B45A6:
	adds r0, r7, #0
	adds r0, #0x45
	ldrb r0, [r0]
	cmp r0, #0x20
	bne _080B45FA
	movs r2, #0x44
	adds r2, r2, r7
	mov r8, r2
	movs r5, #0
	movs r6, #3
_080B45BA:
	ldr r1, [r7, #0x40]
	adds r0, r1, #0
	adds r0, #0x30
	adds r0, r0, r5
	ldr r4, [r0]
	cmp r4, #0
	beq _080B45EC
	adds r0, r1, r5
	adds r0, #0x34
	ldrb r0, [r0]
	cmp r0, #1
	bne _080B45EC
	adds r0, r4, #0
	bl sub_08006D9C
	ldr r1, _080B460C @ =0xFFFFFBFF
	ands r1, r0
	adds r0, r4, #0
	bl sub_08006D68
	ldr r0, [r7, #0x40]
	adds r0, r0, r5
	adds r0, #0x34
	movs r1, #0
	strb r1, [r0]
_080B45EC:
	adds r5, #0xc
	subs r6, #1
	cmp r6, #0
	bge _080B45BA
	movs r0, #0
	mov r1, r8
	strb r0, [r1]
_080B45FA:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B4608: .4byte 0x03002870
_080B460C: .4byte 0xFFFFFBFF

	thumb_func_start sub_080B4610
sub_080B4610: @ 0x080B4610
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	adds r4, r1, #0
	lsls r2, r2, #0x18
	lsrs r3, r2, #0x18
	movs r0, #0x1f
	mov r8, r0
	movs r2, #0xf8
	lsls r2, r2, #2
	mov ip, r2
	movs r7, #0xf8
	lsls r7, r7, #7
	mov sb, r7
	movs r6, #0xf
_080B4632:
	ldrh r2, [r4]
	movs r0, #0x1f
	ands r0, r2
	adds r1, r0, #0
	muls r1, r3, r1
	asrs r1, r1, #5
	mov r0, r8
	ands r1, r0
	mov r0, ip
	ands r0, r2
	muls r0, r3, r0
	asrs r0, r0, #5
	mov r7, ip
	ands r0, r7
	adds r1, r1, r0
	mov r0, sb
	ands r0, r2
	muls r0, r3, r0
	asrs r0, r0, #5
	mov r2, sb
	ands r0, r2
	adds r1, r1, r0
	strh r1, [r5]
	adds r5, #2
	adds r4, #2
	subs r6, #1
	cmp r6, #0
	bge _080B4632
	bl EnablePalSync
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080B467C
sub_080B467C: @ 0x080B467C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r4, r6, #0
	adds r4, #0x48
	adds r5, r6, #0
	adds r5, #0x47
	ldrb r1, [r4]
	ldrb r2, [r5]
	adds r0, r1, r2
	strb r0, [r4]
	ldr r0, _080B4730 @ =0x02022BA0
	adds r1, r6, #0
	adds r1, #0x46
	ldrb r1, [r1]
	lsls r1, r1, #5
	ldr r3, _080B4734 @ =0xFFFFFEC0
	adds r2, r0, r3
	adds r1, r1, r2
	ldrb r2, [r4]
	bl sub_080B4610
	ldrb r0, [r4]
	cmp r0, #0
	bne _080B46EA
	movs r4, #0
	adds r7, r5, #0
	movs r0, #1
	rsbs r0, r0, #0
	mov r8, r0
	movs r5, #0
_080B46BC:
	ldr r1, [r6, #0x34]
	adds r0, r1, #0
	adds r0, #0x30
	adds r0, r0, r5
	ldr r0, [r0]
	cmp r0, #0
	beq _080B46DE
	adds r0, r1, r5
	adds r0, #0x34
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r8
	bne _080B46DE
	adds r0, r4, #0
	bl sub_080B4ADC
_080B46DE:
	adds r5, #0xc
	adds r4, #1
	cmp r4, #3
	ble _080B46BC
	movs r0, #0
	strb r0, [r7]
_080B46EA:
	adds r0, r6, #0
	adds r0, #0x48
	ldrb r0, [r0]
	cmp r0, #0x20
	bne _080B4724
	adds r7, r6, #0
	adds r7, #0x47
	movs r5, #0x2c
	movs r4, #3
_080B46FC:
	ldr r0, [r6, #0x34]
	adds r1, r0, r5
	ldr r2, [r1, #4]
	cmp r2, #0
	beq _080B4718
	ldrb r3, [r1, #8]
	cmp r3, #1
	bne _080B4718
	movs r0, #0
	strb r0, [r1, #8]
	ldr r0, [r2, #0x58]
	ldrb r1, [r1, #9]
	bl sub_0806E220
_080B4718:
	adds r5, #0xc
	subs r4, #1
	cmp r4, #0
	bge _080B46FC
	movs r0, #0
	strb r0, [r7]
_080B4724:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B4730: .4byte 0x02022BA0
_080B4734: .4byte 0xFFFFFEC0

	thumb_func_start sub_080B4738
sub_080B4738: @ 0x080B4738
	push {r4, r5, r6, r7, lr}
	sub sp, #0x38
	adds r5, r0, #0
	ldr r1, _080B47D4 @ =0x085E9A68
	mov r0, sp
	movs r2, #0x37
	bl memcpy
	ldrh r0, [r5, #0x30]
	adds r0, #1
	strh r0, [r5, #0x30]
	add r0, sp
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _080B475A
	movs r0, #0
	strh r0, [r5, #0x30]
_080B475A:
	ldrh r0, [r5, #0x30]
	add r0, sp
	ldrb r0, [r0]
	lsls r4, r0, #5
	ldr r0, _080B47D8 @ =0x0842513C
	adds r0, r4, r0
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080B47DC @ =0x084250BC
	adds r4, r4, r0
	movs r1, #0x88
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r4, #0
	adds r6, r5, #0
	adds r6, #0x44
	adds r7, r5, #0
	adds r7, #0x47
_080B478A:
	ldr r1, [r5, #0x38]
	adds r0, r4, #0
	bl sub_080B437C
	adds r4, #1
	cmp r4, #3
	ble _080B478A
	movs r4, #0
_080B479A:
	ldr r1, [r5, #0x3c]
	adds r0, r4, #0
	bl sub_080B437C
	adds r4, #1
	cmp r4, #4
	ble _080B479A
	adds r0, r5, #0
	bl sub_080B43EC
	movs r0, #0
	ldrsb r0, [r6, r0]
	cmp r0, #0
	beq _080B47BC
	adds r0, r5, #0
	bl sub_080B4510
_080B47BC:
	movs r0, #0
	ldrsb r0, [r7, r0]
	cmp r0, #0
	beq _080B47CA
	adds r0, r5, #0
	bl sub_080B467C
_080B47CA:
	add sp, #0x38
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B47D4: .4byte 0x085E9A68
_080B47D8: .4byte 0x0842513C
_080B47DC: .4byte 0x084250BC

	thumb_func_start sub_080B47E0
sub_080B47E0: @ 0x080B47E0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r4, #0
	movs r5, #0
_080B47E8:
	ldr r0, [r6, #0x38]
	adds r0, #0x30
	adds r0, r0, r5
	ldr r0, [r0]
	cmp r0, #0
	beq _080B47FA
	adds r0, r4, #0
	bl sub_080B4C28
_080B47FA:
	adds r5, #0xc
	adds r4, #1
	cmp r4, #3
	ble _080B47E8
	movs r4, #0
	movs r5, #0
_080B4806:
	ldr r0, [r6, #0x3c]
	adds r0, #0x30
	adds r0, r0, r5
	ldr r0, [r0]
	cmp r0, #0
	beq _080B4818
	adds r0, r4, #0
	bl sub_080B4D14
_080B4818:
	adds r5, #0xc
	adds r4, #1
	cmp r4, #4
	ble _080B4806
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080B4828
sub_080B4828: @ 0x080B4828
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _080B4884 @ =0x08CE76C8
	bl Proc_Find
	adds r5, r0, #0
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, #0x2c
	ldr r1, [r5, #0x34]
	adds r6, r1, r0
	cmp r5, #0
	beq _080B487C
	ldr r7, [r6, #4]
	cmp r7, #0
	beq _080B487C
	movs r4, #0
	str r4, [sp]
	ldr r1, _080B4888 @ =0x02022BA0
	ldr r2, _080B488C @ =0x01000008
	mov r0, sp
	bl CpuFastSet
	bl EnablePalSync
	ldr r0, [r7, #0x58]
	movs r1, #0xa
	bl sub_0806E220
	movs r1, #1
	strb r1, [r6, #8]
	ldrb r0, [r6, #9]
	adds r2, r5, #0
	adds r2, #0x46
	strb r0, [r2]
	adds r0, r5, #0
	adds r0, #0x47
	strb r1, [r0]
	adds r0, #1
	strb r4, [r0]
_080B487C:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B4884: .4byte 0x08CE76C8
_080B4888: .4byte 0x02022BA0
_080B488C: .4byte 0x01000008

	thumb_func_start sub_080B4890
sub_080B4890: @ 0x080B4890
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, _080B48FC @ =0x08CE76C8
	bl Proc_Find
	adds r5, r0, #0
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, #0x2c
	ldr r1, [r5, #0x34]
	adds r4, r1, r0
	cmp r5, #0
	beq _080B48F4
	ldr r6, [r4, #4]
	cmp r6, #0
	beq _080B48F4
	ldrb r1, [r4, #9]
	lsls r0, r1, #5
	ldr r1, _080B4900 @ =0x02022A60
	adds r0, r0, r1
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r1, r1, r2
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	ldr r0, [r6, #0x58]
	movs r1, #0xa
	bl sub_0806E220
	movs r1, #0xff
	ldrb r0, [r4, #8]
	orrs r0, r1
	strb r0, [r4, #8]
	ldrb r0, [r4, #9]
	adds r2, r5, #0
	adds r2, #0x46
	strb r0, [r2]
	adds r0, r5, #0
	adds r0, #0x47
	ldrb r2, [r0]
	orrs r1, r2
	strb r1, [r0]
	adds r1, r5, #0
	adds r1, #0x48
	movs r0, #0x20
	strb r0, [r1]
_080B48F4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B48FC: .4byte 0x08CE76C8
_080B4900: .4byte 0x02022A60

	thumb_func_start sub_080B4904
sub_080B4904: @ 0x080B4904
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sb, r0
	adds r7, r1, #0
	mov r8, r2
	mov sl, r3
	ldr r0, _080B495C @ =0x08CE76C8
	bl Proc_Find
	adds r4, r0, #0
	mov r1, sb
	lsls r0, r1, #1
	add r0, sb
	lsls r0, r0, #2
	adds r0, #0x2c
	ldr r1, [r4, #0x34]
	adds r1, r1, r0
	str r1, [sp, #4]
	movs r1, #0xf0
	lsls r1, r1, #0xc
	mov r2, sl
	ands r1, r2
	movs r0, #0x80
	lsls r0, r0, #0xb
	cmp r1, r0
	beq _080B49AC
	cmp r1, r0
	bhi _080B496A
	movs r0, #0x80
	lsls r0, r0, #0xa
	cmp r1, r0
	beq _080B499A
	cmp r1, r0
	bhi _080B4960
	movs r0, #0x80
	lsls r0, r0, #9
	cmp r1, r0
	beq _080B4992
	b _080B49CA
	.align 2, 0
_080B495C: .4byte 0x08CE76C8
_080B4960:
	movs r0, #0xc0
	lsls r0, r0, #0xa
	cmp r1, r0
	beq _080B49A2
	b _080B49CA
_080B496A:
	movs r0, #0xc0
	lsls r0, r0, #0xb
	cmp r1, r0
	beq _080B49BE
	cmp r1, r0
	bhi _080B4980
	movs r0, #0xa0
	lsls r0, r0, #0xb
	cmp r1, r0
	beq _080B49B6
	b _080B49CA
_080B4980:
	movs r0, #0xe0
	lsls r0, r0, #0xb
	cmp r1, r0
	beq _080B49C4
	movs r0, #0x80
	lsls r0, r0, #0xc
	cmp r1, r0
	beq _080B49C8
	b _080B49CA
_080B4992:
	subs r7, #8
	movs r0, #8
	add r8, r0
	b _080B49CA
_080B499A:
	adds r7, #8
	movs r1, #8
	add r8, r1
	b _080B49CA
_080B49A2:
	subs r7, #8
	movs r2, #8
	rsbs r2, r2, #0
	add r8, r2
	b _080B49CA
_080B49AC:
	adds r7, #8
	movs r0, #8
	rsbs r0, r0, #0
	add r8, r0
	b _080B49CA
_080B49B6:
	movs r1, #0xe
	rsbs r1, r1, #0
	add r8, r1
	b _080B49CA
_080B49BE:
	movs r2, #0xe
	add r8, r2
	b _080B49CA
_080B49C4:
	subs r7, #0xe
	b _080B49CA
_080B49C8:
	adds r7, #0xe
_080B49CA:
	ldr r1, [sp, #4]
	ldr r0, [r1, #4]
	cmp r0, #0
	bne _080B4A84
	ldr r0, _080B4A80 @ =0x08CE7688
	adds r1, r4, #0
	bl SpawnProc
	adds r6, r0, #0
	ldr r1, [r4, #0x34]
	mov r2, sb
	lsls r0, r2, #1
	add r0, sb
	lsls r0, r0, #2
	adds r1, #0x30
	adds r1, r1, r0
	str r6, [r1]
	movs r0, #0xff
	mov r2, sl
	ands r2, r0
	movs r3, #0xa0
	lsls r3, r3, #2
	mov r0, sl
	lsrs r4, r0, #0xd
	movs r0, #3
	ands r0, r4
	adds r0, #0xc
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl StartMuInternal
	str r0, [r6, #0x58]
	bl sub_0806DAB4
	adds r1, r6, #0
	adds r1, #0x29
	movs r0, #2
	strb r0, [r1]
	ldr r0, [r6, #0x58]
	movs r1, #2
	bl sub_0806BF4C
	ldr r0, [r6, #0x58]
	bl sub_0806BC88
	adds r0, r6, #0
	adds r0, #0x2b
	mov r1, sl
	strb r1, [r0]
	movs r0, #3
	ands r4, r0
	adds r4, #0xc
	adds r5, r6, #0
	adds r5, #0x2c
	strb r4, [r5]
	ldr r0, [r6, #0x58]
	adds r0, #0x46
	movs r2, #0
	mov ip, r2
	movs r1, #0x80
	lsls r1, r1, #3
	strh r1, [r0]
	ldr r1, [r6, #0x58]
	ldr r3, [r1, #0x30]
	ldr r2, [r1, #0x34]
	movs r0, #0xf
	ldrb r4, [r2, #1]
	ands r0, r4
	lsls r0, r0, #0xc
	ldrh r2, [r2, #2]
	adds r0, r2, r0
	adds r1, #0x46
	ldrh r1, [r1]
	adds r0, r1, r0
	strh r0, [r3, #0x22]
	adds r0, r6, #0
	adds r0, #0x4a
	strh r7, [r0]
	adds r0, #2
	mov r1, r8
	strh r1, [r0]
	ldrb r0, [r5]
	ldr r2, [sp, #4]
	strb r0, [r2, #9]
	mov r4, ip
	strb r4, [r2, #8]
	mov r0, sb
	bl sub_080B4828
	b _080B4A94
	.align 2, 0
_080B4A80: .4byte 0x08CE7688
_080B4A84:
	ldr r1, [r4, #0x34]
	mov r2, sb
	lsls r0, r2, #1
	add r0, sb
	lsls r0, r0, #2
	adds r1, #0x30
	adds r1, r1, r0
	ldr r6, [r1]
_080B4A94:
	ldr r0, [r6, #0x58]
	ldr r2, [r0, #0x30]
	mov r4, sl
	lsrs r0, r4, #0xa
	movs r1, #3
	ands r0, r1
	adds r0, #6
	strh r0, [r2, #0x1e]
	str r4, [r6, #0x54]
	adds r2, r6, #0
	adds r2, #0x2a
	ldrb r0, [r2]
	lsls r1, r0, #1
	adds r0, r6, #0
	adds r0, #0x2e
	adds r0, r0, r1
	strh r7, [r0]
	ldrb r4, [r2]
	lsls r1, r4, #1
	adds r0, r6, #0
	adds r0, #0x3c
	adds r0, r0, r1
	mov r1, r8
	strh r1, [r0]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080B4ADC
sub_080B4ADC: @ 0x080B4ADC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080B4B10 @ =0x08CE76C8
	bl Proc_Find
	adds r5, r0, #0
	ldr r1, [r5, #0x34]
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r4, r0, #2
	adds r1, #0x30
	adds r1, r1, r4
	ldr r0, [r1]
	cmp r0, #0
	beq _080B4B08
	bl Proc_End
	ldr r0, [r5, #0x34]
	adds r0, #0x30
	adds r0, r0, r4
	movs r1, #0
	str r1, [r0]
_080B4B08:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B4B10: .4byte 0x08CE76C8

	thumb_func_start sub_080B4B14
sub_080B4B14: @ 0x080B4B14
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080B4B4C @ =0x08CE76C8
	bl Proc_Find
	cmp r0, #0
	beq _080B4B44
	ldr r1, [r0, #0x34]
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r1, #0x30
	adds r1, r1, r0
	ldr r0, [r1]
	cmp r0, #0
	beq _080B4B44
	ldr r0, [r0, #0x58]
	ldr r1, [r0, #0x30]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	ldrh r2, [r1, #0x22]
	orrs r0, r2
	strh r0, [r1, #0x22]
_080B4B44:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B4B4C: .4byte 0x08CE76C8

	thumb_func_start sub_080B4B50
sub_080B4B50: @ 0x080B4B50
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080B4B88 @ =0x08CE76C8
	bl Proc_Find
	cmp r0, #0
	beq _080B4B80
	ldr r1, [r0, #0x34]
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r1, #0x30
	adds r1, r1, r0
	ldr r0, [r1]
	cmp r0, #0
	beq _080B4B80
	ldr r0, [r0, #0x58]
	ldr r1, [r0, #0x30]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	ldrh r2, [r1, #0x22]
	orrs r0, r2
	strh r0, [r1, #0x22]
_080B4B80:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B4B88: .4byte 0x08CE76C8

	thumb_func_start sub_080B4B8C
sub_080B4B8C: @ 0x080B4B8C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sb, r3
	ldr r0, _080B4C1C @ =0x08CE76C8
	bl Proc_Find
	adds r6, r0, #0
	ldr r1, [r6, #0x38]
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r5, r0, #2
	adds r1, r1, r5
	strh r7, [r1, #0x2c]
	ldr r0, [r6, #0x38]
	adds r0, r0, r5
	mov r1, r8
	strh r1, [r0, #0x2e]
	ldr r0, [r6, #0x38]
	adds r0, #0x30
	adds r0, r0, r5
	ldr r0, [r0]
	cmp r0, #0
	bne _080B4C0C
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	ldr r3, _080B4C20 @ =0x02000000
	movs r2, #4
	ldrsh r0, [r3, r2]
	subs r1, r1, r0
	mov r4, r8
	lsls r2, r4, #0x10
	asrs r2, r2, #0x10
	movs r4, #6
	ldrsh r0, [r3, r4]
	subs r2, r2, r0
	ldr r0, _080B4C24 @ =0x08422160
	movs r3, #0xf
	mov r4, sb
	ands r3, r4
	lsls r3, r3, #0xc
	movs r4, #0xe0
	lsls r4, r4, #4
	adds r3, r3, r4
	movs r4, #1
	str r4, [sp]
	movs r4, #7
	str r4, [sp, #4]
	bl sub_0801245C
	ldr r1, [r6, #0x38]
	adds r1, #0x30
	adds r1, r1, r5
	str r0, [r1]
_080B4C0C:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B4C1C: .4byte 0x08CE76C8
_080B4C20: .4byte 0x02000000
_080B4C24: .4byte 0x08422160

	thumb_func_start sub_080B4C28
sub_080B4C28: @ 0x080B4C28
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080B4C5C @ =0x08CE76C8
	bl Proc_Find
	adds r5, r0, #0
	ldr r1, [r5, #0x38]
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r4, r0, #2
	adds r1, #0x30
	adds r1, r1, r4
	ldr r0, [r1]
	cmp r0, #0
	beq _080B4C4A
	bl sub_080124F8
_080B4C4A:
	ldr r0, [r5, #0x38]
	adds r0, #0x30
	adds r0, r0, r4
	movs r1, #0
	str r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B4C5C: .4byte 0x08CE76C8

	thumb_func_start sub_080B4C60
sub_080B4C60: @ 0x080B4C60
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sb, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sl, r3
	ldr r0, _080B4D08 @ =0x08CE76C8
	bl Proc_Find
	adds r6, r0, #0
	ldr r1, [r6, #0x3c]
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r5, r0, #2
	adds r1, r1, r5
	mov r0, r8
	strh r0, [r1, #0x2c]
	ldr r0, [r6, #0x3c]
	adds r0, r0, r5
	mov r1, sb
	strh r1, [r0, #0x2e]
	ldr r0, [r6, #0x3c]
	adds r0, #0x30
	adds r0, r0, r5
	ldr r7, [r0]
	cmp r7, #0
	bne _080B4CF6
	mov r2, r8
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	ldr r3, _080B4D0C @ =0x02000000
	movs r4, #4
	ldrsh r0, [r3, r4]
	subs r1, r1, r0
	mov r0, sb
	lsls r2, r0, #0x10
	asrs r2, r2, #0x10
	movs r4, #6
	ldrsh r0, [r3, r4]
	subs r2, r2, r0
	ldr r0, _080B4D10 @ =0x08422160
	movs r3, #0xf
	mov r4, sl
	ands r3, r4
	lsls r3, r3, #0xc
	movs r4, #0xe0
	lsls r4, r4, #4
	adds r3, r3, r4
	str r7, [sp]
	movs r4, #0xa
	str r4, [sp, #4]
	bl sub_0801245C
	ldr r1, [r6, #0x3c]
	adds r1, #0x30
	adds r1, r1, r5
	str r0, [r1]
	ldr r0, [r6, #0x38]
	adds r0, r0, r5
	mov r1, r8
	strh r1, [r0, #0x2c]
	ldr r0, [r6, #0x38]
	adds r0, r0, r5
	mov r2, sb
	strh r2, [r0, #0x2e]
_080B4CF6:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B4D08: .4byte 0x08CE76C8
_080B4D0C: .4byte 0x02000000
_080B4D10: .4byte 0x08422160

	thumb_func_start sub_080B4D14
sub_080B4D14: @ 0x080B4D14
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080B4D48 @ =0x08CE76C8
	bl Proc_Find
	adds r5, r0, #0
	ldr r1, [r5, #0x3c]
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r4, r0, #2
	adds r1, #0x30
	adds r1, r1, r4
	ldr r0, [r1]
	cmp r0, #0
	beq _080B4D36
	bl sub_080124F8
_080B4D36:
	ldr r0, [r5, #0x3c]
	adds r0, #0x30
	adds r0, r0, r4
	movs r1, #0
	str r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B4D48: .4byte 0x08CE76C8

	thumb_func_start sub_080B4D4C
sub_080B4D4C: @ 0x080B4D4C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	mov sb, r1
	lsls r2, r2, #0x10
	lsrs r4, r2, #0x10
	adds r6, r4, #0
	ldr r0, _080B4DE8 @ =0x08CE76C8
	bl Proc_Find
	mov r8, r0
	lsls r0, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #2
	adds r0, #0x2c
	mov r2, r8
	ldr r1, [r2, #0x40]
	adds r5, r1, r0
	ldr r2, _080B4DEC @ =0x030028AC
	ldr r0, _080B4DF0 @ =0x0000FFE0
	ldrh r3, [r2]
	ands r0, r3
	ldr r1, _080B4DF4 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0x80
	lsls r3, r3, #4
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r0, [r5, #4]
	cmp r0, #0
	bne _080B4E76
	movs r0, #0xff
	ands r0, r4
	strh r0, [r5]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r4
	adds r0, r0, r1
	strh r0, [r5, #2]
	movs r0, #0
	ldrsh r2, [r5, r0]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r4
	ldr r1, _080B4DF8 @ =0x00000442
	cmp r0, #0
	beq _080B4DB4
	adds r1, #1
_080B4DB4:
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r4
	cmp r0, #0
	beq _080B4DC4
	movs r0, #0x80
	lsls r0, r0, #6
	orrs r1, r0
_080B4DC4:
	str r1, [sp]
	adds r0, r7, #0
	mov r1, sb
	movs r3, #0x28
	bl sub_08007BCC
	adds r2, r0, #0
	str r2, [r5, #4]
	movs r1, #0xc0
	lsls r1, r1, #7
	adds r0, r4, #0
	ands r0, r1
	cmp r0, r1
	bne _080B4DFC
	adds r1, r2, #0
	adds r1, #0x41
	movs r0, #6
	b _080B4E26
	.align 2, 0
_080B4DE8: .4byte 0x08CE76C8
_080B4DEC: .4byte 0x030028AC
_080B4DF0: .4byte 0x0000FFE0
_080B4DF4: .4byte 0x0000E0FF
_080B4DF8: .4byte 0x00000442
_080B4DFC:
	movs r0, #0x80
	lsls r0, r0, #7
	ands r0, r4
	cmp r0, #0
	beq _080B4E0E
	adds r1, r2, #0
	adds r1, #0x41
	movs r0, #5
	b _080B4E26
_080B4E0E:
	movs r0, #0x80
	lsls r0, r0, #6
	ands r6, r0
	cmp r6, #0
	beq _080B4E20
	adds r1, r2, #0
	adds r1, #0x41
	movs r0, #4
	b _080B4E26
_080B4E20:
	adds r1, r2, #0
	adds r1, #0x41
	movs r0, #3
_080B4E26:
	strb r0, [r1]
	adds r0, r7, #0
	movs r1, #5
	bl sub_08007A64
	movs r6, #0
	movs r0, #1
	strb r0, [r5, #8]
	mov r1, r8
	adds r1, #0x44
	movs r0, #2
	strb r0, [r1]
	mov r4, r8
	adds r4, #0x45
	ldrb r1, [r4]
	cmp r1, #0x20
	bne _080B4E76
	strb r6, [r4]
	ldr r3, _080B4E84 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldrb r1, [r4]
	adds r0, r3, #0
	adds r0, #0x44
	strb r1, [r0]
	movs r0, #0x10
	ldrb r4, [r4]
	subs r0, r0, r4
	adds r1, r3, #0
	adds r1, #0x45
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r6, [r0]
_080B4E76:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B4E84: .4byte 0x03002870

	thumb_func_start sub_080B4E88
sub_080B4E88: @ 0x080B4E88
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	ldr r0, _080B4F34 @ =0x08CE76C8
	bl Proc_Find
	adds r7, r0, #0
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, #0x2c
	ldr r1, [r7, #0x40]
	adds r5, r1, r0
	ldr r6, _080B4F38 @ =0x030028AC
	ldr r0, _080B4F3C @ =0x0000FFE0
	ldrh r1, [r6]
	ands r0, r1
	ldr r1, _080B4F40 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r6]
	ldr r4, [r5, #4]
	cmp r4, #0
	beq _080B4F28
	movs r0, #0x80
	lsls r0, r0, #5
	mov r8, r0
	ldrh r1, [r5, #2]
	ands r0, r1
	cmp r0, #0
	bne _080B4F28
	adds r0, r4, #0
	bl sub_08006D9C
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r1, r0
	adds r0, r4, #0
	bl sub_08006D68
	movs r0, #0xff
	lsls r0, r0, #8
	mov r2, sb
	ands r0, r2
	add r0, r8
	strh r0, [r5, #2]
	movs r0, #0xff
	strb r0, [r5, #8]
	adds r1, r7, #0
	adds r1, #0x44
	movs r0, #0xfe
	strb r0, [r1]
	adds r1, #1
	ldrb r0, [r1]
	cmp r0, #0
	bne _080B4F28
	movs r0, #0x20
	strb r0, [r1]
	movs r0, #0x3f
	ldrb r2, [r6]
	ands r0, r2
	strb r0, [r6]
	ldrb r2, [r1]
	lsrs r0, r2, #1
	strb r0, [r6, #8]
	ldrb r1, [r1]
	lsrs r1, r1, #1
	movs r0, #0x10
	subs r0, r0, r1
	strb r0, [r6, #9]
	movs r0, #0
	strb r0, [r6, #0xa]
_080B4F28:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B4F34: .4byte 0x08CE76C8
_080B4F38: .4byte 0x030028AC
_080B4F3C: .4byte 0x0000FFE0
_080B4F40: .4byte 0x0000E0FF

	thumb_func_start sub_080B4F44
sub_080B4F44: @ 0x080B4F44
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B4F54 @ =0x08CE76C8
	bl SpawnProc
	pop {r1}
	bx r1
	.align 2, 0
_080B4F54: .4byte 0x08CE76C8

	thumb_func_start sub_080B4F58
sub_080B4F58: @ 0x080B4F58
	push {lr}
	ldr r0, _080B4F64 @ =0x08CE76C8
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080B4F64: .4byte 0x08CE76C8

	thumb_func_start sub_080B4F68
sub_080B4F68: @ 0x080B4F68
	bx lr
	.align 2, 0

	thumb_func_start sub_080B4F6C
sub_080B4F6C: @ 0x080B4F6C
	bx lr
	.align 2, 0

	thumb_func_start sub_080B4F70
sub_080B4F70: @ 0x080B4F70
	bx lr
	.align 2, 0

	thumb_func_start sub_080B4F74
sub_080B4F74: @ 0x080B4F74
	bx lr
	.align 2, 0

	thumb_func_start sub_080B4F78
sub_080B4F78: @ 0x080B4F78
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	ldr r0, _080B4F98 @ =0x08CE76E8
	bl Proc_Find
	adds r3, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_080B37A4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B4F98: .4byte 0x08CE76E8

	thumb_func_start sub_080B4F9C
sub_080B4F9C: @ 0x080B4F9C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	ldr r0, _080B4FE0 @ =0x08CE76E8
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _080B4FD8
	bl sub_080B33B8
	adds r1, r4, #0
	adds r1, #0x4c
	strh r0, [r1]
	bl sub_080B33C4
	adds r1, r4, #0
	adds r1, #0x4e
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0x50
	strh r5, [r0]
	adds r0, #2
	strh r6, [r0]
	strh r7, [r4, #0x34]
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
_080B4FD8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B4FE0: .4byte 0x08CE76E8

	thumb_func_start sub_080B4FE4
sub_080B4FE4: @ 0x080B4FE4
	push {r4, lr}
	adds r4, r0, #0
	bl EndTalk
	movs r0, #0x80
	lsls r0, r0, #2
	movs r1, #2
	movs r2, #2
	bl sub_08007E98
	ldr r0, _080B502C @ =0x02000815
	ldrb r0, [r0]
	lsrs r1, r0, #3
	adds r1, #1
	movs r0, #1
	adds r2, r4, #0
	bl StartTalkMsg
	movs r0, #4
	bl sub_080080D8
	movs r0, #0x20
	bl SetTalkFlag
	movs r0, #0x80
	bl SetTalkFlag
	movs r0, #4
	bl SetTalkFlag
	movs r0, #1
	bl SetTalkFlag
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B502C: .4byte 0x02000815

	thumb_func_start WorldMap_Init
WorldMap_Init: @ 0x080B5030
	push {r4, lr}
	sub sp, #0x20
	mov r1, sp
	ldr r0, _080B50B8 @ =0x085E9AA0
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	movs r0, #0
	bl InitBgs
	ldr r4, _080B50BC @ =0x03002870
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r4, #0xc]
	ands r0, r2
	strb r0, [r4, #0xc]
	ldrb r3, [r4, #0x10]
	ands r1, r3
	movs r0, #1
	orrs r1, r0
	strb r1, [r4, #0x10]
	movs r0, #3
	ldrb r1, [r4, #0x14]
	orrs r1, r0
	strb r1, [r4, #0x14]
	ldrb r1, [r4, #0x18]
	orrs r0, r1
	strb r0, [r4, #0x18]
	bl LoadUiFrameGraphics
	bl ResetText
	bl InitFaces
	mov r0, sp
	bl SetFaceConfig
	bl ResetUnitSprites
	bl sub_0806BA4C
	bl ApplyUnitSpritePalettes
	ldr r1, _080B50C0 @ =0x0202BBB8
	movs r0, #0
	strh r0, [r1, #0xc]
	strh r0, [r1, #0xe]
	subs r0, #2
	ldrb r2, [r4, #1]
	ands r0, r2
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r4, #1]
	add sp, #0x20
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B50B8: .4byte 0x085E9AA0
_080B50BC: .4byte 0x03002870
_080B50C0: .4byte 0x0202BBB8

	thumb_func_start sub_080B50C4
sub_080B50C4: @ 0x080B50C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	adds r0, #0x40
	movs r5, #0
	movs r1, #0
	strh r1, [r0]
	adds r0, #8
	strh r1, [r0]
	adds r0, #0xc
	strb r5, [r0]
	ldr r7, _080B5230 @ =0x03002870
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r7, #1]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	movs r2, #4
	orrs r0, r2
	subs r1, #6
	ands r0, r1
	movs r3, #0x10
	mov sb, r3
	mov r1, sb
	orrs r0, r1
	strb r0, [r7, #1]
	adds r0, r4, #0
	adds r0, #0x4a
	ldrb r0, [r0]
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	movs r3, #0x32
	ldrsh r2, [r4, r3]
	bl sub_080B322C
	movs r0, #0x3c
	adds r0, r0, r7
	mov r8, r0
	movs r6, #0x3f
	adds r0, r6, #0
	mov r1, r8
	ldrb r1, [r1]
	ands r0, r1
	mov r2, r8
	strb r0, [r2]
	movs r0, #0x10
	ldr r3, _080B5234 @ =0x030028B4
	strb r0, [r3]
	ldr r0, _080B5238 @ =0x030028B5
	strb r5, [r0]
	movs r1, #0x46
	adds r1, r1, r7
	mov sl, r1
	strb r5, [r1]
	ldr r0, _080B523C @ =0x084221D4
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080B5240 @ =0x08424CD8
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080B5244 @ =0x0819431C
	movs r1, #0xd8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080B5248 @ =0x084225A8
	movs r1, #0xc8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080B524C @ =0x08421C78
	ldr r1, _080B5250 @ =0x06015000
	bl Decompress
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r2, [r7, #1]
	ands r0, r2
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	movs r3, #0x36
	adds r3, r3, r7
	mov ip, r3
	movs r0, #1
	ldrb r1, [r3]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r2, #4
	orrs r0, r2
	movs r1, #8
	orrs r0, r1
	mov r3, sb
	orrs r0, r3
	adds r3, r7, #0
	adds r3, #0x34
	movs r2, #0x20
	ldrb r1, [r3]
	orrs r1, r2
	strb r1, [r3]
	adds r3, #1
	ldrb r1, [r3]
	orrs r1, r2
	strb r1, [r3]
	orrs r0, r2
	mov r1, ip
	strb r0, [r1]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_080AA154
	mov r2, r8
	ldrb r2, [r2]
	ands r6, r2
	mov r3, r8
	strb r6, [r3]
	ldr r0, _080B5234 @ =0x030028B4
	strb r5, [r0]
	ldr r1, _080B5238 @ =0x030028B5
	strb r5, [r1]
	mov r2, sl
	strb r5, [r2]
	ldr r0, _080B5254 @ =0x0000FFE0
	ldrh r3, [r7, #0x3c]
	ands r0, r3
	ldr r1, _080B5258 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xc0
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x3c]
	ldr r0, _080B525C @ =0x02000814
	strb r5, [r0]
	movs r0, #0
	bl SetOnHBlankA
	ldr r0, _080B5260 @ =sub_080B37C4
	bl SetOnHBlankA
	adds r0, r4, #0
	bl sub_080B3C04
	adds r0, r4, #0
	bl sub_080B3DA4
	adds r0, r4, #0
	bl sub_080B4F44
	ldr r1, [r4, #0x2c]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080B526C
	movs r0, #0x40
	ands r1, r0
	cmp r1, #0
	beq _080B5264
	movs r0, #1
	movs r1, #0
	bl StartPaletteFadeOutOfBlack
	b _080B526C
	.align 2, 0
_080B5230: .4byte 0x03002870
_080B5234: .4byte 0x030028B4
_080B5238: .4byte 0x030028B5
_080B523C: .4byte 0x084221D4
_080B5240: .4byte 0x08424CD8
_080B5244: .4byte 0x0819431C
_080B5248: .4byte 0x084225A8
_080B524C: .4byte 0x08421C78
_080B5250: .4byte 0x06015000
_080B5254: .4byte 0x0000FFE0
_080B5258: .4byte 0x0000E0FF
_080B525C: .4byte 0x02000814
_080B5260: .4byte sub_080B37C4
_080B5264:
	movs r0, #2
	movs r1, #0
	bl StartPaletteFadeOutOfBlack
_080B526C:
	movs r0, #0
	bl sub_080B2FC0
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080B5280
sub_080B5280: @ 0x080B5280
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl SetOnHBlankB
	movs r0, #0
	bl SetOnHBlankA
	bl EndTalk
	bl sub_080097FC
	bl ResetUnitSprites
	ldr r2, _080B52C8 @ =0x03002870
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r3, [r1]
	orrs r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r2, #0x46
	movs r0, #0x10
	strb r0, [r2]
	adds r4, #0x54
	strb r1, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B52C8: .4byte 0x03002870

	thumb_func_start sub_080B52CC
sub_080B52CC: @ 0x080B52CC
	bx lr
	.align 2, 0

	thumb_func_start sub_080B52D0
sub_080B52D0: @ 0x080B52D0
	push {lr}
	ldr r0, [r0, #0x2c]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _080B533A
	bl sub_0807685C
	ldr r0, _080B5340 @ =sub_08077860
	bl SetOnHBlankB
	movs r0, #0
	bl sub_08077680
	ldr r0, _080B5344 @ =0x03002870
	mov ip, r0
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	mov r1, ip
	adds r1, #0x44
	movs r3, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r3, [r0]
	ldr r0, _080B5348 @ =0x0000FFE0
	mov r3, ip
	ldrh r3, [r3, #0x3c]
	ands r0, r3
	movs r1, #8
	orrs r0, r1
	ldr r1, _080B534C @ =0x0000E0FF
	ands r0, r1
	mov r1, ip
	strh r0, [r1, #0x3c]
	movs r0, #0x20
	ldrb r1, [r2]
	orrs r1, r0
	strb r1, [r2]
	mov r1, ip
	adds r1, #0x3d
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
_080B533A:
	pop {r0}
	bx r0
	.align 2, 0
_080B5340: .4byte sub_08077860
_080B5344: .4byte 0x03002870
_080B5348: .4byte 0x0000FFE0
_080B534C: .4byte 0x0000E0FF

	thumb_func_start sub_080B5350
sub_080B5350: @ 0x080B5350
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r6, #0x30
	ldr r0, [r5, #0x2c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080B536A
	adds r0, r5, #0
	adds r0, #0x48
	ldrh r1, [r0]
	adds r1, #2
	b _080B5372
_080B536A:
	adds r0, r5, #0
	adds r0, #0x48
	ldrh r1, [r0]
	adds r1, #1
_080B5372:
	strh r1, [r0]
	adds r2, r0, #0
	ldr r1, [r5, #0x2c]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080B5386
	ldrh r2, [r2]
	lsrs r4, r2, #1
	b _080B5388
_080B5386:
	ldrh r4, [r2]
_080B5388:
	movs r7, #8
	ands r1, r7
	cmp r1, #0
	beq _080B53AC
	subs r1, r6, r4
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #4
	muls r0, r1, r0
	adds r1, r6, #0
	muls r1, r6, r1
	bl __divsi3
	adds r1, r0, #0
	movs r0, #0x70
	subs r0, r0, r1
	bl sub_08077680
_080B53AC:
	cmp r4, r6
	bne _080B540C
	adds r0, r5, #0
	bl Proc_Break
	ldr r0, [r5, #0x2c]
	ands r0, r7
	cmp r0, #0
	beq _080B540C
	movs r0, #0
	bl SetOnHBlankB
	ldr r3, _080B5414 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x44
	movs r0, #0
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	ldr r0, _080B5418 @ =0x0000FFE0
	ldrh r4, [r3, #0x3c]
	ands r0, r4
	ldr r1, _080B541C @ =0x0000E0FF
	ands r0, r1
	movs r4, #0x80
	lsls r4, r4, #3
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	movs r1, #0x21
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r4, [r2]
	ands r0, r4
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x3d
	ldrb r2, [r0]
	ands r1, r2
	strb r1, [r0]
_080B540C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B5414: .4byte 0x03002870
_080B5418: .4byte 0x0000FFE0
_080B541C: .4byte 0x0000E0FF

	thumb_func_start sub_080B5420
sub_080B5420: @ 0x080B5420
	adds r2, r0, #0
	adds r2, #0x40
	movs r1, #0
	strh r1, [r2]
	adds r0, #0x54
	movs r1, #1
	strb r1, [r0]
	bx lr

	thumb_func_start sub_080B5430
sub_080B5430: @ 0x080B5430
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	bl sub_080B33B8
	mov r8, r0
	bl sub_080B33C4
	adds r7, r0, #0
	mov r5, r8
	adds r3, r7, #0
	adds r1, r4, #0
	adds r1, #0x40
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0xff
	bgt _080B54D8
	movs r3, #0x80
	lsls r3, r3, #1
	mov ip, r3
	ldr r6, _080B54F0 @ =0x0000FFFF
_080B545C:
	ldrh r2, [r1]
	ldrh r3, [r4, #0x34]
	adds r0, r2, r3
	strh r0, [r1]
	movs r2, #0
	ldrsh r0, [r1, r2]
	mov r3, ip
	subs r1, r3, r0
	adds r0, r4, #0
	adds r0, #0x50
	movs r2, #0
	ldrsh r3, [r0, r2]
	subs r0, #4
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r2, r3, r0
	cmp r2, #0
	bge _080B5482
	subs r2, r0, r3
_080B5482:
	adds r0, r2, #0
	muls r0, r1, r0
	muls r0, r1, r0
	cmp r0, #0
	bge _080B548E
	adds r0, r0, r6
_080B548E:
	asrs r0, r0, #0x10
	subs r5, r2, r0
	adds r0, r4, #0
	adds r0, #0x40
	movs r3, #0
	ldrsh r0, [r0, r3]
	mov r1, ip
	subs r2, r1, r0
	adds r0, r4, #0
	adds r0, #0x52
	movs r1, #0
	ldrsh r3, [r0, r1]
	subs r0, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r1, r3, r0
	cmp r1, #0
	bge _080B54B4
	subs r1, r0, r3
_080B54B4:
	adds r0, r1, #0
	muls r0, r2, r0
	muls r0, r2, r0
	cmp r0, #0
	bge _080B54C0
	adds r0, r0, r6
_080B54C0:
	asrs r0, r0, #0x10
	subs r3, r1, r0
	adds r1, r4, #0
	adds r1, #0x40
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0xff
	bgt _080B54D8
	cmp r5, r8
	bne _080B54D8
	cmp r3, r7
	beq _080B545C
_080B54D8:
	adds r0, r4, #0
	adds r0, #0x50
	adds r2, r4, #0
	adds r2, #0x4c
	movs r6, #0
	ldrsh r1, [r0, r6]
	movs r6, #0
	ldrsh r0, [r2, r6]
	cmp r1, r0
	ble _080B54F4
	adds r5, r5, r0
	b _080B54FA
	.align 2, 0
_080B54F0: .4byte 0x0000FFFF
_080B54F4:
	movs r6, #0
	ldrsh r0, [r2, r6]
	subs r5, r0, r5
_080B54FA:
	adds r0, r4, #0
	adds r0, #0x52
	adds r2, r4, #0
	adds r2, #0x4e
	movs r6, #0
	ldrsh r1, [r0, r6]
	movs r6, #0
	ldrsh r0, [r2, r6]
	cmp r1, r0
	ble _080B5512
	adds r3, r3, r0
	b _080B5518
_080B5512:
	movs r6, #0
	ldrsh r0, [r2, r6]
	subs r3, r0, r3
_080B5518:
	mov r1, r8
	subs r0, r5, r1
	subs r1, r3, r7
	bl sub_080B32CC
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r1, #0
	bl sub_080B3338
	adds r1, r4, #0
	adds r1, #0x40
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1]
	cmp r1, r0
	bne _080B5548
	adds r0, r4, #0
	bl Proc_Break
	adds r1, r4, #0
	adds r1, #0x54
	movs r0, #0
	strb r0, [r1]
_080B5548:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080B5554
sub_080B5554: @ 0x080B5554
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080B5588 @ =0x08CE76E8
	movs r1, #3
	bl SpawnProc
	adds r1, r0, #0
	adds r1, #0x4a
	strb r4, [r1]
	strh r5, [r0, #0x30]
	strh r6, [r0, #0x32]
	mov r1, r8
	str r1, [r0, #0x2c]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B5588: .4byte 0x08CE76E8

	thumb_func_start sub_080B558C
sub_080B558C: @ 0x080B558C
	push {lr}
	ldr r0, _080B55B4 @ =0x08CE4C50
	bl Proc_Find
	bl Proc_End
	ldr r0, _080B55B8 @ =0x08CE76E8
	bl Proc_Find
	bl Proc_End
	bl ClearTalk
	bl sub_08012504
	movs r0, #0
	bl InitBgs
	pop {r0}
	bx r0
	.align 2, 0
_080B55B4: .4byte 0x08CE4C50
_080B55B8: .4byte 0x08CE76E8

	thumb_func_start sub_080B55BC
sub_080B55BC: @ 0x080B55BC
	push {lr}
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _080B55DA
	ldr r0, _080B55E0 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	ldrh r0, [r0, #0x26]
	movs r1, #0
	bl StartBgm
_080B55DA:
	pop {r0}
	bx r0
	.align 2, 0
_080B55E0: .4byte 0x0202BBF8

	thumb_func_start sub_080B55E4
sub_080B55E4: @ 0x080B55E4
	push {r4, r5, lr}
	ldr r5, _080B561C @ =0x08C9CDA4
	ldr r4, _080B5620 @ =0x0202BBF8
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	adds r0, #0x79
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	cmp r0, #0
	beq _080B5616
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	adds r0, #0x79
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	bl sub_0800AF5C
_080B5616:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B561C: .4byte 0x08C9CDA4
_080B5620: .4byte 0x0202BBF8

	thumb_func_start sub_080B5624
sub_080B5624: @ 0x080B5624
	push {lr}
	movs r0, #4
	bl FadeBgmOut
	pop {r0}
	bx r0

	thumb_func_start sub_080B5630
sub_080B5630: @ 0x080B5630
	push {lr}
	bl sub_08004234
	bl sub_080B4F58
	movs r0, #0
	bl sub_080B2FC0
	pop {r0}
	bx r0

	thumb_func_start sub_080B5644
sub_080B5644: @ 0x080B5644
	push {lr}
	ldr r0, _080B5658 @ =0x08CE76E8
	bl Proc_Find
	cmp r0, #0
	beq _080B5652
	movs r0, #1
_080B5652:
	pop {r1}
	bx r1
	.align 2, 0
_080B5658: .4byte 0x08CE76E8

	thumb_func_start sub_080B565C
sub_080B565C: @ 0x080B565C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	ble _080B566C
	subs r0, #1
	str r0, [r4, #0x2c]
	b _080B575A
_080B566C:
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0xc
	bhi _080B5754
	lsls r0, r0, #2
	ldr r1, _080B5680 @ =_080B5684
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B5680: .4byte _080B5684
_080B5684: @ jump table
	.4byte _080B56B8 @ case 0
	.4byte _080B56C6 @ case 1
	.4byte _080B56CE @ case 2
	.4byte _080B56D8 @ case 3
	.4byte _080B56E0 @ case 4
	.4byte _080B56F6 @ case 5
	.4byte _080B570C @ case 6
	.4byte _080B571C @ case 7
	.4byte _080B572A @ case 8
	.4byte _080B573E @ case 9
	.4byte _080B5736 @ case 10
	.4byte _080B574E @ case 11
	.4byte _080B5746 @ case 12
_080B56B8:
	ldr r0, [r4, #0x34]
	ldr r1, [r4, #0x38]
	ldr r2, [r4, #0x3c]
	ldr r3, [r4, #0x44]
	bl sub_080B4904
	b _080B5754
_080B56C6:
	ldr r0, [r4, #0x34]
	bl sub_080B4ADC
	b _080B5754
_080B56CE:
	ldr r0, [r4, #0x34]
	ldr r1, [r4, #0x40]
	bl sub_080B39D8
	b _080B5754
_080B56D8:
	ldr r0, [r4, #0x34]
	bl sub_080B3AFC
	b _080B5754
_080B56E0:
	ldr r0, [r4, #0x34]
	movs r2, #0x38
	ldrsh r1, [r4, r2]
	movs r3, #0x3c
	ldrsh r2, [r4, r3]
	ldr r3, [r4, #0x44]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	bl sub_080B4B8C
	b _080B5754
_080B56F6:
	ldr r0, [r4, #0x34]
	movs r2, #0x38
	ldrsh r1, [r4, r2]
	movs r3, #0x3c
	ldrsh r2, [r4, r3]
	ldr r3, [r4, #0x44]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	bl sub_080B4C60
	b _080B5754
_080B570C:
	ldr r0, [r4, #0x34]
	ldr r1, [r4, #0x40]
	ldr r2, [r4, #0x44]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	bl sub_080B4D4C
	b _080B5754
_080B571C:
	ldr r0, [r4, #0x34]
	ldr r1, [r4, #0x44]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl sub_080B4E88
	b _080B5754
_080B572A:
	ldr r0, [r4, #0x38]
	ldr r1, [r4, #0x3c]
	ldr r2, [r4, #0x44]
	bl sub_080B4F9C
	b _080B5754
_080B5736:
	ldr r0, [r4, #0x44]
	bl sub_080B5844
	b _080B5754
_080B573E:
	ldr r0, [r4, #0x44]
	bl sub_080B5934
	b _080B5754
_080B5746:
	ldr r0, [r4, #0x44]
	bl sub_080B4890
	b _080B5754
_080B574E:
	ldr r0, [r4, #0x44]
	bl sub_080B4828
_080B5754:
	adds r0, r4, #0
	bl Proc_Break
_080B575A:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080B5760
sub_080B5760: @ 0x080B5760
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r7, [sp, #0x18]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080B57A4 @ =0x08CE76E8
	bl Proc_Find
	adds r1, r0, #0
	ldr r0, _080B57A8 @ =0x08CE77A8
	bl SpawnProc
	str r5, [r0, #0x2c]
	adds r1, r0, #0
	adds r1, #0x30
	strb r4, [r1]
	str r6, [r0, #0x34]
	mov r1, r8
	str r1, [r0, #0x40]
	str r7, [r0, #0x38]
	ldr r1, [sp, #0x1c]
	str r1, [r0, #0x3c]
	ldr r1, [sp, #0x20]
	str r1, [r0, #0x44]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B57A4: .4byte 0x08CE76E8
_080B57A8: .4byte 0x08CE77A8

	thumb_func_start sub_080B57AC
sub_080B57AC: @ 0x080B57AC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	ldr r0, [r6, #0x30]
	lsls r0, r0, #5
	ldr r1, _080B5840 @ =0x02022862
	adds r5, r0, r1
	adds r4, r6, #0
	adds r4, #0x34
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	movs r1, #0x1f
	mov sb, r1
	movs r1, #0x20
	subs r3, r1, r0
	movs r2, #0xf8
	lsls r2, r2, #2
	mov r8, r2
	movs r7, #0xf8
	lsls r7, r7, #7
	mov ip, r7
	movs r0, #0xe
	mov sl, r0
_080B57E2:
	ldrh r2, [r4]
	movs r0, #0x1f
	ands r0, r2
	adds r1, r0, #0
	muls r1, r3, r1
	asrs r1, r1, #5
	mov r7, sb
	ands r1, r7
	mov r0, r8
	ands r0, r2
	muls r0, r3, r0
	asrs r0, r0, #5
	mov r7, r8
	ands r0, r7
	adds r1, r1, r0
	mov r0, ip
	ands r0, r2
	muls r0, r3, r0
	asrs r0, r0, #5
	mov r2, ip
	ands r0, r2
	adds r1, r1, r0
	strh r1, [r5]
	adds r4, #2
	adds r5, #2
	movs r7, #1
	rsbs r7, r7, #0
	add sl, r7
	mov r0, sl
	cmp r0, #0
	bge _080B57E2
	bl EnablePalSync
	ldr r0, [r6, #0x2c]
	cmp r0, #0x20
	bne _080B5830
	adds r0, r6, #0
	bl Proc_Break
_080B5830:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B5840: .4byte 0x02022862

	thumb_func_start sub_080B5844
sub_080B5844: @ 0x080B5844
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080B5890 @ =0x08CE76E8
	bl Proc_Find
	adds r1, r0, #0
	ldr r0, _080B5894 @ =0x08CE77C0
	bl SpawnProc
	adds r5, r0, #0
	movs r0, #0x1f
	ands r4, r0
	str r4, [r5, #0x30]
	movs r0, #0
	str r0, [r5, #0x2c]
	ldr r0, _080B5898 @ =0x08194594
	movs r1, #0xe0
	lsls r1, r1, #2
	movs r2, #0x80
	bl ApplyPaletteExt
	ldr r0, _080B589C @ =0x02022860
	lsls r4, r4, #5
	adds r4, r4, r0
	adds r4, #2
	adds r5, #0x34
	movs r1, #0xe
_080B587A:
	ldrh r0, [r4]
	strh r0, [r5]
	adds r4, #2
	adds r5, #2
	subs r1, #1
	cmp r1, #0
	bge _080B587A
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B5890: .4byte 0x08CE76E8
_080B5894: .4byte 0x08CE77C0
_080B5898: .4byte 0x08194594
_080B589C: .4byte 0x02022860

	thumb_func_start sub_080B58A0
sub_080B58A0: @ 0x080B58A0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	ldr r0, [r6, #0x30]
	lsls r0, r0, #5
	ldr r1, _080B5930 @ =0x02022862
	adds r5, r0, r1
	adds r4, r6, #0
	adds r4, #0x34
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	movs r1, #0x1f
	mov sb, r1
	adds r3, r0, #0
	movs r2, #0xf8
	lsls r2, r2, #2
	mov r8, r2
	movs r7, #0xf8
	lsls r7, r7, #7
	mov ip, r7
	movs r0, #0xe
	mov sl, r0
_080B58D4:
	ldrh r2, [r4]
	movs r0, #0x1f
	ands r0, r2
	adds r1, r0, #0
	muls r1, r3, r1
	asrs r1, r1, #5
	mov r7, sb
	ands r1, r7
	mov r0, r8
	ands r0, r2
	muls r0, r3, r0
	asrs r0, r0, #5
	mov r7, r8
	ands r0, r7
	adds r1, r1, r0
	mov r0, ip
	ands r0, r2
	muls r0, r3, r0
	asrs r0, r0, #5
	mov r2, ip
	ands r0, r2
	adds r1, r1, r0
	strh r1, [r5]
	adds r4, #2
	adds r5, #2
	movs r7, #1
	rsbs r7, r7, #0
	add sl, r7
	mov r0, sl
	cmp r0, #0
	bge _080B58D4
	bl EnablePalSync
	ldr r0, [r6, #0x2c]
	cmp r0, #0x20
	bne _080B5922
	adds r0, r6, #0
	bl Proc_Break
_080B5922:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B5930: .4byte 0x02022862

