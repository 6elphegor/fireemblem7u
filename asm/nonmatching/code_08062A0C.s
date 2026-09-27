	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxHurtmutEff00Main
EfxHurtmutEff00Main: @ 0x08062A0C
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0
