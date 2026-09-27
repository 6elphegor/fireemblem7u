	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807C2D4
sub_0807C2D4: @ 0x0807C2D4
	push {lr}
	ldr r0, _0807C2E8 @ =0x08CA77AC
	bl Proc_Find
	movs r1, #0
	bl Proc_Goto
	pop {r0}
	bx r0
	.align 2, 0
_0807C2E8: .4byte 0x08CA77AC
