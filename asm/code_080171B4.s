	.include "macro.inc"

	.syntax unified

	thumb_func_start GetItemIndex
GetItemIndex: @ 0x080171B4
	adds r1, r0, #0
	movs r0, #0xff
	ands r0, r1
	bx lr
