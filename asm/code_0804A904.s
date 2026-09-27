	.include "macro.inc"

	.syntax unified

	thumb_func_start MenuCancelSelect
MenuCancelSelect: @ 0x0804A904
	movs r0, #0x1b
	bx lr
