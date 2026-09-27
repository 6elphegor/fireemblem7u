	.include "macro.inc"

	.syntax unified

	thumb_func_start Event_SetExitMap
Event_SetExitMap: @ 0x0800F2F4
	adds r0, #0x4d
	movs r1, #1
	strb r1, [r0]
	bx lr
