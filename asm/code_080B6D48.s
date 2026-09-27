	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B6D48
sub_080B6D48: @ 0x080B6D48
	movs r2, #0
_080B6D4A:
	ldrb r1, [r0]
	cmp r1, #0
	beq _080B6D5E
	cmp r1, #1
	bne _080B6D5A
	adds r0, #1
	adds r2, #1
	b _080B6D4A
_080B6D5A:
	adds r0, #1
	b _080B6D4A
_080B6D5E:
	adds r0, r2, #3
	bx lr
	.align 2, 0
