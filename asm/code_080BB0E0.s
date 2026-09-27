	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BB0E0
sub_080BB0E0: @ 0x080BB0E0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	ldr r1, _080BB19C @ =0x02007018
	ldr r0, [r1, #4]
	str r0, [sp]
	asrs r0, r0, #0x1f
	str r0, [sp, #4]
	ldr r0, [r1]
	str r0, [sp, #8]
	asrs r0, r0, #0x1f
	str r0, [sp, #0xc]
	ldr r0, [r1, #0xc]
	str r0, [sp, #0x10]
	asrs r0, r0, #0x1f
	str r0, [sp, #0x14]
	ldr r0, [r1, #0x10]
	str r0, [sp, #0x18]
	asrs r0, r0, #0x1f
	str r0, [sp, #0x1c]
	ldr r0, [r1, #0x18]
	cmp r0, #0
	bne _080BB1AC
	movs r0, #1
	mov sb, r0
	ldr r1, _080BB1A0 @ =0x080C5A48
	mov sl, r1
	ldr r2, _080BB1A4 @ =0x00000FFF
	mov r8, r2
_080BB120:
	mov r0, sb
	asrs r1, r0, #0x1f
	ldr r2, [sp]
	ldr r3, [sp, #4]
	bl __muldi3
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #0x18
	lsrs r2, r0, #8
	adds r6, r3, #0
	orrs r6, r2
	asrs r7, r1, #8
	ldr r3, _080BB1A8 @ =0x020072B4
	ldr r5, [r3]
	add r5, sb
	movs r4, #0xff
	ands r4, r6
	lsls r0, r4, #1
	add r0, sl
	movs r1, #0
	ldrsh r0, [r0, r1]
	add r0, r8
	asrs r1, r0, #0x1f
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	bl __muldi3
	lsls r3, r1, #0xc
	lsrs r2, r0, #0x14
	adds r0, r3, #0
	orrs r0, r2
	strb r0, [r5]
	ldr r2, _080BB1A8 @ =0x020072B4
	ldr r5, [r2]
	add r5, sb
	adds r5, #0xa0
	adds r4, #0x40
	lsls r4, r4, #1
	add r4, sl
	movs r3, #0
	ldrsh r0, [r4, r3]
	add r0, r8
	asrs r1, r0, #0x1f
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	bl __muldi3
	lsls r3, r1, #0xc
	lsrs r2, r0, #0x14
	adds r0, r3, #0
	orrs r0, r2
	strb r0, [r5]
	movs r0, #2
	add sb, r0
	mov r1, sb
	cmp r1, #0x9f
	ble _080BB120
	b _080BB27E
	.align 2, 0
_080BB19C: .4byte 0x02007018
_080BB1A0: .4byte 0x080C5A48
_080BB1A4: .4byte 0x00000FFF
_080BB1A8: .4byte 0x020072B4
_080BB1AC:
	adds r2, r0, #0
	muls r2, r0, r2
	mov sl, r2
	movs r3, #9
	mov sb, r3
_080BB1B6:
	ldr r1, _080BB29C @ =0x02007018
	ldr r0, [r1, #0x14]
	mov r2, sb
	subs r0, r0, r2
	adds r3, r0, #0
	muls r3, r0, r3
	adds r0, r3, #0
	mov r1, sl
	subs r0, r1, r0
	lsls r0, r0, #8
	bl __divsi3
	mov r8, r0
	cmp r0, #0
	ble _080BB274
	mov r0, sb
	asrs r1, r0, #0x1f
	ldr r2, [sp]
	ldr r3, [sp, #4]
	bl __muldi3
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #0x18
	lsrs r2, r0, #8
	adds r6, r3, #0
	orrs r6, r2
	asrs r7, r1, #8
	movs r1, #0xff
	ands r1, r6
	adds r0, r1, #0
	adds r0, #0x40
	lsls r0, r0, #1
	ldr r3, _080BB2A0 @ =0x080C5A48
	adds r0, r0, r3
	movs r2, #0
	ldrsh r0, [r0, r2]
	ldr r3, _080BB2A4 @ =0x00000FFF
	adds r0, r0, r3
	adds r6, r0, #0
	asrs r7, r0, #0x1f
	lsls r1, r1, #1
	ldr r0, _080BB2A0 @ =0x080C5A48
	adds r1, r1, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	adds r0, r0, r3
	str r0, [sp, #0x20]
	asrs r0, r0, #0x1f
	str r0, [sp, #0x24]
	adds r1, r7, #0
	adds r0, r6, #0
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	bl __muldi3
	mov r4, r8
	asrs r5, r4, #0x1f
	adds r3, r5, #0
	adds r2, r4, #0
	bl __muldi3
	lsls r3, r1, #4
	lsrs r2, r0, #0x1c
	adds r6, r3, #0
	orrs r6, r2
	asrs r7, r1, #0x1c
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x24]
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	bl __muldi3
	adds r3, r5, #0
	adds r2, r4, #0
	bl __muldi3
	lsls r3, r1, #4
	lsrs r2, r0, #0x1c
	orrs r3, r2
	str r3, [sp, #0x20]
	asrs r0, r1, #0x1c
	str r0, [sp, #0x24]
	ldr r1, _080BB2A8 @ =0x020072B4
	ldr r0, [r1]
	add r0, sb
	strb r6, [r0]
	ldr r0, [r1]
	add r0, sb
	adds r0, #0xa0
	add r3, sp, #0x20
	ldrb r3, [r3]
	strb r3, [r0]
_080BB274:
	movs r0, #2
	add sb, r0
	mov r1, sb
	cmp r1, #0x7f
	ble _080BB1B6
_080BB27E:
	bl SwapOpScanlineBufs
	ldr r0, _080BB29C @ =0x02007018
	ldr r1, [r0]
	ldr r2, [r0, #8]
	adds r1, r1, r2
	str r1, [r0]
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BB29C: .4byte 0x02007018
_080BB2A0: .4byte 0x080C5A48
_080BB2A4: .4byte 0x00000FFF
_080BB2A8: .4byte 0x020072B4

	thumb_func_start sub_080BB2AC
sub_080BB2AC: @ 0x080BB2AC
	push {r4, lr}
	sub sp, #4
	ldr r0, _080BB2FC @ =0x00100010
	str r0, [sp]
	ldr r4, _080BB300 @ =0x02007300
	ldr r2, _080BB304 @ =0x01000080
	mov r0, sp
	adds r1, r4, #0
	bl CpuFastSet
	ldr r0, _080BB308 @ =0x02007500
	str r4, [r0]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r4, r4, r1
	str r4, [r0, #4]
	ldr r0, _080BB30C @ =0x02007508
	movs r4, #0
	str r4, [r0]
	bl InitOpScanlineBuf
	ldr r0, _080BB310 @ =0x0200751C
	movs r1, #0xa0
	str r1, [r0]
	ldr r0, _080BB314 @ =0x02007520
	str r1, [r0]
	ldr r1, _080BB318 @ =0x02007018
	str r4, [r1, #0x18]
	movs r0, #0x50
	str r0, [r1, #0x14]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r1, #4]
	movs r0, #0x80
	lsls r0, r0, #3
	str r0, [r1, #8]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BB2FC: .4byte 0x00100010
_080BB300: .4byte 0x02007300
_080BB304: .4byte 0x01000080
_080BB308: .4byte 0x02007500
_080BB30C: .4byte 0x02007508
_080BB310: .4byte 0x0200751C
_080BB314: .4byte 0x02007520
_080BB318: .4byte 0x02007018

	thumb_func_start sub_080BB31C
sub_080BB31C: @ 0x080BB31C
	ldr r0, _080BB328 @ =0x02007500
	ldr r2, [r0]
	ldr r1, [r0, #4]
	str r1, [r0]
	str r2, [r0, #4]
	bx lr
	.align 2, 0
_080BB328: .4byte 0x02007500

	thumb_func_start sub_080BB32C
sub_080BB32C: @ 0x080BB32C
	push {lr}
	ldr r0, _080BB34C @ =0x02007508
	ldr r0, [r0]
	lsls r0, r0, #3
	asrs r0, r0, #6
	movs r1, #0x80
	lsls r1, r1, #5
	adds r0, r0, r1
	ldr r1, _080BB350 @ =0x02007500
	ldr r1, [r1]
	strh r0, [r1]
	bl sub_080BB31C
	pop {r0}
	bx r0
	.align 2, 0
_080BB34C: .4byte 0x02007508
_080BB350: .4byte 0x02007500

	thumb_func_start HBlank_80BBDD0
HBlank_80BBDD0: @ 0x080BB354
	push {r4, r5, r6, lr}
	ldr r0, _080BB4A4 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x9f
	bls _080BB366
	movs r4, #0
_080BB366:
	movs r1, #1
	adds r0, r4, #0
	ands r0, r1
	ldr r6, _080BB4A8 @ =0x03001620
	cmp r0, #0
	beq _080BB3EC
	ldr r0, [r6]
	ands r0, r1
	cmp r0, #0
	beq _080BB38E
	ldr r2, _080BB4AC @ =0x04000010
	ldr r0, _080BB4B0 @ =0x020072B4
	ldr r0, [r0, #4]
	adds r0, r0, r4
	ldrb r1, [r0]
	strh r1, [r2]
	ldr r1, _080BB4B4 @ =0x04000012
	adds r0, #0xa0
	ldrb r0, [r0]
	strh r0, [r1]
_080BB38E:
	ldr r5, [r6]
	movs r0, #2
	ands r0, r5
	adds r3, r5, #0
	cmp r0, #0
	beq _080BB3AE
	ldr r2, _080BB4B8 @ =0x04000014
	ldr r0, _080BB4B0 @ =0x020072B4
	ldr r0, [r0, #4]
	adds r0, r0, r4
	ldrb r1, [r0]
	strh r1, [r2]
	ldr r1, _080BB4BC @ =0x04000016
	adds r0, #0xa0
	ldrb r0, [r0]
	strh r0, [r1]
_080BB3AE:
	movs r0, #4
	ands r3, r0
	cmp r3, #0
	beq _080BB3D0
	ldr r2, _080BB4C0 @ =0x04000018
	ldr r0, _080BB4B0 @ =0x020072B4
	ldr r0, [r0, #4]
	adds r0, r0, r4
	ldrb r1, [r0]
	strh r1, [r2]
	adds r2, #2
	adds r0, #0xa0
	ldr r1, _080BB4C4 @ =0x03002870
	ldrb r0, [r0]
	ldrh r1, [r1, #0x26]
	adds r0, r0, r1
	strh r0, [r2]
_080BB3D0:
	movs r0, #8
	ands r5, r0
	cmp r5, #0
	beq _080BB3EC
	ldr r2, _080BB4C8 @ =0x0400001C
	ldr r0, _080BB4B0 @ =0x020072B4
	ldr r0, [r0, #4]
	adds r0, r0, r4
	ldrb r1, [r0]
	strh r1, [r2]
	ldr r1, _080BB4CC @ =0x0400001E
	adds r0, #0xa0
	ldrb r0, [r0]
	strh r0, [r1]
_080BB3EC:
	ldr r0, [r6]
	movs r1, #0xc0
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080BB462
	cmp r4, #0x83
	bne _080BB410
	ldr r1, _080BB4D0 @ =0x04000050
	movs r2, #0xf4
	lsls r2, r2, #4
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	movs r3, #0x80
	lsls r3, r3, #5
	adds r0, r3, #0
	strh r0, [r1]
_080BB410:
	cmp r4, #0x83
	bls _080BB444
	cmp r4, #0x93
	bhi _080BB430
	adds r1, r4, #0
	subs r1, #0x84
	ldr r0, _080BB4D4 @ =0x020072BC
	ldr r0, [r0]
	muls r1, r0, r1
	asrs r1, r1, #4
	ldr r2, _080BB4D8 @ =0x04000052
	movs r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #8
	adds r1, r1, r0
	strh r1, [r2]
_080BB430:
	cmp r4, #0x94
	bne _080BB444
	ldr r2, _080BB4D8 @ =0x04000052
	ldr r0, _080BB4D4 @ =0x020072BC
	ldr r1, [r0]
	movs r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #8
	adds r1, r1, r0
	strh r1, [r2]
_080BB444:
	cmp r4, #0
	bne _080BB462
	ldr r2, _080BB4D0 @ =0x04000050
	ldr r1, _080BB4DC @ =0x030028AC
	ldrh r0, [r1]
	strh r0, [r2]
	adds r2, #2
	ldrb r3, [r1, #9]
	lsls r0, r3, #8
	ldrb r3, [r1, #8]
	orrs r0, r3
	strh r0, [r2]
	adds r2, #2
	ldrb r0, [r1, #0xa]
	strh r0, [r2]
_080BB462:
	ldr r0, [r6]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080BB47A
	ldr r0, _080BB4BC @ =0x04000016
	movs r1, #1
	ands r1, r4
	lsrs r2, r4, #1
	adds r1, r1, r2
	rsbs r1, r1, #0
	strh r1, [r0]
_080BB47A:
	ldr r0, [r6]
	movs r1, #0x60
	ands r0, r1
	cmp r0, #0
	beq _080BB49E
	cmp r4, #0x9f
	bne _080BB490
	ldr r1, _080BB4D0 @ =0x04000050
	ldr r2, _080BB4E0 @ =0x00000441
	adds r0, r2, #0
	strh r0, [r1]
_080BB490:
	cmp r4, #1
	bne _080BB49E
	ldr r1, _080BB4D8 @ =0x04000052
	ldr r0, _080BB4E4 @ =0x02007500
	ldr r0, [r0, #4]
	ldrh r0, [r0]
	strh r0, [r1]
_080BB49E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BB4A4: .4byte 0x04000006
_080BB4A8: .4byte 0x03001620
_080BB4AC: .4byte 0x04000010
_080BB4B0: .4byte 0x020072B4
_080BB4B4: .4byte 0x04000012
_080BB4B8: .4byte 0x04000014
_080BB4BC: .4byte 0x04000016
_080BB4C0: .4byte 0x04000018
_080BB4C4: .4byte 0x03002870
_080BB4C8: .4byte 0x0400001C
_080BB4CC: .4byte 0x0400001E
_080BB4D0: .4byte 0x04000050
_080BB4D4: .4byte 0x020072BC
_080BB4D8: .4byte 0x04000052
_080BB4DC: .4byte 0x030028AC
_080BB4E0: .4byte 0x00000441
_080BB4E4: .4byte 0x02007500

	thumb_func_start sub_080BB4E8
sub_080BB4E8: @ 0x080BB4E8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _080BB518 @ =0x03001620
	movs r4, #0
	str r4, [r0]
	ldr r0, _080BB51C @ =0x020072BC
	str r4, [r0]
	bl sub_080BB2AC
	bl InitOpScanlineBuf
	bl sub_080BB070
	movs r0, #0
	bl SetOnHBlankA
	ldr r0, _080BB520 @ =HBlank_80BBDD0
	bl SetOnHBlankA
	adds r5, #0x4c
	strh r4, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BB518: .4byte 0x03001620
_080BB51C: .4byte 0x020072BC
_080BB520: .4byte HBlank_80BBDD0

	thumb_func_start sub_080BB524
sub_080BB524: @ 0x080BB524
	push {lr}
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0

	thumb_func_start sub_080BB530
sub_080BB530: @ 0x080BB530
	push {r4, r5, lr}
	sub sp, #0x28
	adds r4, r0, #0
	ldr r0, _080BB550 @ =0x03001620
	ldr r1, [r0]
	movs r0, #0xe0
	lsls r0, r0, #4
	ands r1, r0
	cmp r1, #0
	beq _080BB554
	adds r0, r4, #0
	adds r0, #0x4c
	ldrh r1, [r0]
	adds r1, #1
	b _080BB558
	.align 2, 0
_080BB550: .4byte 0x03001620
_080BB554:
	adds r0, r4, #0
	adds r0, #0x4c
_080BB558:
	strh r1, [r0]
	adds r5, r0, #0
	ldr r0, _080BB5A0 @ =0x03001620
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _080BB5AC
	ldrh r1, [r5]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _080BB5E8
	ldr r3, _080BB5A4 @ =0x08CEF084
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	adds r0, r1, #0
	movs r2, #0xf
	ands r0, r2
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r0, [r0]
	ldr r3, _080BB5A8 @ =0x08CEF0C4
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r2, [r1]
	str r4, [sp]
	movs r1, #0x70
	movs r3, #0x20
	bl sub_080BD424
	b _080BB5E8
	.align 2, 0
_080BB5A0: .4byte 0x03001620
_080BB5A4: .4byte 0x08CEF084
_080BB5A8: .4byte 0x08CEF0C4
_080BB5AC:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r1, r0
	cmp r1, #0
	beq _080BB5E8
	ldrh r1, [r5]
	movs r0, #0x1f
	ands r0, r1
	cmp r0, #0
	bne _080BB5E8
	ldr r3, _080BB66C @ =0x08CEF084
	lsls r1, r1, #0x10
	asrs r0, r1, #0x15
	movs r2, #0xf
	ands r0, r2
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r0, [r0]
	ldr r3, _080BB670 @ =0x08CEF0C4
	asrs r1, r1, #0x14
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r2, [r1]
	str r4, [sp]
	movs r1, #0x70
	movs r3, #0x20
	bl sub_080BD424
_080BB5E8:
	ldr r0, _080BB674 @ =0x03001620
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _080BB63A
	add r0, sp, #8
	ldr r1, _080BB678 @ =0x08677304
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	ldm r1!, {r2, r3}
	stm r0!, {r2, r3}
	ldrh r2, [r5]
	movs r0, #0xf
	ands r0, r2
	cmp r0, #0
	bne _080BB63A
	ldr r0, _080BB67C @ =0x086740B4
	lsls r2, r2, #0x10
	asrs r2, r2, #0x14
	movs r3, #7
	adds r1, r2, #0
	ands r1, r3
	lsls r1, r1, #2
	add r1, sp
	adds r1, #8
	ldr r1, [r1]
	movs r3, #0xe6
	lsls r3, r3, #6
	movs r4, #1
	ands r2, r4
	adds r2, #1
	str r2, [sp]
	movs r2, #0xa
	str r2, [sp, #4]
	movs r2, #0x50
	bl StartSpriteAnimProc
_080BB63A:
	ldr r4, _080BB674 @ =0x03001620
	ldr r0, [r4]
	movs r1, #0xf
	ands r0, r1
	cmp r0, #0
	beq _080BB64A
	bl sub_080BB0E0
_080BB64A:
	ldr r1, [r4]
	movs r0, #0xc0
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080BB698
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080BB684
	ldr r1, _080BB680 @ =0x020072BC
	ldr r0, [r1]
	cmp r0, #0
	ble _080BB698
	subs r0, #1
	b _080BB696
	.align 2, 0
_080BB66C: .4byte 0x08CEF084
_080BB670: .4byte 0x08CEF0C4
_080BB674: .4byte 0x03001620
_080BB678: .4byte 0x08677304
_080BB67C: .4byte 0x086740B4
_080BB680: .4byte 0x020072BC
_080BB684:
	movs r0, #0x80
	ands r1, r0
	cmp r1, #0
	beq _080BB698
	ldr r1, _080BB6C0 @ =0x020072BC
	ldr r0, [r1]
	cmp r0, #0xf
	bgt _080BB698
	adds r0, #1
_080BB696:
	str r0, [r1]
_080BB698:
	ldr r3, _080BB6C4 @ =0x03001620
	ldr r1, [r3]
	movs r0, #0x60
	ands r0, r1
	cmp r0, #0
	beq _080BB724
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080BB6EC
	ldr r2, _080BB6C8 @ =0x02007508
	ldr r0, [r2]
	cmp r0, #0
	bne _080BB6CC
	movs r0, #0x65
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r3]
	b _080BB706
	.align 2, 0
_080BB6C0: .4byte 0x020072BC
_080BB6C4: .4byte 0x03001620
_080BB6C8: .4byte 0x02007508
_080BB6CC:
	cmp r0, #0
	ble _080BB706
	subs r0, #1
	str r0, [r2]
	cmp r0, #0
	bne _080BB706
	ldr r0, _080BB6E8 @ =0x02022C60
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	b _080BB706
	.align 2, 0
_080BB6E8: .4byte 0x02022C60
_080BB6EC:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080BB706
	movs r0, #4
	orrs r1, r0
	str r1, [r3]
	ldr r1, _080BB754 @ =0x02007508
	ldr r0, [r1]
	cmp r0, #0x3f
	bgt _080BB706
	adds r0, #1
	str r0, [r1]
_080BB706:
	ldr r2, _080BB758 @ =0x02007018
	ldr r0, _080BB75C @ =0x0200751C
	ldr r1, _080BB754 @ =0x02007508
	ldr r0, [r0]
	ldr r1, [r1]
	muls r0, r1, r0
	asrs r0, r0, #6
	str r0, [r2, #0xc]
	ldr r0, _080BB760 @ =0x02007520
	ldr r0, [r0]
	muls r0, r1, r0
	asrs r0, r0, #6
	str r0, [r2, #0x10]
	bl sub_080BB32C
_080BB724:
	ldr r2, _080BB764 @ =0x0200750C
	ldr r4, _080BB768 @ =0x080C5A48
	ldrb r1, [r2]
	adds r0, r1, #0
	adds r0, #0x40
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r3, #0
	ldrsh r0, [r0, r3]
	ldr r3, [r2, #4]
	muls r0, r3, r0
	asrs r0, r0, #4
	str r0, [r2, #8]
	lsls r1, r1, #1
	adds r1, r1, r4
	movs r4, #0
	ldrsh r0, [r1, r4]
	muls r0, r3, r0
	asrs r0, r0, #4
	str r0, [r2, #0xc]
	add sp, #0x28
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BB754: .4byte 0x02007508
_080BB758: .4byte 0x02007018
_080BB75C: .4byte 0x0200751C
_080BB760: .4byte 0x02007520
_080BB764: .4byte 0x0200750C
_080BB768: .4byte 0x080C5A48

	thumb_func_start sub_080BB76C
sub_080BB76C: @ 0x080BB76C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, _080BB7D0 @ =0x03001620
	ldr r0, [r0]
	movs r1, #0xc0
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080BB79A
	movs r4, #0
	movs r5, #0xbc
	lsls r5, r5, #5
_080BB786:
	lsls r1, r4, #6
	str r5, [sp]
	movs r0, #4
	ldr r2, _080BB7D4 @ =0x00000484
	ldr r3, _080BB7D8 @ =0x08B90600
	bl PutSpriteExt
	adds r4, #1
	cmp r4, #3
	ble _080BB786
_080BB79A:
	adds r0, r6, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080BB7E0
	ldr r4, _080BB7DC @ =0x08CEF490
	movs r0, #0x90
	lsls r0, r0, #5
	str r0, [sp]
	movs r0, #4
	movs r1, #8
	movs r2, #0x80
	adds r3, r4, #0
	bl PutSpriteExt
	movs r0, #0x92
	lsls r0, r0, #5
	str r0, [sp]
	movs r0, #4
	movs r1, #8
	movs r2, #0x90
	adds r3, r4, #0
	bl PutSpriteExt
	b _080BB7F2
	.align 2, 0
_080BB7D0: .4byte 0x03001620
_080BB7D4: .4byte 0x00000484
_080BB7D8: .4byte 0x08B90600
_080BB7DC: .4byte 0x08CEF490
_080BB7E0:
	ldr r3, _080BB7FC @ =0x08CEF490
	movs r0, #0x90
	lsls r0, r0, #5
	str r0, [sp]
	movs r0, #4
	movs r1, #8
	movs r2, #0x90
	bl PutSpriteExt
_080BB7F2:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BB7FC: .4byte 0x08CEF490

	thumb_func_start sub_080BB800
sub_080BB800: @ 0x080BB800
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08002C74
	adds r4, #0x44
	movs r0, #1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080BB814
sub_080BB814: @ 0x080BB814
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	bx lr

	thumb_func_start sub_080BB81C
sub_080BB81C: @ 0x080BB81C
	push {r4, r5, r6, lr}
	sub sp, #0x24
	adds r6, r0, #0
	ldr r1, _080BB8DC @ =0x08677324
	mov r0, sp
	movs r2, #0x18
	bl memcpy
	mov r0, sp
	bl InitBgs
	movs r0, #1
	bl FadeBgmOut
	movs r4, #0
	str r4, [sp, #0x18]
	add r0, sp, #0x18
	movs r1, #0xc0
	lsls r1, r1, #0x13
	ldr r5, _080BB8E0 @ =0x01000008
	adds r2, r5, #0
	bl CpuFastSet
	str r4, [sp, #0x1c]
	add r0, sp, #0x1c
	ldr r1, _080BB8E4 @ =0x06008000
	adds r2, r5, #0
	bl CpuFastSet
	str r4, [sp, #0x20]
	add r0, sp, #0x20
	ldr r1, _080BB8E8 @ =0x06010000
	adds r2, r5, #0
	bl CpuFastSet
	ldr r5, _080BB8EC @ =0x02022860
	movs r4, #0x1f
_080BB866:
	ldr r0, _080BB8F0 @ =0x086005C4
	adds r1, r5, #0
	movs r2, #8
	bl CpuFastSet
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _080BB866
	bl EnablePalSync
	ldr r4, _080BB8F4 @ =0x03002870
	adds r3, r4, #0
	adds r3, #0x3c
	movs r1, #0x3f
	ldrb r0, [r3]
	ands r1, r0
	adds r2, r4, #0
	adds r2, #0x44
	movs r0, #0
	strb r0, [r2]
	adds r2, #1
	strb r0, [r2]
	adds r2, #1
	strb r0, [r2]
	movs r0, #0x20
	orrs r1, r0
	strb r1, [r3]
	adds r1, r4, #0
	adds r1, #0x3d
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
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
	movs r0, #2
	bl ResetTitleBgAffin
	bl sub_08002CA4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080BB8F8
	adds r0, r6, #0
	bl sub_080BB800
	b _080BB8FE
	.align 2, 0
_080BB8DC: .4byte 0x08677324
_080BB8E0: .4byte 0x01000008
_080BB8E4: .4byte 0x06008000
_080BB8E8: .4byte 0x06010000
_080BB8EC: .4byte 0x02022860
_080BB8F0: .4byte 0x086005C4
_080BB8F4: .4byte 0x03002870
_080BB8F8:
	adds r0, r6, #0
	bl sub_080BB814
_080BB8FE:
	adds r0, r6, #0
	bl sub_080BC5B8
	ldr r4, _080BB95C @ =0x085EE004
	ldr r1, _080BB960 @ =0x06017000
	adds r0, r4, #0
	bl Decompress
	ldr r1, _080BB964 @ =0x06017400
	adds r0, r4, #0
	bl Decompress
	ldr r1, _080BB968 @ =0x06017800
	adds r0, r4, #0
	bl Decompress
	ldr r1, _080BB96C @ =0x06017C00
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080BB970 @ =0x08616FC4
	ldr r1, _080BB974 @ =0x08CEF078
	ldr r1, [r1]
	bl Decompress
	ldr r0, _080BB978 @ =0x086758E0
	ldr r1, _080BB97C @ =0x08CEF07C
	ldr r1, [r1]
	bl Decompress
	ldr r0, _080BB980 @ =0x0867453C
	ldr r1, _080BB984 @ =0x08CEF080
	ldr r1, [r1]
	bl Decompress
	ldr r0, _080BB988 @ =0x08CEF0E4
	adds r1, r6, #0
	bl Proc_Start
	movs r0, #3
	bl SetNextGameAction
	add sp, #0x24
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BB95C: .4byte 0x085EE004
_080BB960: .4byte 0x06017000
_080BB964: .4byte 0x06017400
_080BB968: .4byte 0x06017800
_080BB96C: .4byte 0x06017C00
_080BB970: .4byte 0x08616FC4
_080BB974: .4byte 0x08CEF078
_080BB978: .4byte 0x086758E0
_080BB97C: .4byte 0x08CEF07C
_080BB980: .4byte 0x0867453C
_080BB984: .4byte 0x08CEF080
_080BB988: .4byte 0x08CEF0E4

	thumb_func_start sub_080BB98C
sub_080BB98C: @ 0x080BB98C
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _080BBA14 @ =0x03002870
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ldrb r3, [r1, #0xc]
	ands r0, r3
	movs r3, #2
	orrs r0, r3
	strb r0, [r1, #0xc]
	adds r0, r2, #0
	ldrb r5, [r1, #0x10]
	ands r0, r5
	orrs r0, r3
	strb r0, [r1, #0x10]
	movs r0, #3
	ldrb r3, [r1, #0x14]
	orrs r0, r3
	strb r0, [r1, #0x14]
	ldrb r5, [r1, #0x18]
	ands r2, r5
	strb r2, [r1, #0x18]
	ldr r0, _080BBA18 @ =0x085ECDF4
	movs r1, #0xa0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BBA1C @ =0x085ECE14
	ldr r1, _080BBA20 @ =0x0600C000
	bl Decompress
	ldr r0, _080BBA24 @ =0x02024460
	ldr r1, _080BBA28 @ =0x085ED0DC
	movs r2, #0xa2
	lsls r2, r2, #8
	bl sub_080AACD8
	movs r0, #8
	bl EnableBgSync
	movs r0, #0
	str r0, [r4, #0x2c]
	ldr r0, _080BBA2C @ =0x08CEFA38
	movs r2, #1
	rsbs r2, r2, #0
	str r4, [sp]
	movs r1, #2
	movs r3, #0
	bl sub_080BD764
	str r0, [r4, #0x40]
	ldr r0, _080BBA30 @ =0x08673D38
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BBA34 @ =0x08673D58
	ldr r1, _080BBA38 @ =0x06013000
	bl Decompress
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BBA14: .4byte 0x03002870
_080BBA18: .4byte 0x085ECDF4
_080BBA1C: .4byte 0x085ECE14
_080BBA20: .4byte 0x0600C000
_080BBA24: .4byte 0x02024460
_080BBA28: .4byte 0x085ED0DC
_080BBA2C: .4byte 0x08CEFA38
_080BBA30: .4byte 0x08673D38
_080BBA34: .4byte 0x08673D58
_080BBA38: .4byte 0x06013000

	thumb_func_start sub_080BBA3C
sub_080BBA3C: @ 0x080BBA3C
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x2c]
	adds r2, #1
	str r2, [r4, #0x2c]
	ldr r0, _080BBAB4 @ =0x03002870
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	asrs r2, r2, #1
	movs r0, #0x10
	subs r0, r0, r2
	mov r1, ip
	adds r1, #0x44
	movs r3, #0
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r3, [r0]
	ldr r0, _080BBAB8 @ =0x0000FFE0
	mov r3, ip
	ldrh r3, [r3, #0x3c]
	ands r0, r3
	movs r1, #8
	orrs r0, r1
	ldr r1, _080BBABC @ =0x0000E0FF
	ands r0, r1
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	orrs r0, r1
	mov r1, ip
	strh r0, [r1, #0x3c]
	cmp r2, #0x10
	bne _080BBAAC
	ldr r0, _080BBAC0 @ =0x02024460
	movs r1, #0
	bl TmFill
	movs r0, #8
	bl EnableBgSync
	adds r0, r4, #0
	bl Proc_Break
	adds r0, r4, #0
	bl sub_080BD548
_080BBAAC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BBAB4: .4byte 0x03002870
_080BBAB8: .4byte 0x0000FFE0
_080BBABC: .4byte 0x0000E0FF
_080BBAC0: .4byte 0x02024460

	thumb_func_start OpAnim_DrawWater
OpAnim_DrawWater: @ 0x080BBAC4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080BBB14 @ =0x08600544
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BBB18 @ =0x085FF1D4
	ldr r1, _080BBB1C @ =0x06008000
	bl Decompress
	ldr r0, _080BBB20 @ =0x02022C60
	ldr r1, _080BBB24 @ =0x0860029C
	movs r2, #0xe0
	lsls r2, r2, #8
	bl sub_080AACD8
	ldr r2, _080BBB28 @ =0x03002870
	movs r0, #0x3f
	ldrb r1, [r2, #0xd]
	ands r0, r1
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2, #0xd]
	movs r0, #1
	bl EnableBgSync
	bl InitOpScanlineBuf
	ldr r2, _080BBB2C @ =0x03001620
	ldr r0, [r2]
	movs r1, #1
	orrs r0, r1
	str r0, [r2]
	movs r0, #0
	str r0, [r4, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BBB14: .4byte 0x08600544
_080BBB18: .4byte 0x085FF1D4
_080BBB1C: .4byte 0x06008000
_080BBB20: .4byte 0x02022C60
_080BBB24: .4byte 0x0860029C
_080BBB28: .4byte 0x03002870
_080BBB2C: .4byte 0x03001620

	thumb_func_start sub_080BBB30
sub_080BBB30: @ 0x080BBB30
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x2c]
	adds r2, #1
	str r2, [r4, #0x2c]
	ldr r0, _080BBB98 @ =0x03002870
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	asrs r2, r2, #2
	mov r0, ip
	adds r0, #0x44
	movs r3, #0
	strb r2, [r0]
	movs r0, #0x10
	subs r0, r0, r2
	mov r1, ip
	adds r1, #0x45
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r3, [r0]
	ldr r0, _080BBB9C @ =0x0000FFE0
	mov r5, ip
	ldrh r5, [r5, #0x3c]
	ands r0, r5
	movs r1, #1
	orrs r0, r1
	ldr r1, _080BBBA0 @ =0x0000E0FF
	ands r0, r1
	movs r5, #0xf8
	lsls r5, r5, #5
	adds r1, r5, #0
	orrs r0, r1
	mov r1, ip
	strh r0, [r1, #0x3c]
	cmp r2, #0x10
	bne _080BBB90
	str r3, [r4, #0x2c]
	adds r0, r4, #0
	bl Proc_Break
_080BBB90:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BBB98: .4byte 0x03002870
_080BBB9C: .4byte 0x0000FFE0
_080BBBA0: .4byte 0x0000E0FF

	thumb_func_start sub_080BBBA4
sub_080BBBA4: @ 0x080BBBA4
	push {lr}
	ldr r0, _080BBBB4 @ =0x086005A4
	movs r1, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r0}
	bx r0
	.align 2, 0
_080BBBB4: .4byte 0x086005A4

	thumb_func_start sub_080BBBB8
sub_080BBBB8: @ 0x080BBBB8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0x5c
	movs r1, #0x1e
	movs r2, #0
	bl StartBgmExt
	ldr r6, _080BBC4C @ =0x03002870
	movs r0, #4
	rsbs r0, r0, #0
	ldrb r1, [r6, #0xc]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r6, #0xc]
	movs r0, #3
	ldrb r1, [r6, #0x10]
	orrs r1, r0
	strb r1, [r6, #0x10]
	ldrb r1, [r6, #0x14]
	orrs r1, r0
	strb r1, [r6, #0x14]
	ldrb r2, [r6, #0x18]
	orrs r0, r2
	strb r0, [r6, #0x18]
	ldr r0, _080BBC50 @ =0x085E9D2C
	movs r1, #0x88
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #4
	bl EnableBgSync
	movs r4, #0
	str r4, [r5, #0x2c]
	adds r0, r5, #0
	adds r0, #0x3c
	strb r4, [r0]
	bl sub_080BCAFC
	bl EndAllParallelWorkers
	ldr r0, _080BBC54 @ =sub_080BB76C
	adds r1, r5, #0
	bl StartParallelWorker
	adds r0, r5, #0
	bl sub_080BCE20
	adds r1, r6, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x44
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r2, _080BBC58 @ =0x03001620
	ldr r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	str r0, [r2]
	str r4, [r5, #0x30]
	str r4, [r5, #0x38]
	str r4, [r5, #0x34]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BBC4C: .4byte 0x03002870
_080BBC50: .4byte 0x085E9D2C
_080BBC54: .4byte sub_080BB76C
_080BBC58: .4byte 0x03001620

	thumb_func_start sub_080BBC5C
sub_080BBC5C: @ 0x080BBC5C
	push {lr}
	sub sp, #8
	ldr r0, _080BBC7C @ =0x086740B4
	movs r3, #0xe6
	lsls r3, r3, #6
	movs r1, #0
	str r1, [sp]
	movs r1, #0xa
	str r1, [sp, #4]
	movs r1, #0x78
	movs r2, #0x50
	bl StartSpriteAnimProc
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
_080BBC7C: .4byte 0x086740B4

	thumb_func_start sub_080BBC80
sub_080BBC80: @ 0x080BBC80
	push {r4, lr}
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r4, _080BBD08 @ =0x02022C60
	adds r0, r4, #0
	movs r1, #0
	bl TmFill
	ldr r0, _080BBD0C @ =0x0867451C
	movs r1, #0xd0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BBD10 @ =0x08CEF080
	ldr r0, [r0]
	ldr r1, _080BBD14 @ =0x06008000
	movs r2, #0x80
	lsls r2, r2, #4
	bl CpuFastSet
	ldr r1, _080BBD18 @ =0x086756A0
	movs r2, #0xd0
	lsls r2, r2, #8
	adds r0, r4, #0
	bl sub_080AACD8
	movs r0, #1
	bl EnableBgSync
	ldr r3, _080BBD1C @ =0x03002870
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
	strb r1, [r0]
	adds r2, #9
	movs r0, #0x10
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x46
	strb r1, [r0]
	ldr r0, _080BBD20 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #1
	orrs r0, r1
	ldr r1, _080BBD24 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf8
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BBD08: .4byte 0x02022C60
_080BBD0C: .4byte 0x0867451C
_080BBD10: .4byte 0x08CEF080
_080BBD14: .4byte 0x06008000
_080BBD18: .4byte 0x086756A0
_080BBD1C: .4byte 0x03002870
_080BBD20: .4byte 0x0000FFE0
_080BBD24: .4byte 0x0000E0FF

	thumb_func_start sub_080BBD28
sub_080BBD28: @ 0x080BBD28
	push {r4, lr}
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r4, _080BBDB0 @ =0x02022C60
	adds r0, r4, #0
	movs r1, #0
	bl TmFill
	ldr r0, _080BBDB4 @ =0x086758C0
	movs r1, #0xd0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BBDB8 @ =0x08CEF07C
	ldr r0, [r0]
	ldr r1, _080BBDBC @ =0x06008000
	movs r2, #0x80
	lsls r2, r2, #4
	bl CpuFastSet
	ldr r1, _080BBDC0 @ =0x08676BB8
	movs r2, #0xd0
	lsls r2, r2, #8
	adds r0, r4, #0
	bl sub_080AACD8
	movs r0, #1
	bl EnableBgSync
	ldr r3, _080BBDC4 @ =0x03002870
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
	strb r1, [r0]
	adds r2, #9
	movs r0, #0x10
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x46
	strb r1, [r0]
	ldr r0, _080BBDC8 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #1
	orrs r0, r1
	ldr r1, _080BBDCC @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf8
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BBDB0: .4byte 0x02022C60
_080BBDB4: .4byte 0x086758C0
_080BBDB8: .4byte 0x08CEF07C
_080BBDBC: .4byte 0x06008000
_080BBDC0: .4byte 0x08676BB8
_080BBDC4: .4byte 0x03002870
_080BBDC8: .4byte 0x0000FFE0
_080BBDCC: .4byte 0x0000E0FF

	thumb_func_start sub_080BBDD0
sub_080BBDD0: @ 0x080BBDD0
	push {r4, lr}
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl sub_080BB2AC
	ldr r4, _080BBE28 @ =0x02022C60
	adds r0, r4, #0
	movs r1, #0
	bl TmFill
	ldr r0, _080BBE2C @ =0x08616D74
	movs r1, #0xd0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BBE30 @ =0x08CEF078
	ldr r0, [r0]
	ldr r1, _080BBE34 @ =0x06008000
	movs r2, #0x80
	lsls r2, r2, #3
	bl CpuFastSet
	adds r4, #0x80
	ldr r1, _080BBE38 @ =0x08616D94
	movs r2, #0xd0
	lsls r2, r2, #8
	adds r0, r4, #0
	bl sub_080AACD8
	ldr r2, _080BBE3C @ =0x03001620
	ldr r0, [r2]
	movs r1, #0x20
	orrs r0, r1
	str r0, [r2]
	movs r0, #1
	bl EnableBgSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BBE28: .4byte 0x02022C60
_080BBE2C: .4byte 0x08616D74
_080BBE30: .4byte 0x08CEF078
_080BBE34: .4byte 0x06008000
_080BBE38: .4byte 0x08616D94
_080BBE3C: .4byte 0x03001620

	thumb_func_start sub_080BBE40
sub_080BBE40: @ 0x080BBE40
	ldr r0, _080BBE4C @ =0x03001620
	ldr r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	str r1, [r0]
	bx lr
	.align 2, 0
_080BBE4C: .4byte 0x03001620

	thumb_func_start sub_080BBE50
sub_080BBE50: @ 0x080BBE50
	push {lr}
	sub sp, #0xc
	movs r3, #1
	rsbs r3, r3, #0
	ldr r1, _080BBE74 @ =0x086005E4
	ldr r2, _080BBE78 @ =0x0000FFFF
	str r2, [sp]
	movs r2, #8
	str r2, [sp, #4]
	str r0, [sp, #8]
	adds r0, r3, #0
	movs r2, #0
	movs r3, #0x10
	bl sub_080BD1DC
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_080BBE74: .4byte 0x086005E4
_080BBE78: .4byte 0x0000FFFF

	thumb_func_start sub_080BBE7C
sub_080BBE7C: @ 0x080BBE7C
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	bl sub_080BBC5C
	movs r0, #1
	rsbs r0, r0, #0
	ldr r1, _080BBEA8 @ =0x08600604
	ldr r2, _080BBEAC @ =0x0000FFFF
	str r2, [sp]
	movs r2, #8
	str r2, [sp, #4]
	str r4, [sp, #8]
	movs r2, #0
	movs r3, #0x10
	bl sub_080BD1DC
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BBEA8: .4byte 0x08600604
_080BBEAC: .4byte 0x0000FFFF

	thumb_func_start sub_080BBEB0
sub_080BBEB0: @ 0x080BBEB0
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, [r4, #0x38]
	ldr r2, [r4, #0x30]
	cmp r1, r2
	ble _080BBED4
	ldr r0, [r4, #0x34]
	adds r0, r2, r0
	str r0, [r4, #0x30]
	cmp r0, r1
	ble _080BBECA
	str r1, [r4, #0x30]
_080BBECA:
	ldr r0, [r4, #0x40]
	ldr r1, [r4, #0x30]
	rsbs r1, r1, #0
	bl sub_080BD688
_080BBED4:
	ldr r1, [r4, #0x38]
	ldr r2, [r4, #0x30]
	cmp r1, r2
	bge _080BBEF2
	ldr r0, [r4, #0x34]
	subs r0, r2, r0
	str r0, [r4, #0x30]
	cmp r0, r1
	bge _080BBEE8
	str r1, [r4, #0x30]
_080BBEE8:
	ldr r0, [r4, #0x40]
	ldr r1, [r4, #0x30]
	rsbs r1, r1, #0
	bl sub_080BD688
_080BBEF2:
	ldr r1, [r4, #0x2c]
	ldr r0, _080BBF20 @ =0x000008A2
	cmp r1, r0
	bne _080BBEFC
	b _080BC006
_080BBEFC:
	cmp r1, r0
	bgt _080BBF50
	movs r0, #0xaf
	lsls r0, r0, #3
	cmp r1, r0
	beq _080BBFD8
	cmp r1, r0
	bgt _080BBF30
	subs r0, #0xb4
	cmp r1, r0
	beq _080BBFBC
	cmp r1, r0
	bgt _080BBF24
	movs r0, #0x96
	lsls r0, r0, #1
	cmp r1, r0
	beq _080BBFB0
	b _080BC094
	.align 2, 0
_080BBF20: .4byte 0x000008A2
_080BBF24:
	ldr r0, _080BBF2C @ =0x0000053C
	cmp r1, r0
	beq _080BBFC8
	b _080BC094
	.align 2, 0
_080BBF2C: .4byte 0x0000053C
_080BBF30:
	movs r0, #0xdc
	lsls r0, r0, #3
	cmp r1, r0
	beq _080BBFFC
	cmp r1, r0
	bgt _080BBF44
	subs r0, #0xb4
	cmp r1, r0
	beq _080BBFE4
	b _080BC094
_080BBF44:
	ldr r0, _080BBF4C @ =0x0000080C
	cmp r1, r0
	beq _080BC006
	b _080BC094
	.align 2, 0
_080BBF4C: .4byte 0x0000080C
_080BBF50:
	ldr r0, _080BBF74 @ =0x00000B68
	cmp r1, r0
	bne _080BBF58
	b _080BC044
_080BBF58:
	cmp r1, r0
	bgt _080BBF84
	movs r0, #0xa0
	lsls r0, r0, #4
	cmp r1, r0
	bne _080BBF66
	b _080BC07C
_080BBF66:
	cmp r1, r0
	bgt _080BBF78
	subs r0, #0xc8
	cmp r1, r0
	beq _080BC00E
	b _080BC094
	.align 2, 0
_080BBF74: .4byte 0x00000B68
_080BBF78:
	ldr r0, _080BBF80 @ =0x00000B2C
	cmp r1, r0
	beq _080BC02C
	b _080BC094
	.align 2, 0
_080BBF80: .4byte 0x00000B2C
_080BBF84:
	ldr r0, _080BBF98 @ =0x00000C58
	cmp r1, r0
	bne _080BBF8C
	b _080BC07C
_080BBF8C:
	cmp r1, r0
	bgt _080BBF9C
	subs r0, #0x64
	cmp r1, r0
	beq _080BC064
	b _080BC094
	.align 2, 0
_080BBF98: .4byte 0x00000C58
_080BBF9C:
	ldr r0, _080BBFAC @ =0x00000E74
	cmp r1, r0
	beq _080BC086
	movs r0, #0xfa
	lsls r0, r0, #4
	cmp r1, r0
	beq _080BC08E
	b _080BC094
	.align 2, 0
_080BBFAC: .4byte 0x00000E74
_080BBFB0:
	movs r0, #0xfa
	lsls r0, r0, #2
	adds r1, r4, #0
	bl sub_080BCA6C
	b _080BC094
_080BBFBC:
	ldr r0, _080BBFD0 @ =0x03001620
	ldr r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #2
	orrs r1, r2
	str r1, [r0]
_080BBFC8:
	movs r0, #1
	rsbs r0, r0, #0
	ldr r1, _080BBFD4 @ =0x08600584
	b _080BC06A
	.align 2, 0
_080BBFD0: .4byte 0x03001620
_080BBFD4: .4byte 0x08600584
_080BBFD8:
	movs r0, #0x20
	str r0, [r4, #0x34]
	movs r0, #0x80
	lsls r0, r0, #2
	str r0, [r4, #0x38]
	b _080BC094
_080BBFE4:
	ldr r0, _080BBFF8 @ =0x03001620
	ldr r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r1, r2
	str r1, [r0]
	bl sub_080BBDD0
	b _080BC094
	.align 2, 0
_080BBFF8: .4byte 0x03001620
_080BBFFC:
	movs r0, #0x20
	str r0, [r4, #0x34]
	movs r0, #0
	str r0, [r4, #0x38]
	b _080BC094
_080BC006:
	adds r0, r4, #0
	bl sub_080BBE50
	b _080BC094
_080BC00E:
	adds r0, r4, #0
	bl sub_080BBE7C
	ldr r0, _080BC024 @ =0x03001620
	ldr r1, [r0]
	ldr r2, _080BC028 @ =0xFFFFF9FF
	ands r1, r2
	str r1, [r0]
	bl sub_080BBE40
	b _080BC094
	.align 2, 0
_080BC024: .4byte 0x03001620
_080BC028: .4byte 0xFFFFF9FF
_080BC02C:
	adds r0, r4, #0
	bl sub_080BBE50
	ldr r0, _080BC040 @ =0x03001620
	ldr r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #4
	orrs r1, r2
	str r1, [r0]
	b _080BC094
	.align 2, 0
_080BC040: .4byte 0x03001620
_080BC044:
	movs r0, #0x10
	str r0, [r4, #0x34]
	movs r0, #0xc0
	lsls r0, r0, #1
	str r0, [r4, #0x38]
	ldr r2, _080BC05C @ =0x03001620
	ldr r0, [r2]
	ldr r1, _080BC060 @ =0xFFFFF7FF
	ands r0, r1
	str r0, [r2]
	b _080BC094
	.align 2, 0
_080BC05C: .4byte 0x03001620
_080BC060: .4byte 0xFFFFF7FF
_080BC064:
	movs r0, #1
	rsbs r0, r0, #0
	ldr r1, _080BC078 @ =0x08600564
_080BC06A:
	str r4, [sp]
	movs r2, #0
	movs r3, #1
	bl sub_080BD0D4
	b _080BC094
	.align 2, 0
_080BC078: .4byte 0x08600564
_080BC07C:
	movs r0, #0x10
	str r0, [r4, #0x34]
	adds r0, #0xf0
	str r0, [r4, #0x38]
	b _080BC094
_080BC086:
	adds r0, r4, #0
	bl sub_080BCAE8
	b _080BC094
_080BC08E:
	adds r0, r4, #0
	bl Proc_Break
_080BC094:
	ldr r0, [r4, #0x2c]
	adds r0, #1
	str r0, [r4, #0x2c]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080BC0A4
sub_080BC0A4: @ 0x080BC0A4
	push {lr}
	movs r1, #0
	str r1, [r0, #0x2c]
	ldr r2, _080BC0C0 @ =0x03001620
	ldr r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #1
	orrs r0, r1
	str r0, [r2]
	bl ArchiveCurrentPalettes
	pop {r0}
	bx r0
	.align 2, 0
_080BC0C0: .4byte 0x03001620

	thumb_func_start sub_080BC0C4
sub_080BC0C4: @ 0x080BC0C4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x2c]
	lsls r4, r0, #3
	movs r1, #0x80
	lsls r1, r1, #1
	adds r4, r4, r1
	adds r0, #1
	str r0, [r5, #0x2c]
	adds r0, r4, #0
	adds r1, r4, #0
	adds r2, r4, #0
	movs r3, #1
	bl WriteFadedPaletteFromArchive
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r4, r0
	bne _080BC0F0
	adds r0, r5, #0
	bl Proc_Break
_080BC0F0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080BC0F8
sub_080BC0F8: @ 0x080BC0F8
	push {lr}
	movs r0, #2
	bl EnableBgSync
	pop {r0}
	bx r0

	thumb_func_start sub_080BC104
sub_080BC104: @ 0x080BC104
	push {lr}
	sub sp, #4
	movs r0, #0
	bl SetOnHBlankA
	bl sub_080BC5CC
	bl EndFadeInOut
	movs r0, #0
	str r0, [sp]
	ldr r1, _080BC158 @ =0x02022860
	ldr r2, _080BC15C @ =0x01000008
	mov r0, sp
	bl CpuFastSet
	bl EnablePalSync
	ldr r2, _080BC160 @ =0x03002870
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
	movs r0, #2
	bl ResetTitleBgAffin
	bl EndEachSpriteAnimProc
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080BC158: .4byte 0x02022860
_080BC15C: .4byte 0x01000008
_080BC160: .4byte 0x03002870

	thumb_func_start sub_080BC164
sub_080BC164: @ 0x080BC164
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r7, _080BC1F8 @ =0x03002870
	adds r1, r7, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x44
	movs r4, #0
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r2, _080BC1FC @ =0x03001620
	ldr r0, [r2]
	ldr r1, _080BC200 @ =0xFFFFFE1E
	ands r0, r1
	str r0, [r2]
	str r4, [sp]
	ldr r1, _080BC204 @ =0x06017000
	ldr r6, _080BC208 @ =0x01000400
	mov r0, sp
	adds r2, r6, #0
	bl CpuFastSet
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r7, #1]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r7, #1]
	ldr r0, _080BC20C @ =0x085E9D2C
	movs r1, #0x88
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BC210 @ =0x085EC9A4
	movs r1, #0
	bl sub_080BCB1C
	ldr r0, _080BC214 @ =0x085ECBC0
	movs r1, #0x80
	lsls r1, r1, #4
	bl sub_080BCB1C
	str r4, [r5, #0x2c]
	str r4, [sp, #4]
	add r0, sp, #4
	ldr r1, _080BC218 @ =0x06014000
	adds r2, r6, #0
	bl CpuFastSet
	adds r5, #0x3c
	movs r0, #1
	strb r0, [r5]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BC1F8: .4byte 0x03002870
_080BC1FC: .4byte 0x03001620
_080BC200: .4byte 0xFFFFFE1E
_080BC204: .4byte 0x06017000
_080BC208: .4byte 0x01000400
_080BC20C: .4byte 0x085E9D2C
_080BC210: .4byte 0x085EC9A4
_080BC214: .4byte 0x085ECBC0
_080BC218: .4byte 0x06014000

	thumb_func_start sub_080BC21C
sub_080BC21C: @ 0x080BC21C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, [r5, #0x2c]
	adds r0, r4, #0
	movs r1, #0x70
	bl __modsi3
	movs r1, #8
	bl __divsi3
	cmp r4, #0x70
	bge _080BC246
	lsls r3, r0, #6
	str r4, [sp]
	movs r0, #2
	movs r1, #2
	movs r2, #8
	bl sub_080BCB34
	b _080BC25E
_080BC246:
	lsls r3, r0, #6
	movs r0, #0x80
	lsls r0, r0, #4
	adds r3, r3, r0
	adds r0, r4, #0
	subs r0, #0x70
	str r0, [sp]
	movs r0, #2
	movs r1, #2
	movs r2, #8
	bl sub_080BCB34
_080BC25E:
	movs r0, #0x70
	lsls r0, r0, #1
	ldr r1, [r5, #0x2c]
	cmp r1, r0
	bne _080BC274
	movs r0, #0
	str r0, [r5, #0x2c]
	adds r0, r5, #0
	bl Proc_Break
	b _080BC278
_080BC274:
	adds r0, r1, #1
	str r0, [r5, #0x2c]
_080BC278:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_080BC280
sub_080BC280: @ 0x080BC280
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	bne _080BC296
	movs r0, #0x5f
	movs r1, #0
	movs r2, #0
	bl StartBgmExt
_080BC296:
	ldr r0, [r4, #0x2c]
	cmp r0, #0x1f
	bgt _080BC2C4
	str r0, [sp]
	movs r0, #0x20
	movs r1, #2
	movs r2, #2
	movs r3, #0
	bl sub_080BCBFC
	movs r3, #0x80
	lsls r3, r3, #4
	ldr r0, [r4, #0x2c]
	str r0, [sp]
	movs r0, #0x20
	movs r1, #2
	movs r2, #2
	bl sub_080BCBFC
	ldr r0, [r4, #0x2c]
	adds r0, #1
	str r0, [r4, #0x2c]
	b _080BC2CA
_080BC2C4:
	adds r0, r4, #0
	bl Proc_Break
_080BC2CA:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080BC2D4
sub_080BC2D4: @ 0x080BC2D4
	bx lr
	.align 2, 0

	thumb_func_start sub_080BC2D8
sub_080BC2D8: @ 0x080BC2D8
	push {lr}
	sub sp, #4
	adds r2, r0, #0
	adds r0, #0x39
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080BC300
	ldr r0, [r2, #0x54]
	cmp r0, #1
	bne _080BC300
	ldr r0, _080BC308 @ =0x08659C9C
	adds r1, r0, #0
	adds r1, #0x20
	str r2, [sp]
	movs r2, #0xa
	movs r3, #0x10
	bl sub_080BD0D4
_080BC300:
	movs r0, #0
	add sp, #4
	pop {r1}
	bx r1
	.align 2, 0
_080BC308: .4byte 0x08659C9C

	thumb_func_start OpAnim_DrawCloud
OpAnim_DrawCloud: @ 0x080BC30C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	mov r8, r0
	ldr r7, _080BC434 @ =0x03002870
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r7, #1]
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
	strb r0, [r7, #1]
	ldr r0, _080BC438 @ =0x02022C60
	movs r1, #0
	bl TmFill
	ldr r6, _080BC43C @ =0x02023460
	adds r0, r6, #0
	movs r1, #0
	bl TmFill
	ldr r0, _080BC440 @ =0x02023C60
	movs r1, #0
	bl TmFill
	ldr r0, _080BC444 @ =0x02024460
	movs r1, #0
	bl TmFill
	bl EndAllParallelWorkers
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ldrb r1, [r7, #0xc]
	ands r0, r1
	strb r0, [r7, #0xc]
	adds r0, r2, #0
	ldrb r1, [r7, #0x10]
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r7, #0x10]
	movs r0, #3
	ldrb r1, [r7, #0x14]
	orrs r0, r1
	strb r0, [r7, #0x14]
	ldrb r0, [r7, #0x18]
	ands r2, r0
	movs r0, #2
	orrs r2, r0
	strb r2, [r7, #0x18]
	ldr r0, _080BC448 @ =0x08CF0004
	movs r5, #0
	str r5, [sp]
	movs r1, #0x80
	lsls r1, r1, #7
	str r1, [sp, #4]
	movs r1, #0xa
	str r1, [sp, #8]
	ldr r1, _080BC44C @ =sub_080BC2D8
	str r1, [sp, #0xc]
	mov r1, r8
	str r1, [sp, #0x10]
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl StartBmBgfx
	ldr r1, _080BC450 @ =0x03001620
	ldr r0, [r1]
	movs r4, #0x10
	orrs r0, r4
	str r0, [r1]
	ldr r0, _080BC454 @ =0x086727E0
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BC458 @ =0x08672800
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl Decompress
	ldr r1, _080BC45C @ =0x08673AD8
	movs r2, #0xe0
	lsls r2, r2, #8
	adds r0, r6, #0
	bl sub_080AACD8
	ldr r0, _080BC460 @ =0x085ED1C4
	movs r1, #0xc0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BC464 @ =0x085ED1E4
	ldr r1, _080BC468 @ =0x06010000
	bl Decompress
	adds r2, r7, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r7, #0
	adds r0, #0x44
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r5, [r0]
	ldr r0, _080BC46C @ =0x0000FFE0
	ldrh r2, [r7, #0x3c]
	ands r0, r2
	movs r1, #1
	orrs r0, r1
	ldr r1, _080BC470 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x3c]
	mov r0, r8
	str r5, [r0, #0x2c]
	movs r0, #0xf
	bl EnableBgSync
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BC434: .4byte 0x03002870
_080BC438: .4byte 0x02022C60
_080BC43C: .4byte 0x02023460
_080BC440: .4byte 0x02023C60
_080BC444: .4byte 0x02024460
_080BC448: .4byte 0x08CF0004
_080BC44C: .4byte sub_080BC2D8
_080BC450: .4byte 0x03001620
_080BC454: .4byte 0x086727E0
_080BC458: .4byte 0x08672800
_080BC45C: .4byte 0x08673AD8
_080BC460: .4byte 0x085ED1C4
_080BC464: .4byte 0x085ED1E4
_080BC468: .4byte 0x06010000
_080BC46C: .4byte 0x0000FFE0
_080BC470: .4byte 0x0000E0FF

	thumb_func_start sub_080BC474
sub_080BC474: @ 0x080BC474
	ldr r2, _080BC490 @ =0x03002870
	movs r0, #1
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	bx lr
	.align 2, 0
_080BC490: .4byte 0x03002870

	thumb_func_start sub_080BC494
sub_080BC494: @ 0x080BC494
	push {r4, r5, r6, lr}
	sub sp, #0x20
	adds r5, r0, #0
	mov r0, sp
	ldr r1, _080BC560 @ =0x0867733C
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	ldm r1!, {r2, r3}
	stm r0!, {r2, r3}
	ldr r0, [r5, #0x2c]
	movs r1, #0xa
	bl __divsi3
	adds r6, r0, #0
	cmp r6, #0xf
	bgt _080BC4E0
	ldr r4, _080BC564 @ =0x03002870
	adds r2, r4, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r2, #8
	movs r3, #0
	movs r1, #0x10
	movs r0, #0x10
	strb r0, [r2]
	subs r1, r1, r6
	adds r0, r4, #0
	adds r0, #0x45
	strb r1, [r0]
	adds r0, #1
	strb r3, [r0]
_080BC4E0:
	ldr r4, [r5, #0x2c]
	adds r0, r4, #0
	movs r1, #0x10
	bl __modsi3
	cmp r0, #0
	bne _080BC50A
	adds r0, r4, #0
	movs r1, #0x10
	bl __divsi3
	adds r2, r0, #0
	cmp r2, #7
	bgt _080BC50A
	lsls r0, r2, #2
	add r0, sp
	ldr r1, [r0]
	adds r0, r2, #0
	adds r2, r5, #0
	bl sub_080BCFCC
_080BC50A:
	ldr r0, [r5, #0x2c]
	cmp r0, #0xa0
	bne _080BC550
	ldr r0, _080BC568 @ =0x02023460
	movs r1, #0
	bl TmFill
	movs r0, #2
	bl EnableBgSync
	ldr r2, _080BC564 @ =0x03002870
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	movs r4, #0
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	movs r0, #0
	bl BmBgfxSetLoopEN
	adds r0, r5, #0
	bl Proc_Break
	ldr r0, _080BC56C @ =0x02022860
	strh r4, [r0]
	bl EnablePalSync
_080BC550:
	ldr r0, [r5, #0x2c]
	adds r0, #1
	str r0, [r5, #0x2c]
	add sp, #0x20
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BC560: .4byte 0x0867733C
_080BC564: .4byte 0x03002870
_080BC568: .4byte 0x02023460
_080BC56C: .4byte 0x02022860

	thumb_func_start sub_080BC570
sub_080BC570: @ 0x080BC570
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x14]
	adds r0, #0x44
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080BC5AC
	ldr r0, _080BC5B4 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0xb
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080BC5AC
	movs r0, #2
	bl SetNextGameAction
	bl sub_080BC994
	bl sub_080BD55C
	adds r0, r4, #0
	bl Proc_Break
	ldr r0, [r4, #0x14]
	movs r1, #0x63
	bl Proc_Goto
_080BC5AC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BC5B4: .4byte 0x08B857F8

	thumb_func_start sub_080BC5B8
sub_080BC5B8: @ 0x080BC5B8
	push {lr}
	adds r1, r0, #0
	ldr r0, _080BC5C8 @ =0x08CEF264
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_080BC5C8: .4byte 0x08CEF264

	thumb_func_start sub_080BC5CC
sub_080BC5CC: @ 0x080BC5CC
	push {lr}
	ldr r0, _080BC5DC @ =0x08CEF264
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080BC5DC: .4byte 0x08CEF264

	thumb_func_start sub_080BC5E0
sub_080BC5E0: @ 0x080BC5E0
	adds r1, r0, #0
	movs r2, #0
	b _080BC5EA
_080BC5E6:
	adds r2, #1
	adds r1, #0xc
_080BC5EA:
	ldr r0, [r1]
	cmp r0, #0
	bne _080BC5E6
	adds r0, r2, #0
	bx lr

	thumb_func_start sub_080BC5F4
sub_080BC5F4: @ 0x080BC5F4
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _080BC68C @ =0x085EE02C
	movs r1, #0xf0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r4, #0
	str r4, [sp]
	ldr r1, _080BC690 @ =0x0600C000
	ldr r2, _080BC694 @ =0x01001000
	mov r0, sp
	bl CpuFastSet
	ldr r3, _080BC698 @ =0x03002870
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	movs r0, #3
	ldrb r2, [r3, #0x10]
	orrs r2, r0
	strb r2, [r3, #0x10]
	ldrb r2, [r3, #0x14]
	orrs r0, r2
	strb r0, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x18]
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
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r0, _080BC69C @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #1
	orrs r0, r1
	ldr r1, _080BC6A0 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	ldr r0, _080BC6A4 @ =0x08CEF594
	str r0, [r5, #0x3c]
	str r4, [r5, #0x2c]
	movs r1, #1
	str r1, [r5, #0x30]
	bl sub_080BC5E0
	str r0, [r5, #0x34]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BC68C: .4byte 0x085EE02C
_080BC690: .4byte 0x0600C000
_080BC694: .4byte 0x01001000
_080BC698: .4byte 0x03002870
_080BC69C: .4byte 0x0000FFE0
_080BC6A0: .4byte 0x0000E0FF
_080BC6A4: .4byte 0x08CEF594

	thumb_func_start sub_080BC6A8
sub_080BC6A8: @ 0x080BC6A8
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	movs r1, #3
	bl __modsi3
	cmp r0, #1
	beq _080BC6E0
	cmp r0, #1
	bgt _080BC6C2
	cmp r0, #0
	beq _080BC6C8
	b _080BC71C
_080BC6C2:
	cmp r0, #2
	beq _080BC6F8
	b _080BC71C
_080BC6C8:
	ldr r0, [r4, #0x3c]
	ldr r0, [r0]
	ldr r1, [r4, #0x30]
	lsls r1, r1, #0xd
	ldr r2, _080BC6DC @ =0x0600C000
	adds r1, r1, r2
	bl Decompress
	b _080BC71C
	.align 2, 0
_080BC6DC: .4byte 0x0600C000
_080BC6E0:
	ldr r0, [r4, #0x3c]
	ldr r0, [r0, #4]
	ldr r1, [r4, #0x30]
	lsls r1, r1, #0xd
	ldr r3, _080BC6F4 @ =0x0600D000
	adds r1, r1, r3
	bl Decompress
	b _080BC71C
	.align 2, 0
_080BC6F4: .4byte 0x0600D000
_080BC6F8:
	ldr r0, _080BC780 @ =0x02024460
	ldr r1, [r4, #0x3c]
	ldr r1, [r1, #8]
	ldr r2, [r4, #0x30]
	lsls r2, r2, #0x18
	movs r3, #0xf2
	lsls r3, r3, #0x18
	adds r2, r2, r3
	lsrs r2, r2, #0x10
	bl sub_080AACD8
	ldr r1, [r4, #0x30]
	movs r0, #1
	subs r0, r0, r1
	str r0, [r4, #0x30]
	movs r0, #8
	bl EnableBgSync
_080BC71C:
	ldr r0, [r4, #0x2c]
	adds r5, r0, #1
	str r5, [r4, #0x2c]
	lsls r0, r5, #4
	ldr r6, [r4, #0x34]
	lsls r1, r6, #1
	adds r1, r1, r6
	bl __divsi3
	adds r7, r0, #0
	ldr r3, _080BC784 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0x10
	subs r0, r0, r7
	lsls r2, r0, #1
	cmp r2, #0x10
	ble _080BC74E
	movs r2, #0x10
_080BC74E:
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r2, [r0]
	adds r0, #1
	strb r7, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, r5, #0
	movs r1, #3
	bl __modsi3
	cmp r0, #0
	bne _080BC788
	adds r0, r5, #0
	movs r1, #3
	bl __divsi3
	ldr r1, [r4, #0x3c]
	adds r1, #0xc
	str r1, [r4, #0x3c]
	cmp r0, r6
	bne _080BC788
	movs r0, #1
	b _080BC78A
	.align 2, 0
_080BC780: .4byte 0x02024460
_080BC784: .4byte 0x03002870
_080BC788:
	movs r0, #0
_080BC78A:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_080BC790
sub_080BC790: @ 0x080BC790
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _080BC7D8 @ =0x02007018
	ldr r0, [r2, #8]
	ldr r1, _080BC7DC @ =0x000005FF
	cmp r0, r1
	bgt _080BC7A6
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r0, r3
	str r0, [r2, #8]
_080BC7A6:
	ldr r0, [r2, #0xc]
	cmp r0, r1
	bgt _080BC7B0
	adds r0, #0x20
	str r0, [r2, #0xc]
_080BC7B0:
	ldr r1, [r2, #0x10]
	ldr r0, _080BC7E0 @ =0x000008FF
	cmp r1, r0
	bgt _080BC7BE
	adds r0, r1, #0
	adds r0, #0x20
	str r0, [r2, #0x10]
_080BC7BE:
	adds r0, r4, #0
	bl sub_080BC6A8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080BC7D0
	adds r0, r4, #0
	bl Proc_Break
_080BC7D0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BC7D8: .4byte 0x02007018
_080BC7DC: .4byte 0x000005FF
_080BC7E0: .4byte 0x000008FF

	thumb_func_start sub_080BC7E4
sub_080BC7E4: @ 0x080BC7E4
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r6, #0
	str r6, [r5, #0x2c]
	ldr r0, _080BC8A4 @ =0x08CEF630
	str r0, [r5, #0x3c]
	bl sub_080BC5E0
	str r0, [r5, #0x34]
	ldr r7, _080BC8A8 @ =0x03002870
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ldrb r1, [r7, #0xc]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r7, #0xc]
	movs r0, #3
	ldrb r1, [r7, #0x10]
	orrs r1, r0
	strb r1, [r7, #0x10]
	ldrb r1, [r7, #0x14]
	orrs r0, r1
	strb r0, [r7, #0x14]
	ldrb r0, [r7, #0x18]
	ands r2, r0
	movs r0, #1
	orrs r2, r0
	strb r2, [r7, #0x18]
	ldr r0, _080BC8AC @ =0x02022C60
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	ldr r4, _080BC8B0 @ =0x03001620
	ldr r0, [r4]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4]
	adds r2, r7, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r7, #0
	adds r1, #0x44
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x45
	strb r6, [r0]
	adds r0, #1
	strb r6, [r0]
	ldr r0, _080BC8B4 @ =0x0000FFE0
	ldrh r2, [r7, #0x3c]
	ands r0, r2
	movs r1, #8
	orrs r0, r1
	ldr r1, _080BC8B8 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf8
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x3c]
	ldr r0, [r5, #0x14]
	movs r1, #0
	bl Proc_Goto
	bl InitOpScanlineBuf
	ldr r1, _080BC8BC @ =0x02007018
	movs r0, #0xc0
	lsls r0, r0, #2
	str r0, [r1, #8]
	str r0, [r1, #4]
	movs r0, #0xc8
	lsls r0, r0, #1
	str r0, [r1, #0xc]
	movs r0, #0xc8
	lsls r0, r0, #2
	str r0, [r1, #0x10]
	ldr r0, [r4]
	movs r1, #4
	orrs r0, r1
	str r0, [r4]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BC8A4: .4byte 0x08CEF630
_080BC8A8: .4byte 0x03002870
_080BC8AC: .4byte 0x02022C60
_080BC8B0: .4byte 0x03001620
_080BC8B4: .4byte 0x0000FFE0
_080BC8B8: .4byte 0x0000E0FF
_080BC8BC: .4byte 0x02007018

	thumb_func_start sub_080BC8C0
sub_080BC8C0: @ 0x080BC8C0
	push {r4, lr}
	adds r4, r0, #0
	bl sub_080BC6A8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080BC8EE
	movs r0, #0
	str r0, [r4, #0x2c]
	adds r0, r4, #0
	bl Proc_Break
	ldr r0, _080BC8F4 @ =0x02024460
	movs r1, #0
	bl TmFill
	movs r0, #8
	bl EnableBgSync
	ldr r0, [r4, #0x14]
	movs r1, #1
	bl Proc_Goto
_080BC8EE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BC8F4: .4byte 0x02024460

	thumb_func_start sub_080BC8F8
sub_080BC8F8: @ 0x080BC8F8
	push {r4, r5, r6, lr}
	adds r1, r0, #0
	ldr r2, [r1, #0x2c]
	movs r0, #0xc8
	lsls r0, r0, #1
	cmp r2, r0
	bne _080BC90E
	adds r0, r1, #0
	bl Proc_Break
	b _080BC942
_080BC90E:
	adds r0, r2, #1
	str r0, [r1, #0x2c]
	cmp r0, #0x8c
	ble _080BC942
	subs r0, #0x8c
	movs r6, #0x80
	lsls r6, r6, #1
	cmp r0, r6
	bgt _080BC942
	ldr r5, _080BC948 @ =0x02007018
	subs r0, r6, r0
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #3
	adds r4, r4, r0
	lsls r0, r4, #5
	adds r1, r6, #0
	bl __divsi3
	str r0, [r5, #0x10]
	lsls r4, r4, #4
	adds r0, r4, #0
	adds r1, r6, #0
	bl __divsi3
	str r0, [r5, #0xc]
_080BC942:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BC948: .4byte 0x02007018

	thumb_func_start sub_080BC94C
sub_080BC94C: @ 0x080BC94C
	ldr r0, _080BC95C @ =0x03001620
	ldr r1, [r0]
	movs r2, #5
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0]
	bx lr
	.align 2, 0
_080BC95C: .4byte 0x03001620

	thumb_func_start sub_080BC960
sub_080BC960: @ 0x080BC960
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #8
	bl sub_08003F8C
	ldr r0, _080BC98C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080BC97C
	movs r0, #0x62
	bl m4aSongNumStart
_080BC97C:
	ldr r0, _080BC990 @ =0x08CEF284
	adds r1, r4, #0
	bl Proc_Start
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BC98C: .4byte 0x0202BBF8
_080BC990: .4byte 0x08CEF284

	thumb_func_start sub_080BC994
sub_080BC994: @ 0x080BC994
	push {lr}
	ldr r0, _080BC9A4 @ =0x08CEF284
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080BC9A4: .4byte 0x08CEF284

	thumb_func_start sub_080BC9A8
sub_080BC9A8: @ 0x080BC9A8
	push {lr}
	movs r1, #0
	str r1, [r0, #0x2c]
	bl sub_080BBD28
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080BC9B8
sub_080BC9B8: @ 0x080BC9B8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x2c]
	adds r3, r5, #1
	str r3, [r4, #0x2c]
	cmp r3, #0x40
	bgt _080BC9FA
	ldr r0, _080BCA64 @ =0x03002870
	mov ip, r0
	adds r0, #0x3c
	movs r1, #0x3f
	ldrb r2, [r0]
	ands r1, r2
	movs r2, #0x40
	orrs r1, r2
	strb r1, [r0]
	adds r1, r3, #0
	cmp r1, #0
	bge _080BC9E2
	adds r1, r5, #0
	adds r1, #8
_080BC9E2:
	asrs r1, r1, #3
	mov r0, ip
	adds r0, #0x44
	movs r2, #0
	strb r1, [r0]
	mov r1, ip
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r2, [r0]
_080BC9FA:
	ldr r1, [r4, #0x2c]
	lsls r1, r1, #0xf
	lsrs r1, r1, #0x10
	movs r0, #0
	movs r2, #0
	bl SetBgOffset
	ldr r1, [r4, #0x2c]
	ldr r0, [r4, #0x30]
	cmp r1, r0
	ble _080BCA5E
	subs r0, r1, r0
	cmp r0, #0
	bge _080BCA18
	adds r0, #7
_080BCA18:
	asrs r0, r0, #3
	movs r3, #8
	subs r3, r3, r0
	ldr r0, _080BCA64 @ =0x03002870
	mov ip, r0
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x44
	movs r1, #0
	strb r3, [r0]
	adds r2, #9
	movs r0, #0x10
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x46
	strb r1, [r0]
	cmp r3, #0
	bne _080BCA5E
	adds r0, r4, #0
	bl Proc_Break
	ldr r0, _080BCA68 @ =0x02022C60
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl EnableBgSync
_080BCA5E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BCA64: .4byte 0x03002870
_080BCA68: .4byte 0x02022C60

	thumb_func_start sub_080BCA6C
sub_080BCA6C: @ 0x080BCA6C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080BCA80 @ =0x08CEF2D4
	bl Proc_Start
	str r4, [r0, #0x30]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BCA80: .4byte 0x08CEF2D4

	thumb_func_start sub_080BCA84
sub_080BCA84: @ 0x080BCA84
	push {lr}
	movs r1, #0
	str r1, [r0, #0x2c]
	bl sub_080BBC80
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080BCA94
sub_080BCA94: @ 0x080BCA94
	push {r4, lr}
	ldr r4, [r0, #0x2c]
	adds r3, r4, #1
	str r3, [r0, #0x2c]
	cmp r3, #0x80
	bgt _080BCADC
	ldr r0, _080BCAD8 @ =0x03002870
	mov ip, r0
	adds r0, #0x3c
	movs r1, #0x3f
	ldrb r2, [r0]
	ands r1, r2
	movs r2, #0x40
	orrs r1, r2
	strb r1, [r0]
	adds r1, r3, #0
	cmp r1, #0
	bge _080BCABC
	adds r1, r4, #0
	adds r1, #8
_080BCABC:
	asrs r1, r1, #3
	mov r0, ip
	adds r0, #0x44
	movs r2, #0
	strb r1, [r0]
	mov r1, ip
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r2, [r0]
	b _080BCAE0
	.align 2, 0
_080BCAD8: .4byte 0x03002870
_080BCADC:
	bl Proc_Break
_080BCAE0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080BCAE8
sub_080BCAE8: @ 0x080BCAE8
	push {lr}
	adds r1, r0, #0
	ldr r0, _080BCAF8 @ =0x08CEF2F4
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_080BCAF8: .4byte 0x08CEF2F4

	thumb_func_start sub_080BCAFC
sub_080BCAFC: @ 0x080BCAFC
	push {lr}
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	ldr r1, _080BCB14 @ =0x06014000
	ldr r2, _080BCB18 @ =0x01000200
	mov r0, sp
	bl CpuFastSet
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080BCB14: .4byte 0x06014000
_080BCB18: .4byte 0x01000200

	thumb_func_start sub_080BCB1C
sub_080BCB1C: @ 0x080BCB1C
	push {lr}
	adds r2, r1, #0
	ldr r1, _080BCB30 @ =0x08CEF074
	ldr r1, [r1]
	adds r1, r1, r2
	bl Decompress
	pop {r0}
	bx r0
	.align 2, 0
_080BCB30: .4byte 0x08CEF074

	thumb_func_start sub_080BCB34
sub_080BCB34: @ 0x080BCB34
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	str r0, [sp]
	str r1, [sp, #4]
	mov sl, r2
	mov ip, r3
	ldr r4, [sp, #0x3c]
	mov r0, sl
	muls r0, r4, r0
	adds r4, r0, #0
	movs r1, #0
	b _080BCBD8
_080BCB54:
	movs r3, #0
	ldr r1, [sp, #8]
	adds r1, #1
	str r1, [sp, #0xc]
	ldr r0, [sp]
	cmp r3, r0
	bge _080BCBD6
	ldr r1, _080BCBF0 @ =0x08CEF314
	str r1, [sp, #0x14]
	ldr r0, _080BCBF4 @ =0x08CEF074
	str r0, [sp, #0x18]
_080BCB6A:
	adds r1, r3, #1
	str r1, [sp, #0x10]
	mov r0, sl
	cmp r0, #0
	ble _080BCBCE
	movs r1, #0x3f
	mov r8, r1
	lsls r7, r3, #5
	ldr r0, [sp, #8]
	lsls r6, r0, #0xa
	ldr r1, [sp, #0x18]
	mov sb, r1
	mov r5, sl
_080BCB84:
	mov r0, r8
	ands r4, r0
	mov r1, sb
	ldr r2, [r1]
	add r2, ip
	adds r2, r2, r7
	adds r2, r2, r6
	mov r0, ip
	adds r3, r7, r0
	adds r3, r3, r6
	ldr r1, _080BCBF8 @ =0x06014000
	adds r3, r3, r1
	adds r0, r4, #0
	mov r1, r8
	ands r0, r1
	lsls r0, r0, #1
	ldr r1, _080BCBF0 @ =0x08CEF314
	adds r0, r0, r1
	ldrh r1, [r0]
	lsrs r0, r1, #3
	lsls r0, r0, #2
	adds r2, r2, r0
	adds r3, r3, r0
	movs r0, #7
	ands r0, r1
	lsls r0, r0, #2
	movs r1, #0xf
	lsls r1, r0
	ldr r2, [r2]
	ands r2, r1
	ldr r0, [r3]
	orrs r0, r2
	str r0, [r3]
	adds r4, #1
	subs r5, #1
	cmp r5, #0
	bne _080BCB84
_080BCBCE:
	ldr r3, [sp, #0x10]
	ldr r0, [sp]
	cmp r3, r0
	blt _080BCB6A
_080BCBD6:
	ldr r1, [sp, #0xc]
_080BCBD8:
	str r1, [sp, #8]
	ldr r0, [sp, #4]
	cmp r1, r0
	blt _080BCB54
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BCBF0: .4byte 0x08CEF314
_080BCBF4: .4byte 0x08CEF074
_080BCBF8: .4byte 0x06014000

	thumb_func_start sub_080BCBFC
sub_080BCBFC: @ 0x080BCBFC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	str r0, [sp]
	str r1, [sp, #4]
	mov sl, r2
	mov ip, r3
	ldr r4, [sp, #0x3c]
	mov r0, sl
	muls r0, r4, r0
	adds r4, r0, #0
	movs r1, #0
	b _080BCCA0
_080BCC1C:
	movs r3, #0
	ldr r1, [sp, #8]
	adds r1, #1
	str r1, [sp, #0xc]
	ldr r0, [sp]
	cmp r3, r0
	bge _080BCC9E
	ldr r1, _080BCCB8 @ =0x08CEF314
	str r1, [sp, #0x14]
	ldr r0, _080BCCBC @ =0x08CEF074
	str r0, [sp, #0x18]
_080BCC32:
	adds r1, r3, #1
	str r1, [sp, #0x10]
	mov r0, sl
	cmp r0, #0
	ble _080BCC96
	movs r1, #0x3f
	mov r8, r1
	lsls r7, r3, #5
	ldr r0, [sp, #8]
	lsls r6, r0, #0xa
	ldr r1, [sp, #0x18]
	mov sb, r1
	mov r5, sl
_080BCC4C:
	mov r0, r8
	ands r4, r0
	mov r1, sb
	ldr r2, [r1]
	add r2, ip
	adds r2, r2, r7
	adds r2, r2, r6
	mov r0, ip
	adds r3, r7, r0
	adds r3, r3, r6
	ldr r1, _080BCCC0 @ =0x06014000
	adds r3, r3, r1
	adds r0, r4, #0
	mov r1, r8
	ands r0, r1
	lsls r0, r0, #1
	ldr r1, _080BCCB8 @ =0x08CEF314
	adds r0, r0, r1
	ldrh r1, [r0]
	lsrs r0, r1, #3
	lsls r0, r0, #2
	adds r2, r2, r0
	adds r3, r3, r0
	movs r0, #7
	ands r0, r1
	lsls r0, r0, #2
	movs r1, #0xf
	lsls r1, r0
	ldr r2, [r2]
	bics r2, r1
	ldr r0, [r3]
	ands r0, r2
	str r0, [r3]
	adds r4, #1
	subs r5, #1
	cmp r5, #0
	bne _080BCC4C
_080BCC96:
	ldr r3, [sp, #0x10]
	ldr r0, [sp]
	cmp r3, r0
	blt _080BCC32
_080BCC9E:
	ldr r1, [sp, #0xc]
_080BCCA0:
	str r1, [sp, #8]
	ldr r0, [sp, #4]
	cmp r1, r0
	blt _080BCC1C
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BCCB8: .4byte 0x08CEF314
_080BCCBC: .4byte 0x08CEF074
_080BCCC0: .4byte 0x06014000

	thumb_func_start sub_080BCCC4
sub_080BCCC4: @ 0x080BCCC4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _080BCCE8 @ =0x085E9D2C
	movs r1, #0x88
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BCCEC @ =0x08CEF4BC
	str r0, [r5, #0x2c]
	movs r4, #0
	str r4, [r5, #0x38]
	bl sub_080BCAFC
	str r4, [r5, #0x3c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BCCE8: .4byte 0x085E9D2C
_080BCCEC: .4byte 0x08CEF4BC

	thumb_func_start sub_080BCCF0
sub_080BCCF0: @ 0x080BCCF0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #8
	mov sb, r0
	ldr r0, [r5, #0x3c]
	cmp r0, #0
	bne _080BCD2C
	ldr r0, [r5, #0x2c]
	bl sub_080BD570
	str r0, [r5, #0x30]
	cmp r0, #0
	bne _080BCD2C
	ldr r0, [r5, #0x2c]
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _080BCD24
	adds r0, r5, #0
	movs r1, #0x63
	bl Proc_Goto
	b _080BCDA4
_080BCD24:
	adds r0, r5, #0
	bl Proc_Break
	b _080BCDA4
_080BCD2C:
	movs r0, #0x80
	lsls r0, r0, #3
	mov r1, sb
	bl __divsi3
	adds r7, r0, #0
	subs r7, #0x10
	ldr r0, [r5, #0x30]
	muls r0, r7, r0
	ldr r6, [r5, #0x3c]
	cmp r6, r0
	bge _080BCD9E
	adds r0, r6, #0
	adds r1, r7, #0
	bl __modsi3
	adds r4, r0, #0
	movs r0, #0x40
	mov r1, sb
	bl __divsi3
	adds r1, r0, #0
	adds r0, r4, #0
	bl __divsi3
	mov r8, r0
	cmp r4, #0
	bne _080BCD80
	adds r0, r6, #0
	adds r1, r7, #0
	bl __divsi3
	ldr r1, [r5, #0x2c]
	lsls r2, r0, #2
	adds r1, r1, r2
	ldr r2, [r1]
	lsls r0, r0, #0xb
	ldr r1, [r5, #0x38]
	adds r1, r1, r0
	adds r0, r2, #0
	bl sub_080BCB1C
_080BCD80:
	mov r1, r8
	lsls r0, r1, #6
	ldr r3, [r5, #0x38]
	adds r3, r3, r0
	ldr r0, [r5, #0x3c]
	str r0, [sp]
	movs r0, #2
	movs r1, #2
	mov r2, sb
	bl sub_080BCB34
	ldr r0, [r5, #0x3c]
	adds r0, #1
	str r0, [r5, #0x3c]
	b _080BCDA4
_080BCD9E:
	adds r0, r5, #0
	bl Proc_Break
_080BCDA4:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080BCDB4
sub_080BCDB4: @ 0x080BCDB4
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2, #0x3c]
	adds r1, #1
	str r1, [r2, #0x3c]
	ldr r0, [r2, #0x2c]
	ldr r0, [r0, #8]
	subs r0, #0x20
	cmp r1, r0
	blt _080BCDD2
	movs r0, #0
	str r0, [r2, #0x3c]
	adds r0, r2, #0
	bl Proc_Break
_080BCDD2:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080BCDD8
sub_080BCDD8: @ 0x080BCDD8
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x3c]
	cmp r0, #0x1f
	bgt _080BCDFC
	ldr r1, [r4, #0x30]
	lsls r1, r1, #1
	ldr r3, [r4, #0x38]
	str r0, [sp]
	movs r0, #0x1e
	movs r2, #2
	bl sub_080BCBFC
	ldr r0, [r4, #0x3c]
	adds r0, #1
	str r0, [r4, #0x3c]
	b _080BCE0C
_080BCDFC:
	movs r0, #0
	str r0, [r4, #0x3c]
	ldr r0, [r4, #0x2c]
	adds r0, #0xc
	str r0, [r4, #0x2c]
	adds r0, r4, #0
	bl Proc_Break
_080BCE0C:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080BCE14
sub_080BCE14: @ 0x080BCE14
	push {lr}
	bl sub_080BCAFC
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080BCE20
sub_080BCE20: @ 0x080BCE20
	push {lr}
	adds r1, r0, #0
	ldr r0, _080BCE30 @ =0x08CEF394
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_080BCE30: .4byte 0x08CEF394

	thumb_func_start sub_080BCE34
sub_080BCE34: @ 0x080BCE34
	movs r1, #0
	strh r1, [r0, #0x2e]
	ldrh r1, [r0, #0x2c]
	lsrs r2, r1, #2
	lsls r2, r2, #0xd
	movs r3, #3
	ands r1, r3
	lsls r1, r1, #8
	adds r2, r2, r1
	strh r2, [r0, #0x30]
	movs r2, #0xff
	lsls r2, r2, #8
	adds r0, #0x32
	movs r1, #3
_080BCE50:
	strh r2, [r0]
	strh r2, [r0, #8]
	adds r0, #2
	subs r1, #1
	cmp r1, #0
	bge _080BCE50
	bx lr
	.align 2, 0

	thumb_func_start sub_080BCE60
sub_080BCE60: @ 0x080BCE60
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp, #4]
	movs r0, #0x40
	movs r4, #0x80
	ldr r1, [sp, #4]
	ldrh r1, [r1, #0x2e]
	subs r0, r0, r1
	lsls r1, r0, #7
	muls r0, r1, r0
	movs r1, #0x80
	lsls r1, r1, #5
	bl __divsi3
	subs r4, r4, r0
	lsls r0, r4, #9
	movs r1, #0x80
	bl __divsi3
	movs r1, #0x80
	lsls r1, r1, #2
	subs r7, r1, r0
	ldr r0, [sp, #4]
	ldrh r0, [r0, #0x2a]
	adds r2, r0, r4
	movs r4, #0xff
	adds r0, r2, #0
	ands r0, r4
	movs r1, #0x80
	lsls r1, r1, #1
	subs r1, r1, r0
	mov sl, r1
	movs r0, #0xb4
	muls r0, r7, r0
	cmp r0, #0
	bge _080BCEB4
	ldr r1, _080BCED0 @ =0x000001FF
	adds r0, r0, r1
_080BCEB4:
	asrs r3, r0, #9
	movs r0, #0x64
	muls r0, r7, r0
	cmp r0, #0
	bge _080BCEC2
	ldr r1, _080BCED0 @ =0x000001FF
	adds r0, r0, r1
_080BCEC2:
	asrs r6, r0, #9
	cmp r7, #7
	bgt _080BCED4
	ldr r0, [sp, #4]
	bl Proc_Break
	b _080BCFB0
	.align 2, 0
_080BCED0: .4byte 0x000001FF
_080BCED4:
	ldr r5, _080BCFC0 @ =0x080C5A48
	adds r1, r2, #0
	subs r1, #0x40
	ands r1, r4
	lsls r0, r1, #1
	adds r0, r0, r5
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r2, r0, #0
	muls r2, r3, r2
	asrs r2, r2, #0xc
	mov r8, r2
	movs r0, #0x38
	add r8, r0
	ldr r0, _080BCFC4 @ =0x000001FF
	mov r2, r8
	ands r2, r0
	mov r8, r2
	adds r1, #0x40
	lsls r1, r1, #1
	adds r1, r1, r5
	movs r2, #0
	ldrsh r0, [r1, r2]
	muls r0, r6, r0
	asrs r0, r0, #0xc
	movs r1, #0x10
	mov sb, r1
	mov r2, sb
	subs r2, r2, r0
	ands r2, r4
	mov sb, r2
	mov r0, sl
	ands r4, r0
	adds r6, r4, #0
	adds r6, #0x40
	lsls r6, r6, #1
	adds r6, r6, r5
	movs r1, #0
	ldrsh r0, [r6, r1]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	mov sl, r0
	mov r2, sl
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov sl, r2
	lsls r4, r4, #1
	adds r4, r4, r5
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
	adds r1, r7, #0
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r1, #0
	ldrsh r0, [r6, r1]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r2, [sp, #4]
	ldrh r1, [r2, #0x2c]
	str r0, [sp]
	adds r0, r1, #0
	mov r1, sl
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	ldr r1, [sp, #4]
	ldrh r1, [r1, #0x2c]
	lsls r0, r1, #9
	add r8, r0
	movs r0, #0xc0
	lsls r0, r0, #2
	add sb, r0
	ldr r3, _080BCFC8 @ =0x08B905C8
	ldr r2, [sp, #4]
	ldrh r2, [r2, #0x30]
	lsrs r0, r2, #5
	movs r1, #0x80
	lsls r1, r1, #8
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #4
	mov r1, r8
	mov r2, sb
	bl PutSpriteExt
	ldr r1, [sp, #4]
	ldrh r0, [r1, #0x2e]
	adds r0, #1
	strh r0, [r1, #0x2e]
_080BCFB0:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BCFC0: .4byte 0x080C5A48
_080BCFC4: .4byte 0x000001FF
_080BCFC8: .4byte 0x08B905C8

	thumb_func_start sub_080BCFCC
sub_080BCFCC: @ 0x080BCFCC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	ldr r0, _080BCFE4 @ =0x08CEF3EC
	bl Proc_Start
	strh r4, [r0, #0x2c]
	strh r5, [r0, #0x2a]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BCFE4: .4byte 0x08CEF3EC

	thumb_func_start sub_080BCFE8
sub_080BCFE8: @ 0x080BCFE8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	mov ip, r1
	adds r5, r3, #0
	lsls r2, r2, #5
	ldr r0, _080BD088 @ =0x02022860
	adds r7, r2, r0
	movs r0, #0x80
	lsls r0, r0, #1
	subs r6, r0, r5
	movs r0, #0xf8
	lsls r0, r0, #7
	mov sl, r0
	movs r0, #0xf
	mov sb, r0
_080BD00E:
	mov r0, r8
	ldrh r4, [r0]
	movs r0, #0x1f
	ands r0, r4
	adds r2, r0, #0
	muls r2, r5, r2
	mov r0, ip
	ldrh r3, [r0]
	movs r0, #0x1f
	ands r0, r3
	muls r0, r6, r0
	adds r2, r2, r0
	asrs r2, r2, #8
	movs r0, #0x1f
	ands r2, r0
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
	asrs r1, r1, #8
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
	asrs r1, r1, #8
	mov r0, sl
	ands r1, r0
	adds r2, r2, r1
	strh r2, [r7]
	adds r7, #2
	movs r0, #2
	add r8, r0
	add ip, r0
	subs r0, #3
	add sb, r0
	mov r0, sb
	cmp r0, #0
	bge _080BD00E
	bl EnablePalSync
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BD088: .4byte 0x02022860

	thumb_func_start Proc_08DB9398_Loop
Proc_08DB9398_Loop: @ 0x080BD08C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r1, [r4, #0x2c]
	adds r0, r0, r1
	str r0, [r4, #0x30]
	movs r5, #0x80
	lsls r5, r5, #1
	cmp r0, r5
	ble _080BD0A2
	str r5, [r4, #0x30]
_080BD0A2:
	ldr r0, [r4, #0x30]
	cmp r0, #0
	bge _080BD0AC
	movs r0, #0
	str r0, [r4, #0x30]
_080BD0AC:
	ldr r0, _080BD0D0 @ =0x020072E0
	adds r1, r0, #0
	subs r1, #0x20
	ldr r2, [r4, #0x34]
	ldr r3, [r4, #0x30]
	bl sub_080BCFE8
	ldr r0, [r4, #0x30]
	cmp r0, r5
	beq _080BD0C4
	cmp r0, #0
	bne _080BD0CA
_080BD0C4:
	adds r0, r4, #0
	bl Proc_Break
_080BD0CA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BD0D0: .4byte 0x020072E0

	thumb_func_start sub_080BD0D4
sub_080BD0D4: @ 0x080BD0D4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	adds r7, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r1, [sp, #0x1c]
	ldr r0, _080BD108 @ =0x08CEF40C
	bl Proc_Start
	adds r5, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne _080BD114
	lsls r0, r6, #5
	ldr r1, _080BD10C @ =0x02022860
	adds r0, r0, r1
	ldr r1, _080BD110 @ =0x020072C0
	movs r2, #8
	bl CpuFastSet
	b _080BD13A
	.align 2, 0
_080BD108: .4byte 0x08CEF40C
_080BD10C: .4byte 0x02022860
_080BD110: .4byte 0x020072C0
_080BD114:
	cmp r4, #0
	bne _080BD130
	str r4, [sp]
	ldr r1, _080BD128 @ =0x020072C0
	ldr r2, _080BD12C @ =0x01000008
	mov r0, sp
	bl CpuFastSet
	b _080BD13A
	.align 2, 0
_080BD128: .4byte 0x020072C0
_080BD12C: .4byte 0x01000008
_080BD130:
	ldr r1, _080BD160 @ =0x020072C0
	adds r0, r4, #0
	movs r2, #8
	bl CpuFastSet
_080BD13A:
	ldr r1, _080BD164 @ =0x020072E0
	adds r0, r7, #0
	movs r2, #8
	bl CpuFastSet
	movs r0, #0
	str r0, [r5, #0x30]
	str r6, [r5, #0x34]
	mov r0, r8
	str r0, [r5, #0x2c]
	bl EnablePalSync
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BD160: .4byte 0x020072C0
_080BD164: .4byte 0x020072E0

	thumb_func_start sub_080BD168
sub_080BD168: @ 0x080BD168
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	lsls r0, r0, #2
	ldr r1, [r4, #0x30]
	adds r1, r1, r0
	str r1, [r4, #0x30]
	movs r5, #0x80
	lsls r5, r5, #1
	cmp r1, r5
	ble _080BD180
	str r5, [r4, #0x30]
_080BD180:
	ldr r0, _080BD1A0 @ =0x020072E0
	adds r1, r0, #0
	subs r1, #0x20
	ldr r2, [r4, #0x34]
	ldr r3, [r4, #0x30]
	bl sub_080BCFE8
	ldr r0, [r4, #0x30]
	cmp r0, r5
	bne _080BD19A
	adds r0, r4, #0
	bl Proc_Break
_080BD19A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BD1A0: .4byte 0x020072E0

	thumb_func_start sub_080BD1A4
sub_080BD1A4: @ 0x080BD1A4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r1, [r4, #0x2c]
	subs r0, r0, r1
	str r0, [r4, #0x30]
	cmp r0, #0
	bge _080BD1B8
	movs r0, #0
	str r0, [r4, #0x30]
_080BD1B8:
	ldr r0, _080BD1D8 @ =0x020072E0
	adds r1, r0, #0
	subs r1, #0x20
	ldr r2, [r4, #0x34]
	ldr r3, [r4, #0x30]
	bl sub_080BCFE8
	ldr r0, [r4, #0x30]
	cmp r0, #0
	bne _080BD1D2
	adds r0, r4, #0
	bl Proc_Break
_080BD1D2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BD1D8: .4byte 0x020072E0

	thumb_func_start sub_080BD1DC
sub_080BD1DC: @ 0x080BD1DC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r6, r0, #0
	adds r7, r1, #0
	adds r5, r2, #0
	mov r8, r3
	ldr r0, [sp, #0x2c]
	ldr r4, [sp, #0x30]
	ldr r1, [sp, #0x34]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	ldr r0, _080BD228 @ =0x08CEF424
	bl Proc_Start
	movs r1, #0
	str r1, [r0, #0x30]
	str r5, [r0, #0x34]
	str r4, [r0, #0x2c]
	bl EnablePalSync
	movs r0, #1
	rsbs r0, r0, #0
	cmp r6, r0
	bne _080BD234
	lsls r0, r5, #5
	ldr r1, _080BD22C @ =0x02022860
	adds r0, r0, r1
	ldr r1, _080BD230 @ =0x020072C0
	movs r2, #8
	bl CpuFastSet
	b _080BD23E
	.align 2, 0
_080BD228: .4byte 0x08CEF424
_080BD22C: .4byte 0x02022860
_080BD230: .4byte 0x020072C0
_080BD234:
	ldr r1, _080BD2C0 @ =0x020072C0
	adds r0, r6, #0
	movs r2, #8
	bl CpuFastSet
_080BD23E:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r7, r0
	bne _080BD2DA
	movs r0, #0
	mov ip, r0
	ldr r0, _080BD2C0 @ =0x020072C0
	movs r1, #0x1f
	mov sl, r1
	mov r6, sl
	mov r5, r8
	ands r6, r5
	lsls r1, r6, #0xa
	str r1, [sp, #4]
	adds r7, r0, #0
	movs r5, #0x20
	adds r5, r5, r7
	mov sb, r5
_080BD262:
	ldr r0, [sp]
	mov r1, ip
	asrs r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080BD2C4
	ldrh r2, [r7]
	movs r5, #0x1f
	mov r8, r5
	mov r3, sl
	ands r3, r2
	movs r4, #0xf8
	lsls r4, r4, #2
	adds r0, r4, #0
	ands r0, r2
	lsls r1, r6, #5
	adds r0, r0, r1
	str r0, [sp, #8]
	movs r1, #0xf8
	lsls r1, r1, #7
	adds r0, r1, #0
	ands r0, r2
	ldr r5, [sp, #4]
	adds r2, r0, r5
	adds r3, r3, r6
	cmp r3, #0x1f
	ble _080BD29C
	movs r3, #0x1f
_080BD29C:
	mov r0, r8
	ands r3, r0
	ldr r0, [sp, #8]
	cmp r0, r4
	ble _080BD2A8
	adds r0, r4, #0
_080BD2A8:
	ands r0, r4
	adds r3, r3, r0
	adds r0, r2, #0
	cmp r0, r1
	ble _080BD2B4
	adds r0, r1, #0
_080BD2B4:
	ands r0, r1
	adds r0, r3, r0
	mov r1, sb
	strh r0, [r1]
	b _080BD2C8
	.align 2, 0
_080BD2C0: .4byte 0x020072C0
_080BD2C4:
	ldrh r0, [r7]
	strh r0, [r7, #0x20]
_080BD2C8:
	adds r7, #2
	movs r5, #2
	add sb, r5
	movs r0, #1
	add ip, r0
	mov r1, ip
	cmp r1, #0xf
	ble _080BD262
	b _080BD2F8
_080BD2DA:
	ldr r4, _080BD308 @ =0x020072E0
	adds r0, r7, #0
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	lsls r1, r5, #5
	ldr r0, _080BD30C @ =0x02022860
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
_080BD2F8:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BD308: .4byte 0x020072E0
_080BD30C: .4byte 0x02022860

	thumb_func_start sub_080BD310
sub_080BD310: @ 0x080BD310
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #8
	adds r4, r0, #0
	ldr r6, _080BD360 @ =0x086740B4
	movs r0, #0x36
	ldrsh r1, [r4, r0]
	movs r0, #0x3e
	ldrsh r2, [r4, r0]
	movs r0, #0xe6
	lsls r0, r0, #6
	mov r8, r0
	movs r0, #5
	str r0, [sp]
	movs r5, #0xa
	str r5, [sp, #4]
	adds r0, r6, #0
	mov r3, r8
	bl StartSpriteAnimProc
	str r0, [r4, #0x2c]
	movs r0, #0x3a
	ldrsh r1, [r4, r0]
	ldr r2, [r4, #0x40]
	asrs r2, r2, #0x10
	movs r0, #6
	str r0, [sp]
	str r5, [sp, #4]
	adds r0, r6, #0
	mov r3, r8
	bl StartSpriteAnimProc
	str r0, [r4, #0x30]
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BD360: .4byte 0x086740B4

	thumb_func_start sub_080BD364
sub_080BD364: @ 0x080BD364
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	movs r0, #0
	mov sb, r0
	ldr r1, _080BD3E0 @ =0x0200750C
	mov sl, r1
_080BD378:
	mov r3, sb
	lsls r5, r3, #2
	adds r0, r6, #0
	adds r0, #0x2c
	adds r0, r0, r5
	mov r8, r0
	ldr r7, [r0]
	cmp r7, #0
	beq _080BD3F6
	adds r2, r6, #0
	adds r2, #0x44
	adds r2, r2, r5
	ldr r0, [r2]
	mov r3, sl
	ldr r1, [r3, #8]
	adds r0, r0, r1
	str r0, [r2]
	adds r4, r6, #0
	adds r4, #0x4c
	adds r4, r4, r5
	ldr r0, [r4]
	ldr r1, [r3, #0xc]
	adds r0, r0, r1
	str r0, [r4]
	adds r3, r6, #0
	adds r3, #0x34
	adds r3, r3, r5
	ldr r0, [r3]
	ldr r1, [r2]
	adds r0, r0, r1
	str r0, [r3]
	adds r1, r6, #0
	adds r1, #0x3c
	adds r1, r1, r5
	ldr r2, [r1]
	ldr r0, [r4]
	adds r2, r2, r0
	str r2, [r1]
	movs r0, #2
	ldrsh r1, [r3, r0]
	asrs r2, r2, #0x10
	cmp r1, #0xf0
	bhi _080BD3D2
	cmp r2, #0
	bge _080BD3E4
_080BD3D2:
	adds r0, r7, #0
	bl EndSpriteAnimProc
	movs r0, #0
	mov r1, r8
	str r0, [r1]
	b _080BD3F6
	.align 2, 0
_080BD3E0: .4byte 0x0200750C
_080BD3E4:
	ldr r0, _080BD420 @ =0x000001FF
	ands r1, r0
	movs r0, #0xff
	ands r2, r0
	adds r0, r7, #0
	movs r3, #0xe6
	lsls r3, r3, #6
	bl SetSpriteAnimProcParameters
_080BD3F6:
	movs r3, #1
	add sb, r3
	mov r0, sb
	cmp r0, #1
	ble _080BD378
	ldr r0, [r6, #0x2c]
	cmp r0, #0
	bne _080BD412
	ldr r0, [r6, #0x30]
	cmp r0, #0
	bne _080BD412
	adds r0, r6, #0
	bl Proc_Break
_080BD412:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BD420: .4byte 0x000001FF

	thumb_func_start sub_080BD424
sub_080BD424: @ 0x080BD424
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	mov sb, r3
	ldr r1, [sp, #0x18]
	ldr r0, _080BD4BC @ =0x08CEF444
	bl Proc_Start
	lsls r1, r4, #0x10
	str r1, [r0, #0x34]
	lsls r6, r6, #0x10
	str r6, [r0, #0x3c]
	adds r4, #0x80
	movs r1, #0xff
	mov r8, r1
	ands r4, r1
	lsls r4, r4, #0x10
	str r4, [r0, #0x38]
	adds r6, #0x20
	str r6, [r0, #0x40]
	ldr r3, _080BD4C0 @ =0x080C5A48
	adds r2, r5, #0
	ands r2, r1
	adds r1, r2, #0
	adds r1, #0x40
	lsls r1, r1, #1
	adds r1, r1, r3
	movs r4, #0
	ldrsh r1, [r1, r4]
	mov r4, sb
	muls r4, r1, r4
	adds r1, r4, #0
	str r1, [r0, #0x44]
	lsls r2, r2, #1
	adds r2, r2, r3
	movs r4, #0
	ldrsh r1, [r2, r4]
	mov r2, sb
	muls r2, r1, r2
	adds r1, r2, #0
	str r1, [r0, #0x4c]
	adds r5, #4
	mov r4, r8
	ands r5, r4
	adds r1, r5, #0
	adds r1, #0x40
	lsls r1, r1, #1
	adds r1, r1, r3
	movs r2, #0
	ldrsh r1, [r1, r2]
	mov r4, sb
	muls r4, r1, r4
	adds r1, r4, #0
	str r1, [r0, #0x48]
	lsls r5, r5, #1
	adds r5, r5, r3
	movs r2, #0
	ldrsh r1, [r5, r2]
	mov r4, sb
	muls r4, r1, r4
	adds r1, r4, #0
	str r1, [r0, #0x50]
	movs r1, #0
	str r1, [r0, #0x2c]
	str r1, [r0, #0x30]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BD4BC: .4byte 0x08CEF444
_080BD4C0: .4byte 0x080C5A48

	thumb_func_start sub_080BD4C4
sub_080BD4C4: @ 0x080BD4C4
	push {lr}
	movs r1, #0x74
	str r1, [r0, #0x2c]
	movs r1, #0
	str r1, [r0, #0x30]
	str r1, [r0, #0x38]
	ldr r0, _080BD4E8 @ =0x085E9AD4
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BD4EC @ =0x085E9AF4
	ldr r1, _080BD4F0 @ =0x06010000
	bl Decompress
	pop {r0}
	bx r0
	.align 2, 0
_080BD4E8: .4byte 0x085E9AD4
_080BD4EC: .4byte 0x085E9AF4
_080BD4F0: .4byte 0x06010000

	thumb_func_start sub_080BD4F4
sub_080BD4F4: @ 0x080BD4F4
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	adds r0, #1
	str r0, [r4, #0x38]
	ldr r1, [r4, #0x30]
	adds r5, r1, r0
	str r5, [r4, #0x30]
	cmp r5, #0x4f
	ble _080BD51A
	adds r0, r4, #0
	bl Proc_Break
	ldr r0, [r4, #0x14]
	movs r1, #2
	bl Proc_Goto
	b _080BD534
_080BD51A:
	ldr r1, [r4, #0x2c]
	ldr r3, _080BD544 @ =0x08B905B0
	ldr r0, [r4, #0x34]
	movs r2, #1
	ands r0, r2
	movs r2, #0x88
	lsls r2, r2, #7
	adds r0, r0, r2
	str r0, [sp]
	movs r0, #4
	adds r2, r5, #0
	bl PutSpriteExt
_080BD534:
	ldr r0, [r4, #0x34]
	adds r0, #1
	str r0, [r4, #0x34]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BD544: .4byte 0x08B905B0

	thumb_func_start sub_080BD548
sub_080BD548: @ 0x080BD548
	push {lr}
	adds r1, r0, #0
	ldr r0, _080BD558 @ =0x08CEF464
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_080BD558: .4byte 0x08CEF464

	thumb_func_start sub_080BD55C
sub_080BD55C: @ 0x080BD55C
	push {lr}
	ldr r0, _080BD56C @ =0x08CEF464
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080BD56C: .4byte 0x08CEF464

	thumb_func_start sub_080BD570
sub_080BD570: @ 0x080BD570
	movs r2, #0
	adds r1, r0, #0
_080BD574:
	ldr r0, [r1]
	cmp r0, #0
	beq _080BD582
	adds r1, #4
	adds r2, #1
	cmp r2, #1
	ble _080BD574
_080BD582:
	adds r0, r2, #0
	bx lr
	.align 2, 0

	thumb_func_start sub_080BD588
sub_080BD588: @ 0x080BD588
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	mov sb, r1
	mov r8, r2
	ldr r1, [r1, #4]
	lsls r0, r2, #3
	adds r0, r0, r1
	ldr r1, [r0]
	mov sl, r1
	ldr r7, [r0, #4]
	cmp r2, #0
	blt _080BD678
	cmp r1, #0
	beq _080BD5DA
	adds r0, r6, #0
	bl GetBgChrOffset
	adds r4, r0, #0
	mov r2, sb
	ldr r2, [r2]
	ldr r1, [r2, #0x14]
	mov r0, r8
	bl __modsi3
	lsls r0, r0, #0xa
	movs r3, #0xc0
	lsls r3, r3, #0x13
	adds r0, r0, r3
	adds r4, r4, r0
	mov r1, sb
	ldr r1, [r1]
	ldr r0, [r1, #0x10]
	adds r4, r4, r0
	mov r0, sl
	adds r1, r4, #0
	bl Decompress
_080BD5DA:
	cmp r7, #0
	beq _080BD638
	ldrb r2, [r7]
	mov sl, r2
	ldrh r3, [r7]
	lsrs r4, r3, #8
	adds r7, #2
	adds r0, r6, #0
	bl GetBgTilemap
	movs r1, #0x1f
	mov r2, r8
	ands r1, r2
	lsls r1, r1, #6
	adds r6, r0, r1
	mov r3, sb
	ldr r5, [r3]
	ldr r1, [r5, #0x14]
	mov r0, r8
	bl __modsi3
	subs r4, r4, r0
	mov r3, sl
	adds r3, #1
	adds r0, r4, #0
	muls r0, r3, r0
	lsls r0, r0, #1
	adds r7, r7, r0
	movs r2, #0
	cmp r2, sl
	bgt _080BD678
	ldr r0, [r5, #4]
	lsls r4, r0, #0xc
	ldr r0, [r5, #0x10]
	lsls r0, r0, #0xf
	lsrs r1, r0, #0x14
	adds r2, r3, #0
_080BD624:
	ldrh r3, [r7]
	adds r0, r3, r4
	adds r0, r0, r1
	strh r0, [r6]
	adds r6, #2
	adds r7, #2
	subs r2, #1
	cmp r2, #0
	bne _080BD624
	b _080BD678
_080BD638:
	mov r1, sb
	ldr r0, [r1]
	ldr r1, [r0, #0x14]
	mov r0, r8
	bl __modsi3
	adds r4, r0, #0
	lsls r4, r4, #5
	adds r0, r6, #0
	bl GetBgTilemap
	movs r1, #0x1f
	mov r2, r8
	ands r1, r2
	lsls r1, r1, #6
	adds r6, r0, r1
	mov r3, sb
	ldr r0, [r3]
	ldr r1, [r0, #4]
	ldr r0, [r0, #0x10]
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x14
	lsls r1, r1, #0xc
	adds r4, r4, r1
	adds r0, r4, r0
	movs r2, #0x1f
_080BD66C:
	strh r0, [r6]
	adds r6, #2
	adds r0, #1
	subs r2, #1
	cmp r2, #0
	bge _080BD66C
_080BD678:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080BD688
sub_080BD688: @ 0x080BD688
	str r1, [r0, #0x3c]
	bx lr

	thumb_func_start sub_080BD68C
sub_080BD68C: @ 0x080BD68C
	movs r1, #0
	str r1, [r0, #0x3c]
	str r1, [r0, #0x34]
	str r1, [r0, #0x30]
	str r1, [r0, #0x2c]
	bx lr

	thumb_func_start sub_080BD698
sub_080BD698: @ 0x080BD698
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r4, r0, #0
	ldr r2, [r4, #0x38]
	asrs r6, r2, #0xa
	mov r1, sp
	ldr r0, _080BD760 @ =0x0867735C
	ldm r0!, {r3, r5, r7}
	stm r1!, {r3, r5, r7}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	beq _080BD756
	ldr r0, [r4, #0x3c]
	adds r0, r2, r0
	str r0, [r4, #0x38]
	cmp r0, #0
	bge _080BD6C8
	movs r0, #0
	str r0, [r4, #0x38]
	adds r0, r4, #0
	bl Proc_Break
_080BD6C8:
	ldr r1, [r4, #0x38]
	asrs r1, r1, #0xa
	ldr r0, [r4, #0x34]
	subs r0, #0x14
	lsls r0, r0, #3
	cmp r1, r0
	ble _080BD6DC
	adds r0, r4, #0
	bl Proc_Break
_080BD6DC:
	ldr r0, [r4, #0x38]
	asrs r5, r0, #0xa
	cmp r6, r5
	beq _080BD756
	cmp r6, r5
	ble _080BD70A
	adds r2, r6, #0
	cmp r6, #0
	bge _080BD6F0
	adds r2, r6, #7
_080BD6F0:
	asrs r2, r2, #3
	adds r0, r5, #0
	cmp r5, #0
	bge _080BD6FA
	adds r0, r5, #7
_080BD6FA:
	asrs r0, r0, #3
	cmp r2, r0
	beq _080BD70A
	ldr r0, [r4, #0x30]
	ldr r1, [r4, #0x2c]
	subs r2, #1
	bl sub_080BD588
_080BD70A:
	cmp r6, r5
	bge _080BD73E
	adds r3, r6, #7
	adds r0, r3, #0
	cmp r3, #0
	bge _080BD71A
	adds r0, r6, #0
	adds r0, #0xe
_080BD71A:
	asrs r1, r0, #3
	adds r0, r5, #7
	cmp r0, #0
	bge _080BD724
	adds r0, #7
_080BD724:
	asrs r0, r0, #3
	cmp r1, r0
	beq _080BD73E
	ldr r0, [r4, #0x30]
	ldr r1, [r4, #0x2c]
	adds r2, r6, #0
	cmp r2, #0
	bge _080BD736
	adds r2, r3, #0
_080BD736:
	asrs r2, r2, #3
	adds r2, #0x14
	bl sub_080BD588
_080BD73E:
	ldr r0, [r4, #0x30]
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	bl EnableBgSync
	ldrh r0, [r4, #0x30]
	lsls r2, r5, #0x10
	lsrs r2, r2, #0x10
	movs r1, #0
	bl SetBgOffset
_080BD756:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BD760: .4byte 0x0867735C

	thumb_func_start sub_080BD764
sub_080BD764: @ 0x080BD764
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	adds r6, r0, #0
	mov r8, r1
	mov sb, r2
	adds r4, r3, #0
	ldr r1, [sp, #0x2c]
	mov r2, sp
	ldr r0, _080BD848 @ =0x0867735C
	ldm r0!, {r3, r5, r7}
	stm r2!, {r3, r5, r7}
	ldr r0, [r0]
	str r0, [r2]
	ldr r0, _080BD84C @ =0x08CEF750
	bl Proc_Start
	adds r5, r0, #0
	movs r0, #0
	str r0, [r5, #0x34]
	ldr r2, [r6, #4]
	ldr r0, [r2]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080BD7AE
	adds r3, r1, #0
	movs r1, #0
_080BD7A0:
	adds r1, #1
	lsls r0, r1, #3
	adds r0, r0, r2
	ldr r0, [r0]
	cmp r0, r3
	bne _080BD7A0
	str r1, [r5, #0x34]
_080BD7AE:
	movs r0, #1
	rsbs r0, r0, #0
	cmp sb, r0
	bne _080BD7BC
	ldr r0, [r5, #0x34]
	subs r0, #0x14
	mov sb, r0
_080BD7BC:
	mov r0, sb
	lsls r2, r0, #0xd
	str r2, [r5, #0x38]
	str r6, [r5, #0x2c]
	mov r1, r8
	str r1, [r5, #0x30]
	str r4, [r5, #0x3c]
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	lsls r2, r2, #6
	lsrs r2, r2, #0x10
	movs r1, #0
	bl SetBgOffset
	ldr r0, [r6]
	ldr r4, [r0, #0xc]
	cmp r4, #0
	beq _080BD7FA
	mov r0, r8
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r0, [r6]
	ldr r0, [r0, #0x10]
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r0, r0, r2
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
_080BD7FA:
	ldr r1, [r6]
	ldr r0, [r1]
	cmp r0, #0
	beq _080BD812
	ldr r2, [r1, #8]
	cmp r2, #0
	beq _080BD812
	ldr r1, [r1, #4]
	lsls r1, r1, #5
	lsls r2, r2, #5
	bl ApplyPaletteExt
_080BD812:
	movs r4, #1
	rsbs r4, r4, #0
	mov r3, r8
	lsls r7, r3, #2
_080BD81A:
	mov r0, sb
	adds r2, r0, r4
	mov r0, r8
	adds r1, r6, #0
	bl sub_080BD588
	adds r4, #1
	cmp r4, #0x13
	ble _080BD81A
	mov r1, sp
	adds r0, r1, r7
	ldr r0, [r0]
	bl EnableBgSync
	adds r0, r5, #0
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080BD848: .4byte 0x0867735C
_080BD84C: .4byte 0x08CEF750
