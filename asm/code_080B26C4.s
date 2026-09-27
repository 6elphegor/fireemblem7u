	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B26C4
sub_080B26C4: @ 0x080B26C4
	push {r4, r7, lr}
	sub sp, #8
	add r7, sp, #4
	str r0, [r7]
	ldr r0, _080B2A18 @ =0x08C9D00C
	ldr r1, _080B2A1C @ =HideMu
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
	bl StartTalkFace
	ldr r0, _080B2A24 @ =0x083F42D0
	ldr r1, _080B2A28 @ =0x02020140
	bl Decompress
	ldr r0, _080B2A2C @ =0x02023460
	ldr r1, _080B2A28 @ =0x02020140
	movs r2, #0x80
	lsls r2, r2, #5
	bl TmApplyTsa_thm
	ldr r1, _080B2A30 @ =0x02023660
	adds r0, r1, #0
	movs r1, #0x1e
	movs r2, #0xc
	movs r3, #0
	bl TmFillRect_thm
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
	bl TmApplyTsa_thm
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
_080B2A1C: .4byte HideMu
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
