	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B7530
sub_080B7530: @ 0x080B7530
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_080B6E28
	ldr r0, _080B75C0 @ =0x08194714
	movs r1, #0xd0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r0, r4, #0
	adds r0, #0x42
	ldrh r1, [r0]
	adds r0, #2
	movs r5, #0
	strh r1, [r0]
	ldr r0, [r4, #0x34]
	ldr r0, [r0]
	bl DecodeMsg
	str r0, [r4, #0x2c]
	bl MsgExpand
	str r0, [r4, #0x2c]
	ldr r0, _080B75C4 @ =0x02000830
	str r0, [r4, #0x30]
	movs r0, #1
	bl SetTextFontGlyphs
	ldr r0, [r4, #0x30]
	ldr r1, [r4, #0x2c]
	bl sub_080B6E84
	ldr r2, _080B75C8 @ =0x03002870
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
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	ldr r0, _080B75CC @ =0x0000FFE0
	ldrh r1, [r2, #0x3c]
	ands r0, r1
	ldr r1, _080B75D0 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xf8
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2, #0x3c]
	adds r1, r2, #0
	adds r1, #0x3d
	movs r0, #0x20
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _080B75D4 @ =sub_080B74B4
	adds r1, r4, #0
	bl StartParallelWorker
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B75C0: .4byte 0x08194714
_080B75C4: .4byte 0x02000830
_080B75C8: .4byte 0x03002870
_080B75CC: .4byte 0x0000FFE0
_080B75D0: .4byte 0x0000E0FF
_080B75D4: .4byte sub_080B74B4
