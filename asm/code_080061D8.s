	.include "macro.inc"

	.syntax unified

	thumb_func_start PutNumber
PutNumber: @ 0x080061D8
	push {lr}
	movs r3, #0
	bl PutNumberExt
	pop {r0}
	bx r0
