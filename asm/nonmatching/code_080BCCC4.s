	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BCCC4
sub_080BCCC4: @ 0x080BCCC4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _080BCCE8 @ =0x085E9D2C
	movs r1, #0x88
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BCCEC @ =0x08CEF4BC
	str r0, [r5, #0x2c]
	movs r4, #0
	str r4, [r5, #0x38]
	bl sub_080BCAFC
	str r4, [r5, #0x3c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BCCE8: .4byte 0x085E9D2C
_080BCCEC: .4byte 0x08CEF4BC
