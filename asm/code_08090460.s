	.include "macro.inc"

	.syntax unified

	thumb_func_start TryHideMenuScrollBar
TryHideMenuScrollBar: @ 0x08090460
	push {lr}
	ldr r0, _08090478 @ =0x08CC4334
	bl Proc_Find
	cmp r0, #0
	beq _08090472
	movs r1, #0
	bl Proc_Goto
_08090472:
	pop {r0}
	bx r0
	.align 2, 0
_08090478: .4byte 0x08CC4334
