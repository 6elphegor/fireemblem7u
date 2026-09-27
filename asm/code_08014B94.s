	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08014B94
sub_08014B94: @ 0x08014B94
	cmp r1, #0
	ble _08014BA2
_08014B98:
	strh r2, [r0]
	adds r0, #2
	subs r1, #1
	cmp r1, #0
	bgt _08014B98
_08014BA2:
	bx lr
