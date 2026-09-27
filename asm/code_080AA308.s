	.include "macro.inc"

	.syntax unified

	thumb_func_start StartLockingPaletteFadeToBlack
StartLockingPaletteFadeToBlack: @ 0x080AA308
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AA328 @ =0x08CE4C80
	bl Proc_StartBlocking
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
	bl Proc_Start
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
	bl Proc_Start
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
	bl Proc_Start
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
	bl Proc_Start
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
	bl Proc_StartBlocking
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
	bl Proc_StartBlocking
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
	bl Proc_Start
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
	bl Proc_Start
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

	thumb_func_start WipeAllPalette
WipeAllPalette: @ 0x080AA45C
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

	thumb_func_start EndFadeInOut
EndFadeInOut: @ 0x080AA480
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

	thumb_func_start BmBgfx_Init
BmBgfx_Init: @ 0x080AA4A4
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

	thumb_func_start BmBgfx_End
BmBgfx_End: @ 0x080AA6E4
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
	bl SetBgChrOffset
	ldrb r0, [r4]
	bl GetBgTilemap
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

	thumb_func_start CheckBmBgfxDone
CheckBmBgfxDone: @ 0x080AA718
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

	thumb_func_start BmBgfxAdvance
BmBgfxAdvance: @ 0x080AA734
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

	thumb_func_start BmBgfxSetLoopEN
BmBgfxSetLoopEN: @ 0x080AA76C
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

	thumb_func_start StartBmBgfx
StartBmBgfx: @ 0x080AA78C
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
	bl Proc_Start
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

	thumb_func_start MixPaletteCore
MixPaletteCore: @ 0x080AA834
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

	thumb_func_start MixPalette_Loop
MixPalette_Loop: @ 0x080AA900
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
	bl MixPaletteCore
	pop {r0}
	bx r0

	thumb_func_start StartMixPalette
StartMixPalette: @ 0x080AA92C
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
	bl Proc_Start
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

	thumb_func_start EndMixPalette
EndMixPalette: @ 0x080AA964
	push {lr}
	ldr r0, _080AA974 @ =0x08CE4CD8
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080AA974: .4byte 0x08CE4CD8

	thumb_func_start StartSpriteAnimfx
StartSpriteAnimfx: @ 0x080AA978
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
	bl StartSpriteAnimProc
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

	thumb_func_start GetBgXOffset
GetBgXOffset: @ 0x080AA9EC
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

	thumb_func_start GetBgYOffset
GetBgYOffset: @ 0x080AAA34
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

	thumb_func_start AppendString
AppendString: @ 0x080AAA7C
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

	thumb_func_start AppendCharacter
AppendCharacter: @ 0x080AAA9C
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
	bl DecodeMsgInBuffer
	adds r1, r5, #0
	bl AppendString
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
	bl DecodeMsgInBuffer
	adds r1, r5, #0
	bl AppendString
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
	bl DecodeMsgInBuffer
	adds r1, r5, #0
	bl AppendString
	adds r5, r0, #0
_080AAB46:
	adds r0, r4, #0
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	adds r1, r6, #0
	bl DecodeMsgInBuffer
	adds r1, r5, #0
	bl AppendString
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
	bl DecodeMsgInBuffer
	adds r1, r5, #0
	bl AppendString
	adds r5, r0, #0
_080AAB94:
	ldr r4, _080AABCC @ =0x0000118B
	adds r0, r4, #0
	adds r1, r6, #0
	bl DecodeMsgInBuffer
	adds r1, r5, #0
	bl AppendString
	adds r5, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
_080AABAA:
	bl DecodeMsgInBuffer
	adds r1, r5, #0
	bl AppendString
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
	bl GetCharTextLen
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
	bl CallSomeSoundMaybe
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
	bl CallSomeSoundMaybe
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
	bl m4aSongNumStart
_080AAC60:
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	ldr r2, [r4, #0x58]
	bl StartHelpBox_Unk
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
	bl m4aSongNumStart
_080AAC9E:
	bl CloseHelpBox
_080AACA2:
	pop {r0}
	bx r0
	.align 2, 0
_080AACA8: .4byte 0x08B857F8
_080AACAC: .4byte 0x0000030B
_080AACB0: .4byte 0x0202BBF8
_080AACB4: .4byte 0x00000391

	thumb_func_start StartBonusClaimHelpBox
StartBonusClaimHelpBox: @ 0x080AACB8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r3, #0
	ldr r0, _080AACD4 @ =0x08CE4CF8
	bl Proc_StartBlocking
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
	bl TmApplyTsa_thm
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AACFC: .4byte 0x02020140

	thumb_func_start CountDigits
CountDigits: @ 0x080AAD00
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

	thumb_func_start CountSecretSoundRoomSongs
CountSecretSoundRoomSongs: @ 0x080AAD94
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

	thumb_func_start IsSoundRoomSongPlayable
IsSoundRoomSongPlayable: @ 0x080AADCC
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

	thumb_func_start CountDisplayedSoundRoomSongs
CountDisplayedSoundRoomSongs: @ 0x080AADEC
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
	bl LoadAndVerifySoundRoomData
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
	bl CountSecretSoundRoomSongs
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
	bl CountDisplayedSoundRoomSongs
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

	thumb_func_start SoundRoomSongChange_FadeOutPrevious
SoundRoomSongChange_FadeOutPrevious: @ 0x080AAFA0
	push {r4, lr}
	sub sp, #4
	ldr r4, [r0, #0x14]
	movs r1, #0x80
	lsls r1, r1, #1
	str r0, [sp]
	movs r0, #0
	movs r2, #0
	movs r3, #0x78
	bl CallSomeSoundMaybe
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
	bl StartSoundRoomSong
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl DrawSoundRoomSongTitle
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

	thumb_func_start PlayNextShuffledSong
PlayNextShuffledSong: @ 0x080AB00C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AB044 @ =0x08CE5490
	adds r1, r4, #0
	bl Proc_Start
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

	thumb_func_start InitSoundRoomShuffleBuffer
InitSoundRoomShuffleBuffer: @ 0x080AB04C
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
	bl PlayNextShuffledSong
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
	bl StartSoundRoomSong
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AB20E
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl DrawSoundRoomSongTitle
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
	bl StartSoundRoomSong
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AB26E
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl DrawSoundRoomSongTitle
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

	thumb_func_start UpdateVolumeGraphBuffer
UpdateVolumeGraphBuffer: @ 0x080AB288
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

	thumb_func_start InitSoundRoomVolumeGraph
InitSoundRoomVolumeGraph: @ 0x080AB2C0
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
	bl UpdateVolumeGraphBuffer
	lsls r0, r7, #1
	adds r0, r0, r7
	asrs r1, r0, #2
	movs r0, #1
	bl UpdateVolumeGraphBuffer
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
	bl LoadAndVerfyLinkArenaStruct2
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
	bl SetUiSpinningArrowConfig
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
	bl ShowSysHandCursor
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
	bl IsSoundRoomSongPlayable
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
	bl PutTwoSpecialChar
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
	bl PutNumber
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
	bl PutNumber
	ldr r0, _080AB788 @ =0x0201EA90
	adds r1, r4, #0
	adds r1, #8
	bl PutText
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
	bl UnpackUiWindowFrameGraphics
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
	bl SetBlankChr
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
	bl TryDrawSoundRoomSongTitle
	adds r0, r4, #0
	bl ResetSysHandCursor
	movs r0, #0xa0
	lsls r0, r0, #2
	movs r1, #2
	bl DisplaySysHandCursorTextShadow
	adds r0, r4, #0
	bl StartUiSpinningArrows
	movs r1, #0xd0
	lsls r1, r1, #3
	movs r0, #1
	movs r2, #3
	bl LoadUiSpinningArrowGfx
	movs r0, #0x90
	movs r1, #0x38
	movs r2, #0x90
	movs r3, #0x90
	bl SetUiSpinningArrowPositions
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
	bl DrawUiFrame2
	str r5, [sp]
	movs r0, #0xb
	movs r1, #7
	movs r2, #0x11
	movs r3, #0xc
	bl DrawUiFrame2
	str r5, [sp]
	movs r0, #2
	movs r1, #0xb
	movs r2, #9
	movs r3, #8
	bl DrawUiFrame2
	movs r0, #0xb1
	lsls r0, r0, #2
	add r0, sl
	ldr r1, _080ABA88 @ =0x08414884
	movs r2, #0x80
	lsls r2, r2, #5
	mov r8, r2
	bl TmApplyTsa_thm
	str r5, [sp]
	movs r0, #2
	movs r1, #7
	movs r2, #9
	movs r3, #4
	bl DrawUiFrame2
	movs r3, #0xb6
	lsls r3, r3, #1
	add sl, r3
	ldr r1, _080ABA8C @ =0x08414918
	mov r0, sl
	mov r2, r8
	bl TmApplyTsa_thm
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
	bl InitSoundRoomVolumeGraph
	ldr r0, _080ABAAC @ =sub_080AB78C
	adds r1, r4, #0
	bl StartParallelWorker
	ldr r0, _080ABAB0 @ =0x08CE54B4
	adds r1, r4, #0
	bl Proc_Start
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

	thumb_func_start StartSoundRoomSong
StartSoundRoomSong: @ 0x080ABAB4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl MusicProc4Exists
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
	bl CallSomeSoundMaybe
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

	thumb_func_start StopSoundRoomSong
StopSoundRoomSong: @ 0x080ABB00
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	bl MusicProc4Exists
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
	bl CallSomeSoundMaybe
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

	thumb_func_start TryDrawSoundRoomSongTitle
TryDrawSoundRoomSongTitle: @ 0x080ABB38
	push {r4, lr}
	adds r4, r0, #0
	adds r4, #0x35
	ldrb r1, [r4]
	bl IsSoundRoomSongPlayable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080ABB52
	ldrb r0, [r4]
	bl DrawSoundRoomSongTitle
	b _080ABB5A
_080ABB52:
	movs r0, #1
	rsbs r0, r0, #0
	bl DrawSoundRoomSongTitle
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
	bl TryDrawSoundRoomSongTitle
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
	bl StopSoundRoomSong
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
	bl IsSoundRoomSongPlayable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080ABCFC
	ldrb r1, [r5]
	adds r0, r4, #0
	movs r2, #0x20
	bl StartSoundRoomSong
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
	bl m4aSongNumStart
	b _080ABD44
	.align 2, 0
_080ABD14: .4byte 0x0202BBF8
_080ABD18:
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080ABD34
	bl MusicProc4Exists
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
	bl MusicProc4Exists
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080ABD72
	str r0, [sp]
	movs r0, #0x5a
	movs r1, #0
	movs r2, #0xc0
	movs r3, #0x18
	bl CallSomeSoundMaybe
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
	bl EndAllProcChildren
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
	bl PutUiWindowFrame
	ldr r0, [r6]
	movs r1, #4
	str r1, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	movs r1, #0
	movs r2, #7
	movs r3, #9
	bl PutUiWindowFrame
	ldr r0, [r6]
	movs r1, #0xb0
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r1, _080ABFB0 @ =0x08414884
	movs r2, #0x80
	lsls r2, r2, #5
	mov r8, r2
	bl TmApplyTsa_thm
	ldr r0, [r6]
	movs r1, #0xc
	str r1, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	movs r1, #0xa
	movs r2, #7
	movs r3, #0x11
	bl PutUiWindowFrame
	ldr r0, [r6]
	ldr r1, _080ABFB4 @ =0x000004D4
	adds r0, r0, r1
	ldr r1, _080ABFB8 @ =0x08414918
	mov r2, r8
	bl TmApplyTsa_thm
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
	bl TmApplyTsa_thm
	bl HideSysHandCursor
	movs r0, #0
	bl SetUiSpinningArrowConfig
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

	thumb_func_start SoundRoomUi_80AFCE4
SoundRoomUi_80AFCE4: @ 0x080AC070
	push {r4, lr}
	adds r4, r0, #0
	bl TryDrawSoundRoomSongTitle
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

	thumb_func_start SoundRoomUi_80AFD48
SoundRoomUi_80AFD48: @ 0x080AC0D0
	push {lr}
	adds r2, r0, #0
	adds r2, #0x3a
	movs r1, #0
	strb r1, [r2]
	strh r1, [r0, #0x2c]
	bl InitSoundRoomShuffleBuffer
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
	bl PlayNextShuffledSong
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
	bl Proc_StartBlocking
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

	thumb_func_start DrawSoundRoomSongTitle
DrawSoundRoomSongTitle: @ 0x080AC384
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
	bl DecodeMsg
	adds r5, r0, #0
	ldr r4, _080AC3F4 @ =0x0201EA50
	adds r0, r4, #0
	bl SetTextFont
	movs r0, #1
	bl SetTextFontGlyphs
	adds r4, #0x18
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
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
	bl SetObjAffine
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
	bl PutSpriteExt
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

	thumb_func_start DrawSoundRoomVolumeGraphSprites
DrawSoundRoomVolumeGraphSprites: @ 0x080AC4C4
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
	bl PutSpriteExt
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
	bl PutSpriteExt
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
	bl DrawSoundRoomVolumeGraphSprites
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

	thumb_func_start DrawMusicPlayerTime
DrawMusicPlayerTime: @ 0x080AC588
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
	bl PutSpriteExt
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
	bl PutSpriteExt
	adds r1, r6, #0
	adds r1, #0x30
	ldr r3, _080AC618 @ =0x08CE5662
	str r5, [sp]
	movs r0, #0
	adds r2, r7, #0
	bl PutSpriteExt
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
	bl PutSpriteExt
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
	bl PutSpriteExt
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
	bl PutSpriteExt
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
	bl PutSpriteExt
	adds r2, r4, #1
	ands r2, r5
	ldr r3, _080AC770 @ =0x08CE562C
	movs r5, #0x80
	lsls r5, r5, #7
	str r5, [sp]
	movs r0, #0
	movs r1, #0x88
	bl PutSpriteExt
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
	bl PutSpriteExt
	ldrh r2, [r6, #0x2c]
	movs r0, #0x3c
	adds r1, r4, #0
	bl DrawMusicPlayerTime
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
	bl PutSprite
	movs r1, #0
	ldrsb r1, [r6, r1]
	lsls r1, r1, #3
	adds r1, #0x16
	ands r1, r5
	ldr r3, _080AC784 @ =0x08CE55FC
	str r4, [sp]
	movs r0, #0xb
	movs r2, #0x68
	bl PutSprite
	movs r1, #0
	ldrsb r1, [r6, r1]
	lsls r1, r1, #3
	adds r1, #0x16
	ands r1, r5
	ldr r3, _080AC788 @ =0x08CE5604
	str r4, [sp]
	movs r0, #0xb
	movs r2, #0x78
	bl PutSprite
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
	bl Proc_Start
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
	bl ArchiveCurrentPalettes
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
	bl WriteFadedPaletteFromArchive
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
	bl ArchiveCurrentPalettes
	movs r3, #0xff
	lsls r3, r3, #8
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl WriteFadedPaletteFromArchive
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
	bl WriteFadedPaletteFromArchive
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
	bl Proc_Start
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
	bl TmApplyTsa_thm
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
	bl StartSpinRotation
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
	bl PutSpriteExt
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
	bl PutSpriteExt
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
	bl Proc_Start
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
	bl PutSpriteExt
	ldr r0, _080ACAF4 @ =0x08CE45A8
	ldr r3, [r0]
	movs r0, #0x90
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #4
	movs r1, #0x18
	movs r2, #0x10
	bl PutSpriteExt
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
	bl PutChapterTitlePalette
	adds r0, r4, #0
	movs r1, #0x19
	bl PutChapterTitlePalette
	bl EnablePalSync
	movs r0, #0xac
	lsls r0, r0, #4
	bl PutChapterTitleBG
	movs r4, #0xb4
	lsls r4, r4, #4
	adds r0, r5, #0
	bl GetChapterTitle
	adds r1, r0, #0
	adds r0, r4, #0
	bl PutChapterTitleGfx
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
	bl LoadBonusContentData
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
	bl GetBonusContentClaimFlags
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
	bl SaveBonusContentData
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
	bl TmFillRect_thm
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
	bl PutDrawText
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
	bl PutNumberOrBlank
	adds r0, r7, #0
	bl GetItemIconId
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	mov r0, sb
	bl PutIcon
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
	bl PutDrawText
	adds r0, r7, #0
	bl GetItemIconId
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	mov r0, sb
	bl PutIcon
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

	thumb_func_start SetBonusItemClaimed
SetBonusItemClaimed: @ 0x080ACE34
	push {r4, r5, lr}
	ldr r1, _080ACE5C @ =0x08CE577C
	lsls r0, r0, #2
	ldr r4, [r1]
	adds r4, r4, r0
	movs r5, #0
	ldrsb r5, [r4, r5]
	bl GetBonusContentClaimFlags
	adds r1, r0, #0
	movs r0, #1
	lsls r0, r5
	orrs r0, r1
	bl SetBonusContentClaimFlags
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
	bl GetUnitSMSId
	bl UseUnitSprite
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
	bl GetUnitSMSId
	bl UseUnitSprite
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
	bl DrawUiFrame2
	movs r0, #1
	str r0, [sp]
	movs r0, #0x12
	movs r1, #0x11
	movs r2, #0xa
	movs r3, #3
	bl DrawUiFrame2
	ldr r4, _080ACF58 @ =0x02023112
	bl GetGold
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #2
	bl PutNumber
	adds r4, #2
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0x1e
	bl PutSpecialChar
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
	bl TmApplyTsa_thm
	movs r0, #8
	bl EnableBgSync
	bl UnpackUiWindowFrameGraphics
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
	bl StartParallelWorker
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
	bl ResetSysHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl DisplaySysHandCursorTextShadow
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
	bl ShowSysHandCursor
	adds r0, r6, #0
	bl StartGreenText
	adds r0, r6, #0
	bl StartMenuScrollBar
	movs r0, #0xb0
	movs r1, #0x44
	bl PutMenuScrollBarAt
	movs r0, #0x80
	lsls r0, r0, #2
	movs r1, #2
	bl InitMenuScrollBarImg
	ldrh r1, [r6, #0x2c]
	ldr r0, _080AD194 @ =0x08CE5780
	ldr r0, [r0]
	ldrh r2, [r0]
	movs r0, #7
	movs r3, #5
	bl UpdateMenuScrollBarConfig
	adds r0, r6, #0
	bl StartUiCursorHand
	adds r0, r6, #0
	bl sub_080ACE60
	ldr r0, _080AD1A8 @ =0x06013800
	movs r1, #5
	bl LoadHelpBoxGfx
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
	bl GetBonusContentClaimFlags
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
	bl StartBonusClaimHelpBox
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
	bl m4aSongNumStart
	b _080AD402
	.align 2, 0
_080AD260: .4byte 0x0202BBF8
_080AD264: .4byte 0x0000038A
_080AD268:
	ldrb r1, [r1, #2]
	cmp r1, #0x97
	bne _080AD274
	ldr r0, _080AD29C @ =0x00000BB8
	bl AddGold
_080AD274:
	ldr r0, [r7]
	adds r0, r0, r4
	ldrb r0, [r0, #2]
	cmp r0, #0x98
	bne _080AD284
	ldr r0, _080AD2A0 @ =0x00001388
	bl AddGold
_080AD284:
	ldrb r0, [r6]
	bl SetBonusItemClaimed
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
	bl m4aSongNumStart
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
	bl m4aSongNumStart
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
	bl m4aSongNumStart
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
	bl ShowSysHandCursor
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
	bl UpdateMenuScrollBarConfig
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
	bl PutUnitSpriteForClassId
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
	bl PutUnitSpriteForClassId
_080AD468:
	adds r4, #0x10
	adds r5, #1
	adds r0, r6, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r5, r0
	blt _080AD426
_080AD476:
	bl SyncUnitSpriteSheet
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
	bl DrawUiFrame2
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
	bl SetUiCursorHandConfig
	ldr r0, [sp, #4]
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, #0x30
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x58
	movs r2, #8
	bl ShowSysHandCursor
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
	bl GetConvoyItemCount
	adds r5, r0, #0
	cmp r5, #0x64
	bne _080AD592
	movs r7, #1
_080AD592:
	adds r0, r6, #0
	movs r1, #0
	adds r2, r7, #0
	bl Text_SetParams
	ldr r0, _080AD5BC @ =0x0000125A
	bl DecodeMsg
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
	bl GetUnitItemCount
	adds r5, r0, #0
	cmp r5, #5
	bne _080AD5CE
	movs r7, #1
_080AD5CE:
	adds r0, r6, #0
	movs r1, #0
	adds r2, r7, #0
	bl Text_SetParams
	ldr r0, [r4]
	ldrh r0, [r0]
	bl DecodeMsg
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
	bl PutText
	movs r1, #1
	cmp r7, #0
	bne _080AD616
	movs r1, #2
_080AD616:
	ldr r0, [sp, #8]
	adds r2, r5, #0
	bl PutNumber
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
	bl StartParallelWorker
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
	bl SetBonusItemClaimed
	ldrb r0, [r6]
	bl sub_080ACCF4
	ldr r0, [r7]
	ldrb r0, [r0, #4]
	cmp r0, #0x28
	bne _080AD6CC
	adds r0, r5, #0
	bl MakeNewItem
	bl AddItemToConvoy
	b _080AD6DA
_080AD6CC:
	adds r0, r5, #0
	bl MakeNewItem
	adds r1, r0, #0
	adds r0, r7, #0
	bl UnitAddItem
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
	bl StartBonusClaimHelpBox
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
	bl m4aSongNumStart
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
	bl m4aSongNumStart
_080AD794:
	strb r4, [r6]
	lsls r1, r4, #4
	adds r1, #0x30
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x58
	movs r2, #8
	bl ShowSysHandCursor
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
	bl DisableUiCursorHand
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
	bl ShowSysHandCursor
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
	bl ReadLastGameSaveId
	bl WriteGameSave
	movs r0, #0
	str r0, [r4, #0x30]
	bl DisableUiCursorHand
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
	bl ShowSysHandCursor
	adds r0, r5, #0
	bl ClearText
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0
	bl Text_SetParams
	adds r0, r5, #0
	movs r1, #0
	bl Text_SetCursor
	ldr r0, _080AD984 @ =0x000010B3
	add r1, sp, #0xc
	bl DecodeMsgInBuffer
	adds r7, r0, #0
	ldr r0, [sp, #0x2c]
	movs r1, #0
	bl GetItemNameWithArticle
	mov r8, r0
	adds r0, r7, #0
	bl GetStringTextLen
	adds r4, r0, #0
	mov r0, r8
	bl GetStringTextLen
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
	bl PutText
	adds r4, #5
	adds r4, r6, r4
	lsls r4, r4, #1
	movs r0, #0x9e
	lsls r0, r0, #2
	add r0, sl
	adds r4, r4, r0
	ldr r0, [sp, #0x2c]
	bl GetItemIconId
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r4, #0
	bl PutIcon
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
	bl m4aSongNumStart
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
	bl m4aSongNumStart
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
	bl PutUiWindowFrame
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

	thumb_func_start BonusClaim_OnEnd
BonusClaim_OnEnd: @ 0x080ADADC
	push {r4, lr}
	adds r4, r0, #0
	bl EndGreenText
	adds r0, r4, #0
	bl EndAllProcChildren
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
	bl Proc_StartBlocking
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

	thumb_func_start GetSelectedGameOption
GetSelectedGameOption: @ 0x080ADB38
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
	bl Proc_Start
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
	bl DecodeMsg
	adds r3, r0, #0
	ldr r0, [r5]
	adds r0, #0xa8
	ldr r1, _080ADD30 @ =0x020230A8
	movs r2, #0x16
	str r2, [sp]
	str r3, [sp, #4]
	movs r2, #0
	movs r3, #0
	bl PutDrawText
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
	bl DecodeMsg
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
	bl PutDrawText
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
	bl DecodeMsg
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
	bl PutText
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

	thumb_func_start ConfigSprites_Init
ConfigSprites_Init: @ 0x080ADE90
	push {lr}
	movs r0, #1
	movs r1, #0x12
	bl ApplyIconPalette
	movs r0, #0x80
	movs r1, #3
	bl UnpackUiVArrowGfx
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
	bl DisplayFrozenUiHand
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
	bl PutUiHand
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
	bl GetSelectedGameOption
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
	bl UnpackUiWindowFrameGraphics
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
	bl TmApplyTsa_thm
	ldr r1, _080AE1F0 @ =0x00000404
	adds r5, r5, r1
	ldr r1, _080AE1F4 @ =0x0841E204
	adds r0, r5, #0
	adds r2, r4, #0
	bl TmApplyTsa_thm
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
	bl Proc_Start
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

	thumb_func_start WindowColorOptionChangeHandler
WindowColorOptionChangeHandler: @ 0x080AE1FC
	push {lr}
	bl GenericOptionChangeHandler
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AE210
	movs r0, #1
	rsbs r0, r0, #0
	bl UnpackUiWindowFrameGraphics2
_080AE210:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080AE218
sub_080AE218: @ 0x080AE218
	push {r4, lr}
	adds r4, r0, #0
	bl GenericOptionChangeHandler
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

	thumb_func_start GenericOptionChangeHandler
GenericOptionChangeHandler: @ 0x080AE27C
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
	bl Proc_Start
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
	bl m4aSongNumStart
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
	bl m4aSongNumStart
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
	bl m4aSongNumStart
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
	bl Proc_Start
	movs r0, #5
	bl EnableBgSync
	ldr r0, _080AE910 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AE9AC
	ldr r0, _080AE914 @ =0x00000386
	bl m4aSongNumStart
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
	bl EndMuralBackground
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
	bl StartUnitListScreenForSoloAnim
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

	thumb_func_start ColFadeOut_Init
ColFadeOut_Init: @ 0x080AEA0C
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
	bl Proc_StartBlocking
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
	bl Proc_StartBlocking
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
