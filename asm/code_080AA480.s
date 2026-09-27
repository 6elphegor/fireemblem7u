	.include "macro.inc"

	.syntax unified

	thumb_func_start EndFadeInOut
EndFadeInOut: @ 0x080AA480
	push {lr}
	ldr r0, _080AA49C @ =0x08CE4C50
	bl Proc_Find
	bl Proc_End
	ldr r0, _080AA4A0 @ =0x08CE4C80
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080AA49C: .4byte 0x08CE4C50
_080AA4A0: .4byte 0x08CE4C80
