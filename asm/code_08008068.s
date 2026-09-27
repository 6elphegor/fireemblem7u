	.include "macro.inc"

	.syntax unified

	thumb_func_start EndTalk
EndTalk: @ 0x08008068
	push {lr}
	ldr r0, _08008074 @ =0x08B909D4
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08008074: .4byte 0x08B909D4
