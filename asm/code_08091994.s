	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08091994
sub_08091994: @ 0x08091994
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, _080919BC @ =0x0840E368
	ldr r1, _080919C0 @ =0x06010000
	adds r2, r2, r1
	adds r1, r2, #0
	bl Decompress
	ldr r0, _080919C4 @ =0x0840E3EC
	adds r4, #0x10
	lsls r4, r4, #5
	adds r1, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080919BC: .4byte 0x0840E368
_080919C0: .4byte 0x06010000
_080919C4: .4byte 0x0840E3EC
