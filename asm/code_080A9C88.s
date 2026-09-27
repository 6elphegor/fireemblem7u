	.include "macro.inc"

	.syntax unified

	thumb_func_start EndSysBrownBox
EndSysBrownBox: @ 0x080A9C88
	push {lr}
	ldr r0, _080A9C98 @ =0x08CE4C18
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080A9C98: .4byte 0x08CE4C18
