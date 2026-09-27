	.include "macro.inc"

	.syntax unified

	thumb_func_start PutNumberSmall
PutNumberSmall: @ 0x08006234
	push {lr}
	movs r3, #0xa
	bl PutNumberExt
	pop {r0}
	bx r0
