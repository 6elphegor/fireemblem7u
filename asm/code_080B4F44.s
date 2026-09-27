	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B4F44
sub_080B4F44: @ 0x080B4F44
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B4F54 @ =0x08CE76C8
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_080B4F54: .4byte 0x08CE76C8
