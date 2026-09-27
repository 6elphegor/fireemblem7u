	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B5B6C
sub_080B5B6C: @ 0x080B5B6C
	push {lr}
	ldr r0, _080B5B7C @ =0x08CE77F0
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080B5B7C: .4byte 0x08CE77F0
