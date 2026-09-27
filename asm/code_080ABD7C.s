	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080ABD7C
sub_080ABD7C: @ 0x080ABD7C
	push {lr}
	bl EndAllProcChildren
	ldr r0, _080ABD8C @ =0x08CE54B4
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080ABD8C: .4byte 0x08CE54B4
