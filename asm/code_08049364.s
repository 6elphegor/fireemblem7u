	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08049364
sub_08049364: @ 0x08049364
	ldr r1, _08049370 @ =0x0203DC9C
	movs r0, #0
	strb r0, [r1, #6]
	movs r0, #0x1b
	bx lr
	.align 2, 0
_08049370: .4byte 0x0203DC9C
