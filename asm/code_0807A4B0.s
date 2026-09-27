	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807A4B0
sub_0807A4B0: @ 0x0807A4B0
	push {lr}
	movs r0, #0
	bl SetkeyStIgnoredMask
	pop {r0}
	bx r0
