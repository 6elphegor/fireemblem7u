	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080463B4
sub_080463B4: @ 0x080463B4
	ldrb r0, [r0]
	cmp r0, #3
	bgt _080463C2
	cmp r0, #2
	blt _080463C2
	movs r0, #1
	b _080463C4
_080463C2:
	movs r0, #0
_080463C4:
	bx lr
	.align 2, 0
