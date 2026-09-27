	.include "macro.inc"

	.syntax unified

	thumb_func_start DrawFinImage
DrawFinImage: @ 0x080B8EA8
	push {lr}
	ldr r0, _080B8ED4 @ =0x085DDC7C
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080B8ED8 @ =0x085DDC9C
	ldr r1, _080B8EDC @ =0x06001000
	bl Decompress
	ldr r0, _080B8EE0 @ =0x02023C60
	ldr r1, _080B8EE4 @ =0x085DE098
	ldr r2, _080B8EE8 @ =0x0000E080
	bl TmApplyTsa_thm
	movs r0, #4
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_080B8ED4: .4byte 0x085DDC7C
_080B8ED8: .4byte 0x085DDC9C
_080B8EDC: .4byte 0x06001000
_080B8EE0: .4byte 0x02023C60
_080B8EE4: .4byte 0x085DE098
_080B8EE8: .4byte 0x0000E080
