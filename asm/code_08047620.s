	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08047620
sub_08047620: @ 0x08047620
	push {lr}
	adds r1, r0, #0
	movs r0, #0x40
	bl sub_08047594
	pop {r0}
	bx r0
	.align 2, 0
