	.include "macro.inc"

	.syntax unified

	thumb_func_start ClearEmitedStars
ClearEmitedStars: @ 0x0802114C
	push {lr}
	ldr r0, _08021160 @ =0x08B93CD4
	bl Proc_Find
	adds r0, #0x64
	movs r1, #0
	strh r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08021160: .4byte 0x08B93CD4
