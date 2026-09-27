	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807E67C
sub_0807E67C: @ 0x0807E67C
	push {lr}
	ldr r0, _0807E688 @ =0x08CBFC74
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0807E688: .4byte 0x08CBFC74
