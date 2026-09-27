	.include "macro.inc"

	.syntax unified

	thumb_func_start CheckEkrTriangleInvalid
CheckEkrTriangleInvalid: @ 0x0806A4A4
	ldr r0, _0806A4B0 @ =0x02020134
	ldr r0, [r0]
	cmp r0, #1
	beq _0806A4B4
	movs r0, #0
	b _0806A4B6
	.align 2, 0
_0806A4B0: .4byte 0x02020134
_0806A4B4:
	movs r0, #1
_0806A4B6:
	bx lr
