	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08022BAC
sub_08022BAC: @ 0x08022BAC
	ldr r2, _08022BBC @ =0x0203A85C
	movs r0, #0xc
	strb r0, [r2, #0x11]
	ldrb r0, [r1, #2]
	strb r0, [r2, #0xd]
	movs r0, #0x17
	bx lr
	.align 2, 0
_08022BBC: .4byte 0x0203A85C
