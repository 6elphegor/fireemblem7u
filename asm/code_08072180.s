	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08072180
sub_08072180: @ 0x08072180
	push {r4, r5, r7, lr}
	sub sp, #0xc
	add r7, sp, #8
	str r0, [r7]
	ldr r0, _080722AC @ =0x03002870
	ldrb r1, [r0, #0xc]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0xc]
	ldr r0, _080722AC @ =0x03002870
	ldrb r1, [r0, #0x10]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x10]
	ldr r0, _080722AC @ =0x03002870
	ldrb r1, [r0, #0x14]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x14]
	ldr r0, _080722AC @ =0x03002870
	ldrb r1, [r0, #0x18]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x18]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, [r7]
	ldr r4, [r0, #0x50]
	movs r0, #2
	bl GetBgChrOffset
	ldr r2, _080722B0 @ =0x06002800
	adds r1, r0, r2
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080722B4 @ =0x02023C60
	ldr r1, [r7]
	ldr r2, [r1, #0x2c]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r2, _080722B8 @ =0x0202BBB8
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	subs r1, r2, #2
	ldr r2, [r7]
	ldr r3, [r2, #0x2c]
	movs r2, #0x11
	ldrsb r2, [r3, r2]
	ldr r3, _080722B8 @ =0x0202BBB8
	movs r5, #0xe
	ldrsh r4, [r3, r5]
	asrs r3, r4, #4
	adds r5, r3, #0
	lsls r4, r5, #0x10
	asrs r3, r4, #0x10
	subs r2, r2, r3
	lsls r3, r2, #1
	subs r2, r3, #2
	ldr r3, _080722BC @ =0x00004140
	movs r4, #6
	str r4, [sp]
	movs r4, #6
	str r4, [sp, #4]
	bl sub_080147BC
	movs r0, #4
	bl EnableBgSync
	ldr r1, [r7]
	ldr r0, [r1, #0x54]
	ldr r1, [r7]
	str r1, [sp]
	movs r1, #0x80
	movs r2, #0x20
	movs r3, #4
	bl StartPaletteAnimatorNormal
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x40
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x42
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x58
	ldrh r0, [r1]
	ldr r1, [r7]
	ldr r2, [r1, #0x2c]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r2, _080722B8 @ =0x0202BBB8
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #3
	bl PlaySeSpacial
	add sp, #0xc
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080722AC: .4byte 0x03002870
_080722B0: .4byte 0x06002800
_080722B4: .4byte 0x02023C60
_080722B8: .4byte 0x0202BBB8
_080722BC: .4byte 0x00004140
