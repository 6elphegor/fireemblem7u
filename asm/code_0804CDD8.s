	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrDispUP_0804D5B4
EkrDispUP_0804D5B4: @ 0x0804CDD8
	ldr r0, _0804CDE4 @ =0x0200006C
	ldr r1, [r0]
	movs r0, #1
	str r0, [r1, #0x50]
	bx lr
	.align 2, 0
_0804CDE4: .4byte 0x0200006C
