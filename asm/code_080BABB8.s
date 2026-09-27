	.include "macro.inc"

	.syntax unified

	thumb_func_start Title_StartTextFlame
Title_StartTextFlame: @ 0x080BABB8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp, #8]
	ldr r7, _080BAD38 @ =0x03002870
	movs r0, #1
	ldrb r1, [r7, #1]
	orrs r0, r1
	movs r2, #2
	orrs r0, r2
	movs r1, #4
	mov sb, r1
	mov r2, sb
	orrs r0, r2
	movs r1, #8
	mov sl, r1
	mov r2, sl
	orrs r0, r2
	movs r1, #0x10
	mov r8, r1
	mov r2, r8
	orrs r0, r2
	strb r0, [r7, #1]
	ldr r0, _080BAD3C @ =0x08672570
	ldr r2, _080BAD40 @ =0x0000084C
	movs r1, #7
	str r1, [sp]
	movs r1, #0xa
	str r1, [sp, #4]
	movs r1, #0x78
	movs r3, #0
	bl StartSpriteAnimProc
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r7, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r7, #1]
	adds r6, r7, #0
	adds r6, #0x34
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r6]
	ands r0, r2
	movs r5, #3
	rsbs r5, r5, #0
	ands r0, r5
	movs r4, #5
	rsbs r4, r4, #0
	ands r0, r4
	movs r3, #9
	rsbs r3, r3, #0
	ands r0, r3
	movs r2, #0x11
	rsbs r2, r2, #0
	ands r0, r2
	strb r0, [r6]
	adds r6, #3
	movs r0, #1
	ldrb r2, [r6]
	orrs r0, r2
	ands r0, r5
	ands r0, r4
	ands r0, r3
	mov r2, r8
	orrs r0, r2
	adds r3, r7, #0
	adds r3, #0x36
	ldrb r2, [r3]
	ands r1, r2
	movs r2, #2
	orrs r1, r2
	mov r2, sb
	orrs r1, r2
	mov r2, sl
	orrs r1, r2
	mov r2, r8
	orrs r1, r2
	movs r2, #0x20
	orrs r0, r2
	strb r0, [r6]
	orrs r1, r2
	strb r1, [r3]
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
	movs r1, #0
	strb r1, [r0]
	adds r2, #9
	movs r0, #0x10
	strb r0, [r2]
	adds r0, r7, #0
	adds r0, #0x46
	strb r1, [r0]
	ldr r0, _080BAD44 @ =0x0000FFE0
	ldrh r2, [r7, #0x3c]
	ands r0, r2
	movs r1, #3
	orrs r0, r1
	ldr r1, _080BAD48 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf8
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x3c]
	ldr r1, _080BAD4C @ =0x02000000
	ldr r2, _080BAD50 @ =0x00003F43
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _080BAD54 @ =0x02000002
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r7, #0xc]
	ands r0, r2
	strb r0, [r7, #0xc]
	adds r0, r1, #0
	ldrb r2, [r7, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r7, #0x10]
	ldrb r0, [r7, #0x14]
	ands r1, r0
	movs r2, #2
	orrs r1, r2
	strb r1, [r7, #0x14]
	movs r0, #3
	ldrb r1, [r7, #0x18]
	orrs r0, r1
	strb r0, [r7, #0x18]
	ldr r2, _080BAD58 @ =0x0000FFCC
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldr r0, _080BAD5C @ =0x08676E04
	movs r1, #0xc0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BAD60 @ =0x08676E24
	ldr r1, _080BAD64 @ =0x06005000
	bl Decompress
	ldr r0, _080BAD68 @ =0x02022C60
	ldr r1, _080BAD6C @ =0x086771DC
	ldr r2, _080BAD70 @ =0x0000C280
	bl sub_080AACD8
	movs r0, #1
	bl EnableBgSync
	bl InitScanlineEffect
	ldr r0, _080BAD74 @ =sub_080BAB24
	bl SetOnHBlankA
	ldr r0, _080BAD78 @ =0x08CEF034
	ldr r1, [sp, #8]
	bl Proc_Start
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BAD38: .4byte 0x03002870
_080BAD3C: .4byte 0x08672570
_080BAD40: .4byte 0x0000084C
_080BAD44: .4byte 0x0000FFE0
_080BAD48: .4byte 0x0000E0FF
_080BAD4C: .4byte 0x02000000
_080BAD50: .4byte 0x00003F43
_080BAD54: .4byte 0x02000002
_080BAD58: .4byte 0x0000FFCC
_080BAD5C: .4byte 0x08676E04
_080BAD60: .4byte 0x08676E24
_080BAD64: .4byte 0x06005000
_080BAD68: .4byte 0x02022C60
_080BAD6C: .4byte 0x086771DC
_080BAD70: .4byte 0x0000C280
_080BAD74: .4byte sub_080BAB24
_080BAD78: .4byte 0x08CEF034
