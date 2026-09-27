	.include "macro.inc"

	.syntax unified

	thumb_func_start GetItemDescMsg
GetItemDescMsg: @ 0x0801722C
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08017240 @ =0x08BE222C
	adds r1, r1, r0
	ldrh r0, [r1, #2]
	bx lr
	.align 2, 0
_08017240: .4byte 0x08BE222C
