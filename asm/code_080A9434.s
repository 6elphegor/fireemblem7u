	.include "macro.inc"

	.syntax unified

	thumb_func_start SysHandCursor_Init
SysHandCursor_Init: @ 0x080A9434
	adds r0, #0x35
	movs r1, #0
	strb r1, [r0]
	bx lr
