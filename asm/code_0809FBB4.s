	.include "macro.inc"

	.syntax unified

	thumb_func_start GetNextChapterStatsEntry
GetNextChapterStatsEntry: @ 0x0809FBB4
	push {lr}
	bl GetNextChapterStatsSlot
	cmp r0, #0
	beq _0809FBCC
	subs r0, #1
	bl GetChapterStats
	ldr r0, [r0]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	b _0809FBD0
_0809FBCC:
	movs r0, #1
	rsbs r0, r0, #0
_0809FBD0:
	pop {r1}
	bx r1
