	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrGauge_SetInitFlag
EkrGauge_SetInitFlag: @ 0x0804C4C4
	ldr r0, _0804C4D0 @ =0x02000068
	ldr r0, [r0]
	adds r0, #0x29
	movs r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
_0804C4D0: .4byte 0x02000068
