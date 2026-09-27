	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A511C
sub_080A511C: @ 0x080A511C
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A512C @ =0x08CE40F8
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080A512C: .4byte 0x08CE40F8
