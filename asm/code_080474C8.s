	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080474C8
sub_080474C8: @ 0x080474C8
	push {lr}
	adds r1, r0, #0
	movs r0, #0x40
	bl sub_08047420
	pop {r0}
	bx r0
	.align 2, 0
