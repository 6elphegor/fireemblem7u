	.include "macro.inc"

	.syntax unified

	thumb_func_start DebugMenu_ClearEffect
DebugMenu_ClearEffect: @ 0x0801B8B8
	movs r0, #0x17
	bx lr
