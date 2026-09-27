	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08046288
sub_08046288: @ 0x08046288
	push {lr}
	bl EndAllMus
	bl EndAllMus
	bl sub_08044DCC
	bl sub_08044E2C
	bl RefreshUnitSprites
	pop {r0}
	bx r0
	.align 2, 0
