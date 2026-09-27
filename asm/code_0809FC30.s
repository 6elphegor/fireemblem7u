	.include "macro.inc"

	.syntax unified

	thumb_func_start GetGameTotalTime_unused
GetGameTotalTime_unused: @ 0x0809FC30
	push {r4, r5, r6, r7, lr}
	movs r6, #0
	bl GetNextChapterStatsSlot
	adds r5, r0, #0
	movs r4, #0
	cmp r6, r5
	bge _0809FC54
	movs r7, #0xb4
_0809FC42:
	adds r0, r4, #0
	bl GetChapterStats
	ldrh r0, [r0, #2]
	muls r0, r7, r0
	adds r6, r6, r0
	adds r4, #1
	cmp r4, r5
	blt _0809FC42
_0809FC54:
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
