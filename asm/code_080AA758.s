	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AA758
sub_080AA758: @ 0x080AA758
	push {lr}
	ldr r0, _080AA768 @ =0x08CE4CB0
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080AA768: .4byte 0x08CE4CB0
