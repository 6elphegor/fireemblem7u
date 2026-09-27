	.include "macro.inc"

	.syntax unified

	thumb_func_start GC_InitFastStartCheck
GC_InitFastStartCheck: @ 0x08012644
	movs r1, #0x14
	strh r1, [r0, #0x2e]
	bx lr
	.align 2, 0
