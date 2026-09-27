	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803AA60
sub_0803AA60: @ 0x0803AA60
	ldr r0, _0803AA6C @ =0x0203A8EC
	adds r0, #0x79
	movs r1, #4
	strb r1, [r0]
	movs r0, #1
	bx lr
	.align 2, 0
_0803AA6C: .4byte 0x0203A8EC
