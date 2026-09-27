	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B3C04
sub_080B3C04: @ 0x080B3C04
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B3C14 @ =0x08CE7630
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_080B3C14: .4byte 0x08CE7630
