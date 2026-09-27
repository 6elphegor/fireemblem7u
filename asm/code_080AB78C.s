	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AB78C
sub_080AB78C: @ 0x080AB78C
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	cmp r0, #0
	beq _080AB798
	adds r0, #1
	strh r0, [r1, #0x2c]
_080AB798:
	bx lr
	.align 2, 0
