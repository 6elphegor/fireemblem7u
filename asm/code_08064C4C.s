	.include "macro.inc"

	.syntax unified

	thumb_func_start SetEfxDragonDeadFallHead
SetEfxDragonDeadFallHead: @ 0x08064C4C
	push {lr}
	movs r1, #0x80
	lsls r1, r1, #5
	bl AddEkrDragonStatusAttr
	pop {r0}
	bx r0
	.align 2, 0
