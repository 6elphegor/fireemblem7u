	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08024CE0
sub_08024CE0: @ 0x08024CE0
	push {lr}
	ldr r0, _08024CF4 @ =0x08194654
	movs r1, #0xf0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r0}
	bx r0
	.align 2, 0
_08024CF4: .4byte 0x08194654
