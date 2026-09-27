	.include "macro.inc"

	.syntax unified

	thumb_func_start EndCgText
EndCgText: @ 0x08087D44
	push {lr}
	ldr r0, _08087D54 @ =0x08CC306C
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_08087D54: .4byte 0x08CC306C
