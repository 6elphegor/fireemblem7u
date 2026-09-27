	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809E3F4
sub_0809E3F4: @ 0x0809E3F4
	ldr r0, _0809E3FC @ =0x0203E790
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_0809E3FC: .4byte 0x0203E790
