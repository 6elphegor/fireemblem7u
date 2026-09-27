	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08091914
sub_08091914: @ 0x08091914
	push {lr}
	ldr r0, _08091938 @ =sub_080918B4
	bl GetParallelWorker
	bl Proc_End
	ldr r0, _0809193C @ =sub_080918D4
	bl GetParallelWorker
	bl Proc_End
	ldr r0, _08091940 @ =sub_080918F4
	bl GetParallelWorker
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_08091938: .4byte sub_080918B4
_0809193C: .4byte sub_080918D4
_08091940: .4byte sub_080918F4
