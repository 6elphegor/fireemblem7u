	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08043618
sub_08043618: @ 0x08043618
	ldrb r0, [r0]
	cmp r0, #2
	bgt _08043626
	cmp r0, #0
	blt _08043626
	movs r0, #1
	b _08043628
_08043626:
	movs r0, #0
_08043628:
	bx lr
	.align 2, 0
