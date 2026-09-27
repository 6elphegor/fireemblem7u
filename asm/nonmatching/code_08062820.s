	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxYushaSpinShieldMain
EfxYushaSpinShieldMain: @ 0x08062820
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0
