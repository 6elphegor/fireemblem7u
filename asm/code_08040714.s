	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08040714
sub_08040714: @ 0x08040714
	push {r4, r5, r6, lr}
	sub sp, #0x1c
	adds r6, r0, #0
	bl ClearSioBG
	bl sub_08047B34
	ldr r0, _08040830 @ =0x081C5BE0
	ldr r1, _08040834 @ =0x06014800
	bl Decompress
	ldr r0, _08040838 @ =0x081C6DEC
	ldr r1, _0804083C @ =0x06016000
	bl Decompress
	ldr r0, _08040840 @ =0x081C64A4
	ldr r1, _08040844 @ =0x06016800
	bl Decompress
	movs r4, #0x98
	lsls r4, r4, #2
	movs r5, #3
_08040740:
	ldr r0, _08040848 @ =0x081C8164
	adds r1, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r4, #0x20
	subs r5, #1
	cmp r5, #0
	bge _08040740
	movs r0, #0
	movs r1, #2
	bl sub_08047BD4
	ldr r4, _0804084C @ =0x0203D90C
	ldrb r0, [r4, #3]
	add r1, sp, #8
	bl ReadMultiArenaSaveTeamName
	ldr r0, _08040850 @ =0x0203DA60
	bl SetTextFont
	bl InitSystemTextFont
	bl ResetTextFont
	bl sub_0803DCF0
	movs r5, #0
	adds r4, #0x9c
	movs r2, #0xff
_0804077C:
	adds r1, r5, r4
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r5, #1
	cmp r5, #3
	ble _0804077C
	bl sub_08040640
	movs r5, #0
	ldr r2, _08040854 @ =0x030046C6
_08040792:
	adds r0, r5, r2
	mov r1, sp
	adds r1, r1, r5
	adds r1, #8
	ldrb r1, [r1]
	strb r1, [r0]
	adds r5, #1
	cmp r5, #0x12
	ble _08040792
	movs r0, #0
	str r0, [r6, #0x34]
	str r0, [r6, #0x30]
	movs r0, #0xc0
	movs r1, #0x10
	adds r2, r6, #0
	bl StartLinkArenaButtonSpriteDraw
	movs r0, #0x48
	movs r1, #0x20
	adds r2, r6, #0
	bl StartLinkArenaVersusSpriteDraw
	str r0, [r6, #0x2c]
	ldr r0, _08040858 @ =0x08B99064
	bl SetFaceConfig
	movs r0, #2
	str r0, [sp]
	movs r0, #3
	movs r1, #0xdf
	movs r2, #0xd0
	movs r3, #0x50
	bl StartFace
	ldr r0, [r6, #0x2c]
	ldr r1, _0804085C @ =0x081D5260
	ldr r4, _0804084C @ =0x0203D90C
	ldrb r2, [r4]
	adds r1, r2, r1
	ldrb r1, [r1]
	bl StartLinkArenaTitleBanner
	ldr r0, _08040860 @ =0x08B98CA8
	ldrb r3, [r4]
	lsls r1, r3, #2
	adds r0, r1, r0
	ldr r0, [r0]
	ldr r2, _08040864 @ =0x081D5254
	adds r1, r1, r2
	ldr r1, [r1]
	str r3, [sp]
	ldr r2, [r6, #0x2c]
	str r2, [sp, #4]
	movs r2, #0
	movs r3, #8
	bl sub_08047E84
	ldr r0, [r6, #0x30]
	ldr r1, _08040868 @ =0x000003C6
	adds r0, r0, r1
	movs r1, #1
	bl PutSioText
	ldr r2, _0804086C @ =0x03002870
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	add sp, #0x1c
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08040830: .4byte 0x081C5BE0
_08040834: .4byte 0x06014800
_08040838: .4byte 0x081C6DEC
_0804083C: .4byte 0x06016000
_08040840: .4byte 0x081C64A4
_08040844: .4byte 0x06016800
_08040848: .4byte 0x081C8164
_0804084C: .4byte 0x0203D90C
_08040850: .4byte 0x0203DA60
_08040854: .4byte 0x030046C6
_08040858: .4byte 0x08B99064
_0804085C: .4byte 0x081D5260
_08040860: .4byte 0x08B98CA8
_08040864: .4byte 0x081D5254
_08040868: .4byte 0x000003C6
_0804086C: .4byte 0x03002870
