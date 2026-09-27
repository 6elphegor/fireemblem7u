	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BCB1C
sub_080BCB1C: @ 0x080BCB1C
	push {lr}
	adds r2, r1, #0
	ldr r1, _080BCB30 @ =0x08CEF074
	ldr r1, [r1]
	adds r1, r1, r2
	bl Decompress
	pop {r0}
	bx r0
	.align 2, 0
_080BCB30: .4byte 0x08CEF074
