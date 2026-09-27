	.include "macro.inc"

	.syntax unified

	thumb_func_start UnAsyncEkrDispUP
UnAsyncEkrDispUP: @ 0x0804CE40
	ldr r0, _0804CE4C @ =0x0200006C
	ldr r0, [r0]
	adds r0, #0x2a
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_0804CE4C: .4byte 0x0200006C
