	.include "macro.inc"

	.syntax unified

	thumb_func_start SioPostBattle_Init
SioPostBattle_Init: @ 0x0803FF80
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	bl ClearSioBG
	bl sub_08047B34
	ldr r0, _080400E4 @ =0x081C5BE0
	ldr r1, _080400E8 @ =0x06014800
	bl Decompress
	ldr r0, _080400EC @ =0x081C6DEC
	ldr r1, _080400F0 @ =0x06016000
	bl Decompress
	ldr r0, _080400F4 @ =0x081C7018
	ldr r1, _080400F8 @ =0x06016800
	bl Decompress
	ldr r0, _080400FC @ =0x081C7F04
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x80
	bl ApplyPaletteExt
	ldr r0, _08040100 @ =0x081C80A4
	movs r1, #0xb8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08040104 @ =0x081C7794
	ldr r1, _08040108 @ =0x06000C00
	bl Decompress
	ldr r0, _0804010C @ =0x081C80E4
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r4, _08040110 @ =0x081C9F68
	movs r0, #3
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _08040114 @ =0x081CB5BC
	movs r1, #0xa0
	lsls r1, r1, #1
	movs r2, #0x80
	bl ApplyPaletteExt
	ldr r0, _08040118 @ =0x02024460
	ldr r1, _0804011C @ =0x081CB63C
	movs r2, #0
	bl TmApplyTsa_thm
	ldr r0, _08040120 @ =0x02000C60
	ldr r1, _08040124 @ =0x06012000
	movs r2, #0xe
	bl InitSpriteTextFont
	ldr r0, _08040128 @ =0x08194674
	movs r1, #0xf0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #0
	bl SetTextFontGlyphs
	bl ResetTextFont
	ldr r4, _0804012C @ =0x0203DA10
	movs r5, #1
_08040020:
	adds r0, r4, #0
	bl InitSpriteText
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _08040020
	ldr r0, _08040130 @ =0x08B98AEC
	ldr r0, [r0]
	ldrb r2, [r0, #7]
	adds r1, r6, #0
	adds r1, #0x40
	movs r3, #0
	strb r2, [r1]
	ldrb r1, [r0, #7]
	adds r2, r6, #0
	adds r2, #0x41
	strb r1, [r2]
	ldrb r0, [r0, #6]
	adds r1, r6, #0
	adds r1, #0x42
	strb r0, [r1]
	mov r0, sp
	movs r5, #0
	strh r3, [r0]
	adds r4, r6, #0
	adds r4, #0x44
	ldr r2, _08040134 @ =0x01000010
	adds r1, r4, #0
	bl CpuSet
	adds r0, r4, #0
	bl sub_080440E8
	adds r0, r6, #0
	bl sub_0803FEAC
	movs r0, #0xb0
	str r0, [r6, #0x64]
	movs r0, #2
	movs r1, #0
	movs r2, #0xb0
	bl SetBgOffset
	ldr r3, _08040138 @ =0x03002870
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r3, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
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
	movs r1, #8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r5, [r0]
	ldr r0, _0804013C @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #4
	orrs r0, r1
	ldr r1, _08040140 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	adds r0, r6, #0
	bl SioPostBattle_StartMusicProc
	movs r0, #8
	bl EnableBgSync
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080400E4: .4byte 0x081C5BE0
_080400E8: .4byte 0x06014800
_080400EC: .4byte 0x081C6DEC
_080400F0: .4byte 0x06016000
_080400F4: .4byte 0x081C7018
_080400F8: .4byte 0x06016800
_080400FC: .4byte 0x081C7F04
_08040100: .4byte 0x081C80A4
_08040104: .4byte 0x081C7794
_08040108: .4byte 0x06000C00
_0804010C: .4byte 0x081C80E4
_08040110: .4byte 0x081C9F68
_08040114: .4byte 0x081CB5BC
_08040118: .4byte 0x02024460
_0804011C: .4byte 0x081CB63C
_08040120: .4byte 0x02000C60
_08040124: .4byte 0x06012000
_08040128: .4byte 0x08194674
_0804012C: .4byte 0x0203DA10
_08040130: .4byte 0x08B98AEC
_08040134: .4byte 0x01000010
_08040138: .4byte 0x03002870
_0804013C: .4byte 0x0000FFE0
_08040140: .4byte 0x0000E0FF
