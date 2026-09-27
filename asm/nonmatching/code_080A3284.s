	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A3284
sub_080A3284: @ 0x080A3284
	push {lr}
	ldr r0, _080A3294 @ =0x08CE3B6C
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_080A3294: .4byte 0x08CE3B6C
