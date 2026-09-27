	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrGauge_ClrInitFlag
EkrGauge_ClrInitFlag: @ 0x0804C4D4
	ldr r0, _0804C4E0 @ =0x02000068
	ldr r0, [r0]
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_0804C4E0: .4byte 0x02000068
