	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxSpecalEffectMain
EfxSpecalEffectMain: @ 0x0806342C
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0
