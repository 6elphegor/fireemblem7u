	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08022C44
sub_08022C44: @ 0x08022C44
	ldr r2, _08022C54 @ =0x0203A85C
	movs r0, #0xd
	strb r0, [r2, #0x11]
	ldrb r0, [r1, #2]
	strb r0, [r2, #0xd]
	movs r0, #0x17
	bx lr
	.align 2, 0
_08022C54: .4byte 0x0203A85C
