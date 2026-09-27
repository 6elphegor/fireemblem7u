	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BC5B8
sub_080BC5B8: @ 0x080BC5B8
	push {lr}
	adds r1, r0, #0
	ldr r0, _080BC5C8 @ =0x08CEF264
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_080BC5C8: .4byte 0x08CEF264
