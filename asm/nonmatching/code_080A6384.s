	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A6384
sub_080A6384: @ 0x080A6384
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A6394 @ =0x08CE4398
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_080A6394: .4byte 0x08CE4398
