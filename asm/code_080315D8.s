	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080315D8
sub_080315D8: @ 0x080315D8
	push {lr}
	bl GetChapterInfo
	adds r0, #0x74
	bl DecodeMsg
	pop {r1}
	bx r1
