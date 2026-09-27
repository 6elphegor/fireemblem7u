	.include "macro.inc"

	.syntax unified

	thumb_func_start EndCgTextInterpreter
EndCgTextInterpreter: @ 0x08088A7C
	push {lr}
	ldr r0, _08088A8C @ =0x08CC3114
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_08088A8C: .4byte 0x08CC3114
