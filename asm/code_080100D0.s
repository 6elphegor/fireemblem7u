	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080100D0
sub_080100D0: @ 0x080100D0
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _080100DE
	movs r0, #0
_080100DE:
	bx lr
