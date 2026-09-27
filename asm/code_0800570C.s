	.include "macro.inc"

	.syntax unified

	thumb_func_start GetStringLineEnd
GetStringLineEnd: @ 0x0800570C
	b _08005710
_0800570E:
	adds r0, #1
_08005710:
	ldrb r1, [r0]
	cmp r1, #1
	bhi _0800570E
	bx lr
