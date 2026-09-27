	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801E9CC
sub_0801E9CC: @ 0x0801E9CC
	push {lr}
	ldr r0, _0801EA08 @ =0x08195520
	ldr r1, _0801EA0C @ =0x06002000
	bl Decompress
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _0801EA10 @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
	cmp r0, #0x40
	beq _0801EA54
	cmp r0, #0x40
	bgt _0801EA14
	cmp r0, #0
	beq _0801EA1A
	b _0801EA66
	.align 2, 0
_0801EA08: .4byte 0x08195520
_0801EA0C: .4byte 0x06002000
_0801EA10: .4byte 0x0202BBF8
_0801EA14:
	cmp r0, #0x80
	beq _0801EA34
	b _0801EA66
_0801EA1A:
	ldr r0, _0801EA28 @ =0x08194794
	ldr r1, _0801EA2C @ =0x06002800
	bl Decompress
	ldr r0, _0801EA30 @ =0x08194C10
	b _0801EA3E
	.align 2, 0
_0801EA28: .4byte 0x08194794
_0801EA2C: .4byte 0x06002800
_0801EA30: .4byte 0x08194C10
_0801EA34:
	ldr r0, _0801EA48 @ =0x08194C30
	ldr r1, _0801EA4C @ =0x06002800
	bl Decompress
	ldr r0, _0801EA50 @ =0x08195088
_0801EA3E:
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
	b _0801EA66
	.align 2, 0
_0801EA48: .4byte 0x08194C30
_0801EA4C: .4byte 0x06002800
_0801EA50: .4byte 0x08195088
_0801EA54:
	ldr r0, _0801EA6C @ =0x081950A8
	ldr r1, _0801EA70 @ =0x06002800
	bl Decompress
	ldr r0, _0801EA74 @ =0x08195500
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
_0801EA66:
	pop {r0}
	bx r0
	.align 2, 0
_0801EA6C: .4byte 0x081950A8
_0801EA70: .4byte 0x06002800
_0801EA74: .4byte 0x08195500
