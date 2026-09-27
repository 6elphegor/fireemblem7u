	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BBDD0
sub_080BBDD0: @ 0x080BBDD0
	push {r4, lr}
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl sub_080BB2AC
	ldr r4, _080BBE28 @ =0x02022C60
	adds r0, r4, #0
	movs r1, #0
	bl TmFill
	ldr r0, _080BBE2C @ =0x08616D74
	movs r1, #0xd0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BBE30 @ =0x08CEF078
	ldr r0, [r0]
	ldr r1, _080BBE34 @ =0x06008000
	movs r2, #0x80
	lsls r2, r2, #3
	bl CpuFastSet
	adds r4, #0x80
	ldr r1, _080BBE38 @ =0x08616D94
	movs r2, #0xd0
	lsls r2, r2, #8
	adds r0, r4, #0
	bl PutCompressedTsa
	ldr r2, _080BBE3C @ =0x03001620
	ldr r0, [r2]
	movs r1, #0x20
	orrs r0, r1
	str r0, [r2]
	movs r0, #1
	bl EnableBgSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BBE28: .4byte 0x02022C60
_080BBE2C: .4byte 0x08616D74
_080BBE30: .4byte 0x08CEF078
_080BBE34: .4byte 0x06008000
_080BBE38: .4byte 0x08616D94
_080BBE3C: .4byte 0x03001620
