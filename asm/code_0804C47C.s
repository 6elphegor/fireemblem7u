	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrGauge_0804CC58
EkrGauge_0804CC58: @ 0x0804C47C
	ldr r0, _0804C488 @ =0x02000068
	ldr r1, [r0]
	movs r0, #1
	str r0, [r1, #0x50]
	bx lr
	.align 2, 0
_0804C488: .4byte 0x02000068
