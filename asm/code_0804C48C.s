	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrGauge_0804CC68
EkrGauge_0804CC68: @ 0x0804C48C
	lsls r0, r0, #0x10
	ldr r1, _0804C498 @ =0x02000068
	ldr r1, [r1]
	lsrs r0, r0, #6
	str r0, [r1, #0x44]
	bx lr
	.align 2, 0
_0804C498: .4byte 0x02000068
