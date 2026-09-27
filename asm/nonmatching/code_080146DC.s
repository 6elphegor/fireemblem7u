	.include "macro.inc"

	.syntax unified

	thumb_func_start DeleteAllPaletteAnimator
DeleteAllPaletteAnimator: @ 0x080146DC
	push {lr}
	ldr r0, _080146E8 @ =0x08B92A00
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080146E8: .4byte 0x08B92A00
