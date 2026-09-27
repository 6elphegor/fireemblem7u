	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BBD28
sub_080BBD28: @ 0x080BBD28
	push {r4, lr}
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r4, _080BBDB0 @ =0x02022C60
	adds r0, r4, #0
	movs r1, #0
	bl TmFill
	ldr r0, _080BBDB4 @ =0x086758C0
	movs r1, #0xd0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BBDB8 @ =0x08CEF07C
	ldr r0, [r0]
	ldr r1, _080BBDBC @ =0x06008000
	movs r2, #0x80
	lsls r2, r2, #4
	bl CpuFastSet
	ldr r1, _080BBDC0 @ =0x08676BB8
	movs r2, #0xd0
	lsls r2, r2, #8
	adds r0, r4, #0
	bl sub_080AACD8
	movs r0, #1
	bl EnableBgSync
	ldr r3, _080BBDC4 @ =0x03002870
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
	adds r2, #9
	movs r0, #0x10
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x46
	strb r1, [r0]
	ldr r0, _080BBDC8 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #1
	orrs r0, r1
	ldr r1, _080BBDCC @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf8
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BBDB0: .4byte 0x02022C60
_080BBDB4: .4byte 0x086758C0
_080BBDB8: .4byte 0x08CEF07C
_080BBDBC: .4byte 0x06008000
_080BBDC0: .4byte 0x08676BB8
_080BBDC4: .4byte 0x03002870
_080BBDC8: .4byte 0x0000FFE0
_080BBDCC: .4byte 0x0000E0FF
