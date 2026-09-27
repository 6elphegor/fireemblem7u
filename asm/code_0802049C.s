	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802049C
sub_0802049C: @ 0x0802049C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _08020540 @ =0x08199B34
	ldr r1, _08020544 @ =0x06002000
	bl Decompress
	ldr r0, _08020548 @ =0x0819B258
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0802054C @ =0x0819B278
	ldr r4, _08020550 @ =0x0200323C
	adds r1, r4, #0
	bl Decompress
	movs r0, #0x84
	lsls r0, r0, #6
	adds r1, r0, #0
	movs r5, #0xd8
	lsls r5, r5, #2
_080204C6:
	ldrh r2, [r4]
	adds r0, r1, r2
	strh r0, [r4]
	adds r4, #2
	subs r5, #1
	cmp r5, #0
	bne _080204C6
	ldr r0, _08020554 @ =0x02022C60
	movs r1, #0x80
	lsls r1, r1, #1
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	ldr r0, _08020558 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080204F8
	movs r0, #0xb6
	lsls r0, r0, #2
	bl m4aSongNumStart
_080204F8:
	ldr r3, _0802055C @ =0x03002870
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
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r5, [r0]
	ldr r0, _08020560 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #1
	orrs r0, r1
	ldr r1, _08020564 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf0
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	adds r0, r6, #0
	adds r0, #0x4c
	strh r5, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08020540: .4byte 0x08199B34
_08020544: .4byte 0x06002000
_08020548: .4byte 0x0819B258
_0802054C: .4byte 0x0819B278
_08020550: .4byte 0x0200323C
_08020554: .4byte 0x02022C60
_08020558: .4byte 0x0202BBF8
_0802055C: .4byte 0x03002870
_08020560: .4byte 0x0000FFE0
_08020564: .4byte 0x0000E0FF
