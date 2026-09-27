	.include "macro.inc"

	.syntax unified

	thumb_func_start Title_BmBgfxAnimIN
Title_BmBgfxAnimIN: @ 0x080BA764
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r6, r5, #0
	adds r6, #0x50
	ldrb r0, [r6]
	cmp r0, #8
	bne _080BA78A
	ldr r0, [r5, #0x34]
	movs r1, #0x4c
	str r1, [sp]
	movs r1, #0x10
	str r1, [sp, #4]
	str r5, [sp, #8]
	movs r1, #0x78
	movs r2, #0x3c
	movs r3, #0x78
	bl TitleSpriteBlendIN
_080BA78A:
	ldrb r0, [r6]
	subs r0, #0x30
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x20
	bhi _080BA84A
	ldrb r0, [r6]
	adds r1, r0, #0
	subs r1, #0x30
	lsrs r2, r1, #0x1f
	adds r1, r1, r2
	asrs r7, r1, #1
	cmp r0, #0x30
	bne _080BA810
	ldr r3, _080BA888 @ =0x03002870
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
	adds r4, r3, #0
	adds r4, #0x45
	movs r2, #0x10
	movs r0, #0x10
	strb r0, [r4]
	adds r0, r3, #0
	adds r0, #0x46
	strb r1, [r0]
	ldr r0, _080BA88C @ =0x0000FFE0
	ldrh r4, [r3, #0x3c]
	ands r0, r4
	movs r1, #4
	orrs r0, r1
	ldr r1, _080BA890 @ =0x0000E0FF
	ands r0, r1
	movs r4, #0xf8
	lsls r4, r4, #5
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	movs r0, #1
	ldrb r1, [r3, #1]
	orrs r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	orrs r0, r2
	strb r0, [r3, #1]
	ldr r1, _080BA894 @ =0x0866F274
	str r5, [sp]
	movs r0, #0
	movs r2, #0xe
	movs r3, #0x20
	bl sub_080BD0D4
_080BA810:
	ldr r3, _080BA888 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r4, [r2]
	ands r0, r4
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r7, [r0]
	movs r0, #0x10
	subs r0, r0, r7
	adds r2, #9
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x46
	strb r1, [r0]
	ldrb r2, [r6]
	subs r2, #0x30
	asrs r2, r2, #1
	subs r2, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	bl SetBgOffset
_080BA84A:
	adds r4, r5, #0
	adds r4, #0x50
	ldrb r0, [r4]
	cmp r0, #0x28
	bne _080BA86C
	ldr r0, [r5, #0x30]
	movs r1, #0x48
	str r1, [sp]
	movs r1, #0x10
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	str r5, [sp, #0xc]
	movs r2, #0
	movs r3, #0x78
	bl TitleSpriteBlendOUT
_080BA86C:
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x64
	bne _080BA880
	adds r0, r5, #0
	bl Proc_Break
_080BA880:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BA888: .4byte 0x03002870
_080BA88C: .4byte 0x0000FFE0
_080BA890: .4byte 0x0000E0FF
_080BA894: .4byte 0x0866F274
