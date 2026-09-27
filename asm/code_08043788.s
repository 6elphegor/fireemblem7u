	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08043788
sub_08043788: @ 0x08043788
	ldrb r0, [r0]
	cmp r0, #0x66
	beq _08043792
	movs r0, #0
	b _08043794
_08043792:
	movs r0, #1
_08043794:
	bx lr
	.align 2, 0
