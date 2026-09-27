	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BBBA4
sub_080BBBA4: @ 0x080BBBA4
	push {lr}
	ldr r0, _080BBBB4 @ =0x086005A4
	movs r1, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r0}
	bx r0
	.align 2, 0
_080BBBB4: .4byte 0x086005A4
