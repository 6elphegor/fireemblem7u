	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08044B24
sub_08044B24: @ 0x08044B24
	push {lr}
	bl sub_08044DCC
	bl RefreshUnitSprites
	pop {r0}
	bx r0
	.align 2, 0
