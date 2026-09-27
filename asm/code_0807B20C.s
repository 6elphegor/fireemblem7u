	.include "macro.inc"

	.syntax unified

	thumb_func_start EndDragonGatefx
EndDragonGatefx: @ 0x0807B20C
	push {lr}
	ldr r0, _0807B21C @ =0x08CA75D4
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_0807B21C: .4byte 0x08CA75D4
