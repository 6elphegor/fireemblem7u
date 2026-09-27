	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08050814
sub_08050814: @ 0x08050814
	ldr r1, _0805081C @ =0x0201FABC
	str r0, [r1]
	bx lr
	.align 2, 0
_0805081C: .4byte 0x0201FABC
