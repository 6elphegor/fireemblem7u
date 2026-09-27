	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrGauge_0804CC38
EkrGauge_0804CC38: @ 0x0804C45C
	ldr r0, _0804C468 @ =0x02000068
	ldr r1, [r0]
	movs r0, #1
	str r0, [r1, #0x4c]
	str r0, [r1, #0x50]
	bx lr
	.align 2, 0
_0804C468: .4byte 0x02000068
