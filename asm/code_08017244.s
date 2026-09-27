	.include "macro.inc"

	.syntax unified

	thumb_func_start GetItemUseDescId
GetItemUseDescId: @ 0x08017244
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08017258 @ =0x08BE222C
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	bx lr
	.align 2, 0
_08017258: .4byte 0x08BE222C
