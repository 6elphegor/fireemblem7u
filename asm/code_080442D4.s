	.include "macro.inc"

	.syntax unified

	thumb_func_start StartLinkArenaPointsBox
StartLinkArenaPointsBox: @ 0x080442D4
	push {lr}
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _080442F8 @ =0x08B99AD8
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_080442F8: .4byte 0x08B99AD8
