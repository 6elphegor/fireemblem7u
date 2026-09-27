	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807A4BC
sub_0807A4BC: @ 0x0807A4BC
	push {lr}
	movs r0, #2
	bl NewKeyStSetter
	pop {r0}
	bx r0
