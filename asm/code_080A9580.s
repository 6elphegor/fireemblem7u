	.include "macro.inc"

	.syntax unified

	thumb_func_start EndSysHandCursor
EndSysHandCursor: @ 0x080A9580
	push {lr}
	ldr r0, _080A9590 @ =0x08CE4AC8
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080A9590: .4byte 0x08CE4AC8
