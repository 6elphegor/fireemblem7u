	.include "macro.inc"

	.syntax unified

	thumb_func_start UnitClearInventory
UnitClearInventory: @ 0x08017674
	movs r2, #0
	movs r1, #4
	adds r0, #0x26
_0801767A:
	strh r2, [r0]
	subs r0, #2
	subs r1, #1
	cmp r1, #0
	bge _0801767A
	bx lr
	.align 2, 0
