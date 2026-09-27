	.include "macro.inc"

	.syntax unified

	thumb_func_start QuintessenceFx_Goto_C
QuintessenceFx_Goto_C: @ 0x0807C2EC
	push {lr}
	ldr r0, _0807C300 @ =0x08CA77AC
	bl Proc_Find
	movs r1, #1
	bl Proc_Goto
	pop {r0}
	bx r0
	.align 2, 0
_0807C300: .4byte 0x08CA77AC
