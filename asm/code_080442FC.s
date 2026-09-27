	.include "macro.inc"

	.syntax unified

	thumb_func_start EndLinkArenaPointsBox
EndLinkArenaPointsBox: @ 0x080442FC
	push {lr}
	ldr r0, _0804430C @ =0x08B99AD8
	bl Proc_EndEach
	bl ClearUi
	pop {r0}
	bx r0
	.align 2, 0
_0804430C: .4byte 0x08B99AD8
