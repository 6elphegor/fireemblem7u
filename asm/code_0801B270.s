	.include "macro.inc"

	.syntax unified

	thumb_func_start SetNewKeyStatusWith16
SetNewKeyStatusWith16: @ 0x0801B270
	push {lr}
	movs r0, #0x10
	bl NewKeyStSetter
	pop {r0}
	bx r0
