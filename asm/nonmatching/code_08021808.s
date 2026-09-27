	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08021808
sub_08021808: @ 0x08021808
	ldr r2, _08021818 @ =0x0203A85C
	ldrb r0, [r1, #2]
	strb r0, [r2, #0xd]
	movs r0, #7
	strb r0, [r2, #0x11]
	movs r0, #0x17
	bx lr
	.align 2, 0
_08021818: .4byte 0x0203A85C
