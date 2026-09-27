	.include "macro.inc"

	.syntax unified

	thumb_func_start EndAllParallelWorkers
EndAllParallelWorkers: @ 0x080A931C
	push {lr}
	b _080A9324
_080A9320:
	bl Proc_End
_080A9324:
	ldr r0, _080A9334 @ =0x08CE4AB0
	bl Proc_Find
	cmp r0, #0
	bne _080A9320
	pop {r0}
	bx r0
	.align 2, 0
_080A9334: .4byte 0x08CE4AB0
