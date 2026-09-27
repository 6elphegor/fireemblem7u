	.include "macro.inc"

	.syntax unified

	thumb_func_start ParallelFiniteLoop_Init
ParallelFiniteLoop_Init: @ 0x080A8DE4
	movs r1, #0
	str r1, [r0, #0x30]
	bx lr
	.align 2, 0
