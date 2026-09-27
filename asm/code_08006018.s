	.include "macro.inc"

	.syntax unified

	thumb_func_start EndGreenText
EndGreenText: @ 0x08006018
	push {lr}
	ldr r0, _08006024 @ =0x08B86150
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08006024: .4byte 0x08B86150
