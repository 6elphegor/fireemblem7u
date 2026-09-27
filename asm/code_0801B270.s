	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801B270
sub_0801B270: @ 0x0801B270
	push {lr}
	movs r0, #0x10
	bl NewKeyStSetter
	pop {r0}
	bx r0
