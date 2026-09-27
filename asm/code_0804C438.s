	.include "macro.inc"

	.syntax unified

	thumb_func_start EndEkrGauge
EndEkrGauge: @ 0x0804C438
	push {lr}
	ldr r0, _0804C448 @ =0x02000068
	ldr r0, [r0]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_0804C448: .4byte 0x02000068
