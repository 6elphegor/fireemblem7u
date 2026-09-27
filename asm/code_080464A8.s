	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080464A8
sub_080464A8: @ 0x080464A8
	ldrb r0, [r0]
	cmp r0, #5
	bgt _080464B6
	cmp r0, #4
	blt _080464B6
	movs r0, #1
	b _080464B8
_080464B6:
	movs r0, #0
_080464B8:
	bx lr
	.align 2, 0
