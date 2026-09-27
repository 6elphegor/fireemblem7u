	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807EB38
sub_0807EB38: @ 0x0807EB38
	push {lr}
	adds r1, r0, #0
	ldr r0, _0807EB48 @ =0x08CBFC94
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0807EB48: .4byte 0x08CBFC94
