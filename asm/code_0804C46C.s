	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrGauge_0804CC48
EkrGauge_0804CC48: @ 0x0804C46C
	ldr r0, _0804C478 @ =0x02000068
	ldr r1, [r0]
	movs r0, #1
	str r0, [r1, #0x4c]
	bx lr
	.align 2, 0
_0804C478: .4byte 0x02000068
