	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepItemUse_OnInit
PrepItemUse_OnInit: @ 0x08094FD8
	movs r1, #0
	str r1, [r0, #0x30]
	movs r1, #0xff
	str r1, [r0, #0x38]
	bx lr
	.align 2, 0
