	.include "macro.inc"

	.syntax unified

	thumb_func_start EndMenuItemPanel
EndMenuItemPanel: @ 0x0801E2CC
	push {lr}
	ldr r0, _0801E2D8 @ =0x08B936EC
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0801E2D8: .4byte 0x08B936EC
