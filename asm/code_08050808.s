	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08050808
sub_08050808: @ 0x08050808
	ldr r0, _08050810 @ =0x0201FABC
	ldr r0, [r0]
	bx lr
	.align 2, 0
_08050810: .4byte 0x0201FABC
