	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08047980
sub_08047980: @ 0x08047980
	push {lr}
	ldr r0, [r0, #0x30]
	bl sub_0806DAB4
	pop {r0}
	bx r0
