	.include "macro.inc"

	.syntax unified

	thumb_func_start ApplySystemObjectsGraphics
ApplySystemObjectsGraphics: @ 0x08015590
	push {r4, lr}
	ldr r0, _080155BC @ =0x08193E90
	ldr r4, _080155C0 @ =0x02020140
	adds r1, r4, #0
	bl Decompress
	ldr r1, _080155C4 @ =0x06010000
	adds r0, r4, #0
	movs r2, #0x12
	movs r3, #4
	bl Copy2dChr
	ldr r0, _080155C8 @ =0x0819431C
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x40
	bl ApplyPaletteExt
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080155BC: .4byte 0x08193E90
_080155C0: .4byte 0x02020140
_080155C4: .4byte 0x06010000
_080155C8: .4byte 0x0819431C
