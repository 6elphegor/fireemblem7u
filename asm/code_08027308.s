	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08027308
sub_08027308: @ 0x08027308
	adds r0, #0x31
	movs r1, #0xf0
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #0x70
	beq _08027318
	movs r0, #1
	b _0802731A
_08027318:
	movs r0, #0
_0802731A:
	bx lr
