	.include "macro.inc"

	.syntax unified

	thumb_func_start AiRefreshAction
AiRefreshAction: @ 0x0803548C
	movs r0, #1
	bx lr
