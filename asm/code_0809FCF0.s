	.include "macro.inc"

	.syntax unified

	thumb_func_start GetTotalTurnCountUpUntilNow
GetTotalTurnCountUpUntilNow: @ 0x0809FCF0
	push {r4, r5, r6, r7, lr}
	movs r7, #0
	bl GetNextChapterStatsSlot
	adds r6, r0, #0
	movs r5, #0
	cmp r7, r6
	bge _0809FD26
_0809FD00:
	adds r0, r5, #0
	bl GetChapterStats
	adds r4, r0, #0
	ldr r0, [r4]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	bl IsChapterPartOfCurrentMode
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809FD20
	ldr r0, [r4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x17
	adds r7, r7, r0
_0809FD20:
	adds r5, #1
	cmp r5, r6
	blt _0809FD00
_0809FD26:
	adds r0, r7, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
