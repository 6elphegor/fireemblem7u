	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08049944
sub_08049944: @ 0x08049944
	ldrb r0, [r0, #0x18]
	cmp r0, #0xe9
	beq _0804994E
	movs r0, #0
	b _08049950
_0804994E:
	movs r0, #1
_08049950:
	bx lr
	.align 2, 0
