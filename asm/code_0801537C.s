	.include "macro.inc"

	.syntax unified

	thumb_func_start CallChapterStartEventMaybe
CallChapterStartEventMaybe: @ 0x0801537C
	push {lr}
	ldr r0, _08015398 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventInfo
	ldr r0, [r0, #0x38]
	bl StartEvent
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_08015398: .4byte 0x0202BBF8
