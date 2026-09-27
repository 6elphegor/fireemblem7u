	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08025F9C
sub_08025F9C: @ 0x08025F9C
	ldr r1, _08025FA4 @ =0x0203A3D4
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_08025FA4: .4byte 0x0203A3D4
