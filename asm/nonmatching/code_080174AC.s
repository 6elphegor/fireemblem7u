	.include "macro.inc"

	.syntax unified

	thumb_func_start GetItemData
GetItemData: @ 0x080174AC
	adds r1, r0, #0
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080174BC @ =0x08BE222C
	adds r0, r0, r1
	bx lr
	.align 2, 0
_080174BC: .4byte 0x08BE222C
