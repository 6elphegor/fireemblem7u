	.include "macro.inc"

	.syntax unified

	thumb_func_start GetChapterEventInfo
GetChapterEventInfo: @ 0x080315BC
	push {r4, lr}
	ldr r4, _080315D4 @ =0x08C9C9C8
	bl GetChapterInfo
	adds r0, #0x78
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080315D4: .4byte 0x08C9C9C8
