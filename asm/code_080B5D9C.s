	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B5D9C
sub_080B5D9C: @ 0x080B5D9C
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r6, r2, #0
	cmp r0, #1
	beq _080B5DB6
	cmp r0, #1
	bgt _080B5DB0
	cmp r0, #0
	beq _080B5DF8
	b _080B5E74
_080B5DB0:
	cmp r0, #2
	beq _080B5E30
	b _080B5E74
_080B5DB6:
	ldr r0, _080B5DF4 @ =0x08574990
	movs r1, #0
	movs r2, #0x80
	bl ApplyPaletteExt
	movs r0, #0xff
	adds r1, r4, #0
	ands r1, r0
	adds r2, r6, #0
	ands r2, r0
	movs r0, #3
	bl SetBgOffset
	movs r5, #1
	rsbs r5, r5, #0
	adds r1, r4, #0
	cmp r1, #0
	bge _080B5DDC
	adds r1, #7
_080B5DDC:
	asrs r4, r1, #3
	adds r2, r6, #0
	cmp r2, #0
	bge _080B5DE6
	adds r2, #7
_080B5DE6:
	asrs r3, r2, #3
	adds r0, r5, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl sub_080B5BFC
	b _080B5E7A
	.align 2, 0
_080B5DF4: .4byte 0x08574990
_080B5DF8:
	ldr r0, _080B5E1C @ =0x085D0A40
	movs r1, #0
	movs r2, #0x80
	bl ApplyPaletteExt
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _080B5E20 @ =0x085D0AC0
	ldr r1, _080B5E24 @ =0x06008000
	bl Decompress
	ldr r0, _080B5E28 @ =0x02024460
	ldr r1, _080B5E2C @ =0x085D5B38
	b _080B5E50
	.align 2, 0
_080B5E1C: .4byte 0x085D0A40
_080B5E20: .4byte 0x085D0AC0
_080B5E24: .4byte 0x06008000
_080B5E28: .4byte 0x02024460
_080B5E2C: .4byte 0x085D5B38
_080B5E30:
	ldr r0, _080B5E60 @ =0x085D5FEC
	movs r1, #0
	movs r2, #0x80
	bl ApplyPaletteExt
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _080B5E64 @ =0x085D606C
	ldr r1, _080B5E68 @ =0x06008000
	bl Decompress
	ldr r0, _080B5E6C @ =0x02024460
	ldr r1, _080B5E70 @ =0x085DB38C
_080B5E50:
	movs r2, #0
	bl TmApplyTsa_thm
	movs r0, #8
	bl EnableBgSync
	b _080B5E7A
	.align 2, 0
_080B5E60: .4byte 0x085D5FEC
_080B5E64: .4byte 0x085D606C
_080B5E68: .4byte 0x06008000
_080B5E6C: .4byte 0x02024460
_080B5E70: .4byte 0x085DB38C
_080B5E74:
	subs r0, #3
	bl sub_080B5D40
_080B5E7A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
