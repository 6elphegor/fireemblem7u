	.include "macro.inc"

	.syntax unified

	thumb_func_start ProcPopup2_Init
ProcPopup2_Init: @ 0x0801F0C8
	adds r0, #0x4c
	movs r1, #0xf0
	strh r1, [r0]
	bx lr
