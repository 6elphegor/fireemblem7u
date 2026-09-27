	.include "macro.inc"

	.syntax unified

	thumb_func_start SramAddrToOffset
SramAddrToOffset: @ 0x0809E6EC
	ldr r1, _0809E6F8 @ =0x08CE3B58
	ldr r1, [r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bx lr
	.align 2, 0
_0809E6F8: .4byte 0x08CE3B58
