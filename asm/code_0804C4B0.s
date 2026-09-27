	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrGauge_0804CC8C
EkrGauge_0804CC8C: @ 0x0804C4B0
	ldr r2, _0804C4C0 @ =0x02000068
	ldr r2, [r2]
	strh r0, [r2, #0x32]
	strh r1, [r2, #0x3a]
	adds r2, #0x29
	movs r0, #1
	strb r0, [r2]
	bx lr
	.align 2, 0
_0804C4C0: .4byte 0x02000068
