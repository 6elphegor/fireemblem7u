	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08029D6C
sub_08029D6C: @ 0x08029D6C
	ldr r1, _08029D78 @ =0x0203A510
	movs r0, #0
	strb r0, [r1]
	strb r0, [r1, #1]
	strb r0, [r1, #2]
	bx lr
	.align 2, 0
_08029D78: .4byte 0x0203A510
