	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrGauge_0804CC78
EkrGauge_0804CC78: @ 0x0804C49C
	ldr r2, _0804C4AC @ =0x02000068
	ldr r2, [r2]
	movs r3, #0
	strh r0, [r2, #0x32]
	strh r1, [r2, #0x3a]
	adds r2, #0x29
	strb r3, [r2]
	bx lr
	.align 2, 0
_0804C4AC: .4byte 0x02000068
