	.include "macro.inc"

	.syntax unified

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
