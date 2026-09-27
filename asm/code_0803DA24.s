	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803DA24
sub_0803DA24: @ 0x0803DA24
	ldr r1, _0803DA2C @ =0x0203D90C
	movs r0, #0xff
	strb r0, [r1, #4]
	bx lr
	.align 2, 0
_0803DA2C: .4byte 0x0203D90C
