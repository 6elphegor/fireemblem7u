	.include "macro.inc"

	.syntax unified

	thumb_func_start HideMoveRangeGraphics
HideMoveRangeGraphics: @ 0x0801D2D4
	push {lr}
	ldr r0, _0801D2E0 @ =0x08B935B4
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0801D2E0: .4byte 0x08B935B4
