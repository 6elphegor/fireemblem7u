	.include "macro.inc"

	.syntax unified

	thumb_func_start EndSysBlackBoxs
EndSysBlackBoxs: @ 0x080A92D4
	push {lr}
	ldr r0, _080A92E4 @ =0x08CE4A80
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080A92E4: .4byte 0x08CE4A80
