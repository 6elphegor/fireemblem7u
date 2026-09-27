	.include "macro.inc"

	.syntax unified

	thumb_func_start AiDummyAction
AiDummyAction: @ 0x08035790
	movs r0, #1
	bx lr
