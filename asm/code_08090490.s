	.include "macro.inc"

	.syntax unified

	thumb_func_start StartMenuScrollBar
StartMenuScrollBar: @ 0x08090490
	push {lr}
	adds r1, r0, #0
	ldr r0, _080904A0 @ =0x08CC4334
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_080904A0: .4byte 0x08CC4334
