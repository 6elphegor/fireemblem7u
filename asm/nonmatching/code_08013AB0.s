	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSpacialSeTest
StartSpacialSeTest: @ 0x08013AB0
	push {lr}
	ldr r0, _08013AC0 @ =0x08B928FC
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_08013AC0: .4byte 0x08B928FC
