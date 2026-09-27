	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807EB4C
sub_0807EB4C: @ 0x0807EB4C
	push {lr}
	ldr r0, _0807EB58 @ =0x08CBFC94
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0807EB58: .4byte 0x08CBFC94
