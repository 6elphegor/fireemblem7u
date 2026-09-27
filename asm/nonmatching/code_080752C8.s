	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080752C8
sub_080752C8: @ 0x080752C8
	push {r7, lr}
	mov r7, sp
	ldr r0, _080752E8 @ =0x083F5188
	ldr r1, _080752EC @ =0x06013800
	bl Decompress
	ldr r0, _080752F0 @ =0x083F51A8
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080752E8: .4byte 0x083F5188
_080752EC: .4byte 0x06013800
_080752F0: .4byte 0x083F51A8
