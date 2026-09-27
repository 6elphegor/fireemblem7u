	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrDispUP_0804D5A4
EkrDispUP_0804D5A4: @ 0x0804CDC8
	ldr r0, _0804CDD4 @ =0x0200006C
	ldr r1, [r0]
	movs r0, #1
	str r0, [r1, #0x4c]
	bx lr
	.align 2, 0
_0804CDD4: .4byte 0x0200006C
