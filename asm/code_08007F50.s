	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08007F50
sub_08007F50: @ 0x08007F50
	push {lr}
	ldr r0, _08007F60 @ =0x08194674
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r0}
	bx r0
	.align 2, 0
_08007F60: .4byte 0x08194674
