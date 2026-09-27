	.include "macro.inc"

	.syntax unified

	thumb_func_start GetItemCostPerUse
GetItemCostPerUse: @ 0x08017454
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08017468 @ =0x08BE222C
	adds r1, r1, r0
	ldrh r0, [r1, #0x1a]
	bx lr
	.align 2, 0
_08017468: .4byte 0x08BE222C
