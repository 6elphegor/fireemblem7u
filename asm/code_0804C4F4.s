	.include "macro.inc"

	.syntax unified

	thumb_func_start DisableEkrGauge
DisableEkrGauge: @ 0x0804C4F4
	ldr r0, _0804C500 @ =0x02000068
	ldr r0, [r0]
	adds r0, #0x2a
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_0804C500: .4byte 0x02000068
