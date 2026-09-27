	.include "macro.inc"

	.syntax unified

	thumb_func_start SetEkrDragonExit
SetEkrDragonExit: @ 0x08064C40
	push {lr}
	movs r1, #4
	bl AddEkrDragonStatusAttr
	pop {r0}
	bx r0
