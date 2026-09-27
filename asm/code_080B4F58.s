	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B4F58
sub_080B4F58: @ 0x080B4F58
	push {lr}
	ldr r0, _080B4F64 @ =0x08CE76C8
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080B4F64: .4byte 0x08CE76C8
