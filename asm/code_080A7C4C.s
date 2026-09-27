	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A7C4C
sub_080A7C4C: @ 0x080A7C4C
	push {lr}
	ldr r0, _080A7C5C @ =0x08CE48F0
	bl Proc_Find
	ldr r0, [r0, #0x44]
	pop {r1}
	bx r1
	.align 2, 0
_080A7C5C: .4byte 0x08CE48F0
