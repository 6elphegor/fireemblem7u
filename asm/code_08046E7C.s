	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08046E7C
sub_08046E7C: @ 0x08046E7C
	push {lr}
	bl sub_08044DCC
	bl sub_08044E2C
	bl RefreshUnitSprites
	pop {r0}
	bx r0
	.align 2, 0
