	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803A3D4
sub_0803A3D4: @ 0x0803A3D4
	ldr r1, _0803A3E8 @ =0x0203A8EC
	ldr r0, _0803A3EC @ =0x03004690
	ldr r0, [r0]
	adds r0, #0x46
	ldrb r0, [r0]
	adds r1, #0x86
	strb r0, [r1]
	movs r0, #0
	bx lr
	.align 2, 0
_0803A3E8: .4byte 0x0203A8EC
_0803A3EC: .4byte 0x03004690
