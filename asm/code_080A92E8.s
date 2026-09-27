	.include "macro.inc"

	.syntax unified

	thumb_func_start ParallelWorker_OnLoop
ParallelWorker_OnLoop: @ 0x080A92E8
	push {lr}
	ldr r1, [r0, #0x14]
	ldr r2, [r0, #0x2c]
	adds r0, r1, #0
	bl _call_via_r2
	pop {r0}
	bx r0
