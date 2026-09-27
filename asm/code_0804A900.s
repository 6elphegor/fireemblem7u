	.include "macro.inc"

	.syntax unified

	thumb_func_start MenuAlwaysNotShown
MenuAlwaysNotShown: @ 0x0804A900
	movs r0, #3
	bx lr
