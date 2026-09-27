	.include "macro.inc"

	.syntax unified

	thumb_func_start EventFlashCursor_OnInit
EventFlashCursor_OnInit: @ 0x0800DDC0
	movs r1, #0x3c
	str r1, [r0, #0x58]
	bx lr
	.align 2, 0
