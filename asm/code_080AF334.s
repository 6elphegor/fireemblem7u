	.include "macro.inc"

	.syntax unified

	thumb_func_start ClassIntro_OnEnd
ClassIntro_OnEnd: @ 0x080AF334
	push {lr}
	bl EndAllProcChildren
	movs r0, #3
	bl SetLordSelectState
	pop {r0}
	bx r0
