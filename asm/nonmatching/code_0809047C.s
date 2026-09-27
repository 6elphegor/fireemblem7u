	.include "macro.inc"

	.syntax unified

	thumb_func_start EndMenuScrollBar
EndMenuScrollBar: @ 0x0809047C
	push {lr}
	ldr r0, _0809048C @ =0x08CC4334
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_0809048C: .4byte 0x08CC4334
