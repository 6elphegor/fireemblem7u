	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08014B84
sub_08014B84: @ 0x08014B84
	cmp r1, #0
	ble _08014B92
_08014B88:
	strb r2, [r0]
	adds r0, #1
	subs r1, #1
	cmp r1, #0
	bgt _08014B88
_08014B92:
	bx lr
