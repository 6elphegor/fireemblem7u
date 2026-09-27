	.include "macro.inc"

	.syntax unified

	thumb_func_start SramOffsetToAddr
SramOffsetToAddr: @ 0x0809E6D8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _0809E6E8 @ =0x08CE3B58
	ldr r1, [r1]
	adds r1, r1, r0
	adds r0, r1, #0
	bx lr
	.align 2, 0
_0809E6E8: .4byte 0x08CE3B58
