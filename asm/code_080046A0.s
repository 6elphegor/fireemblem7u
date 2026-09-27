	.include "macro.inc"

	.syntax unified

	thumb_func_start Proc_Break
Proc_Break: @ 0x080046A0
	movs r1, #0
	str r1, [r0, #0xc]
	bx lr
	.align 2, 0
