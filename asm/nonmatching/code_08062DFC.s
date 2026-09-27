	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxSunakemuriMain
EfxSunakemuriMain: @ 0x08062DFC
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0
