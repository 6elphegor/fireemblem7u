	.include "macro.inc"

	.syntax unified

	thumb_func_start CallEndEvent
CallEndEvent: @ 0x08079A38
	push {lr}
	ldr r0, _08079A58 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventInfo
	ldr r0, [r0, #0x3c]
	bl sub_0800AF5C
	movs r0, #0x91
	bl SetFlag
	pop {r0}
	bx r0
	.align 2, 0
_08079A58: .4byte 0x0202BBF8
