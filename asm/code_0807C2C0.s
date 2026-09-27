	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807C2C0
sub_0807C2C0: @ 0x0807C2C0
	push {lr}
	adds r1, r0, #0
	ldr r0, _0807C2D0 @ =0x08CA77AC
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0807C2D0: .4byte 0x08CA77AC
