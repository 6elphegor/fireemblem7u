	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800ED4C
sub_0800ED4C: @ 0x0800ED4C
	push {lr}
	movs r0, #6
	bl Proc_EndEachMarked
	movs r0, #7
	bl Proc_EndEachMarked
	movs r0, #5
	bl Proc_EndEachMarked
	bl EndAllMus
	pop {r0}
	bx r0
