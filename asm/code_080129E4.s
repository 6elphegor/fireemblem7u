	.include "macro.inc"

	.syntax unified

	thumb_func_start GC_InitNextChapter
GC_InitNextChapter: @ 0x080129E4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _08012A04 @ =0x0202BBF8
	adds r0, r5, #0
	bl RegisterChapterStats
	bl ComputeChapterRankings
	adds r4, #0x2a
	ldrb r0, [r4]
	strb r0, [r5, #0xe]
	bl CleanupUnitsBeforeChapter
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08012A04: .4byte 0x0202BBF8
