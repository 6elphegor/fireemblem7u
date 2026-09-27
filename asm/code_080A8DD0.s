	.include "macro.inc"

	.syntax unified

	thumb_func_start EndUiSpinningArrows
EndUiSpinningArrows: @ 0x080A8DD0
	push {lr}
	ldr r0, _080A8DE0 @ =0x08CE4A40
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080A8DE0: .4byte 0x08CE4A40
