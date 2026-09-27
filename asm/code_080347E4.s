	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080347E4
sub_080347E4: @ 0x080347E4
	cmp r0, #0
	beq _080347F2
	ldrb r0, [r0, #2]
	cmp r0, #1
	bne _080347F2
	movs r0, #1
	b _080347F4
_080347F2:
	movs r0, #0
_080347F4:
	bx lr
	.align 2, 0
