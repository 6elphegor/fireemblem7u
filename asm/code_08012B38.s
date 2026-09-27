	.include "macro.inc"

	.syntax unified

	thumb_func_start GetGameControl
GetGameControl: @ 0x08012B38
	push {lr}
	ldr r0, _08012B44 @ =0x08B924BC
	bl Proc_Find
	pop {r1}
	bx r1
	.align 2, 0
_08012B44: .4byte 0x08B924BC
