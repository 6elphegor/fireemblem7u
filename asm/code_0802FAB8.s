	.include "macro.inc"

	.syntax unified

	thumb_func_start SetLastCoords
SetLastCoords: @ 0x0802FAB8
	ldr r3, _0802FAC8 @ =0x08B96444
	ldr r2, [r3]
	adds r2, #0x29
	strb r0, [r2]
	ldr r0, [r3]
	adds r0, #0x2a
	strb r1, [r0]
	bx lr
	.align 2, 0
_0802FAC8: .4byte 0x08B96444
