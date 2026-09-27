	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080431AC
sub_080431AC: @ 0x080431AC
	push {lr}
	adds r1, r0, #0
	ldr r0, _080431BC @ =0x08B9981C
	bl sub_0800AF68
	pop {r0}
	bx r0
	.align 2, 0
_080431BC: .4byte 0x08B9981C
