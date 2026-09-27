	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B7C3C
sub_080B7C3C: @ 0x080B7C3C
	adds r1, r0, #0
	adds r0, #0x51
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080B7C50
	adds r1, #0x50
	movs r0, #1
	strb r0, [r1]
_080B7C50:
	bx lr
	.align 2, 0
