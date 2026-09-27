	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AC940
sub_080AC940: @ 0x080AC940
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _080ACA00 @ =0x0840F9A0
	movs r1, #0
	movs r2, #0x60
	bl ApplyPaletteExt
	ldr r0, _080ACA04 @ =0x08418E44
	ldr r1, _080ACA08 @ =0x06001000
	bl Decompress
	ldr r0, _080ACA0C @ =0x02022C60
	ldr r1, _080ACA10 @ =0x0840FA00
	movs r2, #0x80
	bl TmApplyTsa_thm
	movs r0, #1
	bl EnableBgSync
	ldr r0, _080ACA14 @ =0x084138F0
	movs r1, #0x88
	lsls r1, r1, #2
	movs r2, #0x80
	lsls r2, r2, #1
	bl ApplyPaletteExt
	ldr r0, _080ACA18 @ =0x084120A0
	ldr r1, _080ACA1C @ =0x06010800
	bl Decompress
	ldr r0, _080ACA20 @ =0x084130A4
	ldr r1, _080ACA24 @ =0x06013800
	bl Decompress
	ldr r0, _080ACA28 @ =sub_080AC8A0
	bl SetOnHBlankA
	ldr r4, _080ACA2C @ =0x0840FEB4
	movs r0, #2
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080ACA30 @ =0x02024460
	ldr r1, _080ACA34 @ =0x08411F34
	movs r2, #0
	movs r3, #5
	bl sub_08001F3C
	movs r0, #8
	bl EnableBgSync
	ldr r4, _080ACA38 @ =0x03002870
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r4, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #1]
	adds r0, r5, #0
	bl StartSpinRotation
	str r0, [r5, #0x54]
	movs r0, #3
	ldrb r2, [r4, #0xc]
	orrs r0, r2
	strb r0, [r4, #0xc]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r4, #0x10]
	ands r0, r2
	strb r0, [r4, #0x10]
	adds r0, r1, #0
	ldrb r2, [r4, #0x14]
	ands r0, r2
	movs r2, #2
	orrs r0, r2
	strb r0, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	ands r1, r0
	orrs r1, r2
	strb r1, [r4, #0x18]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080ACA00: .4byte 0x0840F9A0
_080ACA04: .4byte 0x08418E44
_080ACA08: .4byte 0x06001000
_080ACA0C: .4byte 0x02022C60
_080ACA10: .4byte 0x0840FA00
_080ACA14: .4byte 0x084138F0
_080ACA18: .4byte 0x084120A0
_080ACA1C: .4byte 0x06010800
_080ACA20: .4byte 0x084130A4
_080ACA24: .4byte 0x06013800
_080ACA28: .4byte sub_080AC8A0
_080ACA2C: .4byte 0x0840FEB4
_080ACA30: .4byte 0x02024460
_080ACA34: .4byte 0x08411F34
_080ACA38: .4byte 0x03002870
