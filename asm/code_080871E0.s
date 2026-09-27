	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080871E0
sub_080871E0: @ 0x080871E0
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r5, [r4, #0x14]
	bl ApplySystemObjectsGraphics
	ldr r0, _08087294 @ =0x08403914
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x60
	bl ApplyPaletteExt
	ldr r0, _08087298 @ =0x08403974
	movs r1, #0xb8
	lsls r1, r1, #2
	movs r2, #0x40
	bl ApplyPaletteExt
	ldr r0, _0808729C @ =0x08403410
	ldr r1, _080872A0 @ =0x06016000
	bl Decompress
	adds r4, #0x64
	movs r0, #0
	strh r0, [r4]
	movs r0, #0xc0
	lsls r0, r0, #2
	bl SysBlackBoxSetGfx
	adds r0, r5, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0
	bne _0808723A
	ldr r2, _080872A4 @ =0x00000405
	movs r0, #3
	str r0, [sp]
	movs r0, #0x80
	lsls r0, r0, #4
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #7
	movs r3, #0x17
	bl EnableSysBlackBox
_0808723A:
	adds r0, r5, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r0, #0
	beq _0808725A
	ldr r2, _080872A8 @ =0x00000404
	movs r0, #2
	str r0, [sp]
	movs r0, #0x80
	lsls r0, r0, #4
	str r0, [sp, #4]
	movs r0, #1
	movs r1, #0xc2
	movs r3, #5
	bl EnableSysBlackBox
_0808725A:
	ldr r2, _080872AC @ =0x0000044E
	movs r0, #6
	str r0, [sp]
	movs r0, #0x80
	lsls r0, r0, #4
	str r0, [sp, #4]
	movs r0, #2
	movs r1, #0x84
	movs r3, #0xd
	bl EnableSysBlackBox
	movs r0, #0x80
	movs r1, #0x13
	bl PutChapterTitlePalette
	movs r4, #0xb8
	lsls r4, r4, #4
	ldr r0, _080872B0 @ =0x0202BBF8
	bl GetChapterTitle
	adds r1, r0, #0
	adds r0, r4, #0
	bl PutChapterTitleGfx
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08087294: .4byte 0x08403914
_08087298: .4byte 0x08403974
_0808729C: .4byte 0x08403410
_080872A0: .4byte 0x06016000
_080872A4: .4byte 0x00000405
_080872A8: .4byte 0x00000404
_080872AC: .4byte 0x0000044E
_080872B0: .4byte 0x0202BBF8
