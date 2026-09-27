	.include "macro.inc"

	.syntax unified

	thumb_func_start EventSnowStormfx_Init
EventSnowStormfx_Init: @ 0x08011118
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r3, _080111B4 @ =0x03002870
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
	movs r5, #0
	strb r5, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r5, [r0]
	ldr r0, _080111B8 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #4
	orrs r0, r1
	ldr r1, _080111BC @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xc0
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	ldr r0, _080111C0 @ =0x0819D22C
	ldr r1, _080111C4 @ =0x06001000
	bl Decompress
	ldr r4, _080111C8 @ =0x0819D6E4
	movs r1, #0xf0
	lsls r1, r1, #1
	adds r0, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080111CC @ =0x02023C60
	ldr r1, _080111D0 @ =0x0819D724
	ldr r2, _080111D4 @ =0x0000F080
	bl sub_080AACD8
	movs r0, #4
	bl EnableBgSync
	adds r1, r4, #0
	adds r1, #0x20
	movs r0, #1
	str r0, [sp]
	str r6, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x20
	movs r3, #0xf
	bl StartMixPalette
	str r5, [r6, #0x30]
	movs r0, #0x20
	str r0, [r6, #0x34]
	str r5, [r6, #0x3c]
	str r5, [r6, #0x40]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080111B4: .4byte 0x03002870
_080111B8: .4byte 0x0000FFE0
_080111BC: .4byte 0x0000E0FF
_080111C0: .4byte 0x0819D22C
_080111C4: .4byte 0x06001000
_080111C8: .4byte 0x0819D6E4
_080111CC: .4byte 0x02023C60
_080111D0: .4byte 0x0819D724
_080111D4: .4byte 0x0000F080
