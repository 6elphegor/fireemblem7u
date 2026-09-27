	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809FCB0
sub_0809FCB0: @ 0x0809FCB0
	push {r4, r5, r6, r7, lr}
	movs r7, #0
	bl GetNextChapterStatsSlot
	adds r6, r0, #0
	movs r5, #0
	cmp r7, r6
	bge _0809FCE6
_0809FCC0:
	adds r0, r5, #0
	bl GetChapterStats
	adds r4, r0, #0
	ldr r0, [r4]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	bl IsChapterPartOfCurrentMode
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809FCE0
	movs r0, #0xb4
	ldrh r4, [r4, #2]
	muls r0, r4, r0
	adds r7, r7, r0
_0809FCE0:
	adds r5, #1
	cmp r5, r6
	blt _0809FCC0
_0809FCE6:
	adds r0, r7, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
