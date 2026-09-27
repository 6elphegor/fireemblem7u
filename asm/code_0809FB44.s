	.include "macro.inc"

	.syntax unified

	thumb_func_start GetNextChapterStatsSlot
GetNextChapterStatsSlot: @ 0x0809FB44
	push {r4, lr}
	movs r0, #0
	bl GetChapterStats
	adds r1, r0, #0
	movs r2, #0
	ldr r3, _0809FB54 @ =0x0000FF80
	b _0809FB5C
	.align 2, 0
_0809FB54: .4byte 0x0000FF80
_0809FB58:
	adds r2, #1
	adds r1, #4
_0809FB5C:
	adds r0, r3, #0
	ldrh r4, [r1]
	ands r0, r4
	cmp r0, #0
	bne _0809FB58
	adds r0, r2, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
