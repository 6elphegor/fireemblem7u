	.include "macro.inc"

	.syntax unified

	thumb_func_start GetGameTotalTurnCount
GetGameTotalTurnCount: @ 0x0809FC5C
	push {r4, r5, r6, lr}
	movs r6, #0
	bl GetNextChapterStatsSlot
	adds r5, r0, #0
	movs r4, #0
	cmp r6, r5
	bge _0809FC80
_0809FC6C:
	adds r0, r4, #0
	bl GetChapterStats
	ldr r0, [r0]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x17
	adds r6, r6, r0
	adds r4, #1
	cmp r4, r5
	blt _0809FC6C
_0809FC80:
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
