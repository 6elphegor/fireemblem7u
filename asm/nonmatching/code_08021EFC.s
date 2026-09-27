	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08021EFC
sub_08021EFC: @ 0x08021EFC
	ldr r1, _08021F14 @ =0x0203A85C
	movs r0, #0xf
	strb r0, [r1, #0x11]
	ldr r0, _08021F18 @ =0x03004690
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	orrs r0, r1
	str r0, [r2, #0xc]
	movs r0, #0x17
	bx lr
	.align 2, 0
_08021F14: .4byte 0x0203A85C
_08021F18: .4byte 0x03004690
