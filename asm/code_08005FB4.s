	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08005FB4
sub_08005FB4: @ 0x08005FB4
	ldrb r0, [r0, #7]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bx lr
