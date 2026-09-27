	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080462DC
sub_080462DC: @ 0x080462DC
	ldrb r0, [r0]
	cmp r0, #1
	beq _080462EE
	cmp r0, #1
	blt _080462F2
	cmp r0, #7
	bgt _080462F2
	cmp r0, #6
	blt _080462F2
_080462EE:
	movs r0, #1
	b _080462F4
_080462F2:
	movs r0, #0
_080462F4:
	bx lr
	.align 2, 0
