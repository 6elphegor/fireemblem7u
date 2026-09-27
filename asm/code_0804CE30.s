	.include "macro.inc"

	.syntax unified

	thumb_func_start AsyncEkrDispUP
AsyncEkrDispUP: @ 0x0804CE30
	ldr r0, _0804CE3C @ =0x0200006C
	ldr r0, [r0]
	adds r0, #0x2a
	movs r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
_0804CE3C: .4byte 0x0200006C
