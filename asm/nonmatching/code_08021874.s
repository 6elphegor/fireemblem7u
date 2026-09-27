	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08021874
sub_08021874: @ 0x08021874
	ldr r2, _08021890 @ =0x0203A85C
	movs r0, #8
	strb r0, [r2, #0x11]
	ldr r0, _08021894 @ =0x03004690
	ldr r0, [r0]
	ldrb r0, [r0, #0x1b]
	strb r0, [r2, #0xd]
	ldrb r0, [r1]
	strb r0, [r2, #0x13]
	ldrb r0, [r1, #1]
	strb r0, [r2, #0x14]
	movs r0, #0x17
	bx lr
	.align 2, 0
_08021890: .4byte 0x0203A85C
_08021894: .4byte 0x03004690
