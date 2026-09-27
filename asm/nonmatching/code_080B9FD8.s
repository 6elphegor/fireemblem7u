	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B9FD8
sub_080B9FD8: @ 0x080B9FD8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r1, #0
	str r1, [r5, #0x2c]
	movs r0, #0x18
	str r0, [r5, #0x3c]
	movs r4, #0
	strh r1, [r5, #0x38]
	ldr r0, _080BA0F0 @ =0x08CEED60
	str r0, [r5, #0x30]
	adds r0, r5, #0
	adds r0, #0x34
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	movs r0, #0
	bl SetOnHBlankA
	movs r0, #0
	bl InitBgs
	bl ResetText
	ldr r2, _080BA0F4 @ =0x03002870
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
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r1, #8
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x45
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r0, _080BA0F8 @ =0x085E0280
	movs r1, #0xa0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r4, #0
	ldr r6, _080BA0FC @ =0x06008000
_080BA054:
	ldr r0, [r5, #0x30]
	lsls r1, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _080BA072
	adds r2, r5, #0
	adds r2, #0x36
	ldrb r3, [r2]
	lsls r1, r3, #3
	subs r1, r1, r3
	lsls r1, r1, #0xb
	adds r1, r1, r6
	bl Decompress
_080BA072:
	movs r0, #0x80
	lsls r0, r0, #4
	adds r6, r6, r0
	adds r4, #1
	cmp r4, #6
	ble _080BA054
	adds r1, r5, #0
	adds r1, #0x34
	movs r4, #0
	movs r0, #8
	strb r0, [r1]
	movs r0, #3
	movs r1, #0
	movs r2, #0x60
	bl SetBgOffset
	movs r0, #0x2a
	movs r1, #0
	bl StartBgm
	ldr r3, _080BA0F4 @ =0x03002870
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
	ldr r0, _080BA100 @ =0x0000FFE0
	ldrh r1, [r3, #0x3c]
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	ldr r1, _080BA104 @ =0x0000E0FF
	ands r0, r1
	strh r0, [r3, #0x3c]
	movs r0, #0x20
	ldrb r1, [r2]
	orrs r1, r0
	strb r1, [r2]
	adds r1, r3, #0
	adds r1, #0x3d
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	bl sub_080BA364
	ldr r0, _080BA108 @ =sub_080BA3A0
	bl SetOnHBlankA
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BA0F0: .4byte 0x08CEED60
_080BA0F4: .4byte 0x03002870
_080BA0F8: .4byte 0x085E0280
_080BA0FC: .4byte 0x06008000
_080BA100: .4byte 0x0000FFE0
_080BA104: .4byte 0x0000E0FF
_080BA108: .4byte sub_080BA3A0
