	.include "macro.inc"

	.syntax unified

	thumb_func_start EnableEkrGauge
EnableEkrGauge: @ 0x0804C4E4
	ldr r0, _0804C4F0 @ =0x02000068
	ldr r0, [r0]
	adds r0, #0x2a
	movs r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
_0804C4F0: .4byte 0x02000068
