	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08014B70
sub_08014B70: @ 0x08014B70
	cmp r1, #0
	ble _08014B80
	movs r2, #0
_08014B76:
	strb r2, [r0]
	adds r0, #1
	subs r1, #1
	cmp r1, #0
	bgt _08014B76
_08014B80:
	bx lr
	.align 2, 0
