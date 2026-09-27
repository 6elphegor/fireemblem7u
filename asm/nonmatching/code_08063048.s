	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxLokmsunaMain
EfxLokmsunaMain: @ 0x08063048
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0
