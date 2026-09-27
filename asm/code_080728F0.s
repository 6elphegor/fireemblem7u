	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080728F0
sub_080728F0: @ 0x080728F0
	push {r4, r7, lr}
	sub sp, #0xc
	add r7, sp, #8
	str r0, [r7]
	ldr r1, _080729EC @ =0x0202BBF8
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _0807290E
	movs r0, #0xb3
	bl m4aSongNumStart
_0807290E:
	ldr r0, _080729F0 @ =0x083F6D78
	ldr r1, _080729F4 @ =0x06013800
	bl Decompress
	ldr r0, _080729F8 @ =0x083F7030
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #4
	bl SetWhitePal
	movs r0, #2
	bl GetBgChrOffset
	ldr r2, _080729FC @ =0x06002800
	adds r1, r0, r2
	ldr r2, _08072A00 @ =0x0000FFFF
	adds r0, r1, #0
	movs r1, #0x10
	bl sub_08014B94
	ldr r0, _08072A04 @ =0x02023C60
	movs r1, #0x80
	lsls r1, r1, #3
	ldr r2, _08072A08 @ =0x00004140
	bl sub_08014B94
	movs r0, #4
	bl EnableBgSync
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
	strh r2, [r0]
	ldr r0, _08072A0C @ =0x083ECCA0
	ldr r1, [r7]
	ldr r2, [r1, #0x30]
	adds r1, r2, #4
	ldr r3, [r7]
	ldr r2, [r3, #0x34]
	ldr r3, _08072A10 @ =0x000041C0
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	bl InitScanlineEffect
	bl sub_0807689C
	bl sub_08073D80
	ldr r0, _08072A14 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072A14 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072A14 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08072A14 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080729EC: .4byte 0x0202BBF8
_080729F0: .4byte 0x083F6D78
_080729F4: .4byte 0x06013800
_080729F8: .4byte 0x083F7030
_080729FC: .4byte 0x06002800
_08072A00: .4byte 0x0000FFFF
_08072A04: .4byte 0x02023C60
_08072A08: .4byte 0x00004140
_08072A0C: .4byte 0x083ECCA0
_08072A10: .4byte 0x000041C0
_08072A14: .4byte 0x03002870
