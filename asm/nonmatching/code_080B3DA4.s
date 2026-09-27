	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B3DA4
sub_080B3DA4: @ 0x080B3DA4
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B3DB4 @ =0x08CE7650
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_080B3DB4: .4byte 0x08CE7650
